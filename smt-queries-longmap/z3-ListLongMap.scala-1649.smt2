; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30660 () Bool)

(assert start!30660)

(declare-fun b!307899 () Bool)

(declare-fun e!192632 () Bool)

(assert (=> b!307899 (= e!192632 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151226 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307899 (= lt!151226 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!307900 () Bool)

(declare-fun res!164711 () Bool)

(declare-fun e!192633 () Bool)

(assert (=> b!307900 (=> (not res!164711) (not e!192633))))

(declare-datatypes ((array!15677 0))(
  ( (array!15678 (arr!7423 (Array (_ BitVec 32) (_ BitVec 64))) (size!7775 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15677)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15677 (_ BitVec 32)) Bool)

(assert (=> b!307900 (= res!164711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307901 () Bool)

(declare-fun res!164710 () Bool)

(assert (=> b!307901 (=> (not res!164710) (not e!192632))))

(declare-datatypes ((SeekEntryResult!2528 0))(
  ( (MissingZero!2528 (index!12288 (_ BitVec 32))) (Found!2528 (index!12289 (_ BitVec 32))) (Intermediate!2528 (undefined!3340 Bool) (index!12290 (_ BitVec 32)) (x!30632 (_ BitVec 32))) (Undefined!2528) (MissingVacant!2528 (index!12291 (_ BitVec 32))) )
))
(declare-fun lt!151227 () SeekEntryResult!2528)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15677 (_ BitVec 32)) SeekEntryResult!2528)

(assert (=> b!307901 (= res!164710 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151227))))

(declare-fun b!307902 () Bool)

(declare-fun res!164706 () Bool)

(assert (=> b!307902 (=> (not res!164706) (not e!192632))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307902 (= res!164706 (and (= (select (arr!7423 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7775 a!3293))))))

(declare-fun b!307903 () Bool)

(declare-fun res!164708 () Bool)

(assert (=> b!307903 (=> (not res!164708) (not e!192633))))

(assert (=> b!307903 (= res!164708 (and (= (size!7775 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7775 a!3293))))))

(declare-fun b!307904 () Bool)

(assert (=> b!307904 (= e!192633 e!192632)))

(declare-fun res!164709 () Bool)

(assert (=> b!307904 (=> (not res!164709) (not e!192632))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307904 (= res!164709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151227))))

(assert (=> b!307904 (= lt!151227 (Intermediate!2528 false resIndex!52 resX!52))))

(declare-fun res!164703 () Bool)

(assert (=> start!30660 (=> (not res!164703) (not e!192633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30660 (= res!164703 (validMask!0 mask!3709))))

(assert (=> start!30660 e!192633))

(declare-fun array_inv!5373 (array!15677) Bool)

(assert (=> start!30660 (array_inv!5373 a!3293)))

(assert (=> start!30660 true))

(declare-fun b!307905 () Bool)

(declare-fun res!164707 () Bool)

(assert (=> b!307905 (=> (not res!164707) (not e!192632))))

(assert (=> b!307905 (= res!164707 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7423 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307906 () Bool)

(declare-fun res!164705 () Bool)

(assert (=> b!307906 (=> (not res!164705) (not e!192633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307906 (= res!164705 (validKeyInArray!0 k0!2441))))

(declare-fun b!307907 () Bool)

(declare-fun res!164712 () Bool)

(assert (=> b!307907 (=> (not res!164712) (not e!192633))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15677 (_ BitVec 32)) SeekEntryResult!2528)

(assert (=> b!307907 (= res!164712 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2528 i!1240)))))

(declare-fun b!307908 () Bool)

(declare-fun res!164704 () Bool)

(assert (=> b!307908 (=> (not res!164704) (not e!192633))))

(declare-fun arrayContainsKey!0 (array!15677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307908 (= res!164704 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30660 res!164703) b!307903))

(assert (= (and b!307903 res!164708) b!307906))

(assert (= (and b!307906 res!164705) b!307908))

(assert (= (and b!307908 res!164704) b!307907))

(assert (= (and b!307907 res!164712) b!307900))

(assert (= (and b!307900 res!164711) b!307904))

(assert (= (and b!307904 res!164709) b!307902))

(assert (= (and b!307902 res!164706) b!307901))

(assert (= (and b!307901 res!164710) b!307905))

(assert (= (and b!307905 res!164707) b!307899))

(declare-fun m!318283 () Bool)

(assert (=> b!307904 m!318283))

(assert (=> b!307904 m!318283))

(declare-fun m!318285 () Bool)

(assert (=> b!307904 m!318285))

(declare-fun m!318287 () Bool)

(assert (=> b!307906 m!318287))

(declare-fun m!318289 () Bool)

(assert (=> b!307902 m!318289))

(declare-fun m!318291 () Bool)

(assert (=> b!307899 m!318291))

(declare-fun m!318293 () Bool)

(assert (=> b!307907 m!318293))

(declare-fun m!318295 () Bool)

(assert (=> b!307900 m!318295))

(declare-fun m!318297 () Bool)

(assert (=> b!307901 m!318297))

(declare-fun m!318299 () Bool)

(assert (=> b!307905 m!318299))

(declare-fun m!318301 () Bool)

(assert (=> b!307908 m!318301))

(declare-fun m!318303 () Bool)

(assert (=> start!30660 m!318303))

(declare-fun m!318305 () Bool)

(assert (=> start!30660 m!318305))

(check-sat (not b!307904) (not b!307899) (not b!307908) (not b!307907) (not b!307906) (not b!307900) (not b!307901) (not start!30660))
(check-sat)
