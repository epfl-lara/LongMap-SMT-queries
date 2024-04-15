; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131328 () Bool)

(assert start!131328)

(declare-fun b!1540095 () Bool)

(declare-fun e!856527 () Bool)

(declare-fun e!856525 () Bool)

(assert (=> b!1540095 (= e!856527 e!856525)))

(declare-fun res!1056979 () Bool)

(assert (=> b!1540095 (=> (not res!1056979) (not e!856525))))

(declare-datatypes ((SeekEntryResult!13499 0))(
  ( (MissingZero!13499 (index!56391 (_ BitVec 32))) (Found!13499 (index!56392 (_ BitVec 32))) (Intermediate!13499 (undefined!14311 Bool) (index!56393 (_ BitVec 32)) (x!138125 (_ BitVec 32))) (Undefined!13499) (MissingVacant!13499 (index!56394 (_ BitVec 32))) )
))
(declare-fun lt!665051 () SeekEntryResult!13499)

(declare-fun lt!665049 () SeekEntryResult!13499)

(assert (=> b!1540095 (= res!1056979 (= lt!665051 lt!665049))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102274 0))(
  ( (array!102275 (arr!49348 (Array (_ BitVec 32) (_ BitVec 64))) (size!49900 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102274)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!665050 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102274 (_ BitVec 32)) SeekEntryResult!13499)

(assert (=> b!1540095 (= lt!665051 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665050 vacantIndex!5 (select (arr!49348 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540096 () Bool)

(declare-fun res!1056972 () Bool)

(declare-fun e!856524 () Bool)

(assert (=> b!1540096 (=> (not res!1056972) (not e!856524))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540096 (= res!1056972 (and (= (size!49900 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49900 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49900 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540097 () Bool)

(declare-fun res!1056973 () Bool)

(assert (=> b!1540097 (=> (not res!1056973) (not e!856524))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540097 (= res!1056973 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49900 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49900 a!2792)) (= (select (arr!49348 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056975 () Bool)

(assert (=> start!131328 (=> (not res!1056975) (not e!856524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131328 (= res!1056975 (validMask!0 mask!2480))))

(assert (=> start!131328 e!856524))

(assert (=> start!131328 true))

(declare-fun array_inv!38581 (array!102274) Bool)

(assert (=> start!131328 (array_inv!38581 a!2792)))

(declare-fun b!1540098 () Bool)

(declare-fun e!856526 () Bool)

(assert (=> b!1540098 (= e!856526 e!856527)))

(declare-fun res!1056977 () Bool)

(assert (=> b!1540098 (=> (not res!1056977) (not e!856527))))

(assert (=> b!1540098 (= res!1056977 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665050 #b00000000000000000000000000000000) (bvslt lt!665050 (size!49900 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540098 (= lt!665050 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540099 () Bool)

(declare-fun res!1056978 () Bool)

(assert (=> b!1540099 (=> (not res!1056978) (not e!856524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540099 (= res!1056978 (validKeyInArray!0 (select (arr!49348 a!2792) j!64)))))

(declare-fun b!1540100 () Bool)

(declare-fun res!1056971 () Bool)

(assert (=> b!1540100 (=> (not res!1056971) (not e!856526))))

(assert (=> b!1540100 (= res!1056971 (not (= (select (arr!49348 a!2792) index!463) (select (arr!49348 a!2792) j!64))))))

(declare-fun b!1540101 () Bool)

(assert (=> b!1540101 (= e!856524 e!856526)))

(declare-fun res!1056970 () Bool)

(assert (=> b!1540101 (=> (not res!1056970) (not e!856526))))

(assert (=> b!1540101 (= res!1056970 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49348 a!2792) j!64) a!2792 mask!2480) lt!665049))))

(assert (=> b!1540101 (= lt!665049 (Found!13499 j!64))))

(declare-fun b!1540102 () Bool)

(declare-fun res!1056969 () Bool)

(assert (=> b!1540102 (=> (not res!1056969) (not e!856524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102274 (_ BitVec 32)) Bool)

(assert (=> b!1540102 (= res!1056969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540103 () Bool)

(assert (=> b!1540103 (= e!856525 (not true))))

(assert (=> b!1540103 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665050 vacantIndex!5 (select (store (arr!49348 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102275 (store (arr!49348 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49900 a!2792)) mask!2480) lt!665051)))

(declare-datatypes ((Unit!51269 0))(
  ( (Unit!51270) )
))
(declare-fun lt!665052 () Unit!51269)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51269)

(assert (=> b!1540103 (= lt!665052 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665050 vacantIndex!5 mask!2480))))

(declare-fun b!1540104 () Bool)

(declare-fun res!1056976 () Bool)

(assert (=> b!1540104 (=> (not res!1056976) (not e!856524))))

(assert (=> b!1540104 (= res!1056976 (validKeyInArray!0 (select (arr!49348 a!2792) i!951)))))

(declare-fun b!1540105 () Bool)

(declare-fun res!1056974 () Bool)

(assert (=> b!1540105 (=> (not res!1056974) (not e!856524))))

(declare-datatypes ((List!35900 0))(
  ( (Nil!35897) (Cons!35896 (h!37342 (_ BitVec 64)) (t!50586 List!35900)) )
))
(declare-fun arrayNoDuplicates!0 (array!102274 (_ BitVec 32) List!35900) Bool)

(assert (=> b!1540105 (= res!1056974 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35897))))

(assert (= (and start!131328 res!1056975) b!1540096))

(assert (= (and b!1540096 res!1056972) b!1540104))

(assert (= (and b!1540104 res!1056976) b!1540099))

(assert (= (and b!1540099 res!1056978) b!1540102))

(assert (= (and b!1540102 res!1056969) b!1540105))

(assert (= (and b!1540105 res!1056974) b!1540097))

(assert (= (and b!1540097 res!1056973) b!1540101))

(assert (= (and b!1540101 res!1056970) b!1540100))

(assert (= (and b!1540100 res!1056971) b!1540098))

(assert (= (and b!1540098 res!1056977) b!1540095))

(assert (= (and b!1540095 res!1056979) b!1540103))

(declare-fun m!1421627 () Bool)

(assert (=> b!1540102 m!1421627))

(declare-fun m!1421629 () Bool)

(assert (=> b!1540098 m!1421629))

(declare-fun m!1421631 () Bool)

(assert (=> start!131328 m!1421631))

(declare-fun m!1421633 () Bool)

(assert (=> start!131328 m!1421633))

(declare-fun m!1421635 () Bool)

(assert (=> b!1540095 m!1421635))

(assert (=> b!1540095 m!1421635))

(declare-fun m!1421637 () Bool)

(assert (=> b!1540095 m!1421637))

(declare-fun m!1421639 () Bool)

(assert (=> b!1540103 m!1421639))

(declare-fun m!1421641 () Bool)

(assert (=> b!1540103 m!1421641))

(assert (=> b!1540103 m!1421641))

(declare-fun m!1421643 () Bool)

(assert (=> b!1540103 m!1421643))

(declare-fun m!1421645 () Bool)

(assert (=> b!1540103 m!1421645))

(declare-fun m!1421647 () Bool)

(assert (=> b!1540104 m!1421647))

(assert (=> b!1540104 m!1421647))

(declare-fun m!1421649 () Bool)

(assert (=> b!1540104 m!1421649))

(declare-fun m!1421651 () Bool)

(assert (=> b!1540100 m!1421651))

(assert (=> b!1540100 m!1421635))

(assert (=> b!1540099 m!1421635))

(assert (=> b!1540099 m!1421635))

(declare-fun m!1421653 () Bool)

(assert (=> b!1540099 m!1421653))

(assert (=> b!1540101 m!1421635))

(assert (=> b!1540101 m!1421635))

(declare-fun m!1421655 () Bool)

(assert (=> b!1540101 m!1421655))

(declare-fun m!1421657 () Bool)

(assert (=> b!1540097 m!1421657))

(declare-fun m!1421659 () Bool)

(assert (=> b!1540105 m!1421659))

(check-sat (not b!1540105) (not b!1540104) (not b!1540102) (not b!1540098) (not start!131328) (not b!1540095) (not b!1540103) (not b!1540101) (not b!1540099))
(check-sat)
