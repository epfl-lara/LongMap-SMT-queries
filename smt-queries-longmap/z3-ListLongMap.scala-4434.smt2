; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61568 () Bool)

(assert start!61568)

(declare-fun b!688874 () Bool)

(declare-fun e!392246 () Bool)

(declare-fun e!392240 () Bool)

(assert (=> b!688874 (= e!392246 e!392240)))

(declare-fun res!453641 () Bool)

(assert (=> b!688874 (=> (not res!453641) (not e!392240))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688874 (= res!453641 (bvsle from!3004 i!1382))))

(declare-fun b!688875 () Bool)

(declare-datatypes ((Unit!24305 0))(
  ( (Unit!24306) )
))
(declare-fun e!392242 () Unit!24305)

(declare-fun Unit!24307 () Unit!24305)

(assert (=> b!688875 (= e!392242 Unit!24307)))

(declare-fun lt!315806 () Unit!24305)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39720 0))(
  ( (array!39721 (arr!19031 (Array (_ BitVec 32) (_ BitVec 64))) (size!19412 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39720 (_ BitVec 64) (_ BitVec 32)) Unit!24305)

(assert (=> b!688875 (= lt!315806 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688875 false))

(declare-fun b!688876 () Bool)

(declare-fun res!453642 () Bool)

(declare-fun e!392243 () Bool)

(assert (=> b!688876 (=> (not res!453642) (not e!392243))))

(declare-datatypes ((List!13111 0))(
  ( (Nil!13108) (Cons!13107 (h!14152 (_ BitVec 64)) (t!19366 List!13111)) )
))
(declare-fun acc!681 () List!13111)

(declare-fun noDuplicate!902 (List!13111) Bool)

(assert (=> b!688876 (= res!453642 (noDuplicate!902 acc!681))))

(declare-fun b!688877 () Bool)

(declare-fun res!453628 () Bool)

(assert (=> b!688877 (=> (not res!453628) (not e!392243))))

(declare-fun arrayNoDuplicates!0 (array!39720 (_ BitVec 32) List!13111) Bool)

(assert (=> b!688877 (= res!453628 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13108))))

(declare-fun b!688878 () Bool)

(declare-fun e!392249 () Unit!24305)

(declare-fun Unit!24308 () Unit!24305)

(assert (=> b!688878 (= e!392249 Unit!24308)))

(declare-fun b!688879 () Bool)

(declare-fun res!453623 () Bool)

(assert (=> b!688879 (=> (not res!453623) (not e!392243))))

(declare-fun contains!3633 (List!13111 (_ BitVec 64)) Bool)

(assert (=> b!688879 (= res!453623 (not (contains!3633 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!453643 () Bool)

(assert (=> start!61568 (=> (not res!453643) (not e!392243))))

(assert (=> start!61568 (= res!453643 (and (bvslt (size!19412 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19412 a!3626))))))

(assert (=> start!61568 e!392243))

(assert (=> start!61568 true))

(declare-fun array_inv!14914 (array!39720) Bool)

(assert (=> start!61568 (array_inv!14914 a!3626)))

(declare-fun b!688880 () Bool)

(declare-fun res!453622 () Bool)

(assert (=> b!688880 (=> (not res!453622) (not e!392243))))

(assert (=> b!688880 (= res!453622 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19412 a!3626))))))

(declare-fun b!688881 () Bool)

(declare-fun res!453635 () Bool)

(assert (=> b!688881 (=> (not res!453635) (not e!392243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688881 (= res!453635 (validKeyInArray!0 k0!2843))))

(declare-fun b!688882 () Bool)

(declare-fun e!392248 () Bool)

(declare-fun e!392245 () Bool)

(assert (=> b!688882 (= e!392248 e!392245)))

(declare-fun res!453639 () Bool)

(assert (=> b!688882 (=> res!453639 e!392245)))

(assert (=> b!688882 (= res!453639 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688883 () Bool)

(declare-fun lt!315804 () Unit!24305)

(assert (=> b!688883 (= e!392249 lt!315804)))

(declare-fun lt!315810 () Unit!24305)

(declare-fun lemmaListSubSeqRefl!0 (List!13111) Unit!24305)

(assert (=> b!688883 (= lt!315810 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!236 (List!13111 List!13111) Bool)

(assert (=> b!688883 (subseq!236 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39720 List!13111 List!13111 (_ BitVec 32)) Unit!24305)

(declare-fun $colon$colon!400 (List!13111 (_ BitVec 64)) List!13111)

(assert (=> b!688883 (= lt!315804 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!400 acc!681 (select (arr!19031 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688883 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688884 () Bool)

(declare-fun res!453632 () Bool)

(assert (=> b!688884 (=> (not res!453632) (not e!392243))))

(assert (=> b!688884 (= res!453632 e!392246)))

(declare-fun res!453640 () Bool)

(assert (=> b!688884 (=> res!453640 e!392246)))

(declare-fun e!392247 () Bool)

(assert (=> b!688884 (= res!453640 e!392247)))

(declare-fun res!453627 () Bool)

(assert (=> b!688884 (=> (not res!453627) (not e!392247))))

(assert (=> b!688884 (= res!453627 (bvsgt from!3004 i!1382))))

(declare-fun b!688885 () Bool)

(declare-fun res!453638 () Bool)

(declare-fun e!392239 () Bool)

(assert (=> b!688885 (=> res!453638 e!392239)))

(declare-fun lt!315803 () List!13111)

(assert (=> b!688885 (= res!453638 (contains!3633 lt!315803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688886 () Bool)

(declare-fun Unit!24309 () Unit!24305)

(assert (=> b!688886 (= e!392242 Unit!24309)))

(declare-fun b!688887 () Bool)

(declare-fun res!453630 () Bool)

(assert (=> b!688887 (=> (not res!453630) (not e!392243))))

(assert (=> b!688887 (= res!453630 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19412 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688888 () Bool)

(assert (=> b!688888 (= e!392240 (not (contains!3633 acc!681 k0!2843)))))

(declare-fun b!688889 () Bool)

(declare-fun res!453636 () Bool)

(assert (=> b!688889 (=> (not res!453636) (not e!392243))))

(declare-fun arrayContainsKey!0 (array!39720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688889 (= res!453636 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688890 () Bool)

(declare-fun e!392241 () Bool)

(assert (=> b!688890 (= e!392241 (not (contains!3633 lt!315803 k0!2843)))))

(declare-fun b!688891 () Bool)

(declare-fun res!453631 () Bool)

(assert (=> b!688891 (=> (not res!453631) (not e!392243))))

(assert (=> b!688891 (= res!453631 (not (contains!3633 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688892 () Bool)

(declare-fun res!453633 () Bool)

(assert (=> b!688892 (=> (not res!453633) (not e!392243))))

(assert (=> b!688892 (= res!453633 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688893 () Bool)

(assert (=> b!688893 (= e!392247 (contains!3633 acc!681 k0!2843))))

(declare-fun b!688894 () Bool)

(declare-fun res!453634 () Bool)

(assert (=> b!688894 (=> res!453634 e!392239)))

(assert (=> b!688894 (= res!453634 (contains!3633 lt!315803 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688895 () Bool)

(declare-fun res!453625 () Bool)

(assert (=> b!688895 (=> res!453625 e!392239)))

(assert (=> b!688895 (= res!453625 (not (noDuplicate!902 lt!315803)))))

(declare-fun b!688896 () Bool)

(declare-fun res!453629 () Bool)

(assert (=> b!688896 (=> res!453629 e!392239)))

(assert (=> b!688896 (= res!453629 e!392248)))

(declare-fun res!453637 () Bool)

(assert (=> b!688896 (=> (not res!453637) (not e!392248))))

(assert (=> b!688896 (= res!453637 e!392241)))

(declare-fun res!453626 () Bool)

(assert (=> b!688896 (=> res!453626 e!392241)))

(assert (=> b!688896 (= res!453626 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688897 () Bool)

(assert (=> b!688897 (= e!392245 (contains!3633 lt!315803 k0!2843))))

(declare-fun b!688898 () Bool)

(assert (=> b!688898 (= e!392239 (bvslt (bvsub (size!19412 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19412 a!3626) from!3004)))))

(declare-fun b!688899 () Bool)

(assert (=> b!688899 (= e!392243 (not e!392239))))

(declare-fun res!453624 () Bool)

(assert (=> b!688899 (=> res!453624 e!392239)))

(assert (=> b!688899 (= res!453624 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688899 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315803)))

(declare-fun lt!315809 () Unit!24305)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39720 (_ BitVec 64) (_ BitVec 32) List!13111 List!13111) Unit!24305)

(assert (=> b!688899 (= lt!315809 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315803))))

(declare-fun -!201 (List!13111 (_ BitVec 64)) List!13111)

(assert (=> b!688899 (= (-!201 lt!315803 k0!2843) acc!681)))

(assert (=> b!688899 (= lt!315803 ($colon$colon!400 acc!681 k0!2843))))

(declare-fun lt!315805 () Unit!24305)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13111) Unit!24305)

(assert (=> b!688899 (= lt!315805 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!688899 (subseq!236 acc!681 acc!681)))

(declare-fun lt!315802 () Unit!24305)

(assert (=> b!688899 (= lt!315802 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688899 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315807 () Unit!24305)

(assert (=> b!688899 (= lt!315807 e!392249)))

(declare-fun c!77994 () Bool)

(assert (=> b!688899 (= c!77994 (validKeyInArray!0 (select (arr!19031 a!3626) from!3004)))))

(declare-fun lt!315808 () Unit!24305)

(assert (=> b!688899 (= lt!315808 e!392242)))

(declare-fun c!77993 () Bool)

(assert (=> b!688899 (= c!77993 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688899 (arrayContainsKey!0 (array!39721 (store (arr!19031 a!3626) i!1382 k0!2843) (size!19412 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61568 res!453643) b!688876))

(assert (= (and b!688876 res!453642) b!688891))

(assert (= (and b!688891 res!453631) b!688879))

(assert (= (and b!688879 res!453623) b!688884))

(assert (= (and b!688884 res!453627) b!688893))

(assert (= (and b!688884 (not res!453640)) b!688874))

(assert (= (and b!688874 res!453641) b!688888))

(assert (= (and b!688884 res!453632) b!688877))

(assert (= (and b!688877 res!453628) b!688892))

(assert (= (and b!688892 res!453633) b!688880))

(assert (= (and b!688880 res!453622) b!688881))

(assert (= (and b!688881 res!453635) b!688889))

(assert (= (and b!688889 res!453636) b!688887))

(assert (= (and b!688887 res!453630) b!688899))

(assert (= (and b!688899 c!77993) b!688875))

(assert (= (and b!688899 (not c!77993)) b!688886))

(assert (= (and b!688899 c!77994) b!688883))

(assert (= (and b!688899 (not c!77994)) b!688878))

(assert (= (and b!688899 (not res!453624)) b!688895))

(assert (= (and b!688895 (not res!453625)) b!688885))

(assert (= (and b!688885 (not res!453638)) b!688894))

(assert (= (and b!688894 (not res!453634)) b!688896))

(assert (= (and b!688896 (not res!453626)) b!688890))

(assert (= (and b!688896 res!453637) b!688882))

(assert (= (and b!688882 (not res!453639)) b!688897))

(assert (= (and b!688896 (not res!453629)) b!688898))

(declare-fun m!652113 () Bool)

(assert (=> b!688899 m!652113))

(declare-fun m!652115 () Bool)

(assert (=> b!688899 m!652115))

(declare-fun m!652117 () Bool)

(assert (=> b!688899 m!652117))

(declare-fun m!652119 () Bool)

(assert (=> b!688899 m!652119))

(declare-fun m!652121 () Bool)

(assert (=> b!688899 m!652121))

(declare-fun m!652123 () Bool)

(assert (=> b!688899 m!652123))

(declare-fun m!652125 () Bool)

(assert (=> b!688899 m!652125))

(declare-fun m!652127 () Bool)

(assert (=> b!688899 m!652127))

(declare-fun m!652129 () Bool)

(assert (=> b!688899 m!652129))

(declare-fun m!652131 () Bool)

(assert (=> b!688899 m!652131))

(assert (=> b!688899 m!652129))

(declare-fun m!652133 () Bool)

(assert (=> b!688899 m!652133))

(declare-fun m!652135 () Bool)

(assert (=> b!688899 m!652135))

(declare-fun m!652137 () Bool)

(assert (=> b!688899 m!652137))

(declare-fun m!652139 () Bool)

(assert (=> b!688890 m!652139))

(declare-fun m!652141 () Bool)

(assert (=> b!688889 m!652141))

(declare-fun m!652143 () Bool)

(assert (=> b!688895 m!652143))

(assert (=> b!688897 m!652139))

(declare-fun m!652145 () Bool)

(assert (=> b!688893 m!652145))

(declare-fun m!652147 () Bool)

(assert (=> b!688885 m!652147))

(assert (=> b!688888 m!652145))

(declare-fun m!652149 () Bool)

(assert (=> b!688877 m!652149))

(assert (=> b!688883 m!652113))

(assert (=> b!688883 m!652129))

(declare-fun m!652151 () Bool)

(assert (=> b!688883 m!652151))

(declare-fun m!652153 () Bool)

(assert (=> b!688883 m!652153))

(assert (=> b!688883 m!652129))

(assert (=> b!688883 m!652151))

(assert (=> b!688883 m!652121))

(assert (=> b!688883 m!652137))

(declare-fun m!652155 () Bool)

(assert (=> b!688892 m!652155))

(declare-fun m!652157 () Bool)

(assert (=> b!688876 m!652157))

(declare-fun m!652159 () Bool)

(assert (=> b!688875 m!652159))

(declare-fun m!652161 () Bool)

(assert (=> b!688881 m!652161))

(declare-fun m!652163 () Bool)

(assert (=> b!688891 m!652163))

(declare-fun m!652165 () Bool)

(assert (=> b!688879 m!652165))

(declare-fun m!652167 () Bool)

(assert (=> b!688894 m!652167))

(declare-fun m!652169 () Bool)

(assert (=> start!61568 m!652169))

(check-sat (not b!688883) (not b!688893) (not b!688892) (not b!688891) (not b!688877) (not b!688881) (not b!688876) (not b!688879) (not b!688894) (not start!61568) (not b!688897) (not b!688889) (not b!688890) (not b!688875) (not b!688888) (not b!688899) (not b!688895) (not b!688885))
(check-sat)
