; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103278 () Bool)

(assert start!103278)

(declare-fun b!1239365 () Bool)

(declare-fun e!702383 () Bool)

(declare-fun e!702384 () Bool)

(assert (=> b!1239365 (= e!702383 e!702384)))

(declare-fun res!826827 () Bool)

(assert (=> b!1239365 (=> (not res!826827) (not e!702384))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79862 0))(
  ( (array!79863 (arr!38531 (Array (_ BitVec 32) (_ BitVec 64))) (size!39067 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79862)

(assert (=> b!1239365 (= res!826827 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39067 a!3835))))))

(declare-datatypes ((Unit!41174 0))(
  ( (Unit!41175) )
))
(declare-fun lt!561668 () Unit!41174)

(declare-fun e!702381 () Unit!41174)

(assert (=> b!1239365 (= lt!561668 e!702381)))

(declare-fun c!121132 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239365 (= c!121132 (validKeyInArray!0 (select (arr!38531 a!3835) from!3213)))))

(declare-fun b!1239366 () Bool)

(declare-fun res!826825 () Bool)

(assert (=> b!1239366 (=> (not res!826825) (not e!702383))))

(declare-datatypes ((List!27304 0))(
  ( (Nil!27301) (Cons!27300 (h!28509 (_ BitVec 64)) (t!40767 List!27304)) )
))
(declare-fun acc!846 () List!27304)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7366 (List!27304 (_ BitVec 64)) Bool)

(assert (=> b!1239366 (= res!826825 (contains!7366 acc!846 k!2925))))

(declare-fun b!1239367 () Bool)

(declare-fun res!826828 () Bool)

(assert (=> b!1239367 (=> (not res!826828) (not e!702383))))

(assert (=> b!1239367 (= res!826828 (not (contains!7366 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239368 () Bool)

(declare-fun res!826822 () Bool)

(assert (=> b!1239368 (=> (not res!826822) (not e!702383))))

(declare-fun arrayNoDuplicates!0 (array!79862 (_ BitVec 32) List!27304) Bool)

(assert (=> b!1239368 (= res!826822 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239369 () Bool)

(assert (=> b!1239369 (= e!702384 false)))

(declare-fun lt!561667 () Bool)

(assert (=> b!1239369 (= lt!561667 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239370 () Bool)

(declare-fun res!826824 () Bool)

(assert (=> b!1239370 (=> (not res!826824) (not e!702383))))

(assert (=> b!1239370 (= res!826824 (not (contains!7366 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826823 () Bool)

(assert (=> start!103278 (=> (not res!826823) (not e!702383))))

(assert (=> start!103278 (= res!826823 (and (bvslt (size!39067 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39067 a!3835))))))

(assert (=> start!103278 e!702383))

(declare-fun array_inv!29379 (array!79862) Bool)

(assert (=> start!103278 (array_inv!29379 a!3835)))

(assert (=> start!103278 true))

(declare-fun b!1239371 () Bool)

(declare-fun Unit!41176 () Unit!41174)

(assert (=> b!1239371 (= e!702381 Unit!41176)))

(declare-fun b!1239372 () Bool)

(declare-fun res!826826 () Bool)

(assert (=> b!1239372 (=> (not res!826826) (not e!702383))))

(assert (=> b!1239372 (= res!826826 (not (= from!3213 (bvsub (size!39067 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239373 () Bool)

(declare-fun res!826821 () Bool)

(assert (=> b!1239373 (=> (not res!826821) (not e!702383))))

(declare-fun noDuplicate!1963 (List!27304) Bool)

(assert (=> b!1239373 (= res!826821 (noDuplicate!1963 acc!846))))

(declare-fun b!1239374 () Bool)

(declare-fun lt!561666 () Unit!41174)

(assert (=> b!1239374 (= e!702381 lt!561666)))

(declare-fun lt!561670 () List!27304)

(assert (=> b!1239374 (= lt!561670 (Cons!27300 (select (arr!38531 a!3835) from!3213) acc!846))))

(declare-fun lt!561671 () Unit!41174)

(declare-fun lemmaListSubSeqRefl!0 (List!27304) Unit!41174)

(assert (=> b!1239374 (= lt!561671 (lemmaListSubSeqRefl!0 lt!561670))))

(declare-fun subseq!620 (List!27304 List!27304) Bool)

(assert (=> b!1239374 (subseq!620 lt!561670 lt!561670)))

(declare-fun lt!561669 () Unit!41174)

(declare-fun subseqTail!107 (List!27304 List!27304) Unit!41174)

(assert (=> b!1239374 (= lt!561669 (subseqTail!107 lt!561670 lt!561670))))

(assert (=> b!1239374 (subseq!620 acc!846 lt!561670)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79862 List!27304 List!27304 (_ BitVec 32)) Unit!41174)

(assert (=> b!1239374 (= lt!561666 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561670 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239374 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!103278 res!826823) b!1239373))

(assert (= (and b!1239373 res!826821) b!1239367))

(assert (= (and b!1239367 res!826828) b!1239370))

(assert (= (and b!1239370 res!826824) b!1239368))

(assert (= (and b!1239368 res!826822) b!1239366))

(assert (= (and b!1239366 res!826825) b!1239372))

(assert (= (and b!1239372 res!826826) b!1239365))

(assert (= (and b!1239365 c!121132) b!1239374))

(assert (= (and b!1239365 (not c!121132)) b!1239371))

(assert (= (and b!1239365 res!826827) b!1239369))

(declare-fun m!1142815 () Bool)

(assert (=> b!1239370 m!1142815))

(declare-fun m!1142817 () Bool)

(assert (=> start!103278 m!1142817))

(declare-fun m!1142819 () Bool)

(assert (=> b!1239369 m!1142819))

(declare-fun m!1142821 () Bool)

(assert (=> b!1239367 m!1142821))

(declare-fun m!1142823 () Bool)

(assert (=> b!1239365 m!1142823))

(assert (=> b!1239365 m!1142823))

(declare-fun m!1142825 () Bool)

(assert (=> b!1239365 m!1142825))

(declare-fun m!1142827 () Bool)

(assert (=> b!1239373 m!1142827))

(declare-fun m!1142829 () Bool)

(assert (=> b!1239368 m!1142829))

(declare-fun m!1142831 () Bool)

(assert (=> b!1239366 m!1142831))

(declare-fun m!1142833 () Bool)

(assert (=> b!1239374 m!1142833))

(declare-fun m!1142835 () Bool)

(assert (=> b!1239374 m!1142835))

(declare-fun m!1142837 () Bool)

(assert (=> b!1239374 m!1142837))

(declare-fun m!1142839 () Bool)

(assert (=> b!1239374 m!1142839))

(assert (=> b!1239374 m!1142819))

(assert (=> b!1239374 m!1142823))

(declare-fun m!1142841 () Bool)

(assert (=> b!1239374 m!1142841))

(push 1)

