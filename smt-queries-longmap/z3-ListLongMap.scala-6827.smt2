; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85944 () Bool)

(assert start!85944)

(declare-fun b!995703 () Bool)

(declare-fun res!666030 () Bool)

(declare-fun e!561842 () Bool)

(assert (=> b!995703 (=> (not res!666030) (not e!561842))))

(declare-datatypes ((array!62941 0))(
  ( (array!62942 (arr!30303 (Array (_ BitVec 32) (_ BitVec 64))) (size!30807 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62941)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995703 (= res!666030 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995704 () Bool)

(declare-fun res!666029 () Bool)

(declare-fun e!561841 () Bool)

(assert (=> b!995704 (=> (not res!666029) (not e!561841))))

(declare-datatypes ((List!21045 0))(
  ( (Nil!21042) (Cons!21041 (h!22203 (_ BitVec 64)) (t!30037 List!21045)) )
))
(declare-fun arrayNoDuplicates!0 (array!62941 (_ BitVec 32) List!21045) Bool)

(assert (=> b!995704 (= res!666029 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21042))))

(declare-fun b!995705 () Bool)

(declare-fun res!666027 () Bool)

(assert (=> b!995705 (=> (not res!666027) (not e!561841))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62941 (_ BitVec 32)) Bool)

(assert (=> b!995705 (= res!666027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995706 () Bool)

(assert (=> b!995706 (= e!561842 e!561841)))

(declare-fun res!666032 () Bool)

(assert (=> b!995706 (=> (not res!666032) (not e!561841))))

(declare-datatypes ((SeekEntryResult!9260 0))(
  ( (MissingZero!9260 (index!39411 (_ BitVec 32))) (Found!9260 (index!39412 (_ BitVec 32))) (Intermediate!9260 (undefined!10072 Bool) (index!39413 (_ BitVec 32)) (x!86864 (_ BitVec 32))) (Undefined!9260) (MissingVacant!9260 (index!39414 (_ BitVec 32))) )
))
(declare-fun lt!440850 () SeekEntryResult!9260)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995706 (= res!666032 (or (= lt!440850 (MissingVacant!9260 i!1194)) (= lt!440850 (MissingZero!9260 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62941 (_ BitVec 32)) SeekEntryResult!9260)

(assert (=> b!995706 (= lt!440850 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995707 () Bool)

(declare-fun res!666033 () Bool)

(assert (=> b!995707 (=> (not res!666033) (not e!561842))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995707 (= res!666033 (and (= (size!30807 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30807 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30807 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995708 () Bool)

(declare-fun res!666031 () Bool)

(assert (=> b!995708 (=> (not res!666031) (not e!561842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995708 (= res!666031 (validKeyInArray!0 (select (arr!30303 a!3219) j!170)))))

(declare-fun b!995702 () Bool)

(declare-fun res!666035 () Bool)

(assert (=> b!995702 (=> (not res!666035) (not e!561842))))

(assert (=> b!995702 (= res!666035 (validKeyInArray!0 k0!2224))))

(declare-fun res!666034 () Bool)

(assert (=> start!85944 (=> (not res!666034) (not e!561842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85944 (= res!666034 (validMask!0 mask!3464))))

(assert (=> start!85944 e!561842))

(declare-fun array_inv!23446 (array!62941) Bool)

(assert (=> start!85944 (array_inv!23446 a!3219)))

(assert (=> start!85944 true))

(declare-fun b!995709 () Bool)

(assert (=> b!995709 (= e!561841 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!440851 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995709 (= lt!440851 (toIndex!0 (select (arr!30303 a!3219) j!170) mask!3464))))

(declare-fun b!995710 () Bool)

(declare-fun res!666028 () Bool)

(assert (=> b!995710 (=> (not res!666028) (not e!561841))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995710 (= res!666028 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30807 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30807 a!3219))))))

(assert (= (and start!85944 res!666034) b!995707))

(assert (= (and b!995707 res!666033) b!995708))

(assert (= (and b!995708 res!666031) b!995702))

(assert (= (and b!995702 res!666035) b!995703))

(assert (= (and b!995703 res!666030) b!995706))

(assert (= (and b!995706 res!666032) b!995705))

(assert (= (and b!995705 res!666027) b!995704))

(assert (= (and b!995704 res!666029) b!995710))

(assert (= (and b!995710 res!666028) b!995709))

(declare-fun m!922459 () Bool)

(assert (=> b!995704 m!922459))

(declare-fun m!922461 () Bool)

(assert (=> b!995708 m!922461))

(assert (=> b!995708 m!922461))

(declare-fun m!922463 () Bool)

(assert (=> b!995708 m!922463))

(declare-fun m!922465 () Bool)

(assert (=> b!995705 m!922465))

(declare-fun m!922467 () Bool)

(assert (=> b!995703 m!922467))

(declare-fun m!922469 () Bool)

(assert (=> b!995706 m!922469))

(assert (=> b!995709 m!922461))

(assert (=> b!995709 m!922461))

(declare-fun m!922471 () Bool)

(assert (=> b!995709 m!922471))

(declare-fun m!922473 () Bool)

(assert (=> start!85944 m!922473))

(declare-fun m!922475 () Bool)

(assert (=> start!85944 m!922475))

(declare-fun m!922477 () Bool)

(assert (=> b!995702 m!922477))

(check-sat (not start!85944) (not b!995705) (not b!995706) (not b!995703) (not b!995709) (not b!995704) (not b!995708) (not b!995702))
(check-sat)
