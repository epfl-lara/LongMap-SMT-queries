; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47532 () Bool)

(assert start!47532)

(declare-fun b!523062 () Bool)

(declare-fun res!320584 () Bool)

(declare-fun e!305037 () Bool)

(assert (=> b!523062 (=> (not res!320584) (not e!305037))))

(declare-datatypes ((array!33305 0))(
  ( (array!33306 (arr!16007 (Array (_ BitVec 32) (_ BitVec 64))) (size!16372 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33305)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523062 (= res!320584 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523063 () Bool)

(declare-fun res!320581 () Bool)

(assert (=> b!523063 (=> (not res!320581) (not e!305037))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523063 (= res!320581 (and (= (size!16372 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16372 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523064 () Bool)

(declare-fun res!320578 () Bool)

(assert (=> b!523064 (=> (not res!320578) (not e!305037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523064 (= res!320578 (validKeyInArray!0 (select (arr!16007 a!3235) j!176)))))

(declare-fun b!523065 () Bool)

(declare-fun res!320579 () Bool)

(assert (=> b!523065 (=> (not res!320579) (not e!305037))))

(assert (=> b!523065 (= res!320579 (validKeyInArray!0 k0!2280))))

(declare-fun b!523066 () Bool)

(declare-fun res!320577 () Bool)

(declare-fun e!305035 () Bool)

(assert (=> b!523066 (=> (not res!320577) (not e!305035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33305 (_ BitVec 32)) Bool)

(assert (=> b!523066 (= res!320577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523067 () Bool)

(declare-fun res!320585 () Bool)

(assert (=> b!523067 (=> (not res!320585) (not e!305035))))

(declare-datatypes ((List!10204 0))(
  ( (Nil!10201) (Cons!10200 (h!11125 (_ BitVec 64)) (t!16423 List!10204)) )
))
(declare-fun arrayNoDuplicates!0 (array!33305 (_ BitVec 32) List!10204) Bool)

(assert (=> b!523067 (= res!320585 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10201))))

(declare-fun b!523068 () Bool)

(declare-fun e!305034 () Bool)

(assert (=> b!523068 (= e!305035 (not e!305034))))

(declare-fun res!320580 () Bool)

(assert (=> b!523068 (=> res!320580 e!305034)))

(declare-fun lt!239883 () (_ BitVec 64))

(declare-fun lt!239876 () array!33305)

(declare-datatypes ((SeekEntryResult!4471 0))(
  ( (MissingZero!4471 (index!20090 (_ BitVec 32))) (Found!4471 (index!20091 (_ BitVec 32))) (Intermediate!4471 (undefined!5283 Bool) (index!20092 (_ BitVec 32)) (x!49077 (_ BitVec 32))) (Undefined!4471) (MissingVacant!4471 (index!20093 (_ BitVec 32))) )
))
(declare-fun lt!239878 () SeekEntryResult!4471)

(declare-fun lt!239882 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33305 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!523068 (= res!320580 (= lt!239878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239882 lt!239883 lt!239876 mask!3524)))))

(declare-fun lt!239879 () (_ BitVec 32))

(assert (=> b!523068 (= lt!239878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239879 (select (arr!16007 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523068 (= lt!239882 (toIndex!0 lt!239883 mask!3524))))

(assert (=> b!523068 (= lt!239883 (select (store (arr!16007 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523068 (= lt!239879 (toIndex!0 (select (arr!16007 a!3235) j!176) mask!3524))))

(assert (=> b!523068 (= lt!239876 (array!33306 (store (arr!16007 a!3235) i!1204 k0!2280) (size!16372 a!3235)))))

(declare-fun e!305038 () Bool)

(assert (=> b!523068 e!305038))

(declare-fun res!320582 () Bool)

(assert (=> b!523068 (=> (not res!320582) (not e!305038))))

(assert (=> b!523068 (= res!320582 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16330 0))(
  ( (Unit!16331) )
))
(declare-fun lt!239884 () Unit!16330)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16330)

(assert (=> b!523068 (= lt!239884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523069 () Bool)

(assert (=> b!523069 (= e!305034 (or (bvsgt #b00000000000000000000000000000000 (x!49077 lt!239878)) (bvsgt (x!49077 lt!239878) #b01111111111111111111111111111110) (and (bvsge lt!239879 #b00000000000000000000000000000000) (bvslt lt!239879 (size!16372 a!3235)))))))

(assert (=> b!523069 (and (or (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239880 () Unit!16330)

(declare-fun e!305039 () Unit!16330)

(assert (=> b!523069 (= lt!239880 e!305039)))

(declare-fun c!61545 () Bool)

(assert (=> b!523069 (= c!61545 (= (select (arr!16007 a!3235) (index!20092 lt!239878)) (select (arr!16007 a!3235) j!176)))))

(assert (=> b!523069 (and (bvslt (x!49077 lt!239878) #b01111111111111111111111111111110) (or (= (select (arr!16007 a!3235) (index!20092 lt!239878)) (select (arr!16007 a!3235) j!176)) (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16007 a!3235) (index!20092 lt!239878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!320583 () Bool)

(assert (=> start!47532 (=> (not res!320583) (not e!305037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47532 (= res!320583 (validMask!0 mask!3524))))

(assert (=> start!47532 e!305037))

(assert (=> start!47532 true))

(declare-fun array_inv!11890 (array!33305) Bool)

(assert (=> start!47532 (array_inv!11890 a!3235)))

(declare-fun b!523070 () Bool)

(assert (=> b!523070 (= e!305037 e!305035)))

(declare-fun res!320587 () Bool)

(assert (=> b!523070 (=> (not res!320587) (not e!305035))))

(declare-fun lt!239881 () SeekEntryResult!4471)

(assert (=> b!523070 (= res!320587 (or (= lt!239881 (MissingZero!4471 i!1204)) (= lt!239881 (MissingVacant!4471 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33305 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!523070 (= lt!239881 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523071 () Bool)

(declare-fun Unit!16332 () Unit!16330)

(assert (=> b!523071 (= e!305039 Unit!16332)))

(declare-fun lt!239877 () Unit!16330)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16330)

(assert (=> b!523071 (= lt!239877 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239879 #b00000000000000000000000000000000 (index!20092 lt!239878) (x!49077 lt!239878) mask!3524))))

(declare-fun res!320588 () Bool)

(assert (=> b!523071 (= res!320588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239879 lt!239883 lt!239876 mask!3524) (Intermediate!4471 false (index!20092 lt!239878) (x!49077 lt!239878))))))

(declare-fun e!305036 () Bool)

(assert (=> b!523071 (=> (not res!320588) (not e!305036))))

(assert (=> b!523071 e!305036))

(declare-fun b!523072 () Bool)

(declare-fun Unit!16333 () Unit!16330)

(assert (=> b!523072 (= e!305039 Unit!16333)))

(declare-fun b!523073 () Bool)

(declare-fun res!320586 () Bool)

(assert (=> b!523073 (=> res!320586 e!305034)))

(get-info :version)

(assert (=> b!523073 (= res!320586 (or (undefined!5283 lt!239878) (not ((_ is Intermediate!4471) lt!239878))))))

(declare-fun b!523074 () Bool)

(assert (=> b!523074 (= e!305036 false)))

(declare-fun b!523075 () Bool)

(assert (=> b!523075 (= e!305038 (= (seekEntryOrOpen!0 (select (arr!16007 a!3235) j!176) a!3235 mask!3524) (Found!4471 j!176)))))

(assert (= (and start!47532 res!320583) b!523063))

(assert (= (and b!523063 res!320581) b!523064))

(assert (= (and b!523064 res!320578) b!523065))

(assert (= (and b!523065 res!320579) b!523062))

(assert (= (and b!523062 res!320584) b!523070))

(assert (= (and b!523070 res!320587) b!523066))

(assert (= (and b!523066 res!320577) b!523067))

(assert (= (and b!523067 res!320585) b!523068))

(assert (= (and b!523068 res!320582) b!523075))

(assert (= (and b!523068 (not res!320580)) b!523073))

(assert (= (and b!523073 (not res!320586)) b!523069))

(assert (= (and b!523069 c!61545) b!523071))

(assert (= (and b!523069 (not c!61545)) b!523072))

(assert (= (and b!523071 res!320588) b!523074))

(declare-fun m!503401 () Bool)

(assert (=> b!523071 m!503401))

(declare-fun m!503403 () Bool)

(assert (=> b!523071 m!503403))

(declare-fun m!503405 () Bool)

(assert (=> b!523065 m!503405))

(declare-fun m!503407 () Bool)

(assert (=> b!523066 m!503407))

(declare-fun m!503409 () Bool)

(assert (=> b!523062 m!503409))

(declare-fun m!503411 () Bool)

(assert (=> b!523064 m!503411))

(assert (=> b!523064 m!503411))

(declare-fun m!503413 () Bool)

(assert (=> b!523064 m!503413))

(declare-fun m!503415 () Bool)

(assert (=> b!523070 m!503415))

(declare-fun m!503417 () Bool)

(assert (=> start!47532 m!503417))

(declare-fun m!503419 () Bool)

(assert (=> start!47532 m!503419))

(declare-fun m!503421 () Bool)

(assert (=> b!523068 m!503421))

(declare-fun m!503423 () Bool)

(assert (=> b!523068 m!503423))

(declare-fun m!503425 () Bool)

(assert (=> b!523068 m!503425))

(assert (=> b!523068 m!503411))

(declare-fun m!503427 () Bool)

(assert (=> b!523068 m!503427))

(assert (=> b!523068 m!503411))

(declare-fun m!503429 () Bool)

(assert (=> b!523068 m!503429))

(declare-fun m!503431 () Bool)

(assert (=> b!523068 m!503431))

(assert (=> b!523068 m!503411))

(declare-fun m!503433 () Bool)

(assert (=> b!523068 m!503433))

(declare-fun m!503435 () Bool)

(assert (=> b!523068 m!503435))

(declare-fun m!503437 () Bool)

(assert (=> b!523069 m!503437))

(assert (=> b!523069 m!503411))

(assert (=> b!523075 m!503411))

(assert (=> b!523075 m!503411))

(declare-fun m!503439 () Bool)

(assert (=> b!523075 m!503439))

(declare-fun m!503441 () Bool)

(assert (=> b!523067 m!503441))

(check-sat (not b!523066) (not b!523067) (not b!523062) (not b!523065) (not b!523075) (not b!523068) (not b!523070) (not b!523064) (not b!523071) (not start!47532))
(check-sat)
(get-model)

(declare-fun d!80317 () Bool)

(assert (=> d!80317 (= (validKeyInArray!0 (select (arr!16007 a!3235) j!176)) (and (not (= (select (arr!16007 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16007 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523064 d!80317))

(declare-fun b!523172 () Bool)

(declare-fun c!61559 () Bool)

(declare-fun lt!239946 () (_ BitVec 64))

(assert (=> b!523172 (= c!61559 (= lt!239946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305091 () SeekEntryResult!4471)

(declare-fun e!305089 () SeekEntryResult!4471)

(assert (=> b!523172 (= e!305091 e!305089)))

(declare-fun b!523173 () Bool)

(declare-fun lt!239945 () SeekEntryResult!4471)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33305 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!523173 (= e!305089 (seekKeyOrZeroReturnVacant!0 (x!49077 lt!239945) (index!20092 lt!239945) (index!20092 lt!239945) (select (arr!16007 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523175 () Bool)

(assert (=> b!523175 (= e!305091 (Found!4471 (index!20092 lt!239945)))))

(declare-fun b!523176 () Bool)

(assert (=> b!523176 (= e!305089 (MissingZero!4471 (index!20092 lt!239945)))))

(declare-fun b!523177 () Bool)

(declare-fun e!305090 () SeekEntryResult!4471)

(assert (=> b!523177 (= e!305090 e!305091)))

(assert (=> b!523177 (= lt!239946 (select (arr!16007 a!3235) (index!20092 lt!239945)))))

(declare-fun c!61558 () Bool)

(assert (=> b!523177 (= c!61558 (= lt!239946 (select (arr!16007 a!3235) j!176)))))

(declare-fun d!80319 () Bool)

(declare-fun lt!239947 () SeekEntryResult!4471)

(assert (=> d!80319 (and (or ((_ is Undefined!4471) lt!239947) (not ((_ is Found!4471) lt!239947)) (and (bvsge (index!20091 lt!239947) #b00000000000000000000000000000000) (bvslt (index!20091 lt!239947) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239947) ((_ is Found!4471) lt!239947) (not ((_ is MissingZero!4471) lt!239947)) (and (bvsge (index!20090 lt!239947) #b00000000000000000000000000000000) (bvslt (index!20090 lt!239947) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239947) ((_ is Found!4471) lt!239947) ((_ is MissingZero!4471) lt!239947) (not ((_ is MissingVacant!4471) lt!239947)) (and (bvsge (index!20093 lt!239947) #b00000000000000000000000000000000) (bvslt (index!20093 lt!239947) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239947) (ite ((_ is Found!4471) lt!239947) (= (select (arr!16007 a!3235) (index!20091 lt!239947)) (select (arr!16007 a!3235) j!176)) (ite ((_ is MissingZero!4471) lt!239947) (= (select (arr!16007 a!3235) (index!20090 lt!239947)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4471) lt!239947) (= (select (arr!16007 a!3235) (index!20093 lt!239947)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80319 (= lt!239947 e!305090)))

(declare-fun c!61560 () Bool)

(assert (=> d!80319 (= c!61560 (and ((_ is Intermediate!4471) lt!239945) (undefined!5283 lt!239945)))))

(assert (=> d!80319 (= lt!239945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16007 a!3235) j!176) mask!3524) (select (arr!16007 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80319 (validMask!0 mask!3524)))

(assert (=> d!80319 (= (seekEntryOrOpen!0 (select (arr!16007 a!3235) j!176) a!3235 mask!3524) lt!239947)))

(declare-fun b!523174 () Bool)

(assert (=> b!523174 (= e!305090 Undefined!4471)))

(assert (= (and d!80319 c!61560) b!523174))

(assert (= (and d!80319 (not c!61560)) b!523177))

(assert (= (and b!523177 c!61558) b!523175))

(assert (= (and b!523177 (not c!61558)) b!523172))

(assert (= (and b!523172 c!61559) b!523176))

(assert (= (and b!523172 (not c!61559)) b!523173))

(assert (=> b!523173 m!503411))

(declare-fun m!503527 () Bool)

(assert (=> b!523173 m!503527))

(declare-fun m!503529 () Bool)

(assert (=> b!523177 m!503529))

(declare-fun m!503531 () Bool)

(assert (=> d!80319 m!503531))

(declare-fun m!503533 () Bool)

(assert (=> d!80319 m!503533))

(assert (=> d!80319 m!503411))

(assert (=> d!80319 m!503427))

(assert (=> d!80319 m!503417))

(declare-fun m!503535 () Bool)

(assert (=> d!80319 m!503535))

(assert (=> d!80319 m!503427))

(assert (=> d!80319 m!503411))

(declare-fun m!503537 () Bool)

(assert (=> d!80319 m!503537))

(assert (=> b!523075 d!80319))

(declare-fun b!523178 () Bool)

(declare-fun c!61562 () Bool)

(declare-fun lt!239949 () (_ BitVec 64))

(assert (=> b!523178 (= c!61562 (= lt!239949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305094 () SeekEntryResult!4471)

(declare-fun e!305092 () SeekEntryResult!4471)

(assert (=> b!523178 (= e!305094 e!305092)))

(declare-fun b!523179 () Bool)

(declare-fun lt!239948 () SeekEntryResult!4471)

(assert (=> b!523179 (= e!305092 (seekKeyOrZeroReturnVacant!0 (x!49077 lt!239948) (index!20092 lt!239948) (index!20092 lt!239948) k0!2280 a!3235 mask!3524))))

(declare-fun b!523181 () Bool)

(assert (=> b!523181 (= e!305094 (Found!4471 (index!20092 lt!239948)))))

(declare-fun b!523182 () Bool)

(assert (=> b!523182 (= e!305092 (MissingZero!4471 (index!20092 lt!239948)))))

(declare-fun b!523183 () Bool)

(declare-fun e!305093 () SeekEntryResult!4471)

(assert (=> b!523183 (= e!305093 e!305094)))

(assert (=> b!523183 (= lt!239949 (select (arr!16007 a!3235) (index!20092 lt!239948)))))

(declare-fun c!61561 () Bool)

(assert (=> b!523183 (= c!61561 (= lt!239949 k0!2280))))

(declare-fun d!80321 () Bool)

(declare-fun lt!239950 () SeekEntryResult!4471)

(assert (=> d!80321 (and (or ((_ is Undefined!4471) lt!239950) (not ((_ is Found!4471) lt!239950)) (and (bvsge (index!20091 lt!239950) #b00000000000000000000000000000000) (bvslt (index!20091 lt!239950) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239950) ((_ is Found!4471) lt!239950) (not ((_ is MissingZero!4471) lt!239950)) (and (bvsge (index!20090 lt!239950) #b00000000000000000000000000000000) (bvslt (index!20090 lt!239950) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239950) ((_ is Found!4471) lt!239950) ((_ is MissingZero!4471) lt!239950) (not ((_ is MissingVacant!4471) lt!239950)) (and (bvsge (index!20093 lt!239950) #b00000000000000000000000000000000) (bvslt (index!20093 lt!239950) (size!16372 a!3235)))) (or ((_ is Undefined!4471) lt!239950) (ite ((_ is Found!4471) lt!239950) (= (select (arr!16007 a!3235) (index!20091 lt!239950)) k0!2280) (ite ((_ is MissingZero!4471) lt!239950) (= (select (arr!16007 a!3235) (index!20090 lt!239950)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4471) lt!239950) (= (select (arr!16007 a!3235) (index!20093 lt!239950)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80321 (= lt!239950 e!305093)))

(declare-fun c!61563 () Bool)

(assert (=> d!80321 (= c!61563 (and ((_ is Intermediate!4471) lt!239948) (undefined!5283 lt!239948)))))

(assert (=> d!80321 (= lt!239948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80321 (validMask!0 mask!3524)))

(assert (=> d!80321 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!239950)))

(declare-fun b!523180 () Bool)

(assert (=> b!523180 (= e!305093 Undefined!4471)))

(assert (= (and d!80321 c!61563) b!523180))

(assert (= (and d!80321 (not c!61563)) b!523183))

(assert (= (and b!523183 c!61561) b!523181))

(assert (= (and b!523183 (not c!61561)) b!523178))

(assert (= (and b!523178 c!61562) b!523182))

(assert (= (and b!523178 (not c!61562)) b!523179))

(declare-fun m!503539 () Bool)

(assert (=> b!523179 m!503539))

(declare-fun m!503541 () Bool)

(assert (=> b!523183 m!503541))

(declare-fun m!503543 () Bool)

(assert (=> d!80321 m!503543))

(declare-fun m!503545 () Bool)

(assert (=> d!80321 m!503545))

(declare-fun m!503547 () Bool)

(assert (=> d!80321 m!503547))

(assert (=> d!80321 m!503417))

(declare-fun m!503549 () Bool)

(assert (=> d!80321 m!503549))

(assert (=> d!80321 m!503547))

(declare-fun m!503551 () Bool)

(assert (=> d!80321 m!503551))

(assert (=> b!523070 d!80321))

(declare-fun d!80323 () Bool)

(assert (=> d!80323 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47532 d!80323))

(declare-fun d!80327 () Bool)

(assert (=> d!80327 (= (array_inv!11890 a!3235) (bvsge (size!16372 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47532 d!80327))

(declare-fun b!523192 () Bool)

(declare-fun e!305102 () Bool)

(declare-fun e!305103 () Bool)

(assert (=> b!523192 (= e!305102 e!305103)))

(declare-fun c!61566 () Bool)

(assert (=> b!523192 (= c!61566 (validKeyInArray!0 (select (arr!16007 a!3235) j!176)))))

(declare-fun b!523193 () Bool)

(declare-fun e!305101 () Bool)

(assert (=> b!523193 (= e!305103 e!305101)))

(declare-fun lt!239966 () (_ BitVec 64))

(assert (=> b!523193 (= lt!239966 (select (arr!16007 a!3235) j!176))))

(declare-fun lt!239967 () Unit!16330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33305 (_ BitVec 64) (_ BitVec 32)) Unit!16330)

(assert (=> b!523193 (= lt!239967 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239966 j!176))))

(assert (=> b!523193 (arrayContainsKey!0 a!3235 lt!239966 #b00000000000000000000000000000000)))

(declare-fun lt!239965 () Unit!16330)

(assert (=> b!523193 (= lt!239965 lt!239967)))

(declare-fun res!320667 () Bool)

(assert (=> b!523193 (= res!320667 (= (seekEntryOrOpen!0 (select (arr!16007 a!3235) j!176) a!3235 mask!3524) (Found!4471 j!176)))))

(assert (=> b!523193 (=> (not res!320667) (not e!305101))))

(declare-fun b!523194 () Bool)

(declare-fun call!31807 () Bool)

(assert (=> b!523194 (= e!305103 call!31807)))

(declare-fun bm!31804 () Bool)

(assert (=> bm!31804 (= call!31807 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80331 () Bool)

(declare-fun res!320666 () Bool)

(assert (=> d!80331 (=> res!320666 e!305102)))

(assert (=> d!80331 (= res!320666 (bvsge j!176 (size!16372 a!3235)))))

(assert (=> d!80331 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305102)))

(declare-fun b!523195 () Bool)

(assert (=> b!523195 (= e!305101 call!31807)))

(assert (= (and d!80331 (not res!320666)) b!523192))

(assert (= (and b!523192 c!61566) b!523193))

(assert (= (and b!523192 (not c!61566)) b!523194))

(assert (= (and b!523193 res!320667) b!523195))

(assert (= (or b!523195 b!523194) bm!31804))

(assert (=> b!523192 m!503411))

(assert (=> b!523192 m!503411))

(assert (=> b!523192 m!503413))

(assert (=> b!523193 m!503411))

(declare-fun m!503553 () Bool)

(assert (=> b!523193 m!503553))

(declare-fun m!503555 () Bool)

(assert (=> b!523193 m!503555))

(assert (=> b!523193 m!503411))

(assert (=> b!523193 m!503439))

(declare-fun m!503557 () Bool)

(assert (=> bm!31804 m!503557))

(assert (=> b!523068 d!80331))

(declare-fun b!523237 () Bool)

(declare-fun lt!239989 () SeekEntryResult!4471)

(assert (=> b!523237 (and (bvsge (index!20092 lt!239989) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239989) (size!16372 lt!239876)))))

(declare-fun e!305134 () Bool)

(assert (=> b!523237 (= e!305134 (= (select (arr!16007 lt!239876) (index!20092 lt!239989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523238 () Bool)

(assert (=> b!523238 (and (bvsge (index!20092 lt!239989) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239989) (size!16372 lt!239876)))))

(declare-fun res!320684 () Bool)

(assert (=> b!523238 (= res!320684 (= (select (arr!16007 lt!239876) (index!20092 lt!239989)) lt!239883))))

(assert (=> b!523238 (=> res!320684 e!305134)))

(declare-fun e!305132 () Bool)

(assert (=> b!523238 (= e!305132 e!305134)))

(declare-fun b!523239 () Bool)

(assert (=> b!523239 (and (bvsge (index!20092 lt!239989) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239989) (size!16372 lt!239876)))))

(declare-fun res!320683 () Bool)

(assert (=> b!523239 (= res!320683 (= (select (arr!16007 lt!239876) (index!20092 lt!239989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523239 (=> res!320683 e!305134)))

(declare-fun b!523240 () Bool)

(declare-fun e!305130 () SeekEntryResult!4471)

(assert (=> b!523240 (= e!305130 (Intermediate!4471 true lt!239882 #b00000000000000000000000000000000))))

(declare-fun b!523241 () Bool)

(declare-fun e!305131 () SeekEntryResult!4471)

(assert (=> b!523241 (= e!305130 e!305131)))

(declare-fun c!61580 () Bool)

(declare-fun lt!239988 () (_ BitVec 64))

(assert (=> b!523241 (= c!61580 (or (= lt!239988 lt!239883) (= (bvadd lt!239988 lt!239988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523242 () Bool)

(declare-fun e!305133 () Bool)

(assert (=> b!523242 (= e!305133 (bvsge (x!49077 lt!239989) #b01111111111111111111111111111110))))

(declare-fun b!523243 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523243 (= e!305131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239882 #b00000000000000000000000000000000 mask!3524) lt!239883 lt!239876 mask!3524))))

(declare-fun b!523244 () Bool)

(assert (=> b!523244 (= e!305133 e!305132)))

(declare-fun res!320685 () Bool)

(assert (=> b!523244 (= res!320685 (and ((_ is Intermediate!4471) lt!239989) (not (undefined!5283 lt!239989)) (bvslt (x!49077 lt!239989) #b01111111111111111111111111111110) (bvsge (x!49077 lt!239989) #b00000000000000000000000000000000) (bvsge (x!49077 lt!239989) #b00000000000000000000000000000000)))))

(assert (=> b!523244 (=> (not res!320685) (not e!305132))))

(declare-fun d!80339 () Bool)

(assert (=> d!80339 e!305133))

(declare-fun c!61582 () Bool)

(assert (=> d!80339 (= c!61582 (and ((_ is Intermediate!4471) lt!239989) (undefined!5283 lt!239989)))))

(assert (=> d!80339 (= lt!239989 e!305130)))

(declare-fun c!61581 () Bool)

(assert (=> d!80339 (= c!61581 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80339 (= lt!239988 (select (arr!16007 lt!239876) lt!239882))))

(assert (=> d!80339 (validMask!0 mask!3524)))

(assert (=> d!80339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239882 lt!239883 lt!239876 mask!3524) lt!239989)))

(declare-fun b!523245 () Bool)

(assert (=> b!523245 (= e!305131 (Intermediate!4471 false lt!239882 #b00000000000000000000000000000000))))

(assert (= (and d!80339 c!61581) b!523240))

(assert (= (and d!80339 (not c!61581)) b!523241))

(assert (= (and b!523241 c!61580) b!523245))

(assert (= (and b!523241 (not c!61580)) b!523243))

(assert (= (and d!80339 c!61582) b!523242))

(assert (= (and d!80339 (not c!61582)) b!523244))

(assert (= (and b!523244 res!320685) b!523238))

(assert (= (and b!523238 (not res!320684)) b!523239))

(assert (= (and b!523239 (not res!320683)) b!523237))

(declare-fun m!503569 () Bool)

(assert (=> b!523237 m!503569))

(declare-fun m!503571 () Bool)

(assert (=> b!523243 m!503571))

(assert (=> b!523243 m!503571))

(declare-fun m!503573 () Bool)

(assert (=> b!523243 m!503573))

(declare-fun m!503575 () Bool)

(assert (=> d!80339 m!503575))

(assert (=> d!80339 m!503417))

(assert (=> b!523238 m!503569))

(assert (=> b!523239 m!503569))

(assert (=> b!523068 d!80339))

(declare-fun b!523252 () Bool)

(declare-fun lt!239991 () SeekEntryResult!4471)

(assert (=> b!523252 (and (bvsge (index!20092 lt!239991) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239991) (size!16372 a!3235)))))

(declare-fun e!305143 () Bool)

(assert (=> b!523252 (= e!305143 (= (select (arr!16007 a!3235) (index!20092 lt!239991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523253 () Bool)

(assert (=> b!523253 (and (bvsge (index!20092 lt!239991) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239991) (size!16372 a!3235)))))

(declare-fun res!320689 () Bool)

(assert (=> b!523253 (= res!320689 (= (select (arr!16007 a!3235) (index!20092 lt!239991)) (select (arr!16007 a!3235) j!176)))))

(assert (=> b!523253 (=> res!320689 e!305143)))

(declare-fun e!305141 () Bool)

(assert (=> b!523253 (= e!305141 e!305143)))

(declare-fun b!523254 () Bool)

(assert (=> b!523254 (and (bvsge (index!20092 lt!239991) #b00000000000000000000000000000000) (bvslt (index!20092 lt!239991) (size!16372 a!3235)))))

(declare-fun res!320688 () Bool)

(assert (=> b!523254 (= res!320688 (= (select (arr!16007 a!3235) (index!20092 lt!239991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523254 (=> res!320688 e!305143)))

(declare-fun b!523255 () Bool)

(declare-fun e!305139 () SeekEntryResult!4471)

(assert (=> b!523255 (= e!305139 (Intermediate!4471 true lt!239879 #b00000000000000000000000000000000))))

(declare-fun b!523256 () Bool)

(declare-fun e!305140 () SeekEntryResult!4471)

(assert (=> b!523256 (= e!305139 e!305140)))

(declare-fun lt!239990 () (_ BitVec 64))

(declare-fun c!61585 () Bool)

(assert (=> b!523256 (= c!61585 (or (= lt!239990 (select (arr!16007 a!3235) j!176)) (= (bvadd lt!239990 lt!239990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523257 () Bool)

(declare-fun e!305142 () Bool)

(assert (=> b!523257 (= e!305142 (bvsge (x!49077 lt!239991) #b01111111111111111111111111111110))))

(declare-fun b!523258 () Bool)

(assert (=> b!523258 (= e!305140 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239879 #b00000000000000000000000000000000 mask!3524) (select (arr!16007 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523259 () Bool)

(assert (=> b!523259 (= e!305142 e!305141)))

(declare-fun res!320690 () Bool)

(assert (=> b!523259 (= res!320690 (and ((_ is Intermediate!4471) lt!239991) (not (undefined!5283 lt!239991)) (bvslt (x!49077 lt!239991) #b01111111111111111111111111111110) (bvsge (x!49077 lt!239991) #b00000000000000000000000000000000) (bvsge (x!49077 lt!239991) #b00000000000000000000000000000000)))))

(assert (=> b!523259 (=> (not res!320690) (not e!305141))))

(declare-fun d!80345 () Bool)

(assert (=> d!80345 e!305142))

(declare-fun c!61587 () Bool)

(assert (=> d!80345 (= c!61587 (and ((_ is Intermediate!4471) lt!239991) (undefined!5283 lt!239991)))))

(assert (=> d!80345 (= lt!239991 e!305139)))

(declare-fun c!61586 () Bool)

(assert (=> d!80345 (= c!61586 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80345 (= lt!239990 (select (arr!16007 a!3235) lt!239879))))

(assert (=> d!80345 (validMask!0 mask!3524)))

(assert (=> d!80345 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239879 (select (arr!16007 a!3235) j!176) a!3235 mask!3524) lt!239991)))

(declare-fun b!523260 () Bool)

(assert (=> b!523260 (= e!305140 (Intermediate!4471 false lt!239879 #b00000000000000000000000000000000))))

(assert (= (and d!80345 c!61586) b!523255))

(assert (= (and d!80345 (not c!61586)) b!523256))

(assert (= (and b!523256 c!61585) b!523260))

(assert (= (and b!523256 (not c!61585)) b!523258))

(assert (= (and d!80345 c!61587) b!523257))

(assert (= (and d!80345 (not c!61587)) b!523259))

(assert (= (and b!523259 res!320690) b!523253))

(assert (= (and b!523253 (not res!320689)) b!523254))

(assert (= (and b!523254 (not res!320688)) b!523252))

(declare-fun m!503577 () Bool)

(assert (=> b!523252 m!503577))

(declare-fun m!503579 () Bool)

(assert (=> b!523258 m!503579))

(assert (=> b!523258 m!503579))

(assert (=> b!523258 m!503411))

(declare-fun m!503581 () Bool)

(assert (=> b!523258 m!503581))

(declare-fun m!503583 () Bool)

(assert (=> d!80345 m!503583))

(assert (=> d!80345 m!503417))

(assert (=> b!523253 m!503577))

(assert (=> b!523254 m!503577))

(assert (=> b!523068 d!80345))

(declare-fun d!80347 () Bool)

(assert (=> d!80347 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240002 () Unit!16330)

(declare-fun choose!38 (array!33305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16330)

(assert (=> d!80347 (= lt!240002 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80347 (validMask!0 mask!3524)))

(assert (=> d!80347 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240002)))

(declare-fun bs!16420 () Bool)

(assert (= bs!16420 d!80347))

(assert (=> bs!16420 m!503431))

(declare-fun m!503593 () Bool)

(assert (=> bs!16420 m!503593))

(assert (=> bs!16420 m!503417))

(assert (=> b!523068 d!80347))

(declare-fun d!80351 () Bool)

(declare-fun lt!240013 () (_ BitVec 32))

(declare-fun lt!240012 () (_ BitVec 32))

(assert (=> d!80351 (= lt!240013 (bvmul (bvxor lt!240012 (bvlshr lt!240012 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80351 (= lt!240012 ((_ extract 31 0) (bvand (bvxor (select (arr!16007 a!3235) j!176) (bvlshr (select (arr!16007 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80351 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320707 (let ((h!11129 ((_ extract 31 0) (bvand (bvxor (select (arr!16007 a!3235) j!176) (bvlshr (select (arr!16007 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49085 (bvmul (bvxor h!11129 (bvlshr h!11129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49085 (bvlshr x!49085 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320707 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320707 #b00000000000000000000000000000000))))))

(assert (=> d!80351 (= (toIndex!0 (select (arr!16007 a!3235) j!176) mask!3524) (bvand (bvxor lt!240013 (bvlshr lt!240013 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523068 d!80351))

(declare-fun d!80361 () Bool)

(declare-fun lt!240015 () (_ BitVec 32))

(declare-fun lt!240014 () (_ BitVec 32))

(assert (=> d!80361 (= lt!240015 (bvmul (bvxor lt!240014 (bvlshr lt!240014 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80361 (= lt!240014 ((_ extract 31 0) (bvand (bvxor lt!239883 (bvlshr lt!239883 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80361 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320707 (let ((h!11129 ((_ extract 31 0) (bvand (bvxor lt!239883 (bvlshr lt!239883 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49085 (bvmul (bvxor h!11129 (bvlshr h!11129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49085 (bvlshr x!49085 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320707 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320707 #b00000000000000000000000000000000))))))

(assert (=> d!80361 (= (toIndex!0 lt!239883 mask!3524) (bvand (bvxor lt!240015 (bvlshr lt!240015 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523068 d!80361))

(declare-fun b!523320 () Bool)

(declare-fun e!305181 () Bool)

(declare-fun call!31813 () Bool)

(assert (=> b!523320 (= e!305181 call!31813)))

(declare-fun d!80363 () Bool)

(declare-fun res!320717 () Bool)

(declare-fun e!305179 () Bool)

(assert (=> d!80363 (=> res!320717 e!305179)))

(assert (=> d!80363 (= res!320717 (bvsge #b00000000000000000000000000000000 (size!16372 a!3235)))))

(assert (=> d!80363 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10201) e!305179)))

(declare-fun b!523321 () Bool)

(declare-fun e!305182 () Bool)

(assert (=> b!523321 (= e!305182 e!305181)))

(declare-fun c!61605 () Bool)

(assert (=> b!523321 (= c!61605 (validKeyInArray!0 (select (arr!16007 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31810 () Bool)

(assert (=> bm!31810 (= call!31813 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61605 (Cons!10200 (select (arr!16007 a!3235) #b00000000000000000000000000000000) Nil!10201) Nil!10201)))))

(declare-fun b!523322 () Bool)

(assert (=> b!523322 (= e!305181 call!31813)))

(declare-fun b!523323 () Bool)

(declare-fun e!305180 () Bool)

(declare-fun contains!2748 (List!10204 (_ BitVec 64)) Bool)

(assert (=> b!523323 (= e!305180 (contains!2748 Nil!10201 (select (arr!16007 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523324 () Bool)

(assert (=> b!523324 (= e!305179 e!305182)))

(declare-fun res!320718 () Bool)

(assert (=> b!523324 (=> (not res!320718) (not e!305182))))

(assert (=> b!523324 (= res!320718 (not e!305180))))

(declare-fun res!320719 () Bool)

(assert (=> b!523324 (=> (not res!320719) (not e!305180))))

(assert (=> b!523324 (= res!320719 (validKeyInArray!0 (select (arr!16007 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80363 (not res!320717)) b!523324))

(assert (= (and b!523324 res!320719) b!523323))

(assert (= (and b!523324 res!320718) b!523321))

(assert (= (and b!523321 c!61605) b!523320))

(assert (= (and b!523321 (not c!61605)) b!523322))

(assert (= (or b!523320 b!523322) bm!31810))

(declare-fun m!503613 () Bool)

(assert (=> b!523321 m!503613))

(assert (=> b!523321 m!503613))

(declare-fun m!503615 () Bool)

(assert (=> b!523321 m!503615))

(assert (=> bm!31810 m!503613))

(declare-fun m!503617 () Bool)

(assert (=> bm!31810 m!503617))

(assert (=> b!523323 m!503613))

(assert (=> b!523323 m!503613))

(declare-fun m!503619 () Bool)

(assert (=> b!523323 m!503619))

(assert (=> b!523324 m!503613))

(assert (=> b!523324 m!503613))

(assert (=> b!523324 m!503615))

(assert (=> b!523067 d!80363))

(declare-fun d!80365 () Bool)

(declare-fun res!320724 () Bool)

(declare-fun e!305187 () Bool)

(assert (=> d!80365 (=> res!320724 e!305187)))

(assert (=> d!80365 (= res!320724 (= (select (arr!16007 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80365 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305187)))

(declare-fun b!523329 () Bool)

(declare-fun e!305188 () Bool)

(assert (=> b!523329 (= e!305187 e!305188)))

(declare-fun res!320725 () Bool)

(assert (=> b!523329 (=> (not res!320725) (not e!305188))))

(assert (=> b!523329 (= res!320725 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16372 a!3235)))))

(declare-fun b!523330 () Bool)

(assert (=> b!523330 (= e!305188 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80365 (not res!320724)) b!523329))

(assert (= (and b!523329 res!320725) b!523330))

(assert (=> d!80365 m!503613))

(declare-fun m!503621 () Bool)

(assert (=> b!523330 m!503621))

(assert (=> b!523062 d!80365))

(declare-fun d!80367 () Bool)

(assert (=> d!80367 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523065 d!80367))

(declare-fun d!80369 () Bool)

(declare-fun e!305211 () Bool)

(assert (=> d!80369 e!305211))

(declare-fun res!320729 () Bool)

(assert (=> d!80369 (=> (not res!320729) (not e!305211))))

(assert (=> d!80369 (= res!320729 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16372 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16372 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16372 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235))))))

(declare-fun lt!240036 () Unit!16330)

(declare-fun choose!47 (array!33305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16330)

(assert (=> d!80369 (= lt!240036 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!239879 #b00000000000000000000000000000000 (index!20092 lt!239878) (x!49077 lt!239878) mask!3524))))

(assert (=> d!80369 (validMask!0 mask!3524)))

(assert (=> d!80369 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239879 #b00000000000000000000000000000000 (index!20092 lt!239878) (x!49077 lt!239878) mask!3524) lt!240036)))

(declare-fun b!523369 () Bool)

(assert (=> b!523369 (= e!305211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239879 (select (store (arr!16007 a!3235) i!1204 k0!2280) j!176) (array!33306 (store (arr!16007 a!3235) i!1204 k0!2280) (size!16372 a!3235)) mask!3524) (Intermediate!4471 false (index!20092 lt!239878) (x!49077 lt!239878))))))

(assert (= (and d!80369 res!320729) b!523369))

(declare-fun m!503647 () Bool)

(assert (=> d!80369 m!503647))

(assert (=> d!80369 m!503417))

(assert (=> b!523369 m!503421))

(assert (=> b!523369 m!503425))

(assert (=> b!523369 m!503425))

(declare-fun m!503649 () Bool)

(assert (=> b!523369 m!503649))

(assert (=> b!523071 d!80369))

(declare-fun b!523380 () Bool)

(declare-fun lt!240038 () SeekEntryResult!4471)

(assert (=> b!523380 (and (bvsge (index!20092 lt!240038) #b00000000000000000000000000000000) (bvslt (index!20092 lt!240038) (size!16372 lt!239876)))))

(declare-fun e!305222 () Bool)

(assert (=> b!523380 (= e!305222 (= (select (arr!16007 lt!239876) (index!20092 lt!240038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523381 () Bool)

(assert (=> b!523381 (and (bvsge (index!20092 lt!240038) #b00000000000000000000000000000000) (bvslt (index!20092 lt!240038) (size!16372 lt!239876)))))

(declare-fun res!320736 () Bool)

(assert (=> b!523381 (= res!320736 (= (select (arr!16007 lt!239876) (index!20092 lt!240038)) lt!239883))))

(assert (=> b!523381 (=> res!320736 e!305222)))

(declare-fun e!305220 () Bool)

(assert (=> b!523381 (= e!305220 e!305222)))

(declare-fun b!523382 () Bool)

(assert (=> b!523382 (and (bvsge (index!20092 lt!240038) #b00000000000000000000000000000000) (bvslt (index!20092 lt!240038) (size!16372 lt!239876)))))

(declare-fun res!320735 () Bool)

(assert (=> b!523382 (= res!320735 (= (select (arr!16007 lt!239876) (index!20092 lt!240038)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523382 (=> res!320735 e!305222)))

(declare-fun b!523383 () Bool)

(declare-fun e!305218 () SeekEntryResult!4471)

(assert (=> b!523383 (= e!305218 (Intermediate!4471 true lt!239879 #b00000000000000000000000000000000))))

(declare-fun b!523384 () Bool)

(declare-fun e!305219 () SeekEntryResult!4471)

(assert (=> b!523384 (= e!305218 e!305219)))

(declare-fun c!61626 () Bool)

(declare-fun lt!240037 () (_ BitVec 64))

(assert (=> b!523384 (= c!61626 (or (= lt!240037 lt!239883) (= (bvadd lt!240037 lt!240037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523385 () Bool)

(declare-fun e!305221 () Bool)

(assert (=> b!523385 (= e!305221 (bvsge (x!49077 lt!240038) #b01111111111111111111111111111110))))

(declare-fun b!523386 () Bool)

(assert (=> b!523386 (= e!305219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239879 #b00000000000000000000000000000000 mask!3524) lt!239883 lt!239876 mask!3524))))

(declare-fun b!523387 () Bool)

(assert (=> b!523387 (= e!305221 e!305220)))

(declare-fun res!320737 () Bool)

(assert (=> b!523387 (= res!320737 (and ((_ is Intermediate!4471) lt!240038) (not (undefined!5283 lt!240038)) (bvslt (x!49077 lt!240038) #b01111111111111111111111111111110) (bvsge (x!49077 lt!240038) #b00000000000000000000000000000000) (bvsge (x!49077 lt!240038) #b00000000000000000000000000000000)))))

(assert (=> b!523387 (=> (not res!320737) (not e!305220))))

(declare-fun d!80375 () Bool)

(assert (=> d!80375 e!305221))

(declare-fun c!61628 () Bool)

(assert (=> d!80375 (= c!61628 (and ((_ is Intermediate!4471) lt!240038) (undefined!5283 lt!240038)))))

(assert (=> d!80375 (= lt!240038 e!305218)))

(declare-fun c!61627 () Bool)

(assert (=> d!80375 (= c!61627 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80375 (= lt!240037 (select (arr!16007 lt!239876) lt!239879))))

(assert (=> d!80375 (validMask!0 mask!3524)))

(assert (=> d!80375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239879 lt!239883 lt!239876 mask!3524) lt!240038)))

(declare-fun b!523388 () Bool)

(assert (=> b!523388 (= e!305219 (Intermediate!4471 false lt!239879 #b00000000000000000000000000000000))))

(assert (= (and d!80375 c!61627) b!523383))

(assert (= (and d!80375 (not c!61627)) b!523384))

(assert (= (and b!523384 c!61626) b!523388))

(assert (= (and b!523384 (not c!61626)) b!523386))

(assert (= (and d!80375 c!61628) b!523385))

(assert (= (and d!80375 (not c!61628)) b!523387))

(assert (= (and b!523387 res!320737) b!523381))

(assert (= (and b!523381 (not res!320736)) b!523382))

(assert (= (and b!523382 (not res!320735)) b!523380))

(declare-fun m!503651 () Bool)

(assert (=> b!523380 m!503651))

(assert (=> b!523386 m!503579))

(assert (=> b!523386 m!503579))

(declare-fun m!503653 () Bool)

(assert (=> b!523386 m!503653))

(declare-fun m!503655 () Bool)

(assert (=> d!80375 m!503655))

(assert (=> d!80375 m!503417))

(assert (=> b!523381 m!503651))

(assert (=> b!523382 m!503651))

(assert (=> b!523071 d!80375))

(declare-fun b!523389 () Bool)

(declare-fun e!305224 () Bool)

(declare-fun e!305225 () Bool)

(assert (=> b!523389 (= e!305224 e!305225)))

(declare-fun c!61629 () Bool)

(assert (=> b!523389 (= c!61629 (validKeyInArray!0 (select (arr!16007 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523390 () Bool)

(declare-fun e!305223 () Bool)

(assert (=> b!523390 (= e!305225 e!305223)))

(declare-fun lt!240040 () (_ BitVec 64))

(assert (=> b!523390 (= lt!240040 (select (arr!16007 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240041 () Unit!16330)

(assert (=> b!523390 (= lt!240041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240040 #b00000000000000000000000000000000))))

(assert (=> b!523390 (arrayContainsKey!0 a!3235 lt!240040 #b00000000000000000000000000000000)))

(declare-fun lt!240039 () Unit!16330)

(assert (=> b!523390 (= lt!240039 lt!240041)))

(declare-fun res!320739 () Bool)

(assert (=> b!523390 (= res!320739 (= (seekEntryOrOpen!0 (select (arr!16007 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4471 #b00000000000000000000000000000000)))))

(assert (=> b!523390 (=> (not res!320739) (not e!305223))))

(declare-fun b!523391 () Bool)

(declare-fun call!31816 () Bool)

(assert (=> b!523391 (= e!305225 call!31816)))

(declare-fun bm!31813 () Bool)

(assert (=> bm!31813 (= call!31816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80377 () Bool)

(declare-fun res!320738 () Bool)

(assert (=> d!80377 (=> res!320738 e!305224)))

(assert (=> d!80377 (= res!320738 (bvsge #b00000000000000000000000000000000 (size!16372 a!3235)))))

(assert (=> d!80377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305224)))

(declare-fun b!523392 () Bool)

(assert (=> b!523392 (= e!305223 call!31816)))

(assert (= (and d!80377 (not res!320738)) b!523389))

(assert (= (and b!523389 c!61629) b!523390))

(assert (= (and b!523389 (not c!61629)) b!523391))

(assert (= (and b!523390 res!320739) b!523392))

(assert (= (or b!523392 b!523391) bm!31813))

(assert (=> b!523389 m!503613))

(assert (=> b!523389 m!503613))

(assert (=> b!523389 m!503615))

(assert (=> b!523390 m!503613))

(declare-fun m!503657 () Bool)

(assert (=> b!523390 m!503657))

(declare-fun m!503659 () Bool)

(assert (=> b!523390 m!503659))

(assert (=> b!523390 m!503613))

(declare-fun m!503661 () Bool)

(assert (=> b!523390 m!503661))

(declare-fun m!503663 () Bool)

(assert (=> bm!31813 m!503663))

(assert (=> b!523066 d!80377))

(check-sat (not d!80345) (not b!523324) (not b!523173) (not b!523330) (not b!523243) (not d!80321) (not b!523386) (not bm!31804) (not b!523390) (not b!523192) (not b!523179) (not d!80369) (not d!80339) (not d!80347) (not d!80375) (not bm!31813) (not b!523389) (not bm!31810) (not b!523321) (not b!523369) (not b!523258) (not b!523193) (not b!523323) (not d!80319))
(check-sat)
