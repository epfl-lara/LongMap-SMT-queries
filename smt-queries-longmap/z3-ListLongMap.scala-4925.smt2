; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67796 () Bool)

(assert start!67796)

(declare-fun b!788174 () Bool)

(declare-fun e!438092 () Bool)

(declare-datatypes ((array!42836 0))(
  ( (array!42837 (arr!20506 (Array (_ BitVec 32) (_ BitVec 64))) (size!20927 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42836)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!788174 (= e!438092 (= (select (arr!20506 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438083 () Bool)

(assert (=> b!788174 e!438083))

(declare-fun res!533927 () Bool)

(assert (=> b!788174 (=> (not res!533927) (not e!438083))))

(declare-fun lt!351637 () (_ BitVec 64))

(assert (=> b!788174 (= res!533927 (= lt!351637 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27312 0))(
  ( (Unit!27313) )
))
(declare-fun lt!351634 () Unit!27312)

(declare-fun e!438085 () Unit!27312)

(assert (=> b!788174 (= lt!351634 e!438085)))

(declare-fun c!87534 () Bool)

(assert (=> b!788174 (= c!87534 (= lt!351637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788175 () Bool)

(declare-fun res!533925 () Bool)

(declare-fun e!438082 () Bool)

(assert (=> b!788175 (=> (not res!533925) (not e!438082))))

(declare-datatypes ((List!14508 0))(
  ( (Nil!14505) (Cons!14504 (h!15627 (_ BitVec 64)) (t!20823 List!14508)) )
))
(declare-fun arrayNoDuplicates!0 (array!42836 (_ BitVec 32) List!14508) Bool)

(assert (=> b!788175 (= res!533925 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14505))))

(declare-fun b!788176 () Bool)

(declare-fun res!533926 () Bool)

(declare-fun e!438091 () Bool)

(assert (=> b!788176 (=> (not res!533926) (not e!438091))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!788176 (= res!533926 (and (= (size!20927 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20927 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20927 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!788177 () Bool)

(declare-fun res!533929 () Bool)

(assert (=> b!788177 (=> (not res!533929) (not e!438082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42836 (_ BitVec 32)) Bool)

(assert (=> b!788177 (= res!533929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788178 () Bool)

(declare-fun res!533939 () Bool)

(declare-fun e!438087 () Bool)

(assert (=> b!788178 (=> (not res!533939) (not e!438087))))

(declare-fun e!438086 () Bool)

(assert (=> b!788178 (= res!533939 e!438086)))

(declare-fun c!87535 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788178 (= c!87535 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788179 () Bool)

(declare-fun res!533937 () Bool)

(assert (=> b!788179 (=> (not res!533937) (not e!438091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788179 (= res!533937 (validKeyInArray!0 (select (arr!20506 a!3186) j!159)))))

(declare-fun b!788180 () Bool)

(declare-fun res!533933 () Bool)

(assert (=> b!788180 (=> (not res!533933) (not e!438082))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!788180 (= res!533933 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20927 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20927 a!3186))))))

(declare-fun b!788181 () Bool)

(assert (=> b!788181 (= e!438091 e!438082)))

(declare-fun res!533931 () Bool)

(assert (=> b!788181 (=> (not res!533931) (not e!438082))))

(declare-datatypes ((SeekEntryResult!8106 0))(
  ( (MissingZero!8106 (index!34792 (_ BitVec 32))) (Found!8106 (index!34793 (_ BitVec 32))) (Intermediate!8106 (undefined!8918 Bool) (index!34794 (_ BitVec 32)) (x!65726 (_ BitVec 32))) (Undefined!8106) (MissingVacant!8106 (index!34795 (_ BitVec 32))) )
))
(declare-fun lt!351642 () SeekEntryResult!8106)

(assert (=> b!788181 (= res!533931 (or (= lt!351642 (MissingZero!8106 i!1173)) (= lt!351642 (MissingVacant!8106 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42836 (_ BitVec 32)) SeekEntryResult!8106)

(assert (=> b!788181 (= lt!351642 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!788182 () Bool)

(declare-fun Unit!27314 () Unit!27312)

(assert (=> b!788182 (= e!438085 Unit!27314)))

(declare-fun b!788183 () Bool)

(declare-fun e!438081 () Bool)

(assert (=> b!788183 (= e!438087 e!438081)))

(declare-fun res!533930 () Bool)

(assert (=> b!788183 (=> (not res!533930) (not e!438081))))

(declare-fun lt!351639 () SeekEntryResult!8106)

(declare-fun lt!351641 () SeekEntryResult!8106)

(assert (=> b!788183 (= res!533930 (= lt!351639 lt!351641))))

(declare-fun lt!351633 () (_ BitVec 64))

(declare-fun lt!351643 () array!42836)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42836 (_ BitVec 32)) SeekEntryResult!8106)

(assert (=> b!788183 (= lt!351641 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351633 lt!351643 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788183 (= lt!351639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351633 mask!3328) lt!351633 lt!351643 mask!3328))))

(assert (=> b!788183 (= lt!351633 (select (store (arr!20506 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!788183 (= lt!351643 (array!42837 (store (arr!20506 a!3186) i!1173 k0!2102) (size!20927 a!3186)))))

(declare-fun b!788184 () Bool)

(declare-fun res!533935 () Bool)

(assert (=> b!788184 (=> (not res!533935) (not e!438091))))

(assert (=> b!788184 (= res!533935 (validKeyInArray!0 k0!2102))))

(declare-fun b!788185 () Bool)

(declare-fun lt!351638 () SeekEntryResult!8106)

(assert (=> b!788185 (= e!438086 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!351638))))

(declare-fun b!788186 () Bool)

(assert (=> b!788186 (= e!438082 e!438087)))

(declare-fun res!533922 () Bool)

(assert (=> b!788186 (=> (not res!533922) (not e!438087))))

(assert (=> b!788186 (= res!533922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20506 a!3186) j!159) mask!3328) (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!351638))))

(assert (=> b!788186 (= lt!351638 (Intermediate!8106 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788187 () Bool)

(declare-fun lt!351635 () SeekEntryResult!8106)

(declare-fun lt!351636 () SeekEntryResult!8106)

(assert (=> b!788187 (= e!438083 (= lt!351635 lt!351636))))

(declare-fun b!788188 () Bool)

(declare-fun res!533932 () Bool)

(assert (=> b!788188 (=> (not res!533932) (not e!438091))))

(declare-fun arrayContainsKey!0 (array!42836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788188 (= res!533932 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788189 () Bool)

(declare-fun res!533928 () Bool)

(assert (=> b!788189 (=> (not res!533928) (not e!438083))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42836 (_ BitVec 32)) SeekEntryResult!8106)

(assert (=> b!788189 (= res!533928 (= (seekEntryOrOpen!0 lt!351633 lt!351643 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351633 lt!351643 mask!3328)))))

(declare-fun b!788190 () Bool)

(declare-fun e!438084 () Bool)

(assert (=> b!788190 (= e!438084 e!438092)))

(declare-fun res!533938 () Bool)

(assert (=> b!788190 (=> res!533938 e!438092)))

(assert (=> b!788190 (= res!533938 (= lt!351637 lt!351633))))

(assert (=> b!788190 (= lt!351637 (select (store (arr!20506 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!788191 () Bool)

(declare-fun res!533934 () Bool)

(assert (=> b!788191 (=> (not res!533934) (not e!438087))))

(assert (=> b!788191 (= res!533934 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20506 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788192 () Bool)

(declare-fun e!438088 () Bool)

(assert (=> b!788192 (= e!438081 (not e!438088))))

(declare-fun res!533921 () Bool)

(assert (=> b!788192 (=> res!533921 e!438088)))

(get-info :version)

(assert (=> b!788192 (= res!533921 (or (not ((_ is Intermediate!8106) lt!351641)) (bvslt x!1131 (x!65726 lt!351641)) (not (= x!1131 (x!65726 lt!351641))) (not (= index!1321 (index!34794 lt!351641)))))))

(declare-fun e!438090 () Bool)

(assert (=> b!788192 e!438090))

(declare-fun res!533936 () Bool)

(assert (=> b!788192 (=> (not res!533936) (not e!438090))))

(declare-fun lt!351640 () SeekEntryResult!8106)

(assert (=> b!788192 (= res!533936 (= lt!351635 lt!351640))))

(assert (=> b!788192 (= lt!351640 (Found!8106 j!159))))

(assert (=> b!788192 (= lt!351635 (seekEntryOrOpen!0 (select (arr!20506 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788192 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351644 () Unit!27312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27312)

(assert (=> b!788192 (= lt!351644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788193 () Bool)

(declare-fun Unit!27315 () Unit!27312)

(assert (=> b!788193 (= e!438085 Unit!27315)))

(assert (=> b!788193 false))

(declare-fun b!788194 () Bool)

(assert (=> b!788194 (= e!438088 e!438084)))

(declare-fun res!533923 () Bool)

(assert (=> b!788194 (=> res!533923 e!438084)))

(assert (=> b!788194 (= res!533923 (not (= lt!351636 lt!351640)))))

(assert (=> b!788194 (= lt!351636 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788195 () Bool)

(assert (=> b!788195 (= e!438090 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) lt!351640))))

(declare-fun res!533924 () Bool)

(assert (=> start!67796 (=> (not res!533924) (not e!438091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67796 (= res!533924 (validMask!0 mask!3328))))

(assert (=> start!67796 e!438091))

(assert (=> start!67796 true))

(declare-fun array_inv!16302 (array!42836) Bool)

(assert (=> start!67796 (array_inv!16302 a!3186)))

(declare-fun b!788196 () Bool)

(assert (=> b!788196 (= e!438086 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20506 a!3186) j!159) a!3186 mask!3328) (Found!8106 j!159)))))

(assert (= (and start!67796 res!533924) b!788176))

(assert (= (and b!788176 res!533926) b!788179))

(assert (= (and b!788179 res!533937) b!788184))

(assert (= (and b!788184 res!533935) b!788188))

(assert (= (and b!788188 res!533932) b!788181))

(assert (= (and b!788181 res!533931) b!788177))

(assert (= (and b!788177 res!533929) b!788175))

(assert (= (and b!788175 res!533925) b!788180))

(assert (= (and b!788180 res!533933) b!788186))

(assert (= (and b!788186 res!533922) b!788191))

(assert (= (and b!788191 res!533934) b!788178))

(assert (= (and b!788178 c!87535) b!788185))

(assert (= (and b!788178 (not c!87535)) b!788196))

(assert (= (and b!788178 res!533939) b!788183))

(assert (= (and b!788183 res!533930) b!788192))

(assert (= (and b!788192 res!533936) b!788195))

(assert (= (and b!788192 (not res!533921)) b!788194))

(assert (= (and b!788194 (not res!533923)) b!788190))

(assert (= (and b!788190 (not res!533938)) b!788174))

(assert (= (and b!788174 c!87534) b!788193))

(assert (= (and b!788174 (not c!87534)) b!788182))

(assert (= (and b!788174 res!533927) b!788189))

(assert (= (and b!788189 res!533928) b!788187))

(declare-fun m!729575 () Bool)

(assert (=> b!788196 m!729575))

(assert (=> b!788196 m!729575))

(declare-fun m!729577 () Bool)

(assert (=> b!788196 m!729577))

(declare-fun m!729579 () Bool)

(assert (=> b!788181 m!729579))

(assert (=> b!788192 m!729575))

(assert (=> b!788192 m!729575))

(declare-fun m!729581 () Bool)

(assert (=> b!788192 m!729581))

(declare-fun m!729583 () Bool)

(assert (=> b!788192 m!729583))

(declare-fun m!729585 () Bool)

(assert (=> b!788192 m!729585))

(declare-fun m!729587 () Bool)

(assert (=> start!67796 m!729587))

(declare-fun m!729589 () Bool)

(assert (=> start!67796 m!729589))

(assert (=> b!788179 m!729575))

(assert (=> b!788179 m!729575))

(declare-fun m!729591 () Bool)

(assert (=> b!788179 m!729591))

(assert (=> b!788186 m!729575))

(assert (=> b!788186 m!729575))

(declare-fun m!729593 () Bool)

(assert (=> b!788186 m!729593))

(assert (=> b!788186 m!729593))

(assert (=> b!788186 m!729575))

(declare-fun m!729595 () Bool)

(assert (=> b!788186 m!729595))

(assert (=> b!788195 m!729575))

(assert (=> b!788195 m!729575))

(declare-fun m!729597 () Bool)

(assert (=> b!788195 m!729597))

(declare-fun m!729599 () Bool)

(assert (=> b!788190 m!729599))

(declare-fun m!729601 () Bool)

(assert (=> b!788190 m!729601))

(declare-fun m!729603 () Bool)

(assert (=> b!788191 m!729603))

(assert (=> b!788194 m!729575))

(assert (=> b!788194 m!729575))

(assert (=> b!788194 m!729577))

(declare-fun m!729605 () Bool)

(assert (=> b!788189 m!729605))

(declare-fun m!729607 () Bool)

(assert (=> b!788189 m!729607))

(declare-fun m!729609 () Bool)

(assert (=> b!788177 m!729609))

(declare-fun m!729611 () Bool)

(assert (=> b!788188 m!729611))

(declare-fun m!729613 () Bool)

(assert (=> b!788184 m!729613))

(declare-fun m!729615 () Bool)

(assert (=> b!788175 m!729615))

(assert (=> b!788185 m!729575))

(assert (=> b!788185 m!729575))

(declare-fun m!729617 () Bool)

(assert (=> b!788185 m!729617))

(declare-fun m!729619 () Bool)

(assert (=> b!788174 m!729619))

(declare-fun m!729621 () Bool)

(assert (=> b!788183 m!729621))

(declare-fun m!729623 () Bool)

(assert (=> b!788183 m!729623))

(declare-fun m!729625 () Bool)

(assert (=> b!788183 m!729625))

(assert (=> b!788183 m!729599))

(declare-fun m!729627 () Bool)

(assert (=> b!788183 m!729627))

(assert (=> b!788183 m!729623))

(check-sat (not b!788194) (not b!788184) (not b!788183) (not b!788175) (not b!788189) (not b!788188) (not b!788177) (not b!788181) (not b!788186) (not start!67796) (not b!788185) (not b!788196) (not b!788195) (not b!788192) (not b!788179))
(check-sat)
