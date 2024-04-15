; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102832 () Bool)

(assert start!102832)

(declare-fun b!1235915 () Bool)

(declare-fun res!823984 () Bool)

(declare-fun e!700628 () Bool)

(assert (=> b!1235915 (=> (not res!823984) (not e!700628))))

(declare-datatypes ((array!79600 0))(
  ( (array!79601 (arr!38408 (Array (_ BitVec 32) (_ BitVec 64))) (size!38946 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79600)

(declare-datatypes ((List!27282 0))(
  ( (Nil!27279) (Cons!27278 (h!28487 (_ BitVec 64)) (t!40736 List!27282)) )
))
(declare-fun acc!846 () List!27282)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79600 (_ BitVec 32) List!27282) Bool)

(assert (=> b!1235915 (= res!823984 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235916 () Bool)

(declare-fun res!823990 () Bool)

(declare-fun e!700629 () Bool)

(assert (=> b!1235916 (=> (not res!823990) (not e!700629))))

(assert (=> b!1235916 (= res!823990 (not (= from!3213 (bvsub (size!38946 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235917 () Bool)

(declare-fun res!823987 () Bool)

(assert (=> b!1235917 (=> (not res!823987) (not e!700629))))

(declare-fun noDuplicate!1897 (List!27282) Bool)

(assert (=> b!1235917 (= res!823987 (noDuplicate!1897 acc!846))))

(declare-fun b!1235918 () Bool)

(declare-fun res!823991 () Bool)

(assert (=> b!1235918 (=> (not res!823991) (not e!700629))))

(declare-fun contains!7254 (List!27282 (_ BitVec 64)) Bool)

(assert (=> b!1235918 (= res!823991 (not (contains!7254 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823986 () Bool)

(assert (=> start!102832 (=> (not res!823986) (not e!700629))))

(assert (=> start!102832 (= res!823986 (and (bvslt (size!38946 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38946 a!3835))))))

(assert (=> start!102832 e!700629))

(declare-fun array_inv!29391 (array!79600) Bool)

(assert (=> start!102832 (array_inv!29391 a!3835)))

(assert (=> start!102832 true))

(declare-fun b!1235919 () Bool)

(declare-fun res!823985 () Bool)

(assert (=> b!1235919 (=> (not res!823985) (not e!700629))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235919 (= res!823985 (contains!7254 acc!846 k0!2925))))

(declare-fun b!1235920 () Bool)

(declare-fun res!823988 () Bool)

(assert (=> b!1235920 (=> (not res!823988) (not e!700629))))

(assert (=> b!1235920 (= res!823988 (not (contains!7254 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235921 () Bool)

(assert (=> b!1235921 (= e!700629 e!700628)))

(declare-fun res!823989 () Bool)

(assert (=> b!1235921 (=> (not res!823989) (not e!700628))))

(assert (=> b!1235921 (= res!823989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38946 a!3835))))))

(declare-datatypes ((Unit!40832 0))(
  ( (Unit!40833) )
))
(declare-fun lt!560445 () Unit!40832)

(declare-fun e!700630 () Unit!40832)

(assert (=> b!1235921 (= lt!560445 e!700630)))

(declare-fun c!120829 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235921 (= c!120829 (validKeyInArray!0 (select (arr!38408 a!3835) from!3213)))))

(declare-fun b!1235922 () Bool)

(declare-fun res!823983 () Bool)

(assert (=> b!1235922 (=> (not res!823983) (not e!700629))))

(assert (=> b!1235922 (= res!823983 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235923 () Bool)

(assert (=> b!1235923 (= e!700628 (not true))))

(declare-fun arrayContainsKey!0 (array!79600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235923 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!560444 () Unit!40832)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79600 (_ BitVec 32) (_ BitVec 64) List!27282) Unit!40832)

(assert (=> b!1235923 (= lt!560444 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1235924 () Bool)

(declare-fun Unit!40834 () Unit!40832)

(assert (=> b!1235924 (= e!700630 Unit!40834)))

(declare-fun b!1235925 () Bool)

(declare-fun lt!560446 () Unit!40832)

(assert (=> b!1235925 (= e!700630 lt!560446)))

(declare-fun lt!560447 () List!27282)

(assert (=> b!1235925 (= lt!560447 (Cons!27278 (select (arr!38408 a!3835) from!3213) acc!846))))

(declare-fun lt!560442 () Unit!40832)

(declare-fun lemmaListSubSeqRefl!0 (List!27282) Unit!40832)

(assert (=> b!1235925 (= lt!560442 (lemmaListSubSeqRefl!0 lt!560447))))

(declare-fun subseq!554 (List!27282 List!27282) Bool)

(assert (=> b!1235925 (subseq!554 lt!560447 lt!560447)))

(declare-fun lt!560443 () Unit!40832)

(declare-fun subseqTail!47 (List!27282 List!27282) Unit!40832)

(assert (=> b!1235925 (= lt!560443 (subseqTail!47 lt!560447 lt!560447))))

(assert (=> b!1235925 (subseq!554 acc!846 lt!560447)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79600 List!27282 List!27282 (_ BitVec 32)) Unit!40832)

(assert (=> b!1235925 (= lt!560446 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560447 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235925 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!102832 res!823986) b!1235917))

(assert (= (and b!1235917 res!823987) b!1235920))

(assert (= (and b!1235920 res!823988) b!1235918))

(assert (= (and b!1235918 res!823991) b!1235922))

(assert (= (and b!1235922 res!823983) b!1235919))

(assert (= (and b!1235919 res!823985) b!1235916))

(assert (= (and b!1235916 res!823990) b!1235921))

(assert (= (and b!1235921 c!120829) b!1235925))

(assert (= (and b!1235921 (not c!120829)) b!1235924))

(assert (= (and b!1235921 res!823989) b!1235915))

(assert (= (and b!1235915 res!823984) b!1235923))

(declare-fun m!1139331 () Bool)

(assert (=> b!1235925 m!1139331))

(declare-fun m!1139333 () Bool)

(assert (=> b!1235925 m!1139333))

(declare-fun m!1139335 () Bool)

(assert (=> b!1235925 m!1139335))

(declare-fun m!1139337 () Bool)

(assert (=> b!1235925 m!1139337))

(declare-fun m!1139339 () Bool)

(assert (=> b!1235925 m!1139339))

(declare-fun m!1139341 () Bool)

(assert (=> b!1235925 m!1139341))

(declare-fun m!1139343 () Bool)

(assert (=> b!1235925 m!1139343))

(assert (=> b!1235915 m!1139341))

(declare-fun m!1139345 () Bool)

(assert (=> b!1235923 m!1139345))

(declare-fun m!1139347 () Bool)

(assert (=> b!1235923 m!1139347))

(declare-fun m!1139349 () Bool)

(assert (=> b!1235922 m!1139349))

(declare-fun m!1139351 () Bool)

(assert (=> b!1235920 m!1139351))

(assert (=> b!1235921 m!1139343))

(assert (=> b!1235921 m!1139343))

(declare-fun m!1139353 () Bool)

(assert (=> b!1235921 m!1139353))

(declare-fun m!1139355 () Bool)

(assert (=> b!1235919 m!1139355))

(declare-fun m!1139357 () Bool)

(assert (=> b!1235918 m!1139357))

(declare-fun m!1139359 () Bool)

(assert (=> b!1235917 m!1139359))

(declare-fun m!1139361 () Bool)

(assert (=> start!102832 m!1139361))

(check-sat (not b!1235918) (not b!1235919) (not b!1235920) (not b!1235925) (not b!1235922) (not b!1235921) (not b!1235923) (not b!1235917) (not b!1235915) (not start!102832))
(check-sat)
