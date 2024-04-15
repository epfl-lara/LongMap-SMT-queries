; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64160 () Bool)

(assert start!64160)

(declare-fun res!482762 () Bool)

(declare-fun e!404077 () Bool)

(assert (=> start!64160 (=> (not res!482762) (not e!404077))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64160 (= res!482762 (validMask!0 mask!3328))))

(assert (=> start!64160 e!404077))

(assert (=> start!64160 true))

(declare-datatypes ((array!40815 0))(
  ( (array!40816 (arr!19532 (Array (_ BitVec 32) (_ BitVec 64))) (size!19953 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40815)

(declare-fun array_inv!15415 (array!40815) Bool)

(assert (=> start!64160 (array_inv!15415 a!3186)))

(declare-fun b!720493 () Bool)

(declare-fun res!482760 () Bool)

(declare-fun e!404074 () Bool)

(assert (=> b!720493 (=> (not res!482760) (not e!404074))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720493 (= res!482760 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19532 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!720494 () Bool)

(declare-fun e!404076 () Bool)

(declare-datatypes ((SeekEntryResult!7129 0))(
  ( (MissingZero!7129 (index!30884 (_ BitVec 32))) (Found!7129 (index!30885 (_ BitVec 32))) (Intermediate!7129 (undefined!7941 Bool) (index!30886 (_ BitVec 32)) (x!61900 (_ BitVec 32))) (Undefined!7129) (MissingVacant!7129 (index!30887 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40815 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720494 (= e!404076 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) (Found!7129 j!159)))))

(declare-fun b!720495 () Bool)

(declare-fun res!482756 () Bool)

(declare-fun e!404073 () Bool)

(assert (=> b!720495 (=> (not res!482756) (not e!404073))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720495 (= res!482756 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19953 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19953 a!3186))))))

(declare-fun b!720496 () Bool)

(assert (=> b!720496 (= e!404077 e!404073)))

(declare-fun res!482755 () Bool)

(assert (=> b!720496 (=> (not res!482755) (not e!404073))))

(declare-fun lt!319643 () SeekEntryResult!7129)

(assert (=> b!720496 (= res!482755 (or (= lt!319643 (MissingZero!7129 i!1173)) (= lt!319643 (MissingVacant!7129 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40815 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720496 (= lt!319643 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720497 () Bool)

(declare-fun res!482757 () Bool)

(assert (=> b!720497 (=> (not res!482757) (not e!404073))))

(declare-datatypes ((List!13573 0))(
  ( (Nil!13570) (Cons!13569 (h!14620 (_ BitVec 64)) (t!19879 List!13573)) )
))
(declare-fun arrayNoDuplicates!0 (array!40815 (_ BitVec 32) List!13573) Bool)

(assert (=> b!720497 (= res!482757 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13570))))

(declare-fun lt!319641 () SeekEntryResult!7129)

(declare-fun b!720498 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40815 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!720498 (= e!404076 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!319641))))

(declare-fun b!720499 () Bool)

(declare-fun res!482761 () Bool)

(assert (=> b!720499 (=> (not res!482761) (not e!404077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720499 (= res!482761 (validKeyInArray!0 k0!2102))))

(declare-fun b!720500 () Bool)

(declare-fun res!482765 () Bool)

(assert (=> b!720500 (=> (not res!482765) (not e!404077))))

(assert (=> b!720500 (= res!482765 (and (= (size!19953 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19953 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19953 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720501 () Bool)

(declare-fun res!482766 () Bool)

(assert (=> b!720501 (=> (not res!482766) (not e!404077))))

(assert (=> b!720501 (= res!482766 (validKeyInArray!0 (select (arr!19532 a!3186) j!159)))))

(declare-fun b!720502 () Bool)

(assert (=> b!720502 (= e!404073 e!404074)))

(declare-fun res!482763 () Bool)

(assert (=> b!720502 (=> (not res!482763) (not e!404074))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720502 (= res!482763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19532 a!3186) j!159) mask!3328) (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!319641))))

(assert (=> b!720502 (= lt!319641 (Intermediate!7129 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720503 () Bool)

(assert (=> b!720503 (= e!404074 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319642 () (_ BitVec 32))

(assert (=> b!720503 (= lt!319642 (toIndex!0 (select (store (arr!19532 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!720504 () Bool)

(declare-fun res!482759 () Bool)

(assert (=> b!720504 (=> (not res!482759) (not e!404077))))

(declare-fun arrayContainsKey!0 (array!40815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720504 (= res!482759 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720505 () Bool)

(declare-fun res!482764 () Bool)

(assert (=> b!720505 (=> (not res!482764) (not e!404074))))

(assert (=> b!720505 (= res!482764 e!404076)))

(declare-fun c!79239 () Bool)

(assert (=> b!720505 (= c!79239 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720506 () Bool)

(declare-fun res!482758 () Bool)

(assert (=> b!720506 (=> (not res!482758) (not e!404073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40815 (_ BitVec 32)) Bool)

(assert (=> b!720506 (= res!482758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64160 res!482762) b!720500))

(assert (= (and b!720500 res!482765) b!720501))

(assert (= (and b!720501 res!482766) b!720499))

(assert (= (and b!720499 res!482761) b!720504))

(assert (= (and b!720504 res!482759) b!720496))

(assert (= (and b!720496 res!482755) b!720506))

(assert (= (and b!720506 res!482758) b!720497))

(assert (= (and b!720497 res!482757) b!720495))

(assert (= (and b!720495 res!482756) b!720502))

(assert (= (and b!720502 res!482763) b!720493))

(assert (= (and b!720493 res!482760) b!720505))

(assert (= (and b!720505 c!79239) b!720498))

(assert (= (and b!720505 (not c!79239)) b!720494))

(assert (= (and b!720505 res!482764) b!720503))

(declare-fun m!675005 () Bool)

(assert (=> b!720498 m!675005))

(assert (=> b!720498 m!675005))

(declare-fun m!675007 () Bool)

(assert (=> b!720498 m!675007))

(assert (=> b!720494 m!675005))

(assert (=> b!720494 m!675005))

(declare-fun m!675009 () Bool)

(assert (=> b!720494 m!675009))

(declare-fun m!675011 () Bool)

(assert (=> b!720496 m!675011))

(declare-fun m!675013 () Bool)

(assert (=> b!720503 m!675013))

(declare-fun m!675015 () Bool)

(assert (=> b!720503 m!675015))

(assert (=> b!720503 m!675015))

(declare-fun m!675017 () Bool)

(assert (=> b!720503 m!675017))

(declare-fun m!675019 () Bool)

(assert (=> start!64160 m!675019))

(declare-fun m!675021 () Bool)

(assert (=> start!64160 m!675021))

(declare-fun m!675023 () Bool)

(assert (=> b!720493 m!675023))

(assert (=> b!720502 m!675005))

(assert (=> b!720502 m!675005))

(declare-fun m!675025 () Bool)

(assert (=> b!720502 m!675025))

(assert (=> b!720502 m!675025))

(assert (=> b!720502 m!675005))

(declare-fun m!675027 () Bool)

(assert (=> b!720502 m!675027))

(declare-fun m!675029 () Bool)

(assert (=> b!720506 m!675029))

(assert (=> b!720501 m!675005))

(assert (=> b!720501 m!675005))

(declare-fun m!675031 () Bool)

(assert (=> b!720501 m!675031))

(declare-fun m!675033 () Bool)

(assert (=> b!720497 m!675033))

(declare-fun m!675035 () Bool)

(assert (=> b!720504 m!675035))

(declare-fun m!675037 () Bool)

(assert (=> b!720499 m!675037))

(check-sat (not b!720506) (not b!720501) (not b!720502) (not start!64160) (not b!720497) (not b!720504) (not b!720496) (not b!720503) (not b!720494) (not b!720498) (not b!720499))
(check-sat)
