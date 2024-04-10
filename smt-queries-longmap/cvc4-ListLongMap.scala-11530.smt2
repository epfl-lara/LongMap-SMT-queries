; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134268 () Bool)

(assert start!134268)

(declare-fun b!1568245 () Bool)

(declare-fun res!1071934 () Bool)

(declare-fun e!874242 () Bool)

(assert (=> b!1568245 (=> (not res!1071934) (not e!874242))))

(declare-datatypes ((List!36691 0))(
  ( (Nil!36688) (Cons!36687 (h!38134 (_ BitVec 64)) (t!51599 List!36691)) )
))
(declare-fun acc!619 () List!36691)

(declare-fun contains!10393 (List!36691 (_ BitVec 64)) Bool)

(assert (=> b!1568245 (= res!1071934 (not (contains!10393 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568246 () Bool)

(declare-fun res!1071935 () Bool)

(assert (=> b!1568246 (=> (not res!1071935) (not e!874242))))

(assert (=> b!1568246 (= res!1071935 (not (contains!10393 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568247 () Bool)

(assert (=> b!1568247 (= e!874242 false)))

(declare-fun lt!673138 () Bool)

(declare-fun e!874243 () Bool)

(assert (=> b!1568247 (= lt!673138 e!874243)))

(declare-fun res!1071932 () Bool)

(assert (=> b!1568247 (=> res!1071932 e!874243)))

(declare-datatypes ((array!104758 0))(
  ( (array!104759 (arr!50559 (Array (_ BitVec 32) (_ BitVec 64))) (size!51109 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104758)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568247 (= res!1071932 (not (validKeyInArray!0 (select (arr!50559 a!3481) from!2856))))))

(declare-fun b!1568248 () Bool)

(assert (=> b!1568248 (= e!874243 (not (contains!10393 acc!619 (select (arr!50559 a!3481) from!2856))))))

(declare-fun b!1568249 () Bool)

(declare-fun res!1071933 () Bool)

(assert (=> b!1568249 (=> (not res!1071933) (not e!874242))))

(assert (=> b!1568249 (= res!1071933 (bvslt from!2856 (size!51109 a!3481)))))

(declare-fun res!1071936 () Bool)

(assert (=> start!134268 (=> (not res!1071936) (not e!874242))))

(assert (=> start!134268 (= res!1071936 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51109 a!3481)) (bvslt (size!51109 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134268 e!874242))

(assert (=> start!134268 true))

(declare-fun array_inv!39286 (array!104758) Bool)

(assert (=> start!134268 (array_inv!39286 a!3481)))

(declare-fun b!1568250 () Bool)

(declare-fun res!1071931 () Bool)

(assert (=> b!1568250 (=> (not res!1071931) (not e!874242))))

(declare-fun noDuplicate!2665 (List!36691) Bool)

(assert (=> b!1568250 (= res!1071931 (noDuplicate!2665 acc!619))))

(assert (= (and start!134268 res!1071936) b!1568250))

(assert (= (and b!1568250 res!1071931) b!1568245))

(assert (= (and b!1568245 res!1071934) b!1568246))

(assert (= (and b!1568246 res!1071935) b!1568249))

(assert (= (and b!1568249 res!1071933) b!1568247))

(assert (= (and b!1568247 (not res!1071932)) b!1568248))

(declare-fun m!1442945 () Bool)

(assert (=> b!1568246 m!1442945))

(declare-fun m!1442947 () Bool)

(assert (=> b!1568247 m!1442947))

(assert (=> b!1568247 m!1442947))

(declare-fun m!1442949 () Bool)

(assert (=> b!1568247 m!1442949))

(assert (=> b!1568248 m!1442947))

(assert (=> b!1568248 m!1442947))

(declare-fun m!1442951 () Bool)

(assert (=> b!1568248 m!1442951))

(declare-fun m!1442953 () Bool)

(assert (=> start!134268 m!1442953))

(declare-fun m!1442955 () Bool)

(assert (=> b!1568250 m!1442955))

(declare-fun m!1442957 () Bool)

(assert (=> b!1568245 m!1442957))

(push 1)

(assert (not start!134268))

(assert (not b!1568247))

(assert (not b!1568245))

(assert (not b!1568246))

(assert (not b!1568248))

(assert (not b!1568250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

