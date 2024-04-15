; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128900 () Bool)

(assert start!128900)

(declare-fun b!1511380 () Bool)

(declare-fun res!1031490 () Bool)

(declare-fun e!843715 () Bool)

(assert (=> b!1511380 (=> (not res!1031490) (not e!843715))))

(declare-datatypes ((array!100756 0))(
  ( (array!100757 (arr!48616 (Array (_ BitVec 32) (_ BitVec 64))) (size!49168 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100756)

(declare-datatypes ((List!35177 0))(
  ( (Nil!35174) (Cons!35173 (h!36586 (_ BitVec 64)) (t!49863 List!35177)) )
))
(declare-fun arrayNoDuplicates!0 (array!100756 (_ BitVec 32) List!35177) Bool)

(assert (=> b!1511380 (= res!1031490 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35174))))

(declare-fun b!1511382 () Bool)

(declare-fun res!1031500 () Bool)

(assert (=> b!1511382 (=> (not res!1031500) (not e!843715))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511382 (= res!1031500 (validKeyInArray!0 (select (arr!48616 a!2804) j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!843713 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun b!1511383 () Bool)

(assert (=> b!1511383 (= e!843713 (not (or (not (= (select (arr!48616 a!2804) j!70) (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48616 a!2804) index!487) (select (arr!48616 a!2804) j!70)) (not (= (select (arr!48616 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843717 () Bool)

(assert (=> b!1511383 e!843717))

(declare-fun res!1031491 () Bool)

(assert (=> b!1511383 (=> (not res!1031491) (not e!843717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100756 (_ BitVec 32)) Bool)

(assert (=> b!1511383 (= res!1031491 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50327 0))(
  ( (Unit!50328) )
))
(declare-fun lt!655216 () Unit!50327)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50327)

(assert (=> b!1511383 (= lt!655216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511384 () Bool)

(assert (=> b!1511384 (= e!843715 e!843713)))

(declare-fun res!1031496 () Bool)

(assert (=> b!1511384 (=> (not res!1031496) (not e!843713))))

(declare-datatypes ((SeekEntryResult!12810 0))(
  ( (MissingZero!12810 (index!53635 (_ BitVec 32))) (Found!12810 (index!53636 (_ BitVec 32))) (Intermediate!12810 (undefined!13622 Bool) (index!53637 (_ BitVec 32)) (x!135370 (_ BitVec 32))) (Undefined!12810) (MissingVacant!12810 (index!53638 (_ BitVec 32))) )
))
(declare-fun lt!655217 () SeekEntryResult!12810)

(declare-fun lt!655218 () SeekEntryResult!12810)

(assert (=> b!1511384 (= res!1031496 (= lt!655217 lt!655218))))

(assert (=> b!1511384 (= lt!655218 (Intermediate!12810 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511384 (= lt!655217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48616 a!2804) j!70) mask!2512) (select (arr!48616 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511385 () Bool)

(declare-fun res!1031489 () Bool)

(assert (=> b!1511385 (=> (not res!1031489) (not e!843715))))

(assert (=> b!1511385 (= res!1031489 (and (= (size!49168 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49168 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49168 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511386 () Bool)

(declare-fun res!1031495 () Bool)

(assert (=> b!1511386 (=> (not res!1031495) (not e!843715))))

(assert (=> b!1511386 (= res!1031495 (validKeyInArray!0 (select (arr!48616 a!2804) i!961)))))

(declare-fun b!1511387 () Bool)

(declare-fun res!1031492 () Bool)

(assert (=> b!1511387 (=> (not res!1031492) (not e!843717))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12810)

(assert (=> b!1511387 (= res!1031492 (= (seekEntry!0 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) (Found!12810 j!70)))))

(declare-fun b!1511388 () Bool)

(declare-fun res!1031499 () Bool)

(assert (=> b!1511388 (=> (not res!1031499) (not e!843715))))

(assert (=> b!1511388 (= res!1031499 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49168 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49168 a!2804))))))

(declare-fun b!1511389 () Bool)

(declare-fun res!1031494 () Bool)

(assert (=> b!1511389 (=> (not res!1031494) (not e!843713))))

(assert (=> b!1511389 (= res!1031494 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) lt!655218))))

(declare-fun b!1511390 () Bool)

(declare-fun e!843716 () Bool)

(assert (=> b!1511390 (= e!843717 e!843716)))

(declare-fun res!1031493 () Bool)

(assert (=> b!1511390 (=> res!1031493 e!843716)))

(assert (=> b!1511390 (= res!1031493 (or (not (= (select (arr!48616 a!2804) j!70) (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48616 a!2804) index!487) (select (arr!48616 a!2804) j!70)) (not (= (select (arr!48616 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511391 () Bool)

(declare-fun res!1031497 () Bool)

(assert (=> b!1511391 (=> (not res!1031497) (not e!843715))))

(assert (=> b!1511391 (= res!1031497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511392 () Bool)

(declare-fun res!1031501 () Bool)

(assert (=> b!1511392 (=> (not res!1031501) (not e!843713))))

(assert (=> b!1511392 (= res!1031501 (= lt!655217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100757 (store (arr!48616 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49168 a!2804)) mask!2512)))))

(declare-fun res!1031498 () Bool)

(assert (=> start!128900 (=> (not res!1031498) (not e!843715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128900 (= res!1031498 (validMask!0 mask!2512))))

(assert (=> start!128900 e!843715))

(assert (=> start!128900 true))

(declare-fun array_inv!37849 (array!100756) Bool)

(assert (=> start!128900 (array_inv!37849 a!2804)))

(declare-fun b!1511381 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12810)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12810)

(assert (=> b!1511381 (= e!843716 (= (seekEntryOrOpen!0 (select (arr!48616 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48616 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!128900 res!1031498) b!1511385))

(assert (= (and b!1511385 res!1031489) b!1511386))

(assert (= (and b!1511386 res!1031495) b!1511382))

(assert (= (and b!1511382 res!1031500) b!1511391))

(assert (= (and b!1511391 res!1031497) b!1511380))

(assert (= (and b!1511380 res!1031490) b!1511388))

(assert (= (and b!1511388 res!1031499) b!1511384))

(assert (= (and b!1511384 res!1031496) b!1511389))

(assert (= (and b!1511389 res!1031494) b!1511392))

(assert (= (and b!1511392 res!1031501) b!1511383))

(assert (= (and b!1511383 res!1031491) b!1511387))

(assert (= (and b!1511387 res!1031492) b!1511390))

(assert (= (and b!1511390 (not res!1031493)) b!1511381))

(declare-fun m!1393529 () Bool)

(assert (=> b!1511391 m!1393529))

(declare-fun m!1393531 () Bool)

(assert (=> b!1511392 m!1393531))

(declare-fun m!1393533 () Bool)

(assert (=> b!1511392 m!1393533))

(assert (=> b!1511392 m!1393533))

(declare-fun m!1393535 () Bool)

(assert (=> b!1511392 m!1393535))

(assert (=> b!1511392 m!1393535))

(assert (=> b!1511392 m!1393533))

(declare-fun m!1393537 () Bool)

(assert (=> b!1511392 m!1393537))

(declare-fun m!1393539 () Bool)

(assert (=> b!1511386 m!1393539))

(assert (=> b!1511386 m!1393539))

(declare-fun m!1393541 () Bool)

(assert (=> b!1511386 m!1393541))

(declare-fun m!1393543 () Bool)

(assert (=> b!1511381 m!1393543))

(assert (=> b!1511381 m!1393543))

(declare-fun m!1393545 () Bool)

(assert (=> b!1511381 m!1393545))

(assert (=> b!1511381 m!1393543))

(declare-fun m!1393547 () Bool)

(assert (=> b!1511381 m!1393547))

(declare-fun m!1393549 () Bool)

(assert (=> start!128900 m!1393549))

(declare-fun m!1393551 () Bool)

(assert (=> start!128900 m!1393551))

(assert (=> b!1511384 m!1393543))

(assert (=> b!1511384 m!1393543))

(declare-fun m!1393553 () Bool)

(assert (=> b!1511384 m!1393553))

(assert (=> b!1511384 m!1393553))

(assert (=> b!1511384 m!1393543))

(declare-fun m!1393555 () Bool)

(assert (=> b!1511384 m!1393555))

(declare-fun m!1393557 () Bool)

(assert (=> b!1511380 m!1393557))

(assert (=> b!1511382 m!1393543))

(assert (=> b!1511382 m!1393543))

(declare-fun m!1393559 () Bool)

(assert (=> b!1511382 m!1393559))

(assert (=> b!1511387 m!1393543))

(assert (=> b!1511387 m!1393543))

(declare-fun m!1393561 () Bool)

(assert (=> b!1511387 m!1393561))

(assert (=> b!1511389 m!1393543))

(assert (=> b!1511389 m!1393543))

(declare-fun m!1393563 () Bool)

(assert (=> b!1511389 m!1393563))

(assert (=> b!1511390 m!1393543))

(assert (=> b!1511390 m!1393531))

(assert (=> b!1511390 m!1393533))

(declare-fun m!1393565 () Bool)

(assert (=> b!1511390 m!1393565))

(assert (=> b!1511383 m!1393543))

(declare-fun m!1393567 () Bool)

(assert (=> b!1511383 m!1393567))

(assert (=> b!1511383 m!1393531))

(assert (=> b!1511383 m!1393565))

(assert (=> b!1511383 m!1393533))

(declare-fun m!1393569 () Bool)

(assert (=> b!1511383 m!1393569))

(check-sat (not b!1511384) (not b!1511381) (not b!1511387) (not b!1511392) (not b!1511391) (not b!1511389) (not b!1511380) (not b!1511383) (not start!128900) (not b!1511382) (not b!1511386))
(check-sat)
