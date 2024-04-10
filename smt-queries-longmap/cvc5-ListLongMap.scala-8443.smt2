; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102792 () Bool)

(assert start!102792)

(declare-fun b!1235351 () Bool)

(declare-fun e!700413 () Bool)

(declare-fun e!700411 () Bool)

(assert (=> b!1235351 (= e!700413 e!700411)))

(declare-fun res!823512 () Bool)

(assert (=> b!1235351 (=> (not res!823512) (not e!700411))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79637 0))(
  ( (array!79638 (arr!38426 (Array (_ BitVec 32) (_ BitVec 64))) (size!38962 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79637)

(assert (=> b!1235351 (= res!823512 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38962 a!3835))))))

(declare-datatypes ((Unit!40922 0))(
  ( (Unit!40923) )
))
(declare-fun lt!560240 () Unit!40922)

(declare-fun e!700410 () Unit!40922)

(assert (=> b!1235351 (= lt!560240 e!700410)))

(declare-fun c!120781 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235351 (= c!120781 (validKeyInArray!0 (select (arr!38426 a!3835) from!3213)))))

(declare-fun b!1235352 () Bool)

(declare-fun res!823514 () Bool)

(assert (=> b!1235352 (=> (not res!823514) (not e!700413))))

(declare-datatypes ((List!27199 0))(
  ( (Nil!27196) (Cons!27195 (h!28404 (_ BitVec 64)) (t!40662 List!27199)) )
))
(declare-fun acc!846 () List!27199)

(declare-fun contains!7261 (List!27199 (_ BitVec 64)) Bool)

(assert (=> b!1235352 (= res!823514 (not (contains!7261 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235353 () Bool)

(declare-fun Unit!40924 () Unit!40922)

(assert (=> b!1235353 (= e!700410 Unit!40924)))

(declare-fun b!1235354 () Bool)

(declare-fun res!823510 () Bool)

(assert (=> b!1235354 (=> (not res!823510) (not e!700413))))

(assert (=> b!1235354 (= res!823510 (not (contains!7261 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235355 () Bool)

(declare-fun res!823515 () Bool)

(assert (=> b!1235355 (=> (not res!823515) (not e!700413))))

(declare-fun arrayNoDuplicates!0 (array!79637 (_ BitVec 32) List!27199) Bool)

(assert (=> b!1235355 (= res!823515 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235356 () Bool)

(declare-fun lt!560239 () Unit!40922)

(assert (=> b!1235356 (= e!700410 lt!560239)))

(declare-fun lt!560242 () List!27199)

(assert (=> b!1235356 (= lt!560242 (Cons!27195 (select (arr!38426 a!3835) from!3213) acc!846))))

(declare-fun lt!560241 () Unit!40922)

(declare-fun lemmaListSubSeqRefl!0 (List!27199) Unit!40922)

(assert (=> b!1235356 (= lt!560241 (lemmaListSubSeqRefl!0 lt!560242))))

(declare-fun subseq!533 (List!27199 List!27199) Bool)

(assert (=> b!1235356 (subseq!533 lt!560242 lt!560242)))

(declare-fun lt!560238 () Unit!40922)

(declare-fun subseqTail!26 (List!27199 List!27199) Unit!40922)

(assert (=> b!1235356 (= lt!560238 (subseqTail!26 lt!560242 lt!560242))))

(assert (=> b!1235356 (subseq!533 acc!846 lt!560242)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79637 List!27199 List!27199 (_ BitVec 32)) Unit!40922)

(assert (=> b!1235356 (= lt!560239 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560242 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235356 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!823513 () Bool)

(assert (=> start!102792 (=> (not res!823513) (not e!700413))))

(assert (=> start!102792 (= res!823513 (and (bvslt (size!38962 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38962 a!3835))))))

(assert (=> start!102792 e!700413))

(declare-fun array_inv!29274 (array!79637) Bool)

(assert (=> start!102792 (array_inv!29274 a!3835)))

(assert (=> start!102792 true))

(declare-fun b!1235357 () Bool)

(declare-fun res!823511 () Bool)

(assert (=> b!1235357 (=> (not res!823511) (not e!700413))))

(declare-fun noDuplicate!1858 (List!27199) Bool)

(assert (=> b!1235357 (= res!823511 (noDuplicate!1858 acc!846))))

(declare-fun b!1235358 () Bool)

(assert (=> b!1235358 (= e!700411 false)))

(declare-fun lt!560243 () Bool)

(assert (=> b!1235358 (= lt!560243 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235359 () Bool)

(declare-fun res!823516 () Bool)

(assert (=> b!1235359 (=> (not res!823516) (not e!700413))))

(assert (=> b!1235359 (= res!823516 (not (= from!3213 (bvsub (size!38962 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235360 () Bool)

(declare-fun res!823509 () Bool)

(assert (=> b!1235360 (=> (not res!823509) (not e!700413))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235360 (= res!823509 (contains!7261 acc!846 k!2925))))

(assert (= (and start!102792 res!823513) b!1235357))

(assert (= (and b!1235357 res!823511) b!1235352))

(assert (= (and b!1235352 res!823514) b!1235354))

(assert (= (and b!1235354 res!823510) b!1235355))

(assert (= (and b!1235355 res!823515) b!1235360))

(assert (= (and b!1235360 res!823509) b!1235359))

(assert (= (and b!1235359 res!823516) b!1235351))

(assert (= (and b!1235351 c!120781) b!1235356))

(assert (= (and b!1235351 (not c!120781)) b!1235353))

(assert (= (and b!1235351 res!823512) b!1235358))

(declare-fun m!1139239 () Bool)

(assert (=> b!1235358 m!1139239))

(declare-fun m!1139241 () Bool)

(assert (=> b!1235352 m!1139241))

(declare-fun m!1139243 () Bool)

(assert (=> b!1235357 m!1139243))

(declare-fun m!1139245 () Bool)

(assert (=> b!1235354 m!1139245))

(declare-fun m!1139247 () Bool)

(assert (=> b!1235356 m!1139247))

(assert (=> b!1235356 m!1139239))

(declare-fun m!1139249 () Bool)

(assert (=> b!1235356 m!1139249))

(declare-fun m!1139251 () Bool)

(assert (=> b!1235356 m!1139251))

(declare-fun m!1139253 () Bool)

(assert (=> b!1235356 m!1139253))

(declare-fun m!1139255 () Bool)

(assert (=> b!1235356 m!1139255))

(declare-fun m!1139257 () Bool)

(assert (=> b!1235356 m!1139257))

(declare-fun m!1139259 () Bool)

(assert (=> start!102792 m!1139259))

(declare-fun m!1139261 () Bool)

(assert (=> b!1235355 m!1139261))

(assert (=> b!1235351 m!1139253))

(assert (=> b!1235351 m!1139253))

(declare-fun m!1139263 () Bool)

(assert (=> b!1235351 m!1139263))

(declare-fun m!1139265 () Bool)

(assert (=> b!1235360 m!1139265))

(push 1)

