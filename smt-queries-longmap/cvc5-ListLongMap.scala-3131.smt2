; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44082 () Bool)

(assert start!44082)

(declare-fun b!485827 () Bool)

(declare-fun res!289431 () Bool)

(declare-fun e!286010 () Bool)

(assert (=> b!485827 (=> (not res!289431) (not e!286010))))

(declare-datatypes ((array!31450 0))(
  ( (array!31451 (arr!15123 (Array (_ BitVec 32) (_ BitVec 64))) (size!15487 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31450)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485827 (= res!289431 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289433 () Bool)

(assert (=> start!44082 (=> (not res!289433) (not e!286010))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44082 (= res!289433 (validMask!0 mask!3524))))

(assert (=> start!44082 e!286010))

(assert (=> start!44082 true))

(declare-fun array_inv!10919 (array!31450) Bool)

(assert (=> start!44082 (array_inv!10919 a!3235)))

(declare-fun b!485828 () Bool)

(declare-fun res!289429 () Bool)

(assert (=> b!485828 (=> (not res!289429) (not e!286010))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485828 (= res!289429 (and (= (size!15487 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15487 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15487 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485829 () Bool)

(assert (=> b!485829 (= e!286010 false)))

(declare-datatypes ((SeekEntryResult!3590 0))(
  ( (MissingZero!3590 (index!16539 (_ BitVec 32))) (Found!3590 (index!16540 (_ BitVec 32))) (Intermediate!3590 (undefined!4402 Bool) (index!16541 (_ BitVec 32)) (x!45682 (_ BitVec 32))) (Undefined!3590) (MissingVacant!3590 (index!16542 (_ BitVec 32))) )
))
(declare-fun lt!219577 () SeekEntryResult!3590)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31450 (_ BitVec 32)) SeekEntryResult!3590)

(assert (=> b!485829 (= lt!219577 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485830 () Bool)

(declare-fun res!289430 () Bool)

(assert (=> b!485830 (=> (not res!289430) (not e!286010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485830 (= res!289430 (validKeyInArray!0 k!2280))))

(declare-fun b!485831 () Bool)

(declare-fun res!289432 () Bool)

(assert (=> b!485831 (=> (not res!289432) (not e!286010))))

(assert (=> b!485831 (= res!289432 (validKeyInArray!0 (select (arr!15123 a!3235) j!176)))))

(assert (= (and start!44082 res!289433) b!485828))

(assert (= (and b!485828 res!289429) b!485831))

(assert (= (and b!485831 res!289432) b!485830))

(assert (= (and b!485830 res!289430) b!485827))

(assert (= (and b!485827 res!289431) b!485829))

(declare-fun m!465897 () Bool)

(assert (=> b!485827 m!465897))

(declare-fun m!465899 () Bool)

(assert (=> start!44082 m!465899))

(declare-fun m!465901 () Bool)

(assert (=> start!44082 m!465901))

(declare-fun m!465903 () Bool)

(assert (=> b!485831 m!465903))

(assert (=> b!485831 m!465903))

(declare-fun m!465905 () Bool)

(assert (=> b!485831 m!465905))

(declare-fun m!465907 () Bool)

(assert (=> b!485829 m!465907))

(declare-fun m!465909 () Bool)

(assert (=> b!485830 m!465909))

(push 1)

(assert (not b!485830))

(assert (not b!485827))

(assert (not b!485829))

(assert (not start!44082))

(assert (not b!485831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

