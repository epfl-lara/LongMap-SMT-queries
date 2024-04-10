; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47902 () Bool)

(assert start!47902)

(declare-fun b!527557 () Bool)

(declare-fun e!307466 () Bool)

(declare-fun e!307464 () Bool)

(assert (=> b!527557 (= e!307466 e!307464)))

(declare-fun res!323866 () Bool)

(assert (=> b!527557 (=> (not res!323866) (not e!307464))))

(declare-datatypes ((SeekEntryResult!4552 0))(
  ( (MissingZero!4552 (index!20426 (_ BitVec 32))) (Found!4552 (index!20427 (_ BitVec 32))) (Intermediate!4552 (undefined!5364 Bool) (index!20428 (_ BitVec 32)) (x!49393 (_ BitVec 32))) (Undefined!4552) (MissingVacant!4552 (index!20429 (_ BitVec 32))) )
))
(declare-fun lt!242832 () SeekEntryResult!4552)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527557 (= res!323866 (or (= lt!242832 (MissingZero!4552 i!1204)) (= lt!242832 (MissingVacant!4552 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!33470 0))(
  ( (array!33471 (arr!16085 (Array (_ BitVec 32) (_ BitVec 64))) (size!16449 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33470)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33470 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!527557 (= lt!242832 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527559 () Bool)

(declare-fun res!323874 () Bool)

(assert (=> b!527559 (=> (not res!323874) (not e!307466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527559 (= res!323874 (validKeyInArray!0 k!2280))))

(declare-fun e!307468 () Bool)

(declare-fun b!527560 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!527560 (= e!307468 (= (seekEntryOrOpen!0 (select (arr!16085 a!3235) j!176) a!3235 mask!3524) (Found!4552 j!176)))))

(declare-fun b!527561 () Bool)

(declare-fun res!323875 () Bool)

(assert (=> b!527561 (=> (not res!323875) (not e!307466))))

(declare-fun arrayContainsKey!0 (array!33470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527561 (= res!323875 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527562 () Bool)

(declare-datatypes ((Unit!16660 0))(
  ( (Unit!16661) )
))
(declare-fun e!307467 () Unit!16660)

(declare-fun Unit!16662 () Unit!16660)

(assert (=> b!527562 (= e!307467 Unit!16662)))

(declare-fun lt!242830 () Unit!16660)

(declare-fun lt!242829 () (_ BitVec 32))

(declare-fun lt!242833 () SeekEntryResult!4552)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16660)

(assert (=> b!527562 (= lt!242830 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242829 #b00000000000000000000000000000000 (index!20428 lt!242833) (x!49393 lt!242833) mask!3524))))

(declare-fun lt!242831 () (_ BitVec 64))

(declare-fun lt!242827 () array!33470)

(declare-fun res!323872 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33470 (_ BitVec 32)) SeekEntryResult!4552)

(assert (=> b!527562 (= res!323872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242829 lt!242831 lt!242827 mask!3524) (Intermediate!4552 false (index!20428 lt!242833) (x!49393 lt!242833))))))

(declare-fun e!307469 () Bool)

(assert (=> b!527562 (=> (not res!323872) (not e!307469))))

(assert (=> b!527562 e!307469))

(declare-fun b!527563 () Bool)

(declare-fun res!323873 () Bool)

(assert (=> b!527563 (=> (not res!323873) (not e!307466))))

(assert (=> b!527563 (= res!323873 (validKeyInArray!0 (select (arr!16085 a!3235) j!176)))))

(declare-fun b!527564 () Bool)

(assert (=> b!527564 (= e!307469 false)))

(declare-fun b!527565 () Bool)

(declare-fun Unit!16663 () Unit!16660)

(assert (=> b!527565 (= e!307467 Unit!16663)))

(declare-fun b!527566 () Bool)

(declare-fun res!323869 () Bool)

(assert (=> b!527566 (=> (not res!323869) (not e!307464))))

(declare-datatypes ((List!10243 0))(
  ( (Nil!10240) (Cons!10239 (h!11173 (_ BitVec 64)) (t!16471 List!10243)) )
))
(declare-fun arrayNoDuplicates!0 (array!33470 (_ BitVec 32) List!10243) Bool)

(assert (=> b!527566 (= res!323869 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10240))))

(declare-fun b!527567 () Bool)

(declare-fun e!307465 () Bool)

(assert (=> b!527567 (= e!307464 (not e!307465))))

(declare-fun res!323867 () Bool)

(assert (=> b!527567 (=> res!323867 e!307465)))

(declare-fun lt!242836 () (_ BitVec 32))

(assert (=> b!527567 (= res!323867 (= lt!242833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242836 lt!242831 lt!242827 mask!3524)))))

(assert (=> b!527567 (= lt!242833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242829 (select (arr!16085 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527567 (= lt!242836 (toIndex!0 lt!242831 mask!3524))))

(assert (=> b!527567 (= lt!242831 (select (store (arr!16085 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527567 (= lt!242829 (toIndex!0 (select (arr!16085 a!3235) j!176) mask!3524))))

(assert (=> b!527567 (= lt!242827 (array!33471 (store (arr!16085 a!3235) i!1204 k!2280) (size!16449 a!3235)))))

(assert (=> b!527567 e!307468))

(declare-fun res!323868 () Bool)

(assert (=> b!527567 (=> (not res!323868) (not e!307468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33470 (_ BitVec 32)) Bool)

(assert (=> b!527567 (= res!323868 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242835 () Unit!16660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16660)

(assert (=> b!527567 (= lt!242835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527568 () Bool)

(declare-fun res!323876 () Bool)

(assert (=> b!527568 (=> (not res!323876) (not e!307464))))

(assert (=> b!527568 (= res!323876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527558 () Bool)

(assert (=> b!527558 (= e!307465 (or (bvsgt (x!49393 lt!242833) #b01111111111111111111111111111110) (bvslt lt!242829 #b00000000000000000000000000000000) (bvsge lt!242829 (size!16449 a!3235)) (bvslt (index!20428 lt!242833) #b00000000000000000000000000000000) (bvsge (index!20428 lt!242833) (size!16449 a!3235)) (= lt!242833 (Intermediate!4552 false (index!20428 lt!242833) (x!49393 lt!242833)))))))

(assert (=> b!527558 (= (index!20428 lt!242833) i!1204)))

(declare-fun lt!242828 () Unit!16660)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16660)

(assert (=> b!527558 (= lt!242828 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242829 #b00000000000000000000000000000000 (index!20428 lt!242833) (x!49393 lt!242833) mask!3524))))

(assert (=> b!527558 (and (or (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242834 () Unit!16660)

(assert (=> b!527558 (= lt!242834 e!307467)))

(declare-fun c!62153 () Bool)

(assert (=> b!527558 (= c!62153 (= (select (arr!16085 a!3235) (index!20428 lt!242833)) (select (arr!16085 a!3235) j!176)))))

(assert (=> b!527558 (and (bvslt (x!49393 lt!242833) #b01111111111111111111111111111110) (or (= (select (arr!16085 a!3235) (index!20428 lt!242833)) (select (arr!16085 a!3235) j!176)) (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16085 a!3235) (index!20428 lt!242833)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!323870 () Bool)

(assert (=> start!47902 (=> (not res!323870) (not e!307466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47902 (= res!323870 (validMask!0 mask!3524))))

(assert (=> start!47902 e!307466))

(assert (=> start!47902 true))

(declare-fun array_inv!11881 (array!33470) Bool)

(assert (=> start!47902 (array_inv!11881 a!3235)))

(declare-fun b!527569 () Bool)

(declare-fun res!323871 () Bool)

(assert (=> b!527569 (=> (not res!323871) (not e!307466))))

(assert (=> b!527569 (= res!323871 (and (= (size!16449 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16449 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16449 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527570 () Bool)

(declare-fun res!323865 () Bool)

(assert (=> b!527570 (=> res!323865 e!307465)))

(assert (=> b!527570 (= res!323865 (or (undefined!5364 lt!242833) (not (is-Intermediate!4552 lt!242833))))))

(assert (= (and start!47902 res!323870) b!527569))

(assert (= (and b!527569 res!323871) b!527563))

(assert (= (and b!527563 res!323873) b!527559))

(assert (= (and b!527559 res!323874) b!527561))

(assert (= (and b!527561 res!323875) b!527557))

(assert (= (and b!527557 res!323866) b!527568))

(assert (= (and b!527568 res!323876) b!527566))

(assert (= (and b!527566 res!323869) b!527567))

(assert (= (and b!527567 res!323868) b!527560))

(assert (= (and b!527567 (not res!323867)) b!527570))

(assert (= (and b!527570 (not res!323865)) b!527558))

(assert (= (and b!527558 c!62153) b!527562))

(assert (= (and b!527558 (not c!62153)) b!527565))

(assert (= (and b!527562 res!323872) b!527564))

(declare-fun m!508213 () Bool)

(assert (=> b!527559 m!508213))

(declare-fun m!508215 () Bool)

(assert (=> b!527566 m!508215))

(declare-fun m!508217 () Bool)

(assert (=> b!527563 m!508217))

(assert (=> b!527563 m!508217))

(declare-fun m!508219 () Bool)

(assert (=> b!527563 m!508219))

(declare-fun m!508221 () Bool)

(assert (=> b!527567 m!508221))

(declare-fun m!508223 () Bool)

(assert (=> b!527567 m!508223))

(declare-fun m!508225 () Bool)

(assert (=> b!527567 m!508225))

(assert (=> b!527567 m!508217))

(declare-fun m!508227 () Bool)

(assert (=> b!527567 m!508227))

(assert (=> b!527567 m!508217))

(declare-fun m!508229 () Bool)

(assert (=> b!527567 m!508229))

(assert (=> b!527567 m!508217))

(declare-fun m!508231 () Bool)

(assert (=> b!527567 m!508231))

(declare-fun m!508233 () Bool)

(assert (=> b!527567 m!508233))

(declare-fun m!508235 () Bool)

(assert (=> b!527567 m!508235))

(declare-fun m!508237 () Bool)

(assert (=> start!47902 m!508237))

(declare-fun m!508239 () Bool)

(assert (=> start!47902 m!508239))

(declare-fun m!508241 () Bool)

(assert (=> b!527558 m!508241))

(declare-fun m!508243 () Bool)

(assert (=> b!527558 m!508243))

(assert (=> b!527558 m!508217))

(declare-fun m!508245 () Bool)

(assert (=> b!527561 m!508245))

(declare-fun m!508247 () Bool)

(assert (=> b!527562 m!508247))

(declare-fun m!508249 () Bool)

(assert (=> b!527562 m!508249))

(assert (=> b!527560 m!508217))

(assert (=> b!527560 m!508217))

(declare-fun m!508251 () Bool)

(assert (=> b!527560 m!508251))

(declare-fun m!508253 () Bool)

(assert (=> b!527557 m!508253))

(declare-fun m!508255 () Bool)

(assert (=> b!527568 m!508255))

(push 1)

