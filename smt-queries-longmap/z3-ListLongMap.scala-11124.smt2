; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129990 () Bool)

(assert start!129990)

(declare-fun b!1525413 () Bool)

(declare-fun res!1043644 () Bool)

(declare-fun e!850280 () Bool)

(assert (=> b!1525413 (=> (not res!1043644) (not e!850280))))

(declare-datatypes ((array!101401 0))(
  ( (array!101402 (arr!48928 (Array (_ BitVec 32) (_ BitVec 64))) (size!49480 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101401)

(declare-datatypes ((List!35489 0))(
  ( (Nil!35486) (Cons!35485 (h!36919 (_ BitVec 64)) (t!50175 List!35489)) )
))
(declare-fun arrayNoDuplicates!0 (array!101401 (_ BitVec 32) List!35489) Bool)

(assert (=> b!1525413 (= res!1043644 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35486))))

(declare-fun b!1525414 () Bool)

(declare-fun res!1043633 () Bool)

(assert (=> b!1525414 (=> (not res!1043633) (not e!850280))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525414 (= res!1043633 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49480 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49480 a!2804))))))

(declare-fun b!1525415 () Bool)

(declare-fun e!850281 () Bool)

(declare-fun e!850282 () Bool)

(assert (=> b!1525415 (= e!850281 e!850282)))

(declare-fun res!1043640 () Bool)

(assert (=> b!1525415 (=> (not res!1043640) (not e!850282))))

(declare-datatypes ((SeekEntryResult!13116 0))(
  ( (MissingZero!13116 (index!54859 (_ BitVec 32))) (Found!13116 (index!54860 (_ BitVec 32))) (Intermediate!13116 (undefined!13928 Bool) (index!54861 (_ BitVec 32)) (x!136565 (_ BitVec 32))) (Undefined!13116) (MissingVacant!13116 (index!54862 (_ BitVec 32))) )
))
(declare-fun lt!660537 () SeekEntryResult!13116)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!660535 () (_ BitVec 64))

(declare-fun lt!660534 () array!101401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101401 (_ BitVec 32)) SeekEntryResult!13116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525415 (= res!1043640 (= lt!660537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660535 mask!2512) lt!660535 lt!660534 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1525415 (= lt!660535 (select (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525415 (= lt!660534 (array!101402 (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49480 a!2804)))))

(declare-fun b!1525416 () Bool)

(declare-fun res!1043638 () Bool)

(assert (=> b!1525416 (=> (not res!1043638) (not e!850280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525416 (= res!1043638 (validKeyInArray!0 (select (arr!48928 a!2804) i!961)))))

(declare-fun b!1525417 () Bool)

(declare-fun res!1043636 () Bool)

(declare-fun e!850277 () Bool)

(assert (=> b!1525417 (=> (not res!1043636) (not e!850277))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101401 (_ BitVec 32)) SeekEntryResult!13116)

(assert (=> b!1525417 (= res!1043636 (= (seekEntry!0 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) (Found!13116 j!70)))))

(declare-fun b!1525418 () Bool)

(assert (=> b!1525418 (= e!850280 e!850281)))

(declare-fun res!1043643 () Bool)

(assert (=> b!1525418 (=> (not res!1043643) (not e!850281))))

(declare-fun lt!660536 () SeekEntryResult!13116)

(assert (=> b!1525418 (= res!1043643 (= lt!660537 lt!660536))))

(assert (=> b!1525418 (= lt!660536 (Intermediate!13116 false resIndex!21 resX!21))))

(assert (=> b!1525418 (= lt!660537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48928 a!2804) j!70) mask!2512) (select (arr!48928 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525419 () Bool)

(declare-fun res!1043635 () Bool)

(assert (=> b!1525419 (=> (not res!1043635) (not e!850281))))

(assert (=> b!1525419 (= res!1043635 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) lt!660536))))

(declare-fun e!850279 () Bool)

(declare-fun b!1525421 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101401 (_ BitVec 32)) SeekEntryResult!13116)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101401 (_ BitVec 32)) SeekEntryResult!13116)

(assert (=> b!1525421 (= e!850279 (= (seekEntryOrOpen!0 lt!660535 lt!660534 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660535 lt!660534 mask!2512)))))

(declare-fun res!1043637 () Bool)

(assert (=> start!129990 (=> (not res!1043637) (not e!850280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129990 (= res!1043637 (validMask!0 mask!2512))))

(assert (=> start!129990 e!850280))

(assert (=> start!129990 true))

(declare-fun array_inv!38161 (array!101401) Bool)

(assert (=> start!129990 (array_inv!38161 a!2804)))

(declare-fun b!1525420 () Bool)

(declare-fun e!850276 () Bool)

(assert (=> b!1525420 (= e!850276 e!850279)))

(declare-fun res!1043632 () Bool)

(assert (=> b!1525420 (=> (not res!1043632) (not e!850279))))

(assert (=> b!1525420 (= res!1043632 (= (seekEntryOrOpen!0 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48928 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525422 () Bool)

(assert (=> b!1525422 (= e!850277 e!850276)))

(declare-fun res!1043639 () Bool)

(assert (=> b!1525422 (=> res!1043639 e!850276)))

(assert (=> b!1525422 (= res!1043639 (or (not (= (select (arr!48928 a!2804) j!70) lt!660535)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48928 a!2804) index!487) (select (arr!48928 a!2804) j!70)) (not (= (select (arr!48928 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525423 () Bool)

(declare-fun res!1043642 () Bool)

(assert (=> b!1525423 (=> (not res!1043642) (not e!850280))))

(assert (=> b!1525423 (= res!1043642 (validKeyInArray!0 (select (arr!48928 a!2804) j!70)))))

(declare-fun b!1525424 () Bool)

(assert (=> b!1525424 (= e!850282 (not true))))

(assert (=> b!1525424 e!850277))

(declare-fun res!1043631 () Bool)

(assert (=> b!1525424 (=> (not res!1043631) (not e!850277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101401 (_ BitVec 32)) Bool)

(assert (=> b!1525424 (= res!1043631 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50855 0))(
  ( (Unit!50856) )
))
(declare-fun lt!660533 () Unit!50855)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50855)

(assert (=> b!1525424 (= lt!660533 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525425 () Bool)

(declare-fun res!1043634 () Bool)

(assert (=> b!1525425 (=> (not res!1043634) (not e!850280))))

(assert (=> b!1525425 (= res!1043634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525426 () Bool)

(declare-fun res!1043641 () Bool)

(assert (=> b!1525426 (=> (not res!1043641) (not e!850280))))

(assert (=> b!1525426 (= res!1043641 (and (= (size!49480 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49480 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49480 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129990 res!1043637) b!1525426))

(assert (= (and b!1525426 res!1043641) b!1525416))

(assert (= (and b!1525416 res!1043638) b!1525423))

(assert (= (and b!1525423 res!1043642) b!1525425))

(assert (= (and b!1525425 res!1043634) b!1525413))

(assert (= (and b!1525413 res!1043644) b!1525414))

(assert (= (and b!1525414 res!1043633) b!1525418))

(assert (= (and b!1525418 res!1043643) b!1525419))

(assert (= (and b!1525419 res!1043635) b!1525415))

(assert (= (and b!1525415 res!1043640) b!1525424))

(assert (= (and b!1525424 res!1043631) b!1525417))

(assert (= (and b!1525417 res!1043636) b!1525422))

(assert (= (and b!1525422 (not res!1043639)) b!1525420))

(assert (= (and b!1525420 res!1043632) b!1525421))

(declare-fun m!1407569 () Bool)

(assert (=> b!1525417 m!1407569))

(assert (=> b!1525417 m!1407569))

(declare-fun m!1407571 () Bool)

(assert (=> b!1525417 m!1407571))

(declare-fun m!1407573 () Bool)

(assert (=> b!1525421 m!1407573))

(declare-fun m!1407575 () Bool)

(assert (=> b!1525421 m!1407575))

(declare-fun m!1407577 () Bool)

(assert (=> start!129990 m!1407577))

(declare-fun m!1407579 () Bool)

(assert (=> start!129990 m!1407579))

(assert (=> b!1525418 m!1407569))

(assert (=> b!1525418 m!1407569))

(declare-fun m!1407581 () Bool)

(assert (=> b!1525418 m!1407581))

(assert (=> b!1525418 m!1407581))

(assert (=> b!1525418 m!1407569))

(declare-fun m!1407583 () Bool)

(assert (=> b!1525418 m!1407583))

(assert (=> b!1525423 m!1407569))

(assert (=> b!1525423 m!1407569))

(declare-fun m!1407585 () Bool)

(assert (=> b!1525423 m!1407585))

(assert (=> b!1525422 m!1407569))

(declare-fun m!1407587 () Bool)

(assert (=> b!1525422 m!1407587))

(declare-fun m!1407589 () Bool)

(assert (=> b!1525413 m!1407589))

(declare-fun m!1407591 () Bool)

(assert (=> b!1525425 m!1407591))

(declare-fun m!1407593 () Bool)

(assert (=> b!1525416 m!1407593))

(assert (=> b!1525416 m!1407593))

(declare-fun m!1407595 () Bool)

(assert (=> b!1525416 m!1407595))

(assert (=> b!1525420 m!1407569))

(assert (=> b!1525420 m!1407569))

(declare-fun m!1407597 () Bool)

(assert (=> b!1525420 m!1407597))

(assert (=> b!1525420 m!1407569))

(declare-fun m!1407599 () Bool)

(assert (=> b!1525420 m!1407599))

(declare-fun m!1407601 () Bool)

(assert (=> b!1525415 m!1407601))

(assert (=> b!1525415 m!1407601))

(declare-fun m!1407603 () Bool)

(assert (=> b!1525415 m!1407603))

(declare-fun m!1407605 () Bool)

(assert (=> b!1525415 m!1407605))

(declare-fun m!1407607 () Bool)

(assert (=> b!1525415 m!1407607))

(declare-fun m!1407609 () Bool)

(assert (=> b!1525424 m!1407609))

(declare-fun m!1407611 () Bool)

(assert (=> b!1525424 m!1407611))

(assert (=> b!1525419 m!1407569))

(assert (=> b!1525419 m!1407569))

(declare-fun m!1407613 () Bool)

(assert (=> b!1525419 m!1407613))

(check-sat (not b!1525425) (not b!1525413) (not b!1525420) (not b!1525421) (not start!129990) (not b!1525415) (not b!1525423) (not b!1525424) (not b!1525419) (not b!1525418) (not b!1525417) (not b!1525416))
(check-sat)
