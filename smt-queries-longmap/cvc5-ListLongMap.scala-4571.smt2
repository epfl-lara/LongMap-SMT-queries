; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63724 () Bool)

(assert start!63724)

(declare-fun b!717200 () Bool)

(declare-fun res!479989 () Bool)

(declare-fun e!402670 () Bool)

(assert (=> b!717200 (=> (not res!479989) (not e!402670))))

(declare-datatypes ((array!40620 0))(
  ( (array!40621 (arr!19443 (Array (_ BitVec 32) (_ BitVec 64))) (size!19864 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40620)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717200 (= res!479989 (and (= (size!19864 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19864 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19864 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717201 () Bool)

(declare-fun res!479990 () Bool)

(assert (=> b!717201 (=> (not res!479990) (not e!402670))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717201 (= res!479990 (validKeyInArray!0 k!2102))))

(declare-fun b!717202 () Bool)

(declare-fun res!479988 () Bool)

(assert (=> b!717202 (=> (not res!479988) (not e!402670))))

(declare-fun arrayContainsKey!0 (array!40620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717202 (= res!479988 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717203 () Bool)

(declare-fun res!479986 () Bool)

(assert (=> b!717203 (=> (not res!479986) (not e!402670))))

(assert (=> b!717203 (= res!479986 (validKeyInArray!0 (select (arr!19443 a!3186) j!159)))))

(declare-datatypes ((SeekEntryResult!7043 0))(
  ( (MissingZero!7043 (index!30540 (_ BitVec 32))) (Found!7043 (index!30541 (_ BitVec 32))) (Intermediate!7043 (undefined!7855 Bool) (index!30542 (_ BitVec 32)) (x!61567 (_ BitVec 32))) (Undefined!7043) (MissingVacant!7043 (index!30543 (_ BitVec 32))) )
))
(declare-fun lt!319022 () SeekEntryResult!7043)

(declare-fun b!717204 () Bool)

(assert (=> b!717204 (= e!402670 (and (or (= lt!319022 (MissingZero!7043 i!1173)) (= lt!319022 (MissingVacant!7043 i!1173))) (bvsgt #b00000000000000000000000000000000 (size!19864 a!3186))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40620 (_ BitVec 32)) SeekEntryResult!7043)

(assert (=> b!717204 (= lt!319022 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!479987 () Bool)

(assert (=> start!63724 (=> (not res!479987) (not e!402670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63724 (= res!479987 (validMask!0 mask!3328))))

(assert (=> start!63724 e!402670))

(declare-fun array_inv!15239 (array!40620) Bool)

(assert (=> start!63724 (array_inv!15239 a!3186)))

(assert (=> start!63724 true))

(assert (= (and start!63724 res!479987) b!717200))

(assert (= (and b!717200 res!479989) b!717203))

(assert (= (and b!717203 res!479986) b!717201))

(assert (= (and b!717201 res!479990) b!717202))

(assert (= (and b!717202 res!479988) b!717204))

(declare-fun m!673153 () Bool)

(assert (=> start!63724 m!673153))

(declare-fun m!673155 () Bool)

(assert (=> start!63724 m!673155))

(declare-fun m!673157 () Bool)

(assert (=> b!717203 m!673157))

(assert (=> b!717203 m!673157))

(declare-fun m!673159 () Bool)

(assert (=> b!717203 m!673159))

(declare-fun m!673161 () Bool)

(assert (=> b!717202 m!673161))

(declare-fun m!673163 () Bool)

(assert (=> b!717201 m!673163))

(declare-fun m!673165 () Bool)

(assert (=> b!717204 m!673165))

(push 1)

(assert (not b!717204))

(assert (not b!717203))

(assert (not start!63724))

(assert (not b!717202))

(assert (not b!717201))

(check-sat)

