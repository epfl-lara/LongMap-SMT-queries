; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68940 () Bool)

(assert start!68940)

(declare-fun b!804182 () Bool)

(declare-fun res!548845 () Bool)

(declare-fun e!445498 () Bool)

(assert (=> b!804182 (=> (not res!548845) (not e!445498))))

(declare-datatypes ((array!43747 0))(
  ( (array!43748 (arr!20954 (Array (_ BitVec 32) (_ BitVec 64))) (size!21375 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43747)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804182 (= res!548845 (validKeyInArray!0 (select (arr!20954 a!3170) j!153)))))

(declare-fun res!548843 () Bool)

(assert (=> start!68940 (=> (not res!548843) (not e!445498))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68940 (= res!548843 (validMask!0 mask!3266))))

(assert (=> start!68940 e!445498))

(assert (=> start!68940 true))

(declare-fun array_inv!16837 (array!43747) Bool)

(assert (=> start!68940 (array_inv!16837 a!3170)))

(declare-fun b!804183 () Bool)

(declare-fun res!548842 () Bool)

(assert (=> b!804183 (=> (not res!548842) (not e!445498))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!804183 (= res!548842 (validKeyInArray!0 k0!2044))))

(declare-fun b!804184 () Bool)

(declare-fun res!548847 () Bool)

(assert (=> b!804184 (=> (not res!548847) (not e!445498))))

(declare-fun arrayContainsKey!0 (array!43747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804184 (= res!548847 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804185 () Bool)

(declare-fun res!548844 () Bool)

(declare-fun e!445497 () Bool)

(assert (=> b!804185 (=> (not res!548844) (not e!445497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43747 (_ BitVec 32)) Bool)

(assert (=> b!804185 (= res!548844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804186 () Bool)

(declare-fun res!548841 () Bool)

(assert (=> b!804186 (=> (not res!548841) (not e!445498))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804186 (= res!548841 (and (= (size!21375 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21375 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21375 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804187 () Bool)

(assert (=> b!804187 (= e!445497 false)))

(declare-fun lt!359912 () Bool)

(declare-datatypes ((List!14956 0))(
  ( (Nil!14953) (Cons!14952 (h!16081 (_ BitVec 64)) (t!21262 List!14956)) )
))
(declare-fun arrayNoDuplicates!0 (array!43747 (_ BitVec 32) List!14956) Bool)

(assert (=> b!804187 (= lt!359912 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14953))))

(declare-fun b!804188 () Bool)

(assert (=> b!804188 (= e!445498 e!445497)))

(declare-fun res!548846 () Bool)

(assert (=> b!804188 (=> (not res!548846) (not e!445497))))

(declare-datatypes ((SeekEntryResult!8542 0))(
  ( (MissingZero!8542 (index!36536 (_ BitVec 32))) (Found!8542 (index!36537 (_ BitVec 32))) (Intermediate!8542 (undefined!9354 Bool) (index!36538 (_ BitVec 32)) (x!67375 (_ BitVec 32))) (Undefined!8542) (MissingVacant!8542 (index!36539 (_ BitVec 32))) )
))
(declare-fun lt!359911 () SeekEntryResult!8542)

(assert (=> b!804188 (= res!548846 (or (= lt!359911 (MissingZero!8542 i!1163)) (= lt!359911 (MissingVacant!8542 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43747 (_ BitVec 32)) SeekEntryResult!8542)

(assert (=> b!804188 (= lt!359911 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68940 res!548843) b!804186))

(assert (= (and b!804186 res!548841) b!804182))

(assert (= (and b!804182 res!548845) b!804183))

(assert (= (and b!804183 res!548842) b!804184))

(assert (= (and b!804184 res!548847) b!804188))

(assert (= (and b!804188 res!548846) b!804185))

(assert (= (and b!804185 res!548844) b!804187))

(declare-fun m!745567 () Bool)

(assert (=> b!804188 m!745567))

(declare-fun m!745569 () Bool)

(assert (=> b!804184 m!745569))

(declare-fun m!745571 () Bool)

(assert (=> b!804185 m!745571))

(declare-fun m!745573 () Bool)

(assert (=> b!804182 m!745573))

(assert (=> b!804182 m!745573))

(declare-fun m!745575 () Bool)

(assert (=> b!804182 m!745575))

(declare-fun m!745577 () Bool)

(assert (=> b!804187 m!745577))

(declare-fun m!745579 () Bool)

(assert (=> start!68940 m!745579))

(declare-fun m!745581 () Bool)

(assert (=> start!68940 m!745581))

(declare-fun m!745583 () Bool)

(assert (=> b!804183 m!745583))

(check-sat (not b!804188) (not b!804184) (not start!68940) (not b!804187) (not b!804182) (not b!804185) (not b!804183))
(check-sat)
