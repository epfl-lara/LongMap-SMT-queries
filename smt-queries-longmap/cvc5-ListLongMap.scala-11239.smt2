; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131488 () Bool)

(assert start!131488)

(declare-fun b!1540277 () Bool)

(declare-fun res!1055791 () Bool)

(declare-fun e!857283 () Bool)

(assert (=> b!1540277 (=> (not res!1055791) (not e!857283))))

(declare-datatypes ((array!102290 0))(
  ( (array!102291 (arr!49353 (Array (_ BitVec 32) (_ BitVec 64))) (size!49904 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102290)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540277 (= res!1055791 (validKeyInArray!0 (select (arr!49353 a!2792) j!64)))))

(declare-fun b!1540278 () Bool)

(declare-fun res!1055792 () Bool)

(assert (=> b!1540278 (=> (not res!1055792) (not e!857283))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102290 (_ BitVec 32)) Bool)

(assert (=> b!1540278 (= res!1055792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540279 () Bool)

(declare-fun res!1055787 () Bool)

(assert (=> b!1540279 (=> (not res!1055787) (not e!857283))))

(declare-datatypes ((List!35814 0))(
  ( (Nil!35811) (Cons!35810 (h!37273 (_ BitVec 64)) (t!50500 List!35814)) )
))
(declare-fun arrayNoDuplicates!0 (array!102290 (_ BitVec 32) List!35814) Bool)

(assert (=> b!1540279 (= res!1055787 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35811))))

(declare-fun b!1540280 () Bool)

(declare-fun res!1055793 () Bool)

(assert (=> b!1540280 (=> (not res!1055793) (not e!857283))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540280 (= res!1055793 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49904 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49904 a!2792)) (= (select (arr!49353 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540281 () Bool)

(declare-fun res!1055790 () Bool)

(assert (=> b!1540281 (=> (not res!1055790) (not e!857283))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540281 (= res!1055790 (validKeyInArray!0 (select (arr!49353 a!2792) i!951)))))

(declare-fun res!1055788 () Bool)

(assert (=> start!131488 (=> (not res!1055788) (not e!857283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131488 (= res!1055788 (validMask!0 mask!2480))))

(assert (=> start!131488 e!857283))

(assert (=> start!131488 true))

(declare-fun array_inv!38634 (array!102290) Bool)

(assert (=> start!131488 (array_inv!38634 a!2792)))

(declare-fun b!1540282 () Bool)

(assert (=> b!1540282 (= e!857283 false)))

(declare-datatypes ((SeekEntryResult!13374 0))(
  ( (MissingZero!13374 (index!55891 (_ BitVec 32))) (Found!13374 (index!55892 (_ BitVec 32))) (Intermediate!13374 (undefined!14186 Bool) (index!55893 (_ BitVec 32)) (x!137834 (_ BitVec 32))) (Undefined!13374) (MissingVacant!13374 (index!55894 (_ BitVec 32))) )
))
(declare-fun lt!665703 () SeekEntryResult!13374)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102290 (_ BitVec 32)) SeekEntryResult!13374)

(assert (=> b!1540282 (= lt!665703 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49353 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540283 () Bool)

(declare-fun res!1055789 () Bool)

(assert (=> b!1540283 (=> (not res!1055789) (not e!857283))))

(assert (=> b!1540283 (= res!1055789 (and (= (size!49904 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49904 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49904 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131488 res!1055788) b!1540283))

(assert (= (and b!1540283 res!1055789) b!1540281))

(assert (= (and b!1540281 res!1055790) b!1540277))

(assert (= (and b!1540277 res!1055791) b!1540278))

(assert (= (and b!1540278 res!1055792) b!1540279))

(assert (= (and b!1540279 res!1055787) b!1540280))

(assert (= (and b!1540280 res!1055793) b!1540282))

(declare-fun m!1422587 () Bool)

(assert (=> b!1540282 m!1422587))

(assert (=> b!1540282 m!1422587))

(declare-fun m!1422589 () Bool)

(assert (=> b!1540282 m!1422589))

(declare-fun m!1422591 () Bool)

(assert (=> start!131488 m!1422591))

(declare-fun m!1422593 () Bool)

(assert (=> start!131488 m!1422593))

(declare-fun m!1422595 () Bool)

(assert (=> b!1540281 m!1422595))

(assert (=> b!1540281 m!1422595))

(declare-fun m!1422597 () Bool)

(assert (=> b!1540281 m!1422597))

(declare-fun m!1422599 () Bool)

(assert (=> b!1540279 m!1422599))

(declare-fun m!1422601 () Bool)

(assert (=> b!1540278 m!1422601))

(assert (=> b!1540277 m!1422587))

(assert (=> b!1540277 m!1422587))

(declare-fun m!1422603 () Bool)

(assert (=> b!1540277 m!1422603))

(declare-fun m!1422605 () Bool)

(assert (=> b!1540280 m!1422605))

(push 1)

(assert (not b!1540279))

(assert (not b!1540281))

(assert (not b!1540282))

(assert (not start!131488))

(assert (not b!1540277))

(assert (not b!1540278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

