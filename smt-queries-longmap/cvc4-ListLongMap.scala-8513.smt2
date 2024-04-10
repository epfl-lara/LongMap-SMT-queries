; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103860 () Bool)

(assert start!103860)

(declare-fun res!828969 () Bool)

(declare-fun e!704833 () Bool)

(assert (=> start!103860 (=> (not res!828969) (not e!704833))))

(declare-datatypes ((array!79967 0))(
  ( (array!79968 (arr!38578 (Array (_ BitVec 32) (_ BitVec 64))) (size!39114 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79967)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103860 (= res!828969 (and (bvslt (size!39114 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39114 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39114 a!3892))))))

(assert (=> start!103860 e!704833))

(declare-fun array_inv!29426 (array!79967) Bool)

(assert (=> start!103860 (array_inv!29426 a!3892)))

(assert (=> start!103860 true))

(declare-fun b!1243191 () Bool)

(declare-fun res!828970 () Bool)

(assert (=> b!1243191 (=> (not res!828970) (not e!704833))))

(declare-datatypes ((List!27381 0))(
  ( (Nil!27378) (Cons!27377 (h!28586 (_ BitVec 64)) (t!40850 List!27381)) )
))
(declare-fun noDuplicate!1980 (List!27381) Bool)

(assert (=> b!1243191 (= res!828970 (noDuplicate!1980 Nil!27378))))

(declare-fun b!1243192 () Bool)

(declare-fun e!704834 () Bool)

(assert (=> b!1243192 (= e!704833 e!704834)))

(declare-fun res!828968 () Bool)

(assert (=> b!1243192 (=> res!828968 e!704834)))

(declare-fun contains!7402 (List!27381 (_ BitVec 64)) Bool)

(assert (=> b!1243192 (= res!828968 (contains!7402 Nil!27378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243193 () Bool)

(assert (=> b!1243193 (= e!704834 (contains!7402 Nil!27378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103860 res!828969) b!1243191))

(assert (= (and b!1243191 res!828970) b!1243192))

(assert (= (and b!1243192 (not res!828968)) b!1243193))

(declare-fun m!1145817 () Bool)

(assert (=> start!103860 m!1145817))

(declare-fun m!1145819 () Bool)

(assert (=> b!1243191 m!1145819))

(declare-fun m!1145821 () Bool)

(assert (=> b!1243192 m!1145821))

(declare-fun m!1145823 () Bool)

(assert (=> b!1243193 m!1145823))

(push 1)

(assert (not start!103860))

(assert (not b!1243192))

(assert (not b!1243193))

(assert (not b!1243191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137081 () Bool)

(assert (=> d!137081 (= (array_inv!29426 a!3892) (bvsge (size!39114 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103860 d!137081))

(declare-fun d!137083 () Bool)

(declare-fun lt!562330 () Bool)

(declare-fun content!610 (List!27381) (Set (_ BitVec 64)))

(assert (=> d!137083 (= lt!562330 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!610 Nil!27378)))))

(declare-fun e!704869 () Bool)

(assert (=> d!137083 (= lt!562330 e!704869)))

(declare-fun res!829003 () Bool)

(assert (=> d!137083 (=> (not res!829003) (not e!704869))))

(assert (=> d!137083 (= res!829003 (is-Cons!27377 Nil!27378))))

(assert (=> d!137083 (= (contains!7402 Nil!27378 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562330)))

(declare-fun b!1243226 () Bool)

(declare-fun e!704868 () Bool)

(assert (=> b!1243226 (= e!704869 e!704868)))

(declare-fun res!829004 () Bool)

(assert (=> b!1243226 (=> res!829004 e!704868)))

