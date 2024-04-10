; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63716 () Bool)

(assert start!63716)

(declare-fun b!717140 () Bool)

(declare-fun res!479929 () Bool)

(declare-fun e!402646 () Bool)

(assert (=> b!717140 (=> (not res!479929) (not e!402646))))

(declare-datatypes ((array!40612 0))(
  ( (array!40613 (arr!19439 (Array (_ BitVec 32) (_ BitVec 64))) (size!19860 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40612)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717140 (= res!479929 (and (= (size!19860 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19860 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19860 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717141 () Bool)

(assert (=> b!717141 (= e!402646 false)))

(declare-fun k!2102 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7039 0))(
  ( (MissingZero!7039 (index!30524 (_ BitVec 32))) (Found!7039 (index!30525 (_ BitVec 32))) (Intermediate!7039 (undefined!7851 Bool) (index!30526 (_ BitVec 32)) (x!61547 (_ BitVec 32))) (Undefined!7039) (MissingVacant!7039 (index!30527 (_ BitVec 32))) )
))
(declare-fun lt!319010 () SeekEntryResult!7039)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40612 (_ BitVec 32)) SeekEntryResult!7039)

(assert (=> b!717141 (= lt!319010 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717142 () Bool)

(declare-fun res!479927 () Bool)

(assert (=> b!717142 (=> (not res!479927) (not e!402646))))

(declare-fun arrayContainsKey!0 (array!40612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717142 (= res!479927 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717143 () Bool)

(declare-fun res!479926 () Bool)

(assert (=> b!717143 (=> (not res!479926) (not e!402646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717143 (= res!479926 (validKeyInArray!0 (select (arr!19439 a!3186) j!159)))))

(declare-fun res!479928 () Bool)

(assert (=> start!63716 (=> (not res!479928) (not e!402646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63716 (= res!479928 (validMask!0 mask!3328))))

(assert (=> start!63716 e!402646))

(declare-fun array_inv!15235 (array!40612) Bool)

(assert (=> start!63716 (array_inv!15235 a!3186)))

(assert (=> start!63716 true))

(declare-fun b!717144 () Bool)

(declare-fun res!479930 () Bool)

(assert (=> b!717144 (=> (not res!479930) (not e!402646))))

(assert (=> b!717144 (= res!479930 (validKeyInArray!0 k!2102))))

(assert (= (and start!63716 res!479928) b!717140))

(assert (= (and b!717140 res!479929) b!717143))

(assert (= (and b!717143 res!479926) b!717144))

(assert (= (and b!717144 res!479930) b!717142))

(assert (= (and b!717142 res!479927) b!717141))

(declare-fun m!673097 () Bool)

(assert (=> b!717143 m!673097))

(assert (=> b!717143 m!673097))

(declare-fun m!673099 () Bool)

(assert (=> b!717143 m!673099))

(declare-fun m!673101 () Bool)

(assert (=> b!717144 m!673101))

(declare-fun m!673103 () Bool)

(assert (=> b!717142 m!673103))

(declare-fun m!673105 () Bool)

(assert (=> b!717141 m!673105))

(declare-fun m!673107 () Bool)

(assert (=> start!63716 m!673107))

(declare-fun m!673109 () Bool)

(assert (=> start!63716 m!673109))

(push 1)

(assert (not b!717144))

(assert (not start!63716))

(assert (not b!717142))

(assert (not b!717141))

(assert (not b!717143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

