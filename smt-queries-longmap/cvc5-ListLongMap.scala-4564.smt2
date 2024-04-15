; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63674 () Bool)

(assert start!63674)

(declare-fun b!716668 () Bool)

(declare-fun res!479595 () Bool)

(declare-fun e!402414 () Bool)

(assert (=> b!716668 (=> (not res!479595) (not e!402414))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716668 (= res!479595 (validKeyInArray!0 k!2102))))

(declare-fun b!716669 () Bool)

(declare-fun res!479594 () Bool)

(assert (=> b!716669 (=> (not res!479594) (not e!402414))))

(declare-datatypes ((array!40580 0))(
  ( (array!40581 (arr!19423 (Array (_ BitVec 32) (_ BitVec 64))) (size!19844 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40580)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716669 (= res!479594 (validKeyInArray!0 (select (arr!19423 a!3186) j!159)))))

(declare-fun res!479597 () Bool)

(assert (=> start!63674 (=> (not res!479597) (not e!402414))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63674 (= res!479597 (validMask!0 mask!3328))))

(assert (=> start!63674 e!402414))

(declare-fun array_inv!15306 (array!40580) Bool)

(assert (=> start!63674 (array_inv!15306 a!3186)))

(assert (=> start!63674 true))

(declare-fun b!716670 () Bool)

(declare-fun res!479598 () Bool)

(assert (=> b!716670 (=> (not res!479598) (not e!402414))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716670 (= res!479598 (and (= (size!19844 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19844 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19844 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716671 () Bool)

(declare-fun res!479596 () Bool)

(assert (=> b!716671 (=> (not res!479596) (not e!402414))))

(declare-fun arrayContainsKey!0 (array!40580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716671 (= res!479596 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716672 () Bool)

(assert (=> b!716672 (= e!402414 false)))

(declare-datatypes ((SeekEntryResult!7020 0))(
  ( (MissingZero!7020 (index!30448 (_ BitVec 32))) (Found!7020 (index!30449 (_ BitVec 32))) (Intermediate!7020 (undefined!7832 Bool) (index!30450 (_ BitVec 32)) (x!61483 (_ BitVec 32))) (Undefined!7020) (MissingVacant!7020 (index!30451 (_ BitVec 32))) )
))
(declare-fun lt!318734 () SeekEntryResult!7020)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40580 (_ BitVec 32)) SeekEntryResult!7020)

(assert (=> b!716672 (= lt!318734 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63674 res!479597) b!716670))

(assert (= (and b!716670 res!479598) b!716669))

(assert (= (and b!716669 res!479594) b!716668))

(assert (= (and b!716668 res!479595) b!716671))

(assert (= (and b!716671 res!479596) b!716672))

(declare-fun m!672187 () Bool)

(assert (=> b!716668 m!672187))

(declare-fun m!672189 () Bool)

(assert (=> b!716669 m!672189))

(assert (=> b!716669 m!672189))

(declare-fun m!672191 () Bool)

(assert (=> b!716669 m!672191))

(declare-fun m!672193 () Bool)

(assert (=> b!716672 m!672193))

(declare-fun m!672195 () Bool)

(assert (=> b!716671 m!672195))

(declare-fun m!672197 () Bool)

(assert (=> start!63674 m!672197))

(declare-fun m!672199 () Bool)

(assert (=> start!63674 m!672199))

(push 1)

(assert (not b!716668))

(assert (not b!716672))

(assert (not b!716671))

(assert (not start!63674))

(assert (not b!716669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

