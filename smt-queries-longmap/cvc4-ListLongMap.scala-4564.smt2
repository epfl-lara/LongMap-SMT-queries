; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63686 () Bool)

(assert start!63686)

(declare-fun b!716906 () Bool)

(declare-fun res!479692 () Bool)

(declare-fun e!402557 () Bool)

(assert (=> b!716906 (=> (not res!479692) (not e!402557))))

(declare-datatypes ((array!40582 0))(
  ( (array!40583 (arr!19424 (Array (_ BitVec 32) (_ BitVec 64))) (size!19845 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40582)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716906 (= res!479692 (validKeyInArray!0 (select (arr!19424 a!3186) j!159)))))

(declare-fun b!716907 () Bool)

(declare-fun res!479696 () Bool)

(assert (=> b!716907 (=> (not res!479696) (not e!402557))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!716907 (= res!479696 (validKeyInArray!0 k!2102))))

(declare-fun b!716908 () Bool)

(declare-fun res!479695 () Bool)

(assert (=> b!716908 (=> (not res!479695) (not e!402557))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716908 (= res!479695 (and (= (size!19845 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19845 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19845 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716909 () Bool)

(declare-fun res!479694 () Bool)

(assert (=> b!716909 (=> (not res!479694) (not e!402557))))

(declare-fun arrayContainsKey!0 (array!40582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716909 (= res!479694 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!479693 () Bool)

(assert (=> start!63686 (=> (not res!479693) (not e!402557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63686 (= res!479693 (validMask!0 mask!3328))))

(assert (=> start!63686 e!402557))

(declare-fun array_inv!15220 (array!40582) Bool)

(assert (=> start!63686 (array_inv!15220 a!3186)))

(assert (=> start!63686 true))

(declare-fun b!716910 () Bool)

(assert (=> b!716910 (= e!402557 false)))

(declare-datatypes ((SeekEntryResult!7024 0))(
  ( (MissingZero!7024 (index!30464 (_ BitVec 32))) (Found!7024 (index!30465 (_ BitVec 32))) (Intermediate!7024 (undefined!7836 Bool) (index!30466 (_ BitVec 32)) (x!61492 (_ BitVec 32))) (Undefined!7024) (MissingVacant!7024 (index!30467 (_ BitVec 32))) )
))
(declare-fun lt!318974 () SeekEntryResult!7024)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40582 (_ BitVec 32)) SeekEntryResult!7024)

(assert (=> b!716910 (= lt!318974 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63686 res!479693) b!716908))

(assert (= (and b!716908 res!479695) b!716906))

(assert (= (and b!716906 res!479692) b!716907))

(assert (= (and b!716907 res!479696) b!716909))

(assert (= (and b!716909 res!479694) b!716910))

(declare-fun m!672887 () Bool)

(assert (=> b!716909 m!672887))

(declare-fun m!672889 () Bool)

(assert (=> b!716907 m!672889))

(declare-fun m!672891 () Bool)

(assert (=> b!716910 m!672891))

(declare-fun m!672893 () Bool)

(assert (=> b!716906 m!672893))

(assert (=> b!716906 m!672893))

(declare-fun m!672895 () Bool)

(assert (=> b!716906 m!672895))

(declare-fun m!672897 () Bool)

(assert (=> start!63686 m!672897))

(declare-fun m!672899 () Bool)

(assert (=> start!63686 m!672899))

(push 1)

(assert (not b!716910))

(assert (not b!716909))

(assert (not b!716906))

(assert (not start!63686))

(assert (not b!716907))

(check-sat)

(pop 1)

