; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63772 () Bool)

(assert start!63772)

(declare-fun b!717423 () Bool)

(declare-fun e!402855 () Bool)

(assert (=> b!717423 (= e!402855 false)))

(declare-datatypes ((array!40601 0))(
  ( (array!40602 (arr!19431 (Array (_ BitVec 32) (_ BitVec 64))) (size!19851 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40601)

(declare-datatypes ((SeekEntryResult!6987 0))(
  ( (MissingZero!6987 (index!30316 (_ BitVec 32))) (Found!6987 (index!30317 (_ BitVec 32))) (Intermediate!6987 (undefined!7799 Bool) (index!30318 (_ BitVec 32)) (x!61490 (_ BitVec 32))) (Undefined!6987) (MissingVacant!6987 (index!30319 (_ BitVec 32))) )
))
(declare-fun lt!319131 () SeekEntryResult!6987)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40601 (_ BitVec 32)) SeekEntryResult!6987)

(assert (=> b!717423 (= lt!319131 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717424 () Bool)

(declare-fun res!480062 () Bool)

(assert (=> b!717424 (=> (not res!480062) (not e!402855))))

(declare-fun arrayContainsKey!0 (array!40601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717424 (= res!480062 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717425 () Bool)

(declare-fun res!480060 () Bool)

(assert (=> b!717425 (=> (not res!480060) (not e!402855))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717425 (= res!480060 (and (= (size!19851 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19851 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19851 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717426 () Bool)

(declare-fun res!480064 () Bool)

(assert (=> b!717426 (=> (not res!480064) (not e!402855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717426 (= res!480064 (validKeyInArray!0 k!2102))))

(declare-fun res!480063 () Bool)

(assert (=> start!63772 (=> (not res!480063) (not e!402855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63772 (= res!480063 (validMask!0 mask!3328))))

(assert (=> start!63772 e!402855))

(declare-fun array_inv!15290 (array!40601) Bool)

(assert (=> start!63772 (array_inv!15290 a!3186)))

(assert (=> start!63772 true))

(declare-fun b!717427 () Bool)

(declare-fun res!480061 () Bool)

(assert (=> b!717427 (=> (not res!480061) (not e!402855))))

(assert (=> b!717427 (= res!480061 (validKeyInArray!0 (select (arr!19431 a!3186) j!159)))))

(assert (= (and start!63772 res!480063) b!717425))

(assert (= (and b!717425 res!480060) b!717427))

(assert (= (and b!717427 res!480061) b!717426))

(assert (= (and b!717426 res!480064) b!717424))

(assert (= (and b!717424 res!480062) b!717423))

(declare-fun m!673903 () Bool)

(assert (=> b!717427 m!673903))

(assert (=> b!717427 m!673903))

(declare-fun m!673905 () Bool)

(assert (=> b!717427 m!673905))

(declare-fun m!673907 () Bool)

(assert (=> b!717423 m!673907))

(declare-fun m!673909 () Bool)

(assert (=> b!717426 m!673909))

(declare-fun m!673911 () Bool)

(assert (=> start!63772 m!673911))

(declare-fun m!673913 () Bool)

(assert (=> start!63772 m!673913))

(declare-fun m!673915 () Bool)

(assert (=> b!717424 m!673915))

(push 1)

(assert (not b!717426))

(assert (not b!717423))

(assert (not start!63772))

(assert (not b!717427))

(assert (not b!717424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

