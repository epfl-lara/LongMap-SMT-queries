; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45484 () Bool)

(assert start!45484)

(declare-fun b!500853 () Bool)

(declare-fun e!293426 () Bool)

(declare-fun e!293423 () Bool)

(assert (=> b!500853 (= e!293426 (not e!293423))))

(declare-fun res!302633 () Bool)

(assert (=> b!500853 (=> res!302633 e!293423)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227397 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4003 0))(
  ( (MissingZero!4003 (index!18194 (_ BitVec 32))) (Found!4003 (index!18195 (_ BitVec 32))) (Intermediate!4003 (undefined!4815 Bool) (index!18196 (_ BitVec 32)) (x!47224 (_ BitVec 32))) (Undefined!4003) (MissingVacant!4003 (index!18197 (_ BitVec 32))) )
))
(declare-fun lt!227392 () SeekEntryResult!4003)

(declare-datatypes ((array!32309 0))(
  ( (array!32310 (arr!15536 (Array (_ BitVec 32) (_ BitVec 64))) (size!15900 (_ BitVec 32))) )
))
(declare-fun lt!227396 () array!32309)

(declare-fun lt!227390 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32309 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!500853 (= res!302633 (= lt!227392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227397 lt!227390 lt!227396 mask!3524)))))

(declare-fun a!3235 () array!32309)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!227389 () (_ BitVec 32))

(assert (=> b!500853 (= lt!227392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227389 (select (arr!15536 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500853 (= lt!227397 (toIndex!0 lt!227390 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500853 (= lt!227390 (select (store (arr!15536 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500853 (= lt!227389 (toIndex!0 (select (arr!15536 a!3235) j!176) mask!3524))))

(assert (=> b!500853 (= lt!227396 (array!32310 (store (arr!15536 a!3235) i!1204 k!2280) (size!15900 a!3235)))))

(declare-fun e!293424 () Bool)

(assert (=> b!500853 e!293424))

(declare-fun res!302638 () Bool)

(assert (=> b!500853 (=> (not res!302638) (not e!293424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32309 (_ BitVec 32)) Bool)

(assert (=> b!500853 (= res!302638 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15088 0))(
  ( (Unit!15089) )
))
(declare-fun lt!227394 () Unit!15088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15088)

(assert (=> b!500853 (= lt!227394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500854 () Bool)

(declare-fun e!293427 () Bool)

(assert (=> b!500854 (= e!293427 true)))

(declare-fun lt!227395 () SeekEntryResult!4003)

(assert (=> b!500854 (= lt!227395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227389 lt!227390 lt!227396 mask!3524))))

(declare-fun res!302630 () Bool)

(declare-fun e!293429 () Bool)

(assert (=> start!45484 (=> (not res!302630) (not e!293429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45484 (= res!302630 (validMask!0 mask!3524))))

(assert (=> start!45484 e!293429))

(assert (=> start!45484 true))

(declare-fun array_inv!11332 (array!32309) Bool)

(assert (=> start!45484 (array_inv!11332 a!3235)))

(declare-fun b!500855 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32309 (_ BitVec 32)) SeekEntryResult!4003)

(assert (=> b!500855 (= e!293424 (= (seekEntryOrOpen!0 (select (arr!15536 a!3235) j!176) a!3235 mask!3524) (Found!4003 j!176)))))

(declare-fun b!500856 () Bool)

(declare-fun res!302632 () Bool)

(assert (=> b!500856 (=> (not res!302632) (not e!293429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500856 (= res!302632 (validKeyInArray!0 k!2280))))

(declare-fun b!500857 () Bool)

(declare-fun res!302636 () Bool)

(assert (=> b!500857 (=> (not res!302636) (not e!293429))))

(declare-fun arrayContainsKey!0 (array!32309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500857 (= res!302636 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500858 () Bool)

(assert (=> b!500858 (= e!293423 e!293427)))

(declare-fun res!302629 () Bool)

(assert (=> b!500858 (=> res!302629 e!293427)))

(assert (=> b!500858 (= res!302629 (or (bvsgt #b00000000000000000000000000000000 (x!47224 lt!227392)) (bvsgt (x!47224 lt!227392) #b01111111111111111111111111111110) (bvslt lt!227389 #b00000000000000000000000000000000) (bvsge lt!227389 (size!15900 a!3235)) (bvslt (index!18196 lt!227392) #b00000000000000000000000000000000) (bvsge (index!18196 lt!227392) (size!15900 a!3235)) (not (= lt!227392 (Intermediate!4003 false (index!18196 lt!227392) (x!47224 lt!227392))))))))

(assert (=> b!500858 (and (or (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227398 () Unit!15088)

(declare-fun e!293425 () Unit!15088)

(assert (=> b!500858 (= lt!227398 e!293425)))

(declare-fun c!59390 () Bool)

(assert (=> b!500858 (= c!59390 (= (select (arr!15536 a!3235) (index!18196 lt!227392)) (select (arr!15536 a!3235) j!176)))))

(assert (=> b!500858 (and (bvslt (x!47224 lt!227392) #b01111111111111111111111111111110) (or (= (select (arr!15536 a!3235) (index!18196 lt!227392)) (select (arr!15536 a!3235) j!176)) (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15536 a!3235) (index!18196 lt!227392)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500859 () Bool)

(declare-fun res!302631 () Bool)

(assert (=> b!500859 (=> (not res!302631) (not e!293429))))

(assert (=> b!500859 (= res!302631 (validKeyInArray!0 (select (arr!15536 a!3235) j!176)))))

(declare-fun b!500860 () Bool)

(assert (=> b!500860 (= e!293429 e!293426)))

(declare-fun res!302634 () Bool)

(assert (=> b!500860 (=> (not res!302634) (not e!293426))))

(declare-fun lt!227391 () SeekEntryResult!4003)

(assert (=> b!500860 (= res!302634 (or (= lt!227391 (MissingZero!4003 i!1204)) (= lt!227391 (MissingVacant!4003 i!1204))))))

(assert (=> b!500860 (= lt!227391 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500861 () Bool)

(declare-fun Unit!15090 () Unit!15088)

(assert (=> b!500861 (= e!293425 Unit!15090)))

(declare-fun lt!227393 () Unit!15088)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15088)

(assert (=> b!500861 (= lt!227393 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227389 #b00000000000000000000000000000000 (index!18196 lt!227392) (x!47224 lt!227392) mask!3524))))

(declare-fun res!302635 () Bool)

(assert (=> b!500861 (= res!302635 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227389 lt!227390 lt!227396 mask!3524) (Intermediate!4003 false (index!18196 lt!227392) (x!47224 lt!227392))))))

(declare-fun e!293430 () Bool)

(assert (=> b!500861 (=> (not res!302635) (not e!293430))))

(assert (=> b!500861 e!293430))

(declare-fun b!500862 () Bool)

(declare-fun Unit!15091 () Unit!15088)

(assert (=> b!500862 (= e!293425 Unit!15091)))

(declare-fun b!500863 () Bool)

(declare-fun res!302628 () Bool)

(assert (=> b!500863 (=> (not res!302628) (not e!293426))))

(assert (=> b!500863 (= res!302628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500864 () Bool)

(assert (=> b!500864 (= e!293430 false)))

(declare-fun b!500865 () Bool)

(declare-fun res!302627 () Bool)

(assert (=> b!500865 (=> (not res!302627) (not e!293429))))

(assert (=> b!500865 (= res!302627 (and (= (size!15900 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15900 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15900 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500866 () Bool)

(declare-fun res!302639 () Bool)

(assert (=> b!500866 (=> (not res!302639) (not e!293426))))

(declare-datatypes ((List!9694 0))(
  ( (Nil!9691) (Cons!9690 (h!10564 (_ BitVec 64)) (t!15922 List!9694)) )
))
(declare-fun arrayNoDuplicates!0 (array!32309 (_ BitVec 32) List!9694) Bool)

(assert (=> b!500866 (= res!302639 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9691))))

(declare-fun b!500867 () Bool)

(declare-fun res!302637 () Bool)

(assert (=> b!500867 (=> res!302637 e!293423)))

(assert (=> b!500867 (= res!302637 (or (undefined!4815 lt!227392) (not (is-Intermediate!4003 lt!227392))))))

(assert (= (and start!45484 res!302630) b!500865))

(assert (= (and b!500865 res!302627) b!500859))

(assert (= (and b!500859 res!302631) b!500856))

(assert (= (and b!500856 res!302632) b!500857))

(assert (= (and b!500857 res!302636) b!500860))

(assert (= (and b!500860 res!302634) b!500863))

(assert (= (and b!500863 res!302628) b!500866))

(assert (= (and b!500866 res!302639) b!500853))

(assert (= (and b!500853 res!302638) b!500855))

(assert (= (and b!500853 (not res!302633)) b!500867))

(assert (= (and b!500867 (not res!302637)) b!500858))

(assert (= (and b!500858 c!59390) b!500861))

(assert (= (and b!500858 (not c!59390)) b!500862))

(assert (= (and b!500861 res!302635) b!500864))

(assert (= (and b!500858 (not res!302629)) b!500854))

(declare-fun m!481959 () Bool)

(assert (=> b!500861 m!481959))

(declare-fun m!481961 () Bool)

(assert (=> b!500861 m!481961))

(declare-fun m!481963 () Bool)

(assert (=> b!500859 m!481963))

(assert (=> b!500859 m!481963))

(declare-fun m!481965 () Bool)

(assert (=> b!500859 m!481965))

(assert (=> b!500854 m!481961))

(assert (=> b!500855 m!481963))

(assert (=> b!500855 m!481963))

(declare-fun m!481967 () Bool)

(assert (=> b!500855 m!481967))

(declare-fun m!481969 () Bool)

(assert (=> start!45484 m!481969))

(declare-fun m!481971 () Bool)

(assert (=> start!45484 m!481971))

(declare-fun m!481973 () Bool)

(assert (=> b!500863 m!481973))

(declare-fun m!481975 () Bool)

(assert (=> b!500858 m!481975))

(assert (=> b!500858 m!481963))

(declare-fun m!481977 () Bool)

(assert (=> b!500860 m!481977))

(declare-fun m!481979 () Bool)

(assert (=> b!500853 m!481979))

(declare-fun m!481981 () Bool)

(assert (=> b!500853 m!481981))

(declare-fun m!481983 () Bool)

(assert (=> b!500853 m!481983))

(assert (=> b!500853 m!481963))

(declare-fun m!481985 () Bool)

(assert (=> b!500853 m!481985))

(assert (=> b!500853 m!481963))

(declare-fun m!481987 () Bool)

(assert (=> b!500853 m!481987))

(declare-fun m!481989 () Bool)

(assert (=> b!500853 m!481989))

(declare-fun m!481991 () Bool)

(assert (=> b!500853 m!481991))

(assert (=> b!500853 m!481963))

(declare-fun m!481993 () Bool)

(assert (=> b!500853 m!481993))

(declare-fun m!481995 () Bool)

(assert (=> b!500866 m!481995))

(declare-fun m!481997 () Bool)

(assert (=> b!500856 m!481997))

(declare-fun m!481999 () Bool)

(assert (=> b!500857 m!481999))

(push 1)

