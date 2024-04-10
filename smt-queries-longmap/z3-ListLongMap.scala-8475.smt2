; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103208 () Bool)

(assert start!103208)

(declare-fun b!1238919 () Bool)

(declare-datatypes ((Unit!41146 0))(
  ( (Unit!41147) )
))
(declare-fun e!702120 () Unit!41146)

(declare-fun Unit!41148 () Unit!41146)

(assert (=> b!1238919 (= e!702120 Unit!41148)))

(declare-fun b!1238920 () Bool)

(declare-fun res!826505 () Bool)

(declare-fun e!702119 () Bool)

(assert (=> b!1238920 (=> (not res!826505) (not e!702119))))

(declare-datatypes ((List!27296 0))(
  ( (Nil!27293) (Cons!27292 (h!28501 (_ BitVec 64)) (t!40759 List!27296)) )
))
(declare-fun acc!846 () List!27296)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7358 (List!27296 (_ BitVec 64)) Bool)

(assert (=> b!1238920 (= res!826505 (contains!7358 acc!846 k0!2925))))

(declare-fun b!1238921 () Bool)

(declare-fun res!826502 () Bool)

(assert (=> b!1238921 (=> (not res!826502) (not e!702119))))

(declare-fun noDuplicate!1955 (List!27296) Bool)

(assert (=> b!1238921 (= res!826502 (noDuplicate!1955 acc!846))))

(declare-fun b!1238923 () Bool)

(declare-fun lt!561506 () Unit!41146)

(assert (=> b!1238923 (= e!702120 lt!561506)))

(declare-fun lt!561504 () List!27296)

(declare-datatypes ((array!79843 0))(
  ( (array!79844 (arr!38523 (Array (_ BitVec 32) (_ BitVec 64))) (size!39059 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79843)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238923 (= lt!561504 (Cons!27292 (select (arr!38523 a!3835) from!3213) acc!846))))

(declare-fun lt!561503 () Unit!41146)

(declare-fun lemmaListSubSeqRefl!0 (List!27296) Unit!41146)

(assert (=> b!1238923 (= lt!561503 (lemmaListSubSeqRefl!0 lt!561504))))

(declare-fun subseq!612 (List!27296 List!27296) Bool)

(assert (=> b!1238923 (subseq!612 lt!561504 lt!561504)))

(declare-fun lt!561505 () Unit!41146)

(declare-fun subseqTail!99 (List!27296 List!27296) Unit!41146)

(assert (=> b!1238923 (= lt!561505 (subseqTail!99 lt!561504 lt!561504))))

(assert (=> b!1238923 (subseq!612 acc!846 lt!561504)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79843 List!27296 List!27296 (_ BitVec 32)) Unit!41146)

(assert (=> b!1238923 (= lt!561506 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561504 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79843 (_ BitVec 32) List!27296) Bool)

(assert (=> b!1238923 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238924 () Bool)

(declare-fun res!826504 () Bool)

(assert (=> b!1238924 (=> (not res!826504) (not e!702119))))

(assert (=> b!1238924 (= res!826504 (not (contains!7358 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238925 () Bool)

(declare-fun res!826501 () Bool)

(assert (=> b!1238925 (=> (not res!826501) (not e!702119))))

(assert (=> b!1238925 (= res!826501 (not (contains!7358 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238926 () Bool)

(declare-fun res!826503 () Bool)

(assert (=> b!1238926 (=> (not res!826503) (not e!702119))))

(assert (=> b!1238926 (= res!826503 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238927 () Bool)

(assert (=> b!1238927 (= e!702119 false)))

(declare-fun lt!561502 () Unit!41146)

(assert (=> b!1238927 (= lt!561502 e!702120)))

(declare-fun c!121069 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238927 (= c!121069 (validKeyInArray!0 (select (arr!38523 a!3835) from!3213)))))

(declare-fun res!826507 () Bool)

(assert (=> start!103208 (=> (not res!826507) (not e!702119))))

(assert (=> start!103208 (= res!826507 (and (bvslt (size!39059 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39059 a!3835))))))

(assert (=> start!103208 e!702119))

(declare-fun array_inv!29371 (array!79843) Bool)

(assert (=> start!103208 (array_inv!29371 a!3835)))

(assert (=> start!103208 true))

(declare-fun b!1238922 () Bool)

(declare-fun res!826506 () Bool)

(assert (=> b!1238922 (=> (not res!826506) (not e!702119))))

(assert (=> b!1238922 (= res!826506 (not (= from!3213 (bvsub (size!39059 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!103208 res!826507) b!1238921))

(assert (= (and b!1238921 res!826502) b!1238924))

(assert (= (and b!1238924 res!826504) b!1238925))

(assert (= (and b!1238925 res!826501) b!1238926))

(assert (= (and b!1238926 res!826503) b!1238920))

(assert (= (and b!1238920 res!826505) b!1238922))

(assert (= (and b!1238922 res!826506) b!1238927))

(assert (= (and b!1238927 c!121069) b!1238923))

(assert (= (and b!1238927 (not c!121069)) b!1238919))

(declare-fun m!1142435 () Bool)

(assert (=> b!1238927 m!1142435))

(assert (=> b!1238927 m!1142435))

(declare-fun m!1142437 () Bool)

(assert (=> b!1238927 m!1142437))

(declare-fun m!1142439 () Bool)

(assert (=> b!1238923 m!1142439))

(assert (=> b!1238923 m!1142435))

(declare-fun m!1142441 () Bool)

(assert (=> b!1238923 m!1142441))

(declare-fun m!1142443 () Bool)

(assert (=> b!1238923 m!1142443))

(declare-fun m!1142445 () Bool)

(assert (=> b!1238923 m!1142445))

(declare-fun m!1142447 () Bool)

(assert (=> b!1238923 m!1142447))

(declare-fun m!1142449 () Bool)

(assert (=> b!1238923 m!1142449))

(declare-fun m!1142451 () Bool)

(assert (=> b!1238924 m!1142451))

(declare-fun m!1142453 () Bool)

(assert (=> b!1238925 m!1142453))

(declare-fun m!1142455 () Bool)

(assert (=> b!1238921 m!1142455))

(declare-fun m!1142457 () Bool)

(assert (=> start!103208 m!1142457))

(declare-fun m!1142459 () Bool)

(assert (=> b!1238926 m!1142459))

(declare-fun m!1142461 () Bool)

(assert (=> b!1238920 m!1142461))

(check-sat (not b!1238925) (not b!1238921) (not b!1238924) (not b!1238920) (not start!103208) (not b!1238923) (not b!1238926) (not b!1238927))
(check-sat)
