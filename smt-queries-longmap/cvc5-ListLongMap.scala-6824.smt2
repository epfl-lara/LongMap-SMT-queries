; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85892 () Bool)

(assert start!85892)

(declare-fun b!995540 () Bool)

(declare-fun res!665836 () Bool)

(declare-fun e!561783 () Bool)

(assert (=> b!995540 (=> (not res!665836) (not e!561783))))

(declare-datatypes ((array!62981 0))(
  ( (array!62982 (arr!30325 (Array (_ BitVec 32) (_ BitVec 64))) (size!30827 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62981)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995540 (= res!665836 (and (= (size!30827 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30827 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30827 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995541 () Bool)

(declare-fun res!665833 () Bool)

(declare-fun e!561782 () Bool)

(assert (=> b!995541 (=> (not res!665833) (not e!561782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62981 (_ BitVec 32)) Bool)

(assert (=> b!995541 (= res!665833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995542 () Bool)

(declare-fun res!665832 () Bool)

(assert (=> b!995542 (=> (not res!665832) (not e!561783))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995542 (= res!665832 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995543 () Bool)

(declare-fun res!665838 () Bool)

(assert (=> b!995543 (=> (not res!665838) (not e!561783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995543 (= res!665838 (validKeyInArray!0 (select (arr!30325 a!3219) j!170)))))

(declare-fun res!665831 () Bool)

(assert (=> start!85892 (=> (not res!665831) (not e!561783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85892 (= res!665831 (validMask!0 mask!3464))))

(assert (=> start!85892 e!561783))

(declare-fun array_inv!23449 (array!62981) Bool)

(assert (=> start!85892 (array_inv!23449 a!3219)))

(assert (=> start!85892 true))

(declare-fun b!995544 () Bool)

(declare-fun res!665834 () Bool)

(assert (=> b!995544 (=> (not res!665834) (not e!561783))))

(assert (=> b!995544 (= res!665834 (validKeyInArray!0 k!2224))))

(declare-fun b!995545 () Bool)

(assert (=> b!995545 (= e!561783 e!561782)))

(declare-fun res!665835 () Bool)

(assert (=> b!995545 (=> (not res!665835) (not e!561782))))

(declare-datatypes ((SeekEntryResult!9257 0))(
  ( (MissingZero!9257 (index!39399 (_ BitVec 32))) (Found!9257 (index!39400 (_ BitVec 32))) (Intermediate!9257 (undefined!10069 Bool) (index!39401 (_ BitVec 32)) (x!86842 (_ BitVec 32))) (Undefined!9257) (MissingVacant!9257 (index!39402 (_ BitVec 32))) )
))
(declare-fun lt!440990 () SeekEntryResult!9257)

(assert (=> b!995545 (= res!665835 (or (= lt!440990 (MissingVacant!9257 i!1194)) (= lt!440990 (MissingZero!9257 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62981 (_ BitVec 32)) SeekEntryResult!9257)

(assert (=> b!995545 (= lt!440990 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!995546 () Bool)

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!995546 (= e!561782 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30827 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30827 a!3219)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!995547 () Bool)

(declare-fun res!665837 () Bool)

(assert (=> b!995547 (=> (not res!665837) (not e!561782))))

(declare-datatypes ((List!21001 0))(
  ( (Nil!20998) (Cons!20997 (h!22159 (_ BitVec 64)) (t!30002 List!21001)) )
))
(declare-fun arrayNoDuplicates!0 (array!62981 (_ BitVec 32) List!21001) Bool)

(assert (=> b!995547 (= res!665837 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20998))))

(assert (= (and start!85892 res!665831) b!995540))

(assert (= (and b!995540 res!665836) b!995543))

(assert (= (and b!995543 res!665838) b!995544))

(assert (= (and b!995544 res!665834) b!995542))

(assert (= (and b!995542 res!665832) b!995545))

(assert (= (and b!995545 res!665835) b!995541))

(assert (= (and b!995541 res!665833) b!995547))

(assert (= (and b!995547 res!665837) b!995546))

(declare-fun m!922925 () Bool)

(assert (=> b!995542 m!922925))

(declare-fun m!922927 () Bool)

(assert (=> b!995543 m!922927))

(assert (=> b!995543 m!922927))

(declare-fun m!922929 () Bool)

(assert (=> b!995543 m!922929))

(declare-fun m!922931 () Bool)

(assert (=> start!85892 m!922931))

(declare-fun m!922933 () Bool)

(assert (=> start!85892 m!922933))

(declare-fun m!922935 () Bool)

(assert (=> b!995541 m!922935))

(declare-fun m!922937 () Bool)

(assert (=> b!995544 m!922937))

(declare-fun m!922939 () Bool)

(assert (=> b!995547 m!922939))

(declare-fun m!922941 () Bool)

(assert (=> b!995545 m!922941))

(push 1)

(assert (not b!995542))

(assert (not start!85892))

(assert (not b!995547))

