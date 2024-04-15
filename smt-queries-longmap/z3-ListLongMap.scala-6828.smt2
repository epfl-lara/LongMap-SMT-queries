; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85950 () Bool)

(assert start!85950)

(declare-fun res!666115 () Bool)

(declare-fun e!561868 () Bool)

(assert (=> start!85950 (=> (not res!666115) (not e!561868))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85950 (= res!666115 (validMask!0 mask!3464))))

(assert (=> start!85950 e!561868))

(declare-datatypes ((array!62947 0))(
  ( (array!62948 (arr!30306 (Array (_ BitVec 32) (_ BitVec 64))) (size!30810 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62947)

(declare-fun array_inv!23449 (array!62947) Bool)

(assert (=> start!85950 (array_inv!23449 a!3219)))

(assert (=> start!85950 true))

(declare-fun b!995783 () Bool)

(declare-fun res!666111 () Bool)

(assert (=> b!995783 (=> (not res!666111) (not e!561868))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995783 (= res!666111 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995784 () Bool)

(declare-fun res!666113 () Bool)

(assert (=> b!995784 (=> (not res!666113) (not e!561868))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995784 (= res!666113 (validKeyInArray!0 (select (arr!30306 a!3219) j!170)))))

(declare-fun b!995785 () Bool)

(declare-fun res!666109 () Bool)

(assert (=> b!995785 (=> (not res!666109) (not e!561868))))

(assert (=> b!995785 (= res!666109 (validKeyInArray!0 k0!2224))))

(declare-fun b!995786 () Bool)

(declare-fun res!666116 () Bool)

(declare-fun e!561867 () Bool)

(assert (=> b!995786 (=> (not res!666116) (not e!561867))))

(declare-datatypes ((List!21048 0))(
  ( (Nil!21045) (Cons!21044 (h!22206 (_ BitVec 64)) (t!30040 List!21048)) )
))
(declare-fun arrayNoDuplicates!0 (array!62947 (_ BitVec 32) List!21048) Bool)

(assert (=> b!995786 (= res!666116 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21045))))

(declare-fun b!995787 () Bool)

(declare-fun res!666110 () Bool)

(assert (=> b!995787 (=> (not res!666110) (not e!561867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62947 (_ BitVec 32)) Bool)

(assert (=> b!995787 (= res!666110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995788 () Bool)

(declare-fun res!666112 () Bool)

(assert (=> b!995788 (=> (not res!666112) (not e!561867))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995788 (= res!666112 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30810 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30810 a!3219))))))

(declare-fun b!995789 () Bool)

(declare-fun res!666114 () Bool)

(assert (=> b!995789 (=> (not res!666114) (not e!561868))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995789 (= res!666114 (and (= (size!30810 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30810 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30810 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995790 () Bool)

(assert (=> b!995790 (= e!561867 false)))

(declare-fun lt!440869 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995790 (= lt!440869 (toIndex!0 (select (arr!30306 a!3219) j!170) mask!3464))))

(declare-fun b!995791 () Bool)

(assert (=> b!995791 (= e!561868 e!561867)))

(declare-fun res!666108 () Bool)

(assert (=> b!995791 (=> (not res!666108) (not e!561867))))

(declare-datatypes ((SeekEntryResult!9263 0))(
  ( (MissingZero!9263 (index!39423 (_ BitVec 32))) (Found!9263 (index!39424 (_ BitVec 32))) (Intermediate!9263 (undefined!10075 Bool) (index!39425 (_ BitVec 32)) (x!86875 (_ BitVec 32))) (Undefined!9263) (MissingVacant!9263 (index!39426 (_ BitVec 32))) )
))
(declare-fun lt!440868 () SeekEntryResult!9263)

(assert (=> b!995791 (= res!666108 (or (= lt!440868 (MissingVacant!9263 i!1194)) (= lt!440868 (MissingZero!9263 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62947 (_ BitVec 32)) SeekEntryResult!9263)

(assert (=> b!995791 (= lt!440868 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85950 res!666115) b!995789))

(assert (= (and b!995789 res!666114) b!995784))

(assert (= (and b!995784 res!666113) b!995785))

(assert (= (and b!995785 res!666109) b!995783))

(assert (= (and b!995783 res!666111) b!995791))

(assert (= (and b!995791 res!666108) b!995787))

(assert (= (and b!995787 res!666110) b!995786))

(assert (= (and b!995786 res!666116) b!995788))

(assert (= (and b!995788 res!666112) b!995790))

(declare-fun m!922519 () Bool)

(assert (=> b!995783 m!922519))

(declare-fun m!922521 () Bool)

(assert (=> start!85950 m!922521))

(declare-fun m!922523 () Bool)

(assert (=> start!85950 m!922523))

(declare-fun m!922525 () Bool)

(assert (=> b!995790 m!922525))

(assert (=> b!995790 m!922525))

(declare-fun m!922527 () Bool)

(assert (=> b!995790 m!922527))

(declare-fun m!922529 () Bool)

(assert (=> b!995785 m!922529))

(assert (=> b!995784 m!922525))

(assert (=> b!995784 m!922525))

(declare-fun m!922531 () Bool)

(assert (=> b!995784 m!922531))

(declare-fun m!922533 () Bool)

(assert (=> b!995791 m!922533))

(declare-fun m!922535 () Bool)

(assert (=> b!995786 m!922535))

(declare-fun m!922537 () Bool)

(assert (=> b!995787 m!922537))

(check-sat (not b!995787) (not start!85950) (not b!995791) (not b!995785) (not b!995790) (not b!995786) (not b!995783) (not b!995784))
(check-sat)
