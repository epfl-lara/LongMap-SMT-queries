; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63690 () Bool)

(assert start!63690)

(declare-fun b!716941 () Bool)

(declare-fun res!479727 () Bool)

(declare-fun e!402568 () Bool)

(assert (=> b!716941 (=> (not res!479727) (not e!402568))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40586 0))(
  ( (array!40587 (arr!19426 (Array (_ BitVec 32) (_ BitVec 64))) (size!19847 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40586)

(assert (=> b!716941 (= res!479727 (and (= (size!19847 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19847 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19847 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716942 () Bool)

(declare-fun res!479728 () Bool)

(assert (=> b!716942 (=> (not res!479728) (not e!402568))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7026 0))(
  ( (MissingZero!7026 (index!30472 (_ BitVec 32))) (Found!7026 (index!30473 (_ BitVec 32))) (Intermediate!7026 (undefined!7838 Bool) (index!30474 (_ BitVec 32)) (x!61502 (_ BitVec 32))) (Undefined!7026) (MissingVacant!7026 (index!30475 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40586 (_ BitVec 32)) SeekEntryResult!7026)

(assert (=> b!716942 (= res!479728 (not (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) (MissingZero!7026 i!1173))))))

(declare-fun b!716943 () Bool)

(declare-fun res!479732 () Bool)

(assert (=> b!716943 (=> (not res!479732) (not e!402568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716943 (= res!479732 (validKeyInArray!0 k0!2102))))

(declare-fun res!479731 () Bool)

(assert (=> start!63690 (=> (not res!479731) (not e!402568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63690 (= res!479731 (validMask!0 mask!3328))))

(assert (=> start!63690 e!402568))

(declare-fun array_inv!15222 (array!40586) Bool)

(assert (=> start!63690 (array_inv!15222 a!3186)))

(assert (=> start!63690 true))

(declare-fun b!716944 () Bool)

(declare-fun res!479730 () Bool)

(assert (=> b!716944 (=> (not res!479730) (not e!402568))))

(assert (=> b!716944 (= res!479730 (validKeyInArray!0 (select (arr!19426 a!3186) j!159)))))

(declare-fun b!716945 () Bool)

(assert (=> b!716945 (= e!402568 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!716946 () Bool)

(declare-fun res!479729 () Bool)

(assert (=> b!716946 (=> (not res!479729) (not e!402568))))

(declare-fun arrayContainsKey!0 (array!40586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716946 (= res!479729 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63690 res!479731) b!716941))

(assert (= (and b!716941 res!479727) b!716944))

(assert (= (and b!716944 res!479730) b!716943))

(assert (= (and b!716943 res!479732) b!716946))

(assert (= (and b!716946 res!479729) b!716942))

(assert (= (and b!716942 res!479728) b!716945))

(declare-fun m!672915 () Bool)

(assert (=> start!63690 m!672915))

(declare-fun m!672917 () Bool)

(assert (=> start!63690 m!672917))

(declare-fun m!672919 () Bool)

(assert (=> b!716944 m!672919))

(assert (=> b!716944 m!672919))

(declare-fun m!672921 () Bool)

(assert (=> b!716944 m!672921))

(declare-fun m!672923 () Bool)

(assert (=> b!716942 m!672923))

(declare-fun m!672925 () Bool)

(assert (=> b!716943 m!672925))

(declare-fun m!672927 () Bool)

(assert (=> b!716946 m!672927))

(check-sat (not b!716943) (not start!63690) (not b!716944) (not b!716946) (not b!716942))
(check-sat)
