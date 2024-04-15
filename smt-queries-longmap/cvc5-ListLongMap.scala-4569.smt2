; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63704 () Bool)

(assert start!63704)

(declare-fun b!716902 () Bool)

(declare-fun res!479831 () Bool)

(declare-fun e!402505 () Bool)

(assert (=> b!716902 (=> (not res!479831) (not e!402505))))

(declare-datatypes ((array!40610 0))(
  ( (array!40611 (arr!19438 (Array (_ BitVec 32) (_ BitVec 64))) (size!19859 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40610)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716902 (= res!479831 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!479830 () Bool)

(assert (=> start!63704 (=> (not res!479830) (not e!402505))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63704 (= res!479830 (validMask!0 mask!3328))))

(assert (=> start!63704 e!402505))

(declare-fun array_inv!15321 (array!40610) Bool)

(assert (=> start!63704 (array_inv!15321 a!3186)))

(assert (=> start!63704 true))

(declare-fun b!716903 () Bool)

(declare-fun res!479832 () Bool)

(assert (=> b!716903 (=> (not res!479832) (not e!402505))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716903 (= res!479832 (validKeyInArray!0 (select (arr!19438 a!3186) j!159)))))

(declare-fun b!716904 () Bool)

(declare-fun res!479828 () Bool)

(assert (=> b!716904 (=> (not res!479828) (not e!402505))))

(assert (=> b!716904 (= res!479828 (validKeyInArray!0 k!2102))))

(declare-fun b!716905 () Bool)

(declare-fun res!479829 () Bool)

(assert (=> b!716905 (=> (not res!479829) (not e!402505))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716905 (= res!479829 (and (= (size!19859 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19859 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19859 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716906 () Bool)

(assert (=> b!716906 (= e!402505 false)))

(declare-datatypes ((SeekEntryResult!7035 0))(
  ( (MissingZero!7035 (index!30508 (_ BitVec 32))) (Found!7035 (index!30509 (_ BitVec 32))) (Intermediate!7035 (undefined!7847 Bool) (index!30510 (_ BitVec 32)) (x!61538 (_ BitVec 32))) (Undefined!7035) (MissingVacant!7035 (index!30511 (_ BitVec 32))) )
))
(declare-fun lt!318770 () SeekEntryResult!7035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40610 (_ BitVec 32)) SeekEntryResult!7035)

(assert (=> b!716906 (= lt!318770 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!63704 res!479830) b!716905))

(assert (= (and b!716905 res!479829) b!716903))

(assert (= (and b!716903 res!479832) b!716904))

(assert (= (and b!716904 res!479828) b!716902))

(assert (= (and b!716902 res!479831) b!716906))

(declare-fun m!672397 () Bool)

(assert (=> b!716902 m!672397))

(declare-fun m!672399 () Bool)

(assert (=> b!716906 m!672399))

(declare-fun m!672401 () Bool)

(assert (=> b!716903 m!672401))

(assert (=> b!716903 m!672401))

(declare-fun m!672403 () Bool)

(assert (=> b!716903 m!672403))

(declare-fun m!672405 () Bool)

(assert (=> b!716904 m!672405))

(declare-fun m!672407 () Bool)

(assert (=> start!63704 m!672407))

(declare-fun m!672409 () Bool)

(assert (=> start!63704 m!672409))

(push 1)

(assert (not b!716902))

(assert (not start!63704))

(assert (not b!716903))

(assert (not b!716904))

(assert (not b!716906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

