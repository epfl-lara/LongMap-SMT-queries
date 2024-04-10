; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59946 () Bool)

(assert start!59946)

(declare-fun b!664553 () Bool)

(declare-fun e!381080 () Bool)

(declare-datatypes ((List!12730 0))(
  ( (Nil!12727) (Cons!12726 (h!13771 (_ BitVec 64)) (t!18958 List!12730)) )
))
(declare-fun acc!681 () List!12730)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3307 (List!12730 (_ BitVec 64)) Bool)

(assert (=> b!664553 (= e!381080 (contains!3307 acc!681 k!2843))))

(declare-fun b!664554 () Bool)

(declare-datatypes ((Unit!23170 0))(
  ( (Unit!23171) )
))
(declare-fun e!381076 () Unit!23170)

(declare-fun lt!309670 () Unit!23170)

(assert (=> b!664554 (= e!381076 lt!309670)))

(declare-fun lt!309664 () Unit!23170)

(declare-fun lemmaListSubSeqRefl!0 (List!12730) Unit!23170)

(assert (=> b!664554 (= lt!309664 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!46 (List!12730 List!12730) Bool)

(assert (=> b!664554 (subseq!46 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!38993 0))(
  ( (array!38994 (arr!18689 (Array (_ BitVec 32) (_ BitVec 64))) (size!19053 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38993)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38993 List!12730 List!12730 (_ BitVec 32)) Unit!23170)

(declare-fun $colon$colon!178 (List!12730 (_ BitVec 64)) List!12730)

(assert (=> b!664554 (= lt!309670 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!178 acc!681 (select (arr!18689 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38993 (_ BitVec 32) List!12730) Bool)

(assert (=> b!664554 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664555 () Bool)

(declare-fun res!432243 () Bool)

(declare-fun e!381079 () Bool)

(assert (=> b!664555 (=> res!432243 e!381079)))

(declare-fun lt!309671 () List!12730)

(assert (=> b!664555 (= res!432243 (not (contains!3307 lt!309671 k!2843)))))

(declare-fun b!664556 () Bool)

(declare-fun res!432230 () Bool)

(declare-fun e!381078 () Bool)

(assert (=> b!664556 (=> (not res!432230) (not e!381078))))

(declare-fun e!381077 () Bool)

(assert (=> b!664556 (= res!432230 e!381077)))

(declare-fun res!432236 () Bool)

(assert (=> b!664556 (=> res!432236 e!381077)))

(assert (=> b!664556 (= res!432236 e!381080)))

(declare-fun res!432227 () Bool)

(assert (=> b!664556 (=> (not res!432227) (not e!381080))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664556 (= res!432227 (bvsgt from!3004 i!1382))))

(declare-fun b!664557 () Bool)

(declare-fun res!432238 () Bool)

(assert (=> b!664557 (=> res!432238 e!381079)))

(assert (=> b!664557 (= res!432238 (contains!3307 acc!681 k!2843))))

(declare-fun b!664559 () Bool)

(declare-fun res!432225 () Bool)

(assert (=> b!664559 (=> (not res!432225) (not e!381078))))

(declare-fun noDuplicate!554 (List!12730) Bool)

(assert (=> b!664559 (= res!432225 (noDuplicate!554 acc!681))))

(declare-fun b!664560 () Bool)

(declare-fun res!432233 () Bool)

(assert (=> b!664560 (=> (not res!432233) (not e!381078))))

(declare-fun arrayContainsKey!0 (array!38993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664560 (= res!432233 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664561 () Bool)

(assert (=> b!664561 (= e!381078 (not e!381079))))

(declare-fun res!432239 () Bool)

(assert (=> b!664561 (=> res!432239 e!381079)))

(assert (=> b!664561 (= res!432239 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!44 (List!12730 (_ BitVec 64)) List!12730)

(assert (=> b!664561 (= (-!44 lt!309671 k!2843) acc!681)))

(assert (=> b!664561 (= lt!309671 ($colon$colon!178 acc!681 k!2843))))

(declare-fun lt!309669 () Unit!23170)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12730) Unit!23170)

(assert (=> b!664561 (= lt!309669 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!664561 (subseq!46 acc!681 acc!681)))

(declare-fun lt!309665 () Unit!23170)

(assert (=> b!664561 (= lt!309665 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664561 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309666 () Unit!23170)

(assert (=> b!664561 (= lt!309666 e!381076)))

(declare-fun c!76531 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664561 (= c!76531 (validKeyInArray!0 (select (arr!18689 a!3626) from!3004)))))

(declare-fun lt!309667 () Unit!23170)

(declare-fun e!381081 () Unit!23170)

(assert (=> b!664561 (= lt!309667 e!381081)))

(declare-fun c!76532 () Bool)

(declare-fun lt!309673 () Bool)

(assert (=> b!664561 (= c!76532 lt!309673)))

(assert (=> b!664561 (= lt!309673 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664561 (arrayContainsKey!0 (array!38994 (store (arr!18689 a!3626) i!1382 k!2843) (size!19053 a!3626)) k!2843 from!3004)))

(declare-fun b!664562 () Bool)

(declare-fun res!432244 () Bool)

(assert (=> b!664562 (=> (not res!432244) (not e!381078))))

(assert (=> b!664562 (= res!432244 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664563 () Bool)

(declare-fun Unit!23172 () Unit!23170)

(assert (=> b!664563 (= e!381081 Unit!23172)))

(declare-fun b!664564 () Bool)

(declare-fun res!432228 () Bool)

(assert (=> b!664564 (=> res!432228 e!381079)))

(assert (=> b!664564 (= res!432228 (contains!3307 lt!309671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664565 () Bool)

(declare-fun res!432240 () Bool)

(assert (=> b!664565 (=> (not res!432240) (not e!381078))))

(assert (=> b!664565 (= res!432240 (not (contains!3307 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664566 () Bool)

(declare-fun Unit!23173 () Unit!23170)

(assert (=> b!664566 (= e!381081 Unit!23173)))

(declare-fun lt!309668 () Unit!23170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38993 (_ BitVec 64) (_ BitVec 32)) Unit!23170)

(assert (=> b!664566 (= lt!309668 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664566 false))

(declare-fun b!664567 () Bool)

(declare-fun e!381074 () Bool)

(assert (=> b!664567 (= e!381074 (not (contains!3307 acc!681 k!2843)))))

(declare-fun b!664568 () Bool)

(assert (=> b!664568 (= e!381077 e!381074)))

(declare-fun res!432242 () Bool)

(assert (=> b!664568 (=> (not res!432242) (not e!381074))))

(assert (=> b!664568 (= res!432242 (bvsle from!3004 i!1382))))

(declare-fun b!664569 () Bool)

(declare-fun res!432245 () Bool)

(assert (=> b!664569 (=> res!432245 e!381079)))

(assert (=> b!664569 (= res!432245 (not (subseq!46 acc!681 lt!309671)))))

(declare-fun b!664570 () Bool)

(declare-fun res!432237 () Bool)

(assert (=> b!664570 (=> (not res!432237) (not e!381078))))

(assert (=> b!664570 (= res!432237 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12727))))

(declare-fun b!664571 () Bool)

(assert (=> b!664571 (= e!381079 true)))

(declare-fun lt!309672 () Bool)

(assert (=> b!664571 (= lt!309672 (contains!3307 lt!309671 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664572 () Bool)

(declare-fun res!432226 () Bool)

(assert (=> b!664572 (=> (not res!432226) (not e!381078))))

(assert (=> b!664572 (= res!432226 (not (contains!3307 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664573 () Bool)

(declare-fun res!432231 () Bool)

(assert (=> b!664573 (=> res!432231 e!381079)))

(assert (=> b!664573 (= res!432231 (not (noDuplicate!554 lt!309671)))))

(declare-fun b!664558 () Bool)

(declare-fun res!432234 () Bool)

(assert (=> b!664558 (=> res!432234 e!381079)))

(assert (=> b!664558 (= res!432234 lt!309673)))

(declare-fun res!432232 () Bool)

(assert (=> start!59946 (=> (not res!432232) (not e!381078))))

(assert (=> start!59946 (= res!432232 (and (bvslt (size!19053 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19053 a!3626))))))

(assert (=> start!59946 e!381078))

(assert (=> start!59946 true))

(declare-fun array_inv!14485 (array!38993) Bool)

(assert (=> start!59946 (array_inv!14485 a!3626)))

(declare-fun b!664574 () Bool)

(declare-fun res!432241 () Bool)

(assert (=> b!664574 (=> (not res!432241) (not e!381078))))

(assert (=> b!664574 (= res!432241 (validKeyInArray!0 k!2843))))

(declare-fun b!664575 () Bool)

(declare-fun Unit!23174 () Unit!23170)

(assert (=> b!664575 (= e!381076 Unit!23174)))

(declare-fun b!664576 () Bool)

(declare-fun res!432229 () Bool)

(assert (=> b!664576 (=> (not res!432229) (not e!381078))))

(assert (=> b!664576 (= res!432229 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19053 a!3626))))))

(declare-fun b!664577 () Bool)

(declare-fun res!432235 () Bool)

(assert (=> b!664577 (=> (not res!432235) (not e!381078))))

(assert (=> b!664577 (= res!432235 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19053 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!59946 res!432232) b!664559))

(assert (= (and b!664559 res!432225) b!664572))

(assert (= (and b!664572 res!432226) b!664565))

(assert (= (and b!664565 res!432240) b!664556))

(assert (= (and b!664556 res!432227) b!664553))

(assert (= (and b!664556 (not res!432236)) b!664568))

(assert (= (and b!664568 res!432242) b!664567))

(assert (= (and b!664556 res!432230) b!664570))

(assert (= (and b!664570 res!432237) b!664562))

(assert (= (and b!664562 res!432244) b!664576))

(assert (= (and b!664576 res!432229) b!664574))

(assert (= (and b!664574 res!432241) b!664560))

(assert (= (and b!664560 res!432233) b!664577))

(assert (= (and b!664577 res!432235) b!664561))

(assert (= (and b!664561 c!76532) b!664566))

(assert (= (and b!664561 (not c!76532)) b!664563))

(assert (= (and b!664561 c!76531) b!664554))

(assert (= (and b!664561 (not c!76531)) b!664575))

(assert (= (and b!664561 (not res!432239)) b!664573))

(assert (= (and b!664573 (not res!432231)) b!664558))

(assert (= (and b!664558 (not res!432234)) b!664557))

(assert (= (and b!664557 (not res!432238)) b!664569))

(assert (= (and b!664569 (not res!432245)) b!664555))

(assert (= (and b!664555 (not res!432243)) b!664564))

(assert (= (and b!664564 (not res!432228)) b!664571))

(declare-fun m!635829 () Bool)

(assert (=> b!664564 m!635829))

(declare-fun m!635831 () Bool)

(assert (=> b!664560 m!635831))

(declare-fun m!635833 () Bool)

(assert (=> b!664557 m!635833))

(assert (=> b!664553 m!635833))

(assert (=> b!664567 m!635833))

(declare-fun m!635835 () Bool)

(assert (=> b!664571 m!635835))

(declare-fun m!635837 () Bool)

(assert (=> start!59946 m!635837))

(declare-fun m!635839 () Bool)

(assert (=> b!664569 m!635839))

(declare-fun m!635841 () Bool)

(assert (=> b!664566 m!635841))

(declare-fun m!635843 () Bool)

(assert (=> b!664561 m!635843))

(declare-fun m!635845 () Bool)

(assert (=> b!664561 m!635845))

(declare-fun m!635847 () Bool)

(assert (=> b!664561 m!635847))

(declare-fun m!635849 () Bool)

(assert (=> b!664561 m!635849))

(declare-fun m!635851 () Bool)

(assert (=> b!664561 m!635851))

(declare-fun m!635853 () Bool)

(assert (=> b!664561 m!635853))

(declare-fun m!635855 () Bool)

(assert (=> b!664561 m!635855))

(declare-fun m!635857 () Bool)

(assert (=> b!664561 m!635857))

(assert (=> b!664561 m!635847))

(declare-fun m!635859 () Bool)

(assert (=> b!664561 m!635859))

(declare-fun m!635861 () Bool)

(assert (=> b!664561 m!635861))

(declare-fun m!635863 () Bool)

(assert (=> b!664561 m!635863))

(declare-fun m!635865 () Bool)

(assert (=> b!664565 m!635865))

(declare-fun m!635867 () Bool)

(assert (=> b!664570 m!635867))

(declare-fun m!635869 () Bool)

(assert (=> b!664555 m!635869))

(assert (=> b!664554 m!635845))

(assert (=> b!664554 m!635847))

(declare-fun m!635871 () Bool)

(assert (=> b!664554 m!635871))

(declare-fun m!635873 () Bool)

(assert (=> b!664554 m!635873))

(assert (=> b!664554 m!635847))

(assert (=> b!664554 m!635871))

(assert (=> b!664554 m!635853))

(assert (=> b!664554 m!635863))

(declare-fun m!635875 () Bool)

(assert (=> b!664572 m!635875))

(declare-fun m!635877 () Bool)

(assert (=> b!664573 m!635877))

(declare-fun m!635879 () Bool)

(assert (=> b!664559 m!635879))

(declare-fun m!635881 () Bool)

(assert (=> b!664574 m!635881))

(declare-fun m!635883 () Bool)

(assert (=> b!664562 m!635883))

(push 1)

(assert (not b!664566))

(assert (not b!664561))

(assert (not b!664565))

(assert (not b!664564))

(assert (not b!664553))

(assert (not b!664560))

(assert (not b!664573))

(assert (not b!664559))

(assert (not b!664557))

(assert (not b!664569))

(assert (not b!664555))

(assert (not b!664574))

(assert (not b!664570))

(assert (not b!664572))

(assert (not b!664562))

(assert (not b!664567))

(assert (not start!59946))

(assert (not b!664554))

(assert (not b!664571))

(check-sat)

