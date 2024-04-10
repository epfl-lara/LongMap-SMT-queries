; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118162 () Bool)

(assert start!118162)

(declare-fun res!924461 () Bool)

(declare-fun e!783783 () Bool)

(assert (=> start!118162 (=> (not res!924461) (not e!783783))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118162 (= res!924461 (validMask!0 mask!2987))))

(assert (=> start!118162 e!783783))

(assert (=> start!118162 true))

(declare-datatypes ((array!94492 0))(
  ( (array!94493 (arr!45625 (Array (_ BitVec 32) (_ BitVec 64))) (size!46175 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94492)

(declare-fun array_inv!34653 (array!94492) Bool)

(assert (=> start!118162 (array_inv!34653 a!2938)))

(declare-fun b!1382869 () Bool)

(declare-fun res!924463 () Bool)

(assert (=> b!1382869 (=> (not res!924463) (not e!783783))))

(assert (=> b!1382869 (= res!924463 (and (bvsle #b00000000000000000000000000000000 (size!46175 a!2938)) (bvslt (size!46175 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1382870 () Bool)

(declare-fun res!924466 () Bool)

(assert (=> b!1382870 (=> (not res!924466) (not e!783783))))

(declare-datatypes ((List!32153 0))(
  ( (Nil!32150) (Cons!32149 (h!33358 (_ BitVec 64)) (t!46847 List!32153)) )
))
(declare-fun noDuplicate!2599 (List!32153) Bool)

(assert (=> b!1382870 (= res!924466 (noDuplicate!2599 Nil!32150))))

(declare-fun b!1382871 () Bool)

(declare-fun res!924465 () Bool)

(assert (=> b!1382871 (=> (not res!924465) (not e!783783))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382871 (= res!924465 (validKeyInArray!0 (select (arr!45625 a!2938) i!1065)))))

(declare-fun b!1382872 () Bool)

(declare-fun res!924462 () Bool)

(assert (=> b!1382872 (=> (not res!924462) (not e!783783))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382872 (= res!924462 (and (= (size!46175 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46175 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46175 a!2938))))))

(declare-fun b!1382873 () Bool)

(declare-fun e!783784 () Bool)

(assert (=> b!1382873 (= e!783783 e!783784)))

(declare-fun res!924464 () Bool)

(assert (=> b!1382873 (=> res!924464 e!783784)))

(declare-fun contains!9741 (List!32153 (_ BitVec 64)) Bool)

(assert (=> b!1382873 (= res!924464 (contains!9741 Nil!32150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382874 () Bool)

(assert (=> b!1382874 (= e!783784 (contains!9741 Nil!32150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!118162 res!924461) b!1382872))

(assert (= (and b!1382872 res!924462) b!1382871))

(assert (= (and b!1382871 res!924465) b!1382869))

(assert (= (and b!1382869 res!924463) b!1382870))

(assert (= (and b!1382870 res!924466) b!1382873))

(assert (= (and b!1382873 (not res!924464)) b!1382874))

(declare-fun m!1267969 () Bool)

(assert (=> b!1382870 m!1267969))

(declare-fun m!1267971 () Bool)

(assert (=> b!1382874 m!1267971))

(declare-fun m!1267973 () Bool)

(assert (=> b!1382871 m!1267973))

(assert (=> b!1382871 m!1267973))

(declare-fun m!1267975 () Bool)

(assert (=> b!1382871 m!1267975))

(declare-fun m!1267977 () Bool)

(assert (=> start!118162 m!1267977))

(declare-fun m!1267979 () Bool)

(assert (=> start!118162 m!1267979))

(declare-fun m!1267981 () Bool)

(assert (=> b!1382873 m!1267981))

(push 1)

(assert (not b!1382870))

(assert (not start!118162))

(assert (not b!1382873))

(assert (not b!1382874))

(assert (not b!1382871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149257 () Bool)

(assert (=> d!149257 (= (validKeyInArray!0 (select (arr!45625 a!2938) i!1065)) (and (not (= (select (arr!45625 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45625 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382871 d!149257))

(declare-fun d!149259 () Bool)

(assert (=> d!149259 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118162 d!149259))

(declare-fun d!149265 () Bool)

(assert (=> d!149265 (= (array_inv!34653 a!2938) (bvsge (size!46175 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118162 d!149265))

(declare-fun d!149267 () Bool)

(declare-fun res!924491 () Bool)

(declare-fun e!783810 () Bool)

(assert (=> d!149267 (=> res!924491 e!783810)))

(assert (=> d!149267 (= res!924491 (is-Nil!32150 Nil!32150))))

(assert (=> d!149267 (= (noDuplicate!2599 Nil!32150) e!783810)))

(declare-fun b!1382899 () Bool)

(declare-fun e!783811 () Bool)

(assert (=> b!1382899 (= e!783810 e!783811)))

(declare-fun res!924492 () Bool)

(assert (=> b!1382899 (=> (not res!924492) (not e!783811))))

(assert (=> b!1382899 (= res!924492 (not (contains!9741 (t!46847 Nil!32150) (h!33358 Nil!32150))))))

(declare-fun b!1382900 () Bool)

(assert (=> b!1382900 (= e!783811 (noDuplicate!2599 (t!46847 Nil!32150)))))

(assert (= (and d!149267 (not res!924491)) b!1382899))

(assert (= (and b!1382899 res!924492) b!1382900))

(declare-fun m!1268003 () Bool)

(assert (=> b!1382899 m!1268003))

(declare-fun m!1268005 () Bool)

(assert (=> b!1382900 m!1268005))

(assert (=> b!1382870 d!149267))

(declare-fun d!149271 () Bool)

(declare-fun lt!608486 () Bool)

(declare-fun content!760 (List!32153) (Set (_ BitVec 64)))

