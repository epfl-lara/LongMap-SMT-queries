; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25772 () Bool)

(assert start!25772)

(declare-fun b!267194 () Bool)

(declare-fun res!131464 () Bool)

(declare-fun e!172760 () Bool)

(assert (=> b!267194 (=> (not res!131464) (not e!172760))))

(declare-datatypes ((array!12946 0))(
  ( (array!12947 (arr!6127 (Array (_ BitVec 32) (_ BitVec 64))) (size!6479 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12946)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267194 (= res!131464 (and (= (size!6479 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6479 a!3436))))))

(declare-fun b!267195 () Bool)

(declare-fun res!131468 () Bool)

(assert (=> b!267195 (=> (not res!131468) (not e!172760))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267195 (= res!131468 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267196 () Bool)

(declare-fun e!172759 () Bool)

(assert (=> b!267196 (= e!172760 e!172759)))

(declare-fun res!131467 () Bool)

(assert (=> b!267196 (=> (not res!131467) (not e!172759))))

(declare-datatypes ((SeekEntryResult!1283 0))(
  ( (MissingZero!1283 (index!7302 (_ BitVec 32))) (Found!1283 (index!7303 (_ BitVec 32))) (Intermediate!1283 (undefined!2095 Bool) (index!7304 (_ BitVec 32)) (x!25704 (_ BitVec 32))) (Undefined!1283) (MissingVacant!1283 (index!7305 (_ BitVec 32))) )
))
(declare-fun lt!134699 () SeekEntryResult!1283)

(assert (=> b!267196 (= res!131467 (or (= lt!134699 (MissingZero!1283 i!1355)) (= lt!134699 (MissingVacant!1283 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12946 (_ BitVec 32)) SeekEntryResult!1283)

(assert (=> b!267196 (= lt!134699 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267197 () Bool)

(declare-fun res!131469 () Bool)

(assert (=> b!267197 (=> (not res!131469) (not e!172760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267197 (= res!131469 (validKeyInArray!0 k0!2698))))

(declare-fun b!267198 () Bool)

(declare-fun res!131466 () Bool)

(assert (=> b!267198 (=> (not res!131466) (not e!172759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12946 (_ BitVec 32)) Bool)

(assert (=> b!267198 (= res!131466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131465 () Bool)

(assert (=> start!25772 (=> (not res!131465) (not e!172760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25772 (= res!131465 (validMask!0 mask!4002))))

(assert (=> start!25772 e!172760))

(assert (=> start!25772 true))

(declare-fun array_inv!4077 (array!12946) Bool)

(assert (=> start!25772 (array_inv!4077 a!3436)))

(declare-fun b!267199 () Bool)

(assert (=> b!267199 (= e!172759 false)))

(declare-fun lt!134700 () Bool)

(declare-datatypes ((List!3854 0))(
  ( (Nil!3851) (Cons!3850 (h!4517 (_ BitVec 64)) (t!8928 List!3854)) )
))
(declare-fun arrayNoDuplicates!0 (array!12946 (_ BitVec 32) List!3854) Bool)

(assert (=> b!267199 (= lt!134700 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3851))))

(assert (= (and start!25772 res!131465) b!267194))

(assert (= (and b!267194 res!131464) b!267197))

(assert (= (and b!267197 res!131469) b!267195))

(assert (= (and b!267195 res!131468) b!267196))

(assert (= (and b!267196 res!131467) b!267198))

(assert (= (and b!267198 res!131466) b!267199))

(declare-fun m!283787 () Bool)

(assert (=> b!267199 m!283787))

(declare-fun m!283789 () Bool)

(assert (=> b!267195 m!283789))

(declare-fun m!283791 () Bool)

(assert (=> start!25772 m!283791))

(declare-fun m!283793 () Bool)

(assert (=> start!25772 m!283793))

(declare-fun m!283795 () Bool)

(assert (=> b!267197 m!283795))

(declare-fun m!283797 () Bool)

(assert (=> b!267196 m!283797))

(declare-fun m!283799 () Bool)

(assert (=> b!267198 m!283799))

(check-sat (not b!267195) (not b!267198) (not b!267196) (not b!267199) (not b!267197) (not start!25772))
(check-sat)
