; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66476 () Bool)

(assert start!66476)

(declare-fun b!766113 () Bool)

(declare-fun res!518292 () Bool)

(declare-fun e!426637 () Bool)

(assert (=> b!766113 (=> (not res!518292) (not e!426637))))

(declare-fun e!426638 () Bool)

(assert (=> b!766113 (= res!518292 e!426638)))

(declare-fun c!84307 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766113 (= c!84307 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42255 0))(
  ( (array!42256 (arr!20232 (Array (_ BitVec 32) (_ BitVec 64))) (size!20653 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42255)

(declare-fun b!766114 () Bool)

(declare-datatypes ((SeekEntryResult!7832 0))(
  ( (MissingZero!7832 (index!33696 (_ BitVec 32))) (Found!7832 (index!33697 (_ BitVec 32))) (Intermediate!7832 (undefined!8644 Bool) (index!33698 (_ BitVec 32)) (x!64606 (_ BitVec 32))) (Undefined!7832) (MissingVacant!7832 (index!33699 (_ BitVec 32))) )
))
(declare-fun lt!340777 () SeekEntryResult!7832)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!426632 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42255 (_ BitVec 32)) SeekEntryResult!7832)

(assert (=> b!766114 (= e!426632 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20232 a!3186) j!159) a!3186 mask!3328) lt!340777))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!766115 () Bool)

(declare-fun lt!340780 () SeekEntryResult!7832)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42255 (_ BitVec 32)) SeekEntryResult!7832)

(assert (=> b!766115 (= e!426638 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20232 a!3186) j!159) a!3186 mask!3328) lt!340780))))

(declare-fun b!766117 () Bool)

(declare-fun e!426633 () Bool)

(declare-fun e!426634 () Bool)

(assert (=> b!766117 (= e!426633 (not e!426634))))

(declare-fun res!518285 () Bool)

(assert (=> b!766117 (=> res!518285 e!426634)))

(declare-fun lt!340781 () SeekEntryResult!7832)

(assert (=> b!766117 (= res!518285 (or (not (is-Intermediate!7832 lt!340781)) (bvsge x!1131 (x!64606 lt!340781))))))

(declare-fun e!426631 () Bool)

(assert (=> b!766117 e!426631))

(declare-fun res!518281 () Bool)

(assert (=> b!766117 (=> (not res!518281) (not e!426631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42255 (_ BitVec 32)) Bool)

(assert (=> b!766117 (= res!518281 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26390 0))(
  ( (Unit!26391) )
))
(declare-fun lt!340783 () Unit!26390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26390)

(assert (=> b!766117 (= lt!340783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766118 () Bool)

(declare-fun res!518291 () Bool)

(declare-fun e!426635 () Bool)

(assert (=> b!766118 (=> (not res!518291) (not e!426635))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766118 (= res!518291 (and (= (size!20653 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20653 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20653 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766119 () Bool)

(assert (=> b!766119 (= e!426638 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20232 a!3186) j!159) a!3186 mask!3328) (Found!7832 j!159)))))

(declare-fun b!766120 () Bool)

(assert (=> b!766120 (= e!426634 true)))

(declare-fun lt!340778 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766120 (= lt!340778 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766121 () Bool)

(declare-fun res!518278 () Bool)

(declare-fun e!426636 () Bool)

(assert (=> b!766121 (=> (not res!518278) (not e!426636))))

(declare-datatypes ((List!14234 0))(
  ( (Nil!14231) (Cons!14230 (h!15320 (_ BitVec 64)) (t!20549 List!14234)) )
))
(declare-fun arrayNoDuplicates!0 (array!42255 (_ BitVec 32) List!14234) Bool)

(assert (=> b!766121 (= res!518278 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14231))))

(declare-fun b!766122 () Bool)

(assert (=> b!766122 (= e!426637 e!426633)))

(declare-fun res!518290 () Bool)

(assert (=> b!766122 (=> (not res!518290) (not e!426633))))

(declare-fun lt!340784 () SeekEntryResult!7832)

(assert (=> b!766122 (= res!518290 (= lt!340784 lt!340781))))

(declare-fun lt!340776 () (_ BitVec 64))

(declare-fun lt!340782 () array!42255)

(assert (=> b!766122 (= lt!340781 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340776 lt!340782 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766122 (= lt!340784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340776 mask!3328) lt!340776 lt!340782 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!766122 (= lt!340776 (select (store (arr!20232 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766122 (= lt!340782 (array!42256 (store (arr!20232 a!3186) i!1173 k!2102) (size!20653 a!3186)))))

(declare-fun b!766123 () Bool)

(assert (=> b!766123 (= e!426636 e!426637)))

(declare-fun res!518282 () Bool)

(assert (=> b!766123 (=> (not res!518282) (not e!426637))))

(assert (=> b!766123 (= res!518282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20232 a!3186) j!159) mask!3328) (select (arr!20232 a!3186) j!159) a!3186 mask!3328) lt!340780))))

(assert (=> b!766123 (= lt!340780 (Intermediate!7832 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766124 () Bool)

(declare-fun res!518283 () Bool)

(assert (=> b!766124 (=> (not res!518283) (not e!426635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766124 (= res!518283 (validKeyInArray!0 k!2102))))

(declare-fun b!766125 () Bool)

(declare-fun res!518280 () Bool)

(assert (=> b!766125 (=> (not res!518280) (not e!426636))))

(assert (=> b!766125 (= res!518280 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20653 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20653 a!3186))))))

(declare-fun b!766126 () Bool)

(declare-fun res!518293 () Bool)

(assert (=> b!766126 (=> (not res!518293) (not e!426635))))

(assert (=> b!766126 (= res!518293 (validKeyInArray!0 (select (arr!20232 a!3186) j!159)))))

(declare-fun b!766127 () Bool)

(assert (=> b!766127 (= e!426635 e!426636)))

(declare-fun res!518286 () Bool)

(assert (=> b!766127 (=> (not res!518286) (not e!426636))))

(declare-fun lt!340779 () SeekEntryResult!7832)

(assert (=> b!766127 (= res!518286 (or (= lt!340779 (MissingZero!7832 i!1173)) (= lt!340779 (MissingVacant!7832 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42255 (_ BitVec 32)) SeekEntryResult!7832)

(assert (=> b!766127 (= lt!340779 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766128 () Bool)

(declare-fun res!518279 () Bool)

(assert (=> b!766128 (=> (not res!518279) (not e!426636))))

(assert (=> b!766128 (= res!518279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766129 () Bool)

(declare-fun res!518289 () Bool)

(assert (=> b!766129 (=> (not res!518289) (not e!426637))))

(assert (=> b!766129 (= res!518289 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20232 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766130 () Bool)

(declare-fun res!518287 () Bool)

(assert (=> b!766130 (=> (not res!518287) (not e!426635))))

(declare-fun arrayContainsKey!0 (array!42255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766130 (= res!518287 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766116 () Bool)

(assert (=> b!766116 (= e!426631 e!426632)))

(declare-fun res!518284 () Bool)

(assert (=> b!766116 (=> (not res!518284) (not e!426632))))

(assert (=> b!766116 (= res!518284 (= (seekEntryOrOpen!0 (select (arr!20232 a!3186) j!159) a!3186 mask!3328) lt!340777))))

(assert (=> b!766116 (= lt!340777 (Found!7832 j!159))))

(declare-fun res!518288 () Bool)

(assert (=> start!66476 (=> (not res!518288) (not e!426635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66476 (= res!518288 (validMask!0 mask!3328))))

(assert (=> start!66476 e!426635))

(assert (=> start!66476 true))

(declare-fun array_inv!16028 (array!42255) Bool)

(assert (=> start!66476 (array_inv!16028 a!3186)))

(assert (= (and start!66476 res!518288) b!766118))

(assert (= (and b!766118 res!518291) b!766126))

(assert (= (and b!766126 res!518293) b!766124))

(assert (= (and b!766124 res!518283) b!766130))

(assert (= (and b!766130 res!518287) b!766127))

(assert (= (and b!766127 res!518286) b!766128))

(assert (= (and b!766128 res!518279) b!766121))

(assert (= (and b!766121 res!518278) b!766125))

(assert (= (and b!766125 res!518280) b!766123))

(assert (= (and b!766123 res!518282) b!766129))

(assert (= (and b!766129 res!518289) b!766113))

(assert (= (and b!766113 c!84307) b!766115))

(assert (= (and b!766113 (not c!84307)) b!766119))

(assert (= (and b!766113 res!518292) b!766122))

(assert (= (and b!766122 res!518290) b!766117))

(assert (= (and b!766117 res!518281) b!766116))

(assert (= (and b!766116 res!518284) b!766114))

(assert (= (and b!766117 (not res!518285)) b!766120))

(declare-fun m!712137 () Bool)

(assert (=> b!766128 m!712137))

(declare-fun m!712139 () Bool)

(assert (=> b!766115 m!712139))

(assert (=> b!766115 m!712139))

(declare-fun m!712141 () Bool)

(assert (=> b!766115 m!712141))

(assert (=> b!766126 m!712139))

(assert (=> b!766126 m!712139))

(declare-fun m!712143 () Bool)

(assert (=> b!766126 m!712143))

(declare-fun m!712145 () Bool)

(assert (=> start!66476 m!712145))

(declare-fun m!712147 () Bool)

(assert (=> start!66476 m!712147))

(assert (=> b!766123 m!712139))

(assert (=> b!766123 m!712139))

(declare-fun m!712149 () Bool)

(assert (=> b!766123 m!712149))

(assert (=> b!766123 m!712149))

(assert (=> b!766123 m!712139))

(declare-fun m!712151 () Bool)

(assert (=> b!766123 m!712151))

(declare-fun m!712153 () Bool)

(assert (=> b!766130 m!712153))

(declare-fun m!712155 () Bool)

(assert (=> b!766124 m!712155))

(assert (=> b!766119 m!712139))

(assert (=> b!766119 m!712139))

(declare-fun m!712157 () Bool)

(assert (=> b!766119 m!712157))

(assert (=> b!766114 m!712139))

(assert (=> b!766114 m!712139))

(declare-fun m!712159 () Bool)

(assert (=> b!766114 m!712159))

(declare-fun m!712161 () Bool)

(assert (=> b!766127 m!712161))

(assert (=> b!766116 m!712139))

(assert (=> b!766116 m!712139))

(declare-fun m!712163 () Bool)

(assert (=> b!766116 m!712163))

(declare-fun m!712165 () Bool)

(assert (=> b!766122 m!712165))

(assert (=> b!766122 m!712165))

(declare-fun m!712167 () Bool)

(assert (=> b!766122 m!712167))

(declare-fun m!712169 () Bool)

(assert (=> b!766122 m!712169))

(declare-fun m!712171 () Bool)

(assert (=> b!766122 m!712171))

(declare-fun m!712173 () Bool)

(assert (=> b!766122 m!712173))

(declare-fun m!712175 () Bool)

(assert (=> b!766129 m!712175))

(declare-fun m!712177 () Bool)

(assert (=> b!766121 m!712177))

(declare-fun m!712179 () Bool)

(assert (=> b!766117 m!712179))

(declare-fun m!712181 () Bool)

(assert (=> b!766117 m!712181))

(declare-fun m!712183 () Bool)

(assert (=> b!766120 m!712183))

(push 1)

