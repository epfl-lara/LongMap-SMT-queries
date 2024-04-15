; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86058 () Bool)

(assert start!86058)

(declare-fun b!996777 () Bool)

(declare-fun res!667021 () Bool)

(declare-fun e!562249 () Bool)

(assert (=> b!996777 (=> (not res!667021) (not e!562249))))

(declare-datatypes ((array!63010 0))(
  ( (array!63011 (arr!30336 (Array (_ BitVec 32) (_ BitVec 64))) (size!30840 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63010)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996777 (= res!667021 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30840 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30840 a!3219))))))

(declare-fun b!996778 () Bool)

(declare-fun res!667022 () Bool)

(assert (=> b!996778 (=> (not res!667022) (not e!562249))))

(declare-datatypes ((List!21078 0))(
  ( (Nil!21075) (Cons!21074 (h!22239 (_ BitVec 64)) (t!30070 List!21078)) )
))
(declare-fun arrayNoDuplicates!0 (array!63010 (_ BitVec 32) List!21078) Bool)

(assert (=> b!996778 (= res!667022 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21075))))

(declare-fun b!996779 () Bool)

(declare-fun e!562250 () Bool)

(assert (=> b!996779 (= e!562250 e!562249)))

(declare-fun res!667020 () Bool)

(assert (=> b!996779 (=> (not res!667020) (not e!562249))))

(declare-datatypes ((SeekEntryResult!9293 0))(
  ( (MissingZero!9293 (index!39543 (_ BitVec 32))) (Found!9293 (index!39544 (_ BitVec 32))) (Intermediate!9293 (undefined!10105 Bool) (index!39545 (_ BitVec 32)) (x!86988 (_ BitVec 32))) (Undefined!9293) (MissingVacant!9293 (index!39546 (_ BitVec 32))) )
))
(declare-fun lt!441093 () SeekEntryResult!9293)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996779 (= res!667020 (or (= lt!441093 (MissingVacant!9293 i!1194)) (= lt!441093 (MissingZero!9293 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63010 (_ BitVec 32)) SeekEntryResult!9293)

(assert (=> b!996779 (= lt!441093 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996780 () Bool)

(declare-fun e!562248 () Bool)

(assert (=> b!996780 (= e!562248 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!996781 () Bool)

(declare-fun res!667023 () Bool)

(assert (=> b!996781 (=> (not res!667023) (not e!562250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996781 (= res!667023 (validKeyInArray!0 k0!2224))))

(declare-fun res!667017 () Bool)

(assert (=> start!86058 (=> (not res!667017) (not e!562250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86058 (= res!667017 (validMask!0 mask!3464))))

(assert (=> start!86058 e!562250))

(declare-fun array_inv!23479 (array!63010) Bool)

(assert (=> start!86058 (array_inv!23479 a!3219)))

(assert (=> start!86058 true))

(declare-fun b!996782 () Bool)

(declare-fun res!667025 () Bool)

(assert (=> b!996782 (=> (not res!667025) (not e!562250))))

(declare-fun arrayContainsKey!0 (array!63010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996782 (= res!667025 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996783 () Bool)

(declare-fun res!667016 () Bool)

(assert (=> b!996783 (=> (not res!667016) (not e!562248))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441094 () SeekEntryResult!9293)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63010 (_ BitVec 32)) SeekEntryResult!9293)

(assert (=> b!996783 (= res!667016 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30336 a!3219) j!170) a!3219 mask!3464) lt!441094))))

(declare-fun b!996784 () Bool)

(declare-fun res!667018 () Bool)

(assert (=> b!996784 (=> (not res!667018) (not e!562249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63010 (_ BitVec 32)) Bool)

(assert (=> b!996784 (= res!667018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996785 () Bool)

(assert (=> b!996785 (= e!562249 e!562248)))

(declare-fun res!667024 () Bool)

(assert (=> b!996785 (=> (not res!667024) (not e!562248))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996785 (= res!667024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30336 a!3219) j!170) mask!3464) (select (arr!30336 a!3219) j!170) a!3219 mask!3464) lt!441094))))

(assert (=> b!996785 (= lt!441094 (Intermediate!9293 false resIndex!38 resX!38))))

(declare-fun b!996786 () Bool)

(declare-fun res!667015 () Bool)

(assert (=> b!996786 (=> (not res!667015) (not e!562250))))

(assert (=> b!996786 (= res!667015 (validKeyInArray!0 (select (arr!30336 a!3219) j!170)))))

(declare-fun b!996787 () Bool)

(declare-fun res!667019 () Bool)

(assert (=> b!996787 (=> (not res!667019) (not e!562250))))

(assert (=> b!996787 (= res!667019 (and (= (size!30840 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30840 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30840 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86058 res!667017) b!996787))

(assert (= (and b!996787 res!667019) b!996786))

(assert (= (and b!996786 res!667015) b!996781))

(assert (= (and b!996781 res!667023) b!996782))

(assert (= (and b!996782 res!667025) b!996779))

(assert (= (and b!996779 res!667020) b!996784))

(assert (= (and b!996784 res!667018) b!996778))

(assert (= (and b!996778 res!667022) b!996777))

(assert (= (and b!996777 res!667021) b!996785))

(assert (= (and b!996785 res!667024) b!996783))

(assert (= (and b!996783 res!667016) b!996780))

(declare-fun m!923251 () Bool)

(assert (=> start!86058 m!923251))

(declare-fun m!923253 () Bool)

(assert (=> start!86058 m!923253))

(declare-fun m!923255 () Bool)

(assert (=> b!996779 m!923255))

(declare-fun m!923257 () Bool)

(assert (=> b!996782 m!923257))

(declare-fun m!923259 () Bool)

(assert (=> b!996781 m!923259))

(declare-fun m!923261 () Bool)

(assert (=> b!996784 m!923261))

(declare-fun m!923263 () Bool)

(assert (=> b!996785 m!923263))

(assert (=> b!996785 m!923263))

(declare-fun m!923265 () Bool)

(assert (=> b!996785 m!923265))

(assert (=> b!996785 m!923265))

(assert (=> b!996785 m!923263))

(declare-fun m!923267 () Bool)

(assert (=> b!996785 m!923267))

(assert (=> b!996783 m!923263))

(assert (=> b!996783 m!923263))

(declare-fun m!923269 () Bool)

(assert (=> b!996783 m!923269))

(assert (=> b!996786 m!923263))

(assert (=> b!996786 m!923263))

(declare-fun m!923271 () Bool)

(assert (=> b!996786 m!923271))

(declare-fun m!923273 () Bool)

(assert (=> b!996778 m!923273))

(check-sat (not b!996783) (not b!996779) (not start!86058) (not b!996784) (not b!996781) (not b!996785) (not b!996786) (not b!996782) (not b!996778))
(check-sat)
