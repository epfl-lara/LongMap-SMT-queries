; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62024 () Bool)

(assert start!62024)

(declare-fun b!693757 () Bool)

(declare-fun e!394750 () Bool)

(declare-datatypes ((List!13136 0))(
  ( (Nil!13133) (Cons!13132 (h!14177 (_ BitVec 64)) (t!19415 List!13136)) )
))
(declare-fun acc!681 () List!13136)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3713 (List!13136 (_ BitVec 64)) Bool)

(assert (=> b!693757 (= e!394750 (contains!3713 acc!681 k!2843))))

(declare-fun b!693758 () Bool)

(declare-fun e!394754 () Bool)

(declare-fun e!394745 () Bool)

(assert (=> b!693758 (= e!394754 e!394745)))

(declare-fun res!457871 () Bool)

(assert (=> b!693758 (=> (not res!457871) (not e!394745))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!693758 (= res!457871 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39865 0))(
  ( (array!39866 (arr!19095 (Array (_ BitVec 32) (_ BitVec 64))) (size!19480 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39865)

(declare-fun lt!316801 () List!13136)

(declare-fun $colon$colon!425 (List!13136 (_ BitVec 64)) List!13136)

(assert (=> b!693758 (= lt!316801 ($colon$colon!425 acc!681 (select (arr!19095 a!3626) from!3004)))))

(declare-fun res!457872 () Bool)

(declare-fun e!394753 () Bool)

(assert (=> start!62024 (=> (not res!457872) (not e!394753))))

(assert (=> start!62024 (= res!457872 (and (bvslt (size!19480 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19480 a!3626))))))

(assert (=> start!62024 e!394753))

(assert (=> start!62024 true))

(declare-fun array_inv!14891 (array!39865) Bool)

(assert (=> start!62024 (array_inv!14891 a!3626)))

(declare-fun b!693759 () Bool)

(assert (=> b!693759 (= e!394745 false)))

(declare-fun lt!316803 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39865 (_ BitVec 32) List!13136) Bool)

(assert (=> b!693759 (= lt!316803 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316801))))

(declare-fun b!693760 () Bool)

(declare-fun res!457862 () Bool)

(assert (=> b!693760 (=> (not res!457862) (not e!394753))))

(assert (=> b!693760 (= res!457862 (not (contains!3713 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693761 () Bool)

(declare-fun res!457854 () Bool)

(assert (=> b!693761 (=> (not res!457854) (not e!394753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693761 (= res!457854 (validKeyInArray!0 (select (arr!19095 a!3626) from!3004)))))

(declare-fun b!693762 () Bool)

(declare-fun res!457860 () Bool)

(assert (=> b!693762 (=> (not res!457860) (not e!394753))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693762 (= res!457860 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19480 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693763 () Bool)

(declare-fun res!457868 () Bool)

(assert (=> b!693763 (=> (not res!457868) (not e!394753))))

(assert (=> b!693763 (= res!457868 (not (contains!3713 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693764 () Bool)

(declare-fun res!457851 () Bool)

(assert (=> b!693764 (=> (not res!457851) (not e!394753))))

(declare-fun arrayContainsKey!0 (array!39865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693764 (= res!457851 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693765 () Bool)

(declare-fun res!457856 () Bool)

(assert (=> b!693765 (=> (not res!457856) (not e!394745))))

(declare-fun e!394751 () Bool)

(assert (=> b!693765 (= res!457856 e!394751)))

(declare-fun res!457863 () Bool)

(assert (=> b!693765 (=> res!457863 e!394751)))

(declare-fun e!394747 () Bool)

(assert (=> b!693765 (= res!457863 e!394747)))

(declare-fun res!457865 () Bool)

(assert (=> b!693765 (=> (not res!457865) (not e!394747))))

(assert (=> b!693765 (= res!457865 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693766 () Bool)

(declare-fun res!457857 () Bool)

(assert (=> b!693766 (=> (not res!457857) (not e!394745))))

(declare-fun noDuplicate!960 (List!13136) Bool)

(assert (=> b!693766 (= res!457857 (noDuplicate!960 lt!316801))))

(declare-fun b!693767 () Bool)

(declare-fun res!457853 () Bool)

(assert (=> b!693767 (=> (not res!457853) (not e!394753))))

(assert (=> b!693767 (= res!457853 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13133))))

(declare-fun b!693768 () Bool)

(declare-datatypes ((Unit!24498 0))(
  ( (Unit!24499) )
))
(declare-fun e!394748 () Unit!24498)

(declare-fun Unit!24500 () Unit!24498)

(assert (=> b!693768 (= e!394748 Unit!24500)))

(declare-fun b!693769 () Bool)

(declare-fun e!394746 () Bool)

(declare-fun e!394755 () Bool)

(assert (=> b!693769 (= e!394746 e!394755)))

(declare-fun res!457861 () Bool)

(assert (=> b!693769 (=> (not res!457861) (not e!394755))))

(assert (=> b!693769 (= res!457861 (bvsle from!3004 i!1382))))

(declare-fun b!693770 () Bool)

(declare-fun res!457858 () Bool)

(assert (=> b!693770 (=> (not res!457858) (not e!394745))))

(assert (=> b!693770 (= res!457858 (not (contains!3713 lt!316801 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693771 () Bool)

(declare-fun res!457866 () Bool)

(assert (=> b!693771 (=> (not res!457866) (not e!394753))))

(assert (=> b!693771 (= res!457866 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693772 () Bool)

(assert (=> b!693772 (= e!394755 (not (contains!3713 acc!681 k!2843)))))

(declare-fun b!693773 () Bool)

(declare-fun res!457852 () Bool)

(assert (=> b!693773 (=> (not res!457852) (not e!394745))))

(assert (=> b!693773 (= res!457852 (not (contains!3713 lt!316801 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693774 () Bool)

(declare-fun Unit!24501 () Unit!24498)

(assert (=> b!693774 (= e!394748 Unit!24501)))

(assert (=> b!693774 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316802 () Unit!24498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39865 (_ BitVec 64) (_ BitVec 32)) Unit!24498)

(assert (=> b!693774 (= lt!316802 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!693774 false))

(declare-fun b!693775 () Bool)

(declare-fun e!394752 () Bool)

(assert (=> b!693775 (= e!394752 (not (contains!3713 lt!316801 k!2843)))))

(declare-fun b!693776 () Bool)

(declare-fun res!457873 () Bool)

(assert (=> b!693776 (=> (not res!457873) (not e!394753))))

(assert (=> b!693776 (= res!457873 e!394746)))

(declare-fun res!457864 () Bool)

(assert (=> b!693776 (=> res!457864 e!394746)))

(assert (=> b!693776 (= res!457864 e!394750)))

(declare-fun res!457867 () Bool)

(assert (=> b!693776 (=> (not res!457867) (not e!394750))))

(assert (=> b!693776 (= res!457867 (bvsgt from!3004 i!1382))))

(declare-fun b!693777 () Bool)

(declare-fun res!457855 () Bool)

(assert (=> b!693777 (=> (not res!457855) (not e!394753))))

(assert (=> b!693777 (= res!457855 (noDuplicate!960 acc!681))))

(declare-fun b!693778 () Bool)

(declare-fun res!457869 () Bool)

(assert (=> b!693778 (=> (not res!457869) (not e!394753))))

(assert (=> b!693778 (= res!457869 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19480 a!3626))))))

(declare-fun b!693779 () Bool)

(assert (=> b!693779 (= e!394753 e!394754)))

(declare-fun res!457874 () Bool)

(assert (=> b!693779 (=> (not res!457874) (not e!394754))))

(assert (=> b!693779 (= res!457874 (not (= (select (arr!19095 a!3626) from!3004) k!2843)))))

(declare-fun lt!316804 () Unit!24498)

(assert (=> b!693779 (= lt!316804 e!394748)))

(declare-fun c!78320 () Bool)

(assert (=> b!693779 (= c!78320 (= (select (arr!19095 a!3626) from!3004) k!2843))))

(declare-fun b!693780 () Bool)

(assert (=> b!693780 (= e!394747 (contains!3713 lt!316801 k!2843))))

(declare-fun b!693781 () Bool)

(assert (=> b!693781 (= e!394751 e!394752)))

(declare-fun res!457870 () Bool)

(assert (=> b!693781 (=> (not res!457870) (not e!394752))))

(assert (=> b!693781 (= res!457870 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693782 () Bool)

(declare-fun res!457859 () Bool)

(assert (=> b!693782 (=> (not res!457859) (not e!394753))))

(assert (=> b!693782 (= res!457859 (validKeyInArray!0 k!2843))))

(assert (= (and start!62024 res!457872) b!693777))

(assert (= (and b!693777 res!457855) b!693760))

(assert (= (and b!693760 res!457862) b!693763))

(assert (= (and b!693763 res!457868) b!693776))

(assert (= (and b!693776 res!457867) b!693757))

(assert (= (and b!693776 (not res!457864)) b!693769))

(assert (= (and b!693769 res!457861) b!693772))

(assert (= (and b!693776 res!457873) b!693767))

(assert (= (and b!693767 res!457853) b!693771))

(assert (= (and b!693771 res!457866) b!693778))

(assert (= (and b!693778 res!457869) b!693782))

(assert (= (and b!693782 res!457859) b!693764))

(assert (= (and b!693764 res!457851) b!693762))

(assert (= (and b!693762 res!457860) b!693761))

(assert (= (and b!693761 res!457854) b!693779))

(assert (= (and b!693779 c!78320) b!693774))

(assert (= (and b!693779 (not c!78320)) b!693768))

(assert (= (and b!693779 res!457874) b!693758))

(assert (= (and b!693758 res!457871) b!693766))

(assert (= (and b!693766 res!457857) b!693773))

(assert (= (and b!693773 res!457852) b!693770))

(assert (= (and b!693770 res!457858) b!693765))

(assert (= (and b!693765 res!457865) b!693780))

(assert (= (and b!693765 (not res!457863)) b!693781))

(assert (= (and b!693781 res!457870) b!693775))

(assert (= (and b!693765 res!457856) b!693759))

(declare-fun m!655937 () Bool)

(assert (=> b!693782 m!655937))

(declare-fun m!655939 () Bool)

(assert (=> b!693771 m!655939))

(declare-fun m!655941 () Bool)

(assert (=> b!693774 m!655941))

(declare-fun m!655943 () Bool)

(assert (=> b!693774 m!655943))

(declare-fun m!655945 () Bool)

(assert (=> b!693779 m!655945))

(declare-fun m!655947 () Bool)

(assert (=> b!693760 m!655947))

(declare-fun m!655949 () Bool)

(assert (=> b!693775 m!655949))

(assert (=> b!693780 m!655949))

(declare-fun m!655951 () Bool)

(assert (=> b!693763 m!655951))

(declare-fun m!655953 () Bool)

(assert (=> b!693757 m!655953))

(assert (=> b!693758 m!655945))

(assert (=> b!693758 m!655945))

(declare-fun m!655955 () Bool)

(assert (=> b!693758 m!655955))

(declare-fun m!655957 () Bool)

(assert (=> b!693770 m!655957))

(declare-fun m!655959 () Bool)

(assert (=> b!693764 m!655959))

(assert (=> b!693761 m!655945))

(assert (=> b!693761 m!655945))

(declare-fun m!655961 () Bool)

(assert (=> b!693761 m!655961))

(declare-fun m!655963 () Bool)

(assert (=> b!693767 m!655963))

(declare-fun m!655965 () Bool)

(assert (=> start!62024 m!655965))

(declare-fun m!655967 () Bool)

(assert (=> b!693777 m!655967))

(declare-fun m!655969 () Bool)

(assert (=> b!693766 m!655969))

(declare-fun m!655971 () Bool)

(assert (=> b!693773 m!655971))

(declare-fun m!655973 () Bool)

(assert (=> b!693759 m!655973))

(assert (=> b!693772 m!655953))

(push 1)

