; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48024 () Bool)

(assert start!48024)

(declare-fun b!528976 () Bool)

(declare-fun res!324908 () Bool)

(declare-fun e!308250 () Bool)

(assert (=> b!528976 (=> (not res!324908) (not e!308250))))

(declare-datatypes ((array!33517 0))(
  ( (array!33518 (arr!16107 (Array (_ BitVec 32) (_ BitVec 64))) (size!16471 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33517)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33517 (_ BitVec 32)) Bool)

(assert (=> b!528976 (= res!324908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!324899 () Bool)

(declare-fun e!308251 () Bool)

(assert (=> start!48024 (=> (not res!324899) (not e!308251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48024 (= res!324899 (validMask!0 mask!3524))))

(assert (=> start!48024 e!308251))

(assert (=> start!48024 true))

(declare-fun array_inv!11903 (array!33517) Bool)

(assert (=> start!48024 (array_inv!11903 a!3235)))

(declare-fun b!528977 () Bool)

(declare-datatypes ((Unit!16748 0))(
  ( (Unit!16749) )
))
(declare-fun e!308254 () Unit!16748)

(declare-fun Unit!16750 () Unit!16748)

(assert (=> b!528977 (= e!308254 Unit!16750)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243762 () Unit!16748)

(declare-datatypes ((SeekEntryResult!4574 0))(
  ( (MissingZero!4574 (index!20520 (_ BitVec 32))) (Found!4574 (index!20521 (_ BitVec 32))) (Intermediate!4574 (undefined!5386 Bool) (index!20522 (_ BitVec 32)) (x!49494 (_ BitVec 32))) (Undefined!4574) (MissingVacant!4574 (index!20523 (_ BitVec 32))) )
))
(declare-fun lt!243766 () SeekEntryResult!4574)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!243755 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16748)

(assert (=> b!528977 (= lt!243762 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243755 #b00000000000000000000000000000000 (index!20522 lt!243766) (x!49494 lt!243766) mask!3524))))

(declare-fun res!324903 () Bool)

(declare-fun lt!243754 () (_ BitVec 64))

(declare-fun lt!243756 () array!33517)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33517 (_ BitVec 32)) SeekEntryResult!4574)

(assert (=> b!528977 (= res!324903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243755 lt!243754 lt!243756 mask!3524) (Intermediate!4574 false (index!20522 lt!243766) (x!49494 lt!243766))))))

(declare-fun e!308253 () Bool)

(assert (=> b!528977 (=> (not res!324903) (not e!308253))))

(assert (=> b!528977 e!308253))

(declare-fun b!528978 () Bool)

(declare-fun res!324911 () Bool)

(assert (=> b!528978 (=> (not res!324911) (not e!308251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528978 (= res!324911 (validKeyInArray!0 k!2280))))

(declare-fun b!528979 () Bool)

(declare-fun res!324907 () Bool)

(assert (=> b!528979 (=> (not res!324907) (not e!308251))))

(assert (=> b!528979 (= res!324907 (validKeyInArray!0 (select (arr!16107 a!3235) j!176)))))

(declare-fun b!528980 () Bool)

(declare-fun e!308252 () Bool)

(declare-fun e!308249 () Bool)

(assert (=> b!528980 (= e!308252 e!308249)))

(declare-fun res!324897 () Bool)

(assert (=> b!528980 (=> res!324897 e!308249)))

(assert (=> b!528980 (= res!324897 (or (bvsgt (x!49494 lt!243766) #b01111111111111111111111111111110) (bvslt lt!243755 #b00000000000000000000000000000000) (bvsge lt!243755 (size!16471 a!3235)) (bvslt (index!20522 lt!243766) #b00000000000000000000000000000000) (bvsge (index!20522 lt!243766) (size!16471 a!3235)) (not (= lt!243766 (Intermediate!4574 false (index!20522 lt!243766) (x!49494 lt!243766))))))))

(assert (=> b!528980 (= (index!20522 lt!243766) i!1204)))

(declare-fun lt!243763 () Unit!16748)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16748)

(assert (=> b!528980 (= lt!243763 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243755 #b00000000000000000000000000000000 (index!20522 lt!243766) (x!49494 lt!243766) mask!3524))))

(assert (=> b!528980 (and (or (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243764 () Unit!16748)

(assert (=> b!528980 (= lt!243764 e!308254)))

(declare-fun c!62348 () Bool)

(assert (=> b!528980 (= c!62348 (= (select (arr!16107 a!3235) (index!20522 lt!243766)) (select (arr!16107 a!3235) j!176)))))

(assert (=> b!528980 (and (bvslt (x!49494 lt!243766) #b01111111111111111111111111111110) (or (= (select (arr!16107 a!3235) (index!20522 lt!243766)) (select (arr!16107 a!3235) j!176)) (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16107 a!3235) (index!20522 lt!243766)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528981 () Bool)

(assert (=> b!528981 (= e!308250 (not e!308252))))

(declare-fun res!324904 () Bool)

(assert (=> b!528981 (=> res!324904 e!308252)))

(declare-fun lt!243758 () SeekEntryResult!4574)

(assert (=> b!528981 (= res!324904 (or (= lt!243766 lt!243758) (undefined!5386 lt!243766) (not (is-Intermediate!4574 lt!243766))))))

(declare-fun lt!243757 () (_ BitVec 32))

(assert (=> b!528981 (= lt!243758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243757 lt!243754 lt!243756 mask!3524))))

(assert (=> b!528981 (= lt!243766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243755 (select (arr!16107 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528981 (= lt!243757 (toIndex!0 lt!243754 mask!3524))))

(assert (=> b!528981 (= lt!243754 (select (store (arr!16107 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!528981 (= lt!243755 (toIndex!0 (select (arr!16107 a!3235) j!176) mask!3524))))

(assert (=> b!528981 (= lt!243756 (array!33518 (store (arr!16107 a!3235) i!1204 k!2280) (size!16471 a!3235)))))

(declare-fun lt!243760 () SeekEntryResult!4574)

(assert (=> b!528981 (= lt!243760 (Found!4574 j!176))))

(declare-fun e!308255 () Bool)

(assert (=> b!528981 e!308255))

(declare-fun res!324909 () Bool)

(assert (=> b!528981 (=> (not res!324909) (not e!308255))))

(assert (=> b!528981 (= res!324909 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243765 () Unit!16748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16748)

(assert (=> b!528981 (= lt!243765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528982 () Bool)

(declare-fun res!324905 () Bool)

(assert (=> b!528982 (=> res!324905 e!308249)))

(assert (=> b!528982 (= res!324905 (not (= lt!243758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243755 lt!243754 lt!243756 mask!3524))))))

(declare-fun b!528983 () Bool)

(assert (=> b!528983 (= e!308249 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33517 (_ BitVec 32)) SeekEntryResult!4574)

(assert (=> b!528983 (= (seekEntryOrOpen!0 lt!243754 lt!243756 mask!3524) lt!243760)))

(declare-fun lt!243761 () Unit!16748)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16748)

(assert (=> b!528983 (= lt!243761 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243755 #b00000000000000000000000000000000 (index!20522 lt!243766) (x!49494 lt!243766) mask!3524))))

(declare-fun b!528984 () Bool)

(declare-fun res!324902 () Bool)

(assert (=> b!528984 (=> (not res!324902) (not e!308251))))

(assert (=> b!528984 (= res!324902 (and (= (size!16471 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16471 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16471 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528985 () Bool)

(declare-fun res!324900 () Bool)

(assert (=> b!528985 (=> res!324900 e!308249)))

(declare-fun e!308256 () Bool)

(assert (=> b!528985 (= res!324900 e!308256)))

(declare-fun res!324910 () Bool)

(assert (=> b!528985 (=> (not res!324910) (not e!308256))))

(assert (=> b!528985 (= res!324910 (bvsgt #b00000000000000000000000000000000 (x!49494 lt!243766)))))

(declare-fun b!528986 () Bool)

(declare-fun res!324901 () Bool)

(assert (=> b!528986 (=> (not res!324901) (not e!308251))))

(declare-fun arrayContainsKey!0 (array!33517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528986 (= res!324901 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528987 () Bool)

(assert (=> b!528987 (= e!308251 e!308250)))

(declare-fun res!324898 () Bool)

(assert (=> b!528987 (=> (not res!324898) (not e!308250))))

(declare-fun lt!243759 () SeekEntryResult!4574)

(assert (=> b!528987 (= res!324898 (or (= lt!243759 (MissingZero!4574 i!1204)) (= lt!243759 (MissingVacant!4574 i!1204))))))

(assert (=> b!528987 (= lt!243759 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!528988 () Bool)

(assert (=> b!528988 (= e!308253 false)))

(declare-fun b!528989 () Bool)

(assert (=> b!528989 (= e!308255 (= (seekEntryOrOpen!0 (select (arr!16107 a!3235) j!176) a!3235 mask!3524) (Found!4574 j!176)))))

(declare-fun b!528990 () Bool)

(declare-fun Unit!16751 () Unit!16748)

(assert (=> b!528990 (= e!308254 Unit!16751)))

(declare-fun b!528991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33517 (_ BitVec 32)) SeekEntryResult!4574)

(assert (=> b!528991 (= e!308256 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243755 (index!20522 lt!243766) (select (arr!16107 a!3235) j!176) a!3235 mask!3524) lt!243760)))))

(declare-fun b!528992 () Bool)

(declare-fun res!324906 () Bool)

(assert (=> b!528992 (=> (not res!324906) (not e!308250))))

(declare-datatypes ((List!10265 0))(
  ( (Nil!10262) (Cons!10261 (h!11198 (_ BitVec 64)) (t!16493 List!10265)) )
))
(declare-fun arrayNoDuplicates!0 (array!33517 (_ BitVec 32) List!10265) Bool)

(assert (=> b!528992 (= res!324906 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10262))))

(assert (= (and start!48024 res!324899) b!528984))

(assert (= (and b!528984 res!324902) b!528979))

(assert (= (and b!528979 res!324907) b!528978))

(assert (= (and b!528978 res!324911) b!528986))

(assert (= (and b!528986 res!324901) b!528987))

(assert (= (and b!528987 res!324898) b!528976))

(assert (= (and b!528976 res!324908) b!528992))

(assert (= (and b!528992 res!324906) b!528981))

(assert (= (and b!528981 res!324909) b!528989))

(assert (= (and b!528981 (not res!324904)) b!528980))

(assert (= (and b!528980 c!62348) b!528977))

(assert (= (and b!528980 (not c!62348)) b!528990))

(assert (= (and b!528977 res!324903) b!528988))

(assert (= (and b!528980 (not res!324897)) b!528985))

(assert (= (and b!528985 res!324910) b!528991))

(assert (= (and b!528985 (not res!324900)) b!528982))

(assert (= (and b!528982 (not res!324905)) b!528983))

(declare-fun m!509505 () Bool)

(assert (=> b!528986 m!509505))

(declare-fun m!509507 () Bool)

(assert (=> b!528976 m!509507))

(declare-fun m!509509 () Bool)

(assert (=> b!528983 m!509509))

(declare-fun m!509511 () Bool)

(assert (=> b!528983 m!509511))

(declare-fun m!509513 () Bool)

(assert (=> start!48024 m!509513))

(declare-fun m!509515 () Bool)

(assert (=> start!48024 m!509515))

(declare-fun m!509517 () Bool)

(assert (=> b!528991 m!509517))

(assert (=> b!528991 m!509517))

(declare-fun m!509519 () Bool)

(assert (=> b!528991 m!509519))

(declare-fun m!509521 () Bool)

(assert (=> b!528992 m!509521))

(declare-fun m!509523 () Bool)

(assert (=> b!528982 m!509523))

(assert (=> b!528989 m!509517))

(assert (=> b!528989 m!509517))

(declare-fun m!509525 () Bool)

(assert (=> b!528989 m!509525))

(declare-fun m!509527 () Bool)

(assert (=> b!528987 m!509527))

(declare-fun m!509529 () Bool)

(assert (=> b!528980 m!509529))

(declare-fun m!509531 () Bool)

(assert (=> b!528980 m!509531))

(assert (=> b!528980 m!509517))

(assert (=> b!528979 m!509517))

(assert (=> b!528979 m!509517))

(declare-fun m!509533 () Bool)

(assert (=> b!528979 m!509533))

(declare-fun m!509535 () Bool)

(assert (=> b!528978 m!509535))

(declare-fun m!509537 () Bool)

(assert (=> b!528981 m!509537))

(declare-fun m!509539 () Bool)

(assert (=> b!528981 m!509539))

(declare-fun m!509541 () Bool)

(assert (=> b!528981 m!509541))

(declare-fun m!509543 () Bool)

(assert (=> b!528981 m!509543))

(assert (=> b!528981 m!509517))

(declare-fun m!509545 () Bool)

(assert (=> b!528981 m!509545))

(assert (=> b!528981 m!509517))

(declare-fun m!509547 () Bool)

(assert (=> b!528981 m!509547))

(declare-fun m!509549 () Bool)

(assert (=> b!528981 m!509549))

(assert (=> b!528981 m!509517))

(declare-fun m!509551 () Bool)

(assert (=> b!528981 m!509551))

(declare-fun m!509553 () Bool)

(assert (=> b!528977 m!509553))

(assert (=> b!528977 m!509523))

(push 1)

