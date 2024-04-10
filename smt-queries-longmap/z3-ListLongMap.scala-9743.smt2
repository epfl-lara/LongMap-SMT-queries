; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115444 () Bool)

(assert start!115444)

(declare-fun b!1365161 () Bool)

(declare-fun res!908748 () Bool)

(declare-fun e!774151 () Bool)

(assert (=> b!1365161 (=> (not res!908748) (not e!774151))))

(declare-datatypes ((List!31879 0))(
  ( (Nil!31876) (Cons!31875 (h!33084 (_ BitVec 64)) (t!46573 List!31879)) )
))
(declare-fun lt!601213 () List!31879)

(declare-fun noDuplicate!2418 (List!31879) Bool)

(assert (=> b!1365161 (= res!908748 (noDuplicate!2418 lt!601213))))

(declare-fun b!1365162 () Bool)

(declare-fun res!908752 () Bool)

(assert (=> b!1365162 (=> (not res!908752) (not e!774151))))

(declare-fun lt!601211 () List!31879)

(declare-fun subseq!963 (List!31879 List!31879) Bool)

(assert (=> b!1365162 (= res!908752 (subseq!963 lt!601211 lt!601213))))

(declare-fun b!1365163 () Bool)

(declare-fun res!908746 () Bool)

(declare-fun e!774149 () Bool)

(assert (=> b!1365163 (=> (not res!908746) (not e!774149))))

(declare-fun newAcc!98 () List!31879)

(declare-fun contains!9561 (List!31879 (_ BitVec 64)) Bool)

(assert (=> b!1365163 (= res!908746 (not (contains!9561 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365164 () Bool)

(assert (=> b!1365164 (= e!774151 false)))

(declare-datatypes ((array!92765 0))(
  ( (array!92766 (arr!44811 (Array (_ BitVec 32) (_ BitVec 64))) (size!45361 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92765)

(declare-fun lt!601210 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92765 (_ BitVec 32) List!31879) Bool)

(assert (=> b!1365164 (= lt!601210 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601213))))

(declare-datatypes ((Unit!45059 0))(
  ( (Unit!45060) )
))
(declare-fun lt!601209 () Unit!45059)

(declare-fun noDuplicateSubseq!150 (List!31879 List!31879) Unit!45059)

(assert (=> b!1365164 (= lt!601209 (noDuplicateSubseq!150 lt!601211 lt!601213))))

(declare-fun b!1365165 () Bool)

(declare-fun res!908751 () Bool)

(assert (=> b!1365165 (=> (not res!908751) (not e!774149))))

(declare-fun acc!866 () List!31879)

(assert (=> b!1365165 (= res!908751 (not (contains!9561 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365166 () Bool)

(declare-fun res!908749 () Bool)

(assert (=> b!1365166 (=> (not res!908749) (not e!774149))))

(assert (=> b!1365166 (= res!908749 (subseq!963 newAcc!98 acc!866))))

(declare-fun b!1365167 () Bool)

(declare-fun e!774148 () Bool)

(assert (=> b!1365167 (= e!774148 e!774151)))

(declare-fun res!908740 () Bool)

(assert (=> b!1365167 (=> (not res!908740) (not e!774151))))

(assert (=> b!1365167 (= res!908740 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365167 (= lt!601211 (Cons!31875 (select (arr!44811 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365167 (= lt!601213 (Cons!31875 (select (arr!44811 a!3861) from!3239) acc!866))))

(declare-fun b!1365168 () Bool)

(declare-fun res!908744 () Bool)

(assert (=> b!1365168 (=> (not res!908744) (not e!774149))))

(assert (=> b!1365168 (= res!908744 (not (contains!9561 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365169 () Bool)

(assert (=> b!1365169 (= e!774149 e!774148)))

(declare-fun res!908747 () Bool)

(assert (=> b!1365169 (=> (not res!908747) (not e!774148))))

(assert (=> b!1365169 (= res!908747 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601212 () Unit!45059)

(assert (=> b!1365169 (= lt!601212 (noDuplicateSubseq!150 newAcc!98 acc!866))))

(declare-fun b!1365170 () Bool)

(declare-fun res!908736 () Bool)

(assert (=> b!1365170 (=> (not res!908736) (not e!774149))))

(assert (=> b!1365170 (= res!908736 (not (contains!9561 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365171 () Bool)

(declare-fun res!908738 () Bool)

(assert (=> b!1365171 (=> (not res!908738) (not e!774149))))

(assert (=> b!1365171 (= res!908738 (noDuplicate!2418 acc!866))))

(declare-fun b!1365172 () Bool)

(declare-fun res!908742 () Bool)

(assert (=> b!1365172 (=> (not res!908742) (not e!774148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365172 (= res!908742 (validKeyInArray!0 (select (arr!44811 a!3861) from!3239)))))

(declare-fun b!1365173 () Bool)

(declare-fun res!908735 () Bool)

(assert (=> b!1365173 (=> (not res!908735) (not e!774151))))

(assert (=> b!1365173 (= res!908735 (not (contains!9561 lt!601211 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365174 () Bool)

(declare-fun res!908739 () Bool)

(assert (=> b!1365174 (=> (not res!908739) (not e!774151))))

(assert (=> b!1365174 (= res!908739 (not (contains!9561 lt!601211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908745 () Bool)

(assert (=> start!115444 (=> (not res!908745) (not e!774149))))

(assert (=> start!115444 (= res!908745 (and (bvslt (size!45361 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45361 a!3861))))))

(assert (=> start!115444 e!774149))

(declare-fun array_inv!33839 (array!92765) Bool)

(assert (=> start!115444 (array_inv!33839 a!3861)))

(assert (=> start!115444 true))

(declare-fun b!1365175 () Bool)

(declare-fun res!908741 () Bool)

(assert (=> b!1365175 (=> (not res!908741) (not e!774151))))

(assert (=> b!1365175 (= res!908741 (not (contains!9561 lt!601213 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365176 () Bool)

(declare-fun res!908743 () Bool)

(assert (=> b!1365176 (=> (not res!908743) (not e!774148))))

(assert (=> b!1365176 (= res!908743 (not (contains!9561 acc!866 (select (arr!44811 a!3861) from!3239))))))

(declare-fun b!1365177 () Bool)

(declare-fun res!908750 () Bool)

(assert (=> b!1365177 (=> (not res!908750) (not e!774148))))

(assert (=> b!1365177 (= res!908750 (bvslt from!3239 (size!45361 a!3861)))))

(declare-fun b!1365178 () Bool)

(declare-fun res!908737 () Bool)

(assert (=> b!1365178 (=> (not res!908737) (not e!774151))))

(assert (=> b!1365178 (= res!908737 (not (contains!9561 lt!601213 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115444 res!908745) b!1365171))

(assert (= (and b!1365171 res!908738) b!1365170))

(assert (= (and b!1365170 res!908736) b!1365165))

(assert (= (and b!1365165 res!908751) b!1365163))

(assert (= (and b!1365163 res!908746) b!1365168))

(assert (= (and b!1365168 res!908744) b!1365166))

(assert (= (and b!1365166 res!908749) b!1365169))

(assert (= (and b!1365169 res!908747) b!1365177))

(assert (= (and b!1365177 res!908750) b!1365172))

(assert (= (and b!1365172 res!908742) b!1365176))

(assert (= (and b!1365176 res!908743) b!1365167))

(assert (= (and b!1365167 res!908740) b!1365161))

(assert (= (and b!1365161 res!908748) b!1365178))

(assert (= (and b!1365178 res!908737) b!1365175))

(assert (= (and b!1365175 res!908741) b!1365174))

(assert (= (and b!1365174 res!908739) b!1365173))

(assert (= (and b!1365173 res!908735) b!1365162))

(assert (= (and b!1365162 res!908752) b!1365164))

(declare-fun m!1249781 () Bool)

(assert (=> b!1365165 m!1249781))

(declare-fun m!1249783 () Bool)

(assert (=> b!1365176 m!1249783))

(assert (=> b!1365176 m!1249783))

(declare-fun m!1249785 () Bool)

(assert (=> b!1365176 m!1249785))

(declare-fun m!1249787 () Bool)

(assert (=> b!1365170 m!1249787))

(declare-fun m!1249789 () Bool)

(assert (=> b!1365163 m!1249789))

(declare-fun m!1249791 () Bool)

(assert (=> b!1365175 m!1249791))

(assert (=> b!1365172 m!1249783))

(assert (=> b!1365172 m!1249783))

(declare-fun m!1249793 () Bool)

(assert (=> b!1365172 m!1249793))

(declare-fun m!1249795 () Bool)

(assert (=> b!1365162 m!1249795))

(declare-fun m!1249797 () Bool)

(assert (=> b!1365164 m!1249797))

(declare-fun m!1249799 () Bool)

(assert (=> b!1365164 m!1249799))

(declare-fun m!1249801 () Bool)

(assert (=> b!1365178 m!1249801))

(declare-fun m!1249803 () Bool)

(assert (=> b!1365166 m!1249803))

(declare-fun m!1249805 () Bool)

(assert (=> b!1365161 m!1249805))

(assert (=> b!1365167 m!1249783))

(declare-fun m!1249807 () Bool)

(assert (=> b!1365173 m!1249807))

(declare-fun m!1249809 () Bool)

(assert (=> b!1365174 m!1249809))

(declare-fun m!1249811 () Bool)

(assert (=> b!1365169 m!1249811))

(declare-fun m!1249813 () Bool)

(assert (=> b!1365169 m!1249813))

(declare-fun m!1249815 () Bool)

(assert (=> b!1365168 m!1249815))

(declare-fun m!1249817 () Bool)

(assert (=> b!1365171 m!1249817))

(declare-fun m!1249819 () Bool)

(assert (=> start!115444 m!1249819))

(check-sat (not b!1365161) (not b!1365166) (not b!1365165) (not b!1365178) (not b!1365174) (not b!1365169) (not b!1365164) (not start!115444) (not b!1365175) (not b!1365162) (not b!1365163) (not b!1365170) (not b!1365176) (not b!1365173) (not b!1365168) (not b!1365172) (not b!1365171))
(check-sat)
