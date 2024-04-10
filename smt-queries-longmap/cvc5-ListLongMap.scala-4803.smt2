; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65878 () Bool)

(assert start!65878)

(declare-fun b!759503 () Bool)

(declare-fun res!513999 () Bool)

(declare-fun e!423393 () Bool)

(assert (=> b!759503 (=> (not res!513999) (not e!423393))))

(declare-fun e!423396 () Bool)

(assert (=> b!759503 (= res!513999 e!423396)))

(declare-fun c!83134 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759503 (= c!83134 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!759504 () Bool)

(declare-datatypes ((SeekEntryResult!7739 0))(
  ( (MissingZero!7739 (index!33324 (_ BitVec 32))) (Found!7739 (index!33325 (_ BitVec 32))) (Intermediate!7739 (undefined!8551 Bool) (index!33326 (_ BitVec 32)) (x!64209 (_ BitVec 32))) (Undefined!7739) (MissingVacant!7739 (index!33327 (_ BitVec 32))) )
))
(declare-fun lt!338425 () SeekEntryResult!7739)

(declare-datatypes ((array!42051 0))(
  ( (array!42052 (arr!20139 (Array (_ BitVec 32) (_ BitVec 64))) (size!20560 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42051)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!423391 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42051 (_ BitVec 32)) SeekEntryResult!7739)

(assert (=> b!759504 (= e!423391 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20139 a!3186) j!159) a!3186 mask!3328) lt!338425))))

(declare-fun b!759505 () Bool)

(declare-fun e!423394 () Bool)

(assert (=> b!759505 (= e!423394 e!423391)))

(declare-fun res!514008 () Bool)

(assert (=> b!759505 (=> (not res!514008) (not e!423391))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42051 (_ BitVec 32)) SeekEntryResult!7739)

(assert (=> b!759505 (= res!514008 (= (seekEntryOrOpen!0 (select (arr!20139 a!3186) j!159) a!3186 mask!3328) lt!338425))))

(assert (=> b!759505 (= lt!338425 (Found!7739 j!159))))

(declare-fun b!759506 () Bool)

(declare-fun res!514007 () Bool)

(declare-fun e!423398 () Bool)

(assert (=> b!759506 (=> (not res!514007) (not e!423398))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759506 (= res!514007 (and (= (size!20560 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20560 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20560 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759507 () Bool)

(declare-fun res!514003 () Bool)

(assert (=> b!759507 (=> (not res!514003) (not e!423398))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759507 (= res!514003 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!514001 () Bool)

(assert (=> start!65878 (=> (not res!514001) (not e!423398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65878 (= res!514001 (validMask!0 mask!3328))))

(assert (=> start!65878 e!423398))

(assert (=> start!65878 true))

(declare-fun array_inv!15935 (array!42051) Bool)

(assert (=> start!65878 (array_inv!15935 a!3186)))

(declare-fun b!759508 () Bool)

(declare-fun res!514000 () Bool)

(declare-fun e!423397 () Bool)

(assert (=> b!759508 (=> (not res!514000) (not e!423397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42051 (_ BitVec 32)) Bool)

(assert (=> b!759508 (= res!514000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759509 () Bool)

(declare-fun res!514005 () Bool)

(assert (=> b!759509 (=> (not res!514005) (not e!423397))))

(declare-datatypes ((List!14141 0))(
  ( (Nil!14138) (Cons!14137 (h!15209 (_ BitVec 64)) (t!20456 List!14141)) )
))
(declare-fun arrayNoDuplicates!0 (array!42051 (_ BitVec 32) List!14141) Bool)

(assert (=> b!759509 (= res!514005 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14138))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!759510 () Bool)

(assert (=> b!759510 (= e!423396 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20139 a!3186) j!159) a!3186 mask!3328) (Found!7739 j!159)))))

(declare-fun b!759511 () Bool)

(declare-fun e!423392 () Bool)

(assert (=> b!759511 (= e!423393 e!423392)))

(declare-fun res!513998 () Bool)

(assert (=> b!759511 (=> (not res!513998) (not e!423392))))

(declare-fun lt!338428 () array!42051)

(declare-fun lt!338429 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42051 (_ BitVec 32)) SeekEntryResult!7739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759511 (= res!513998 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338429 mask!3328) lt!338429 lt!338428 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338429 lt!338428 mask!3328)))))

(assert (=> b!759511 (= lt!338429 (select (store (arr!20139 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759511 (= lt!338428 (array!42052 (store (arr!20139 a!3186) i!1173 k!2102) (size!20560 a!3186)))))

(declare-fun b!759512 () Bool)

(assert (=> b!759512 (= e!423392 (not true))))

(assert (=> b!759512 e!423394))

(declare-fun res!514009 () Bool)

(assert (=> b!759512 (=> (not res!514009) (not e!423394))))

(assert (=> b!759512 (= res!514009 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26318 0))(
  ( (Unit!26319) )
))
(declare-fun lt!338424 () Unit!26318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26318)

(assert (=> b!759512 (= lt!338424 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759513 () Bool)

(declare-fun res!514002 () Bool)

(assert (=> b!759513 (=> (not res!514002) (not e!423398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759513 (= res!514002 (validKeyInArray!0 (select (arr!20139 a!3186) j!159)))))

(declare-fun b!759514 () Bool)

(declare-fun res!513996 () Bool)

(assert (=> b!759514 (=> (not res!513996) (not e!423397))))

(assert (=> b!759514 (= res!513996 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20560 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20560 a!3186))))))

(declare-fun b!759515 () Bool)

(assert (=> b!759515 (= e!423398 e!423397)))

(declare-fun res!513997 () Bool)

(assert (=> b!759515 (=> (not res!513997) (not e!423397))))

(declare-fun lt!338426 () SeekEntryResult!7739)

(assert (=> b!759515 (= res!513997 (or (= lt!338426 (MissingZero!7739 i!1173)) (= lt!338426 (MissingVacant!7739 i!1173))))))

(assert (=> b!759515 (= lt!338426 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759516 () Bool)

(declare-fun res!514004 () Bool)

(assert (=> b!759516 (=> (not res!514004) (not e!423398))))

(assert (=> b!759516 (= res!514004 (validKeyInArray!0 k!2102))))

(declare-fun b!759517 () Bool)

(assert (=> b!759517 (= e!423397 e!423393)))

(declare-fun res!514006 () Bool)

(assert (=> b!759517 (=> (not res!514006) (not e!423393))))

(declare-fun lt!338427 () SeekEntryResult!7739)

(assert (=> b!759517 (= res!514006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20139 a!3186) j!159) mask!3328) (select (arr!20139 a!3186) j!159) a!3186 mask!3328) lt!338427))))

(assert (=> b!759517 (= lt!338427 (Intermediate!7739 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759518 () Bool)

(declare-fun res!514010 () Bool)

(assert (=> b!759518 (=> (not res!514010) (not e!423393))))

(assert (=> b!759518 (= res!514010 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20139 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759519 () Bool)

(assert (=> b!759519 (= e!423396 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20139 a!3186) j!159) a!3186 mask!3328) lt!338427))))

(assert (= (and start!65878 res!514001) b!759506))

(assert (= (and b!759506 res!514007) b!759513))

(assert (= (and b!759513 res!514002) b!759516))

(assert (= (and b!759516 res!514004) b!759507))

(assert (= (and b!759507 res!514003) b!759515))

(assert (= (and b!759515 res!513997) b!759508))

(assert (= (and b!759508 res!514000) b!759509))

(assert (= (and b!759509 res!514005) b!759514))

(assert (= (and b!759514 res!513996) b!759517))

(assert (= (and b!759517 res!514006) b!759518))

(assert (= (and b!759518 res!514010) b!759503))

(assert (= (and b!759503 c!83134) b!759519))

(assert (= (and b!759503 (not c!83134)) b!759510))

(assert (= (and b!759503 res!513999) b!759511))

(assert (= (and b!759511 res!513998) b!759512))

(assert (= (and b!759512 res!514009) b!759505))

(assert (= (and b!759505 res!514008) b!759504))

(declare-fun m!706855 () Bool)

(assert (=> b!759508 m!706855))

(declare-fun m!706857 () Bool)

(assert (=> b!759517 m!706857))

(assert (=> b!759517 m!706857))

(declare-fun m!706859 () Bool)

(assert (=> b!759517 m!706859))

(assert (=> b!759517 m!706859))

(assert (=> b!759517 m!706857))

(declare-fun m!706861 () Bool)

(assert (=> b!759517 m!706861))

(declare-fun m!706863 () Bool)

(assert (=> b!759516 m!706863))

(declare-fun m!706865 () Bool)

(assert (=> b!759512 m!706865))

(declare-fun m!706867 () Bool)

(assert (=> b!759512 m!706867))

(assert (=> b!759504 m!706857))

(assert (=> b!759504 m!706857))

(declare-fun m!706869 () Bool)

(assert (=> b!759504 m!706869))

(assert (=> b!759519 m!706857))

(assert (=> b!759519 m!706857))

(declare-fun m!706871 () Bool)

(assert (=> b!759519 m!706871))

(declare-fun m!706873 () Bool)

(assert (=> b!759507 m!706873))

(declare-fun m!706875 () Bool)

(assert (=> b!759509 m!706875))

(declare-fun m!706877 () Bool)

(assert (=> b!759518 m!706877))

(declare-fun m!706879 () Bool)

(assert (=> b!759515 m!706879))

(assert (=> b!759513 m!706857))

(assert (=> b!759513 m!706857))

(declare-fun m!706881 () Bool)

(assert (=> b!759513 m!706881))

(declare-fun m!706883 () Bool)

(assert (=> start!65878 m!706883))

(declare-fun m!706885 () Bool)

(assert (=> start!65878 m!706885))

(declare-fun m!706887 () Bool)

(assert (=> b!759511 m!706887))

(declare-fun m!706889 () Bool)

(assert (=> b!759511 m!706889))

(declare-fun m!706891 () Bool)

(assert (=> b!759511 m!706891))

(assert (=> b!759511 m!706887))

(declare-fun m!706893 () Bool)

(assert (=> b!759511 m!706893))

(declare-fun m!706895 () Bool)

(assert (=> b!759511 m!706895))

(assert (=> b!759510 m!706857))

(assert (=> b!759510 m!706857))

(declare-fun m!706897 () Bool)

(assert (=> b!759510 m!706897))

(assert (=> b!759505 m!706857))

(assert (=> b!759505 m!706857))

(declare-fun m!706899 () Bool)

(assert (=> b!759505 m!706899))

(push 1)

