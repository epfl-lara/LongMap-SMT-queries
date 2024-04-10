; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63704 () Bool)

(assert start!63704)

(declare-fun res!479837 () Bool)

(declare-fun e!402611 () Bool)

(assert (=> start!63704 (=> (not res!479837) (not e!402611))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63704 (= res!479837 (validMask!0 mask!3328))))

(assert (=> start!63704 e!402611))

(declare-datatypes ((array!40600 0))(
  ( (array!40601 (arr!19433 (Array (_ BitVec 32) (_ BitVec 64))) (size!19854 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40600)

(declare-fun array_inv!15229 (array!40600) Bool)

(assert (=> start!63704 (array_inv!15229 a!3186)))

(assert (=> start!63704 true))

(declare-fun b!717050 () Bool)

(assert (=> b!717050 (= e!402611 false)))

(declare-datatypes ((SeekEntryResult!7033 0))(
  ( (MissingZero!7033 (index!30500 (_ BitVec 32))) (Found!7033 (index!30501 (_ BitVec 32))) (Intermediate!7033 (undefined!7845 Bool) (index!30502 (_ BitVec 32)) (x!61525 (_ BitVec 32))) (Undefined!7033) (MissingVacant!7033 (index!30503 (_ BitVec 32))) )
))
(declare-fun lt!318992 () SeekEntryResult!7033)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40600 (_ BitVec 32)) SeekEntryResult!7033)

(assert (=> b!717050 (= lt!318992 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717051 () Bool)

(declare-fun res!479840 () Bool)

(assert (=> b!717051 (=> (not res!479840) (not e!402611))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717051 (= res!479840 (and (= (size!19854 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19854 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19854 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717052 () Bool)

(declare-fun res!479836 () Bool)

(assert (=> b!717052 (=> (not res!479836) (not e!402611))))

(declare-fun arrayContainsKey!0 (array!40600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717052 (= res!479836 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717053 () Bool)

(declare-fun res!479838 () Bool)

(assert (=> b!717053 (=> (not res!479838) (not e!402611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717053 (= res!479838 (validKeyInArray!0 (select (arr!19433 a!3186) j!159)))))

(declare-fun b!717054 () Bool)

(declare-fun res!479839 () Bool)

(assert (=> b!717054 (=> (not res!479839) (not e!402611))))

(assert (=> b!717054 (= res!479839 (validKeyInArray!0 k!2102))))

(assert (= (and start!63704 res!479837) b!717051))

(assert (= (and b!717051 res!479840) b!717053))

(assert (= (and b!717053 res!479838) b!717054))

(assert (= (and b!717054 res!479839) b!717052))

(assert (= (and b!717052 res!479836) b!717050))

(declare-fun m!673013 () Bool)

(assert (=> b!717053 m!673013))

(assert (=> b!717053 m!673013))

(declare-fun m!673015 () Bool)

(assert (=> b!717053 m!673015))

(declare-fun m!673017 () Bool)

(assert (=> b!717054 m!673017))

(declare-fun m!673019 () Bool)

(assert (=> start!63704 m!673019))

(declare-fun m!673021 () Bool)

(assert (=> start!63704 m!673021))

(declare-fun m!673023 () Bool)

(assert (=> b!717050 m!673023))

(declare-fun m!673025 () Bool)

(assert (=> b!717052 m!673025))

(push 1)

(assert (not b!717050))

(assert (not start!63704))

(assert (not b!717054))

(assert (not b!717052))

(assert (not b!717053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

