; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25746 () Bool)

(assert start!25746)

(declare-fun res!131247 () Bool)

(declare-fun e!172635 () Bool)

(assert (=> start!25746 (=> (not res!131247) (not e!172635))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25746 (= res!131247 (validMask!0 mask!4002))))

(assert (=> start!25746 e!172635))

(assert (=> start!25746 true))

(declare-datatypes ((array!12925 0))(
  ( (array!12926 (arr!6117 (Array (_ BitVec 32) (_ BitVec 64))) (size!6469 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12925)

(declare-fun array_inv!4080 (array!12925) Bool)

(assert (=> start!25746 (array_inv!4080 a!3436)))

(declare-fun b!266949 () Bool)

(declare-fun res!131246 () Bool)

(assert (=> b!266949 (=> (not res!131246) (not e!172635))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266949 (= res!131246 (validKeyInArray!0 k0!2698))))

(declare-fun b!266950 () Bool)

(declare-fun res!131249 () Bool)

(assert (=> b!266950 (=> (not res!131249) (not e!172635))))

(declare-fun arrayContainsKey!0 (array!12925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266950 (= res!131249 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266951 () Bool)

(declare-fun res!131248 () Bool)

(declare-fun e!172637 () Bool)

(assert (=> b!266951 (=> (not res!131248) (not e!172637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12925 (_ BitVec 32)) Bool)

(assert (=> b!266951 (= res!131248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266952 () Bool)

(assert (=> b!266952 (= e!172637 false)))

(declare-fun lt!134574 () Bool)

(declare-datatypes ((List!3931 0))(
  ( (Nil!3928) (Cons!3927 (h!4594 (_ BitVec 64)) (t!9013 List!3931)) )
))
(declare-fun arrayNoDuplicates!0 (array!12925 (_ BitVec 32) List!3931) Bool)

(assert (=> b!266952 (= lt!134574 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3928))))

(declare-fun b!266953 () Bool)

(assert (=> b!266953 (= e!172635 e!172637)))

(declare-fun res!131250 () Bool)

(assert (=> b!266953 (=> (not res!131250) (not e!172637))))

(declare-datatypes ((SeekEntryResult!1308 0))(
  ( (MissingZero!1308 (index!7402 (_ BitVec 32))) (Found!1308 (index!7403 (_ BitVec 32))) (Intermediate!1308 (undefined!2120 Bool) (index!7404 (_ BitVec 32)) (x!25697 (_ BitVec 32))) (Undefined!1308) (MissingVacant!1308 (index!7405 (_ BitVec 32))) )
))
(declare-fun lt!134575 () SeekEntryResult!1308)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266953 (= res!131250 (or (= lt!134575 (MissingZero!1308 i!1355)) (= lt!134575 (MissingVacant!1308 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12925 (_ BitVec 32)) SeekEntryResult!1308)

(assert (=> b!266953 (= lt!134575 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266954 () Bool)

(declare-fun res!131245 () Bool)

(assert (=> b!266954 (=> (not res!131245) (not e!172635))))

(assert (=> b!266954 (= res!131245 (and (= (size!6469 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6469 a!3436))))))

(assert (= (and start!25746 res!131247) b!266954))

(assert (= (and b!266954 res!131245) b!266949))

(assert (= (and b!266949 res!131246) b!266950))

(assert (= (and b!266950 res!131249) b!266953))

(assert (= (and b!266953 res!131250) b!266951))

(assert (= (and b!266951 res!131248) b!266952))

(declare-fun m!283427 () Bool)

(assert (=> b!266950 m!283427))

(declare-fun m!283429 () Bool)

(assert (=> b!266951 m!283429))

(declare-fun m!283431 () Bool)

(assert (=> b!266949 m!283431))

(declare-fun m!283433 () Bool)

(assert (=> start!25746 m!283433))

(declare-fun m!283435 () Bool)

(assert (=> start!25746 m!283435))

(declare-fun m!283437 () Bool)

(assert (=> b!266952 m!283437))

(declare-fun m!283439 () Bool)

(assert (=> b!266953 m!283439))

(check-sat (not b!266949) (not b!266952) (not start!25746) (not b!266953) (not b!266950) (not b!266951))
(check-sat)
