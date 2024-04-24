; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63750 () Bool)

(assert start!63750)

(declare-fun res!479893 () Bool)

(declare-fun e!402789 () Bool)

(assert (=> start!63750 (=> (not res!479893) (not e!402789))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63750 (= res!479893 (validMask!0 mask!3328))))

(assert (=> start!63750 e!402789))

(declare-datatypes ((array!40579 0))(
  ( (array!40580 (arr!19420 (Array (_ BitVec 32) (_ BitVec 64))) (size!19840 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40579)

(declare-fun array_inv!15279 (array!40579) Bool)

(assert (=> start!63750 (array_inv!15279 a!3186)))

(assert (=> start!63750 true))

(declare-fun b!717251 () Bool)

(declare-fun res!479889 () Bool)

(assert (=> b!717251 (=> (not res!479889) (not e!402789))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717251 (= res!479889 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717252 () Bool)

(assert (=> b!717252 (= e!402789 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!717253 () Bool)

(declare-fun res!479891 () Bool)

(assert (=> b!717253 (=> (not res!479891) (not e!402789))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717253 (= res!479891 (validKeyInArray!0 (select (arr!19420 a!3186) j!159)))))

(declare-fun b!717254 () Bool)

(declare-fun res!479888 () Bool)

(assert (=> b!717254 (=> (not res!479888) (not e!402789))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717254 (= res!479888 (and (= (size!19840 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19840 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19840 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717255 () Bool)

(declare-fun res!479890 () Bool)

(assert (=> b!717255 (=> (not res!479890) (not e!402789))))

(assert (=> b!717255 (= res!479890 (validKeyInArray!0 k0!2102))))

(declare-fun b!717256 () Bool)

(declare-fun res!479892 () Bool)

(assert (=> b!717256 (=> (not res!479892) (not e!402789))))

(declare-datatypes ((SeekEntryResult!6976 0))(
  ( (MissingZero!6976 (index!30272 (_ BitVec 32))) (Found!6976 (index!30273 (_ BitVec 32))) (Intermediate!6976 (undefined!7788 Bool) (index!30274 (_ BitVec 32)) (x!61455 (_ BitVec 32))) (Undefined!6976) (MissingVacant!6976 (index!30275 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40579 (_ BitVec 32)) SeekEntryResult!6976)

(assert (=> b!717256 (= res!479892 (not (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) (MissingZero!6976 i!1173))))))

(assert (= (and start!63750 res!479893) b!717254))

(assert (= (and b!717254 res!479888) b!717253))

(assert (= (and b!717253 res!479891) b!717255))

(assert (= (and b!717255 res!479890) b!717251))

(assert (= (and b!717251 res!479889) b!717256))

(assert (= (and b!717256 res!479892) b!717252))

(declare-fun m!673749 () Bool)

(assert (=> b!717256 m!673749))

(declare-fun m!673751 () Bool)

(assert (=> b!717255 m!673751))

(declare-fun m!673753 () Bool)

(assert (=> b!717251 m!673753))

(declare-fun m!673755 () Bool)

(assert (=> start!63750 m!673755))

(declare-fun m!673757 () Bool)

(assert (=> start!63750 m!673757))

(declare-fun m!673759 () Bool)

(assert (=> b!717253 m!673759))

(assert (=> b!717253 m!673759))

(declare-fun m!673761 () Bool)

(assert (=> b!717253 m!673761))

(check-sat (not start!63750) (not b!717255) (not b!717253) (not b!717256) (not b!717251))
(check-sat)
