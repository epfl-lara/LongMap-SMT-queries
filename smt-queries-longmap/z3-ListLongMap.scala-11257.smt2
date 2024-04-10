; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131296 () Bool)

(assert start!131296)

(declare-fun b!1539630 () Bool)

(declare-fun res!1056433 () Bool)

(declare-fun e!856380 () Bool)

(assert (=> b!1539630 (=> (not res!1056433) (not e!856380))))

(declare-datatypes ((array!102283 0))(
  ( (array!102284 (arr!49353 (Array (_ BitVec 32) (_ BitVec 64))) (size!49903 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102283)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539630 (= res!1056433 (validKeyInArray!0 (select (arr!49353 a!2792) i!951)))))

(declare-fun b!1539631 () Bool)

(declare-fun res!1056429 () Bool)

(assert (=> b!1539631 (=> (not res!1056429) (not e!856380))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539631 (= res!1056429 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49903 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49903 a!2792)) (= (select (arr!49353 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539632 () Bool)

(declare-fun res!1056432 () Bool)

(assert (=> b!1539632 (=> (not res!1056432) (not e!856380))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1539632 (= res!1056432 (not (= (select (arr!49353 a!2792) index!463) (select (arr!49353 a!2792) j!64))))))

(declare-fun b!1539633 () Bool)

(assert (=> b!1539633 (= e!856380 false)))

(declare-fun lt!665110 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539633 (= lt!665110 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539634 () Bool)

(declare-fun res!1056436 () Bool)

(assert (=> b!1539634 (=> (not res!1056436) (not e!856380))))

(assert (=> b!1539634 (= res!1056436 (and (= (size!49903 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49903 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49903 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539636 () Bool)

(declare-fun res!1056428 () Bool)

(assert (=> b!1539636 (=> (not res!1056428) (not e!856380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102283 (_ BitVec 32)) Bool)

(assert (=> b!1539636 (= res!1056428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539637 () Bool)

(declare-fun res!1056430 () Bool)

(assert (=> b!1539637 (=> (not res!1056430) (not e!856380))))

(assert (=> b!1539637 (= res!1056430 (validKeyInArray!0 (select (arr!49353 a!2792) j!64)))))

(declare-fun b!1539638 () Bool)

(declare-fun res!1056435 () Bool)

(assert (=> b!1539638 (=> (not res!1056435) (not e!856380))))

(declare-datatypes ((List!35827 0))(
  ( (Nil!35824) (Cons!35823 (h!37268 (_ BitVec 64)) (t!50521 List!35827)) )
))
(declare-fun arrayNoDuplicates!0 (array!102283 (_ BitVec 32) List!35827) Bool)

(assert (=> b!1539638 (= res!1056435 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35824))))

(declare-fun b!1539635 () Bool)

(declare-fun res!1056434 () Bool)

(assert (=> b!1539635 (=> (not res!1056434) (not e!856380))))

(declare-datatypes ((SeekEntryResult!13479 0))(
  ( (MissingZero!13479 (index!56311 (_ BitVec 32))) (Found!13479 (index!56312 (_ BitVec 32))) (Intermediate!13479 (undefined!14291 Bool) (index!56313 (_ BitVec 32)) (x!138048 (_ BitVec 32))) (Undefined!13479) (MissingVacant!13479 (index!56314 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102283 (_ BitVec 32)) SeekEntryResult!13479)

(assert (=> b!1539635 (= res!1056434 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49353 a!2792) j!64) a!2792 mask!2480) (Found!13479 j!64)))))

(declare-fun res!1056431 () Bool)

(assert (=> start!131296 (=> (not res!1056431) (not e!856380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131296 (= res!1056431 (validMask!0 mask!2480))))

(assert (=> start!131296 e!856380))

(assert (=> start!131296 true))

(declare-fun array_inv!38381 (array!102283) Bool)

(assert (=> start!131296 (array_inv!38381 a!2792)))

(assert (= (and start!131296 res!1056431) b!1539634))

(assert (= (and b!1539634 res!1056436) b!1539630))

(assert (= (and b!1539630 res!1056433) b!1539637))

(assert (= (and b!1539637 res!1056430) b!1539636))

(assert (= (and b!1539636 res!1056428) b!1539638))

(assert (= (and b!1539638 res!1056435) b!1539631))

(assert (= (and b!1539631 res!1056429) b!1539635))

(assert (= (and b!1539635 res!1056434) b!1539632))

(assert (= (and b!1539632 res!1056432) b!1539633))

(declare-fun m!1421835 () Bool)

(assert (=> b!1539635 m!1421835))

(assert (=> b!1539635 m!1421835))

(declare-fun m!1421837 () Bool)

(assert (=> b!1539635 m!1421837))

(declare-fun m!1421839 () Bool)

(assert (=> b!1539631 m!1421839))

(declare-fun m!1421841 () Bool)

(assert (=> b!1539632 m!1421841))

(assert (=> b!1539632 m!1421835))

(declare-fun m!1421843 () Bool)

(assert (=> start!131296 m!1421843))

(declare-fun m!1421845 () Bool)

(assert (=> start!131296 m!1421845))

(assert (=> b!1539637 m!1421835))

(assert (=> b!1539637 m!1421835))

(declare-fun m!1421847 () Bool)

(assert (=> b!1539637 m!1421847))

(declare-fun m!1421849 () Bool)

(assert (=> b!1539638 m!1421849))

(declare-fun m!1421851 () Bool)

(assert (=> b!1539636 m!1421851))

(declare-fun m!1421853 () Bool)

(assert (=> b!1539630 m!1421853))

(assert (=> b!1539630 m!1421853))

(declare-fun m!1421855 () Bool)

(assert (=> b!1539630 m!1421855))

(declare-fun m!1421857 () Bool)

(assert (=> b!1539633 m!1421857))

(check-sat (not b!1539630) (not b!1539635) (not b!1539637) (not start!131296) (not b!1539636) (not b!1539633) (not b!1539638))
