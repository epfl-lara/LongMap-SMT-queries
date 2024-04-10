; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63710 () Bool)

(assert start!63710)

(declare-fun b!717095 () Bool)

(declare-fun e!402629 () Bool)

(assert (=> b!717095 (= e!402629 false)))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!40606 0))(
  ( (array!40607 (arr!19436 (Array (_ BitVec 32) (_ BitVec 64))) (size!19857 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40606)

(declare-datatypes ((SeekEntryResult!7036 0))(
  ( (MissingZero!7036 (index!30512 (_ BitVec 32))) (Found!7036 (index!30513 (_ BitVec 32))) (Intermediate!7036 (undefined!7848 Bool) (index!30514 (_ BitVec 32)) (x!61536 (_ BitVec 32))) (Undefined!7036) (MissingVacant!7036 (index!30515 (_ BitVec 32))) )
))
(declare-fun lt!319001 () SeekEntryResult!7036)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40606 (_ BitVec 32)) SeekEntryResult!7036)

(assert (=> b!717095 (= lt!319001 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717096 () Bool)

(declare-fun res!479882 () Bool)

(assert (=> b!717096 (=> (not res!479882) (not e!402629))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717096 (= res!479882 (validKeyInArray!0 (select (arr!19436 a!3186) j!159)))))

(declare-fun b!717097 () Bool)

(declare-fun res!479883 () Bool)

(assert (=> b!717097 (=> (not res!479883) (not e!402629))))

(declare-fun arrayContainsKey!0 (array!40606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717097 (= res!479883 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717098 () Bool)

(declare-fun res!479881 () Bool)

(assert (=> b!717098 (=> (not res!479881) (not e!402629))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717098 (= res!479881 (and (= (size!19857 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19857 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19857 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717099 () Bool)

(declare-fun res!479885 () Bool)

(assert (=> b!717099 (=> (not res!479885) (not e!402629))))

(assert (=> b!717099 (= res!479885 (validKeyInArray!0 k!2102))))

(declare-fun res!479884 () Bool)

(assert (=> start!63710 (=> (not res!479884) (not e!402629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63710 (= res!479884 (validMask!0 mask!3328))))

(assert (=> start!63710 e!402629))

(declare-fun array_inv!15232 (array!40606) Bool)

(assert (=> start!63710 (array_inv!15232 a!3186)))

(assert (=> start!63710 true))

(assert (= (and start!63710 res!479884) b!717098))

(assert (= (and b!717098 res!479881) b!717096))

(assert (= (and b!717096 res!479882) b!717099))

(assert (= (and b!717099 res!479885) b!717097))

(assert (= (and b!717097 res!479883) b!717095))

(declare-fun m!673055 () Bool)

(assert (=> b!717095 m!673055))

(declare-fun m!673057 () Bool)

(assert (=> b!717099 m!673057))

(declare-fun m!673059 () Bool)

(assert (=> b!717096 m!673059))

(assert (=> b!717096 m!673059))

(declare-fun m!673061 () Bool)

(assert (=> b!717096 m!673061))

(declare-fun m!673063 () Bool)

(assert (=> start!63710 m!673063))

(declare-fun m!673065 () Bool)

(assert (=> start!63710 m!673065))

(declare-fun m!673067 () Bool)

(assert (=> b!717097 m!673067))

(push 1)

(assert (not b!717099))

(assert (not start!63710))

(assert (not b!717095))

(assert (not b!717096))

(assert (not b!717097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

