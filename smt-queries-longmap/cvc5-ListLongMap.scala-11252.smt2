; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131134 () Bool)

(assert start!131134)

(declare-fun b!1538669 () Bool)

(declare-fun res!1055839 () Bool)

(declare-fun e!855918 () Bool)

(assert (=> b!1538669 (=> (not res!1055839) (not e!855918))))

(declare-datatypes ((array!102197 0))(
  ( (array!102198 (arr!49314 (Array (_ BitVec 32) (_ BitVec 64))) (size!49866 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102197)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538669 (= res!1055839 (validKeyInArray!0 (select (arr!49314 a!2792) i!951)))))

(declare-fun res!1055837 () Bool)

(assert (=> start!131134 (=> (not res!1055837) (not e!855918))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131134 (= res!1055837 (validMask!0 mask!2480))))

(assert (=> start!131134 e!855918))

(assert (=> start!131134 true))

(declare-fun array_inv!38547 (array!102197) Bool)

(assert (=> start!131134 (array_inv!38547 a!2792)))

(declare-fun b!1538670 () Bool)

(declare-fun res!1055832 () Bool)

(assert (=> b!1538670 (=> (not res!1055832) (not e!855918))))

(declare-datatypes ((List!35866 0))(
  ( (Nil!35863) (Cons!35862 (h!37308 (_ BitVec 64)) (t!50552 List!35866)) )
))
(declare-fun arrayNoDuplicates!0 (array!102197 (_ BitVec 32) List!35866) Bool)

(assert (=> b!1538670 (= res!1055832 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35863))))

(declare-fun b!1538671 () Bool)

(declare-fun res!1055836 () Bool)

(assert (=> b!1538671 (=> (not res!1055836) (not e!855918))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538671 (= res!1055836 (not (= (select (arr!49314 a!2792) index!463) (select (arr!49314 a!2792) j!64))))))

(declare-fun b!1538672 () Bool)

(assert (=> b!1538672 (= e!855918 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664674 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538672 (= lt!664674 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538673 () Bool)

(declare-fun res!1055835 () Bool)

(assert (=> b!1538673 (=> (not res!1055835) (not e!855918))))

(assert (=> b!1538673 (= res!1055835 (and (= (size!49866 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49866 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49866 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538674 () Bool)

(declare-fun res!1055833 () Bool)

(assert (=> b!1538674 (=> (not res!1055833) (not e!855918))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13465 0))(
  ( (MissingZero!13465 (index!56255 (_ BitVec 32))) (Found!13465 (index!56256 (_ BitVec 32))) (Intermediate!13465 (undefined!14277 Bool) (index!56257 (_ BitVec 32)) (x!137977 (_ BitVec 32))) (Undefined!13465) (MissingVacant!13465 (index!56258 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102197 (_ BitVec 32)) SeekEntryResult!13465)

(assert (=> b!1538674 (= res!1055833 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49314 a!2792) j!64) a!2792 mask!2480) (Found!13465 j!64)))))

(declare-fun b!1538675 () Bool)

(declare-fun res!1055834 () Bool)

(assert (=> b!1538675 (=> (not res!1055834) (not e!855918))))

(assert (=> b!1538675 (= res!1055834 (validKeyInArray!0 (select (arr!49314 a!2792) j!64)))))

(declare-fun b!1538676 () Bool)

(declare-fun res!1055838 () Bool)

(assert (=> b!1538676 (=> (not res!1055838) (not e!855918))))

(assert (=> b!1538676 (= res!1055838 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49866 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49866 a!2792)) (= (select (arr!49314 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538677 () Bool)

(declare-fun res!1055831 () Bool)

(assert (=> b!1538677 (=> (not res!1055831) (not e!855918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102197 (_ BitVec 32)) Bool)

(assert (=> b!1538677 (= res!1055831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131134 res!1055837) b!1538673))

(assert (= (and b!1538673 res!1055835) b!1538669))

(assert (= (and b!1538669 res!1055839) b!1538675))

(assert (= (and b!1538675 res!1055834) b!1538677))

(assert (= (and b!1538677 res!1055831) b!1538670))

(assert (= (and b!1538670 res!1055832) b!1538676))

(assert (= (and b!1538676 res!1055838) b!1538674))

(assert (= (and b!1538674 res!1055833) b!1538671))

(assert (= (and b!1538671 res!1055836) b!1538672))

(declare-fun m!1420463 () Bool)

(assert (=> b!1538674 m!1420463))

(assert (=> b!1538674 m!1420463))

(declare-fun m!1420465 () Bool)

(assert (=> b!1538674 m!1420465))

(declare-fun m!1420467 () Bool)

(assert (=> b!1538671 m!1420467))

(assert (=> b!1538671 m!1420463))

(assert (=> b!1538675 m!1420463))

(assert (=> b!1538675 m!1420463))

(declare-fun m!1420469 () Bool)

(assert (=> b!1538675 m!1420469))

(declare-fun m!1420471 () Bool)

(assert (=> b!1538669 m!1420471))

(assert (=> b!1538669 m!1420471))

(declare-fun m!1420473 () Bool)

(assert (=> b!1538669 m!1420473))

(declare-fun m!1420475 () Bool)

(assert (=> b!1538677 m!1420475))

(declare-fun m!1420477 () Bool)

(assert (=> start!131134 m!1420477))

(declare-fun m!1420479 () Bool)

(assert (=> start!131134 m!1420479))

(declare-fun m!1420481 () Bool)

(assert (=> b!1538672 m!1420481))

(declare-fun m!1420483 () Bool)

(assert (=> b!1538676 m!1420483))

(declare-fun m!1420485 () Bool)

(assert (=> b!1538670 m!1420485))

(push 1)

(assert (not start!131134))

(assert (not b!1538675))

(assert (not b!1538670))

(assert (not b!1538677))

(assert (not b!1538669))

(assert (not b!1538674))

(assert (not b!1538672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

