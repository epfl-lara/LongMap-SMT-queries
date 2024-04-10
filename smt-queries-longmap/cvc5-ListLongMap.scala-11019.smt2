; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128946 () Bool)

(assert start!128946)

(declare-fun b!1511603 () Bool)

(declare-fun res!1031509 () Bool)

(declare-fun e!843885 () Bool)

(assert (=> b!1511603 (=> (not res!1031509) (not e!843885))))

(declare-datatypes ((SeekEntryResult!12809 0))(
  ( (MissingZero!12809 (index!53631 (_ BitVec 32))) (Found!12809 (index!53632 (_ BitVec 32))) (Intermediate!12809 (undefined!13621 Bool) (index!53633 (_ BitVec 32)) (x!135367 (_ BitVec 32))) (Undefined!12809) (MissingVacant!12809 (index!53634 (_ BitVec 32))) )
))
(declare-fun lt!655484 () SeekEntryResult!12809)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100802 0))(
  ( (array!100803 (arr!48638 (Array (_ BitVec 32) (_ BitVec 64))) (size!49188 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100802)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100802 (_ BitVec 32)) SeekEntryResult!12809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511603 (= res!1031509 (= lt!655484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48638 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48638 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100803 (store (arr!48638 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49188 a!2804)) mask!2512)))))

(declare-fun b!1511604 () Bool)

(assert (=> b!1511604 (= e!843885 (not true))))

(declare-fun e!843886 () Bool)

(assert (=> b!1511604 e!843886))

(declare-fun res!1031511 () Bool)

(assert (=> b!1511604 (=> (not res!1031511) (not e!843886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100802 (_ BitVec 32)) Bool)

(assert (=> b!1511604 (= res!1031511 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50486 0))(
  ( (Unit!50487) )
))
(declare-fun lt!655485 () Unit!50486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50486)

(assert (=> b!1511604 (= lt!655485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511605 () Bool)

(declare-fun res!1031507 () Bool)

(declare-fun e!843883 () Bool)

(assert (=> b!1511605 (=> (not res!1031507) (not e!843883))))

(declare-datatypes ((List!35121 0))(
  ( (Nil!35118) (Cons!35117 (h!36529 (_ BitVec 64)) (t!49815 List!35121)) )
))
(declare-fun arrayNoDuplicates!0 (array!100802 (_ BitVec 32) List!35121) Bool)

(assert (=> b!1511605 (= res!1031507 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35118))))

(declare-fun b!1511606 () Bool)

(declare-fun e!843884 () Bool)

(assert (=> b!1511606 (= e!843886 e!843884)))

(declare-fun res!1031513 () Bool)

(assert (=> b!1511606 (=> res!1031513 e!843884)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511606 (= res!1031513 (or (not (= (select (arr!48638 a!2804) j!70) (select (store (arr!48638 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48638 a!2804) index!487) (select (arr!48638 a!2804) j!70)) (not (= (select (arr!48638 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511607 () Bool)

(declare-fun res!1031515 () Bool)

(assert (=> b!1511607 (=> (not res!1031515) (not e!843883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511607 (= res!1031515 (validKeyInArray!0 (select (arr!48638 a!2804) i!961)))))

(declare-fun b!1511609 () Bool)

(declare-fun res!1031510 () Bool)

(assert (=> b!1511609 (=> (not res!1031510) (not e!843886))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100802 (_ BitVec 32)) SeekEntryResult!12809)

(assert (=> b!1511609 (= res!1031510 (= (seekEntry!0 (select (arr!48638 a!2804) j!70) a!2804 mask!2512) (Found!12809 j!70)))))

(declare-fun b!1511610 () Bool)

(declare-fun res!1031518 () Bool)

(assert (=> b!1511610 (=> (not res!1031518) (not e!843883))))

(assert (=> b!1511610 (= res!1031518 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49188 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49188 a!2804))))))

(declare-fun b!1511611 () Bool)

(declare-fun res!1031512 () Bool)

(assert (=> b!1511611 (=> (not res!1031512) (not e!843883))))

(assert (=> b!1511611 (= res!1031512 (validKeyInArray!0 (select (arr!48638 a!2804) j!70)))))

(declare-fun b!1511612 () Bool)

(declare-fun res!1031517 () Bool)

(assert (=> b!1511612 (=> (not res!1031517) (not e!843885))))

(declare-fun lt!655486 () SeekEntryResult!12809)

(assert (=> b!1511612 (= res!1031517 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48638 a!2804) j!70) a!2804 mask!2512) lt!655486))))

(declare-fun b!1511613 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100802 (_ BitVec 32)) SeekEntryResult!12809)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100802 (_ BitVec 32)) SeekEntryResult!12809)

(assert (=> b!1511613 (= e!843884 (= (seekEntryOrOpen!0 (select (arr!48638 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48638 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511614 () Bool)

(declare-fun res!1031506 () Bool)

(assert (=> b!1511614 (=> (not res!1031506) (not e!843883))))

(assert (=> b!1511614 (= res!1031506 (and (= (size!49188 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49188 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49188 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511615 () Bool)

(declare-fun res!1031508 () Bool)

(assert (=> b!1511615 (=> (not res!1031508) (not e!843883))))

(assert (=> b!1511615 (= res!1031508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511608 () Bool)

(assert (=> b!1511608 (= e!843883 e!843885)))

(declare-fun res!1031514 () Bool)

(assert (=> b!1511608 (=> (not res!1031514) (not e!843885))))

(assert (=> b!1511608 (= res!1031514 (= lt!655484 lt!655486))))

(assert (=> b!1511608 (= lt!655486 (Intermediate!12809 false resIndex!21 resX!21))))

(assert (=> b!1511608 (= lt!655484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48638 a!2804) j!70) mask!2512) (select (arr!48638 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031516 () Bool)

(assert (=> start!128946 (=> (not res!1031516) (not e!843883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128946 (= res!1031516 (validMask!0 mask!2512))))

(assert (=> start!128946 e!843883))

(assert (=> start!128946 true))

(declare-fun array_inv!37666 (array!100802) Bool)

(assert (=> start!128946 (array_inv!37666 a!2804)))

(assert (= (and start!128946 res!1031516) b!1511614))

(assert (= (and b!1511614 res!1031506) b!1511607))

(assert (= (and b!1511607 res!1031515) b!1511611))

(assert (= (and b!1511611 res!1031512) b!1511615))

(assert (= (and b!1511615 res!1031508) b!1511605))

(assert (= (and b!1511605 res!1031507) b!1511610))

(assert (= (and b!1511610 res!1031518) b!1511608))

(assert (= (and b!1511608 res!1031514) b!1511612))

(assert (= (and b!1511612 res!1031517) b!1511603))

(assert (= (and b!1511603 res!1031509) b!1511604))

(assert (= (and b!1511604 res!1031511) b!1511609))

(assert (= (and b!1511609 res!1031510) b!1511606))

(assert (= (and b!1511606 (not res!1031513)) b!1511613))

(declare-fun m!1394311 () Bool)

(assert (=> b!1511606 m!1394311))

(declare-fun m!1394313 () Bool)

(assert (=> b!1511606 m!1394313))

(declare-fun m!1394315 () Bool)

(assert (=> b!1511606 m!1394315))

(declare-fun m!1394317 () Bool)

(assert (=> b!1511606 m!1394317))

(declare-fun m!1394319 () Bool)

(assert (=> b!1511604 m!1394319))

(declare-fun m!1394321 () Bool)

(assert (=> b!1511604 m!1394321))

(declare-fun m!1394323 () Bool)

(assert (=> start!128946 m!1394323))

(declare-fun m!1394325 () Bool)

(assert (=> start!128946 m!1394325))

(declare-fun m!1394327 () Bool)

(assert (=> b!1511605 m!1394327))

(assert (=> b!1511612 m!1394311))

(assert (=> b!1511612 m!1394311))

(declare-fun m!1394329 () Bool)

(assert (=> b!1511612 m!1394329))

(assert (=> b!1511609 m!1394311))

(assert (=> b!1511609 m!1394311))

(declare-fun m!1394331 () Bool)

(assert (=> b!1511609 m!1394331))

(declare-fun m!1394333 () Bool)

(assert (=> b!1511615 m!1394333))

(assert (=> b!1511611 m!1394311))

(assert (=> b!1511611 m!1394311))

(declare-fun m!1394335 () Bool)

(assert (=> b!1511611 m!1394335))

(assert (=> b!1511613 m!1394311))

(assert (=> b!1511613 m!1394311))

(declare-fun m!1394337 () Bool)

(assert (=> b!1511613 m!1394337))

(assert (=> b!1511613 m!1394311))

(declare-fun m!1394339 () Bool)

(assert (=> b!1511613 m!1394339))

(assert (=> b!1511603 m!1394313))

(assert (=> b!1511603 m!1394315))

(assert (=> b!1511603 m!1394315))

(declare-fun m!1394341 () Bool)

(assert (=> b!1511603 m!1394341))

(assert (=> b!1511603 m!1394341))

(assert (=> b!1511603 m!1394315))

(declare-fun m!1394343 () Bool)

(assert (=> b!1511603 m!1394343))

(declare-fun m!1394345 () Bool)

(assert (=> b!1511607 m!1394345))

(assert (=> b!1511607 m!1394345))

(declare-fun m!1394347 () Bool)

(assert (=> b!1511607 m!1394347))

(assert (=> b!1511608 m!1394311))

(assert (=> b!1511608 m!1394311))

(declare-fun m!1394349 () Bool)

(assert (=> b!1511608 m!1394349))

(assert (=> b!1511608 m!1394349))

(assert (=> b!1511608 m!1394311))

(declare-fun m!1394351 () Bool)

(assert (=> b!1511608 m!1394351))

(push 1)

