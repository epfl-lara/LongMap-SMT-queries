; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130780 () Bool)

(assert start!130780)

(declare-fun b!1533775 () Bool)

(declare-fun res!1050866 () Bool)

(declare-fun e!854319 () Bool)

(assert (=> b!1533775 (=> (not res!1050866) (not e!854319))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101878 0))(
  ( (array!101879 (arr!49155 (Array (_ BitVec 32) (_ BitVec 64))) (size!49705 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101878)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533775 (= res!1050866 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49705 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49705 a!2792)) (= (select (arr!49155 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533776 () Bool)

(declare-fun res!1050862 () Bool)

(assert (=> b!1533776 (=> (not res!1050862) (not e!854319))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533776 (= res!1050862 (and (= (size!49705 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49705 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49705 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050861 () Bool)

(assert (=> start!130780 (=> (not res!1050861) (not e!854319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130780 (= res!1050861 (validMask!0 mask!2480))))

(assert (=> start!130780 e!854319))

(assert (=> start!130780 true))

(declare-fun array_inv!38183 (array!101878) Bool)

(assert (=> start!130780 (array_inv!38183 a!2792)))

(declare-fun b!1533777 () Bool)

(declare-fun res!1050863 () Bool)

(assert (=> b!1533777 (=> (not res!1050863) (not e!854319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533777 (= res!1050863 (validKeyInArray!0 (select (arr!49155 a!2792) j!64)))))

(declare-fun b!1533778 () Bool)

(assert (=> b!1533778 (= e!854319 (and (= (select (arr!49155 a!2792) index!463) (select (arr!49155 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533779 () Bool)

(declare-fun res!1050867 () Bool)

(assert (=> b!1533779 (=> (not res!1050867) (not e!854319))))

(assert (=> b!1533779 (= res!1050867 (validKeyInArray!0 (select (arr!49155 a!2792) i!951)))))

(declare-fun b!1533780 () Bool)

(declare-fun res!1050868 () Bool)

(assert (=> b!1533780 (=> (not res!1050868) (not e!854319))))

(declare-datatypes ((List!35629 0))(
  ( (Nil!35626) (Cons!35625 (h!37070 (_ BitVec 64)) (t!50323 List!35629)) )
))
(declare-fun arrayNoDuplicates!0 (array!101878 (_ BitVec 32) List!35629) Bool)

(assert (=> b!1533780 (= res!1050868 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35626))))

(declare-fun b!1533781 () Bool)

(declare-fun res!1050864 () Bool)

(assert (=> b!1533781 (=> (not res!1050864) (not e!854319))))

(declare-datatypes ((SeekEntryResult!13287 0))(
  ( (MissingZero!13287 (index!55543 (_ BitVec 32))) (Found!13287 (index!55544 (_ BitVec 32))) (Intermediate!13287 (undefined!14099 Bool) (index!55545 (_ BitVec 32)) (x!137313 (_ BitVec 32))) (Undefined!13287) (MissingVacant!13287 (index!55546 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101878 (_ BitVec 32)) SeekEntryResult!13287)

(assert (=> b!1533781 (= res!1050864 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49155 a!2792) j!64) a!2792 mask!2480) (Found!13287 j!64)))))

(declare-fun b!1533782 () Bool)

(declare-fun res!1050865 () Bool)

(assert (=> b!1533782 (=> (not res!1050865) (not e!854319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101878 (_ BitVec 32)) Bool)

(assert (=> b!1533782 (= res!1050865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130780 res!1050861) b!1533776))

(assert (= (and b!1533776 res!1050862) b!1533779))

(assert (= (and b!1533779 res!1050867) b!1533777))

(assert (= (and b!1533777 res!1050863) b!1533782))

(assert (= (and b!1533782 res!1050865) b!1533780))

(assert (= (and b!1533780 res!1050868) b!1533775))

(assert (= (and b!1533775 res!1050866) b!1533781))

(assert (= (and b!1533781 res!1050864) b!1533778))

(declare-fun m!1416469 () Bool)

(assert (=> b!1533782 m!1416469))

(declare-fun m!1416471 () Bool)

(assert (=> b!1533780 m!1416471))

(declare-fun m!1416473 () Bool)

(assert (=> b!1533781 m!1416473))

(assert (=> b!1533781 m!1416473))

(declare-fun m!1416475 () Bool)

(assert (=> b!1533781 m!1416475))

(declare-fun m!1416477 () Bool)

(assert (=> b!1533775 m!1416477))

(assert (=> b!1533777 m!1416473))

(assert (=> b!1533777 m!1416473))

(declare-fun m!1416479 () Bool)

(assert (=> b!1533777 m!1416479))

(declare-fun m!1416481 () Bool)

(assert (=> start!130780 m!1416481))

(declare-fun m!1416483 () Bool)

(assert (=> start!130780 m!1416483))

(declare-fun m!1416485 () Bool)

(assert (=> b!1533778 m!1416485))

(assert (=> b!1533778 m!1416473))

(declare-fun m!1416487 () Bool)

(assert (=> b!1533779 m!1416487))

(assert (=> b!1533779 m!1416487))

(declare-fun m!1416489 () Bool)

(assert (=> b!1533779 m!1416489))

(check-sat (not b!1533782) (not b!1533779) (not start!130780) (not b!1533777) (not b!1533780) (not b!1533781))
(check-sat)
