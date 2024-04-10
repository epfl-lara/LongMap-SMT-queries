; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130872 () Bool)

(assert start!130872)

(declare-fun b!1534913 () Bool)

(declare-fun e!854640 () Bool)

(assert (=> b!1534913 (= e!854640 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663954 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((array!101970 0))(
  ( (array!101971 (arr!49201 (Array (_ BitVec 32) (_ BitVec 64))) (size!49751 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101970)

(declare-datatypes ((SeekEntryResult!13333 0))(
  ( (MissingZero!13333 (index!55727 (_ BitVec 32))) (Found!13333 (index!55728 (_ BitVec 32))) (Intermediate!13333 (undefined!14145 Bool) (index!55729 (_ BitVec 32)) (x!137479 (_ BitVec 32))) (Undefined!13333) (MissingVacant!13333 (index!55730 (_ BitVec 32))) )
))
(declare-fun lt!663955 () SeekEntryResult!13333)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101970 (_ BitVec 32)) SeekEntryResult!13333)

(assert (=> b!1534913 (= lt!663955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663954 vacantIndex!5 (select (arr!49201 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052008 () Bool)

(declare-fun e!854639 () Bool)

(assert (=> start!130872 (=> (not res!1052008) (not e!854639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130872 (= res!1052008 (validMask!0 mask!2480))))

(assert (=> start!130872 e!854639))

(assert (=> start!130872 true))

(declare-fun array_inv!38229 (array!101970) Bool)

(assert (=> start!130872 (array_inv!38229 a!2792)))

(declare-fun b!1534914 () Bool)

(declare-fun res!1051999 () Bool)

(assert (=> b!1534914 (=> (not res!1051999) (not e!854639))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534914 (= res!1051999 (and (= (size!49751 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49751 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49751 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534915 () Bool)

(declare-fun res!1052002 () Bool)

(assert (=> b!1534915 (=> (not res!1052002) (not e!854639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101970 (_ BitVec 32)) Bool)

(assert (=> b!1534915 (= res!1052002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534916 () Bool)

(declare-fun res!1052005 () Bool)

(assert (=> b!1534916 (=> (not res!1052005) (not e!854639))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534916 (= res!1052005 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49751 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49751 a!2792)) (= (select (arr!49201 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534917 () Bool)

(declare-fun res!1052006 () Bool)

(assert (=> b!1534917 (=> (not res!1052006) (not e!854639))))

(assert (=> b!1534917 (= res!1052006 (not (= (select (arr!49201 a!2792) index!463) (select (arr!49201 a!2792) j!64))))))

(declare-fun b!1534918 () Bool)

(declare-fun res!1052004 () Bool)

(assert (=> b!1534918 (=> (not res!1052004) (not e!854639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534918 (= res!1052004 (validKeyInArray!0 (select (arr!49201 a!2792) j!64)))))

(declare-fun b!1534919 () Bool)

(declare-fun res!1052007 () Bool)

(assert (=> b!1534919 (=> (not res!1052007) (not e!854639))))

(assert (=> b!1534919 (= res!1052007 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49201 a!2792) j!64) a!2792 mask!2480) (Found!13333 j!64)))))

(declare-fun b!1534920 () Bool)

(declare-fun res!1052000 () Bool)

(assert (=> b!1534920 (=> (not res!1052000) (not e!854639))))

(declare-datatypes ((List!35675 0))(
  ( (Nil!35672) (Cons!35671 (h!37116 (_ BitVec 64)) (t!50369 List!35675)) )
))
(declare-fun arrayNoDuplicates!0 (array!101970 (_ BitVec 32) List!35675) Bool)

(assert (=> b!1534920 (= res!1052000 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35672))))

(declare-fun b!1534921 () Bool)

(declare-fun res!1052001 () Bool)

(assert (=> b!1534921 (=> (not res!1052001) (not e!854639))))

(assert (=> b!1534921 (= res!1052001 (validKeyInArray!0 (select (arr!49201 a!2792) i!951)))))

(declare-fun b!1534922 () Bool)

(assert (=> b!1534922 (= e!854639 e!854640)))

(declare-fun res!1052003 () Bool)

(assert (=> b!1534922 (=> (not res!1052003) (not e!854640))))

(assert (=> b!1534922 (= res!1052003 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663954 #b00000000000000000000000000000000) (bvslt lt!663954 (size!49751 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534922 (= lt!663954 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130872 res!1052008) b!1534914))

(assert (= (and b!1534914 res!1051999) b!1534921))

(assert (= (and b!1534921 res!1052001) b!1534918))

(assert (= (and b!1534918 res!1052004) b!1534915))

(assert (= (and b!1534915 res!1052002) b!1534920))

(assert (= (and b!1534920 res!1052000) b!1534916))

(assert (= (and b!1534916 res!1052005) b!1534919))

(assert (= (and b!1534919 res!1052007) b!1534917))

(assert (= (and b!1534917 res!1052006) b!1534922))

(assert (= (and b!1534922 res!1052003) b!1534913))

(declare-fun m!1417501 () Bool)

(assert (=> b!1534916 m!1417501))

(declare-fun m!1417503 () Bool)

(assert (=> b!1534921 m!1417503))

(assert (=> b!1534921 m!1417503))

(declare-fun m!1417505 () Bool)

(assert (=> b!1534921 m!1417505))

(declare-fun m!1417507 () Bool)

(assert (=> b!1534915 m!1417507))

(declare-fun m!1417509 () Bool)

(assert (=> b!1534913 m!1417509))

(assert (=> b!1534913 m!1417509))

(declare-fun m!1417511 () Bool)

(assert (=> b!1534913 m!1417511))

(declare-fun m!1417513 () Bool)

(assert (=> b!1534922 m!1417513))

(declare-fun m!1417515 () Bool)

(assert (=> b!1534920 m!1417515))

(assert (=> b!1534918 m!1417509))

(assert (=> b!1534918 m!1417509))

(declare-fun m!1417517 () Bool)

(assert (=> b!1534918 m!1417517))

(declare-fun m!1417519 () Bool)

(assert (=> b!1534917 m!1417519))

(assert (=> b!1534917 m!1417509))

(assert (=> b!1534919 m!1417509))

(assert (=> b!1534919 m!1417509))

(declare-fun m!1417521 () Bool)

(assert (=> b!1534919 m!1417521))

(declare-fun m!1417523 () Bool)

(assert (=> start!130872 m!1417523))

(declare-fun m!1417525 () Bool)

(assert (=> start!130872 m!1417525))

(push 1)

(assert (not b!1534918))

(assert (not b!1534919))

(assert (not b!1534921))

(assert (not b!1534915))

(assert (not b!1534913))

(assert (not start!130872))

(assert (not b!1534922))

(assert (not b!1534920))

(check-sat)

