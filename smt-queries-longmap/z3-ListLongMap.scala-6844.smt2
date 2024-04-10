; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86212 () Bool)

(assert start!86212)

(declare-fun b!998121 () Bool)

(declare-fun e!562921 () Bool)

(declare-fun e!562920 () Bool)

(assert (=> b!998121 (= e!562921 e!562920)))

(declare-fun res!667926 () Bool)

(assert (=> b!998121 (=> (not res!667926) (not e!562920))))

(declare-datatypes ((SeekEntryResult!9318 0))(
  ( (MissingZero!9318 (index!39643 (_ BitVec 32))) (Found!9318 (index!39644 (_ BitVec 32))) (Intermediate!9318 (undefined!10130 Bool) (index!39645 (_ BitVec 32)) (x!87078 (_ BitVec 32))) (Undefined!9318) (MissingVacant!9318 (index!39646 (_ BitVec 32))) )
))
(declare-fun lt!441640 () SeekEntryResult!9318)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998121 (= res!667926 (or (= lt!441640 (MissingVacant!9318 i!1194)) (= lt!441640 (MissingZero!9318 i!1194))))))

(declare-datatypes ((array!63115 0))(
  ( (array!63116 (arr!30386 (Array (_ BitVec 32) (_ BitVec 64))) (size!30888 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63115)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63115 (_ BitVec 32)) SeekEntryResult!9318)

(assert (=> b!998121 (= lt!441640 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998122 () Bool)

(assert (=> b!998122 (= e!562920 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441641 () SeekEntryResult!9318)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63115 (_ BitVec 32)) SeekEntryResult!9318)

(assert (=> b!998122 (= lt!441641 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30386 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998123 () Bool)

(declare-fun res!667920 () Bool)

(assert (=> b!998123 (=> (not res!667920) (not e!562920))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998123 (= res!667920 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30888 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30888 a!3219))))))

(declare-fun b!998124 () Bool)

(declare-fun res!667922 () Bool)

(assert (=> b!998124 (=> (not res!667922) (not e!562921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998124 (= res!667922 (validKeyInArray!0 (select (arr!30386 a!3219) j!170)))))

(declare-fun b!998125 () Bool)

(declare-fun res!667918 () Bool)

(assert (=> b!998125 (=> (not res!667918) (not e!562920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63115 (_ BitVec 32)) Bool)

(assert (=> b!998125 (= res!667918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!667924 () Bool)

(assert (=> start!86212 (=> (not res!667924) (not e!562921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86212 (= res!667924 (validMask!0 mask!3464))))

(assert (=> start!86212 e!562921))

(declare-fun array_inv!23510 (array!63115) Bool)

(assert (=> start!86212 (array_inv!23510 a!3219)))

(assert (=> start!86212 true))

(declare-fun b!998126 () Bool)

(declare-fun res!667917 () Bool)

(assert (=> b!998126 (=> (not res!667917) (not e!562921))))

(assert (=> b!998126 (= res!667917 (and (= (size!30888 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30888 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30888 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998127 () Bool)

(declare-fun res!667923 () Bool)

(assert (=> b!998127 (=> (not res!667923) (not e!562921))))

(declare-fun arrayContainsKey!0 (array!63115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998127 (= res!667923 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998128 () Bool)

(declare-fun res!667925 () Bool)

(assert (=> b!998128 (=> (not res!667925) (not e!562920))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998128 (= res!667925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30386 a!3219) j!170) mask!3464) (select (arr!30386 a!3219) j!170) a!3219 mask!3464) (Intermediate!9318 false resIndex!38 resX!38)))))

(declare-fun b!998129 () Bool)

(declare-fun res!667921 () Bool)

(assert (=> b!998129 (=> (not res!667921) (not e!562921))))

(assert (=> b!998129 (= res!667921 (validKeyInArray!0 k0!2224))))

(declare-fun b!998130 () Bool)

(declare-fun res!667919 () Bool)

(assert (=> b!998130 (=> (not res!667919) (not e!562920))))

(declare-datatypes ((List!21062 0))(
  ( (Nil!21059) (Cons!21058 (h!22229 (_ BitVec 64)) (t!30063 List!21062)) )
))
(declare-fun arrayNoDuplicates!0 (array!63115 (_ BitVec 32) List!21062) Bool)

(assert (=> b!998130 (= res!667919 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21059))))

(assert (= (and start!86212 res!667924) b!998126))

(assert (= (and b!998126 res!667917) b!998124))

(assert (= (and b!998124 res!667922) b!998129))

(assert (= (and b!998129 res!667921) b!998127))

(assert (= (and b!998127 res!667923) b!998121))

(assert (= (and b!998121 res!667926) b!998125))

(assert (= (and b!998125 res!667918) b!998130))

(assert (= (and b!998130 res!667919) b!998123))

(assert (= (and b!998123 res!667920) b!998128))

(assert (= (and b!998128 res!667925) b!998122))

(declare-fun m!924725 () Bool)

(assert (=> b!998130 m!924725))

(declare-fun m!924727 () Bool)

(assert (=> b!998122 m!924727))

(assert (=> b!998122 m!924727))

(declare-fun m!924729 () Bool)

(assert (=> b!998122 m!924729))

(declare-fun m!924731 () Bool)

(assert (=> b!998125 m!924731))

(declare-fun m!924733 () Bool)

(assert (=> b!998127 m!924733))

(declare-fun m!924735 () Bool)

(assert (=> b!998129 m!924735))

(declare-fun m!924737 () Bool)

(assert (=> b!998121 m!924737))

(assert (=> b!998128 m!924727))

(assert (=> b!998128 m!924727))

(declare-fun m!924739 () Bool)

(assert (=> b!998128 m!924739))

(assert (=> b!998128 m!924739))

(assert (=> b!998128 m!924727))

(declare-fun m!924741 () Bool)

(assert (=> b!998128 m!924741))

(declare-fun m!924743 () Bool)

(assert (=> start!86212 m!924743))

(declare-fun m!924745 () Bool)

(assert (=> start!86212 m!924745))

(assert (=> b!998124 m!924727))

(assert (=> b!998124 m!924727))

(declare-fun m!924747 () Bool)

(assert (=> b!998124 m!924747))

(check-sat (not b!998128) (not b!998127) (not b!998125) (not b!998129) (not b!998121) (not b!998122) (not start!86212) (not b!998124) (not b!998130))
(check-sat)
