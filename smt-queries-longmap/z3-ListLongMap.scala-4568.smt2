; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63708 () Bool)

(assert start!63708)

(declare-fun res!479867 () Bool)

(declare-fun e!402622 () Bool)

(assert (=> start!63708 (=> (not res!479867) (not e!402622))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63708 (= res!479867 (validMask!0 mask!3328))))

(assert (=> start!63708 e!402622))

(declare-datatypes ((array!40604 0))(
  ( (array!40605 (arr!19435 (Array (_ BitVec 32) (_ BitVec 64))) (size!19856 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40604)

(declare-fun array_inv!15231 (array!40604) Bool)

(assert (=> start!63708 (array_inv!15231 a!3186)))

(assert (=> start!63708 true))

(declare-fun b!717080 () Bool)

(assert (=> b!717080 (= e!402622 false)))

(declare-datatypes ((SeekEntryResult!7035 0))(
  ( (MissingZero!7035 (index!30508 (_ BitVec 32))) (Found!7035 (index!30509 (_ BitVec 32))) (Intermediate!7035 (undefined!7847 Bool) (index!30510 (_ BitVec 32)) (x!61535 (_ BitVec 32))) (Undefined!7035) (MissingVacant!7035 (index!30511 (_ BitVec 32))) )
))
(declare-fun lt!318998 () SeekEntryResult!7035)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40604 (_ BitVec 32)) SeekEntryResult!7035)

(assert (=> b!717080 (= lt!318998 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717081 () Bool)

(declare-fun res!479868 () Bool)

(assert (=> b!717081 (=> (not res!479868) (not e!402622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717081 (= res!479868 (validKeyInArray!0 k0!2102))))

(declare-fun b!717082 () Bool)

(declare-fun res!479869 () Bool)

(assert (=> b!717082 (=> (not res!479869) (not e!402622))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717082 (= res!479869 (and (= (size!19856 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19856 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19856 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717083 () Bool)

(declare-fun res!479866 () Bool)

(assert (=> b!717083 (=> (not res!479866) (not e!402622))))

(declare-fun arrayContainsKey!0 (array!40604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717083 (= res!479866 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717084 () Bool)

(declare-fun res!479870 () Bool)

(assert (=> b!717084 (=> (not res!479870) (not e!402622))))

(assert (=> b!717084 (= res!479870 (validKeyInArray!0 (select (arr!19435 a!3186) j!159)))))

(assert (= (and start!63708 res!479867) b!717082))

(assert (= (and b!717082 res!479869) b!717084))

(assert (= (and b!717084 res!479870) b!717081))

(assert (= (and b!717081 res!479868) b!717083))

(assert (= (and b!717083 res!479866) b!717080))

(declare-fun m!673041 () Bool)

(assert (=> b!717080 m!673041))

(declare-fun m!673043 () Bool)

(assert (=> start!63708 m!673043))

(declare-fun m!673045 () Bool)

(assert (=> start!63708 m!673045))

(declare-fun m!673047 () Bool)

(assert (=> b!717083 m!673047))

(declare-fun m!673049 () Bool)

(assert (=> b!717081 m!673049))

(declare-fun m!673051 () Bool)

(assert (=> b!717084 m!673051))

(assert (=> b!717084 m!673051))

(declare-fun m!673053 () Bool)

(assert (=> b!717084 m!673053))

(check-sat (not b!717081) (not b!717084) (not b!717083) (not b!717080) (not start!63708))
