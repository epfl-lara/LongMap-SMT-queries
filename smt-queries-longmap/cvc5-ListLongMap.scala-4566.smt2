; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63760 () Bool)

(assert start!63760)

(declare-fun res!479970 () Bool)

(declare-fun e!402819 () Bool)

(assert (=> start!63760 (=> (not res!479970) (not e!402819))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63760 (= res!479970 (validMask!0 mask!3328))))

(assert (=> start!63760 e!402819))

(declare-datatypes ((array!40589 0))(
  ( (array!40590 (arr!19425 (Array (_ BitVec 32) (_ BitVec 64))) (size!19845 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40589)

(declare-fun array_inv!15284 (array!40589) Bool)

(assert (=> start!63760 (array_inv!15284 a!3186)))

(assert (=> start!63760 true))

(declare-fun b!717333 () Bool)

(declare-fun res!479972 () Bool)

(assert (=> b!717333 (=> (not res!479972) (not e!402819))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717333 (= res!479972 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717334 () Bool)

(declare-fun res!479971 () Bool)

(assert (=> b!717334 (=> (not res!479971) (not e!402819))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717334 (= res!479971 (validKeyInArray!0 (select (arr!19425 a!3186) j!159)))))

(declare-fun b!717335 () Bool)

(declare-fun res!479974 () Bool)

(assert (=> b!717335 (=> (not res!479974) (not e!402819))))

(assert (=> b!717335 (= res!479974 (validKeyInArray!0 k!2102))))

(declare-fun b!717336 () Bool)

(assert (=> b!717336 (= e!402819 false)))

(declare-datatypes ((SeekEntryResult!6981 0))(
  ( (MissingZero!6981 (index!30292 (_ BitVec 32))) (Found!6981 (index!30293 (_ BitVec 32))) (Intermediate!6981 (undefined!7793 Bool) (index!30294 (_ BitVec 32)) (x!61468 (_ BitVec 32))) (Undefined!6981) (MissingVacant!6981 (index!30295 (_ BitVec 32))) )
))
(declare-fun lt!319113 () SeekEntryResult!6981)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40589 (_ BitVec 32)) SeekEntryResult!6981)

(assert (=> b!717336 (= lt!319113 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717337 () Bool)

(declare-fun res!479973 () Bool)

(assert (=> b!717337 (=> (not res!479973) (not e!402819))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717337 (= res!479973 (and (= (size!19845 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19845 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19845 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63760 res!479970) b!717337))

(assert (= (and b!717337 res!479973) b!717334))

(assert (= (and b!717334 res!479971) b!717335))

(assert (= (and b!717335 res!479974) b!717333))

(assert (= (and b!717333 res!479972) b!717336))

(declare-fun m!673819 () Bool)

(assert (=> b!717334 m!673819))

(assert (=> b!717334 m!673819))

(declare-fun m!673821 () Bool)

(assert (=> b!717334 m!673821))

(declare-fun m!673823 () Bool)

(assert (=> b!717336 m!673823))

(declare-fun m!673825 () Bool)

(assert (=> b!717333 m!673825))

(declare-fun m!673827 () Bool)

(assert (=> b!717335 m!673827))

(declare-fun m!673829 () Bool)

(assert (=> start!63760 m!673829))

(declare-fun m!673831 () Bool)

(assert (=> start!63760 m!673831))

(push 1)

(assert (not b!717334))

(assert (not b!717333))

(assert (not b!717336))

(assert (not b!717335))

(assert (not start!63760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

