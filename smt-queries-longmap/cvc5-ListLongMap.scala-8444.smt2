; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102798 () Bool)

(assert start!102798)

(declare-fun b!1235441 () Bool)

(declare-fun res!823587 () Bool)

(declare-fun e!700447 () Bool)

(assert (=> b!1235441 (=> (not res!823587) (not e!700447))))

(declare-datatypes ((List!27202 0))(
  ( (Nil!27199) (Cons!27198 (h!28407 (_ BitVec 64)) (t!40665 List!27202)) )
))
(declare-fun acc!846 () List!27202)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7264 (List!27202 (_ BitVec 64)) Bool)

(assert (=> b!1235441 (= res!823587 (contains!7264 acc!846 k!2925))))

(declare-fun b!1235442 () Bool)

(declare-fun res!823582 () Bool)

(assert (=> b!1235442 (=> (not res!823582) (not e!700447))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79643 0))(
  ( (array!79644 (arr!38429 (Array (_ BitVec 32) (_ BitVec 64))) (size!38965 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79643)

(assert (=> b!1235442 (= res!823582 (not (= from!3213 (bvsub (size!38965 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235443 () Bool)

(declare-fun res!823583 () Bool)

(assert (=> b!1235443 (=> (not res!823583) (not e!700447))))

(assert (=> b!1235443 (= res!823583 (not (contains!7264 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823585 () Bool)

(assert (=> start!102798 (=> (not res!823585) (not e!700447))))

(assert (=> start!102798 (= res!823585 (and (bvslt (size!38965 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38965 a!3835))))))

(assert (=> start!102798 e!700447))

(declare-fun array_inv!29277 (array!79643) Bool)

(assert (=> start!102798 (array_inv!29277 a!3835)))

(assert (=> start!102798 true))

(declare-fun b!1235444 () Bool)

(declare-fun e!700448 () Bool)

(assert (=> b!1235444 (= e!700448 false)))

(declare-fun lt!560292 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79643 (_ BitVec 32) List!27202) Bool)

(assert (=> b!1235444 (= lt!560292 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235445 () Bool)

(declare-fun res!823584 () Bool)

(assert (=> b!1235445 (=> (not res!823584) (not e!700447))))

(assert (=> b!1235445 (= res!823584 (not (contains!7264 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235446 () Bool)

(declare-datatypes ((Unit!40931 0))(
  ( (Unit!40932) )
))
(declare-fun e!700446 () Unit!40931)

(declare-fun Unit!40933 () Unit!40931)

(assert (=> b!1235446 (= e!700446 Unit!40933)))

(declare-fun b!1235447 () Bool)

(assert (=> b!1235447 (= e!700447 e!700448)))

(declare-fun res!823588 () Bool)

(assert (=> b!1235447 (=> (not res!823588) (not e!700448))))

(assert (=> b!1235447 (= res!823588 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38965 a!3835))))))

(declare-fun lt!560297 () Unit!40931)

(assert (=> b!1235447 (= lt!560297 e!700446)))

(declare-fun c!120790 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235447 (= c!120790 (validKeyInArray!0 (select (arr!38429 a!3835) from!3213)))))

(declare-fun b!1235448 () Bool)

(declare-fun res!823586 () Bool)

(assert (=> b!1235448 (=> (not res!823586) (not e!700447))))

(declare-fun noDuplicate!1861 (List!27202) Bool)

(assert (=> b!1235448 (= res!823586 (noDuplicate!1861 acc!846))))

(declare-fun b!1235449 () Bool)

(declare-fun res!823581 () Bool)

(assert (=> b!1235449 (=> (not res!823581) (not e!700447))))

(assert (=> b!1235449 (= res!823581 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235450 () Bool)

(declare-fun lt!560294 () Unit!40931)

(assert (=> b!1235450 (= e!700446 lt!560294)))

(declare-fun lt!560296 () List!27202)

(assert (=> b!1235450 (= lt!560296 (Cons!27198 (select (arr!38429 a!3835) from!3213) acc!846))))

(declare-fun lt!560293 () Unit!40931)

(declare-fun lemmaListSubSeqRefl!0 (List!27202) Unit!40931)

(assert (=> b!1235450 (= lt!560293 (lemmaListSubSeqRefl!0 lt!560296))))

(declare-fun subseq!536 (List!27202 List!27202) Bool)

(assert (=> b!1235450 (subseq!536 lt!560296 lt!560296)))

(declare-fun lt!560295 () Unit!40931)

(declare-fun subseqTail!29 (List!27202 List!27202) Unit!40931)

(assert (=> b!1235450 (= lt!560295 (subseqTail!29 lt!560296 lt!560296))))

(assert (=> b!1235450 (subseq!536 acc!846 lt!560296)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79643 List!27202 List!27202 (_ BitVec 32)) Unit!40931)

(assert (=> b!1235450 (= lt!560294 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560296 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235450 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!102798 res!823585) b!1235448))

(assert (= (and b!1235448 res!823586) b!1235445))

(assert (= (and b!1235445 res!823584) b!1235443))

(assert (= (and b!1235443 res!823583) b!1235449))

(assert (= (and b!1235449 res!823581) b!1235441))

(assert (= (and b!1235441 res!823587) b!1235442))

(assert (= (and b!1235442 res!823582) b!1235447))

(assert (= (and b!1235447 c!120790) b!1235450))

(assert (= (and b!1235447 (not c!120790)) b!1235446))

(assert (= (and b!1235447 res!823588) b!1235444))

(declare-fun m!1139323 () Bool)

(assert (=> b!1235447 m!1139323))

(assert (=> b!1235447 m!1139323))

(declare-fun m!1139325 () Bool)

(assert (=> b!1235447 m!1139325))

(declare-fun m!1139327 () Bool)

(assert (=> b!1235445 m!1139327))

(declare-fun m!1139329 () Bool)

(assert (=> b!1235449 m!1139329))

(declare-fun m!1139331 () Bool)

(assert (=> b!1235444 m!1139331))

(declare-fun m!1139333 () Bool)

(assert (=> start!102798 m!1139333))

(declare-fun m!1139335 () Bool)

(assert (=> b!1235443 m!1139335))

(declare-fun m!1139337 () Bool)

(assert (=> b!1235441 m!1139337))

(declare-fun m!1139339 () Bool)

(assert (=> b!1235450 m!1139339))

(declare-fun m!1139341 () Bool)

(assert (=> b!1235450 m!1139341))

(declare-fun m!1139343 () Bool)

(assert (=> b!1235450 m!1139343))

(assert (=> b!1235450 m!1139331))

(assert (=> b!1235450 m!1139323))

(declare-fun m!1139345 () Bool)

(assert (=> b!1235450 m!1139345))

(declare-fun m!1139347 () Bool)

(assert (=> b!1235450 m!1139347))

(declare-fun m!1139349 () Bool)

(assert (=> b!1235448 m!1139349))

(push 1)

