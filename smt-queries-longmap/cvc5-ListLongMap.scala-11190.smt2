; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130772 () Bool)

(assert start!130772)

(declare-fun b!1533686 () Bool)

(declare-fun res!1050778 () Bool)

(declare-fun e!854295 () Bool)

(assert (=> b!1533686 (=> (not res!1050778) (not e!854295))))

(declare-datatypes ((array!101870 0))(
  ( (array!101871 (arr!49151 (Array (_ BitVec 32) (_ BitVec 64))) (size!49701 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101870)

(declare-datatypes ((List!35625 0))(
  ( (Nil!35622) (Cons!35621 (h!37066 (_ BitVec 64)) (t!50319 List!35625)) )
))
(declare-fun arrayNoDuplicates!0 (array!101870 (_ BitVec 32) List!35625) Bool)

(assert (=> b!1533686 (= res!1050778 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35622))))

(declare-fun b!1533687 () Bool)

(declare-fun res!1050776 () Bool)

(assert (=> b!1533687 (=> (not res!1050776) (not e!854295))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533687 (= res!1050776 (validKeyInArray!0 (select (arr!49151 a!2792) i!951)))))

(declare-fun b!1533688 () Bool)

(assert (=> b!1533688 (= e!854295 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13283 0))(
  ( (MissingZero!13283 (index!55527 (_ BitVec 32))) (Found!13283 (index!55528 (_ BitVec 32))) (Intermediate!13283 (undefined!14095 Bool) (index!55529 (_ BitVec 32)) (x!137301 (_ BitVec 32))) (Undefined!13283) (MissingVacant!13283 (index!55530 (_ BitVec 32))) )
))
(declare-fun lt!663805 () SeekEntryResult!13283)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101870 (_ BitVec 32)) SeekEntryResult!13283)

(assert (=> b!1533688 (= lt!663805 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49151 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533689 () Bool)

(declare-fun res!1050777 () Bool)

(assert (=> b!1533689 (=> (not res!1050777) (not e!854295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101870 (_ BitVec 32)) Bool)

(assert (=> b!1533689 (= res!1050777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533690 () Bool)

(declare-fun res!1050775 () Bool)

(assert (=> b!1533690 (=> (not res!1050775) (not e!854295))))

(assert (=> b!1533690 (= res!1050775 (validKeyInArray!0 (select (arr!49151 a!2792) j!64)))))

(declare-fun b!1533691 () Bool)

(declare-fun res!1050772 () Bool)

(assert (=> b!1533691 (=> (not res!1050772) (not e!854295))))

(assert (=> b!1533691 (= res!1050772 (and (= (size!49701 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49701 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49701 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050773 () Bool)

(assert (=> start!130772 (=> (not res!1050773) (not e!854295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130772 (= res!1050773 (validMask!0 mask!2480))))

(assert (=> start!130772 e!854295))

(assert (=> start!130772 true))

(declare-fun array_inv!38179 (array!101870) Bool)

(assert (=> start!130772 (array_inv!38179 a!2792)))

(declare-fun b!1533692 () Bool)

(declare-fun res!1050774 () Bool)

(assert (=> b!1533692 (=> (not res!1050774) (not e!854295))))

(assert (=> b!1533692 (= res!1050774 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49701 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49701 a!2792)) (= (select (arr!49151 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130772 res!1050773) b!1533691))

(assert (= (and b!1533691 res!1050772) b!1533687))

(assert (= (and b!1533687 res!1050776) b!1533690))

(assert (= (and b!1533690 res!1050775) b!1533689))

(assert (= (and b!1533689 res!1050777) b!1533686))

(assert (= (and b!1533686 res!1050778) b!1533692))

(assert (= (and b!1533692 res!1050774) b!1533688))

(declare-fun m!1416387 () Bool)

(assert (=> b!1533689 m!1416387))

(declare-fun m!1416389 () Bool)

(assert (=> b!1533692 m!1416389))

(declare-fun m!1416391 () Bool)

(assert (=> start!130772 m!1416391))

(declare-fun m!1416393 () Bool)

(assert (=> start!130772 m!1416393))

(declare-fun m!1416395 () Bool)

(assert (=> b!1533690 m!1416395))

(assert (=> b!1533690 m!1416395))

(declare-fun m!1416397 () Bool)

(assert (=> b!1533690 m!1416397))

(declare-fun m!1416399 () Bool)

(assert (=> b!1533687 m!1416399))

(assert (=> b!1533687 m!1416399))

(declare-fun m!1416401 () Bool)

(assert (=> b!1533687 m!1416401))

(declare-fun m!1416403 () Bool)

(assert (=> b!1533686 m!1416403))

(assert (=> b!1533688 m!1416395))

(assert (=> b!1533688 m!1416395))

(declare-fun m!1416405 () Bool)

(assert (=> b!1533688 m!1416405))

(push 1)

(assert (not b!1533687))

(assert (not start!130772))

(assert (not b!1533689))

(assert (not b!1533690))

(assert (not b!1533686))

(assert (not b!1533688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

