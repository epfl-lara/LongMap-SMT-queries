; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101838 () Bool)

(assert start!101838)

(declare-fun b!1226560 () Bool)

(declare-fun e!696583 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79177 0))(
  ( (array!79178 (arr!38214 (Array (_ BitVec 32) (_ BitVec 64))) (size!38750 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79177)

(assert (=> b!1226560 (= e!696583 (bvsgt from!3184 (size!38750 a!3806)))))

(declare-fun b!1226561 () Bool)

(declare-fun res!815213 () Bool)

(assert (=> b!1226561 (=> (not res!815213) (not e!696583))))

(declare-datatypes ((List!26987 0))(
  ( (Nil!26984) (Cons!26983 (h!28192 (_ BitVec 64)) (t!40450 List!26987)) )
))
(declare-fun acc!823 () List!26987)

(declare-fun contains!7049 (List!26987 (_ BitVec 64)) Bool)

(assert (=> b!1226561 (= res!815213 (not (contains!7049 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226562 () Bool)

(declare-fun res!815209 () Bool)

(assert (=> b!1226562 (=> (not res!815209) (not e!696583))))

(assert (=> b!1226562 (= res!815209 (not (contains!7049 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226563 () Bool)

(declare-fun res!815211 () Bool)

(assert (=> b!1226563 (=> (not res!815211) (not e!696583))))

(declare-fun noDuplicate!1646 (List!26987) Bool)

(assert (=> b!1226563 (= res!815211 (noDuplicate!1646 acc!823))))

(declare-fun b!1226564 () Bool)

(declare-fun res!815212 () Bool)

(assert (=> b!1226564 (=> (not res!815212) (not e!696583))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226564 (= res!815212 (validKeyInArray!0 k0!2913))))

(declare-fun b!1226565 () Bool)

(declare-fun res!815210 () Bool)

(assert (=> b!1226565 (=> (not res!815210) (not e!696583))))

(assert (=> b!1226565 (= res!815210 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38750 a!3806)) (bvslt from!3184 (size!38750 a!3806))))))

(declare-fun res!815214 () Bool)

(assert (=> start!101838 (=> (not res!815214) (not e!696583))))

(assert (=> start!101838 (= res!815214 (bvslt (size!38750 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101838 e!696583))

(declare-fun array_inv!29062 (array!79177) Bool)

(assert (=> start!101838 (array_inv!29062 a!3806)))

(assert (=> start!101838 true))

(declare-fun b!1226566 () Bool)

(declare-fun res!815208 () Bool)

(assert (=> b!1226566 (=> (not res!815208) (not e!696583))))

(declare-fun arrayContainsKey!0 (array!79177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226566 (= res!815208 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!101838 res!815214) b!1226564))

(assert (= (and b!1226564 res!815212) b!1226565))

(assert (= (and b!1226565 res!815210) b!1226563))

(assert (= (and b!1226563 res!815211) b!1226561))

(assert (= (and b!1226561 res!815213) b!1226562))

(assert (= (and b!1226562 res!815209) b!1226566))

(assert (= (and b!1226566 res!815208) b!1226560))

(declare-fun m!1131615 () Bool)

(assert (=> b!1226562 m!1131615))

(declare-fun m!1131617 () Bool)

(assert (=> start!101838 m!1131617))

(declare-fun m!1131619 () Bool)

(assert (=> b!1226566 m!1131619))

(declare-fun m!1131621 () Bool)

(assert (=> b!1226564 m!1131621))

(declare-fun m!1131623 () Bool)

(assert (=> b!1226563 m!1131623))

(declare-fun m!1131625 () Bool)

(assert (=> b!1226561 m!1131625))

(check-sat (not b!1226562) (not b!1226564) (not start!101838) (not b!1226561) (not b!1226566) (not b!1226563))
(check-sat)
