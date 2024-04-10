; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63700 () Bool)

(assert start!63700)

(declare-fun b!717020 () Bool)

(declare-fun res!479807 () Bool)

(declare-fun e!402599 () Bool)

(assert (=> b!717020 (=> (not res!479807) (not e!402599))))

(declare-datatypes ((array!40596 0))(
  ( (array!40597 (arr!19431 (Array (_ BitVec 32) (_ BitVec 64))) (size!19852 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40596)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717020 (= res!479807 (validKeyInArray!0 (select (arr!19431 a!3186) j!159)))))

(declare-fun b!717021 () Bool)

(assert (=> b!717021 (= e!402599 false)))

(declare-datatypes ((SeekEntryResult!7031 0))(
  ( (MissingZero!7031 (index!30492 (_ BitVec 32))) (Found!7031 (index!30493 (_ BitVec 32))) (Intermediate!7031 (undefined!7843 Bool) (index!30494 (_ BitVec 32)) (x!61523 (_ BitVec 32))) (Undefined!7031) (MissingVacant!7031 (index!30495 (_ BitVec 32))) )
))
(declare-fun lt!318986 () SeekEntryResult!7031)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40596 (_ BitVec 32)) SeekEntryResult!7031)

(assert (=> b!717021 (= lt!318986 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717022 () Bool)

(declare-fun res!479806 () Bool)

(assert (=> b!717022 (=> (not res!479806) (not e!402599))))

(declare-fun arrayContainsKey!0 (array!40596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717022 (= res!479806 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717023 () Bool)

(declare-fun res!479810 () Bool)

(assert (=> b!717023 (=> (not res!479810) (not e!402599))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717023 (= res!479810 (and (= (size!19852 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19852 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19852 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717024 () Bool)

(declare-fun res!479808 () Bool)

(assert (=> b!717024 (=> (not res!479808) (not e!402599))))

(assert (=> b!717024 (= res!479808 (validKeyInArray!0 k!2102))))

(declare-fun res!479809 () Bool)

(assert (=> start!63700 (=> (not res!479809) (not e!402599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63700 (= res!479809 (validMask!0 mask!3328))))

(assert (=> start!63700 e!402599))

(declare-fun array_inv!15227 (array!40596) Bool)

(assert (=> start!63700 (array_inv!15227 a!3186)))

(assert (=> start!63700 true))

(assert (= (and start!63700 res!479809) b!717023))

(assert (= (and b!717023 res!479810) b!717020))

(assert (= (and b!717020 res!479807) b!717024))

(assert (= (and b!717024 res!479808) b!717022))

(assert (= (and b!717022 res!479806) b!717021))

(declare-fun m!672985 () Bool)

(assert (=> start!63700 m!672985))

(declare-fun m!672987 () Bool)

(assert (=> start!63700 m!672987))

(declare-fun m!672989 () Bool)

(assert (=> b!717020 m!672989))

(assert (=> b!717020 m!672989))

(declare-fun m!672991 () Bool)

(assert (=> b!717020 m!672991))

(declare-fun m!672993 () Bool)

(assert (=> b!717024 m!672993))

(declare-fun m!672995 () Bool)

(assert (=> b!717021 m!672995))

(declare-fun m!672997 () Bool)

(assert (=> b!717022 m!672997))

(push 1)

(assert (not b!717021))

(assert (not start!63700))

(assert (not b!717024))

(assert (not b!717022))

(assert (not b!717020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

