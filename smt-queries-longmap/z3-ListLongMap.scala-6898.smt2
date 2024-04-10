; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86752 () Bool)

(assert start!86752)

(declare-fun res!674786 () Bool)

(declare-fun e!566243 () Bool)

(assert (=> start!86752 (=> (not res!674786) (not e!566243))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86752 (= res!674786 (validMask!0 mask!3464))))

(assert (=> start!86752 e!566243))

(declare-datatypes ((array!63451 0))(
  ( (array!63452 (arr!30548 (Array (_ BitVec 32) (_ BitVec 64))) (size!31050 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63451)

(declare-fun array_inv!23672 (array!63451) Bool)

(assert (=> start!86752 (array_inv!23672 a!3219)))

(assert (=> start!86752 true))

(declare-fun b!1005690 () Bool)

(declare-fun res!674781 () Bool)

(assert (=> b!1005690 (=> (not res!674781) (not e!566243))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005690 (= res!674781 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005691 () Bool)

(declare-fun e!566244 () Bool)

(assert (=> b!1005691 (= e!566244 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9480 0))(
  ( (MissingZero!9480 (index!40291 (_ BitVec 32))) (Found!9480 (index!40292 (_ BitVec 32))) (Intermediate!9480 (undefined!10292 Bool) (index!40293 (_ BitVec 32)) (x!87696 (_ BitVec 32))) (Undefined!9480) (MissingVacant!9480 (index!40294 (_ BitVec 32))) )
))
(declare-fun lt!444605 () SeekEntryResult!9480)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63451 (_ BitVec 32)) SeekEntryResult!9480)

(assert (=> b!1005691 (= lt!444605 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30548 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005692 () Bool)

(declare-fun res!674787 () Bool)

(assert (=> b!1005692 (=> (not res!674787) (not e!566244))))

(declare-datatypes ((List!21224 0))(
  ( (Nil!21221) (Cons!21220 (h!22403 (_ BitVec 64)) (t!30225 List!21224)) )
))
(declare-fun arrayNoDuplicates!0 (array!63451 (_ BitVec 32) List!21224) Bool)

(assert (=> b!1005692 (= res!674787 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21221))))

(declare-fun b!1005693 () Bool)

(declare-fun res!674784 () Bool)

(assert (=> b!1005693 (=> (not res!674784) (not e!566243))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005693 (= res!674784 (and (= (size!31050 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31050 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31050 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005694 () Bool)

(declare-fun res!674780 () Bool)

(assert (=> b!1005694 (=> (not res!674780) (not e!566243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005694 (= res!674780 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005695 () Bool)

(assert (=> b!1005695 (= e!566243 e!566244)))

(declare-fun res!674785 () Bool)

(assert (=> b!1005695 (=> (not res!674785) (not e!566244))))

(declare-fun lt!444604 () SeekEntryResult!9480)

(assert (=> b!1005695 (= res!674785 (or (= lt!444604 (MissingVacant!9480 i!1194)) (= lt!444604 (MissingZero!9480 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63451 (_ BitVec 32)) SeekEntryResult!9480)

(assert (=> b!1005695 (= lt!444604 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005696 () Bool)

(declare-fun res!674782 () Bool)

(assert (=> b!1005696 (=> (not res!674782) (not e!566244))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005696 (= res!674782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30548 a!3219) j!170) mask!3464) (select (arr!30548 a!3219) j!170) a!3219 mask!3464) (Intermediate!9480 false resIndex!38 resX!38)))))

(declare-fun b!1005697 () Bool)

(declare-fun res!674783 () Bool)

(assert (=> b!1005697 (=> (not res!674783) (not e!566244))))

(assert (=> b!1005697 (= res!674783 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31050 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31050 a!3219))))))

(declare-fun b!1005698 () Bool)

(declare-fun res!674779 () Bool)

(assert (=> b!1005698 (=> (not res!674779) (not e!566243))))

(assert (=> b!1005698 (= res!674779 (validKeyInArray!0 (select (arr!30548 a!3219) j!170)))))

(declare-fun b!1005699 () Bool)

(declare-fun res!674778 () Bool)

(assert (=> b!1005699 (=> (not res!674778) (not e!566244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63451 (_ BitVec 32)) Bool)

(assert (=> b!1005699 (= res!674778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86752 res!674786) b!1005693))

(assert (= (and b!1005693 res!674784) b!1005698))

(assert (= (and b!1005698 res!674779) b!1005694))

(assert (= (and b!1005694 res!674780) b!1005690))

(assert (= (and b!1005690 res!674781) b!1005695))

(assert (= (and b!1005695 res!674785) b!1005699))

(assert (= (and b!1005699 res!674778) b!1005692))

(assert (= (and b!1005692 res!674787) b!1005697))

(assert (= (and b!1005697 res!674783) b!1005696))

(assert (= (and b!1005696 res!674782) b!1005691))

(declare-fun m!930881 () Bool)

(assert (=> b!1005695 m!930881))

(declare-fun m!930883 () Bool)

(assert (=> b!1005698 m!930883))

(assert (=> b!1005698 m!930883))

(declare-fun m!930885 () Bool)

(assert (=> b!1005698 m!930885))

(declare-fun m!930887 () Bool)

(assert (=> b!1005694 m!930887))

(declare-fun m!930889 () Bool)

(assert (=> start!86752 m!930889))

(declare-fun m!930891 () Bool)

(assert (=> start!86752 m!930891))

(declare-fun m!930893 () Bool)

(assert (=> b!1005692 m!930893))

(declare-fun m!930895 () Bool)

(assert (=> b!1005699 m!930895))

(assert (=> b!1005696 m!930883))

(assert (=> b!1005696 m!930883))

(declare-fun m!930897 () Bool)

(assert (=> b!1005696 m!930897))

(assert (=> b!1005696 m!930897))

(assert (=> b!1005696 m!930883))

(declare-fun m!930899 () Bool)

(assert (=> b!1005696 m!930899))

(assert (=> b!1005691 m!930883))

(assert (=> b!1005691 m!930883))

(declare-fun m!930901 () Bool)

(assert (=> b!1005691 m!930901))

(declare-fun m!930903 () Bool)

(assert (=> b!1005690 m!930903))

(check-sat (not b!1005691) (not b!1005699) (not b!1005694) (not b!1005696) (not start!86752) (not b!1005690) (not b!1005695) (not b!1005692) (not b!1005698))
(check-sat)
