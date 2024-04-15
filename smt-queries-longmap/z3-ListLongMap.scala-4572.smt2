; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63718 () Bool)

(assert start!63718)

(declare-fun res!479937 () Bool)

(declare-fun e!402548 () Bool)

(assert (=> start!63718 (=> (not res!479937) (not e!402548))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63718 (= res!479937 (validMask!0 mask!3328))))

(assert (=> start!63718 e!402548))

(declare-datatypes ((array!40624 0))(
  ( (array!40625 (arr!19445 (Array (_ BitVec 32) (_ BitVec 64))) (size!19866 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40624)

(declare-fun array_inv!15328 (array!40624) Bool)

(assert (=> start!63718 (array_inv!15328 a!3186)))

(assert (=> start!63718 true))

(declare-fun b!717011 () Bool)

(declare-fun e!402550 () Bool)

(assert (=> b!717011 (= e!402548 e!402550)))

(declare-fun res!479940 () Bool)

(assert (=> b!717011 (=> (not res!479940) (not e!402550))))

(declare-datatypes ((SeekEntryResult!7042 0))(
  ( (MissingZero!7042 (index!30536 (_ BitVec 32))) (Found!7042 (index!30537 (_ BitVec 32))) (Intermediate!7042 (undefined!7854 Bool) (index!30538 (_ BitVec 32)) (x!61569 (_ BitVec 32))) (Undefined!7042) (MissingVacant!7042 (index!30539 (_ BitVec 32))) )
))
(declare-fun lt!318791 () SeekEntryResult!7042)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717011 (= res!479940 (or (= lt!318791 (MissingZero!7042 i!1173)) (= lt!318791 (MissingVacant!7042 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40624 (_ BitVec 32)) SeekEntryResult!7042)

(assert (=> b!717011 (= lt!318791 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717012 () Bool)

(declare-fun res!479938 () Bool)

(assert (=> b!717012 (=> (not res!479938) (not e!402550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40624 (_ BitVec 32)) Bool)

(assert (=> b!717012 (= res!479938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717013 () Bool)

(declare-fun res!479939 () Bool)

(assert (=> b!717013 (=> (not res!479939) (not e!402548))))

(declare-fun arrayContainsKey!0 (array!40624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717013 (= res!479939 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717014 () Bool)

(declare-fun res!479942 () Bool)

(assert (=> b!717014 (=> (not res!479942) (not e!402548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717014 (= res!479942 (validKeyInArray!0 k0!2102))))

(declare-fun b!717015 () Bool)

(declare-fun res!479941 () Bool)

(assert (=> b!717015 (=> (not res!479941) (not e!402548))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717015 (= res!479941 (validKeyInArray!0 (select (arr!19445 a!3186) j!159)))))

(declare-fun b!717016 () Bool)

(declare-fun res!479943 () Bool)

(assert (=> b!717016 (=> (not res!479943) (not e!402548))))

(assert (=> b!717016 (= res!479943 (and (= (size!19866 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19866 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19866 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717017 () Bool)

(assert (=> b!717017 (= e!402550 (bvsgt #b00000000000000000000000000000000 (size!19866 a!3186)))))

(assert (= (and start!63718 res!479937) b!717016))

(assert (= (and b!717016 res!479943) b!717015))

(assert (= (and b!717015 res!479941) b!717014))

(assert (= (and b!717014 res!479942) b!717013))

(assert (= (and b!717013 res!479939) b!717011))

(assert (= (and b!717011 res!479940) b!717012))

(assert (= (and b!717012 res!479938) b!717017))

(declare-fun m!672495 () Bool)

(assert (=> b!717013 m!672495))

(declare-fun m!672497 () Bool)

(assert (=> start!63718 m!672497))

(declare-fun m!672499 () Bool)

(assert (=> start!63718 m!672499))

(declare-fun m!672501 () Bool)

(assert (=> b!717015 m!672501))

(assert (=> b!717015 m!672501))

(declare-fun m!672503 () Bool)

(assert (=> b!717015 m!672503))

(declare-fun m!672505 () Bool)

(assert (=> b!717012 m!672505))

(declare-fun m!672507 () Bool)

(assert (=> b!717014 m!672507))

(declare-fun m!672509 () Bool)

(assert (=> b!717011 m!672509))

(check-sat (not b!717013) (not b!717014) (not start!63718) (not b!717012) (not b!717011) (not b!717015))
(check-sat)
