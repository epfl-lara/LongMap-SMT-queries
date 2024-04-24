; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63778 () Bool)

(assert start!63778)

(declare-fun b!717468 () Bool)

(declare-fun res!480108 () Bool)

(declare-fun e!402873 () Bool)

(assert (=> b!717468 (=> (not res!480108) (not e!402873))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717468 (= res!480108 (validKeyInArray!0 k!2102))))

(declare-fun b!717469 () Bool)

(assert (=> b!717469 (= e!402873 false)))

(declare-datatypes ((array!40607 0))(
  ( (array!40608 (arr!19434 (Array (_ BitVec 32) (_ BitVec 64))) (size!19854 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40607)

(declare-datatypes ((SeekEntryResult!6990 0))(
  ( (MissingZero!6990 (index!30328 (_ BitVec 32))) (Found!6990 (index!30329 (_ BitVec 32))) (Intermediate!6990 (undefined!7802 Bool) (index!30330 (_ BitVec 32)) (x!61501 (_ BitVec 32))) (Undefined!6990) (MissingVacant!6990 (index!30331 (_ BitVec 32))) )
))
(declare-fun lt!319140 () SeekEntryResult!6990)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40607 (_ BitVec 32)) SeekEntryResult!6990)

(assert (=> b!717469 (= lt!319140 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717470 () Bool)

(declare-fun res!480105 () Bool)

(assert (=> b!717470 (=> (not res!480105) (not e!402873))))

(declare-fun arrayContainsKey!0 (array!40607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717470 (= res!480105 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717471 () Bool)

(declare-fun res!480107 () Bool)

(assert (=> b!717471 (=> (not res!480107) (not e!402873))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717471 (= res!480107 (validKeyInArray!0 (select (arr!19434 a!3186) j!159)))))

(declare-fun b!717472 () Bool)

(declare-fun res!480106 () Bool)

(assert (=> b!717472 (=> (not res!480106) (not e!402873))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717472 (= res!480106 (and (= (size!19854 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19854 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19854 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!480109 () Bool)

(assert (=> start!63778 (=> (not res!480109) (not e!402873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63778 (= res!480109 (validMask!0 mask!3328))))

(assert (=> start!63778 e!402873))

(declare-fun array_inv!15293 (array!40607) Bool)

(assert (=> start!63778 (array_inv!15293 a!3186)))

(assert (=> start!63778 true))

(assert (= (and start!63778 res!480109) b!717472))

(assert (= (and b!717472 res!480106) b!717471))

(assert (= (and b!717471 res!480107) b!717468))

(assert (= (and b!717468 res!480108) b!717470))

(assert (= (and b!717470 res!480105) b!717469))

(declare-fun m!673945 () Bool)

(assert (=> b!717469 m!673945))

(declare-fun m!673947 () Bool)

(assert (=> b!717470 m!673947))

(declare-fun m!673949 () Bool)

(assert (=> b!717471 m!673949))

(assert (=> b!717471 m!673949))

(declare-fun m!673951 () Bool)

(assert (=> b!717471 m!673951))

(declare-fun m!673953 () Bool)

(assert (=> start!63778 m!673953))

(declare-fun m!673955 () Bool)

(assert (=> start!63778 m!673955))

(declare-fun m!673957 () Bool)

(assert (=> b!717468 m!673957))

(push 1)

(assert (not b!717470))

(assert (not b!717469))

(assert (not b!717468))

(assert (not b!717471))

(assert (not start!63778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

