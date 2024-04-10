; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36440 () Bool)

(assert start!36440)

(declare-fun b!364377 () Bool)

(declare-fun e!223069 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364377 (= e!223069 (and (bvsgt from!3650 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvslt from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun res!203539 () Bool)

(assert (=> start!36440 (=> (not res!203539) (not e!223069))))

(declare-datatypes ((array!20720 0))(
  ( (array!20721 (arr!9839 (Array (_ BitVec 32) (_ BitVec 64))) (size!10191 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20720)

(assert (=> start!36440 (= res!203539 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10191 a!4289))))))

(assert (=> start!36440 e!223069))

(assert (=> start!36440 true))

(declare-fun array_inv!7281 (array!20720) Bool)

(assert (=> start!36440 (array_inv!7281 a!4289)))

(declare-fun b!364378 () Bool)

(declare-fun res!203541 () Bool)

(assert (=> b!364378 (=> (not res!203541) (not e!223069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364378 (= res!203541 (not (validKeyInArray!0 (select (arr!9839 a!4289) i!1472))))))

(declare-fun b!364379 () Bool)

(declare-fun res!203542 () Bool)

(assert (=> b!364379 (=> (not res!203542) (not e!223069))))

(assert (=> b!364379 (= res!203542 (and (bvslt (size!10191 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10191 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364380 () Bool)

(declare-fun res!203538 () Bool)

(assert (=> b!364380 (=> (not res!203538) (not e!223069))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20720 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364380 (= res!203538 (= (arrayCountValidKeys!0 (array!20721 (store (arr!9839 a!4289) i!1472 k0!2974) (size!10191 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364381 () Bool)

(declare-fun res!203540 () Bool)

(assert (=> b!364381 (=> (not res!203540) (not e!223069))))

(assert (=> b!364381 (= res!203540 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36440 res!203539) b!364378))

(assert (= (and b!364378 res!203541) b!364381))

(assert (= (and b!364381 res!203540) b!364379))

(assert (= (and b!364379 res!203542) b!364380))

(assert (= (and b!364380 res!203538) b!364377))

(declare-fun m!361885 () Bool)

(assert (=> start!36440 m!361885))

(declare-fun m!361887 () Bool)

(assert (=> b!364378 m!361887))

(assert (=> b!364378 m!361887))

(declare-fun m!361889 () Bool)

(assert (=> b!364378 m!361889))

(declare-fun m!361891 () Bool)

(assert (=> b!364380 m!361891))

(declare-fun m!361893 () Bool)

(assert (=> b!364380 m!361893))

(declare-fun m!361895 () Bool)

(assert (=> b!364380 m!361895))

(declare-fun m!361897 () Bool)

(assert (=> b!364381 m!361897))

(check-sat (not b!364378) (not start!36440) (not b!364381) (not b!364380))
(check-sat)
