; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65354 () Bool)

(assert start!65354)

(declare-fun b!742880 () Bool)

(declare-fun e!415137 () Bool)

(declare-fun e!415138 () Bool)

(assert (=> b!742880 (= e!415137 e!415138)))

(declare-fun res!500041 () Bool)

(assert (=> b!742880 (=> (not res!500041) (not e!415138))))

(declare-datatypes ((array!41527 0))(
  ( (array!41528 (arr!19877 (Array (_ BitVec 32) (_ BitVec 64))) (size!20298 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41527)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7477 0))(
  ( (MissingZero!7477 (index!32276 (_ BitVec 32))) (Found!7477 (index!32277 (_ BitVec 32))) (Intermediate!7477 (undefined!8289 Bool) (index!32278 (_ BitVec 32)) (x!63243 (_ BitVec 32))) (Undefined!7477) (MissingVacant!7477 (index!32279 (_ BitVec 32))) )
))
(declare-fun lt!330018 () SeekEntryResult!7477)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742880 (= res!500041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19877 a!3186) j!159) mask!3328) (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!330018))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742880 (= lt!330018 (Intermediate!7477 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742881 () Bool)

(declare-fun res!500034 () Bool)

(assert (=> b!742881 (=> (not res!500034) (not e!415138))))

(declare-fun e!415132 () Bool)

(assert (=> b!742881 (= res!500034 e!415132)))

(declare-fun c!81808 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!742881 (= c!81808 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!742882 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!742882 (= e!415132 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) (Found!7477 j!159)))))

(declare-fun b!742883 () Bool)

(declare-fun e!415136 () Bool)

(assert (=> b!742883 (= e!415138 e!415136)))

(declare-fun res!500039 () Bool)

(assert (=> b!742883 (=> (not res!500039) (not e!415136))))

(declare-fun lt!330020 () SeekEntryResult!7477)

(declare-fun lt!330023 () SeekEntryResult!7477)

(assert (=> b!742883 (= res!500039 (= lt!330020 lt!330023))))

(declare-fun lt!330016 () array!41527)

(declare-fun lt!330019 () (_ BitVec 64))

(assert (=> b!742883 (= lt!330023 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330019 lt!330016 mask!3328))))

(assert (=> b!742883 (= lt!330020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330019 mask!3328) lt!330019 lt!330016 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!742883 (= lt!330019 (select (store (arr!19877 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742883 (= lt!330016 (array!41528 (store (arr!19877 a!3186) i!1173 k!2102) (size!20298 a!3186)))))

(declare-fun b!742884 () Bool)

(declare-fun e!415135 () Bool)

(assert (=> b!742884 (= e!415136 (not e!415135))))

(declare-fun res!500037 () Bool)

(assert (=> b!742884 (=> res!500037 e!415135)))

(assert (=> b!742884 (= res!500037 (or (not (is-Intermediate!7477 lt!330023)) (bvslt x!1131 (x!63243 lt!330023)) (not (= x!1131 (x!63243 lt!330023))) (not (= index!1321 (index!32278 lt!330023)))))))

(declare-fun e!415133 () Bool)

(assert (=> b!742884 e!415133))

(declare-fun res!500036 () Bool)

(assert (=> b!742884 (=> (not res!500036) (not e!415133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41527 (_ BitVec 32)) Bool)

(assert (=> b!742884 (= res!500036 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25434 0))(
  ( (Unit!25435) )
))
(declare-fun lt!330017 () Unit!25434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25434)

(assert (=> b!742884 (= lt!330017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742885 () Bool)

(declare-fun res!500027 () Bool)

(assert (=> b!742885 (=> (not res!500027) (not e!415138))))

(assert (=> b!742885 (= res!500027 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19877 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742886 () Bool)

(declare-fun res!500031 () Bool)

(declare-fun e!415134 () Bool)

(assert (=> b!742886 (=> (not res!500031) (not e!415134))))

(assert (=> b!742886 (= res!500031 (and (= (size!20298 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20298 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20298 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742887 () Bool)

(declare-fun res!500033 () Bool)

(assert (=> b!742887 (=> res!500033 e!415135)))

(assert (=> b!742887 (= res!500033 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) (Found!7477 j!159))))))

(declare-fun res!500026 () Bool)

(assert (=> start!65354 (=> (not res!500026) (not e!415134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65354 (= res!500026 (validMask!0 mask!3328))))

(assert (=> start!65354 e!415134))

(assert (=> start!65354 true))

(declare-fun array_inv!15673 (array!41527) Bool)

(assert (=> start!65354 (array_inv!15673 a!3186)))

(declare-fun b!742888 () Bool)

(declare-fun res!500038 () Bool)

(assert (=> b!742888 (=> (not res!500038) (not e!415134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742888 (= res!500038 (validKeyInArray!0 (select (arr!19877 a!3186) j!159)))))

(declare-fun b!742889 () Bool)

(assert (=> b!742889 (= e!415132 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!330018))))

(declare-fun b!742890 () Bool)

(declare-fun res!500032 () Bool)

(assert (=> b!742890 (=> res!500032 e!415135)))

(assert (=> b!742890 (= res!500032 (or (not (= (select (store (arr!19877 a!3186) i!1173 k!2102) index!1321) lt!330019)) (undefined!8289 lt!330023) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742891 () Bool)

(declare-fun res!500040 () Bool)

(assert (=> b!742891 (=> (not res!500040) (not e!415134))))

(assert (=> b!742891 (= res!500040 (validKeyInArray!0 k!2102))))

(declare-fun b!742892 () Bool)

(assert (=> b!742892 (= e!415135 (validKeyInArray!0 lt!330019))))

(declare-fun b!742893 () Bool)

(declare-fun res!500025 () Bool)

(assert (=> b!742893 (=> (not res!500025) (not e!415137))))

(assert (=> b!742893 (= res!500025 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20298 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20298 a!3186))))))

(declare-fun b!742894 () Bool)

(declare-fun res!500030 () Bool)

(assert (=> b!742894 (=> (not res!500030) (not e!415134))))

(declare-fun arrayContainsKey!0 (array!41527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742894 (= res!500030 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742895 () Bool)

(declare-fun e!415139 () Bool)

(assert (=> b!742895 (= e!415133 e!415139)))

(declare-fun res!500029 () Bool)

(assert (=> b!742895 (=> (not res!500029) (not e!415139))))

(declare-fun lt!330022 () SeekEntryResult!7477)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41527 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!742895 (= res!500029 (= (seekEntryOrOpen!0 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!330022))))

(assert (=> b!742895 (= lt!330022 (Found!7477 j!159))))

(declare-fun b!742896 () Bool)

(assert (=> b!742896 (= e!415134 e!415137)))

(declare-fun res!500035 () Bool)

(assert (=> b!742896 (=> (not res!500035) (not e!415137))))

(declare-fun lt!330021 () SeekEntryResult!7477)

(assert (=> b!742896 (= res!500035 (or (= lt!330021 (MissingZero!7477 i!1173)) (= lt!330021 (MissingVacant!7477 i!1173))))))

(assert (=> b!742896 (= lt!330021 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742897 () Bool)

(assert (=> b!742897 (= e!415139 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19877 a!3186) j!159) a!3186 mask!3328) lt!330022))))

(declare-fun b!742898 () Bool)

(declare-fun res!500042 () Bool)

(assert (=> b!742898 (=> (not res!500042) (not e!415137))))

(assert (=> b!742898 (= res!500042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742899 () Bool)

(declare-fun res!500028 () Bool)

(assert (=> b!742899 (=> (not res!500028) (not e!415137))))

(declare-datatypes ((List!13879 0))(
  ( (Nil!13876) (Cons!13875 (h!14947 (_ BitVec 64)) (t!20194 List!13879)) )
))
(declare-fun arrayNoDuplicates!0 (array!41527 (_ BitVec 32) List!13879) Bool)

(assert (=> b!742899 (= res!500028 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13876))))

(assert (= (and start!65354 res!500026) b!742886))

(assert (= (and b!742886 res!500031) b!742888))

(assert (= (and b!742888 res!500038) b!742891))

(assert (= (and b!742891 res!500040) b!742894))

(assert (= (and b!742894 res!500030) b!742896))

(assert (= (and b!742896 res!500035) b!742898))

(assert (= (and b!742898 res!500042) b!742899))

(assert (= (and b!742899 res!500028) b!742893))

(assert (= (and b!742893 res!500025) b!742880))

(assert (= (and b!742880 res!500041) b!742885))

(assert (= (and b!742885 res!500027) b!742881))

(assert (= (and b!742881 c!81808) b!742889))

(assert (= (and b!742881 (not c!81808)) b!742882))

(assert (= (and b!742881 res!500034) b!742883))

(assert (= (and b!742883 res!500039) b!742884))

(assert (= (and b!742884 res!500036) b!742895))

(assert (= (and b!742895 res!500029) b!742897))

(assert (= (and b!742884 (not res!500037)) b!742887))

(assert (= (and b!742887 (not res!500033)) b!742890))

(assert (= (and b!742890 (not res!500032)) b!742892))

(declare-fun m!693671 () Bool)

(assert (=> b!742888 m!693671))

(assert (=> b!742888 m!693671))

(declare-fun m!693673 () Bool)

(assert (=> b!742888 m!693673))

(declare-fun m!693675 () Bool)

(assert (=> b!742894 m!693675))

(declare-fun m!693677 () Bool)

(assert (=> b!742898 m!693677))

(assert (=> b!742897 m!693671))

(assert (=> b!742897 m!693671))

(declare-fun m!693679 () Bool)

(assert (=> b!742897 m!693679))

(declare-fun m!693681 () Bool)

(assert (=> b!742883 m!693681))

(declare-fun m!693683 () Bool)

(assert (=> b!742883 m!693683))

(assert (=> b!742883 m!693683))

(declare-fun m!693685 () Bool)

(assert (=> b!742883 m!693685))

(declare-fun m!693687 () Bool)

(assert (=> b!742883 m!693687))

(declare-fun m!693689 () Bool)

(assert (=> b!742883 m!693689))

(declare-fun m!693691 () Bool)

(assert (=> b!742899 m!693691))

(declare-fun m!693693 () Bool)

(assert (=> b!742884 m!693693))

(declare-fun m!693695 () Bool)

(assert (=> b!742884 m!693695))

(declare-fun m!693697 () Bool)

(assert (=> b!742892 m!693697))

(assert (=> b!742880 m!693671))

(assert (=> b!742880 m!693671))

(declare-fun m!693699 () Bool)

(assert (=> b!742880 m!693699))

(assert (=> b!742880 m!693699))

(assert (=> b!742880 m!693671))

(declare-fun m!693701 () Bool)

(assert (=> b!742880 m!693701))

(declare-fun m!693703 () Bool)

(assert (=> b!742896 m!693703))

(assert (=> b!742890 m!693687))

(declare-fun m!693705 () Bool)

(assert (=> b!742890 m!693705))

(assert (=> b!742889 m!693671))

(assert (=> b!742889 m!693671))

(declare-fun m!693707 () Bool)

(assert (=> b!742889 m!693707))

(declare-fun m!693709 () Bool)

(assert (=> b!742885 m!693709))

(assert (=> b!742887 m!693671))

(assert (=> b!742887 m!693671))

(declare-fun m!693711 () Bool)

(assert (=> b!742887 m!693711))

(declare-fun m!693713 () Bool)

(assert (=> b!742891 m!693713))

(assert (=> b!742895 m!693671))

(assert (=> b!742895 m!693671))

(declare-fun m!693715 () Bool)

(assert (=> b!742895 m!693715))

(declare-fun m!693717 () Bool)

(assert (=> start!65354 m!693717))

(declare-fun m!693719 () Bool)

(assert (=> start!65354 m!693719))

(assert (=> b!742882 m!693671))

(assert (=> b!742882 m!693671))

(assert (=> b!742882 m!693711))

(push 1)

