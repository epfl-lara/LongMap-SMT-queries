; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67664 () Bool)

(assert start!67664)

(declare-fun b!783624 () Bool)

(declare-fun e!435710 () Bool)

(declare-fun e!435705 () Bool)

(assert (=> b!783624 (= e!435710 e!435705)))

(declare-fun res!530167 () Bool)

(assert (=> b!783624 (=> (not res!530167) (not e!435705))))

(declare-datatypes ((SeekEntryResult!8040 0))(
  ( (MissingZero!8040 (index!34528 (_ BitVec 32))) (Found!8040 (index!34529 (_ BitVec 32))) (Intermediate!8040 (undefined!8852 Bool) (index!34530 (_ BitVec 32)) (x!65484 (_ BitVec 32))) (Undefined!8040) (MissingVacant!8040 (index!34531 (_ BitVec 32))) )
))
(declare-fun lt!349266 () SeekEntryResult!8040)

(declare-fun lt!349262 () SeekEntryResult!8040)

(assert (=> b!783624 (= res!530167 (= lt!349266 lt!349262))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!349257 () (_ BitVec 64))

(declare-datatypes ((array!42704 0))(
  ( (array!42705 (arr!20440 (Array (_ BitVec 32) (_ BitVec 64))) (size!20861 (_ BitVec 32))) )
))
(declare-fun lt!349259 () array!42704)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42704 (_ BitVec 32)) SeekEntryResult!8040)

(assert (=> b!783624 (= lt!349262 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349257 lt!349259 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783624 (= lt!349266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349257 mask!3328) lt!349257 lt!349259 mask!3328))))

(declare-fun a!3186 () array!42704)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783624 (= lt!349257 (select (store (arr!20440 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783624 (= lt!349259 (array!42705 (store (arr!20440 a!3186) i!1173 k0!2102) (size!20861 a!3186)))))

(declare-fun b!783625 () Bool)

(declare-fun res!530168 () Bool)

(declare-fun e!435707 () Bool)

(assert (=> b!783625 (=> (not res!530168) (not e!435707))))

(declare-datatypes ((List!14442 0))(
  ( (Nil!14439) (Cons!14438 (h!15561 (_ BitVec 64)) (t!20757 List!14442)) )
))
(declare-fun arrayNoDuplicates!0 (array!42704 (_ BitVec 32) List!14442) Bool)

(assert (=> b!783625 (= res!530168 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14439))))

(declare-fun b!783626 () Bool)

(declare-fun res!530170 () Bool)

(assert (=> b!783626 (=> (not res!530170) (not e!435707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42704 (_ BitVec 32)) Bool)

(assert (=> b!783626 (= res!530170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783627 () Bool)

(declare-fun res!530173 () Bool)

(assert (=> b!783627 (=> (not res!530173) (not e!435710))))

(declare-fun e!435715 () Bool)

(assert (=> b!783627 (= res!530173 e!435715)))

(declare-fun c!87139 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783627 (= c!87139 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783628 () Bool)

(declare-fun e!435711 () Bool)

(assert (=> b!783628 (= e!435711 e!435707)))

(declare-fun res!530164 () Bool)

(assert (=> b!783628 (=> (not res!530164) (not e!435707))))

(declare-fun lt!349263 () SeekEntryResult!8040)

(assert (=> b!783628 (= res!530164 (or (= lt!349263 (MissingZero!8040 i!1173)) (= lt!349263 (MissingVacant!8040 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42704 (_ BitVec 32)) SeekEntryResult!8040)

(assert (=> b!783628 (= lt!349263 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783629 () Bool)

(declare-datatypes ((Unit!27048 0))(
  ( (Unit!27049) )
))
(declare-fun e!435706 () Unit!27048)

(declare-fun Unit!27050 () Unit!27048)

(assert (=> b!783629 (= e!435706 Unit!27050)))

(assert (=> b!783629 false))

(declare-fun b!783630 () Bool)

(declare-fun e!435713 () Bool)

(declare-fun e!435714 () Bool)

(assert (=> b!783630 (= e!435713 e!435714)))

(declare-fun res!530163 () Bool)

(assert (=> b!783630 (=> res!530163 e!435714)))

(declare-fun lt!349267 () (_ BitVec 64))

(assert (=> b!783630 (= res!530163 (= lt!349267 lt!349257))))

(assert (=> b!783630 (= lt!349267 (select (store (arr!20440 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun lt!349258 () SeekEntryResult!8040)

(declare-fun b!783631 () Bool)

(assert (=> b!783631 (= e!435715 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349258))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!783632 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42704 (_ BitVec 32)) SeekEntryResult!8040)

(assert (=> b!783632 (= e!435715 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) (Found!8040 j!159)))))

(declare-fun b!783633 () Bool)

(declare-fun lt!349261 () SeekEntryResult!8040)

(declare-fun lt!349268 () SeekEntryResult!8040)

(assert (=> b!783633 (= e!435714 (= lt!349261 lt!349268))))

(declare-fun e!435716 () Bool)

(assert (=> b!783633 e!435716))

(declare-fun res!530180 () Bool)

(assert (=> b!783633 (=> (not res!530180) (not e!435716))))

(assert (=> b!783633 (= res!530180 (= lt!349267 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349265 () Unit!27048)

(assert (=> b!783633 (= lt!349265 e!435706)))

(declare-fun c!87138 () Bool)

(assert (=> b!783633 (= c!87138 (= lt!349267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783634 () Bool)

(declare-fun e!435712 () Bool)

(assert (=> b!783634 (= e!435712 e!435713)))

(declare-fun res!530166 () Bool)

(assert (=> b!783634 (=> res!530166 e!435713)))

(declare-fun lt!349264 () SeekEntryResult!8040)

(assert (=> b!783634 (= res!530166 (not (= lt!349268 lt!349264)))))

(assert (=> b!783634 (= lt!349268 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!530178 () Bool)

(assert (=> start!67664 (=> (not res!530178) (not e!435711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67664 (= res!530178 (validMask!0 mask!3328))))

(assert (=> start!67664 e!435711))

(assert (=> start!67664 true))

(declare-fun array_inv!16236 (array!42704) Bool)

(assert (=> start!67664 (array_inv!16236 a!3186)))

(declare-fun b!783635 () Bool)

(declare-fun res!530165 () Bool)

(assert (=> b!783635 (=> (not res!530165) (not e!435710))))

(assert (=> b!783635 (= res!530165 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20440 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!435708 () Bool)

(declare-fun b!783636 () Bool)

(assert (=> b!783636 (= e!435708 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349264))))

(declare-fun b!783637 () Bool)

(assert (=> b!783637 (= e!435716 (= (seekEntryOrOpen!0 lt!349257 lt!349259 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349257 lt!349259 mask!3328)))))

(declare-fun b!783638 () Bool)

(declare-fun res!530177 () Bool)

(assert (=> b!783638 (=> (not res!530177) (not e!435711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783638 (= res!530177 (validKeyInArray!0 k0!2102))))

(declare-fun b!783639 () Bool)

(assert (=> b!783639 (= e!435705 (not e!435712))))

(declare-fun res!530175 () Bool)

(assert (=> b!783639 (=> res!530175 e!435712)))

(get-info :version)

(assert (=> b!783639 (= res!530175 (or (not ((_ is Intermediate!8040) lt!349262)) (bvslt x!1131 (x!65484 lt!349262)) (not (= x!1131 (x!65484 lt!349262))) (not (= index!1321 (index!34530 lt!349262)))))))

(assert (=> b!783639 e!435708))

(declare-fun res!530174 () Bool)

(assert (=> b!783639 (=> (not res!530174) (not e!435708))))

(assert (=> b!783639 (= res!530174 (= lt!349261 lt!349264))))

(assert (=> b!783639 (= lt!349264 (Found!8040 j!159))))

(assert (=> b!783639 (= lt!349261 (seekEntryOrOpen!0 (select (arr!20440 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783639 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349260 () Unit!27048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27048)

(assert (=> b!783639 (= lt!349260 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783640 () Bool)

(declare-fun Unit!27051 () Unit!27048)

(assert (=> b!783640 (= e!435706 Unit!27051)))

(declare-fun b!783641 () Bool)

(assert (=> b!783641 (= e!435707 e!435710)))

(declare-fun res!530176 () Bool)

(assert (=> b!783641 (=> (not res!530176) (not e!435710))))

(assert (=> b!783641 (= res!530176 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20440 a!3186) j!159) mask!3328) (select (arr!20440 a!3186) j!159) a!3186 mask!3328) lt!349258))))

(assert (=> b!783641 (= lt!349258 (Intermediate!8040 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783642 () Bool)

(declare-fun res!530172 () Bool)

(assert (=> b!783642 (=> (not res!530172) (not e!435711))))

(assert (=> b!783642 (= res!530172 (and (= (size!20861 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20861 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20861 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783643 () Bool)

(declare-fun res!530179 () Bool)

(assert (=> b!783643 (=> (not res!530179) (not e!435711))))

(declare-fun arrayContainsKey!0 (array!42704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783643 (= res!530179 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783644 () Bool)

(declare-fun res!530171 () Bool)

(assert (=> b!783644 (=> (not res!530171) (not e!435707))))

(assert (=> b!783644 (= res!530171 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20861 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20861 a!3186))))))

(declare-fun b!783645 () Bool)

(declare-fun res!530169 () Bool)

(assert (=> b!783645 (=> (not res!530169) (not e!435711))))

(assert (=> b!783645 (= res!530169 (validKeyInArray!0 (select (arr!20440 a!3186) j!159)))))

(assert (= (and start!67664 res!530178) b!783642))

(assert (= (and b!783642 res!530172) b!783645))

(assert (= (and b!783645 res!530169) b!783638))

(assert (= (and b!783638 res!530177) b!783643))

(assert (= (and b!783643 res!530179) b!783628))

(assert (= (and b!783628 res!530164) b!783626))

(assert (= (and b!783626 res!530170) b!783625))

(assert (= (and b!783625 res!530168) b!783644))

(assert (= (and b!783644 res!530171) b!783641))

(assert (= (and b!783641 res!530176) b!783635))

(assert (= (and b!783635 res!530165) b!783627))

(assert (= (and b!783627 c!87139) b!783631))

(assert (= (and b!783627 (not c!87139)) b!783632))

(assert (= (and b!783627 res!530173) b!783624))

(assert (= (and b!783624 res!530167) b!783639))

(assert (= (and b!783639 res!530174) b!783636))

(assert (= (and b!783639 (not res!530175)) b!783634))

(assert (= (and b!783634 (not res!530166)) b!783630))

(assert (= (and b!783630 (not res!530163)) b!783633))

(assert (= (and b!783633 c!87138) b!783629))

(assert (= (and b!783633 (not c!87138)) b!783640))

(assert (= (and b!783633 res!530180) b!783637))

(declare-fun m!726141 () Bool)

(assert (=> b!783641 m!726141))

(assert (=> b!783641 m!726141))

(declare-fun m!726143 () Bool)

(assert (=> b!783641 m!726143))

(assert (=> b!783641 m!726143))

(assert (=> b!783641 m!726141))

(declare-fun m!726145 () Bool)

(assert (=> b!783641 m!726145))

(assert (=> b!783631 m!726141))

(assert (=> b!783631 m!726141))

(declare-fun m!726147 () Bool)

(assert (=> b!783631 m!726147))

(declare-fun m!726149 () Bool)

(assert (=> start!67664 m!726149))

(declare-fun m!726151 () Bool)

(assert (=> start!67664 m!726151))

(declare-fun m!726153 () Bool)

(assert (=> b!783643 m!726153))

(declare-fun m!726155 () Bool)

(assert (=> b!783625 m!726155))

(assert (=> b!783632 m!726141))

(assert (=> b!783632 m!726141))

(declare-fun m!726157 () Bool)

(assert (=> b!783632 m!726157))

(declare-fun m!726159 () Bool)

(assert (=> b!783637 m!726159))

(declare-fun m!726161 () Bool)

(assert (=> b!783637 m!726161))

(assert (=> b!783636 m!726141))

(assert (=> b!783636 m!726141))

(declare-fun m!726163 () Bool)

(assert (=> b!783636 m!726163))

(declare-fun m!726165 () Bool)

(assert (=> b!783630 m!726165))

(declare-fun m!726167 () Bool)

(assert (=> b!783630 m!726167))

(declare-fun m!726169 () Bool)

(assert (=> b!783635 m!726169))

(assert (=> b!783639 m!726141))

(assert (=> b!783639 m!726141))

(declare-fun m!726171 () Bool)

(assert (=> b!783639 m!726171))

(declare-fun m!726173 () Bool)

(assert (=> b!783639 m!726173))

(declare-fun m!726175 () Bool)

(assert (=> b!783639 m!726175))

(declare-fun m!726177 () Bool)

(assert (=> b!783628 m!726177))

(declare-fun m!726179 () Bool)

(assert (=> b!783626 m!726179))

(declare-fun m!726181 () Bool)

(assert (=> b!783624 m!726181))

(declare-fun m!726183 () Bool)

(assert (=> b!783624 m!726183))

(assert (=> b!783624 m!726165))

(declare-fun m!726185 () Bool)

(assert (=> b!783624 m!726185))

(declare-fun m!726187 () Bool)

(assert (=> b!783624 m!726187))

(assert (=> b!783624 m!726181))

(declare-fun m!726189 () Bool)

(assert (=> b!783638 m!726189))

(assert (=> b!783645 m!726141))

(assert (=> b!783645 m!726141))

(declare-fun m!726191 () Bool)

(assert (=> b!783645 m!726191))

(assert (=> b!783634 m!726141))

(assert (=> b!783634 m!726141))

(assert (=> b!783634 m!726157))

(check-sat (not b!783636) (not b!783625) (not start!67664) (not b!783637) (not b!783634) (not b!783632) (not b!783624) (not b!783645) (not b!783631) (not b!783638) (not b!783628) (not b!783641) (not b!783626) (not b!783639) (not b!783643))
(check-sat)
