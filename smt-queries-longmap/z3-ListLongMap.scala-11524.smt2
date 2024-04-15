; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134130 () Bool)

(assert start!134130)

(declare-fun b!1567380 () Bool)

(declare-fun res!1071250 () Bool)

(declare-fun e!873700 () Bool)

(assert (=> b!1567380 (=> (not res!1071250) (not e!873700))))

(declare-datatypes ((List!36712 0))(
  ( (Nil!36709) (Cons!36708 (h!38156 (_ BitVec 64)) (t!51612 List!36712)) )
))
(declare-fun acc!619 () List!36712)

(declare-fun noDuplicate!2669 (List!36712) Bool)

(assert (=> b!1567380 (= res!1071250 (noDuplicate!2669 acc!619))))

(declare-datatypes ((array!104640 0))(
  ( (array!104641 (arr!50504 (Array (_ BitVec 32) (_ BitVec 64))) (size!51056 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104640)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!873699 () Bool)

(declare-fun b!1567381 () Bool)

(declare-fun contains!10328 (List!36712 (_ BitVec 64)) Bool)

(assert (=> b!1567381 (= e!873699 (not (contains!10328 acc!619 (select (arr!50504 a!3481) from!2856))))))

(declare-fun b!1567382 () Bool)

(declare-fun res!1071255 () Bool)

(assert (=> b!1567382 (=> (not res!1071255) (not e!873700))))

(assert (=> b!1567382 (= res!1071255 (not (contains!10328 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567383 () Bool)

(assert (=> b!1567383 (= e!873700 false)))

(declare-fun lt!672747 () Bool)

(assert (=> b!1567383 (= lt!672747 e!873699)))

(declare-fun res!1071254 () Bool)

(assert (=> b!1567383 (=> res!1071254 e!873699)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567383 (= res!1071254 (not (validKeyInArray!0 (select (arr!50504 a!3481) from!2856))))))

(declare-fun res!1071253 () Bool)

(assert (=> start!134130 (=> (not res!1071253) (not e!873700))))

(assert (=> start!134130 (= res!1071253 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51056 a!3481)) (bvslt (size!51056 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134130 e!873700))

(assert (=> start!134130 true))

(declare-fun array_inv!39440 (array!104640) Bool)

(assert (=> start!134130 (array_inv!39440 a!3481)))

(declare-fun b!1567384 () Bool)

(declare-fun res!1071252 () Bool)

(assert (=> b!1567384 (=> (not res!1071252) (not e!873700))))

(assert (=> b!1567384 (= res!1071252 (bvslt from!2856 (size!51056 a!3481)))))

(declare-fun b!1567385 () Bool)

(declare-fun res!1071251 () Bool)

(assert (=> b!1567385 (=> (not res!1071251) (not e!873700))))

(assert (=> b!1567385 (= res!1071251 (not (contains!10328 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134130 res!1071253) b!1567380))

(assert (= (and b!1567380 res!1071250) b!1567385))

(assert (= (and b!1567385 res!1071251) b!1567382))

(assert (= (and b!1567382 res!1071255) b!1567384))

(assert (= (and b!1567384 res!1071252) b!1567383))

(assert (= (and b!1567383 (not res!1071254)) b!1567381))

(declare-fun m!1441587 () Bool)

(assert (=> b!1567380 m!1441587))

(declare-fun m!1441589 () Bool)

(assert (=> b!1567385 m!1441589))

(declare-fun m!1441591 () Bool)

(assert (=> start!134130 m!1441591))

(declare-fun m!1441593 () Bool)

(assert (=> b!1567382 m!1441593))

(declare-fun m!1441595 () Bool)

(assert (=> b!1567383 m!1441595))

(assert (=> b!1567383 m!1441595))

(declare-fun m!1441597 () Bool)

(assert (=> b!1567383 m!1441597))

(assert (=> b!1567381 m!1441595))

(assert (=> b!1567381 m!1441595))

(declare-fun m!1441599 () Bool)

(assert (=> b!1567381 m!1441599))

(check-sat (not start!134130) (not b!1567382) (not b!1567383) (not b!1567385) (not b!1567381) (not b!1567380))
(check-sat)
