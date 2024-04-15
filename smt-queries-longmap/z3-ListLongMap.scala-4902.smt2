; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67634 () Bool)

(assert start!67634)

(declare-fun b!783110 () Bool)

(declare-fun e!435421 () Bool)

(declare-fun e!435418 () Bool)

(assert (=> b!783110 (= e!435421 e!435418)))

(declare-fun res!529854 () Bool)

(assert (=> b!783110 (=> (not res!529854) (not e!435418))))

(declare-datatypes ((SeekEntryResult!8032 0))(
  ( (MissingZero!8032 (index!34496 (_ BitVec 32))) (Found!8032 (index!34497 (_ BitVec 32))) (Intermediate!8032 (undefined!8844 Bool) (index!34498 (_ BitVec 32)) (x!65463 (_ BitVec 32))) (Undefined!8032) (MissingVacant!8032 (index!34499 (_ BitVec 32))) )
))
(declare-fun lt!348889 () SeekEntryResult!8032)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783110 (= res!529854 (or (= lt!348889 (MissingZero!8032 i!1173)) (= lt!348889 (MissingVacant!8032 i!1173))))))

(declare-datatypes ((array!42693 0))(
  ( (array!42694 (arr!20435 (Array (_ BitVec 32) (_ BitVec 64))) (size!20856 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42693)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42693 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!783110 (= lt!348889 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783111 () Bool)

(declare-fun res!529849 () Bool)

(declare-fun e!435416 () Bool)

(assert (=> b!783111 (=> res!529849 e!435416)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!348882 () SeekEntryResult!8032)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42693 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!783111 (= res!529849 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!348882)))))

(declare-fun b!783112 () Bool)

(declare-fun e!435415 () Bool)

(assert (=> b!783112 (= e!435415 true)))

(declare-fun e!435423 () Bool)

(assert (=> b!783112 e!435423))

(declare-fun res!529847 () Bool)

(assert (=> b!783112 (=> (not res!529847) (not e!435423))))

(declare-fun lt!348886 () (_ BitVec 64))

(assert (=> b!783112 (= res!529847 (= lt!348886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26996 0))(
  ( (Unit!26997) )
))
(declare-fun lt!348884 () Unit!26996)

(declare-fun e!435424 () Unit!26996)

(assert (=> b!783112 (= lt!348884 e!435424)))

(declare-fun c!87045 () Bool)

(assert (=> b!783112 (= c!87045 (= lt!348886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783113 () Bool)

(declare-fun Unit!26998 () Unit!26996)

(assert (=> b!783113 (= e!435424 Unit!26998)))

(assert (=> b!783113 false))

(declare-fun b!783114 () Bool)

(declare-fun e!435422 () Bool)

(assert (=> b!783114 (= e!435422 (not e!435416))))

(declare-fun res!529846 () Bool)

(assert (=> b!783114 (=> res!529846 e!435416)))

(declare-fun lt!348880 () SeekEntryResult!8032)

(get-info :version)

(assert (=> b!783114 (= res!529846 (or (not ((_ is Intermediate!8032) lt!348880)) (bvslt x!1131 (x!65463 lt!348880)) (not (= x!1131 (x!65463 lt!348880))) (not (= index!1321 (index!34498 lt!348880)))))))

(declare-fun e!435420 () Bool)

(assert (=> b!783114 e!435420))

(declare-fun res!529837 () Bool)

(assert (=> b!783114 (=> (not res!529837) (not e!435420))))

(declare-fun lt!348883 () SeekEntryResult!8032)

(assert (=> b!783114 (= res!529837 (= lt!348883 lt!348882))))

(assert (=> b!783114 (= lt!348882 (Found!8032 j!159))))

(assert (=> b!783114 (= lt!348883 (seekEntryOrOpen!0 (select (arr!20435 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42693 (_ BitVec 32)) Bool)

(assert (=> b!783114 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348885 () Unit!26996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26996)

(assert (=> b!783114 (= lt!348885 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783115 () Bool)

(assert (=> b!783115 (= e!435416 e!435415)))

(declare-fun res!529838 () Bool)

(assert (=> b!783115 (=> res!529838 e!435415)))

(declare-fun lt!348888 () (_ BitVec 64))

(assert (=> b!783115 (= res!529838 (= lt!348886 lt!348888))))

(assert (=> b!783115 (= lt!348886 (select (store (arr!20435 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783116 () Bool)

(assert (=> b!783116 (= e!435420 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!348882))))

(declare-fun res!529839 () Bool)

(assert (=> start!67634 (=> (not res!529839) (not e!435421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67634 (= res!529839 (validMask!0 mask!3328))))

(assert (=> start!67634 e!435421))

(assert (=> start!67634 true))

(declare-fun array_inv!16318 (array!42693) Bool)

(assert (=> start!67634 (array_inv!16318 a!3186)))

(declare-fun b!783117 () Bool)

(declare-fun lt!348890 () SeekEntryResult!8032)

(declare-fun e!435419 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42693 (_ BitVec 32)) SeekEntryResult!8032)

(assert (=> b!783117 (= e!435419 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!348890))))

(declare-fun b!783118 () Bool)

(declare-fun res!529844 () Bool)

(assert (=> b!783118 (=> (not res!529844) (not e!435418))))

(assert (=> b!783118 (= res!529844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783119 () Bool)

(declare-fun e!435414 () Bool)

(assert (=> b!783119 (= e!435418 e!435414)))

(declare-fun res!529851 () Bool)

(assert (=> b!783119 (=> (not res!529851) (not e!435414))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783119 (= res!529851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20435 a!3186) j!159) mask!3328) (select (arr!20435 a!3186) j!159) a!3186 mask!3328) lt!348890))))

(assert (=> b!783119 (= lt!348890 (Intermediate!8032 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783120 () Bool)

(declare-fun res!529852 () Bool)

(assert (=> b!783120 (=> (not res!529852) (not e!435421))))

(declare-fun arrayContainsKey!0 (array!42693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783120 (= res!529852 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783121 () Bool)

(declare-fun res!529845 () Bool)

(assert (=> b!783121 (=> (not res!529845) (not e!435414))))

(assert (=> b!783121 (= res!529845 e!435419)))

(declare-fun c!87044 () Bool)

(assert (=> b!783121 (= c!87044 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783122 () Bool)

(assert (=> b!783122 (= e!435414 e!435422)))

(declare-fun res!529842 () Bool)

(assert (=> b!783122 (=> (not res!529842) (not e!435422))))

(declare-fun lt!348881 () SeekEntryResult!8032)

(assert (=> b!783122 (= res!529842 (= lt!348881 lt!348880))))

(declare-fun lt!348887 () array!42693)

(assert (=> b!783122 (= lt!348880 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348888 lt!348887 mask!3328))))

(assert (=> b!783122 (= lt!348881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348888 mask!3328) lt!348888 lt!348887 mask!3328))))

(assert (=> b!783122 (= lt!348888 (select (store (arr!20435 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783122 (= lt!348887 (array!42694 (store (arr!20435 a!3186) i!1173 k0!2102) (size!20856 a!3186)))))

(declare-fun b!783123 () Bool)

(assert (=> b!783123 (= e!435423 (= (seekEntryOrOpen!0 lt!348888 lt!348887 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348888 lt!348887 mask!3328)))))

(declare-fun b!783124 () Bool)

(declare-fun res!529841 () Bool)

(assert (=> b!783124 (=> (not res!529841) (not e!435421))))

(assert (=> b!783124 (= res!529841 (and (= (size!20856 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20856 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20856 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783125 () Bool)

(declare-fun res!529843 () Bool)

(assert (=> b!783125 (=> (not res!529843) (not e!435418))))

(assert (=> b!783125 (= res!529843 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20856 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20856 a!3186))))))

(declare-fun b!783126 () Bool)

(declare-fun res!529848 () Bool)

(assert (=> b!783126 (=> (not res!529848) (not e!435414))))

(assert (=> b!783126 (= res!529848 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20435 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783127 () Bool)

(assert (=> b!783127 (= e!435419 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20435 a!3186) j!159) a!3186 mask!3328) (Found!8032 j!159)))))

(declare-fun b!783128 () Bool)

(declare-fun res!529850 () Bool)

(assert (=> b!783128 (=> (not res!529850) (not e!435421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783128 (= res!529850 (validKeyInArray!0 (select (arr!20435 a!3186) j!159)))))

(declare-fun b!783129 () Bool)

(declare-fun res!529853 () Bool)

(assert (=> b!783129 (=> (not res!529853) (not e!435418))))

(declare-datatypes ((List!14476 0))(
  ( (Nil!14473) (Cons!14472 (h!15595 (_ BitVec 64)) (t!20782 List!14476)) )
))
(declare-fun arrayNoDuplicates!0 (array!42693 (_ BitVec 32) List!14476) Bool)

(assert (=> b!783129 (= res!529853 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14473))))

(declare-fun b!783130 () Bool)

(declare-fun res!529840 () Bool)

(assert (=> b!783130 (=> (not res!529840) (not e!435421))))

(assert (=> b!783130 (= res!529840 (validKeyInArray!0 k0!2102))))

(declare-fun b!783131 () Bool)

(declare-fun Unit!26999 () Unit!26996)

(assert (=> b!783131 (= e!435424 Unit!26999)))

(assert (= (and start!67634 res!529839) b!783124))

(assert (= (and b!783124 res!529841) b!783128))

(assert (= (and b!783128 res!529850) b!783130))

(assert (= (and b!783130 res!529840) b!783120))

(assert (= (and b!783120 res!529852) b!783110))

(assert (= (and b!783110 res!529854) b!783118))

(assert (= (and b!783118 res!529844) b!783129))

(assert (= (and b!783129 res!529853) b!783125))

(assert (= (and b!783125 res!529843) b!783119))

(assert (= (and b!783119 res!529851) b!783126))

(assert (= (and b!783126 res!529848) b!783121))

(assert (= (and b!783121 c!87044) b!783117))

(assert (= (and b!783121 (not c!87044)) b!783127))

(assert (= (and b!783121 res!529845) b!783122))

(assert (= (and b!783122 res!529842) b!783114))

(assert (= (and b!783114 res!529837) b!783116))

(assert (= (and b!783114 (not res!529846)) b!783111))

(assert (= (and b!783111 (not res!529849)) b!783115))

(assert (= (and b!783115 (not res!529838)) b!783112))

(assert (= (and b!783112 c!87045) b!783113))

(assert (= (and b!783112 (not c!87045)) b!783131))

(assert (= (and b!783112 res!529847) b!783123))

(declare-fun m!725175 () Bool)

(assert (=> b!783123 m!725175))

(declare-fun m!725177 () Bool)

(assert (=> b!783123 m!725177))

(declare-fun m!725179 () Bool)

(assert (=> b!783117 m!725179))

(assert (=> b!783117 m!725179))

(declare-fun m!725181 () Bool)

(assert (=> b!783117 m!725181))

(assert (=> b!783119 m!725179))

(assert (=> b!783119 m!725179))

(declare-fun m!725183 () Bool)

(assert (=> b!783119 m!725183))

(assert (=> b!783119 m!725183))

(assert (=> b!783119 m!725179))

(declare-fun m!725185 () Bool)

(assert (=> b!783119 m!725185))

(assert (=> b!783128 m!725179))

(assert (=> b!783128 m!725179))

(declare-fun m!725187 () Bool)

(assert (=> b!783128 m!725187))

(declare-fun m!725189 () Bool)

(assert (=> b!783130 m!725189))

(assert (=> b!783116 m!725179))

(assert (=> b!783116 m!725179))

(declare-fun m!725191 () Bool)

(assert (=> b!783116 m!725191))

(assert (=> b!783114 m!725179))

(assert (=> b!783114 m!725179))

(declare-fun m!725193 () Bool)

(assert (=> b!783114 m!725193))

(declare-fun m!725195 () Bool)

(assert (=> b!783114 m!725195))

(declare-fun m!725197 () Bool)

(assert (=> b!783114 m!725197))

(declare-fun m!725199 () Bool)

(assert (=> b!783120 m!725199))

(declare-fun m!725201 () Bool)

(assert (=> b!783110 m!725201))

(assert (=> b!783111 m!725179))

(assert (=> b!783111 m!725179))

(declare-fun m!725203 () Bool)

(assert (=> b!783111 m!725203))

(declare-fun m!725205 () Bool)

(assert (=> b!783115 m!725205))

(declare-fun m!725207 () Bool)

(assert (=> b!783115 m!725207))

(declare-fun m!725209 () Bool)

(assert (=> b!783118 m!725209))

(assert (=> b!783127 m!725179))

(assert (=> b!783127 m!725179))

(assert (=> b!783127 m!725203))

(declare-fun m!725211 () Bool)

(assert (=> b!783122 m!725211))

(assert (=> b!783122 m!725205))

(declare-fun m!725213 () Bool)

(assert (=> b!783122 m!725213))

(declare-fun m!725215 () Bool)

(assert (=> b!783122 m!725215))

(assert (=> b!783122 m!725215))

(declare-fun m!725217 () Bool)

(assert (=> b!783122 m!725217))

(declare-fun m!725219 () Bool)

(assert (=> b!783129 m!725219))

(declare-fun m!725221 () Bool)

(assert (=> b!783126 m!725221))

(declare-fun m!725223 () Bool)

(assert (=> start!67634 m!725223))

(declare-fun m!725225 () Bool)

(assert (=> start!67634 m!725225))

(check-sat (not b!783123) (not b!783116) (not b!783114) (not b!783130) (not b!783127) (not b!783118) (not start!67634) (not b!783120) (not b!783117) (not b!783110) (not b!783128) (not b!783111) (not b!783119) (not b!783122) (not b!783129))
(check-sat)
