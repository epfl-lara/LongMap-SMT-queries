; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47704 () Bool)

(assert start!47704)

(declare-fun b!524575 () Bool)

(declare-fun res!321470 () Bool)

(declare-fun e!305923 () Bool)

(assert (=> b!524575 (=> (not res!321470) (not e!305923))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33341 0))(
  ( (array!33342 (arr!16022 (Array (_ BitVec 32) (_ BitVec 64))) (size!16386 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33341)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524575 (= res!321470 (and (= (size!16386 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16386 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16386 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524576 () Bool)

(declare-fun res!321472 () Bool)

(declare-fun e!305922 () Bool)

(assert (=> b!524576 (=> res!321472 e!305922)))

(declare-datatypes ((SeekEntryResult!4489 0))(
  ( (MissingZero!4489 (index!20168 (_ BitVec 32))) (Found!4489 (index!20169 (_ BitVec 32))) (Intermediate!4489 (undefined!5301 Bool) (index!20170 (_ BitVec 32)) (x!49150 (_ BitVec 32))) (Undefined!4489) (MissingVacant!4489 (index!20171 (_ BitVec 32))) )
))
(declare-fun lt!240779 () SeekEntryResult!4489)

(assert (=> b!524576 (= res!321472 (or (undefined!5301 lt!240779) (not (is-Intermediate!4489 lt!240779))))))

(declare-fun b!524577 () Bool)

(assert (=> b!524577 (= e!305922 true)))

(assert (=> b!524577 (and (or (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16408 0))(
  ( (Unit!16409) )
))
(declare-fun lt!240782 () Unit!16408)

(declare-fun e!305924 () Unit!16408)

(assert (=> b!524577 (= lt!240782 e!305924)))

(declare-fun c!61862 () Bool)

(assert (=> b!524577 (= c!61862 (= (select (arr!16022 a!3235) (index!20170 lt!240779)) (select (arr!16022 a!3235) j!176)))))

(assert (=> b!524577 (and (bvslt (x!49150 lt!240779) #b01111111111111111111111111111110) (or (= (select (arr!16022 a!3235) (index!20170 lt!240779)) (select (arr!16022 a!3235) j!176)) (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16022 a!3235) (index!20170 lt!240779)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524578 () Bool)

(declare-fun e!305926 () Bool)

(assert (=> b!524578 (= e!305926 (not e!305922))))

(declare-fun res!321468 () Bool)

(assert (=> b!524578 (=> res!321468 e!305922)))

(declare-fun lt!240784 () (_ BitVec 64))

(declare-fun lt!240780 () array!33341)

(declare-fun lt!240778 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33341 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!524578 (= res!321468 (= lt!240779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240778 lt!240784 lt!240780 mask!3524)))))

(declare-fun lt!240776 () (_ BitVec 32))

(assert (=> b!524578 (= lt!240779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240776 (select (arr!16022 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524578 (= lt!240778 (toIndex!0 lt!240784 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!524578 (= lt!240784 (select (store (arr!16022 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524578 (= lt!240776 (toIndex!0 (select (arr!16022 a!3235) j!176) mask!3524))))

(assert (=> b!524578 (= lt!240780 (array!33342 (store (arr!16022 a!3235) i!1204 k!2280) (size!16386 a!3235)))))

(declare-fun e!305928 () Bool)

(assert (=> b!524578 e!305928))

(declare-fun res!321467 () Bool)

(assert (=> b!524578 (=> (not res!321467) (not e!305928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33341 (_ BitVec 32)) Bool)

(assert (=> b!524578 (= res!321467 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240783 () Unit!16408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16408)

(assert (=> b!524578 (= lt!240783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524579 () Bool)

(assert (=> b!524579 (= e!305923 e!305926)))

(declare-fun res!321471 () Bool)

(assert (=> b!524579 (=> (not res!321471) (not e!305926))))

(declare-fun lt!240777 () SeekEntryResult!4489)

(assert (=> b!524579 (= res!321471 (or (= lt!240777 (MissingZero!4489 i!1204)) (= lt!240777 (MissingVacant!4489 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33341 (_ BitVec 32)) SeekEntryResult!4489)

(assert (=> b!524579 (= lt!240777 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524580 () Bool)

(declare-fun e!305927 () Bool)

(assert (=> b!524580 (= e!305927 false)))

(declare-fun b!524581 () Bool)

(assert (=> b!524581 (= e!305928 (= (seekEntryOrOpen!0 (select (arr!16022 a!3235) j!176) a!3235 mask!3524) (Found!4489 j!176)))))

(declare-fun b!524582 () Bool)

(declare-fun res!321463 () Bool)

(assert (=> b!524582 (=> (not res!321463) (not e!305926))))

(declare-datatypes ((List!10180 0))(
  ( (Nil!10177) (Cons!10176 (h!11107 (_ BitVec 64)) (t!16408 List!10180)) )
))
(declare-fun arrayNoDuplicates!0 (array!33341 (_ BitVec 32) List!10180) Bool)

(assert (=> b!524582 (= res!321463 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10177))))

(declare-fun b!524583 () Bool)

(declare-fun res!321465 () Bool)

(assert (=> b!524583 (=> (not res!321465) (not e!305923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524583 (= res!321465 (validKeyInArray!0 (select (arr!16022 a!3235) j!176)))))

(declare-fun b!524584 () Bool)

(declare-fun res!321473 () Bool)

(assert (=> b!524584 (=> (not res!321473) (not e!305923))))

(declare-fun arrayContainsKey!0 (array!33341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524584 (= res!321473 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!321464 () Bool)

(assert (=> start!47704 (=> (not res!321464) (not e!305923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47704 (= res!321464 (validMask!0 mask!3524))))

(assert (=> start!47704 e!305923))

(assert (=> start!47704 true))

(declare-fun array_inv!11818 (array!33341) Bool)

(assert (=> start!47704 (array_inv!11818 a!3235)))

(declare-fun b!524585 () Bool)

(declare-fun Unit!16410 () Unit!16408)

(assert (=> b!524585 (= e!305924 Unit!16410)))

(declare-fun lt!240781 () Unit!16408)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16408)

(assert (=> b!524585 (= lt!240781 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240776 #b00000000000000000000000000000000 (index!20170 lt!240779) (x!49150 lt!240779) mask!3524))))

(declare-fun res!321462 () Bool)

(assert (=> b!524585 (= res!321462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240776 lt!240784 lt!240780 mask!3524) (Intermediate!4489 false (index!20170 lt!240779) (x!49150 lt!240779))))))

(assert (=> b!524585 (=> (not res!321462) (not e!305927))))

(assert (=> b!524585 e!305927))

(declare-fun b!524586 () Bool)

(declare-fun res!321466 () Bool)

(assert (=> b!524586 (=> (not res!321466) (not e!305923))))

(assert (=> b!524586 (= res!321466 (validKeyInArray!0 k!2280))))

(declare-fun b!524587 () Bool)

(declare-fun res!321469 () Bool)

(assert (=> b!524587 (=> (not res!321469) (not e!305926))))

(assert (=> b!524587 (= res!321469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524588 () Bool)

(declare-fun Unit!16411 () Unit!16408)

(assert (=> b!524588 (= e!305924 Unit!16411)))

(assert (= (and start!47704 res!321464) b!524575))

(assert (= (and b!524575 res!321470) b!524583))

(assert (= (and b!524583 res!321465) b!524586))

(assert (= (and b!524586 res!321466) b!524584))

(assert (= (and b!524584 res!321473) b!524579))

(assert (= (and b!524579 res!321471) b!524587))

(assert (= (and b!524587 res!321469) b!524582))

(assert (= (and b!524582 res!321463) b!524578))

(assert (= (and b!524578 res!321467) b!524581))

(assert (= (and b!524578 (not res!321468)) b!524576))

(assert (= (and b!524576 (not res!321472)) b!524577))

(assert (= (and b!524577 c!61862) b!524585))

(assert (= (and b!524577 (not c!61862)) b!524588))

(assert (= (and b!524585 res!321462) b!524580))

(declare-fun m!505209 () Bool)

(assert (=> b!524584 m!505209))

(declare-fun m!505211 () Bool)

(assert (=> b!524585 m!505211))

(declare-fun m!505213 () Bool)

(assert (=> b!524585 m!505213))

(declare-fun m!505215 () Bool)

(assert (=> start!47704 m!505215))

(declare-fun m!505217 () Bool)

(assert (=> start!47704 m!505217))

(declare-fun m!505219 () Bool)

(assert (=> b!524579 m!505219))

(declare-fun m!505221 () Bool)

(assert (=> b!524586 m!505221))

(declare-fun m!505223 () Bool)

(assert (=> b!524583 m!505223))

(assert (=> b!524583 m!505223))

(declare-fun m!505225 () Bool)

(assert (=> b!524583 m!505225))

(declare-fun m!505227 () Bool)

(assert (=> b!524577 m!505227))

(assert (=> b!524577 m!505223))

(declare-fun m!505229 () Bool)

(assert (=> b!524587 m!505229))

(declare-fun m!505231 () Bool)

(assert (=> b!524578 m!505231))

(declare-fun m!505233 () Bool)

(assert (=> b!524578 m!505233))

(declare-fun m!505235 () Bool)

(assert (=> b!524578 m!505235))

(declare-fun m!505237 () Bool)

(assert (=> b!524578 m!505237))

(declare-fun m!505239 () Bool)

(assert (=> b!524578 m!505239))

(assert (=> b!524578 m!505223))

(declare-fun m!505241 () Bool)

(assert (=> b!524578 m!505241))

(assert (=> b!524578 m!505223))

(declare-fun m!505243 () Bool)

(assert (=> b!524578 m!505243))

(assert (=> b!524578 m!505223))

(declare-fun m!505245 () Bool)

(assert (=> b!524578 m!505245))

(declare-fun m!505247 () Bool)

(assert (=> b!524582 m!505247))

(assert (=> b!524581 m!505223))

(assert (=> b!524581 m!505223))

(declare-fun m!505249 () Bool)

(assert (=> b!524581 m!505249))

(push 1)

