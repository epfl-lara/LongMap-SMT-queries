; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118130 () Bool)

(assert start!118130)

(declare-fun b!1382790 () Bool)

(declare-fun e!783733 () Bool)

(declare-datatypes ((List!32149 0))(
  ( (Nil!32146) (Cons!32145 (h!33354 (_ BitVec 64)) (t!46843 List!32149)) )
))
(declare-fun noDuplicate!2595 (List!32149) Bool)

(assert (=> b!1382790 (= e!783733 (not (noDuplicate!2595 Nil!32146)))))

(declare-fun b!1382789 () Bool)

(declare-fun res!924379 () Bool)

(assert (=> b!1382789 (=> (not res!924379) (not e!783733))))

(declare-datatypes ((array!94481 0))(
  ( (array!94482 (arr!45621 (Array (_ BitVec 32) (_ BitVec 64))) (size!46171 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94481)

(assert (=> b!1382789 (= res!924379 (and (bvsle #b00000000000000000000000000000000 (size!46171 a!2938)) (bvslt (size!46171 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1382788 () Bool)

(declare-fun res!924381 () Bool)

(assert (=> b!1382788 (=> (not res!924381) (not e!783733))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382788 (= res!924381 (validKeyInArray!0 (select (arr!45621 a!2938) i!1065)))))

(declare-fun res!924382 () Bool)

(assert (=> start!118130 (=> (not res!924382) (not e!783733))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118130 (= res!924382 (validMask!0 mask!2987))))

(assert (=> start!118130 e!783733))

(assert (=> start!118130 true))

(declare-fun array_inv!34649 (array!94481) Bool)

(assert (=> start!118130 (array_inv!34649 a!2938)))

(declare-fun b!1382787 () Bool)

(declare-fun res!924380 () Bool)

(assert (=> b!1382787 (=> (not res!924380) (not e!783733))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382787 (= res!924380 (and (= (size!46171 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46171 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46171 a!2938))))))

(assert (= (and start!118130 res!924382) b!1382787))

(assert (= (and b!1382787 res!924380) b!1382788))

(assert (= (and b!1382788 res!924381) b!1382789))

(assert (= (and b!1382789 res!924379) b!1382790))

(declare-fun m!1267909 () Bool)

(assert (=> b!1382790 m!1267909))

(declare-fun m!1267911 () Bool)

(assert (=> b!1382788 m!1267911))

(assert (=> b!1382788 m!1267911))

(declare-fun m!1267913 () Bool)

(assert (=> b!1382788 m!1267913))

(declare-fun m!1267915 () Bool)

(assert (=> start!118130 m!1267915))

(declare-fun m!1267917 () Bool)

(assert (=> start!118130 m!1267917))

(check-sat (not start!118130) (not b!1382790) (not b!1382788))
(check-sat)
(get-model)

(declare-fun d!149219 () Bool)

(assert (=> d!149219 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118130 d!149219))

(declare-fun d!149227 () Bool)

(assert (=> d!149227 (= (array_inv!34649 a!2938) (bvsge (size!46171 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118130 d!149227))

(declare-fun d!149229 () Bool)

(declare-fun res!924405 () Bool)

(declare-fun e!783751 () Bool)

(assert (=> d!149229 (=> res!924405 e!783751)))

(get-info :version)

(assert (=> d!149229 (= res!924405 ((_ is Nil!32146) Nil!32146))))

(assert (=> d!149229 (= (noDuplicate!2595 Nil!32146) e!783751)))

(declare-fun b!1382813 () Bool)

(declare-fun e!783752 () Bool)

(assert (=> b!1382813 (= e!783751 e!783752)))

(declare-fun res!924406 () Bool)

(assert (=> b!1382813 (=> (not res!924406) (not e!783752))))

(declare-fun contains!9738 (List!32149 (_ BitVec 64)) Bool)

(assert (=> b!1382813 (= res!924406 (not (contains!9738 (t!46843 Nil!32146) (h!33354 Nil!32146))))))

(declare-fun b!1382814 () Bool)

(assert (=> b!1382814 (= e!783752 (noDuplicate!2595 (t!46843 Nil!32146)))))

(assert (= (and d!149229 (not res!924405)) b!1382813))

(assert (= (and b!1382813 res!924406) b!1382814))

(declare-fun m!1267933 () Bool)

(assert (=> b!1382813 m!1267933))

(declare-fun m!1267935 () Bool)

(assert (=> b!1382814 m!1267935))

(assert (=> b!1382790 d!149229))

(declare-fun d!149233 () Bool)

(assert (=> d!149233 (= (validKeyInArray!0 (select (arr!45621 a!2938) i!1065)) (and (not (= (select (arr!45621 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45621 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382788 d!149233))

(check-sat (not b!1382814) (not b!1382813))
(check-sat)
