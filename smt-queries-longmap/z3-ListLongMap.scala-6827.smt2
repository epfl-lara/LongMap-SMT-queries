; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85954 () Bool)

(assert start!85954)

(declare-fun b!995947 () Bool)

(declare-fun res!666149 () Bool)

(declare-fun e!561980 () Bool)

(assert (=> b!995947 (=> (not res!666149) (not e!561980))))

(declare-datatypes ((array!63004 0))(
  ( (array!63005 (arr!30335 (Array (_ BitVec 32) (_ BitVec 64))) (size!30837 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63004)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63004 (_ BitVec 32)) Bool)

(assert (=> b!995947 (= res!666149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995948 () Bool)

(declare-fun res!666151 () Bool)

(declare-fun e!561981 () Bool)

(assert (=> b!995948 (=> (not res!666151) (not e!561981))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995948 (= res!666151 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995949 () Bool)

(declare-fun res!666152 () Bool)

(assert (=> b!995949 (=> (not res!666152) (not e!561981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995949 (= res!666152 (validKeyInArray!0 k0!2224))))

(declare-fun b!995950 () Bool)

(assert (=> b!995950 (= e!561980 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441089 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995950 (= lt!441089 (toIndex!0 (select (arr!30335 a!3219) j!170) mask!3464))))

(declare-fun b!995951 () Bool)

(declare-fun res!666156 () Bool)

(assert (=> b!995951 (=> (not res!666156) (not e!561980))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995951 (= res!666156 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30837 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30837 a!3219))))))

(declare-fun res!666155 () Bool)

(assert (=> start!85954 (=> (not res!666155) (not e!561981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85954 (= res!666155 (validMask!0 mask!3464))))

(assert (=> start!85954 e!561981))

(declare-fun array_inv!23459 (array!63004) Bool)

(assert (=> start!85954 (array_inv!23459 a!3219)))

(assert (=> start!85954 true))

(declare-fun b!995952 () Bool)

(declare-fun res!666153 () Bool)

(assert (=> b!995952 (=> (not res!666153) (not e!561981))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995952 (= res!666153 (and (= (size!30837 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30837 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30837 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995953 () Bool)

(declare-fun res!666148 () Bool)

(assert (=> b!995953 (=> (not res!666148) (not e!561980))))

(declare-datatypes ((List!21011 0))(
  ( (Nil!21008) (Cons!21007 (h!22169 (_ BitVec 64)) (t!30012 List!21011)) )
))
(declare-fun arrayNoDuplicates!0 (array!63004 (_ BitVec 32) List!21011) Bool)

(assert (=> b!995953 (= res!666148 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21008))))

(declare-fun b!995954 () Bool)

(declare-fun res!666154 () Bool)

(assert (=> b!995954 (=> (not res!666154) (not e!561981))))

(assert (=> b!995954 (= res!666154 (validKeyInArray!0 (select (arr!30335 a!3219) j!170)))))

(declare-fun b!995955 () Bool)

(assert (=> b!995955 (= e!561981 e!561980)))

(declare-fun res!666150 () Bool)

(assert (=> b!995955 (=> (not res!666150) (not e!561980))))

(declare-datatypes ((SeekEntryResult!9267 0))(
  ( (MissingZero!9267 (index!39439 (_ BitVec 32))) (Found!9267 (index!39440 (_ BitVec 32))) (Intermediate!9267 (undefined!10079 Bool) (index!39441 (_ BitVec 32)) (x!86876 (_ BitVec 32))) (Undefined!9267) (MissingVacant!9267 (index!39442 (_ BitVec 32))) )
))
(declare-fun lt!441088 () SeekEntryResult!9267)

(assert (=> b!995955 (= res!666150 (or (= lt!441088 (MissingVacant!9267 i!1194)) (= lt!441088 (MissingZero!9267 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63004 (_ BitVec 32)) SeekEntryResult!9267)

(assert (=> b!995955 (= lt!441088 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!85954 res!666155) b!995952))

(assert (= (and b!995952 res!666153) b!995954))

(assert (= (and b!995954 res!666154) b!995949))

(assert (= (and b!995949 res!666152) b!995948))

(assert (= (and b!995948 res!666151) b!995955))

(assert (= (and b!995955 res!666150) b!995947))

(assert (= (and b!995947 res!666149) b!995953))

(assert (= (and b!995953 res!666148) b!995951))

(assert (= (and b!995951 res!666156) b!995950))

(declare-fun m!923209 () Bool)

(assert (=> b!995949 m!923209))

(declare-fun m!923211 () Bool)

(assert (=> b!995954 m!923211))

(assert (=> b!995954 m!923211))

(declare-fun m!923213 () Bool)

(assert (=> b!995954 m!923213))

(declare-fun m!923215 () Bool)

(assert (=> b!995955 m!923215))

(assert (=> b!995950 m!923211))

(assert (=> b!995950 m!923211))

(declare-fun m!923217 () Bool)

(assert (=> b!995950 m!923217))

(declare-fun m!923219 () Bool)

(assert (=> start!85954 m!923219))

(declare-fun m!923221 () Bool)

(assert (=> start!85954 m!923221))

(declare-fun m!923223 () Bool)

(assert (=> b!995953 m!923223))

(declare-fun m!923225 () Bool)

(assert (=> b!995948 m!923225))

(declare-fun m!923227 () Bool)

(assert (=> b!995947 m!923227))

(check-sat (not start!85954) (not b!995955) (not b!995947) (not b!995948) (not b!995954) (not b!995950) (not b!995949) (not b!995953))
(check-sat)
