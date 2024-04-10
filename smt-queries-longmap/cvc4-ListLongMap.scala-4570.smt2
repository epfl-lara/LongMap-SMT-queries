; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63722 () Bool)

(assert start!63722)

(declare-fun b!717185 () Bool)

(declare-fun res!479975 () Bool)

(declare-fun e!402664 () Bool)

(assert (=> b!717185 (=> (not res!479975) (not e!402664))))

(declare-datatypes ((array!40618 0))(
  ( (array!40619 (arr!19442 (Array (_ BitVec 32) (_ BitVec 64))) (size!19863 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40618)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717185 (= res!479975 (and (= (size!19863 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19863 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19863 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717187 () Bool)

(declare-fun res!479974 () Bool)

(assert (=> b!717187 (=> (not res!479974) (not e!402664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717187 (= res!479974 (validKeyInArray!0 (select (arr!19442 a!3186) j!159)))))

(declare-fun b!717188 () Bool)

(declare-fun res!479971 () Bool)

(assert (=> b!717188 (=> (not res!479971) (not e!402664))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717188 (= res!479971 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717189 () Bool)

(assert (=> b!717189 (= e!402664 false)))

(declare-datatypes ((SeekEntryResult!7042 0))(
  ( (MissingZero!7042 (index!30536 (_ BitVec 32))) (Found!7042 (index!30537 (_ BitVec 32))) (Intermediate!7042 (undefined!7854 Bool) (index!30538 (_ BitVec 32)) (x!61558 (_ BitVec 32))) (Undefined!7042) (MissingVacant!7042 (index!30539 (_ BitVec 32))) )
))
(declare-fun lt!319019 () SeekEntryResult!7042)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40618 (_ BitVec 32)) SeekEntryResult!7042)

(assert (=> b!717189 (= lt!319019 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717186 () Bool)

(declare-fun res!479972 () Bool)

(assert (=> b!717186 (=> (not res!479972) (not e!402664))))

(assert (=> b!717186 (= res!479972 (validKeyInArray!0 k!2102))))

(declare-fun res!479973 () Bool)

(assert (=> start!63722 (=> (not res!479973) (not e!402664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63722 (= res!479973 (validMask!0 mask!3328))))

(assert (=> start!63722 e!402664))

(declare-fun array_inv!15238 (array!40618) Bool)

(assert (=> start!63722 (array_inv!15238 a!3186)))

(assert (=> start!63722 true))

(assert (= (and start!63722 res!479973) b!717185))

(assert (= (and b!717185 res!479975) b!717187))

(assert (= (and b!717187 res!479974) b!717186))

(assert (= (and b!717186 res!479972) b!717188))

(assert (= (and b!717188 res!479971) b!717189))

(declare-fun m!673139 () Bool)

(assert (=> start!63722 m!673139))

(declare-fun m!673141 () Bool)

(assert (=> start!63722 m!673141))

(declare-fun m!673143 () Bool)

(assert (=> b!717188 m!673143))

(declare-fun m!673145 () Bool)

(assert (=> b!717186 m!673145))

(declare-fun m!673147 () Bool)

(assert (=> b!717187 m!673147))

(assert (=> b!717187 m!673147))

(declare-fun m!673149 () Bool)

(assert (=> b!717187 m!673149))

(declare-fun m!673151 () Bool)

(assert (=> b!717189 m!673151))

(push 1)

(assert (not b!717188))

(assert (not b!717186))

(assert (not b!717189))

(assert (not b!717187))

(assert (not start!63722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

