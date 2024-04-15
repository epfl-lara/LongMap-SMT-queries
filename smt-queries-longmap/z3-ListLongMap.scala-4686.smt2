; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65156 () Bool)

(assert start!65156)

(declare-fun b!736866 () Bool)

(declare-fun res!495325 () Bool)

(declare-fun e!412164 () Bool)

(assert (=> b!736866 (=> (not res!495325) (not e!412164))))

(declare-fun e!412160 () Bool)

(assert (=> b!736866 (= res!495325 e!412160)))

(declare-fun c!81153 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736866 (= c!81153 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736867 () Bool)

(declare-fun res!495338 () Bool)

(declare-fun e!412167 () Bool)

(assert (=> b!736867 (=> (not res!495338) (not e!412167))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736867 (= res!495338 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41346 0))(
  ( (array!41347 (arr!19787 (Array (_ BitVec 32) (_ BitVec 64))) (size!20208 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41346)

(declare-fun b!736868 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7384 0))(
  ( (MissingZero!7384 (index!31904 (_ BitVec 32))) (Found!7384 (index!31905 (_ BitVec 32))) (Intermediate!7384 (undefined!8196 Bool) (index!31906 (_ BitVec 32)) (x!62913 (_ BitVec 32))) (Undefined!7384) (MissingVacant!7384 (index!31907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41346 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736868 (= e!412160 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) (Found!7384 j!159)))))

(declare-fun b!736869 () Bool)

(declare-datatypes ((Unit!25112 0))(
  ( (Unit!25113) )
))
(declare-fun e!412161 () Unit!25112)

(declare-fun Unit!25114 () Unit!25112)

(assert (=> b!736869 (= e!412161 Unit!25114)))

(declare-fun lt!326756 () SeekEntryResult!7384)

(assert (=> b!736869 (= lt!326756 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326760 () (_ BitVec 32))

(declare-fun lt!326757 () SeekEntryResult!7384)

(assert (=> b!736869 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326760 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326757)))

(declare-fun b!736870 () Bool)

(declare-fun e!412168 () Bool)

(assert (=> b!736870 (= e!412168 true)))

(declare-fun lt!326761 () array!41346)

(declare-fun lt!326752 () SeekEntryResult!7384)

(declare-fun lt!326762 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41346 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736870 (= lt!326752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326760 lt!326762 lt!326761 mask!3328))))

(declare-fun b!736871 () Bool)

(declare-fun res!495339 () Bool)

(declare-fun e!412157 () Bool)

(assert (=> b!736871 (=> (not res!495339) (not e!412157))))

(declare-datatypes ((List!13828 0))(
  ( (Nil!13825) (Cons!13824 (h!14896 (_ BitVec 64)) (t!20134 List!13828)) )
))
(declare-fun arrayNoDuplicates!0 (array!41346 (_ BitVec 32) List!13828) Bool)

(assert (=> b!736871 (= res!495339 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13825))))

(declare-fun e!412162 () Bool)

(declare-fun b!736872 () Bool)

(declare-fun lt!326764 () SeekEntryResult!7384)

(assert (=> b!736872 (= e!412162 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326760 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326764)))))

(declare-fun b!736873 () Bool)

(assert (=> b!736873 (= e!412167 e!412157)))

(declare-fun res!495335 () Bool)

(assert (=> b!736873 (=> (not res!495335) (not e!412157))))

(declare-fun lt!326758 () SeekEntryResult!7384)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736873 (= res!495335 (or (= lt!326758 (MissingZero!7384 i!1173)) (= lt!326758 (MissingVacant!7384 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41346 (_ BitVec 32)) SeekEntryResult!7384)

(assert (=> b!736873 (= lt!326758 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736874 () Bool)

(declare-fun e!412163 () Bool)

(assert (=> b!736874 (= e!412163 e!412168)))

(declare-fun res!495329 () Bool)

(assert (=> b!736874 (=> res!495329 e!412168)))

(assert (=> b!736874 (= res!495329 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326760 #b00000000000000000000000000000000) (bvsge lt!326760 (size!20208 a!3186))))))

(declare-fun lt!326763 () Unit!25112)

(assert (=> b!736874 (= lt!326763 e!412161)))

(declare-fun c!81151 () Bool)

(declare-fun lt!326759 () Bool)

(assert (=> b!736874 (= c!81151 lt!326759)))

(assert (=> b!736874 (= lt!326759 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736874 (= lt!326760 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736875 () Bool)

(declare-fun res!495337 () Bool)

(assert (=> b!736875 (=> (not res!495337) (not e!412164))))

(assert (=> b!736875 (= res!495337 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19787 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!495334 () Bool)

(assert (=> start!65156 (=> (not res!495334) (not e!412167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65156 (= res!495334 (validMask!0 mask!3328))))

(assert (=> start!65156 e!412167))

(assert (=> start!65156 true))

(declare-fun array_inv!15670 (array!41346) Bool)

(assert (=> start!65156 (array_inv!15670 a!3186)))

(declare-fun b!736876 () Bool)

(declare-fun res!495336 () Bool)

(assert (=> b!736876 (=> res!495336 e!412168)))

(assert (=> b!736876 (= res!495336 e!412162)))

(declare-fun c!81152 () Bool)

(assert (=> b!736876 (= c!81152 lt!326759)))

(declare-fun b!736877 () Bool)

(declare-fun res!495331 () Bool)

(assert (=> b!736877 (=> (not res!495331) (not e!412157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41346 (_ BitVec 32)) Bool)

(assert (=> b!736877 (= res!495331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736878 () Bool)

(declare-fun Unit!25115 () Unit!25112)

(assert (=> b!736878 (= e!412161 Unit!25115)))

(assert (=> b!736878 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326760 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326764)))

(declare-fun e!412166 () Bool)

(declare-fun b!736879 () Bool)

(declare-fun lt!326754 () SeekEntryResult!7384)

(assert (=> b!736879 (= e!412166 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326754))))

(declare-fun b!736880 () Bool)

(assert (=> b!736880 (= e!412160 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326764))))

(declare-fun b!736881 () Bool)

(declare-fun res!495341 () Bool)

(assert (=> b!736881 (=> (not res!495341) (not e!412157))))

(assert (=> b!736881 (= res!495341 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20208 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20208 a!3186))))))

(declare-fun b!736882 () Bool)

(declare-fun res!495327 () Bool)

(assert (=> b!736882 (=> (not res!495327) (not e!412167))))

(declare-fun arrayContainsKey!0 (array!41346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736882 (= res!495327 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736883 () Bool)

(declare-fun e!412159 () Bool)

(assert (=> b!736883 (= e!412159 (not e!412163))))

(declare-fun res!495330 () Bool)

(assert (=> b!736883 (=> res!495330 e!412163)))

(declare-fun lt!326753 () SeekEntryResult!7384)

(get-info :version)

(assert (=> b!736883 (= res!495330 (or (not ((_ is Intermediate!7384) lt!326753)) (bvsge x!1131 (x!62913 lt!326753))))))

(assert (=> b!736883 (= lt!326757 (Found!7384 j!159))))

(declare-fun e!412158 () Bool)

(assert (=> b!736883 e!412158))

(declare-fun res!495328 () Bool)

(assert (=> b!736883 (=> (not res!495328) (not e!412158))))

(assert (=> b!736883 (= res!495328 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326765 () Unit!25112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25112)

(assert (=> b!736883 (= lt!326765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736884 () Bool)

(declare-fun res!495340 () Bool)

(assert (=> b!736884 (=> (not res!495340) (not e!412167))))

(assert (=> b!736884 (= res!495340 (validKeyInArray!0 (select (arr!19787 a!3186) j!159)))))

(declare-fun b!736885 () Bool)

(assert (=> b!736885 (= e!412157 e!412164)))

(declare-fun res!495342 () Bool)

(assert (=> b!736885 (=> (not res!495342) (not e!412164))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736885 (= res!495342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19787 a!3186) j!159) mask!3328) (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326764))))

(assert (=> b!736885 (= lt!326764 (Intermediate!7384 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736886 () Bool)

(assert (=> b!736886 (= e!412158 e!412166)))

(declare-fun res!495333 () Bool)

(assert (=> b!736886 (=> (not res!495333) (not e!412166))))

(assert (=> b!736886 (= res!495333 (= (seekEntryOrOpen!0 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326754))))

(assert (=> b!736886 (= lt!326754 (Found!7384 j!159))))

(declare-fun b!736887 () Bool)

(assert (=> b!736887 (= e!412164 e!412159)))

(declare-fun res!495332 () Bool)

(assert (=> b!736887 (=> (not res!495332) (not e!412159))))

(declare-fun lt!326755 () SeekEntryResult!7384)

(assert (=> b!736887 (= res!495332 (= lt!326755 lt!326753))))

(assert (=> b!736887 (= lt!326753 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326762 lt!326761 mask!3328))))

(assert (=> b!736887 (= lt!326755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326762 mask!3328) lt!326762 lt!326761 mask!3328))))

(assert (=> b!736887 (= lt!326762 (select (store (arr!19787 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736887 (= lt!326761 (array!41347 (store (arr!19787 a!3186) i!1173 k0!2102) (size!20208 a!3186)))))

(declare-fun b!736888 () Bool)

(declare-fun res!495326 () Bool)

(assert (=> b!736888 (=> (not res!495326) (not e!412167))))

(assert (=> b!736888 (= res!495326 (and (= (size!20208 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20208 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20208 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736889 () Bool)

(assert (=> b!736889 (= e!412162 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326760 resIntermediateIndex!5 (select (arr!19787 a!3186) j!159) a!3186 mask!3328) lt!326757)))))

(assert (= (and start!65156 res!495334) b!736888))

(assert (= (and b!736888 res!495326) b!736884))

(assert (= (and b!736884 res!495340) b!736867))

(assert (= (and b!736867 res!495338) b!736882))

(assert (= (and b!736882 res!495327) b!736873))

(assert (= (and b!736873 res!495335) b!736877))

(assert (= (and b!736877 res!495331) b!736871))

(assert (= (and b!736871 res!495339) b!736881))

(assert (= (and b!736881 res!495341) b!736885))

(assert (= (and b!736885 res!495342) b!736875))

(assert (= (and b!736875 res!495337) b!736866))

(assert (= (and b!736866 c!81153) b!736880))

(assert (= (and b!736866 (not c!81153)) b!736868))

(assert (= (and b!736866 res!495325) b!736887))

(assert (= (and b!736887 res!495332) b!736883))

(assert (= (and b!736883 res!495328) b!736886))

(assert (= (and b!736886 res!495333) b!736879))

(assert (= (and b!736883 (not res!495330)) b!736874))

(assert (= (and b!736874 c!81151) b!736878))

(assert (= (and b!736874 (not c!81151)) b!736869))

(assert (= (and b!736874 (not res!495329)) b!736876))

(assert (= (and b!736876 c!81152) b!736872))

(assert (= (and b!736876 (not c!81152)) b!736889))

(assert (= (and b!736876 (not res!495336)) b!736870))

(declare-fun m!688319 () Bool)

(assert (=> b!736867 m!688319))

(declare-fun m!688321 () Bool)

(assert (=> b!736889 m!688321))

(assert (=> b!736889 m!688321))

(declare-fun m!688323 () Bool)

(assert (=> b!736889 m!688323))

(declare-fun m!688325 () Bool)

(assert (=> start!65156 m!688325))

(declare-fun m!688327 () Bool)

(assert (=> start!65156 m!688327))

(declare-fun m!688329 () Bool)

(assert (=> b!736875 m!688329))

(assert (=> b!736885 m!688321))

(assert (=> b!736885 m!688321))

(declare-fun m!688331 () Bool)

(assert (=> b!736885 m!688331))

(assert (=> b!736885 m!688331))

(assert (=> b!736885 m!688321))

(declare-fun m!688333 () Bool)

(assert (=> b!736885 m!688333))

(declare-fun m!688335 () Bool)

(assert (=> b!736883 m!688335))

(declare-fun m!688337 () Bool)

(assert (=> b!736883 m!688337))

(declare-fun m!688339 () Bool)

(assert (=> b!736887 m!688339))

(declare-fun m!688341 () Bool)

(assert (=> b!736887 m!688341))

(assert (=> b!736887 m!688339))

(declare-fun m!688343 () Bool)

(assert (=> b!736887 m!688343))

(declare-fun m!688345 () Bool)

(assert (=> b!736887 m!688345))

(declare-fun m!688347 () Bool)

(assert (=> b!736887 m!688347))

(declare-fun m!688349 () Bool)

(assert (=> b!736873 m!688349))

(declare-fun m!688351 () Bool)

(assert (=> b!736874 m!688351))

(assert (=> b!736878 m!688321))

(assert (=> b!736878 m!688321))

(declare-fun m!688353 () Bool)

(assert (=> b!736878 m!688353))

(assert (=> b!736886 m!688321))

(assert (=> b!736886 m!688321))

(declare-fun m!688355 () Bool)

(assert (=> b!736886 m!688355))

(assert (=> b!736879 m!688321))

(assert (=> b!736879 m!688321))

(declare-fun m!688357 () Bool)

(assert (=> b!736879 m!688357))

(assert (=> b!736872 m!688321))

(assert (=> b!736872 m!688321))

(assert (=> b!736872 m!688353))

(declare-fun m!688359 () Bool)

(assert (=> b!736870 m!688359))

(assert (=> b!736884 m!688321))

(assert (=> b!736884 m!688321))

(declare-fun m!688361 () Bool)

(assert (=> b!736884 m!688361))

(declare-fun m!688363 () Bool)

(assert (=> b!736882 m!688363))

(assert (=> b!736869 m!688321))

(assert (=> b!736869 m!688321))

(declare-fun m!688365 () Bool)

(assert (=> b!736869 m!688365))

(assert (=> b!736869 m!688321))

(assert (=> b!736869 m!688323))

(declare-fun m!688367 () Bool)

(assert (=> b!736877 m!688367))

(assert (=> b!736868 m!688321))

(assert (=> b!736868 m!688321))

(assert (=> b!736868 m!688365))

(declare-fun m!688369 () Bool)

(assert (=> b!736871 m!688369))

(assert (=> b!736880 m!688321))

(assert (=> b!736880 m!688321))

(declare-fun m!688371 () Bool)

(assert (=> b!736880 m!688371))

(check-sat (not b!736872) (not b!736873) (not b!736874) (not b!736877) (not b!736886) (not b!736878) (not b!736885) (not b!736887) (not b!736867) (not b!736871) (not b!736883) (not b!736870) (not b!736868) (not b!736884) (not b!736882) (not start!65156) (not b!736880) (not b!736879) (not b!736869) (not b!736889))
(check-sat)
