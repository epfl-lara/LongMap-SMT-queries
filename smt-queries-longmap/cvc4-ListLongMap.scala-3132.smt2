; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44092 () Bool)

(assert start!44092)

(declare-fun b!485902 () Bool)

(declare-fun e!286040 () Bool)

(assert (=> b!485902 (= e!286040 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31460 0))(
  ( (array!31461 (arr!15128 (Array (_ BitVec 32) (_ BitVec 64))) (size!15492 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31460)

(declare-datatypes ((SeekEntryResult!3595 0))(
  ( (MissingZero!3595 (index!16559 (_ BitVec 32))) (Found!3595 (index!16560 (_ BitVec 32))) (Intermediate!3595 (undefined!4407 Bool) (index!16561 (_ BitVec 32)) (x!45695 (_ BitVec 32))) (Undefined!3595) (MissingVacant!3595 (index!16562 (_ BitVec 32))) )
))
(declare-fun lt!219592 () SeekEntryResult!3595)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31460 (_ BitVec 32)) SeekEntryResult!3595)

(assert (=> b!485902 (= lt!219592 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485903 () Bool)

(declare-fun res!289505 () Bool)

(assert (=> b!485903 (=> (not res!289505) (not e!286040))))

(declare-fun arrayContainsKey!0 (array!31460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485903 (= res!289505 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485904 () Bool)

(declare-fun res!289508 () Bool)

(assert (=> b!485904 (=> (not res!289508) (not e!286040))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485904 (= res!289508 (and (= (size!15492 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15492 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15492 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289504 () Bool)

(assert (=> start!44092 (=> (not res!289504) (not e!286040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44092 (= res!289504 (validMask!0 mask!3524))))

(assert (=> start!44092 e!286040))

(assert (=> start!44092 true))

(declare-fun array_inv!10924 (array!31460) Bool)

(assert (=> start!44092 (array_inv!10924 a!3235)))

(declare-fun b!485905 () Bool)

(declare-fun res!289507 () Bool)

(assert (=> b!485905 (=> (not res!289507) (not e!286040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485905 (= res!289507 (validKeyInArray!0 k!2280))))

(declare-fun b!485906 () Bool)

(declare-fun res!289506 () Bool)

(assert (=> b!485906 (=> (not res!289506) (not e!286040))))

(assert (=> b!485906 (= res!289506 (validKeyInArray!0 (select (arr!15128 a!3235) j!176)))))

(assert (= (and start!44092 res!289504) b!485904))

(assert (= (and b!485904 res!289508) b!485906))

(assert (= (and b!485906 res!289506) b!485905))

(assert (= (and b!485905 res!289507) b!485903))

(assert (= (and b!485903 res!289505) b!485902))

(declare-fun m!465967 () Bool)

(assert (=> b!485906 m!465967))

(assert (=> b!485906 m!465967))

(declare-fun m!465969 () Bool)

(assert (=> b!485906 m!465969))

(declare-fun m!465971 () Bool)

(assert (=> b!485905 m!465971))

(declare-fun m!465973 () Bool)

(assert (=> b!485903 m!465973))

(declare-fun m!465975 () Bool)

(assert (=> b!485902 m!465975))

(declare-fun m!465977 () Bool)

(assert (=> start!44092 m!465977))

(declare-fun m!465979 () Bool)

(assert (=> start!44092 m!465979))

(push 1)

(assert (not b!485903))

(assert (not b!485905))

(assert (not b!485906))

(assert (not start!44092))

