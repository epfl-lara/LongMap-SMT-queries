; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85938 () Bool)

(assert start!85938)

(declare-fun res!665952 () Bool)

(declare-fun e!561814 () Bool)

(assert (=> start!85938 (=> (not res!665952) (not e!561814))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85938 (= res!665952 (validMask!0 mask!3464))))

(assert (=> start!85938 e!561814))

(declare-datatypes ((array!62935 0))(
  ( (array!62936 (arr!30300 (Array (_ BitVec 32) (_ BitVec 64))) (size!30804 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62935)

(declare-fun array_inv!23443 (array!62935) Bool)

(assert (=> start!85938 (array_inv!23443 a!3219)))

(assert (=> start!85938 true))

(declare-fun b!995621 () Bool)

(declare-fun e!561815 () Bool)

(assert (=> b!995621 (= e!561814 e!561815)))

(declare-fun res!665954 () Bool)

(assert (=> b!995621 (=> (not res!665954) (not e!561815))))

(declare-datatypes ((SeekEntryResult!9257 0))(
  ( (MissingZero!9257 (index!39399 (_ BitVec 32))) (Found!9257 (index!39400 (_ BitVec 32))) (Intermediate!9257 (undefined!10069 Bool) (index!39401 (_ BitVec 32)) (x!86853 (_ BitVec 32))) (Undefined!9257) (MissingVacant!9257 (index!39402 (_ BitVec 32))) )
))
(declare-fun lt!440833 () SeekEntryResult!9257)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995621 (= res!665954 (or (= lt!440833 (MissingVacant!9257 i!1194)) (= lt!440833 (MissingZero!9257 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62935 (_ BitVec 32)) SeekEntryResult!9257)

(assert (=> b!995621 (= lt!440833 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995622 () Bool)

(declare-fun res!665946 () Bool)

(assert (=> b!995622 (=> (not res!665946) (not e!561814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995622 (= res!665946 (validKeyInArray!0 k0!2224))))

(declare-fun b!995623 () Bool)

(declare-fun res!665951 () Bool)

(assert (=> b!995623 (=> (not res!665951) (not e!561814))))

(declare-fun arrayContainsKey!0 (array!62935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995623 (= res!665951 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995624 () Bool)

(declare-fun res!665948 () Bool)

(assert (=> b!995624 (=> (not res!665948) (not e!561815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62935 (_ BitVec 32)) Bool)

(assert (=> b!995624 (= res!665948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995625 () Bool)

(declare-fun res!665953 () Bool)

(assert (=> b!995625 (=> (not res!665953) (not e!561815))))

(declare-datatypes ((List!21042 0))(
  ( (Nil!21039) (Cons!21038 (h!22200 (_ BitVec 64)) (t!30034 List!21042)) )
))
(declare-fun arrayNoDuplicates!0 (array!62935 (_ BitVec 32) List!21042) Bool)

(assert (=> b!995625 (= res!665953 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21039))))

(declare-fun b!995626 () Bool)

(declare-fun res!665950 () Bool)

(assert (=> b!995626 (=> (not res!665950) (not e!561814))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!995626 (= res!665950 (validKeyInArray!0 (select (arr!30300 a!3219) j!170)))))

(declare-fun b!995627 () Bool)

(assert (=> b!995627 (= e!561815 false)))

(declare-fun lt!440832 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995627 (= lt!440832 (toIndex!0 (select (arr!30300 a!3219) j!170) mask!3464))))

(declare-fun b!995628 () Bool)

(declare-fun res!665949 () Bool)

(assert (=> b!995628 (=> (not res!665949) (not e!561815))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995628 (= res!665949 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30804 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30804 a!3219))))))

(declare-fun b!995629 () Bool)

(declare-fun res!665947 () Bool)

(assert (=> b!995629 (=> (not res!665947) (not e!561814))))

(assert (=> b!995629 (= res!665947 (and (= (size!30804 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30804 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30804 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!85938 res!665952) b!995629))

(assert (= (and b!995629 res!665947) b!995626))

(assert (= (and b!995626 res!665950) b!995622))

(assert (= (and b!995622 res!665946) b!995623))

(assert (= (and b!995623 res!665951) b!995621))

(assert (= (and b!995621 res!665954) b!995624))

(assert (= (and b!995624 res!665948) b!995625))

(assert (= (and b!995625 res!665953) b!995628))

(assert (= (and b!995628 res!665949) b!995627))

(declare-fun m!922399 () Bool)

(assert (=> b!995622 m!922399))

(declare-fun m!922401 () Bool)

(assert (=> b!995621 m!922401))

(declare-fun m!922403 () Bool)

(assert (=> b!995625 m!922403))

(declare-fun m!922405 () Bool)

(assert (=> b!995627 m!922405))

(assert (=> b!995627 m!922405))

(declare-fun m!922407 () Bool)

(assert (=> b!995627 m!922407))

(declare-fun m!922409 () Bool)

(assert (=> b!995624 m!922409))

(declare-fun m!922411 () Bool)

(assert (=> b!995623 m!922411))

(assert (=> b!995626 m!922405))

(assert (=> b!995626 m!922405))

(declare-fun m!922413 () Bool)

(assert (=> b!995626 m!922413))

(declare-fun m!922415 () Bool)

(assert (=> start!85938 m!922415))

(declare-fun m!922417 () Bool)

(assert (=> start!85938 m!922417))

(check-sat (not b!995627) (not b!995622) (not start!85938) (not b!995624) (not b!995625) (not b!995623) (not b!995626) (not b!995621))
(check-sat)
