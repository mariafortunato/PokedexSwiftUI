
import SwiftUI

struct TextTitle: View {
    
    var text: String
    var alignment: Alignment
    var foreground: Color
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
            .font(.system(size: size))
            .fontWeight(.bold)
            .foregroundColor(foreground)
    }
}


struct SubtitleDetail : View {
    
    var text: String?
    var foreground: Color?
    var size: CGFloat?
    
    var body: some View {
        Text(text ?? "")
        
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .font(.system(size: size ?? 18))
            .fontWeight(.bold)
            .foregroundColor(foreground)
    }
}

struct InformationsDetail: View {
    
    var text: String?
    var textResult: String?
    var foreground: Color?
    var alignment: Alignment?
    var size: CGFloat?
    
    var body: some View {
        HStack {
            Text(text ?? "")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: alignment ?? .leading)
                .font(.system(size: size ?? 18))
                .foregroundColor(foreground)
                .fontWeight(.medium)
                .padding(.bottom, 4)
            Text(textResult ?? "")
                .frame(minWidth: 0, maxWidth: .infinity, alignment:alignment ?? .trailing)
                .font(.system(size: size ?? 18))
                .foregroundColor(foreground)
                .fontWeight(.medium)
        }
    }
}

struct InformationsStatsDetail: View {
    
    var text: String?
    var foreground: Color?
    var value: Int?
    var valuePokemon: String?
    
    var body: some View {
        HStack {
            Text(text ?? "")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .fontWeight(.medium)
            ProgressView(value: Float(value ?? 0), total: 250)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Text(valuePokemon ?? "")
                .frame(alignment: .trailing)
                .font(.system(size: 16))
                .fontWeight(.semibold)
        }
        .foregroundColor(foreground)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}
