; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86370 () Bool)

(assert start!86370)

(declare-fun b!999378 () Bool)

(declare-fun e!563471 () Bool)

(assert (=> b!999378 (= e!563471 false)))

(declare-datatypes ((array!63118 0))(
  ( (array!63119 (arr!30384 (Array (_ BitVec 32) (_ BitVec 64))) (size!30888 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63118)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9341 0))(
  ( (MissingZero!9341 (index!39735 (_ BitVec 32))) (Found!9341 (index!39736 (_ BitVec 32))) (Intermediate!9341 (undefined!10153 Bool) (index!39737 (_ BitVec 32)) (x!87188 (_ BitVec 32))) (Undefined!9341) (MissingVacant!9341 (index!39738 (_ BitVec 32))) )
))
(declare-fun lt!441837 () SeekEntryResult!9341)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63118 (_ BitVec 32)) SeekEntryResult!9341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999378 (= lt!441837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30384 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30384 a!3219) i!1194 k0!2224) j!170) (array!63119 (store (arr!30384 a!3219) i!1194 k0!2224) (size!30888 a!3219)) mask!3464))))

(declare-fun b!999379 () Bool)

(declare-fun e!563468 () Bool)

(assert (=> b!999379 (= e!563468 e!563471)))

(declare-fun res!668986 () Bool)

(assert (=> b!999379 (=> (not res!668986) (not e!563471))))

(declare-fun lt!441836 () SeekEntryResult!9341)

(assert (=> b!999379 (= res!668986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30384 a!3219) j!170) mask!3464) (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441836))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999379 (= lt!441836 (Intermediate!9341 false resIndex!38 resX!38))))

(declare-fun b!999380 () Bool)

(declare-fun res!668990 () Bool)

(declare-fun e!563469 () Bool)

(assert (=> b!999380 (=> (not res!668990) (not e!563469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999380 (= res!668990 (validKeyInArray!0 k0!2224))))

(declare-fun res!668984 () Bool)

(assert (=> start!86370 (=> (not res!668984) (not e!563469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86370 (= res!668984 (validMask!0 mask!3464))))

(assert (=> start!86370 e!563469))

(declare-fun array_inv!23527 (array!63118) Bool)

(assert (=> start!86370 (array_inv!23527 a!3219)))

(assert (=> start!86370 true))

(declare-fun b!999381 () Bool)

(declare-fun res!668985 () Bool)

(assert (=> b!999381 (=> (not res!668985) (not e!563468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63118 (_ BitVec 32)) Bool)

(assert (=> b!999381 (= res!668985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999382 () Bool)

(declare-fun res!668983 () Bool)

(assert (=> b!999382 (=> (not res!668983) (not e!563468))))

(declare-datatypes ((List!21126 0))(
  ( (Nil!21123) (Cons!21122 (h!22299 (_ BitVec 64)) (t!30118 List!21126)) )
))
(declare-fun arrayNoDuplicates!0 (array!63118 (_ BitVec 32) List!21126) Bool)

(assert (=> b!999382 (= res!668983 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21123))))

(declare-fun b!999383 () Bool)

(assert (=> b!999383 (= e!563469 e!563468)))

(declare-fun res!668981 () Bool)

(assert (=> b!999383 (=> (not res!668981) (not e!563468))))

(declare-fun lt!441838 () SeekEntryResult!9341)

(assert (=> b!999383 (= res!668981 (or (= lt!441838 (MissingVacant!9341 i!1194)) (= lt!441838 (MissingZero!9341 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63118 (_ BitVec 32)) SeekEntryResult!9341)

(assert (=> b!999383 (= lt!441838 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999384 () Bool)

(declare-fun res!668989 () Bool)

(assert (=> b!999384 (=> (not res!668989) (not e!563469))))

(declare-fun arrayContainsKey!0 (array!63118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999384 (= res!668989 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999385 () Bool)

(declare-fun res!668988 () Bool)

(assert (=> b!999385 (=> (not res!668988) (not e!563469))))

(assert (=> b!999385 (= res!668988 (and (= (size!30888 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30888 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30888 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999386 () Bool)

(declare-fun res!668987 () Bool)

(assert (=> b!999386 (=> (not res!668987) (not e!563468))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!999386 (= res!668987 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30888 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30888 a!3219))))))

(declare-fun b!999387 () Bool)

(declare-fun res!668980 () Bool)

(assert (=> b!999387 (=> (not res!668980) (not e!563471))))

(assert (=> b!999387 (= res!668980 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30384 a!3219) j!170) a!3219 mask!3464) lt!441836))))

(declare-fun b!999388 () Bool)

(declare-fun res!668982 () Bool)

(assert (=> b!999388 (=> (not res!668982) (not e!563469))))

(assert (=> b!999388 (= res!668982 (validKeyInArray!0 (select (arr!30384 a!3219) j!170)))))

(assert (= (and start!86370 res!668984) b!999385))

(assert (= (and b!999385 res!668988) b!999388))

(assert (= (and b!999388 res!668982) b!999380))

(assert (= (and b!999380 res!668990) b!999384))

(assert (= (and b!999384 res!668989) b!999383))

(assert (= (and b!999383 res!668981) b!999381))

(assert (= (and b!999381 res!668985) b!999382))

(assert (= (and b!999382 res!668983) b!999386))

(assert (= (and b!999386 res!668987) b!999379))

(assert (= (and b!999379 res!668986) b!999387))

(assert (= (and b!999387 res!668980) b!999378))

(declare-fun m!925093 () Bool)

(assert (=> b!999384 m!925093))

(declare-fun m!925095 () Bool)

(assert (=> b!999387 m!925095))

(assert (=> b!999387 m!925095))

(declare-fun m!925097 () Bool)

(assert (=> b!999387 m!925097))

(declare-fun m!925099 () Bool)

(assert (=> b!999378 m!925099))

(declare-fun m!925101 () Bool)

(assert (=> b!999378 m!925101))

(assert (=> b!999378 m!925101))

(declare-fun m!925103 () Bool)

(assert (=> b!999378 m!925103))

(assert (=> b!999378 m!925103))

(assert (=> b!999378 m!925101))

(declare-fun m!925105 () Bool)

(assert (=> b!999378 m!925105))

(declare-fun m!925107 () Bool)

(assert (=> b!999380 m!925107))

(declare-fun m!925109 () Bool)

(assert (=> b!999383 m!925109))

(assert (=> b!999388 m!925095))

(assert (=> b!999388 m!925095))

(declare-fun m!925111 () Bool)

(assert (=> b!999388 m!925111))

(declare-fun m!925113 () Bool)

(assert (=> start!86370 m!925113))

(declare-fun m!925115 () Bool)

(assert (=> start!86370 m!925115))

(declare-fun m!925117 () Bool)

(assert (=> b!999382 m!925117))

(declare-fun m!925119 () Bool)

(assert (=> b!999381 m!925119))

(assert (=> b!999379 m!925095))

(assert (=> b!999379 m!925095))

(declare-fun m!925121 () Bool)

(assert (=> b!999379 m!925121))

(assert (=> b!999379 m!925121))

(assert (=> b!999379 m!925095))

(declare-fun m!925123 () Bool)

(assert (=> b!999379 m!925123))

(check-sat (not start!86370) (not b!999379) (not b!999381) (not b!999387) (not b!999384) (not b!999380) (not b!999388) (not b!999378) (not b!999382) (not b!999383))
(check-sat)
