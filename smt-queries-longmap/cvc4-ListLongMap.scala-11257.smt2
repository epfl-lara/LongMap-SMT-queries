; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131298 () Bool)

(assert start!131298)

(declare-fun b!1539657 () Bool)

(declare-fun res!1056459 () Bool)

(declare-fun e!856386 () Bool)

(assert (=> b!1539657 (=> (not res!1056459) (not e!856386))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102285 0))(
  ( (array!102286 (arr!49354 (Array (_ BitVec 32) (_ BitVec 64))) (size!49904 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102285)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539657 (= res!1056459 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49904 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49904 a!2792)) (= (select (arr!49354 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539658 () Bool)

(assert (=> b!1539658 (= e!856386 false)))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!665113 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539658 (= lt!665113 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539660 () Bool)

(declare-fun res!1056460 () Bool)

(assert (=> b!1539660 (=> (not res!1056460) (not e!856386))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13480 0))(
  ( (MissingZero!13480 (index!56315 (_ BitVec 32))) (Found!13480 (index!56316 (_ BitVec 32))) (Intermediate!13480 (undefined!14292 Bool) (index!56317 (_ BitVec 32)) (x!138049 (_ BitVec 32))) (Undefined!13480) (MissingVacant!13480 (index!56318 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102285 (_ BitVec 32)) SeekEntryResult!13480)

(assert (=> b!1539660 (= res!1056460 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49354 a!2792) j!64) a!2792 mask!2480) (Found!13480 j!64)))))

(declare-fun b!1539661 () Bool)

(declare-fun res!1056455 () Bool)

(assert (=> b!1539661 (=> (not res!1056455) (not e!856386))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539661 (= res!1056455 (validKeyInArray!0 (select (arr!49354 a!2792) i!951)))))

(declare-fun b!1539662 () Bool)

(declare-fun res!1056463 () Bool)

(assert (=> b!1539662 (=> (not res!1056463) (not e!856386))))

(declare-datatypes ((List!35828 0))(
  ( (Nil!35825) (Cons!35824 (h!37269 (_ BitVec 64)) (t!50522 List!35828)) )
))
(declare-fun arrayNoDuplicates!0 (array!102285 (_ BitVec 32) List!35828) Bool)

(assert (=> b!1539662 (= res!1056463 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35825))))

(declare-fun b!1539663 () Bool)

(declare-fun res!1056462 () Bool)

(assert (=> b!1539663 (=> (not res!1056462) (not e!856386))))

(assert (=> b!1539663 (= res!1056462 (and (= (size!49904 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49904 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49904 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539664 () Bool)

(declare-fun res!1056458 () Bool)

(assert (=> b!1539664 (=> (not res!1056458) (not e!856386))))

(assert (=> b!1539664 (= res!1056458 (validKeyInArray!0 (select (arr!49354 a!2792) j!64)))))

(declare-fun b!1539665 () Bool)

(declare-fun res!1056457 () Bool)

(assert (=> b!1539665 (=> (not res!1056457) (not e!856386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102285 (_ BitVec 32)) Bool)

(assert (=> b!1539665 (= res!1056457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539659 () Bool)

(declare-fun res!1056456 () Bool)

(assert (=> b!1539659 (=> (not res!1056456) (not e!856386))))

(assert (=> b!1539659 (= res!1056456 (not (= (select (arr!49354 a!2792) index!463) (select (arr!49354 a!2792) j!64))))))

(declare-fun res!1056461 () Bool)

(assert (=> start!131298 (=> (not res!1056461) (not e!856386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131298 (= res!1056461 (validMask!0 mask!2480))))

(assert (=> start!131298 e!856386))

(assert (=> start!131298 true))

(declare-fun array_inv!38382 (array!102285) Bool)

(assert (=> start!131298 (array_inv!38382 a!2792)))

(assert (= (and start!131298 res!1056461) b!1539663))

(assert (= (and b!1539663 res!1056462) b!1539661))

(assert (= (and b!1539661 res!1056455) b!1539664))

(assert (= (and b!1539664 res!1056458) b!1539665))

(assert (= (and b!1539665 res!1056457) b!1539662))

(assert (= (and b!1539662 res!1056463) b!1539657))

(assert (= (and b!1539657 res!1056459) b!1539660))

(assert (= (and b!1539660 res!1056460) b!1539659))

(assert (= (and b!1539659 res!1056456) b!1539658))

(declare-fun m!1421859 () Bool)

(assert (=> b!1539662 m!1421859))

(declare-fun m!1421861 () Bool)

(assert (=> b!1539661 m!1421861))

(assert (=> b!1539661 m!1421861))

(declare-fun m!1421863 () Bool)

(assert (=> b!1539661 m!1421863))

(declare-fun m!1421865 () Bool)

(assert (=> b!1539660 m!1421865))

(assert (=> b!1539660 m!1421865))

(declare-fun m!1421867 () Bool)

(assert (=> b!1539660 m!1421867))

(assert (=> b!1539664 m!1421865))

(assert (=> b!1539664 m!1421865))

(declare-fun m!1421869 () Bool)

(assert (=> b!1539664 m!1421869))

(declare-fun m!1421871 () Bool)

(assert (=> b!1539665 m!1421871))

(declare-fun m!1421873 () Bool)

(assert (=> start!131298 m!1421873))

(declare-fun m!1421875 () Bool)

(assert (=> start!131298 m!1421875))

(declare-fun m!1421877 () Bool)

(assert (=> b!1539658 m!1421877))

(declare-fun m!1421879 () Bool)

(assert (=> b!1539659 m!1421879))

(assert (=> b!1539659 m!1421865))

(declare-fun m!1421881 () Bool)

(assert (=> b!1539657 m!1421881))

(push 1)

(assert (not b!1539665))

(assert (not b!1539662))

(assert (not b!1539661))

(assert (not b!1539658))

(assert (not b!1539660))

(assert (not b!1539664))

(assert (not start!131298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

