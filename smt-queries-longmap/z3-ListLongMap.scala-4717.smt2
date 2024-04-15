; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65342 () Bool)

(assert start!65342)

(declare-fun b!742872 () Bool)

(declare-fun e!415086 () Bool)

(declare-fun e!415085 () Bool)

(assert (=> b!742872 (= e!415086 e!415085)))

(declare-fun res!500133 () Bool)

(assert (=> b!742872 (=> (not res!500133) (not e!415085))))

(declare-datatypes ((SeekEntryResult!7477 0))(
  ( (MissingZero!7477 (index!32276 (_ BitVec 32))) (Found!7477 (index!32277 (_ BitVec 32))) (Intermediate!7477 (undefined!8289 Bool) (index!32278 (_ BitVec 32)) (x!63254 (_ BitVec 32))) (Undefined!7477) (MissingVacant!7477 (index!32279 (_ BitVec 32))) )
))
(declare-fun lt!329883 () SeekEntryResult!7477)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742872 (= res!500133 (or (= lt!329883 (MissingZero!7477 i!1173)) (= lt!329883 (MissingVacant!7477 i!1173))))))

(declare-datatypes ((array!41532 0))(
  ( (array!41533 (arr!19880 (Array (_ BitVec 32) (_ BitVec 64))) (size!20301 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41532)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41532 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!742872 (= lt!329883 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742873 () Bool)

(declare-fun e!415087 () Bool)

(declare-fun e!415091 () Bool)

(assert (=> b!742873 (= e!415087 e!415091)))

(declare-fun res!500147 () Bool)

(assert (=> b!742873 (=> (not res!500147) (not e!415091))))

(declare-fun lt!329885 () SeekEntryResult!7477)

(declare-fun lt!329881 () SeekEntryResult!7477)

(assert (=> b!742873 (= res!500147 (= lt!329885 lt!329881))))

(declare-fun lt!329884 () array!41532)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329887 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41532 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!742873 (= lt!329881 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329887 lt!329884 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742873 (= lt!329885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329887 mask!3328) lt!329887 lt!329884 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!742873 (= lt!329887 (select (store (arr!19880 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742873 (= lt!329884 (array!41533 (store (arr!19880 a!3186) i!1173 k0!2102) (size!20301 a!3186)))))

(declare-fun b!742874 () Bool)

(declare-fun res!500145 () Bool)

(assert (=> b!742874 (=> (not res!500145) (not e!415085))))

(declare-datatypes ((List!13921 0))(
  ( (Nil!13918) (Cons!13917 (h!14989 (_ BitVec 64)) (t!20227 List!13921)) )
))
(declare-fun arrayNoDuplicates!0 (array!41532 (_ BitVec 32) List!13921) Bool)

(assert (=> b!742874 (= res!500145 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13918))))

(declare-fun b!742875 () Bool)

(declare-fun e!415090 () Bool)

(declare-fun e!415093 () Bool)

(assert (=> b!742875 (= e!415090 e!415093)))

(declare-fun res!500144 () Bool)

(assert (=> b!742875 (=> (not res!500144) (not e!415093))))

(declare-fun lt!329888 () SeekEntryResult!7477)

(assert (=> b!742875 (= res!500144 (= (seekEntryOrOpen!0 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!329888))))

(assert (=> b!742875 (= lt!329888 (Found!7477 j!159))))

(declare-fun b!742876 () Bool)

(declare-fun e!415088 () Bool)

(assert (=> b!742876 (= e!415088 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!742877 () Bool)

(declare-fun res!500137 () Bool)

(assert (=> b!742877 (=> res!500137 e!415088)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41532 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!742877 (= res!500137 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) (Found!7477 j!159))))))

(declare-fun b!742878 () Bool)

(declare-fun e!415092 () Bool)

(declare-fun lt!329886 () SeekEntryResult!7477)

(assert (=> b!742878 (= e!415092 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!329886))))

(declare-fun b!742879 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742879 (= e!415093 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!329888))))

(declare-fun b!742880 () Bool)

(assert (=> b!742880 (= e!415091 (not e!415088))))

(declare-fun res!500139 () Bool)

(assert (=> b!742880 (=> res!500139 e!415088)))

(get-info :version)

(assert (=> b!742880 (= res!500139 (or (not ((_ is Intermediate!7477) lt!329881)) (bvslt x!1131 (x!63254 lt!329881)) (not (= x!1131 (x!63254 lt!329881))) (not (= index!1321 (index!32278 lt!329881)))))))

(assert (=> b!742880 e!415090))

(declare-fun res!500135 () Bool)

(assert (=> b!742880 (=> (not res!500135) (not e!415090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41532 (_ BitVec 32)) Bool)

(assert (=> b!742880 (= res!500135 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25406 0))(
  ( (Unit!25407) )
))
(declare-fun lt!329882 () Unit!25406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25406)

(assert (=> b!742880 (= lt!329882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742881 () Bool)

(declare-fun res!500146 () Bool)

(assert (=> b!742881 (=> (not res!500146) (not e!415086))))

(declare-fun arrayContainsKey!0 (array!41532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742881 (= res!500146 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742882 () Bool)

(declare-fun res!500143 () Bool)

(assert (=> b!742882 (=> res!500143 e!415088)))

(assert (=> b!742882 (= res!500143 (or (not (= (select (store (arr!19880 a!3186) i!1173 k0!2102) index!1321) lt!329887)) (undefined!8289 lt!329881)))))

(declare-fun b!742883 () Bool)

(declare-fun res!500150 () Bool)

(assert (=> b!742883 (=> (not res!500150) (not e!415086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742883 (= res!500150 (validKeyInArray!0 (select (arr!19880 a!3186) j!159)))))

(declare-fun res!500148 () Bool)

(assert (=> start!65342 (=> (not res!500148) (not e!415086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65342 (= res!500148 (validMask!0 mask!3328))))

(assert (=> start!65342 e!415086))

(assert (=> start!65342 true))

(declare-fun array_inv!15763 (array!41532) Bool)

(assert (=> start!65342 (array_inv!15763 a!3186)))

(declare-fun b!742884 () Bool)

(declare-fun res!500141 () Bool)

(assert (=> b!742884 (=> (not res!500141) (not e!415086))))

(assert (=> b!742884 (= res!500141 (and (= (size!20301 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20301 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20301 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742885 () Bool)

(declare-fun res!500142 () Bool)

(assert (=> b!742885 (=> (not res!500142) (not e!415086))))

(assert (=> b!742885 (= res!500142 (validKeyInArray!0 k0!2102))))

(declare-fun b!742886 () Bool)

(declare-fun res!500134 () Bool)

(assert (=> b!742886 (=> res!500134 e!415088)))

(assert (=> b!742886 (= res!500134 (not (= (seekEntryOrOpen!0 lt!329887 lt!329884 mask!3328) (Found!7477 index!1321))))))

(declare-fun b!742887 () Bool)

(declare-fun res!500136 () Bool)

(assert (=> b!742887 (=> (not res!500136) (not e!415087))))

(assert (=> b!742887 (= res!500136 e!415092)))

(declare-fun c!81750 () Bool)

(assert (=> b!742887 (= c!81750 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742888 () Bool)

(declare-fun res!500140 () Bool)

(assert (=> b!742888 (=> (not res!500140) (not e!415087))))

(assert (=> b!742888 (= res!500140 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19880 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742889 () Bool)

(assert (=> b!742889 (= e!415085 e!415087)))

(declare-fun res!500149 () Bool)

(assert (=> b!742889 (=> (not res!500149) (not e!415087))))

(assert (=> b!742889 (= res!500149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19880 a!3186) j!159) mask!3328) (select (arr!19880 a!3186) j!159) a!3186 mask!3328) lt!329886))))

(assert (=> b!742889 (= lt!329886 (Intermediate!7477 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742890 () Bool)

(declare-fun res!500151 () Bool)

(assert (=> b!742890 (=> (not res!500151) (not e!415085))))

(assert (=> b!742890 (= res!500151 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20301 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20301 a!3186))))))

(declare-fun b!742891 () Bool)

(assert (=> b!742891 (= e!415092 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19880 a!3186) j!159) a!3186 mask!3328) (Found!7477 j!159)))))

(declare-fun b!742892 () Bool)

(declare-fun res!500138 () Bool)

(assert (=> b!742892 (=> (not res!500138) (not e!415085))))

(assert (=> b!742892 (= res!500138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65342 res!500148) b!742884))

(assert (= (and b!742884 res!500141) b!742883))

(assert (= (and b!742883 res!500150) b!742885))

(assert (= (and b!742885 res!500142) b!742881))

(assert (= (and b!742881 res!500146) b!742872))

(assert (= (and b!742872 res!500133) b!742892))

(assert (= (and b!742892 res!500138) b!742874))

(assert (= (and b!742874 res!500145) b!742890))

(assert (= (and b!742890 res!500151) b!742889))

(assert (= (and b!742889 res!500149) b!742888))

(assert (= (and b!742888 res!500140) b!742887))

(assert (= (and b!742887 c!81750) b!742878))

(assert (= (and b!742887 (not c!81750)) b!742891))

(assert (= (and b!742887 res!500136) b!742873))

(assert (= (and b!742873 res!500147) b!742880))

(assert (= (and b!742880 res!500135) b!742875))

(assert (= (and b!742875 res!500144) b!742879))

(assert (= (and b!742880 (not res!500139)) b!742877))

(assert (= (and b!742877 (not res!500137)) b!742882))

(assert (= (and b!742882 (not res!500143)) b!742886))

(assert (= (and b!742886 (not res!500134)) b!742876))

(declare-fun m!693113 () Bool)

(assert (=> b!742882 m!693113))

(declare-fun m!693115 () Bool)

(assert (=> b!742882 m!693115))

(declare-fun m!693117 () Bool)

(assert (=> b!742885 m!693117))

(declare-fun m!693119 () Bool)

(assert (=> b!742881 m!693119))

(declare-fun m!693121 () Bool)

(assert (=> b!742892 m!693121))

(declare-fun m!693123 () Bool)

(assert (=> b!742886 m!693123))

(declare-fun m!693125 () Bool)

(assert (=> start!65342 m!693125))

(declare-fun m!693127 () Bool)

(assert (=> start!65342 m!693127))

(declare-fun m!693129 () Bool)

(assert (=> b!742879 m!693129))

(assert (=> b!742879 m!693129))

(declare-fun m!693131 () Bool)

(assert (=> b!742879 m!693131))

(assert (=> b!742883 m!693129))

(assert (=> b!742883 m!693129))

(declare-fun m!693133 () Bool)

(assert (=> b!742883 m!693133))

(declare-fun m!693135 () Bool)

(assert (=> b!742874 m!693135))

(assert (=> b!742878 m!693129))

(assert (=> b!742878 m!693129))

(declare-fun m!693137 () Bool)

(assert (=> b!742878 m!693137))

(declare-fun m!693139 () Bool)

(assert (=> b!742873 m!693139))

(declare-fun m!693141 () Bool)

(assert (=> b!742873 m!693141))

(assert (=> b!742873 m!693139))

(declare-fun m!693143 () Bool)

(assert (=> b!742873 m!693143))

(declare-fun m!693145 () Bool)

(assert (=> b!742873 m!693145))

(assert (=> b!742873 m!693113))

(assert (=> b!742891 m!693129))

(assert (=> b!742891 m!693129))

(declare-fun m!693147 () Bool)

(assert (=> b!742891 m!693147))

(declare-fun m!693149 () Bool)

(assert (=> b!742872 m!693149))

(assert (=> b!742889 m!693129))

(assert (=> b!742889 m!693129))

(declare-fun m!693151 () Bool)

(assert (=> b!742889 m!693151))

(assert (=> b!742889 m!693151))

(assert (=> b!742889 m!693129))

(declare-fun m!693153 () Bool)

(assert (=> b!742889 m!693153))

(assert (=> b!742877 m!693129))

(assert (=> b!742877 m!693129))

(assert (=> b!742877 m!693147))

(declare-fun m!693155 () Bool)

(assert (=> b!742880 m!693155))

(declare-fun m!693157 () Bool)

(assert (=> b!742880 m!693157))

(assert (=> b!742875 m!693129))

(assert (=> b!742875 m!693129))

(declare-fun m!693159 () Bool)

(assert (=> b!742875 m!693159))

(declare-fun m!693161 () Bool)

(assert (=> b!742888 m!693161))

(check-sat (not b!742881) (not b!742878) (not b!742885) (not b!742891) (not b!742883) (not b!742889) (not b!742872) (not b!742892) (not b!742886) (not b!742877) (not b!742880) (not b!742875) (not start!65342) (not b!742879) (not b!742874) (not b!742873))
(check-sat)
