; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63680 () Bool)

(assert start!63680)

(declare-fun b!716861 () Bool)

(declare-fun res!479648 () Bool)

(declare-fun e!402539 () Bool)

(assert (=> b!716861 (=> (not res!479648) (not e!402539))))

(declare-datatypes ((array!40576 0))(
  ( (array!40577 (arr!19421 (Array (_ BitVec 32) (_ BitVec 64))) (size!19842 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40576)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716861 (= res!479648 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716862 () Bool)

(declare-fun res!479650 () Bool)

(assert (=> b!716862 (=> (not res!479650) (not e!402539))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716862 (= res!479650 (validKeyInArray!0 (select (arr!19421 a!3186) j!159)))))

(declare-fun b!716863 () Bool)

(declare-fun res!479647 () Bool)

(assert (=> b!716863 (=> (not res!479647) (not e!402539))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716863 (= res!479647 (and (= (size!19842 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19842 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19842 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716865 () Bool)

(assert (=> b!716865 (= e!402539 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!716864 () Bool)

(declare-fun res!479649 () Bool)

(assert (=> b!716864 (=> (not res!479649) (not e!402539))))

(assert (=> b!716864 (= res!479649 (validKeyInArray!0 k!2102))))

(declare-fun res!479651 () Bool)

(assert (=> start!63680 (=> (not res!479651) (not e!402539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63680 (= res!479651 (validMask!0 mask!3328))))

(assert (=> start!63680 e!402539))

(declare-fun array_inv!15217 (array!40576) Bool)

(assert (=> start!63680 (array_inv!15217 a!3186)))

(assert (=> start!63680 true))

(assert (= (and start!63680 res!479651) b!716863))

(assert (= (and b!716863 res!479647) b!716862))

(assert (= (and b!716862 res!479650) b!716864))

(assert (= (and b!716864 res!479649) b!716861))

(assert (= (and b!716861 res!479648) b!716865))

(declare-fun m!672847 () Bool)

(assert (=> b!716861 m!672847))

(declare-fun m!672849 () Bool)

(assert (=> b!716862 m!672849))

(assert (=> b!716862 m!672849))

(declare-fun m!672851 () Bool)

(assert (=> b!716862 m!672851))

(declare-fun m!672853 () Bool)

(assert (=> b!716864 m!672853))

(declare-fun m!672855 () Bool)

(assert (=> start!63680 m!672855))

(declare-fun m!672857 () Bool)

(assert (=> start!63680 m!672857))

(push 1)

(assert (not b!716861))

(assert (not start!63680))

(assert (not b!716862))

(assert (not b!716864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

