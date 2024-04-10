; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63688 () Bool)

(assert start!63688)

(declare-fun b!716923 () Bool)

(declare-fun res!479709 () Bool)

(declare-fun e!402562 () Bool)

(assert (=> b!716923 (=> (not res!479709) (not e!402562))))

(declare-datatypes ((array!40584 0))(
  ( (array!40585 (arr!19425 (Array (_ BitVec 32) (_ BitVec 64))) (size!19846 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40584)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716923 (= res!479709 (and (= (size!19846 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19846 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19846 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479713 () Bool)

(assert (=> start!63688 (=> (not res!479713) (not e!402562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63688 (= res!479713 (validMask!0 mask!3328))))

(assert (=> start!63688 e!402562))

(declare-fun array_inv!15221 (array!40584) Bool)

(assert (=> start!63688 (array_inv!15221 a!3186)))

(assert (=> start!63688 true))

(declare-fun b!716924 () Bool)

(declare-fun res!479714 () Bool)

(assert (=> b!716924 (=> (not res!479714) (not e!402562))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716924 (= res!479714 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716925 () Bool)

(assert (=> b!716925 (= e!402562 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!716926 () Bool)

(declare-fun res!479711 () Bool)

(assert (=> b!716926 (=> (not res!479711) (not e!402562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716926 (= res!479711 (validKeyInArray!0 k!2102))))

(declare-fun b!716927 () Bool)

(declare-fun res!479710 () Bool)

(assert (=> b!716927 (=> (not res!479710) (not e!402562))))

(assert (=> b!716927 (= res!479710 (validKeyInArray!0 (select (arr!19425 a!3186) j!159)))))

(declare-fun b!716928 () Bool)

(declare-fun res!479712 () Bool)

(assert (=> b!716928 (=> (not res!479712) (not e!402562))))

(declare-datatypes ((SeekEntryResult!7025 0))(
  ( (MissingZero!7025 (index!30468 (_ BitVec 32))) (Found!7025 (index!30469 (_ BitVec 32))) (Intermediate!7025 (undefined!7837 Bool) (index!30470 (_ BitVec 32)) (x!61501 (_ BitVec 32))) (Undefined!7025) (MissingVacant!7025 (index!30471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40584 (_ BitVec 32)) SeekEntryResult!7025)

(assert (=> b!716928 (= res!479712 (not (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) (MissingZero!7025 i!1173))))))

(assert (= (and start!63688 res!479713) b!716923))

(assert (= (and b!716923 res!479709) b!716927))

(assert (= (and b!716927 res!479710) b!716926))

(assert (= (and b!716926 res!479711) b!716924))

(assert (= (and b!716924 res!479714) b!716928))

(assert (= (and b!716928 res!479712) b!716925))

(declare-fun m!672901 () Bool)

(assert (=> b!716927 m!672901))

(assert (=> b!716927 m!672901))

(declare-fun m!672903 () Bool)

(assert (=> b!716927 m!672903))

(declare-fun m!672905 () Bool)

(assert (=> b!716924 m!672905))

(declare-fun m!672907 () Bool)

(assert (=> b!716926 m!672907))

(declare-fun m!672909 () Bool)

(assert (=> start!63688 m!672909))

(declare-fun m!672911 () Bool)

(assert (=> start!63688 m!672911))

(declare-fun m!672913 () Bool)

(assert (=> b!716928 m!672913))

(push 1)

(assert (not b!716927))

(assert (not b!716928))

(assert (not b!716926))

(assert (not b!716924))

(assert (not start!63688))

(check-sat)

