; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85948 () Bool)

(assert start!85948)

(declare-fun b!995866 () Bool)

(declare-fun res!666072 () Bool)

(declare-fun e!561953 () Bool)

(assert (=> b!995866 (=> (not res!666072) (not e!561953))))

(declare-datatypes ((array!62998 0))(
  ( (array!62999 (arr!30332 (Array (_ BitVec 32) (_ BitVec 64))) (size!30834 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62998)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62998 (_ BitVec 32)) Bool)

(assert (=> b!995866 (= res!666072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995867 () Bool)

(declare-fun res!666068 () Bool)

(declare-fun e!561955 () Bool)

(assert (=> b!995867 (=> (not res!666068) (not e!561955))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995867 (= res!666068 (and (= (size!30834 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30834 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30834 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995868 () Bool)

(declare-fun res!666067 () Bool)

(assert (=> b!995868 (=> (not res!666067) (not e!561955))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995868 (= res!666067 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995869 () Bool)

(declare-fun res!666069 () Bool)

(assert (=> b!995869 (=> (not res!666069) (not e!561955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995869 (= res!666069 (validKeyInArray!0 (select (arr!30332 a!3219) j!170)))))

(declare-fun b!995870 () Bool)

(assert (=> b!995870 (= e!561953 false)))

(declare-fun lt!441071 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!995870 (= lt!441071 (toIndex!0 (select (arr!30332 a!3219) j!170) mask!3464))))

(declare-fun b!995871 () Bool)

(assert (=> b!995871 (= e!561955 e!561953)))

(declare-fun res!666073 () Bool)

(assert (=> b!995871 (=> (not res!666073) (not e!561953))))

(declare-datatypes ((SeekEntryResult!9264 0))(
  ( (MissingZero!9264 (index!39427 (_ BitVec 32))) (Found!9264 (index!39428 (_ BitVec 32))) (Intermediate!9264 (undefined!10076 Bool) (index!39429 (_ BitVec 32)) (x!86865 (_ BitVec 32))) (Undefined!9264) (MissingVacant!9264 (index!39430 (_ BitVec 32))) )
))
(declare-fun lt!441070 () SeekEntryResult!9264)

(assert (=> b!995871 (= res!666073 (or (= lt!441070 (MissingVacant!9264 i!1194)) (= lt!441070 (MissingZero!9264 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62998 (_ BitVec 32)) SeekEntryResult!9264)

(assert (=> b!995871 (= lt!441070 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995872 () Bool)

(declare-fun res!666074 () Bool)

(assert (=> b!995872 (=> (not res!666074) (not e!561955))))

(assert (=> b!995872 (= res!666074 (validKeyInArray!0 k0!2224))))

(declare-fun b!995873 () Bool)

(declare-fun res!666075 () Bool)

(assert (=> b!995873 (=> (not res!666075) (not e!561953))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!995873 (= res!666075 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30834 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30834 a!3219))))))

(declare-fun b!995874 () Bool)

(declare-fun res!666071 () Bool)

(assert (=> b!995874 (=> (not res!666071) (not e!561953))))

(declare-datatypes ((List!21008 0))(
  ( (Nil!21005) (Cons!21004 (h!22166 (_ BitVec 64)) (t!30009 List!21008)) )
))
(declare-fun arrayNoDuplicates!0 (array!62998 (_ BitVec 32) List!21008) Bool)

(assert (=> b!995874 (= res!666071 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21005))))

(declare-fun res!666070 () Bool)

(assert (=> start!85948 (=> (not res!666070) (not e!561955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85948 (= res!666070 (validMask!0 mask!3464))))

(assert (=> start!85948 e!561955))

(declare-fun array_inv!23456 (array!62998) Bool)

(assert (=> start!85948 (array_inv!23456 a!3219)))

(assert (=> start!85948 true))

(assert (= (and start!85948 res!666070) b!995867))

(assert (= (and b!995867 res!666068) b!995869))

(assert (= (and b!995869 res!666069) b!995872))

(assert (= (and b!995872 res!666074) b!995868))

(assert (= (and b!995868 res!666067) b!995871))

(assert (= (and b!995871 res!666073) b!995866))

(assert (= (and b!995866 res!666072) b!995874))

(assert (= (and b!995874 res!666071) b!995873))

(assert (= (and b!995873 res!666075) b!995870))

(declare-fun m!923149 () Bool)

(assert (=> b!995871 m!923149))

(declare-fun m!923151 () Bool)

(assert (=> start!85948 m!923151))

(declare-fun m!923153 () Bool)

(assert (=> start!85948 m!923153))

(declare-fun m!923155 () Bool)

(assert (=> b!995868 m!923155))

(declare-fun m!923157 () Bool)

(assert (=> b!995874 m!923157))

(declare-fun m!923159 () Bool)

(assert (=> b!995870 m!923159))

(assert (=> b!995870 m!923159))

(declare-fun m!923161 () Bool)

(assert (=> b!995870 m!923161))

(assert (=> b!995869 m!923159))

(assert (=> b!995869 m!923159))

(declare-fun m!923163 () Bool)

(assert (=> b!995869 m!923163))

(declare-fun m!923165 () Bool)

(assert (=> b!995872 m!923165))

(declare-fun m!923167 () Bool)

(assert (=> b!995866 m!923167))

(check-sat (not b!995870) (not b!995871) (not b!995869) (not b!995868) (not b!995874) (not b!995866) (not start!85948) (not b!995872))
(check-sat)
