; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25934 () Bool)

(assert start!25934)

(declare-fun res!132046 () Bool)

(declare-fun e!173087 () Bool)

(assert (=> start!25934 (=> (not res!132046) (not e!173087))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25934 (= res!132046 (validMask!0 mask!3868))))

(assert (=> start!25934 e!173087))

(declare-datatypes ((array!13031 0))(
  ( (array!13032 (arr!6165 (Array (_ BitVec 32) (_ BitVec 64))) (size!6517 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13031)

(declare-fun array_inv!4128 (array!13031) Bool)

(assert (=> start!25934 (array_inv!4128 a!3325)))

(assert (=> start!25934 true))

(declare-fun b!267768 () Bool)

(declare-fun res!132048 () Bool)

(assert (=> b!267768 (=> (not res!132048) (not e!173087))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267768 (= res!132048 (and (= (size!6517 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6517 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6517 a!3325))))))

(declare-fun b!267769 () Bool)

(declare-fun res!132047 () Bool)

(assert (=> b!267769 (=> (not res!132047) (not e!173087))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267769 (= res!132047 (validKeyInArray!0 k0!2581))))

(declare-fun b!267770 () Bool)

(assert (=> b!267770 (= e!173087 false)))

(declare-fun lt!134725 () Bool)

(declare-datatypes ((List!3973 0))(
  ( (Nil!3970) (Cons!3969 (h!4636 (_ BitVec 64)) (t!9055 List!3973)) )
))
(declare-fun arrayNoDuplicates!0 (array!13031 (_ BitVec 32) List!3973) Bool)

(assert (=> b!267770 (= lt!134725 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3970))))

(assert (= (and start!25934 res!132046) b!267768))

(assert (= (and b!267768 res!132048) b!267769))

(assert (= (and b!267769 res!132047) b!267770))

(declare-fun m!284051 () Bool)

(assert (=> start!25934 m!284051))

(declare-fun m!284053 () Bool)

(assert (=> start!25934 m!284053))

(declare-fun m!284055 () Bool)

(assert (=> b!267769 m!284055))

(declare-fun m!284057 () Bool)

(assert (=> b!267770 m!284057))

(check-sat (not start!25934) (not b!267769) (not b!267770))
