; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118608 () Bool)

(assert start!118608)

(declare-fun b!1386634 () Bool)

(declare-fun res!927791 () Bool)

(declare-fun e!785485 () Bool)

(assert (=> b!1386634 (=> (not res!927791) (not e!785485))))

(declare-datatypes ((array!94884 0))(
  ( (array!94885 (arr!45818 (Array (_ BitVec 32) (_ BitVec 64))) (size!46368 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94884)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94884 (_ BitVec 32)) Bool)

(assert (=> b!1386634 (= res!927791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386635 () Bool)

(declare-datatypes ((Unit!46325 0))(
  ( (Unit!46326) )
))
(declare-fun e!785486 () Unit!46325)

(declare-fun lt!609530 () Unit!46325)

(assert (=> b!1386635 (= e!785486 lt!609530)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609529 () Unit!46325)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46325)

(assert (=> b!1386635 (= lt!609529 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10161 0))(
  ( (MissingZero!10161 (index!43015 (_ BitVec 32))) (Found!10161 (index!43016 (_ BitVec 32))) (Intermediate!10161 (undefined!10973 Bool) (index!43017 (_ BitVec 32)) (x!124634 (_ BitVec 32))) (Undefined!10161) (MissingVacant!10161 (index!43018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94884 (_ BitVec 32)) SeekEntryResult!10161)

(assert (=> b!1386635 (= (seekEntryOrOpen!0 (select (arr!45818 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45818 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45818 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46368 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46325)

(assert (=> b!1386635 (= lt!609530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386635 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386636 () Bool)

(declare-fun Unit!46327 () Unit!46325)

(assert (=> b!1386636 (= e!785486 Unit!46327)))

(declare-fun b!1386637 () Bool)

(declare-fun res!927792 () Bool)

(assert (=> b!1386637 (=> (not res!927792) (not e!785485))))

(assert (=> b!1386637 (= res!927792 (and (= (size!46368 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46368 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46368 a!2938))))))

(declare-fun b!1386638 () Bool)

(declare-fun res!927795 () Bool)

(assert (=> b!1386638 (=> (not res!927795) (not e!785485))))

(assert (=> b!1386638 (= res!927795 (and (not (= (select (arr!45818 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45818 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386639 () Bool)

(declare-fun res!927790 () Bool)

(assert (=> b!1386639 (=> (not res!927790) (not e!785485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386639 (= res!927790 (validKeyInArray!0 (select (arr!45818 a!2938) i!1065)))))

(declare-fun b!1386640 () Bool)

(declare-fun res!927794 () Bool)

(assert (=> b!1386640 (=> (not res!927794) (not e!785485))))

(declare-datatypes ((List!32346 0))(
  ( (Nil!32343) (Cons!32342 (h!33551 (_ BitVec 64)) (t!47040 List!32346)) )
))
(declare-fun arrayNoDuplicates!0 (array!94884 (_ BitVec 32) List!32346) Bool)

(assert (=> b!1386640 (= res!927794 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32343))))

(declare-fun res!927793 () Bool)

(assert (=> start!118608 (=> (not res!927793) (not e!785485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118608 (= res!927793 (validMask!0 mask!2987))))

(assert (=> start!118608 e!785485))

(assert (=> start!118608 true))

(declare-fun array_inv!34846 (array!94884) Bool)

(assert (=> start!118608 (array_inv!34846 a!2938)))

(declare-fun b!1386641 () Bool)

(assert (=> b!1386641 (= e!785485 false)))

(declare-fun lt!609531 () Unit!46325)

(assert (=> b!1386641 (= lt!609531 e!785486)))

(declare-fun c!128862 () Bool)

(declare-fun e!785483 () Bool)

(assert (=> b!1386641 (= c!128862 e!785483)))

(declare-fun res!927796 () Bool)

(assert (=> b!1386641 (=> (not res!927796) (not e!785483))))

(assert (=> b!1386641 (= res!927796 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386642 () Bool)

(assert (=> b!1386642 (= e!785483 (validKeyInArray!0 (select (arr!45818 a!2938) startIndex!16)))))

(assert (= (and start!118608 res!927793) b!1386637))

(assert (= (and b!1386637 res!927792) b!1386639))

(assert (= (and b!1386639 res!927790) b!1386640))

(assert (= (and b!1386640 res!927794) b!1386634))

(assert (= (and b!1386634 res!927791) b!1386638))

(assert (= (and b!1386638 res!927795) b!1386641))

(assert (= (and b!1386641 res!927796) b!1386642))

(assert (= (and b!1386641 c!128862) b!1386635))

(assert (= (and b!1386641 (not c!128862)) b!1386636))

(declare-fun m!1272021 () Bool)

(assert (=> b!1386640 m!1272021))

(declare-fun m!1272023 () Bool)

(assert (=> b!1386635 m!1272023))

(declare-fun m!1272025 () Bool)

(assert (=> b!1386635 m!1272025))

(assert (=> b!1386635 m!1272025))

(declare-fun m!1272027 () Bool)

(assert (=> b!1386635 m!1272027))

(declare-fun m!1272029 () Bool)

(assert (=> b!1386635 m!1272029))

(declare-fun m!1272031 () Bool)

(assert (=> b!1386635 m!1272031))

(declare-fun m!1272033 () Bool)

(assert (=> b!1386635 m!1272033))

(declare-fun m!1272035 () Bool)

(assert (=> b!1386635 m!1272035))

(assert (=> b!1386635 m!1272033))

(declare-fun m!1272037 () Bool)

(assert (=> b!1386635 m!1272037))

(declare-fun m!1272039 () Bool)

(assert (=> start!118608 m!1272039))

(declare-fun m!1272041 () Bool)

(assert (=> start!118608 m!1272041))

(declare-fun m!1272043 () Bool)

(assert (=> b!1386638 m!1272043))

(declare-fun m!1272045 () Bool)

(assert (=> b!1386634 m!1272045))

(assert (=> b!1386639 m!1272043))

(assert (=> b!1386639 m!1272043))

(declare-fun m!1272047 () Bool)

(assert (=> b!1386639 m!1272047))

(assert (=> b!1386642 m!1272033))

(assert (=> b!1386642 m!1272033))

(declare-fun m!1272049 () Bool)

(assert (=> b!1386642 m!1272049))

(push 1)

(assert (not b!1386639))

(assert (not start!118608))

(assert (not b!1386642))

(assert (not b!1386634))

(assert (not b!1386635))

(assert (not b!1386640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

