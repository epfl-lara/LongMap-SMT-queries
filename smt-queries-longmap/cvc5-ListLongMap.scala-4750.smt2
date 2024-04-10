; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65560 () Bool)

(assert start!65560)

(declare-fun b!748864 () Bool)

(declare-fun res!505210 () Bool)

(declare-fun e!417922 () Bool)

(assert (=> b!748864 (=> (not res!505210) (not e!417922))))

(declare-datatypes ((array!41733 0))(
  ( (array!41734 (arr!19980 (Array (_ BitVec 32) (_ BitVec 64))) (size!20401 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41733)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!748864 (= res!505210 (and (= (size!20401 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20401 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20401 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748865 () Bool)

(declare-fun e!417925 () Bool)

(declare-fun e!417926 () Bool)

(assert (=> b!748865 (= e!417925 (not e!417926))))

(declare-fun res!505220 () Bool)

(assert (=> b!748865 (=> res!505220 e!417926)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7580 0))(
  ( (MissingZero!7580 (index!32688 (_ BitVec 32))) (Found!7580 (index!32689 (_ BitVec 32))) (Intermediate!7580 (undefined!8392 Bool) (index!32690 (_ BitVec 32)) (x!63626 (_ BitVec 32))) (Undefined!7580) (MissingVacant!7580 (index!32691 (_ BitVec 32))) )
))
(declare-fun lt!332915 () SeekEntryResult!7580)

(assert (=> b!748865 (= res!505220 (or (not (is-Intermediate!7580 lt!332915)) (bvslt x!1131 (x!63626 lt!332915)) (not (= x!1131 (x!63626 lt!332915))) (not (= index!1321 (index!32690 lt!332915)))))))

(declare-fun e!417924 () Bool)

(assert (=> b!748865 e!417924))

(declare-fun res!505215 () Bool)

(assert (=> b!748865 (=> (not res!505215) (not e!417924))))

(declare-fun lt!332914 () SeekEntryResult!7580)

(declare-fun lt!332912 () SeekEntryResult!7580)

(assert (=> b!748865 (= res!505215 (= lt!332914 lt!332912))))

(assert (=> b!748865 (= lt!332912 (Found!7580 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41733 (_ BitVec 32)) SeekEntryResult!7580)

(assert (=> b!748865 (= lt!332914 (seekEntryOrOpen!0 (select (arr!19980 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41733 (_ BitVec 32)) Bool)

(assert (=> b!748865 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25700 0))(
  ( (Unit!25701) )
))
(declare-fun lt!332913 () Unit!25700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25700)

(assert (=> b!748865 (= lt!332913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748866 () Bool)

(declare-fun res!505223 () Bool)

(assert (=> b!748866 (=> res!505223 e!417926)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41733 (_ BitVec 32)) SeekEntryResult!7580)

(assert (=> b!748866 (= res!505223 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19980 a!3186) j!159) a!3186 mask!3328) lt!332912)))))

(declare-fun b!748867 () Bool)

(declare-fun e!417921 () Bool)

(assert (=> b!748867 (= e!417922 e!417921)))

(declare-fun res!505214 () Bool)

(assert (=> b!748867 (=> (not res!505214) (not e!417921))))

(declare-fun lt!332907 () SeekEntryResult!7580)

(assert (=> b!748867 (= res!505214 (or (= lt!332907 (MissingZero!7580 i!1173)) (= lt!332907 (MissingVacant!7580 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!748867 (= lt!332907 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748868 () Bool)

(declare-fun res!505208 () Bool)

(assert (=> b!748868 (=> (not res!505208) (not e!417921))))

(declare-datatypes ((List!13982 0))(
  ( (Nil!13979) (Cons!13978 (h!15050 (_ BitVec 64)) (t!20297 List!13982)) )
))
(declare-fun arrayNoDuplicates!0 (array!41733 (_ BitVec 32) List!13982) Bool)

(assert (=> b!748868 (= res!505208 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13979))))

(declare-fun b!748869 () Bool)

(declare-fun res!505211 () Bool)

(assert (=> b!748869 (=> (not res!505211) (not e!417922))))

(declare-fun arrayContainsKey!0 (array!41733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748869 (= res!505211 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748870 () Bool)

(declare-fun e!417927 () Bool)

(assert (=> b!748870 (= e!417927 e!417925)))

(declare-fun res!505213 () Bool)

(assert (=> b!748870 (=> (not res!505213) (not e!417925))))

(declare-fun lt!332906 () SeekEntryResult!7580)

(assert (=> b!748870 (= res!505213 (= lt!332906 lt!332915))))

(declare-fun lt!332908 () (_ BitVec 64))

(declare-fun lt!332911 () array!41733)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41733 (_ BitVec 32)) SeekEntryResult!7580)

(assert (=> b!748870 (= lt!332915 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332908 lt!332911 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748870 (= lt!332906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332908 mask!3328) lt!332908 lt!332911 mask!3328))))

(assert (=> b!748870 (= lt!332908 (select (store (arr!19980 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748870 (= lt!332911 (array!41734 (store (arr!19980 a!3186) i!1173 k!2102) (size!20401 a!3186)))))

(declare-fun b!748871 () Bool)

(declare-fun res!505219 () Bool)

(assert (=> b!748871 (=> res!505219 e!417926)))

(assert (=> b!748871 (= res!505219 (= (select (store (arr!19980 a!3186) i!1173 k!2102) index!1321) lt!332908))))

(declare-fun b!748873 () Bool)

(declare-fun e!417929 () Unit!25700)

(declare-fun Unit!25702 () Unit!25700)

(assert (=> b!748873 (= e!417929 Unit!25702)))

(declare-fun b!748874 () Bool)

(declare-fun res!505217 () Bool)

(assert (=> b!748874 (=> (not res!505217) (not e!417921))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748874 (= res!505217 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20401 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20401 a!3186))))))

(declare-fun b!748875 () Bool)

(declare-fun res!505207 () Bool)

(assert (=> b!748875 (=> (not res!505207) (not e!417927))))

(assert (=> b!748875 (= res!505207 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19980 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748876 () Bool)

(declare-fun e!417923 () Bool)

(declare-fun lt!332909 () SeekEntryResult!7580)

(assert (=> b!748876 (= e!417923 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19980 a!3186) j!159) a!3186 mask!3328) lt!332909))))

(declare-fun b!748877 () Bool)

(assert (=> b!748877 (= e!417921 e!417927)))

(declare-fun res!505218 () Bool)

(assert (=> b!748877 (=> (not res!505218) (not e!417927))))

(assert (=> b!748877 (= res!505218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19980 a!3186) j!159) mask!3328) (select (arr!19980 a!3186) j!159) a!3186 mask!3328) lt!332909))))

(assert (=> b!748877 (= lt!332909 (Intermediate!7580 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748878 () Bool)

(assert (=> b!748878 (= e!417924 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19980 a!3186) j!159) a!3186 mask!3328) lt!332912))))

(declare-fun b!748879 () Bool)

(declare-fun res!505222 () Bool)

(assert (=> b!748879 (=> (not res!505222) (not e!417927))))

(assert (=> b!748879 (= res!505222 e!417923)))

(declare-fun c!82209 () Bool)

(assert (=> b!748879 (= c!82209 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748880 () Bool)

(declare-fun res!505216 () Bool)

(assert (=> b!748880 (=> (not res!505216) (not e!417921))))

(assert (=> b!748880 (= res!505216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748881 () Bool)

(declare-fun res!505221 () Bool)

(assert (=> b!748881 (=> (not res!505221) (not e!417922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748881 (= res!505221 (validKeyInArray!0 (select (arr!19980 a!3186) j!159)))))

(declare-fun b!748882 () Bool)

(assert (=> b!748882 (= e!417926 true)))

(assert (=> b!748882 (= (select (store (arr!19980 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332910 () Unit!25700)

(assert (=> b!748882 (= lt!332910 e!417929)))

(declare-fun c!82210 () Bool)

(assert (=> b!748882 (= c!82210 (= (select (store (arr!19980 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748883 () Bool)

(assert (=> b!748883 (= e!417923 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19980 a!3186) j!159) a!3186 mask!3328) (Found!7580 j!159)))))

(declare-fun b!748884 () Bool)

(declare-fun Unit!25703 () Unit!25700)

(assert (=> b!748884 (= e!417929 Unit!25703)))

(assert (=> b!748884 false))

(declare-fun res!505212 () Bool)

(assert (=> start!65560 (=> (not res!505212) (not e!417922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65560 (= res!505212 (validMask!0 mask!3328))))

(assert (=> start!65560 e!417922))

(assert (=> start!65560 true))

(declare-fun array_inv!15776 (array!41733) Bool)

(assert (=> start!65560 (array_inv!15776 a!3186)))

(declare-fun b!748872 () Bool)

(declare-fun res!505209 () Bool)

(assert (=> b!748872 (=> (not res!505209) (not e!417922))))

(assert (=> b!748872 (= res!505209 (validKeyInArray!0 k!2102))))

(assert (= (and start!65560 res!505212) b!748864))

(assert (= (and b!748864 res!505210) b!748881))

(assert (= (and b!748881 res!505221) b!748872))

(assert (= (and b!748872 res!505209) b!748869))

(assert (= (and b!748869 res!505211) b!748867))

(assert (= (and b!748867 res!505214) b!748880))

(assert (= (and b!748880 res!505216) b!748868))

(assert (= (and b!748868 res!505208) b!748874))

(assert (= (and b!748874 res!505217) b!748877))

(assert (= (and b!748877 res!505218) b!748875))

(assert (= (and b!748875 res!505207) b!748879))

(assert (= (and b!748879 c!82209) b!748876))

(assert (= (and b!748879 (not c!82209)) b!748883))

(assert (= (and b!748879 res!505222) b!748870))

(assert (= (and b!748870 res!505213) b!748865))

(assert (= (and b!748865 res!505215) b!748878))

(assert (= (and b!748865 (not res!505220)) b!748866))

(assert (= (and b!748866 (not res!505223)) b!748871))

(assert (= (and b!748871 (not res!505219)) b!748882))

(assert (= (and b!748882 c!82210) b!748884))

(assert (= (and b!748882 (not c!82210)) b!748873))

(declare-fun m!698605 () Bool)

(assert (=> b!748881 m!698605))

(assert (=> b!748881 m!698605))

(declare-fun m!698607 () Bool)

(assert (=> b!748881 m!698607))

(declare-fun m!698609 () Bool)

(assert (=> b!748871 m!698609))

(declare-fun m!698611 () Bool)

(assert (=> b!748871 m!698611))

(declare-fun m!698613 () Bool)

(assert (=> b!748875 m!698613))

(assert (=> b!748883 m!698605))

(assert (=> b!748883 m!698605))

(declare-fun m!698615 () Bool)

(assert (=> b!748883 m!698615))

(declare-fun m!698617 () Bool)

(assert (=> b!748869 m!698617))

(assert (=> b!748878 m!698605))

(assert (=> b!748878 m!698605))

(declare-fun m!698619 () Bool)

(assert (=> b!748878 m!698619))

(assert (=> b!748877 m!698605))

(assert (=> b!748877 m!698605))

(declare-fun m!698621 () Bool)

(assert (=> b!748877 m!698621))

(assert (=> b!748877 m!698621))

(assert (=> b!748877 m!698605))

(declare-fun m!698623 () Bool)

(assert (=> b!748877 m!698623))

(assert (=> b!748866 m!698605))

(assert (=> b!748866 m!698605))

(assert (=> b!748866 m!698615))

(assert (=> b!748876 m!698605))

(assert (=> b!748876 m!698605))

(declare-fun m!698625 () Bool)

(assert (=> b!748876 m!698625))

(declare-fun m!698627 () Bool)

(assert (=> b!748870 m!698627))

(declare-fun m!698629 () Bool)

(assert (=> b!748870 m!698629))

(declare-fun m!698631 () Bool)

(assert (=> b!748870 m!698631))

(assert (=> b!748870 m!698609))

(declare-fun m!698633 () Bool)

(assert (=> b!748870 m!698633))

(assert (=> b!748870 m!698627))

(assert (=> b!748882 m!698609))

(assert (=> b!748882 m!698611))

(declare-fun m!698635 () Bool)

(assert (=> b!748880 m!698635))

(declare-fun m!698637 () Bool)

(assert (=> start!65560 m!698637))

(declare-fun m!698639 () Bool)

(assert (=> start!65560 m!698639))

(declare-fun m!698641 () Bool)

(assert (=> b!748868 m!698641))

(declare-fun m!698643 () Bool)

(assert (=> b!748872 m!698643))

(declare-fun m!698645 () Bool)

(assert (=> b!748867 m!698645))

(assert (=> b!748865 m!698605))

(assert (=> b!748865 m!698605))

(declare-fun m!698647 () Bool)

(assert (=> b!748865 m!698647))

(declare-fun m!698649 () Bool)

(assert (=> b!748865 m!698649))

(declare-fun m!698651 () Bool)

(assert (=> b!748865 m!698651))

(push 1)

