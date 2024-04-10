; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31986 () Bool)

(assert start!31986)

(declare-fun b!319447 () Bool)

(declare-fun res!173829 () Bool)

(declare-fun e!198405 () Bool)

(assert (=> b!319447 (=> (not res!173829) (not e!198405))))

(declare-datatypes ((array!16293 0))(
  ( (array!16294 (arr!7710 (Array (_ BitVec 32) (_ BitVec 64))) (size!8062 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16293)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319447 (= res!173829 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319448 () Bool)

(assert (=> b!319448 (= e!198405 false)))

(declare-datatypes ((SeekEntryResult!2841 0))(
  ( (MissingZero!2841 (index!13540 (_ BitVec 32))) (Found!2841 (index!13541 (_ BitVec 32))) (Intermediate!2841 (undefined!3653 Bool) (index!13542 (_ BitVec 32)) (x!31819 (_ BitVec 32))) (Undefined!2841) (MissingVacant!2841 (index!13543 (_ BitVec 32))) )
))
(declare-fun lt!155802 () SeekEntryResult!2841)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16293 (_ BitVec 32)) SeekEntryResult!2841)

(assert (=> b!319448 (= lt!155802 (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777))))

(declare-fun res!173832 () Bool)

(assert (=> start!31986 (=> (not res!173832) (not e!198405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31986 (= res!173832 (validMask!0 mask!3777))))

(assert (=> start!31986 e!198405))

(assert (=> start!31986 true))

(declare-fun array_inv!5673 (array!16293) Bool)

(assert (=> start!31986 (array_inv!5673 a!3305)))

(declare-fun b!319445 () Bool)

(declare-fun res!173831 () Bool)

(assert (=> b!319445 (=> (not res!173831) (not e!198405))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319445 (= res!173831 (and (= (size!8062 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8062 a!3305))))))

(declare-fun b!319446 () Bool)

(declare-fun res!173830 () Bool)

(assert (=> b!319446 (=> (not res!173830) (not e!198405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319446 (= res!173830 (validKeyInArray!0 k0!2497))))

(assert (= (and start!31986 res!173832) b!319445))

(assert (= (and b!319445 res!173831) b!319446))

(assert (= (and b!319446 res!173830) b!319447))

(assert (= (and b!319447 res!173829) b!319448))

(declare-fun m!328047 () Bool)

(assert (=> b!319447 m!328047))

(declare-fun m!328049 () Bool)

(assert (=> b!319448 m!328049))

(declare-fun m!328051 () Bool)

(assert (=> start!31986 m!328051))

(declare-fun m!328053 () Bool)

(assert (=> start!31986 m!328053))

(declare-fun m!328055 () Bool)

(assert (=> b!319446 m!328055))

(check-sat (not b!319448) (not b!319446) (not b!319447) (not start!31986))
