; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114722 () Bool)

(assert start!114722)

(declare-fun b!1360215 () Bool)

(declare-fun e!771994 () Bool)

(assert (=> b!1360215 (= e!771994 false)))

(declare-datatypes ((Unit!44666 0))(
  ( (Unit!44667) )
))
(declare-fun lt!599944 () Unit!44666)

(declare-fun e!771993 () Unit!44666)

(assert (=> b!1360215 (= lt!599944 e!771993)))

(declare-fun c!127555 () Bool)

(declare-datatypes ((array!92609 0))(
  ( (array!92610 (arr!44742 (Array (_ BitVec 32) (_ BitVec 64))) (size!45293 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92609)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360215 (= c!127555 (validKeyInArray!0 (select (arr!44742 a!3742) from!3120)))))

(declare-fun b!1360216 () Bool)

(declare-fun res!904002 () Bool)

(assert (=> b!1360216 (=> (not res!904002) (not e!771994))))

(declare-datatypes ((List!31770 0))(
  ( (Nil!31767) (Cons!31766 (h!32984 (_ BitVec 64)) (t!46432 List!31770)) )
))
(declare-fun arrayNoDuplicates!0 (array!92609 (_ BitVec 32) List!31770) Bool)

(assert (=> b!1360216 (= res!904002 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31767))))

(declare-fun res!904004 () Bool)

(assert (=> start!114722 (=> (not res!904004) (not e!771994))))

(assert (=> start!114722 (= res!904004 (and (bvslt (size!45293 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45293 a!3742))))))

(assert (=> start!114722 e!771994))

(assert (=> start!114722 true))

(declare-fun array_inv!34023 (array!92609) Bool)

(assert (=> start!114722 (array_inv!34023 a!3742)))

(declare-fun b!1360217 () Bool)

(declare-fun res!904003 () Bool)

(assert (=> b!1360217 (=> (not res!904003) (not e!771994))))

(declare-fun acc!759 () List!31770)

(declare-fun contains!9482 (List!31770 (_ BitVec 64)) Bool)

(assert (=> b!1360217 (= res!904003 (not (contains!9482 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360218 () Bool)

(declare-fun res!904001 () Bool)

(assert (=> b!1360218 (=> (not res!904001) (not e!771994))))

(assert (=> b!1360218 (= res!904001 (not (contains!9482 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360219 () Bool)

(declare-fun res!904007 () Bool)

(assert (=> b!1360219 (=> (not res!904007) (not e!771994))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360219 (= res!904007 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360220 () Bool)

(declare-fun res!904008 () Bool)

(assert (=> b!1360220 (=> (not res!904008) (not e!771994))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360220 (= res!904008 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45293 a!3742))))))

(declare-fun b!1360221 () Bool)

(declare-fun res!904006 () Bool)

(assert (=> b!1360221 (=> (not res!904006) (not e!771994))))

(assert (=> b!1360221 (= res!904006 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45293 a!3742)))))

(declare-fun b!1360222 () Bool)

(declare-fun res!904005 () Bool)

(assert (=> b!1360222 (=> (not res!904005) (not e!771994))))

(declare-fun noDuplicate!2313 (List!31770) Bool)

(assert (=> b!1360222 (= res!904005 (noDuplicate!2313 acc!759))))

(declare-fun b!1360223 () Bool)

(declare-fun Unit!44668 () Unit!44666)

(assert (=> b!1360223 (= e!771993 Unit!44668)))

(declare-fun b!1360224 () Bool)

(declare-fun lt!599946 () Unit!44666)

(assert (=> b!1360224 (= e!771993 lt!599946)))

(declare-fun lt!599945 () Unit!44666)

(declare-fun lemmaListSubSeqRefl!0 (List!31770) Unit!44666)

(assert (=> b!1360224 (= lt!599945 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!841 (List!31770 List!31770) Bool)

(assert (=> b!1360224 (subseq!841 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92609 List!31770 List!31770 (_ BitVec 32)) Unit!44666)

(declare-fun $colon$colon!843 (List!31770 (_ BitVec 64)) List!31770)

(assert (=> b!1360224 (= lt!599946 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!843 acc!759 (select (arr!44742 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360224 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360225 () Bool)

(declare-fun res!904000 () Bool)

(assert (=> b!1360225 (=> (not res!904000) (not e!771994))))

(assert (=> b!1360225 (= res!904000 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114722 res!904004) b!1360222))

(assert (= (and b!1360222 res!904005) b!1360218))

(assert (= (and b!1360218 res!904001) b!1360217))

(assert (= (and b!1360217 res!904003) b!1360216))

(assert (= (and b!1360216 res!904002) b!1360225))

(assert (= (and b!1360225 res!904000) b!1360220))

(assert (= (and b!1360220 res!904008) b!1360219))

(assert (= (and b!1360219 res!904007) b!1360221))

(assert (= (and b!1360221 res!904006) b!1360215))

(assert (= (and b!1360215 c!127555) b!1360224))

(assert (= (and b!1360215 (not c!127555)) b!1360223))

(declare-fun m!1246023 () Bool)

(assert (=> start!114722 m!1246023))

(declare-fun m!1246025 () Bool)

(assert (=> b!1360225 m!1246025))

(declare-fun m!1246027 () Bool)

(assert (=> b!1360224 m!1246027))

(declare-fun m!1246029 () Bool)

(assert (=> b!1360224 m!1246029))

(declare-fun m!1246031 () Bool)

(assert (=> b!1360224 m!1246031))

(declare-fun m!1246033 () Bool)

(assert (=> b!1360224 m!1246033))

(declare-fun m!1246035 () Bool)

(assert (=> b!1360224 m!1246035))

(assert (=> b!1360224 m!1246029))

(assert (=> b!1360224 m!1246031))

(declare-fun m!1246037 () Bool)

(assert (=> b!1360224 m!1246037))

(declare-fun m!1246039 () Bool)

(assert (=> b!1360216 m!1246039))

(assert (=> b!1360215 m!1246029))

(assert (=> b!1360215 m!1246029))

(declare-fun m!1246041 () Bool)

(assert (=> b!1360215 m!1246041))

(declare-fun m!1246043 () Bool)

(assert (=> b!1360222 m!1246043))

(declare-fun m!1246045 () Bool)

(assert (=> b!1360218 m!1246045))

(declare-fun m!1246047 () Bool)

(assert (=> b!1360217 m!1246047))

(declare-fun m!1246049 () Bool)

(assert (=> b!1360219 m!1246049))

(push 1)

(assert (not b!1360219))

(assert (not b!1360215))

(assert (not b!1360222))

(assert (not b!1360225))

(assert (not b!1360218))

(assert (not start!114722))

(assert (not b!1360224))

(assert (not b!1360216))

(assert (not b!1360217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

