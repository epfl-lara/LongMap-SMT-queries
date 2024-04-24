; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131596 () Bool)

(assert start!131596)

(declare-fun b!1541337 () Bool)

(declare-fun e!857607 () Bool)

(assert (=> b!1541337 (= e!857607 false)))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665862 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541337 (= lt!665862 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541338 () Bool)

(declare-fun res!1056746 () Bool)

(assert (=> b!1541338 (=> (not res!1056746) (not e!857607))))

(declare-datatypes ((array!102365 0))(
  ( (array!102366 (arr!49389 (Array (_ BitVec 32) (_ BitVec 64))) (size!49940 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102365)

(declare-datatypes ((List!35850 0))(
  ( (Nil!35847) (Cons!35846 (h!37309 (_ BitVec 64)) (t!50536 List!35850)) )
))
(declare-fun arrayNoDuplicates!0 (array!102365 (_ BitVec 32) List!35850) Bool)

(assert (=> b!1541338 (= res!1056746 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35847))))

(declare-fun b!1541339 () Bool)

(declare-fun res!1056741 () Bool)

(assert (=> b!1541339 (=> (not res!1056741) (not e!857607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102365 (_ BitVec 32)) Bool)

(assert (=> b!1541339 (= res!1056741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541341 () Bool)

(declare-fun res!1056742 () Bool)

(assert (=> b!1541341 (=> (not res!1056742) (not e!857607))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13410 0))(
  ( (MissingZero!13410 (index!56035 (_ BitVec 32))) (Found!13410 (index!56036 (_ BitVec 32))) (Intermediate!13410 (undefined!14222 Bool) (index!56037 (_ BitVec 32)) (x!137969 (_ BitVec 32))) (Undefined!13410) (MissingVacant!13410 (index!56038 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102365 (_ BitVec 32)) SeekEntryResult!13410)

(assert (=> b!1541341 (= res!1056742 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49389 a!2792) j!64) a!2792 mask!2480) (Found!13410 j!64)))))

(declare-fun b!1541342 () Bool)

(declare-fun res!1056745 () Bool)

(assert (=> b!1541342 (=> (not res!1056745) (not e!857607))))

(assert (=> b!1541342 (= res!1056745 (not (= (select (arr!49389 a!2792) index!463) (select (arr!49389 a!2792) j!64))))))

(declare-fun b!1541343 () Bool)

(declare-fun res!1056739 () Bool)

(assert (=> b!1541343 (=> (not res!1056739) (not e!857607))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541343 (= res!1056739 (validKeyInArray!0 (select (arr!49389 a!2792) i!951)))))

(declare-fun b!1541344 () Bool)

(declare-fun res!1056740 () Bool)

(assert (=> b!1541344 (=> (not res!1056740) (not e!857607))))

(assert (=> b!1541344 (= res!1056740 (validKeyInArray!0 (select (arr!49389 a!2792) j!64)))))

(declare-fun b!1541345 () Bool)

(declare-fun res!1056744 () Bool)

(assert (=> b!1541345 (=> (not res!1056744) (not e!857607))))

(assert (=> b!1541345 (= res!1056744 (and (= (size!49940 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49940 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49940 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541340 () Bool)

(declare-fun res!1056743 () Bool)

(assert (=> b!1541340 (=> (not res!1056743) (not e!857607))))

(assert (=> b!1541340 (= res!1056743 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49940 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49940 a!2792)) (= (select (arr!49389 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056747 () Bool)

(assert (=> start!131596 (=> (not res!1056747) (not e!857607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131596 (= res!1056747 (validMask!0 mask!2480))))

(assert (=> start!131596 e!857607))

(assert (=> start!131596 true))

(declare-fun array_inv!38670 (array!102365) Bool)

(assert (=> start!131596 (array_inv!38670 a!2792)))

(assert (= (and start!131596 res!1056747) b!1541345))

(assert (= (and b!1541345 res!1056744) b!1541343))

(assert (= (and b!1541343 res!1056739) b!1541344))

(assert (= (and b!1541344 res!1056740) b!1541339))

(assert (= (and b!1541339 res!1056741) b!1541338))

(assert (= (and b!1541338 res!1056746) b!1541340))

(assert (= (and b!1541340 res!1056743) b!1541341))

(assert (= (and b!1541341 res!1056742) b!1541342))

(assert (= (and b!1541342 res!1056745) b!1541337))

(declare-fun m!1423519 () Bool)

(assert (=> start!131596 m!1423519))

(declare-fun m!1423521 () Bool)

(assert (=> start!131596 m!1423521))

(declare-fun m!1423523 () Bool)

(assert (=> b!1541344 m!1423523))

(assert (=> b!1541344 m!1423523))

(declare-fun m!1423525 () Bool)

(assert (=> b!1541344 m!1423525))

(declare-fun m!1423527 () Bool)

(assert (=> b!1541337 m!1423527))

(assert (=> b!1541341 m!1423523))

(assert (=> b!1541341 m!1423523))

(declare-fun m!1423529 () Bool)

(assert (=> b!1541341 m!1423529))

(declare-fun m!1423531 () Bool)

(assert (=> b!1541340 m!1423531))

(declare-fun m!1423533 () Bool)

(assert (=> b!1541342 m!1423533))

(assert (=> b!1541342 m!1423523))

(declare-fun m!1423535 () Bool)

(assert (=> b!1541343 m!1423535))

(assert (=> b!1541343 m!1423535))

(declare-fun m!1423537 () Bool)

(assert (=> b!1541343 m!1423537))

(declare-fun m!1423539 () Bool)

(assert (=> b!1541338 m!1423539))

(declare-fun m!1423541 () Bool)

(assert (=> b!1541339 m!1423541))

(push 1)

(assert (not b!1541343))

(assert (not start!131596))

(assert (not b!1541341))

(assert (not b!1541339))

(assert (not b!1541338))

(assert (not b!1541337))

(assert (not b!1541344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

