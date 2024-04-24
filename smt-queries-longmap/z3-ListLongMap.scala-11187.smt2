; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131136 () Bool)

(assert start!131136)

(declare-fun res!1051360 () Bool)

(declare-fun e!855660 () Bool)

(assert (=> start!131136 (=> (not res!1051360) (not e!855660))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131136 (= res!1051360 (validMask!0 mask!2480))))

(assert (=> start!131136 e!855660))

(assert (=> start!131136 true))

(declare-datatypes ((array!101971 0))(
  ( (array!101972 (arr!49195 (Array (_ BitVec 32) (_ BitVec 64))) (size!49746 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101971)

(declare-fun array_inv!38476 (array!101971) Bool)

(assert (=> start!131136 (array_inv!38476 a!2792)))

(declare-fun b!1535755 () Bool)

(declare-fun res!1051355 () Bool)

(assert (=> b!1535755 (=> (not res!1051355) (not e!855660))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1535755 (= res!1051355 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49746 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49746 a!2792)) (= (select (arr!49195 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1535756 () Bool)

(assert (=> b!1535756 (= e!855660 (and (= (select (arr!49195 a!2792) index!463) (select (arr!49195 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1535757 () Bool)

(declare-fun res!1051357 () Bool)

(assert (=> b!1535757 (=> (not res!1051357) (not e!855660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101971 (_ BitVec 32)) Bool)

(assert (=> b!1535757 (= res!1051357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535758 () Bool)

(declare-fun res!1051362 () Bool)

(assert (=> b!1535758 (=> (not res!1051362) (not e!855660))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535758 (= res!1051362 (and (= (size!49746 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49746 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49746 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535759 () Bool)

(declare-fun res!1051359 () Bool)

(assert (=> b!1535759 (=> (not res!1051359) (not e!855660))))

(declare-datatypes ((SeekEntryResult!13222 0))(
  ( (MissingZero!13222 (index!55283 (_ BitVec 32))) (Found!13222 (index!55284 (_ BitVec 32))) (Intermediate!13222 (undefined!14034 Bool) (index!55285 (_ BitVec 32)) (x!137263 (_ BitVec 32))) (Undefined!13222) (MissingVacant!13222 (index!55286 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101971 (_ BitVec 32)) SeekEntryResult!13222)

(assert (=> b!1535759 (= res!1051359 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49195 a!2792) j!64) a!2792 mask!2480) (Found!13222 j!64)))))

(declare-fun b!1535760 () Bool)

(declare-fun res!1051361 () Bool)

(assert (=> b!1535760 (=> (not res!1051361) (not e!855660))))

(declare-datatypes ((List!35656 0))(
  ( (Nil!35653) (Cons!35652 (h!37115 (_ BitVec 64)) (t!50342 List!35656)) )
))
(declare-fun arrayNoDuplicates!0 (array!101971 (_ BitVec 32) List!35656) Bool)

(assert (=> b!1535760 (= res!1051361 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35653))))

(declare-fun b!1535761 () Bool)

(declare-fun res!1051356 () Bool)

(assert (=> b!1535761 (=> (not res!1051356) (not e!855660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535761 (= res!1051356 (validKeyInArray!0 (select (arr!49195 a!2792) i!951)))))

(declare-fun b!1535762 () Bool)

(declare-fun res!1051358 () Bool)

(assert (=> b!1535762 (=> (not res!1051358) (not e!855660))))

(assert (=> b!1535762 (= res!1051358 (validKeyInArray!0 (select (arr!49195 a!2792) j!64)))))

(assert (= (and start!131136 res!1051360) b!1535758))

(assert (= (and b!1535758 res!1051362) b!1535761))

(assert (= (and b!1535761 res!1051356) b!1535762))

(assert (= (and b!1535762 res!1051358) b!1535757))

(assert (= (and b!1535757 res!1051357) b!1535760))

(assert (= (and b!1535760 res!1051361) b!1535755))

(assert (= (and b!1535755 res!1051355) b!1535759))

(assert (= (and b!1535759 res!1051359) b!1535756))

(declare-fun m!1418311 () Bool)

(assert (=> b!1535762 m!1418311))

(assert (=> b!1535762 m!1418311))

(declare-fun m!1418313 () Bool)

(assert (=> b!1535762 m!1418313))

(declare-fun m!1418315 () Bool)

(assert (=> b!1535760 m!1418315))

(declare-fun m!1418317 () Bool)

(assert (=> b!1535755 m!1418317))

(declare-fun m!1418319 () Bool)

(assert (=> start!131136 m!1418319))

(declare-fun m!1418321 () Bool)

(assert (=> start!131136 m!1418321))

(declare-fun m!1418323 () Bool)

(assert (=> b!1535761 m!1418323))

(assert (=> b!1535761 m!1418323))

(declare-fun m!1418325 () Bool)

(assert (=> b!1535761 m!1418325))

(assert (=> b!1535759 m!1418311))

(assert (=> b!1535759 m!1418311))

(declare-fun m!1418327 () Bool)

(assert (=> b!1535759 m!1418327))

(declare-fun m!1418329 () Bool)

(assert (=> b!1535757 m!1418329))

(declare-fun m!1418331 () Bool)

(assert (=> b!1535756 m!1418331))

(assert (=> b!1535756 m!1418311))

(check-sat (not b!1535759) (not b!1535757) (not b!1535760) (not b!1535761) (not b!1535762) (not start!131136))
(check-sat)
