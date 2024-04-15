; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116932 () Bool)

(assert start!116932)

(declare-fun res!920353 () Bool)

(declare-fun e!780366 () Bool)

(assert (=> start!116932 (=> (not res!920353) (not e!780366))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93555 0))(
  ( (array!93556 (arr!45181 (Array (_ BitVec 32) (_ BitVec 64))) (size!45733 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93555)

(assert (=> start!116932 (= res!920353 (and (bvslt (size!45733 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45733 a!4212))))))

(assert (=> start!116932 e!780366))

(declare-fun array_inv!34414 (array!93555) Bool)

(assert (=> start!116932 (array_inv!34414 a!4212)))

(assert (=> start!116932 true))

(declare-fun b!1377596 () Bool)

(declare-fun res!920354 () Bool)

(assert (=> b!1377596 (=> (not res!920354) (not e!780366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377596 (= res!920354 (not (validKeyInArray!0 (select (arr!45181 a!4212) to!375))))))

(declare-fun b!1377597 () Bool)

(assert (=> b!1377597 (= e!780366 (or (bvslt (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsgt to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(assert (= (and start!116932 res!920353) b!1377596))

(assert (= (and b!1377596 res!920354) b!1377597))

(declare-fun m!1261553 () Bool)

(assert (=> start!116932 m!1261553))

(declare-fun m!1261555 () Bool)

(assert (=> b!1377596 m!1261555))

(assert (=> b!1377596 m!1261555))

(declare-fun m!1261557 () Bool)

(assert (=> b!1377596 m!1261557))

(check-sat (not start!116932) (not b!1377596))
(check-sat)
