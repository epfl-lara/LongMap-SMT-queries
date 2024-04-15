; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130872 () Bool)

(assert start!130872)

(declare-fun b!1535350 () Bool)

(declare-fun e!854667 () Bool)

(declare-fun e!854668 () Bool)

(assert (=> b!1535350 (= e!854667 e!854668)))

(declare-fun res!1052621 () Bool)

(assert (=> b!1535350 (=> (not res!1052621) (not e!854668))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101968 0))(
  ( (array!101969 (arr!49201 (Array (_ BitVec 32) (_ BitVec 64))) (size!49753 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101968)

(declare-fun lt!663819 () (_ BitVec 32))

(assert (=> b!1535350 (= res!1052621 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663819 #b00000000000000000000000000000000) (bvslt lt!663819 (size!49753 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535350 (= lt!663819 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535351 () Bool)

(declare-fun res!1052627 () Bool)

(assert (=> b!1535351 (=> (not res!1052627) (not e!854667))))

(declare-datatypes ((List!35753 0))(
  ( (Nil!35750) (Cons!35749 (h!37195 (_ BitVec 64)) (t!50439 List!35753)) )
))
(declare-fun arrayNoDuplicates!0 (array!101968 (_ BitVec 32) List!35753) Bool)

(assert (=> b!1535351 (= res!1052627 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35750))))

(declare-fun b!1535352 () Bool)

(declare-fun res!1052625 () Bool)

(assert (=> b!1535352 (=> (not res!1052625) (not e!854667))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535352 (= res!1052625 (and (= (size!49753 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49753 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49753 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535354 () Bool)

(declare-fun res!1052620 () Bool)

(assert (=> b!1535354 (=> (not res!1052620) (not e!854667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535354 (= res!1052620 (validKeyInArray!0 (select (arr!49201 a!2792) i!951)))))

(declare-fun b!1535355 () Bool)

(declare-fun res!1052626 () Bool)

(assert (=> b!1535355 (=> (not res!1052626) (not e!854667))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13358 0))(
  ( (MissingZero!13358 (index!55827 (_ BitVec 32))) (Found!13358 (index!55828 (_ BitVec 32))) (Intermediate!13358 (undefined!14170 Bool) (index!55829 (_ BitVec 32)) (x!137571 (_ BitVec 32))) (Undefined!13358) (MissingVacant!13358 (index!55830 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101968 (_ BitVec 32)) SeekEntryResult!13358)

(assert (=> b!1535355 (= res!1052626 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49201 a!2792) j!64) a!2792 mask!2480) (Found!13358 j!64)))))

(declare-fun b!1535356 () Bool)

(declare-fun res!1052629 () Bool)

(assert (=> b!1535356 (=> (not res!1052629) (not e!854667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101968 (_ BitVec 32)) Bool)

(assert (=> b!1535356 (= res!1052629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535357 () Bool)

(declare-fun res!1052628 () Bool)

(assert (=> b!1535357 (=> (not res!1052628) (not e!854667))))

(assert (=> b!1535357 (= res!1052628 (validKeyInArray!0 (select (arr!49201 a!2792) j!64)))))

(declare-fun b!1535358 () Bool)

(declare-fun res!1052624 () Bool)

(assert (=> b!1535358 (=> (not res!1052624) (not e!854667))))

(assert (=> b!1535358 (= res!1052624 (not (= (select (arr!49201 a!2792) index!463) (select (arr!49201 a!2792) j!64))))))

(declare-fun b!1535359 () Bool)

(declare-fun res!1052623 () Bool)

(assert (=> b!1535359 (=> (not res!1052623) (not e!854667))))

(assert (=> b!1535359 (= res!1052623 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49753 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49753 a!2792)) (= (select (arr!49201 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1052622 () Bool)

(assert (=> start!130872 (=> (not res!1052622) (not e!854667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130872 (= res!1052622 (validMask!0 mask!2480))))

(assert (=> start!130872 e!854667))

(assert (=> start!130872 true))

(declare-fun array_inv!38434 (array!101968) Bool)

(assert (=> start!130872 (array_inv!38434 a!2792)))

(declare-fun b!1535353 () Bool)

(assert (=> b!1535353 (= e!854668 false)))

(declare-fun lt!663818 () SeekEntryResult!13358)

(assert (=> b!1535353 (= lt!663818 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663819 vacantIndex!5 (select (arr!49201 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130872 res!1052622) b!1535352))

(assert (= (and b!1535352 res!1052625) b!1535354))

(assert (= (and b!1535354 res!1052620) b!1535357))

(assert (= (and b!1535357 res!1052628) b!1535356))

(assert (= (and b!1535356 res!1052629) b!1535351))

(assert (= (and b!1535351 res!1052627) b!1535359))

(assert (= (and b!1535359 res!1052623) b!1535355))

(assert (= (and b!1535355 res!1052626) b!1535358))

(assert (= (and b!1535358 res!1052624) b!1535350))

(assert (= (and b!1535350 res!1052621) b!1535353))

(declare-fun m!1417259 () Bool)

(assert (=> b!1535358 m!1417259))

(declare-fun m!1417261 () Bool)

(assert (=> b!1535358 m!1417261))

(assert (=> b!1535355 m!1417261))

(assert (=> b!1535355 m!1417261))

(declare-fun m!1417263 () Bool)

(assert (=> b!1535355 m!1417263))

(declare-fun m!1417265 () Bool)

(assert (=> b!1535359 m!1417265))

(declare-fun m!1417267 () Bool)

(assert (=> b!1535354 m!1417267))

(assert (=> b!1535354 m!1417267))

(declare-fun m!1417269 () Bool)

(assert (=> b!1535354 m!1417269))

(assert (=> b!1535353 m!1417261))

(assert (=> b!1535353 m!1417261))

(declare-fun m!1417271 () Bool)

(assert (=> b!1535353 m!1417271))

(declare-fun m!1417273 () Bool)

(assert (=> start!130872 m!1417273))

(declare-fun m!1417275 () Bool)

(assert (=> start!130872 m!1417275))

(declare-fun m!1417277 () Bool)

(assert (=> b!1535350 m!1417277))

(assert (=> b!1535357 m!1417261))

(assert (=> b!1535357 m!1417261))

(declare-fun m!1417279 () Bool)

(assert (=> b!1535357 m!1417279))

(declare-fun m!1417281 () Bool)

(assert (=> b!1535356 m!1417281))

(declare-fun m!1417283 () Bool)

(assert (=> b!1535351 m!1417283))

(check-sat (not start!130872) (not b!1535354) (not b!1535350) (not b!1535351) (not b!1535357) (not b!1535355) (not b!1535353) (not b!1535356))
(check-sat)
