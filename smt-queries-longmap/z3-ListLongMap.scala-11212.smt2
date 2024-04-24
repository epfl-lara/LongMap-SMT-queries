; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131322 () Bool)

(assert start!131322)

(declare-fun b!1537829 () Bool)

(declare-fun res!1053340 () Bool)

(declare-fun e!856293 () Bool)

(assert (=> b!1537829 (=> (not res!1053340) (not e!856293))))

(declare-datatypes ((array!102124 0))(
  ( (array!102125 (arr!49270 (Array (_ BitVec 32) (_ BitVec 64))) (size!49821 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102124)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537829 (= res!1053340 (and (= (size!49821 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49821 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49821 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537830 () Bool)

(declare-fun e!856294 () Bool)

(assert (=> b!1537830 (= e!856293 e!856294)))

(declare-fun res!1053347 () Bool)

(assert (=> b!1537830 (=> (not res!1053347) (not e!856294))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664962 () (_ BitVec 32))

(assert (=> b!1537830 (= res!1053347 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664962 #b00000000000000000000000000000000) (bvslt lt!664962 (size!49821 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537830 (= lt!664962 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537831 () Bool)

(declare-fun res!1053348 () Bool)

(assert (=> b!1537831 (=> (not res!1053348) (not e!856293))))

(declare-datatypes ((List!35731 0))(
  ( (Nil!35728) (Cons!35727 (h!37190 (_ BitVec 64)) (t!50417 List!35731)) )
))
(declare-fun arrayNoDuplicates!0 (array!102124 (_ BitVec 32) List!35731) Bool)

(assert (=> b!1537831 (= res!1053348 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35728))))

(declare-fun b!1537832 () Bool)

(assert (=> b!1537832 (= e!856294 false)))

(declare-datatypes ((SeekEntryResult!13297 0))(
  ( (MissingZero!13297 (index!55583 (_ BitVec 32))) (Found!13297 (index!55584 (_ BitVec 32))) (Intermediate!13297 (undefined!14109 Bool) (index!55585 (_ BitVec 32)) (x!137541 (_ BitVec 32))) (Undefined!13297) (MissingVacant!13297 (index!55586 (_ BitVec 32))) )
))
(declare-fun lt!664961 () SeekEntryResult!13297)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102124 (_ BitVec 32)) SeekEntryResult!13297)

(assert (=> b!1537832 (= lt!664961 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664962 vacantIndex!5 (select (arr!49270 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537834 () Bool)

(declare-fun res!1053344 () Bool)

(assert (=> b!1537834 (=> (not res!1053344) (not e!856293))))

(assert (=> b!1537834 (= res!1053344 (not (= (select (arr!49270 a!2792) index!463) (select (arr!49270 a!2792) j!64))))))

(declare-fun b!1537835 () Bool)

(declare-fun res!1053339 () Bool)

(assert (=> b!1537835 (=> (not res!1053339) (not e!856293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102124 (_ BitVec 32)) Bool)

(assert (=> b!1537835 (= res!1053339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537836 () Bool)

(declare-fun res!1053341 () Bool)

(assert (=> b!1537836 (=> (not res!1053341) (not e!856293))))

(assert (=> b!1537836 (= res!1053341 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49821 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49821 a!2792)) (= (select (arr!49270 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537837 () Bool)

(declare-fun res!1053342 () Bool)

(assert (=> b!1537837 (=> (not res!1053342) (not e!856293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537837 (= res!1053342 (validKeyInArray!0 (select (arr!49270 a!2792) j!64)))))

(declare-fun b!1537838 () Bool)

(declare-fun res!1053345 () Bool)

(assert (=> b!1537838 (=> (not res!1053345) (not e!856293))))

(assert (=> b!1537838 (= res!1053345 (validKeyInArray!0 (select (arr!49270 a!2792) i!951)))))

(declare-fun b!1537833 () Bool)

(declare-fun res!1053343 () Bool)

(assert (=> b!1537833 (=> (not res!1053343) (not e!856293))))

(assert (=> b!1537833 (= res!1053343 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49270 a!2792) j!64) a!2792 mask!2480) (Found!13297 j!64)))))

(declare-fun res!1053346 () Bool)

(assert (=> start!131322 (=> (not res!1053346) (not e!856293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131322 (= res!1053346 (validMask!0 mask!2480))))

(assert (=> start!131322 e!856293))

(assert (=> start!131322 true))

(declare-fun array_inv!38551 (array!102124) Bool)

(assert (=> start!131322 (array_inv!38551 a!2792)))

(assert (= (and start!131322 res!1053346) b!1537829))

(assert (= (and b!1537829 res!1053340) b!1537838))

(assert (= (and b!1537838 res!1053345) b!1537837))

(assert (= (and b!1537837 res!1053342) b!1537835))

(assert (= (and b!1537835 res!1053339) b!1537831))

(assert (= (and b!1537831 res!1053348) b!1537836))

(assert (= (and b!1537836 res!1053341) b!1537833))

(assert (= (and b!1537833 res!1053343) b!1537834))

(assert (= (and b!1537834 res!1053344) b!1537830))

(assert (= (and b!1537830 res!1053347) b!1537832))

(declare-fun m!1420153 () Bool)

(assert (=> b!1537832 m!1420153))

(assert (=> b!1537832 m!1420153))

(declare-fun m!1420155 () Bool)

(assert (=> b!1537832 m!1420155))

(declare-fun m!1420157 () Bool)

(assert (=> b!1537830 m!1420157))

(declare-fun m!1420159 () Bool)

(assert (=> b!1537831 m!1420159))

(declare-fun m!1420161 () Bool)

(assert (=> b!1537836 m!1420161))

(declare-fun m!1420163 () Bool)

(assert (=> b!1537834 m!1420163))

(assert (=> b!1537834 m!1420153))

(assert (=> b!1537833 m!1420153))

(assert (=> b!1537833 m!1420153))

(declare-fun m!1420165 () Bool)

(assert (=> b!1537833 m!1420165))

(assert (=> b!1537837 m!1420153))

(assert (=> b!1537837 m!1420153))

(declare-fun m!1420167 () Bool)

(assert (=> b!1537837 m!1420167))

(declare-fun m!1420169 () Bool)

(assert (=> b!1537835 m!1420169))

(declare-fun m!1420171 () Bool)

(assert (=> start!131322 m!1420171))

(declare-fun m!1420173 () Bool)

(assert (=> start!131322 m!1420173))

(declare-fun m!1420175 () Bool)

(assert (=> b!1537838 m!1420175))

(assert (=> b!1537838 m!1420175))

(declare-fun m!1420177 () Bool)

(assert (=> b!1537838 m!1420177))

(check-sat (not b!1537830) (not start!131322) (not b!1537835) (not b!1537833) (not b!1537831) (not b!1537832) (not b!1537838) (not b!1537837))
(check-sat)
