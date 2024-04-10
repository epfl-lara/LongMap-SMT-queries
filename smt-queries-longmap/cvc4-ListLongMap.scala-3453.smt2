; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47914 () Bool)

(assert start!47914)

(declare-fun res!324081 () Bool)

(declare-fun e!307593 () Bool)

(assert (=> start!47914 (=> (not res!324081) (not e!307593))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47914 (= res!324081 (validMask!0 mask!3524))))

(assert (=> start!47914 e!307593))

(assert (=> start!47914 true))

(declare-datatypes ((array!33482 0))(
  ( (array!33483 (arr!16091 (Array (_ BitVec 32) (_ BitVec 64))) (size!16455 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33482)

(declare-fun array_inv!11887 (array!33482) Bool)

(assert (=> start!47914 (array_inv!11887 a!3235)))

(declare-fun b!527809 () Bool)

(declare-fun res!324082 () Bool)

(declare-fun e!307590 () Bool)

(assert (=> b!527809 (=> res!324082 e!307590)))

(declare-datatypes ((SeekEntryResult!4558 0))(
  ( (MissingZero!4558 (index!20450 (_ BitVec 32))) (Found!4558 (index!20451 (_ BitVec 32))) (Intermediate!4558 (undefined!5370 Bool) (index!20452 (_ BitVec 32)) (x!49415 (_ BitVec 32))) (Undefined!4558) (MissingVacant!4558 (index!20453 (_ BitVec 32))) )
))
(declare-fun lt!243013 () SeekEntryResult!4558)

(assert (=> b!527809 (= res!324082 (or (undefined!5370 lt!243013) (not (is-Intermediate!4558 lt!243013))))))

(declare-fun b!527810 () Bool)

(declare-fun e!307596 () Bool)

(assert (=> b!527810 (= e!307593 e!307596)))

(declare-fun res!324083 () Bool)

(assert (=> b!527810 (=> (not res!324083) (not e!307596))))

(declare-fun lt!243009 () SeekEntryResult!4558)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527810 (= res!324083 (or (= lt!243009 (MissingZero!4558 i!1204)) (= lt!243009 (MissingVacant!4558 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33482 (_ BitVec 32)) SeekEntryResult!4558)

(assert (=> b!527810 (= lt!243009 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527811 () Bool)

(declare-fun res!324092 () Bool)

(assert (=> b!527811 (=> (not res!324092) (not e!307593))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527811 (= res!324092 (validKeyInArray!0 (select (arr!16091 a!3235) j!176)))))

(declare-fun b!527812 () Bool)

(declare-fun res!324085 () Bool)

(assert (=> b!527812 (=> (not res!324085) (not e!307596))))

(declare-datatypes ((List!10249 0))(
  ( (Nil!10246) (Cons!10245 (h!11179 (_ BitVec 64)) (t!16477 List!10249)) )
))
(declare-fun arrayNoDuplicates!0 (array!33482 (_ BitVec 32) List!10249) Bool)

(assert (=> b!527812 (= res!324085 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10246))))

(declare-fun b!527813 () Bool)

(assert (=> b!527813 (= e!307590 true)))

(assert (=> b!527813 (= (index!20452 lt!243013) i!1204)))

(declare-datatypes ((Unit!16684 0))(
  ( (Unit!16685) )
))
(declare-fun lt!243007 () Unit!16684)

(declare-fun lt!243016 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16684)

(assert (=> b!527813 (= lt!243007 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243016 #b00000000000000000000000000000000 (index!20452 lt!243013) (x!49415 lt!243013) mask!3524))))

(assert (=> b!527813 (and (or (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243011 () Unit!16684)

(declare-fun e!307595 () Unit!16684)

(assert (=> b!527813 (= lt!243011 e!307595)))

(declare-fun c!62171 () Bool)

(assert (=> b!527813 (= c!62171 (= (select (arr!16091 a!3235) (index!20452 lt!243013)) (select (arr!16091 a!3235) j!176)))))

(assert (=> b!527813 (and (bvslt (x!49415 lt!243013) #b01111111111111111111111111111110) (or (= (select (arr!16091 a!3235) (index!20452 lt!243013)) (select (arr!16091 a!3235) j!176)) (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16091 a!3235) (index!20452 lt!243013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527814 () Bool)

(declare-fun Unit!16686 () Unit!16684)

(assert (=> b!527814 (= e!307595 Unit!16686)))

(declare-fun e!307591 () Bool)

(declare-fun b!527815 () Bool)

(assert (=> b!527815 (= e!307591 (= (seekEntryOrOpen!0 (select (arr!16091 a!3235) j!176) a!3235 mask!3524) (Found!4558 j!176)))))

(declare-fun b!527816 () Bool)

(assert (=> b!527816 (= e!307596 (not e!307590))))

(declare-fun res!324090 () Bool)

(assert (=> b!527816 (=> res!324090 e!307590)))

(declare-fun lt!243012 () (_ BitVec 32))

(declare-fun lt!243014 () (_ BitVec 64))

(declare-fun lt!243008 () array!33482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33482 (_ BitVec 32)) SeekEntryResult!4558)

(assert (=> b!527816 (= res!324090 (= lt!243013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243012 lt!243014 lt!243008 mask!3524)))))

(assert (=> b!527816 (= lt!243013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243016 (select (arr!16091 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527816 (= lt!243012 (toIndex!0 lt!243014 mask!3524))))

(assert (=> b!527816 (= lt!243014 (select (store (arr!16091 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527816 (= lt!243016 (toIndex!0 (select (arr!16091 a!3235) j!176) mask!3524))))

(assert (=> b!527816 (= lt!243008 (array!33483 (store (arr!16091 a!3235) i!1204 k!2280) (size!16455 a!3235)))))

(assert (=> b!527816 e!307591))

(declare-fun res!324086 () Bool)

(assert (=> b!527816 (=> (not res!324086) (not e!307591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33482 (_ BitVec 32)) Bool)

(assert (=> b!527816 (= res!324086 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243015 () Unit!16684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16684)

(assert (=> b!527816 (= lt!243015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527817 () Bool)

(declare-fun e!307592 () Bool)

(assert (=> b!527817 (= e!307592 false)))

(declare-fun b!527818 () Bool)

(declare-fun res!324087 () Bool)

(assert (=> b!527818 (=> (not res!324087) (not e!307593))))

(assert (=> b!527818 (= res!324087 (and (= (size!16455 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16455 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16455 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527819 () Bool)

(declare-fun res!324088 () Bool)

(assert (=> b!527819 (=> (not res!324088) (not e!307593))))

(assert (=> b!527819 (= res!324088 (validKeyInArray!0 k!2280))))

(declare-fun b!527820 () Bool)

(declare-fun res!324089 () Bool)

(assert (=> b!527820 (=> (not res!324089) (not e!307593))))

(declare-fun arrayContainsKey!0 (array!33482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527820 (= res!324089 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527821 () Bool)

(declare-fun Unit!16687 () Unit!16684)

(assert (=> b!527821 (= e!307595 Unit!16687)))

(declare-fun lt!243010 () Unit!16684)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16684)

(assert (=> b!527821 (= lt!243010 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243016 #b00000000000000000000000000000000 (index!20452 lt!243013) (x!49415 lt!243013) mask!3524))))

(declare-fun res!324091 () Bool)

(assert (=> b!527821 (= res!324091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243016 lt!243014 lt!243008 mask!3524) (Intermediate!4558 false (index!20452 lt!243013) (x!49415 lt!243013))))))

(assert (=> b!527821 (=> (not res!324091) (not e!307592))))

(assert (=> b!527821 e!307592))

(declare-fun b!527822 () Bool)

(declare-fun res!324084 () Bool)

(assert (=> b!527822 (=> (not res!324084) (not e!307596))))

(assert (=> b!527822 (= res!324084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47914 res!324081) b!527818))

(assert (= (and b!527818 res!324087) b!527811))

(assert (= (and b!527811 res!324092) b!527819))

(assert (= (and b!527819 res!324088) b!527820))

(assert (= (and b!527820 res!324089) b!527810))

(assert (= (and b!527810 res!324083) b!527822))

(assert (= (and b!527822 res!324084) b!527812))

(assert (= (and b!527812 res!324085) b!527816))

(assert (= (and b!527816 res!324086) b!527815))

(assert (= (and b!527816 (not res!324090)) b!527809))

(assert (= (and b!527809 (not res!324082)) b!527813))

(assert (= (and b!527813 c!62171) b!527821))

(assert (= (and b!527813 (not c!62171)) b!527814))

(assert (= (and b!527821 res!324091) b!527817))

(declare-fun m!508477 () Bool)

(assert (=> b!527819 m!508477))

(declare-fun m!508479 () Bool)

(assert (=> b!527822 m!508479))

(declare-fun m!508481 () Bool)

(assert (=> b!527821 m!508481))

(declare-fun m!508483 () Bool)

(assert (=> b!527821 m!508483))

(declare-fun m!508485 () Bool)

(assert (=> b!527813 m!508485))

(declare-fun m!508487 () Bool)

(assert (=> b!527813 m!508487))

(declare-fun m!508489 () Bool)

(assert (=> b!527813 m!508489))

(declare-fun m!508491 () Bool)

(assert (=> b!527816 m!508491))

(declare-fun m!508493 () Bool)

(assert (=> b!527816 m!508493))

(declare-fun m!508495 () Bool)

(assert (=> b!527816 m!508495))

(declare-fun m!508497 () Bool)

(assert (=> b!527816 m!508497))

(assert (=> b!527816 m!508489))

(declare-fun m!508499 () Bool)

(assert (=> b!527816 m!508499))

(assert (=> b!527816 m!508489))

(declare-fun m!508501 () Bool)

(assert (=> b!527816 m!508501))

(assert (=> b!527816 m!508489))

(declare-fun m!508503 () Bool)

(assert (=> b!527816 m!508503))

(declare-fun m!508505 () Bool)

(assert (=> b!527816 m!508505))

(declare-fun m!508507 () Bool)

(assert (=> start!47914 m!508507))

(declare-fun m!508509 () Bool)

(assert (=> start!47914 m!508509))

(assert (=> b!527815 m!508489))

(assert (=> b!527815 m!508489))

(declare-fun m!508511 () Bool)

(assert (=> b!527815 m!508511))

(declare-fun m!508513 () Bool)

(assert (=> b!527812 m!508513))

(declare-fun m!508515 () Bool)

(assert (=> b!527810 m!508515))

(assert (=> b!527811 m!508489))

(assert (=> b!527811 m!508489))

(declare-fun m!508517 () Bool)

(assert (=> b!527811 m!508517))

(declare-fun m!508519 () Bool)

(assert (=> b!527820 m!508519))

(push 1)

