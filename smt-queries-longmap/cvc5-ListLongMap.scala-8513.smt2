; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103856 () Bool)

(assert start!103856)

(declare-fun res!828952 () Bool)

(declare-fun e!704816 () Bool)

(assert (=> start!103856 (=> (not res!828952) (not e!704816))))

(declare-datatypes ((array!79963 0))(
  ( (array!79964 (arr!38576 (Array (_ BitVec 32) (_ BitVec 64))) (size!39112 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79963)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103856 (= res!828952 (and (bvslt (size!39112 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39112 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39112 a!3892))))))

(assert (=> start!103856 e!704816))

(declare-fun array_inv!29424 (array!79963) Bool)

(assert (=> start!103856 (array_inv!29424 a!3892)))

(assert (=> start!103856 true))

(declare-fun b!1243173 () Bool)

(declare-fun res!828950 () Bool)

(assert (=> b!1243173 (=> (not res!828950) (not e!704816))))

(declare-datatypes ((List!27379 0))(
  ( (Nil!27376) (Cons!27375 (h!28584 (_ BitVec 64)) (t!40848 List!27379)) )
))
(declare-fun noDuplicate!1978 (List!27379) Bool)

(assert (=> b!1243173 (= res!828950 (noDuplicate!1978 Nil!27376))))

(declare-fun b!1243174 () Bool)

(declare-fun e!704817 () Bool)

(assert (=> b!1243174 (= e!704816 e!704817)))

(declare-fun res!828951 () Bool)

(assert (=> b!1243174 (=> res!828951 e!704817)))

(declare-fun contains!7400 (List!27379 (_ BitVec 64)) Bool)

(assert (=> b!1243174 (= res!828951 (contains!7400 Nil!27376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243175 () Bool)

(assert (=> b!1243175 (= e!704817 (contains!7400 Nil!27376 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103856 res!828952) b!1243173))

(assert (= (and b!1243173 res!828950) b!1243174))

(assert (= (and b!1243174 (not res!828951)) b!1243175))

(declare-fun m!1145801 () Bool)

(assert (=> start!103856 m!1145801))

(declare-fun m!1145803 () Bool)

(assert (=> b!1243173 m!1145803))

(declare-fun m!1145805 () Bool)

(assert (=> b!1243174 m!1145805))

(declare-fun m!1145807 () Bool)

(assert (=> b!1243175 m!1145807))

(push 1)

(assert (not b!1243174))

(assert (not b!1243173))

(assert (not b!1243175))

(assert (not start!103856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137067 () Bool)

(declare-fun lt!562325 () Bool)

(declare-fun content!608 (List!27379) (Set (_ BitVec 64)))

(assert (=> d!137067 (= lt!562325 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!608 Nil!27376)))))

(declare-fun e!704846 () Bool)

(assert (=> d!137067 (= lt!562325 e!704846)))

(declare-fun res!828981 () Bool)

(assert (=> d!137067 (=> (not res!828981) (not e!704846))))

(assert (=> d!137067 (= res!828981 (is-Cons!27375 Nil!27376))))

(assert (=> d!137067 (= (contains!7400 Nil!27376 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562325)))

(declare-fun b!1243204 () Bool)

(declare-fun e!704847 () Bool)

(assert (=> b!1243204 (= e!704846 e!704847)))

(declare-fun res!828982 () Bool)

(assert (=> b!1243204 (=> res!828982 e!704847)))

(assert (=> b!1243204 (= res!828982 (= (h!28584 Nil!27376) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243205 () Bool)

(assert (=> b!1243205 (= e!704847 (contains!7400 (t!40848 Nil!27376) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137067 res!828981) b!1243204))

(assert (= (and b!1243204 (not res!828982)) b!1243205))

(declare-fun m!1145831 () Bool)

(assert (=> d!137067 m!1145831))

(declare-fun m!1145833 () Bool)

(assert (=> d!137067 m!1145833))

(declare-fun m!1145835 () Bool)

(assert (=> b!1243205 m!1145835))

(assert (=> b!1243174 d!137067))

(declare-fun d!137073 () Bool)

(declare-fun res!828991 () Bool)

(declare-fun e!704856 () Bool)

(assert (=> d!137073 (=> res!828991 e!704856)))

(assert (=> d!137073 (= res!828991 (is-Nil!27376 Nil!27376))))

(assert (=> d!137073 (= (noDuplicate!1978 Nil!27376) e!704856)))

(declare-fun b!1243214 () Bool)

(declare-fun e!704857 () Bool)

(assert (=> b!1243214 (= e!704856 e!704857)))

(declare-fun res!828992 () Bool)

(assert (=> b!1243214 (=> (not res!828992) (not e!704857))))

(assert (=> b!1243214 (= res!828992 (not (contains!7400 (t!40848 Nil!27376) (h!28584 Nil!27376))))))

(declare-fun b!1243215 () Bool)

(assert (=> b!1243215 (= e!704857 (noDuplicate!1978 (t!40848 Nil!27376)))))

(assert (= (and d!137073 (not res!828991)) b!1243214))

(assert (= (and b!1243214 res!828992) b!1243215))

(declare-fun m!1145837 () Bool)

(assert (=> b!1243214 m!1145837))

(declare-fun m!1145839 () Bool)

(assert (=> b!1243215 m!1145839))

(assert (=> b!1243173 d!137073))

(declare-fun d!137075 () Bool)

(declare-fun lt!562326 () Bool)

(assert (=> d!137075 (= lt!562326 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!608 Nil!27376)))))

(declare-fun e!704858 () Bool)

(assert (=> d!137075 (= lt!562326 e!704858)))

(declare-fun res!828993 () Bool)

(assert (=> d!137075 (=> (not res!828993) (not e!704858))))

(assert (=> d!137075 (= res!828993 (is-Cons!27375 Nil!27376))))

(assert (=> d!137075 (= (contains!7400 Nil!27376 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562326)))

(declare-fun b!1243216 () Bool)

(declare-fun e!704859 () Bool)

(assert (=> b!1243216 (= e!704858 e!704859)))

(declare-fun res!828994 () Bool)

(assert (=> b!1243216 (=> res!828994 e!704859)))

(assert (=> b!1243216 (= res!828994 (= (h!28584 Nil!27376) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1243217 () Bool)

(assert (=> b!1243217 (= e!704859 (contains!7400 (t!40848 Nil!27376) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137075 res!828993) b!1243216))

(assert (= (and b!1243216 (not res!828994)) b!1243217))

(assert (=> d!137075 m!1145831))

(declare-fun m!1145841 () Bool)

(assert (=> d!137075 m!1145841))

(declare-fun m!1145843 () Bool)

(assert (=> b!1243217 m!1145843))

(assert (=> b!1243175 d!137075))

(declare-fun d!137077 () Bool)

