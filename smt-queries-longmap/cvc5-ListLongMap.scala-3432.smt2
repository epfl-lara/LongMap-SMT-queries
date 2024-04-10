; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47712 () Bool)

(assert start!47712)

(declare-fun b!524752 () Bool)

(declare-fun res!321626 () Bool)

(declare-fun e!306018 () Bool)

(assert (=> b!524752 (=> (not res!321626) (not e!306018))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524752 (= res!321626 (validKeyInArray!0 k!2280))))

(declare-fun b!524754 () Bool)

(declare-fun res!321621 () Bool)

(declare-fun e!306019 () Bool)

(assert (=> b!524754 (=> (not res!321621) (not e!306019))))

(declare-datatypes ((array!33349 0))(
  ( (array!33350 (arr!16026 (Array (_ BitVec 32) (_ BitVec 64))) (size!16390 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33349)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33349 (_ BitVec 32)) Bool)

(assert (=> b!524754 (= res!321621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524755 () Bool)

(declare-datatypes ((Unit!16424 0))(
  ( (Unit!16425) )
))
(declare-fun e!306015 () Unit!16424)

(declare-fun Unit!16426 () Unit!16424)

(assert (=> b!524755 (= e!306015 Unit!16426)))

(declare-fun b!524756 () Bool)

(declare-fun res!321624 () Bool)

(declare-fun e!306017 () Bool)

(assert (=> b!524756 (=> res!321624 e!306017)))

(declare-datatypes ((SeekEntryResult!4493 0))(
  ( (MissingZero!4493 (index!20184 (_ BitVec 32))) (Found!4493 (index!20185 (_ BitVec 32))) (Intermediate!4493 (undefined!5305 Bool) (index!20186 (_ BitVec 32)) (x!49170 (_ BitVec 32))) (Undefined!4493) (MissingVacant!4493 (index!20187 (_ BitVec 32))) )
))
(declare-fun lt!240905 () SeekEntryResult!4493)

(assert (=> b!524756 (= res!321624 (or (undefined!5305 lt!240905) (not (is-Intermediate!4493 lt!240905))))))

(declare-fun b!524757 () Bool)

(declare-fun Unit!16427 () Unit!16424)

(assert (=> b!524757 (= e!306015 Unit!16427)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240909 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240910 () Unit!16424)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16424)

(assert (=> b!524757 (= lt!240910 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240909 #b00000000000000000000000000000000 (index!20186 lt!240905) (x!49170 lt!240905) mask!3524))))

(declare-fun lt!240913 () array!33349)

(declare-fun res!321618 () Bool)

(declare-fun lt!240907 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33349 (_ BitVec 32)) SeekEntryResult!4493)

(assert (=> b!524757 (= res!321618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240909 lt!240907 lt!240913 mask!3524) (Intermediate!4493 false (index!20186 lt!240905) (x!49170 lt!240905))))))

(declare-fun e!306021 () Bool)

(assert (=> b!524757 (=> (not res!321618) (not e!306021))))

(assert (=> b!524757 e!306021))

(declare-fun b!524758 () Bool)

(declare-fun res!321616 () Bool)

(assert (=> b!524758 (=> (not res!321616) (not e!306018))))

(assert (=> b!524758 (= res!321616 (and (= (size!16390 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16390 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16390 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524759 () Bool)

(assert (=> b!524759 (= e!306018 e!306019)))

(declare-fun res!321622 () Bool)

(assert (=> b!524759 (=> (not res!321622) (not e!306019))))

(declare-fun lt!240904 () SeekEntryResult!4493)

(assert (=> b!524759 (= res!321622 (or (= lt!240904 (MissingZero!4493 i!1204)) (= lt!240904 (MissingVacant!4493 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33349 (_ BitVec 32)) SeekEntryResult!4493)

(assert (=> b!524759 (= lt!240904 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524760 () Bool)

(assert (=> b!524760 (= e!306019 (not e!306017))))

(declare-fun res!321625 () Bool)

(assert (=> b!524760 (=> res!321625 e!306017)))

(declare-fun lt!240906 () (_ BitVec 32))

(assert (=> b!524760 (= res!321625 (= lt!240905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240906 lt!240907 lt!240913 mask!3524)))))

(assert (=> b!524760 (= lt!240905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240909 (select (arr!16026 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524760 (= lt!240906 (toIndex!0 lt!240907 mask!3524))))

(assert (=> b!524760 (= lt!240907 (select (store (arr!16026 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524760 (= lt!240909 (toIndex!0 (select (arr!16026 a!3235) j!176) mask!3524))))

(assert (=> b!524760 (= lt!240913 (array!33350 (store (arr!16026 a!3235) i!1204 k!2280) (size!16390 a!3235)))))

(declare-fun e!306020 () Bool)

(assert (=> b!524760 e!306020))

(declare-fun res!321617 () Bool)

(assert (=> b!524760 (=> (not res!321617) (not e!306020))))

(assert (=> b!524760 (= res!321617 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240911 () Unit!16424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33349 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16424)

(assert (=> b!524760 (= lt!240911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524761 () Bool)

(declare-fun res!321619 () Bool)

(assert (=> b!524761 (=> (not res!321619) (not e!306018))))

(declare-fun arrayContainsKey!0 (array!33349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524761 (= res!321619 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524753 () Bool)

(assert (=> b!524753 (= e!306021 false)))

(declare-fun res!321623 () Bool)

(assert (=> start!47712 (=> (not res!321623) (not e!306018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47712 (= res!321623 (validMask!0 mask!3524))))

(assert (=> start!47712 e!306018))

(assert (=> start!47712 true))

(declare-fun array_inv!11822 (array!33349) Bool)

(assert (=> start!47712 (array_inv!11822 a!3235)))

(declare-fun b!524762 () Bool)

(assert (=> b!524762 (= e!306017 true)))

(assert (=> b!524762 (= (index!20186 lt!240905) i!1204)))

(declare-fun lt!240912 () Unit!16424)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16424)

(assert (=> b!524762 (= lt!240912 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!240909 #b00000000000000000000000000000000 (index!20186 lt!240905) (x!49170 lt!240905) mask!3524))))

(assert (=> b!524762 (and (or (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240908 () Unit!16424)

(assert (=> b!524762 (= lt!240908 e!306015)))

(declare-fun c!61874 () Bool)

(assert (=> b!524762 (= c!61874 (= (select (arr!16026 a!3235) (index!20186 lt!240905)) (select (arr!16026 a!3235) j!176)))))

(assert (=> b!524762 (and (bvslt (x!49170 lt!240905) #b01111111111111111111111111111110) (or (= (select (arr!16026 a!3235) (index!20186 lt!240905)) (select (arr!16026 a!3235) j!176)) (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16026 a!3235) (index!20186 lt!240905)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524763 () Bool)

(declare-fun res!321620 () Bool)

(assert (=> b!524763 (=> (not res!321620) (not e!306019))))

(declare-datatypes ((List!10184 0))(
  ( (Nil!10181) (Cons!10180 (h!11111 (_ BitVec 64)) (t!16412 List!10184)) )
))
(declare-fun arrayNoDuplicates!0 (array!33349 (_ BitVec 32) List!10184) Bool)

(assert (=> b!524763 (= res!321620 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10181))))

(declare-fun b!524764 () Bool)

(declare-fun res!321615 () Bool)

(assert (=> b!524764 (=> (not res!321615) (not e!306018))))

(assert (=> b!524764 (= res!321615 (validKeyInArray!0 (select (arr!16026 a!3235) j!176)))))

(declare-fun b!524765 () Bool)

(assert (=> b!524765 (= e!306020 (= (seekEntryOrOpen!0 (select (arr!16026 a!3235) j!176) a!3235 mask!3524) (Found!4493 j!176)))))

(assert (= (and start!47712 res!321623) b!524758))

(assert (= (and b!524758 res!321616) b!524764))

(assert (= (and b!524764 res!321615) b!524752))

(assert (= (and b!524752 res!321626) b!524761))

(assert (= (and b!524761 res!321619) b!524759))

(assert (= (and b!524759 res!321622) b!524754))

(assert (= (and b!524754 res!321621) b!524763))

(assert (= (and b!524763 res!321620) b!524760))

(assert (= (and b!524760 res!321617) b!524765))

(assert (= (and b!524760 (not res!321625)) b!524756))

(assert (= (and b!524756 (not res!321624)) b!524762))

(assert (= (and b!524762 c!61874) b!524757))

(assert (= (and b!524762 (not c!61874)) b!524755))

(assert (= (and b!524757 res!321618) b!524753))

(declare-fun m!505377 () Bool)

(assert (=> b!524754 m!505377))

(declare-fun m!505379 () Bool)

(assert (=> start!47712 m!505379))

(declare-fun m!505381 () Bool)

(assert (=> start!47712 m!505381))

(declare-fun m!505383 () Bool)

(assert (=> b!524765 m!505383))

(assert (=> b!524765 m!505383))

(declare-fun m!505385 () Bool)

(assert (=> b!524765 m!505385))

(assert (=> b!524764 m!505383))

(assert (=> b!524764 m!505383))

(declare-fun m!505387 () Bool)

(assert (=> b!524764 m!505387))

(declare-fun m!505389 () Bool)

(assert (=> b!524763 m!505389))

(declare-fun m!505391 () Bool)

(assert (=> b!524757 m!505391))

(declare-fun m!505393 () Bool)

(assert (=> b!524757 m!505393))

(declare-fun m!505395 () Bool)

(assert (=> b!524759 m!505395))

(declare-fun m!505397 () Bool)

(assert (=> b!524760 m!505397))

(declare-fun m!505399 () Bool)

(assert (=> b!524760 m!505399))

(declare-fun m!505401 () Bool)

(assert (=> b!524760 m!505401))

(assert (=> b!524760 m!505383))

(declare-fun m!505403 () Bool)

(assert (=> b!524760 m!505403))

(assert (=> b!524760 m!505383))

(declare-fun m!505405 () Bool)

(assert (=> b!524760 m!505405))

(assert (=> b!524760 m!505383))

(declare-fun m!505407 () Bool)

(assert (=> b!524760 m!505407))

(declare-fun m!505409 () Bool)

(assert (=> b!524760 m!505409))

(declare-fun m!505411 () Bool)

(assert (=> b!524760 m!505411))

(declare-fun m!505413 () Bool)

(assert (=> b!524762 m!505413))

(declare-fun m!505415 () Bool)

(assert (=> b!524762 m!505415))

(assert (=> b!524762 m!505383))

(declare-fun m!505417 () Bool)

(assert (=> b!524761 m!505417))

(declare-fun m!505419 () Bool)

(assert (=> b!524752 m!505419))

(push 1)

