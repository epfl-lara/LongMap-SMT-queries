; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63684 () Bool)

(assert start!63684)

(declare-fun b!716891 () Bool)

(declare-fun res!479681 () Bool)

(declare-fun e!402551 () Bool)

(assert (=> b!716891 (=> (not res!479681) (not e!402551))))

(declare-datatypes ((array!40580 0))(
  ( (array!40581 (arr!19423 (Array (_ BitVec 32) (_ BitVec 64))) (size!19844 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40580)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716891 (= res!479681 (and (= (size!19844 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19844 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19844 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716892 () Bool)

(declare-fun res!479678 () Bool)

(assert (=> b!716892 (=> (not res!479678) (not e!402551))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716892 (= res!479678 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716893 () Bool)

(assert (=> b!716893 (= e!402551 false)))

(declare-datatypes ((SeekEntryResult!7023 0))(
  ( (MissingZero!7023 (index!30460 (_ BitVec 32))) (Found!7023 (index!30461 (_ BitVec 32))) (Intermediate!7023 (undefined!7835 Bool) (index!30462 (_ BitVec 32)) (x!61491 (_ BitVec 32))) (Undefined!7023) (MissingVacant!7023 (index!30463 (_ BitVec 32))) )
))
(declare-fun lt!318971 () SeekEntryResult!7023)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40580 (_ BitVec 32)) SeekEntryResult!7023)

(assert (=> b!716893 (= lt!318971 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!716894 () Bool)

(declare-fun res!479679 () Bool)

(assert (=> b!716894 (=> (not res!479679) (not e!402551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716894 (= res!479679 (validKeyInArray!0 k0!2102))))

(declare-fun b!716895 () Bool)

(declare-fun res!479680 () Bool)

(assert (=> b!716895 (=> (not res!479680) (not e!402551))))

(assert (=> b!716895 (= res!479680 (validKeyInArray!0 (select (arr!19423 a!3186) j!159)))))

(declare-fun res!479677 () Bool)

(assert (=> start!63684 (=> (not res!479677) (not e!402551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63684 (= res!479677 (validMask!0 mask!3328))))

(assert (=> start!63684 e!402551))

(declare-fun array_inv!15219 (array!40580) Bool)

(assert (=> start!63684 (array_inv!15219 a!3186)))

(assert (=> start!63684 true))

(assert (= (and start!63684 res!479677) b!716891))

(assert (= (and b!716891 res!479681) b!716895))

(assert (= (and b!716895 res!479680) b!716894))

(assert (= (and b!716894 res!479679) b!716892))

(assert (= (and b!716892 res!479678) b!716893))

(declare-fun m!672873 () Bool)

(assert (=> b!716893 m!672873))

(declare-fun m!672875 () Bool)

(assert (=> b!716895 m!672875))

(assert (=> b!716895 m!672875))

(declare-fun m!672877 () Bool)

(assert (=> b!716895 m!672877))

(declare-fun m!672879 () Bool)

(assert (=> start!63684 m!672879))

(declare-fun m!672881 () Bool)

(assert (=> start!63684 m!672881))

(declare-fun m!672883 () Bool)

(assert (=> b!716894 m!672883))

(declare-fun m!672885 () Bool)

(assert (=> b!716892 m!672885))

(check-sat (not b!716895) (not b!716894) (not b!716893) (not start!63684) (not b!716892))
