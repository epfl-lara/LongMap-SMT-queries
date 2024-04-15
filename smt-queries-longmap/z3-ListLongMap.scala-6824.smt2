; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85884 () Bool)

(assert start!85884)

(declare-fun b!995322 () Bool)

(declare-fun res!665741 () Bool)

(declare-fun e!561651 () Bool)

(assert (=> b!995322 (=> (not res!665741) (not e!561651))))

(declare-datatypes ((array!62920 0))(
  ( (array!62921 (arr!30294 (Array (_ BitVec 32) (_ BitVec 64))) (size!30798 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62920)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995322 (= res!665741 (validKeyInArray!0 (select (arr!30294 a!3219) j!170)))))

(declare-fun b!995323 () Bool)

(declare-fun res!665739 () Bool)

(declare-fun e!561652 () Bool)

(assert (=> b!995323 (=> (not res!665739) (not e!561652))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62920 (_ BitVec 32)) Bool)

(assert (=> b!995323 (= res!665739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995324 () Bool)

(declare-fun res!665744 () Bool)

(assert (=> b!995324 (=> (not res!665744) (not e!561652))))

(declare-datatypes ((List!21036 0))(
  ( (Nil!21033) (Cons!21032 (h!22194 (_ BitVec 64)) (t!30028 List!21036)) )
))
(declare-fun arrayNoDuplicates!0 (array!62920 (_ BitVec 32) List!21036) Bool)

(assert (=> b!995324 (= res!665744 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21033))))

(declare-fun b!995325 () Bool)

(declare-fun res!665737 () Bool)

(assert (=> b!995325 (=> (not res!665737) (not e!561651))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995325 (= res!665737 (and (= (size!30798 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30798 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30798 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!665743 () Bool)

(assert (=> start!85884 (=> (not res!665743) (not e!561651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85884 (= res!665743 (validMask!0 mask!3464))))

(assert (=> start!85884 e!561651))

(declare-fun array_inv!23437 (array!62920) Bool)

(assert (=> start!85884 (array_inv!23437 a!3219)))

(assert (=> start!85884 true))

(declare-fun b!995326 () Bool)

(declare-fun res!665742 () Bool)

(assert (=> b!995326 (=> (not res!665742) (not e!561651))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995326 (= res!665742 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995327 () Bool)

(assert (=> b!995327 (= e!561651 e!561652)))

(declare-fun res!665738 () Bool)

(assert (=> b!995327 (=> (not res!665738) (not e!561652))))

(declare-datatypes ((SeekEntryResult!9251 0))(
  ( (MissingZero!9251 (index!39375 (_ BitVec 32))) (Found!9251 (index!39376 (_ BitVec 32))) (Intermediate!9251 (undefined!10063 Bool) (index!39377 (_ BitVec 32)) (x!86831 (_ BitVec 32))) (Undefined!9251) (MissingVacant!9251 (index!39378 (_ BitVec 32))) )
))
(declare-fun lt!440758 () SeekEntryResult!9251)

(assert (=> b!995327 (= res!665738 (or (= lt!440758 (MissingVacant!9251 i!1194)) (= lt!440758 (MissingZero!9251 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62920 (_ BitVec 32)) SeekEntryResult!9251)

(assert (=> b!995327 (= lt!440758 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995328 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!995328 (= e!561652 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30798 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30798 a!3219)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!995329 () Bool)

(declare-fun res!665740 () Bool)

(assert (=> b!995329 (=> (not res!665740) (not e!561651))))

(assert (=> b!995329 (= res!665740 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85884 res!665743) b!995325))

(assert (= (and b!995325 res!665737) b!995322))

(assert (= (and b!995322 res!665741) b!995329))

(assert (= (and b!995329 res!665740) b!995326))

(assert (= (and b!995326 res!665742) b!995327))

(assert (= (and b!995327 res!665738) b!995323))

(assert (= (and b!995323 res!665739) b!995324))

(assert (= (and b!995324 res!665744) b!995328))

(declare-fun m!922195 () Bool)

(assert (=> b!995326 m!922195))

(declare-fun m!922197 () Bool)

(assert (=> b!995324 m!922197))

(declare-fun m!922199 () Bool)

(assert (=> b!995327 m!922199))

(declare-fun m!922201 () Bool)

(assert (=> b!995323 m!922201))

(declare-fun m!922203 () Bool)

(assert (=> start!85884 m!922203))

(declare-fun m!922205 () Bool)

(assert (=> start!85884 m!922205))

(declare-fun m!922207 () Bool)

(assert (=> b!995322 m!922207))

(assert (=> b!995322 m!922207))

(declare-fun m!922209 () Bool)

(assert (=> b!995322 m!922209))

(declare-fun m!922211 () Bool)

(assert (=> b!995329 m!922211))

(check-sat (not b!995326) (not start!85884) (not b!995322) (not b!995329) (not b!995327) (not b!995323) (not b!995324))
(check-sat)
