; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131142 () Bool)

(assert start!131142)

(declare-fun res!1051431 () Bool)

(declare-fun e!855678 () Bool)

(assert (=> start!131142 (=> (not res!1051431) (not e!855678))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131142 (= res!1051431 (validMask!0 mask!2480))))

(assert (=> start!131142 e!855678))

(assert (=> start!131142 true))

(declare-datatypes ((array!101977 0))(
  ( (array!101978 (arr!49198 (Array (_ BitVec 32) (_ BitVec 64))) (size!49749 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101977)

(declare-fun array_inv!38479 (array!101977) Bool)

(assert (=> start!131142 (array_inv!38479 a!2792)))

(declare-fun b!1535827 () Bool)

(declare-fun res!1051432 () Bool)

(assert (=> b!1535827 (=> (not res!1051432) (not e!855678))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535827 (= res!1051432 (and (= (size!49749 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49749 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49749 a!2792)) (not (= i!951 j!64))))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun b!1535828 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535828 (= e!855678 (and (= (select (arr!49198 a!2792) index!463) (select (arr!49198 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49198 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1535829 () Bool)

(declare-fun res!1051430 () Bool)

(assert (=> b!1535829 (=> (not res!1051430) (not e!855678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535829 (= res!1051430 (validKeyInArray!0 (select (arr!49198 a!2792) i!951)))))

(declare-fun b!1535830 () Bool)

(declare-fun res!1051429 () Bool)

(assert (=> b!1535830 (=> (not res!1051429) (not e!855678))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1535830 (= res!1051429 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49749 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49749 a!2792)) (= (select (arr!49198 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535831 () Bool)

(declare-fun res!1051434 () Bool)

(assert (=> b!1535831 (=> (not res!1051434) (not e!855678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101977 (_ BitVec 32)) Bool)

(assert (=> b!1535831 (= res!1051434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535832 () Bool)

(declare-fun res!1051428 () Bool)

(assert (=> b!1535832 (=> (not res!1051428) (not e!855678))))

(declare-datatypes ((List!35659 0))(
  ( (Nil!35656) (Cons!35655 (h!37118 (_ BitVec 64)) (t!50345 List!35659)) )
))
(declare-fun arrayNoDuplicates!0 (array!101977 (_ BitVec 32) List!35659) Bool)

(assert (=> b!1535832 (= res!1051428 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35656))))

(declare-fun b!1535833 () Bool)

(declare-fun res!1051433 () Bool)

(assert (=> b!1535833 (=> (not res!1051433) (not e!855678))))

(assert (=> b!1535833 (= res!1051433 (validKeyInArray!0 (select (arr!49198 a!2792) j!64)))))

(declare-fun b!1535834 () Bool)

(declare-fun res!1051427 () Bool)

(assert (=> b!1535834 (=> (not res!1051427) (not e!855678))))

(declare-datatypes ((SeekEntryResult!13225 0))(
  ( (MissingZero!13225 (index!55295 (_ BitVec 32))) (Found!13225 (index!55296 (_ BitVec 32))) (Intermediate!13225 (undefined!14037 Bool) (index!55297 (_ BitVec 32)) (x!137274 (_ BitVec 32))) (Undefined!13225) (MissingVacant!13225 (index!55298 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101977 (_ BitVec 32)) SeekEntryResult!13225)

(assert (=> b!1535834 (= res!1051427 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49198 a!2792) j!64) a!2792 mask!2480) (Found!13225 j!64)))))

(assert (= (and start!131142 res!1051431) b!1535827))

(assert (= (and b!1535827 res!1051432) b!1535829))

(assert (= (and b!1535829 res!1051430) b!1535833))

(assert (= (and b!1535833 res!1051433) b!1535831))

(assert (= (and b!1535831 res!1051434) b!1535832))

(assert (= (and b!1535832 res!1051428) b!1535830))

(assert (= (and b!1535830 res!1051429) b!1535834))

(assert (= (and b!1535834 res!1051427) b!1535828))

(declare-fun m!1418377 () Bool)

(assert (=> b!1535830 m!1418377))

(declare-fun m!1418379 () Bool)

(assert (=> b!1535828 m!1418379))

(declare-fun m!1418381 () Bool)

(assert (=> b!1535828 m!1418381))

(declare-fun m!1418383 () Bool)

(assert (=> b!1535828 m!1418383))

(declare-fun m!1418385 () Bool)

(assert (=> b!1535828 m!1418385))

(assert (=> b!1535833 m!1418381))

(assert (=> b!1535833 m!1418381))

(declare-fun m!1418387 () Bool)

(assert (=> b!1535833 m!1418387))

(assert (=> b!1535834 m!1418381))

(assert (=> b!1535834 m!1418381))

(declare-fun m!1418389 () Bool)

(assert (=> b!1535834 m!1418389))

(declare-fun m!1418391 () Bool)

(assert (=> b!1535832 m!1418391))

(declare-fun m!1418393 () Bool)

(assert (=> b!1535831 m!1418393))

(declare-fun m!1418395 () Bool)

(assert (=> b!1535829 m!1418395))

(assert (=> b!1535829 m!1418395))

(declare-fun m!1418397 () Bool)

(assert (=> b!1535829 m!1418397))

(declare-fun m!1418399 () Bool)

(assert (=> start!131142 m!1418399))

(declare-fun m!1418401 () Bool)

(assert (=> start!131142 m!1418401))

(check-sat (not b!1535832) (not b!1535829) (not b!1535833) (not b!1535834) (not start!131142) (not b!1535831))
(check-sat)
