; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130768 () Bool)

(assert start!130768)

(declare-fun b!1533637 () Bool)

(declare-fun res!1050723 () Bool)

(declare-fun e!854284 () Bool)

(assert (=> b!1533637 (=> (not res!1050723) (not e!854284))))

(declare-datatypes ((array!101866 0))(
  ( (array!101867 (arr!49149 (Array (_ BitVec 32) (_ BitVec 64))) (size!49699 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101866)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533637 (= res!1050723 (validKeyInArray!0 (select (arr!49149 a!2792) i!951)))))

(declare-fun b!1533638 () Bool)

(declare-fun res!1050729 () Bool)

(assert (=> b!1533638 (=> (not res!1050729) (not e!854284))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533638 (= res!1050729 (validKeyInArray!0 (select (arr!49149 a!2792) j!64)))))

(declare-fun b!1533639 () Bool)

(declare-fun res!1050725 () Bool)

(assert (=> b!1533639 (=> (not res!1050725) (not e!854284))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101866 (_ BitVec 32)) Bool)

(assert (=> b!1533639 (= res!1050725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533640 () Bool)

(declare-fun res!1050730 () Bool)

(assert (=> b!1533640 (=> (not res!1050730) (not e!854284))))

(assert (=> b!1533640 (= res!1050730 (and (= (size!49699 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49699 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49699 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533641 () Bool)

(declare-fun res!1050727 () Bool)

(assert (=> b!1533641 (=> (not res!1050727) (not e!854284))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533641 (= res!1050727 (and (= (select (arr!49149 a!2792) index!463) (select (arr!49149 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49149 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533642 () Bool)

(declare-fun res!1050728 () Bool)

(assert (=> b!1533642 (=> (not res!1050728) (not e!854284))))

(declare-datatypes ((List!35623 0))(
  ( (Nil!35620) (Cons!35619 (h!37064 (_ BitVec 64)) (t!50317 List!35623)) )
))
(declare-fun arrayNoDuplicates!0 (array!101866 (_ BitVec 32) List!35623) Bool)

(assert (=> b!1533642 (= res!1050728 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35620))))

(declare-fun b!1533636 () Bool)

(assert (=> b!1533636 (= e!854284 (not (validKeyInArray!0 (select (store (arr!49149 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))))

(declare-fun res!1050726 () Bool)

(assert (=> start!130768 (=> (not res!1050726) (not e!854284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130768 (= res!1050726 (validMask!0 mask!2480))))

(assert (=> start!130768 e!854284))

(assert (=> start!130768 true))

(declare-fun array_inv!38177 (array!101866) Bool)

(assert (=> start!130768 (array_inv!38177 a!2792)))

(declare-fun b!1533643 () Bool)

(declare-fun res!1050724 () Bool)

(assert (=> b!1533643 (=> (not res!1050724) (not e!854284))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533643 (= res!1050724 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49699 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49699 a!2792)) (= (select (arr!49149 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533644 () Bool)

(declare-fun res!1050722 () Bool)

(assert (=> b!1533644 (=> (not res!1050722) (not e!854284))))

(declare-datatypes ((SeekEntryResult!13281 0))(
  ( (MissingZero!13281 (index!55519 (_ BitVec 32))) (Found!13281 (index!55520 (_ BitVec 32))) (Intermediate!13281 (undefined!14093 Bool) (index!55521 (_ BitVec 32)) (x!137291 (_ BitVec 32))) (Undefined!13281) (MissingVacant!13281 (index!55522 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101866 (_ BitVec 32)) SeekEntryResult!13281)

(assert (=> b!1533644 (= res!1050722 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49149 a!2792) j!64) a!2792 mask!2480) (Found!13281 j!64)))))

(assert (= (and start!130768 res!1050726) b!1533640))

(assert (= (and b!1533640 res!1050730) b!1533637))

(assert (= (and b!1533637 res!1050723) b!1533638))

(assert (= (and b!1533638 res!1050729) b!1533639))

(assert (= (and b!1533639 res!1050725) b!1533642))

(assert (= (and b!1533642 res!1050728) b!1533643))

(assert (= (and b!1533643 res!1050724) b!1533644))

(assert (= (and b!1533644 res!1050722) b!1533641))

(assert (= (and b!1533641 res!1050727) b!1533636))

(declare-fun m!1416327 () Bool)

(assert (=> b!1533644 m!1416327))

(assert (=> b!1533644 m!1416327))

(declare-fun m!1416329 () Bool)

(assert (=> b!1533644 m!1416329))

(declare-fun m!1416331 () Bool)

(assert (=> b!1533636 m!1416331))

(declare-fun m!1416333 () Bool)

(assert (=> b!1533636 m!1416333))

(assert (=> b!1533636 m!1416333))

(declare-fun m!1416335 () Bool)

(assert (=> b!1533636 m!1416335))

(declare-fun m!1416337 () Bool)

(assert (=> b!1533641 m!1416337))

(assert (=> b!1533641 m!1416327))

(assert (=> b!1533641 m!1416331))

(declare-fun m!1416339 () Bool)

(assert (=> b!1533641 m!1416339))

(declare-fun m!1416341 () Bool)

(assert (=> b!1533642 m!1416341))

(assert (=> b!1533638 m!1416327))

(assert (=> b!1533638 m!1416327))

(declare-fun m!1416343 () Bool)

(assert (=> b!1533638 m!1416343))

(declare-fun m!1416345 () Bool)

(assert (=> b!1533637 m!1416345))

(assert (=> b!1533637 m!1416345))

(declare-fun m!1416347 () Bool)

(assert (=> b!1533637 m!1416347))

(declare-fun m!1416349 () Bool)

(assert (=> b!1533643 m!1416349))

(declare-fun m!1416351 () Bool)

(assert (=> b!1533639 m!1416351))

(declare-fun m!1416353 () Bool)

(assert (=> start!130768 m!1416353))

(declare-fun m!1416355 () Bool)

(assert (=> start!130768 m!1416355))

(check-sat (not b!1533636) (not start!130768) (not b!1533637) (not b!1533638) (not b!1533642) (not b!1533639) (not b!1533644))
(check-sat)
