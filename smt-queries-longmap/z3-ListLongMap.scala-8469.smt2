; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103118 () Bool)

(assert start!103118)

(declare-fun b!1238134 () Bool)

(declare-fun e!701751 () Bool)

(declare-fun e!701749 () Bool)

(assert (=> b!1238134 (= e!701751 (not e!701749))))

(declare-fun res!825860 () Bool)

(assert (=> b!1238134 (=> res!825860 e!701749)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238134 (= res!825860 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27278 0))(
  ( (Nil!27275) (Cons!27274 (h!28483 (_ BitVec 64)) (t!40741 List!27278)) )
))
(declare-fun acc!846 () List!27278)

(declare-fun lt!561206 () List!27278)

(declare-fun subseq!594 (List!27278 List!27278) Bool)

(assert (=> b!1238134 (subseq!594 acc!846 lt!561206)))

(declare-datatypes ((Unit!41096 0))(
  ( (Unit!41097) )
))
(declare-fun lt!561208 () Unit!41096)

(declare-fun subseqTail!81 (List!27278 List!27278) Unit!41096)

(assert (=> b!1238134 (= lt!561208 (subseqTail!81 lt!561206 lt!561206))))

(assert (=> b!1238134 (subseq!594 lt!561206 lt!561206)))

(declare-fun lt!561207 () Unit!41096)

(declare-fun lemmaListSubSeqRefl!0 (List!27278) Unit!41096)

(assert (=> b!1238134 (= lt!561207 (lemmaListSubSeqRefl!0 lt!561206))))

(declare-datatypes ((array!79804 0))(
  ( (array!79805 (arr!38505 (Array (_ BitVec 32) (_ BitVec 64))) (size!39041 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79804)

(assert (=> b!1238134 (= lt!561206 (Cons!27274 (select (arr!38505 a!3835) from!3213) acc!846))))

(declare-fun b!1238135 () Bool)

(declare-fun res!825866 () Bool)

(assert (=> b!1238135 (=> res!825866 e!701749)))

(declare-fun contains!7340 (List!27278 (_ BitVec 64)) Bool)

(assert (=> b!1238135 (= res!825866 (contains!7340 lt!561206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238136 () Bool)

(declare-fun res!825864 () Bool)

(assert (=> b!1238136 (=> (not res!825864) (not e!701751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238136 (= res!825864 (validKeyInArray!0 (select (arr!38505 a!3835) from!3213)))))

(declare-fun b!1238137 () Bool)

(declare-fun res!825863 () Bool)

(assert (=> b!1238137 (=> (not res!825863) (not e!701751))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238137 (= res!825863 (contains!7340 acc!846 k0!2925))))

(declare-fun b!1238138 () Bool)

(declare-fun res!825859 () Bool)

(assert (=> b!1238138 (=> (not res!825859) (not e!701751))))

(declare-fun arrayNoDuplicates!0 (array!79804 (_ BitVec 32) List!27278) Bool)

(assert (=> b!1238138 (= res!825859 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825867 () Bool)

(assert (=> start!103118 (=> (not res!825867) (not e!701751))))

(assert (=> start!103118 (= res!825867 (and (bvslt (size!39041 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39041 a!3835))))))

(assert (=> start!103118 e!701751))

(declare-fun array_inv!29353 (array!79804) Bool)

(assert (=> start!103118 (array_inv!29353 a!3835)))

(assert (=> start!103118 true))

(declare-fun b!1238139 () Bool)

(declare-fun res!825865 () Bool)

(assert (=> b!1238139 (=> (not res!825865) (not e!701751))))

(declare-fun noDuplicate!1937 (List!27278) Bool)

(assert (=> b!1238139 (= res!825865 (noDuplicate!1937 acc!846))))

(declare-fun b!1238140 () Bool)

(declare-fun res!825862 () Bool)

(assert (=> b!1238140 (=> (not res!825862) (not e!701751))))

(assert (=> b!1238140 (= res!825862 (not (contains!7340 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238141 () Bool)

(assert (=> b!1238141 (= e!701749 true)))

(declare-fun lt!561209 () Bool)

(assert (=> b!1238141 (= lt!561209 (contains!7340 lt!561206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238142 () Bool)

(declare-fun res!825868 () Bool)

(assert (=> b!1238142 (=> (not res!825868) (not e!701751))))

(assert (=> b!1238142 (= res!825868 (not (contains!7340 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238143 () Bool)

(declare-fun res!825858 () Bool)

(assert (=> b!1238143 (=> (not res!825858) (not e!701751))))

(assert (=> b!1238143 (= res!825858 (not (= from!3213 (bvsub (size!39041 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238144 () Bool)

(declare-fun res!825861 () Bool)

(assert (=> b!1238144 (=> res!825861 e!701749)))

(assert (=> b!1238144 (= res!825861 (not (noDuplicate!1937 lt!561206)))))

(assert (= (and start!103118 res!825867) b!1238139))

(assert (= (and b!1238139 res!825865) b!1238142))

(assert (= (and b!1238142 res!825868) b!1238140))

(assert (= (and b!1238140 res!825862) b!1238138))

(assert (= (and b!1238138 res!825859) b!1238137))

(assert (= (and b!1238137 res!825863) b!1238143))

(assert (= (and b!1238143 res!825858) b!1238136))

(assert (= (and b!1238136 res!825864) b!1238134))

(assert (= (and b!1238134 (not res!825860)) b!1238144))

(assert (= (and b!1238144 (not res!825861)) b!1238135))

(assert (= (and b!1238135 (not res!825866)) b!1238141))

(declare-fun m!1141705 () Bool)

(assert (=> b!1238144 m!1141705))

(declare-fun m!1141707 () Bool)

(assert (=> b!1238139 m!1141707))

(declare-fun m!1141709 () Bool)

(assert (=> b!1238142 m!1141709))

(declare-fun m!1141711 () Bool)

(assert (=> start!103118 m!1141711))

(declare-fun m!1141713 () Bool)

(assert (=> b!1238140 m!1141713))

(declare-fun m!1141715 () Bool)

(assert (=> b!1238134 m!1141715))

(declare-fun m!1141717 () Bool)

(assert (=> b!1238134 m!1141717))

(declare-fun m!1141719 () Bool)

(assert (=> b!1238134 m!1141719))

(declare-fun m!1141721 () Bool)

(assert (=> b!1238134 m!1141721))

(declare-fun m!1141723 () Bool)

(assert (=> b!1238134 m!1141723))

(declare-fun m!1141725 () Bool)

(assert (=> b!1238138 m!1141725))

(declare-fun m!1141727 () Bool)

(assert (=> b!1238135 m!1141727))

(declare-fun m!1141729 () Bool)

(assert (=> b!1238137 m!1141729))

(declare-fun m!1141731 () Bool)

(assert (=> b!1238141 m!1141731))

(assert (=> b!1238136 m!1141719))

(assert (=> b!1238136 m!1141719))

(declare-fun m!1141733 () Bool)

(assert (=> b!1238136 m!1141733))

(check-sat (not b!1238139) (not b!1238140) (not b!1238137) (not b!1238142) (not b!1238141) (not b!1238144) (not start!103118) (not b!1238138) (not b!1238135) (not b!1238136) (not b!1238134))
