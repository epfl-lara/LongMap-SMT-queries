; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63712 () Bool)

(assert start!63712)

(declare-fun res!479889 () Bool)

(declare-fun e!402529 () Bool)

(assert (=> start!63712 (=> (not res!479889) (not e!402529))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63712 (= res!479889 (validMask!0 mask!3328))))

(assert (=> start!63712 e!402529))

(declare-datatypes ((array!40618 0))(
  ( (array!40619 (arr!19442 (Array (_ BitVec 32) (_ BitVec 64))) (size!19863 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40618)

(declare-fun array_inv!15325 (array!40618) Bool)

(assert (=> start!63712 (array_inv!15325 a!3186)))

(assert (=> start!63712 true))

(declare-fun b!716962 () Bool)

(declare-fun res!479892 () Bool)

(assert (=> b!716962 (=> (not res!479892) (not e!402529))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716962 (= res!479892 (validKeyInArray!0 k0!2102))))

(declare-fun b!716963 () Bool)

(declare-fun res!479890 () Bool)

(assert (=> b!716963 (=> (not res!479890) (not e!402529))))

(declare-fun arrayContainsKey!0 (array!40618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716963 (= res!479890 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716964 () Bool)

(declare-fun res!479888 () Bool)

(assert (=> b!716964 (=> (not res!479888) (not e!402529))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716964 (= res!479888 (and (= (size!19863 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19863 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19863 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716965 () Bool)

(declare-fun res!479891 () Bool)

(assert (=> b!716965 (=> (not res!479891) (not e!402529))))

(assert (=> b!716965 (= res!479891 (validKeyInArray!0 (select (arr!19442 a!3186) j!159)))))

(declare-fun b!716966 () Bool)

(declare-datatypes ((SeekEntryResult!7039 0))(
  ( (MissingZero!7039 (index!30524 (_ BitVec 32))) (Found!7039 (index!30525 (_ BitVec 32))) (Intermediate!7039 (undefined!7851 Bool) (index!30526 (_ BitVec 32)) (x!61558 (_ BitVec 32))) (Undefined!7039) (MissingVacant!7039 (index!30527 (_ BitVec 32))) )
))
(declare-fun lt!318782 () SeekEntryResult!7039)

(assert (=> b!716966 (= e!402529 (and (or (= lt!318782 (MissingZero!7039 i!1173)) (= lt!318782 (MissingVacant!7039 i!1173))) (bvsgt #b00000000000000000000000000000000 (size!19863 a!3186))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40618 (_ BitVec 32)) SeekEntryResult!7039)

(assert (=> b!716966 (= lt!318782 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!63712 res!479889) b!716964))

(assert (= (and b!716964 res!479888) b!716965))

(assert (= (and b!716965 res!479891) b!716962))

(assert (= (and b!716962 res!479892) b!716963))

(assert (= (and b!716963 res!479890) b!716966))

(declare-fun m!672453 () Bool)

(assert (=> b!716966 m!672453))

(declare-fun m!672455 () Bool)

(assert (=> b!716963 m!672455))

(declare-fun m!672457 () Bool)

(assert (=> b!716962 m!672457))

(declare-fun m!672459 () Bool)

(assert (=> start!63712 m!672459))

(declare-fun m!672461 () Bool)

(assert (=> start!63712 m!672461))

(declare-fun m!672463 () Bool)

(assert (=> b!716965 m!672463))

(assert (=> b!716965 m!672463))

(declare-fun m!672465 () Bool)

(assert (=> b!716965 m!672465))

(check-sat (not b!716965) (not b!716963) (not b!716962) (not b!716966) (not start!63712))
(check-sat)
