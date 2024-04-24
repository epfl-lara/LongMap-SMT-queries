; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67894 () Bool)

(assert start!67894)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42814 0))(
  ( (array!42815 (arr!20491 (Array (_ BitVec 32) (_ BitVec 64))) (size!20911 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42814)

(declare-fun e!438144 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!788129 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8047 0))(
  ( (MissingZero!8047 (index!34556 (_ BitVec 32))) (Found!8047 (index!34557 (_ BitVec 32))) (Intermediate!8047 (undefined!8859 Bool) (index!34558 (_ BitVec 32)) (x!65654 (_ BitVec 32))) (Undefined!8047) (MissingVacant!8047 (index!34559 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!788129 (= e!438144 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) (Found!8047 j!159)))))

(declare-fun b!788130 () Bool)

(declare-fun e!438142 () Bool)

(declare-fun e!438145 () Bool)

(assert (=> b!788130 (= e!438142 e!438145)))

(declare-fun res!533623 () Bool)

(assert (=> b!788130 (=> (not res!533623) (not e!438145))))

(declare-fun lt!351556 () SeekEntryResult!8047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8047)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788130 (= res!533623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20491 a!3186) j!159) mask!3328) (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351556))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788130 (= lt!351556 (Intermediate!8047 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788131 () Bool)

(declare-fun res!533622 () Bool)

(assert (=> b!788131 (=> (not res!533622) (not e!438142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42814 (_ BitVec 32)) Bool)

(assert (=> b!788131 (= res!533622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788132 () Bool)

(declare-fun res!533631 () Bool)

(declare-fun e!438137 () Bool)

(assert (=> b!788132 (=> (not res!533631) (not e!438137))))

(declare-fun lt!351545 () (_ BitVec 64))

(declare-fun lt!351549 () array!42814)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42814 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!788132 (= res!533631 (= (seekEntryOrOpen!0 lt!351545 lt!351549 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351545 lt!351549 mask!3328)))))

(declare-fun b!788134 () Bool)

(declare-fun res!533628 () Bool)

(assert (=> b!788134 (=> (not res!533628) (not e!438145))))

(assert (=> b!788134 (= res!533628 e!438144)))

(declare-fun c!87665 () Bool)

(assert (=> b!788134 (= c!87665 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788135 () Bool)

(declare-fun res!533632 () Bool)

(declare-fun e!438140 () Bool)

(assert (=> b!788135 (=> (not res!533632) (not e!438140))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788135 (= res!533632 (validKeyInArray!0 k0!2102))))

(declare-fun b!788136 () Bool)

(assert (=> b!788136 (= e!438144 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351556))))

(declare-fun b!788137 () Bool)

(declare-fun lt!351546 () SeekEntryResult!8047)

(declare-fun e!438143 () Bool)

(assert (=> b!788137 (= e!438143 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351546))))

(declare-fun b!788138 () Bool)

(declare-fun e!438138 () Bool)

(declare-fun e!438148 () Bool)

(assert (=> b!788138 (= e!438138 (not e!438148))))

(declare-fun res!533636 () Bool)

(assert (=> b!788138 (=> res!533636 e!438148)))

(declare-fun lt!351551 () SeekEntryResult!8047)

(get-info :version)

(assert (=> b!788138 (= res!533636 (or (not ((_ is Intermediate!8047) lt!351551)) (bvslt x!1131 (x!65654 lt!351551)) (not (= x!1131 (x!65654 lt!351551))) (not (= index!1321 (index!34558 lt!351551)))))))

(assert (=> b!788138 e!438143))

(declare-fun res!533638 () Bool)

(assert (=> b!788138 (=> (not res!533638) (not e!438143))))

(declare-fun lt!351555 () SeekEntryResult!8047)

(assert (=> b!788138 (= res!533638 (= lt!351555 lt!351546))))

(assert (=> b!788138 (= lt!351546 (Found!8047 j!159))))

(assert (=> b!788138 (= lt!351555 (seekEntryOrOpen!0 (select (arr!20491 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788138 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27253 0))(
  ( (Unit!27254) )
))
(declare-fun lt!351553 () Unit!27253)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27253)

(assert (=> b!788138 (= lt!351553 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788139 () Bool)

(declare-fun e!438147 () Bool)

(assert (=> b!788139 (= e!438147 true)))

(assert (=> b!788139 e!438137))

(declare-fun res!533627 () Bool)

(assert (=> b!788139 (=> (not res!533627) (not e!438137))))

(declare-fun lt!351552 () (_ BitVec 64))

(assert (=> b!788139 (= res!533627 (= lt!351552 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351550 () Unit!27253)

(declare-fun e!438146 () Unit!27253)

(assert (=> b!788139 (= lt!351550 e!438146)))

(declare-fun c!87664 () Bool)

(assert (=> b!788139 (= c!87664 (= lt!351552 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788140 () Bool)

(declare-fun e!438139 () Bool)

(assert (=> b!788140 (= e!438139 e!438147)))

(declare-fun res!533624 () Bool)

(assert (=> b!788140 (=> res!533624 e!438147)))

(assert (=> b!788140 (= res!533624 (= lt!351552 lt!351545))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788140 (= lt!351552 (select (store (arr!20491 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788141 () Bool)

(declare-fun lt!351547 () SeekEntryResult!8047)

(assert (=> b!788141 (= e!438137 (= lt!351555 lt!351547))))

(declare-fun b!788142 () Bool)

(declare-fun res!533634 () Bool)

(assert (=> b!788142 (=> (not res!533634) (not e!438140))))

(assert (=> b!788142 (= res!533634 (validKeyInArray!0 (select (arr!20491 a!3186) j!159)))))

(declare-fun b!788143 () Bool)

(declare-fun res!533633 () Bool)

(assert (=> b!788143 (=> (not res!533633) (not e!438142))))

(declare-datatypes ((List!14400 0))(
  ( (Nil!14397) (Cons!14396 (h!15525 (_ BitVec 64)) (t!20707 List!14400)) )
))
(declare-fun arrayNoDuplicates!0 (array!42814 (_ BitVec 32) List!14400) Bool)

(assert (=> b!788143 (= res!533633 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14397))))

(declare-fun b!788144 () Bool)

(assert (=> b!788144 (= e!438145 e!438138)))

(declare-fun res!533626 () Bool)

(assert (=> b!788144 (=> (not res!533626) (not e!438138))))

(declare-fun lt!351554 () SeekEntryResult!8047)

(assert (=> b!788144 (= res!533626 (= lt!351554 lt!351551))))

(assert (=> b!788144 (= lt!351551 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351545 lt!351549 mask!3328))))

(assert (=> b!788144 (= lt!351554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351545 mask!3328) lt!351545 lt!351549 mask!3328))))

(assert (=> b!788144 (= lt!351545 (select (store (arr!20491 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788144 (= lt!351549 (array!42815 (store (arr!20491 a!3186) i!1173 k0!2102) (size!20911 a!3186)))))

(declare-fun b!788145 () Bool)

(declare-fun res!533635 () Bool)

(assert (=> b!788145 (=> (not res!533635) (not e!438140))))

(assert (=> b!788145 (= res!533635 (and (= (size!20911 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20911 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20911 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788146 () Bool)

(declare-fun res!533637 () Bool)

(assert (=> b!788146 (=> (not res!533637) (not e!438145))))

(assert (=> b!788146 (= res!533637 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20491 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788147 () Bool)

(declare-fun res!533639 () Bool)

(assert (=> b!788147 (=> (not res!533639) (not e!438142))))

(assert (=> b!788147 (= res!533639 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20911 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20911 a!3186))))))

(declare-fun b!788133 () Bool)

(declare-fun Unit!27255 () Unit!27253)

(assert (=> b!788133 (= e!438146 Unit!27255)))

(assert (=> b!788133 false))

(declare-fun res!533640 () Bool)

(assert (=> start!67894 (=> (not res!533640) (not e!438140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67894 (= res!533640 (validMask!0 mask!3328))))

(assert (=> start!67894 e!438140))

(assert (=> start!67894 true))

(declare-fun array_inv!16350 (array!42814) Bool)

(assert (=> start!67894 (array_inv!16350 a!3186)))

(declare-fun b!788148 () Bool)

(declare-fun Unit!27256 () Unit!27253)

(assert (=> b!788148 (= e!438146 Unit!27256)))

(declare-fun b!788149 () Bool)

(assert (=> b!788149 (= e!438140 e!438142)))

(declare-fun res!533629 () Bool)

(assert (=> b!788149 (=> (not res!533629) (not e!438142))))

(declare-fun lt!351548 () SeekEntryResult!8047)

(assert (=> b!788149 (= res!533629 (or (= lt!351548 (MissingZero!8047 i!1173)) (= lt!351548 (MissingVacant!8047 i!1173))))))

(assert (=> b!788149 (= lt!351548 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788150 () Bool)

(assert (=> b!788150 (= e!438148 e!438139)))

(declare-fun res!533630 () Bool)

(assert (=> b!788150 (=> res!533630 e!438139)))

(assert (=> b!788150 (= res!533630 (not (= lt!351547 lt!351546)))))

(assert (=> b!788150 (= lt!351547 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788151 () Bool)

(declare-fun res!533625 () Bool)

(assert (=> b!788151 (=> (not res!533625) (not e!438140))))

(declare-fun arrayContainsKey!0 (array!42814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788151 (= res!533625 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67894 res!533640) b!788145))

(assert (= (and b!788145 res!533635) b!788142))

(assert (= (and b!788142 res!533634) b!788135))

(assert (= (and b!788135 res!533632) b!788151))

(assert (= (and b!788151 res!533625) b!788149))

(assert (= (and b!788149 res!533629) b!788131))

(assert (= (and b!788131 res!533622) b!788143))

(assert (= (and b!788143 res!533633) b!788147))

(assert (= (and b!788147 res!533639) b!788130))

(assert (= (and b!788130 res!533623) b!788146))

(assert (= (and b!788146 res!533637) b!788134))

(assert (= (and b!788134 c!87665) b!788136))

(assert (= (and b!788134 (not c!87665)) b!788129))

(assert (= (and b!788134 res!533628) b!788144))

(assert (= (and b!788144 res!533626) b!788138))

(assert (= (and b!788138 res!533638) b!788137))

(assert (= (and b!788138 (not res!533636)) b!788150))

(assert (= (and b!788150 (not res!533630)) b!788140))

(assert (= (and b!788140 (not res!533624)) b!788139))

(assert (= (and b!788139 c!87664) b!788133))

(assert (= (and b!788139 (not c!87664)) b!788148))

(assert (= (and b!788139 res!533627) b!788132))

(assert (= (and b!788132 res!533631) b!788141))

(declare-fun m!730115 () Bool)

(assert (=> b!788136 m!730115))

(assert (=> b!788136 m!730115))

(declare-fun m!730117 () Bool)

(assert (=> b!788136 m!730117))

(declare-fun m!730119 () Bool)

(assert (=> b!788140 m!730119))

(declare-fun m!730121 () Bool)

(assert (=> b!788140 m!730121))

(declare-fun m!730123 () Bool)

(assert (=> b!788132 m!730123))

(declare-fun m!730125 () Bool)

(assert (=> b!788132 m!730125))

(declare-fun m!730127 () Bool)

(assert (=> b!788131 m!730127))

(assert (=> b!788129 m!730115))

(assert (=> b!788129 m!730115))

(declare-fun m!730129 () Bool)

(assert (=> b!788129 m!730129))

(declare-fun m!730131 () Bool)

(assert (=> b!788144 m!730131))

(declare-fun m!730133 () Bool)

(assert (=> b!788144 m!730133))

(declare-fun m!730135 () Bool)

(assert (=> b!788144 m!730135))

(declare-fun m!730137 () Bool)

(assert (=> b!788144 m!730137))

(assert (=> b!788144 m!730119))

(assert (=> b!788144 m!730133))

(assert (=> b!788137 m!730115))

(assert (=> b!788137 m!730115))

(declare-fun m!730139 () Bool)

(assert (=> b!788137 m!730139))

(assert (=> b!788142 m!730115))

(assert (=> b!788142 m!730115))

(declare-fun m!730141 () Bool)

(assert (=> b!788142 m!730141))

(declare-fun m!730143 () Bool)

(assert (=> b!788143 m!730143))

(declare-fun m!730145 () Bool)

(assert (=> b!788146 m!730145))

(assert (=> b!788150 m!730115))

(assert (=> b!788150 m!730115))

(assert (=> b!788150 m!730129))

(declare-fun m!730147 () Bool)

(assert (=> b!788149 m!730147))

(declare-fun m!730149 () Bool)

(assert (=> b!788151 m!730149))

(assert (=> b!788138 m!730115))

(assert (=> b!788138 m!730115))

(declare-fun m!730151 () Bool)

(assert (=> b!788138 m!730151))

(declare-fun m!730153 () Bool)

(assert (=> b!788138 m!730153))

(declare-fun m!730155 () Bool)

(assert (=> b!788138 m!730155))

(assert (=> b!788130 m!730115))

(assert (=> b!788130 m!730115))

(declare-fun m!730157 () Bool)

(assert (=> b!788130 m!730157))

(assert (=> b!788130 m!730157))

(assert (=> b!788130 m!730115))

(declare-fun m!730159 () Bool)

(assert (=> b!788130 m!730159))

(declare-fun m!730161 () Bool)

(assert (=> start!67894 m!730161))

(declare-fun m!730163 () Bool)

(assert (=> start!67894 m!730163))

(declare-fun m!730165 () Bool)

(assert (=> b!788135 m!730165))

(check-sat (not start!67894) (not b!788150) (not b!788131) (not b!788138) (not b!788149) (not b!788129) (not b!788144) (not b!788137) (not b!788136) (not b!788132) (not b!788151) (not b!788130) (not b!788142) (not b!788143) (not b!788135))
(check-sat)
