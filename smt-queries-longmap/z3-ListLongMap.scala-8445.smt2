; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103042 () Bool)

(assert start!103042)

(declare-fun b!1236855 () Bool)

(declare-fun res!824187 () Bool)

(declare-fun e!701346 () Bool)

(assert (=> b!1236855 (=> (not res!824187) (not e!701346))))

(declare-datatypes ((List!27230 0))(
  ( (Nil!27227) (Cons!27226 (h!28444 (_ BitVec 64)) (t!40685 List!27230)) )
))
(declare-fun acc!846 () List!27230)

(declare-fun contains!7301 (List!27230 (_ BitVec 64)) Bool)

(assert (=> b!1236855 (= res!824187 (not (contains!7301 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236856 () Bool)

(declare-fun res!824191 () Bool)

(assert (=> b!1236856 (=> (not res!824191) (not e!701346))))

(assert (=> b!1236856 (= res!824191 (not (contains!7301 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236857 () Bool)

(declare-fun res!824189 () Bool)

(assert (=> b!1236857 (=> (not res!824189) (not e!701346))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79685 0))(
  ( (array!79686 (arr!38444 (Array (_ BitVec 32) (_ BitVec 64))) (size!38981 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79685)

(assert (=> b!1236857 (= res!824189 (not (= from!3213 (bvsub (size!38981 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236858 () Bool)

(declare-datatypes ((Unit!40913 0))(
  ( (Unit!40914) )
))
(declare-fun e!701345 () Unit!40913)

(declare-fun Unit!40915 () Unit!40913)

(assert (=> b!1236858 (= e!701345 Unit!40915)))

(declare-fun b!1236859 () Bool)

(declare-fun e!701347 () Bool)

(assert (=> b!1236859 (= e!701346 e!701347)))

(declare-fun res!824192 () Bool)

(assert (=> b!1236859 (=> (not res!824192) (not e!701347))))

(assert (=> b!1236859 (= res!824192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38981 a!3835))))))

(declare-fun lt!560835 () Unit!40913)

(assert (=> b!1236859 (= lt!560835 e!701345)))

(declare-fun c!121202 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236859 (= c!121202 (validKeyInArray!0 (select (arr!38444 a!3835) from!3213)))))

(declare-fun b!1236860 () Bool)

(declare-fun res!824193 () Bool)

(assert (=> b!1236860 (=> (not res!824193) (not e!701346))))

(declare-fun noDuplicate!1882 (List!27230) Bool)

(assert (=> b!1236860 (= res!824193 (noDuplicate!1882 acc!846))))

(declare-fun b!1236861 () Bool)

(declare-fun res!824188 () Bool)

(assert (=> b!1236861 (=> (not res!824188) (not e!701346))))

(declare-fun arrayNoDuplicates!0 (array!79685 (_ BitVec 32) List!27230) Bool)

(assert (=> b!1236861 (= res!824188 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236862 () Bool)

(assert (=> b!1236862 (= e!701347 false)))

(declare-fun lt!560832 () Bool)

(assert (=> b!1236862 (= lt!560832 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun res!824186 () Bool)

(assert (=> start!103042 (=> (not res!824186) (not e!701346))))

(assert (=> start!103042 (= res!824186 (and (bvslt (size!38981 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38981 a!3835))))))

(assert (=> start!103042 e!701346))

(declare-fun array_inv!29382 (array!79685) Bool)

(assert (=> start!103042 (array_inv!29382 a!3835)))

(assert (=> start!103042 true))

(declare-fun b!1236863 () Bool)

(declare-fun lt!560837 () Unit!40913)

(assert (=> b!1236863 (= e!701345 lt!560837)))

(declare-fun lt!560833 () List!27230)

(assert (=> b!1236863 (= lt!560833 (Cons!27226 (select (arr!38444 a!3835) from!3213) acc!846))))

(declare-fun lt!560834 () Unit!40913)

(declare-fun lemmaListSubSeqRefl!0 (List!27230) Unit!40913)

(assert (=> b!1236863 (= lt!560834 (lemmaListSubSeqRefl!0 lt!560833))))

(declare-fun subseq!539 (List!27230 List!27230) Bool)

(assert (=> b!1236863 (subseq!539 lt!560833 lt!560833)))

(declare-fun lt!560836 () Unit!40913)

(declare-fun subseqTail!32 (List!27230 List!27230) Unit!40913)

(assert (=> b!1236863 (= lt!560836 (subseqTail!32 lt!560833 lt!560833))))

(assert (=> b!1236863 (subseq!539 acc!846 lt!560833)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79685 List!27230 List!27230 (_ BitVec 32)) Unit!40913)

(assert (=> b!1236863 (= lt!560837 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560833 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236863 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236864 () Bool)

(declare-fun res!824190 () Bool)

(assert (=> b!1236864 (=> (not res!824190) (not e!701346))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236864 (= res!824190 (contains!7301 acc!846 k0!2925))))

(assert (= (and start!103042 res!824186) b!1236860))

(assert (= (and b!1236860 res!824193) b!1236856))

(assert (= (and b!1236856 res!824191) b!1236855))

(assert (= (and b!1236855 res!824187) b!1236861))

(assert (= (and b!1236861 res!824188) b!1236864))

(assert (= (and b!1236864 res!824190) b!1236857))

(assert (= (and b!1236857 res!824189) b!1236859))

(assert (= (and b!1236859 c!121202) b!1236863))

(assert (= (and b!1236859 (not c!121202)) b!1236858))

(assert (= (and b!1236859 res!824192) b!1236862))

(declare-fun m!1141055 () Bool)

(assert (=> b!1236855 m!1141055))

(declare-fun m!1141057 () Bool)

(assert (=> b!1236861 m!1141057))

(declare-fun m!1141059 () Bool)

(assert (=> b!1236859 m!1141059))

(assert (=> b!1236859 m!1141059))

(declare-fun m!1141061 () Bool)

(assert (=> b!1236859 m!1141061))

(declare-fun m!1141063 () Bool)

(assert (=> b!1236863 m!1141063))

(declare-fun m!1141065 () Bool)

(assert (=> b!1236863 m!1141065))

(declare-fun m!1141067 () Bool)

(assert (=> b!1236863 m!1141067))

(assert (=> b!1236863 m!1141059))

(declare-fun m!1141069 () Bool)

(assert (=> b!1236863 m!1141069))

(declare-fun m!1141071 () Bool)

(assert (=> b!1236863 m!1141071))

(declare-fun m!1141073 () Bool)

(assert (=> b!1236863 m!1141073))

(declare-fun m!1141075 () Bool)

(assert (=> b!1236856 m!1141075))

(declare-fun m!1141077 () Bool)

(assert (=> b!1236860 m!1141077))

(assert (=> b!1236862 m!1141071))

(declare-fun m!1141079 () Bool)

(assert (=> start!103042 m!1141079))

(declare-fun m!1141081 () Bool)

(assert (=> b!1236864 m!1141081))

(check-sat (not b!1236860) (not b!1236862) (not b!1236855) (not b!1236856) (not b!1236859) (not b!1236864) (not b!1236863) (not start!103042) (not b!1236861))
(check-sat)
