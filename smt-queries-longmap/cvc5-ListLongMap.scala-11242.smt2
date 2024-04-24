; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131506 () Bool)

(assert start!131506)

(declare-fun b!1540466 () Bool)

(declare-fun res!1055979 () Bool)

(declare-fun e!857338 () Bool)

(assert (=> b!1540466 (=> (not res!1055979) (not e!857338))))

(declare-datatypes ((array!102308 0))(
  ( (array!102309 (arr!49362 (Array (_ BitVec 32) (_ BitVec 64))) (size!49913 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102308)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102308 (_ BitVec 32)) Bool)

(assert (=> b!1540466 (= res!1055979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540467 () Bool)

(declare-fun res!1055978 () Bool)

(assert (=> b!1540467 (=> (not res!1055978) (not e!857338))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540467 (= res!1055978 (and (= (size!49913 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49913 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49913 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540468 () Bool)

(assert (=> b!1540468 (= e!857338 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13383 0))(
  ( (MissingZero!13383 (index!55927 (_ BitVec 32))) (Found!13383 (index!55928 (_ BitVec 32))) (Intermediate!13383 (undefined!14195 Bool) (index!55929 (_ BitVec 32)) (x!137867 (_ BitVec 32))) (Undefined!13383) (MissingVacant!13383 (index!55930 (_ BitVec 32))) )
))
(declare-fun lt!665730 () SeekEntryResult!13383)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102308 (_ BitVec 32)) SeekEntryResult!13383)

(assert (=> b!1540468 (= lt!665730 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49362 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540469 () Bool)

(declare-fun res!1055981 () Bool)

(assert (=> b!1540469 (=> (not res!1055981) (not e!857338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540469 (= res!1055981 (validKeyInArray!0 (select (arr!49362 a!2792) j!64)))))

(declare-fun b!1540470 () Bool)

(declare-fun res!1055980 () Bool)

(assert (=> b!1540470 (=> (not res!1055980) (not e!857338))))

(declare-datatypes ((List!35823 0))(
  ( (Nil!35820) (Cons!35819 (h!37282 (_ BitVec 64)) (t!50509 List!35823)) )
))
(declare-fun arrayNoDuplicates!0 (array!102308 (_ BitVec 32) List!35823) Bool)

(assert (=> b!1540470 (= res!1055980 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35820))))

(declare-fun b!1540471 () Bool)

(declare-fun res!1055982 () Bool)

(assert (=> b!1540471 (=> (not res!1055982) (not e!857338))))

(assert (=> b!1540471 (= res!1055982 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49913 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49913 a!2792)) (= (select (arr!49362 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540472 () Bool)

(declare-fun res!1055977 () Bool)

(assert (=> b!1540472 (=> (not res!1055977) (not e!857338))))

(assert (=> b!1540472 (= res!1055977 (validKeyInArray!0 (select (arr!49362 a!2792) i!951)))))

(declare-fun res!1055976 () Bool)

(assert (=> start!131506 (=> (not res!1055976) (not e!857338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131506 (= res!1055976 (validMask!0 mask!2480))))

(assert (=> start!131506 e!857338))

(assert (=> start!131506 true))

(declare-fun array_inv!38643 (array!102308) Bool)

(assert (=> start!131506 (array_inv!38643 a!2792)))

(assert (= (and start!131506 res!1055976) b!1540467))

(assert (= (and b!1540467 res!1055978) b!1540472))

(assert (= (and b!1540472 res!1055977) b!1540469))

(assert (= (and b!1540469 res!1055981) b!1540466))

(assert (= (and b!1540466 res!1055979) b!1540470))

(assert (= (and b!1540470 res!1055980) b!1540471))

(assert (= (and b!1540471 res!1055982) b!1540468))

(declare-fun m!1422767 () Bool)

(assert (=> start!131506 m!1422767))

(declare-fun m!1422769 () Bool)

(assert (=> start!131506 m!1422769))

(declare-fun m!1422771 () Bool)

(assert (=> b!1540470 m!1422771))

(declare-fun m!1422773 () Bool)

(assert (=> b!1540466 m!1422773))

(declare-fun m!1422775 () Bool)

(assert (=> b!1540471 m!1422775))

(declare-fun m!1422777 () Bool)

(assert (=> b!1540469 m!1422777))

(assert (=> b!1540469 m!1422777))

(declare-fun m!1422779 () Bool)

(assert (=> b!1540469 m!1422779))

(assert (=> b!1540468 m!1422777))

(assert (=> b!1540468 m!1422777))

(declare-fun m!1422781 () Bool)

(assert (=> b!1540468 m!1422781))

(declare-fun m!1422783 () Bool)

(assert (=> b!1540472 m!1422783))

(assert (=> b!1540472 m!1422783))

(declare-fun m!1422785 () Bool)

(assert (=> b!1540472 m!1422785))

(push 1)

(assert (not b!1540468))

(assert (not start!131506))

(assert (not b!1540470))

(assert (not b!1540472))

(assert (not b!1540469))

(assert (not b!1540466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

