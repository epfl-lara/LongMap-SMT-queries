; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59720 () Bool)

(assert start!59720)

(declare-fun b!659603 () Bool)

(declare-fun e!378986 () Bool)

(declare-fun e!378989 () Bool)

(assert (=> b!659603 (= e!378986 e!378989)))

(declare-fun res!427827 () Bool)

(assert (=> b!659603 (=> res!427827 e!378989)))

(declare-datatypes ((List!12670 0))(
  ( (Nil!12667) (Cons!12666 (h!13711 (_ BitVec 64)) (t!18889 List!12670)) )
))
(declare-fun contains!3192 (List!12670 (_ BitVec 64)) Bool)

(assert (=> b!659603 (= res!427827 (contains!3192 Nil!12667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659604 () Bool)

(declare-fun e!378985 () Bool)

(declare-fun acc!681 () List!12670)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659604 (= e!378985 (contains!3192 acc!681 k0!2843))))

(declare-fun b!659605 () Bool)

(declare-fun e!378987 () Bool)

(assert (=> b!659605 (= e!378987 (not (contains!3192 acc!681 k0!2843)))))

(declare-fun b!659606 () Bool)

(declare-fun res!427836 () Bool)

(assert (=> b!659606 (=> (not res!427836) (not e!378986))))

(declare-datatypes ((array!38793 0))(
  ( (array!38794 (arr!18590 (Array (_ BitVec 32) (_ BitVec 64))) (size!18955 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38793)

(assert (=> b!659606 (= res!427836 (bvsle #b00000000000000000000000000000000 (size!18955 a!3626)))))

(declare-fun b!659607 () Bool)

(declare-fun e!378988 () Bool)

(assert (=> b!659607 (= e!378988 e!378987)))

(declare-fun res!427833 () Bool)

(assert (=> b!659607 (=> (not res!427833) (not e!378987))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659607 (= res!427833 (bvsle from!3004 i!1382))))

(declare-fun b!659608 () Bool)

(assert (=> b!659608 (= e!378989 (contains!3192 Nil!12667 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!427837 () Bool)

(assert (=> start!59720 (=> (not res!427837) (not e!378986))))

(assert (=> start!59720 (= res!427837 (and (bvslt (size!18955 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18955 a!3626))))))

(assert (=> start!59720 e!378986))

(assert (=> start!59720 true))

(declare-fun array_inv!14473 (array!38793) Bool)

(assert (=> start!59720 (array_inv!14473 a!3626)))

(declare-fun b!659609 () Bool)

(declare-fun res!427832 () Bool)

(assert (=> b!659609 (=> (not res!427832) (not e!378986))))

(declare-fun noDuplicate!461 (List!12670) Bool)

(assert (=> b!659609 (= res!427832 (noDuplicate!461 acc!681))))

(declare-fun b!659610 () Bool)

(declare-fun res!427831 () Bool)

(assert (=> b!659610 (=> (not res!427831) (not e!378986))))

(assert (=> b!659610 (= res!427831 e!378988)))

(declare-fun res!427830 () Bool)

(assert (=> b!659610 (=> res!427830 e!378988)))

(assert (=> b!659610 (= res!427830 e!378985)))

(declare-fun res!427829 () Bool)

(assert (=> b!659610 (=> (not res!427829) (not e!378985))))

(assert (=> b!659610 (= res!427829 (bvsgt from!3004 i!1382))))

(declare-fun b!659611 () Bool)

(declare-fun res!427828 () Bool)

(assert (=> b!659611 (=> (not res!427828) (not e!378986))))

(assert (=> b!659611 (= res!427828 (not (contains!3192 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659612 () Bool)

(declare-fun res!427835 () Bool)

(assert (=> b!659612 (=> (not res!427835) (not e!378986))))

(assert (=> b!659612 (= res!427835 (noDuplicate!461 Nil!12667))))

(declare-fun b!659613 () Bool)

(declare-fun res!427834 () Bool)

(assert (=> b!659613 (=> (not res!427834) (not e!378986))))

(assert (=> b!659613 (= res!427834 (not (contains!3192 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59720 res!427837) b!659609))

(assert (= (and b!659609 res!427832) b!659613))

(assert (= (and b!659613 res!427834) b!659611))

(assert (= (and b!659611 res!427828) b!659610))

(assert (= (and b!659610 res!427829) b!659604))

(assert (= (and b!659610 (not res!427830)) b!659607))

(assert (= (and b!659607 res!427833) b!659605))

(assert (= (and b!659610 res!427831) b!659606))

(assert (= (and b!659606 res!427836) b!659612))

(assert (= (and b!659612 res!427835) b!659603))

(assert (= (and b!659603 (not res!427827)) b!659608))

(declare-fun m!632007 () Bool)

(assert (=> b!659605 m!632007))

(declare-fun m!632009 () Bool)

(assert (=> start!59720 m!632009))

(declare-fun m!632011 () Bool)

(assert (=> b!659609 m!632011))

(declare-fun m!632013 () Bool)

(assert (=> b!659611 m!632013))

(declare-fun m!632015 () Bool)

(assert (=> b!659612 m!632015))

(declare-fun m!632017 () Bool)

(assert (=> b!659608 m!632017))

(declare-fun m!632019 () Bool)

(assert (=> b!659603 m!632019))

(declare-fun m!632021 () Bool)

(assert (=> b!659613 m!632021))

(assert (=> b!659604 m!632007))

(check-sat (not b!659605) (not b!659604) (not b!659608) (not b!659613) (not start!59720) (not b!659609) (not b!659611) (not b!659603) (not b!659612))
(check-sat)
(get-model)

(declare-fun d!92947 () Bool)

(declare-fun lt!308472 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!258 (List!12670) (InoxSet (_ BitVec 64)))

(assert (=> d!92947 (= lt!308472 (select (content!258 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379031 () Bool)

(assert (=> d!92947 (= lt!308472 e!379031)))

(declare-fun res!427908 () Bool)

(assert (=> d!92947 (=> (not res!427908) (not e!379031))))

(get-info :version)

(assert (=> d!92947 (= res!427908 ((_ is Cons!12666) acc!681))))

(assert (=> d!92947 (= (contains!3192 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308472)))

(declare-fun b!659684 () Bool)

(declare-fun e!379030 () Bool)

(assert (=> b!659684 (= e!379031 e!379030)))

(declare-fun res!427909 () Bool)

(assert (=> b!659684 (=> res!427909 e!379030)))

(assert (=> b!659684 (= res!427909 (= (h!13711 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659685 () Bool)

(assert (=> b!659685 (= e!379030 (contains!3192 (t!18889 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92947 res!427908) b!659684))

(assert (= (and b!659684 (not res!427909)) b!659685))

(declare-fun m!632055 () Bool)

(assert (=> d!92947 m!632055))

(declare-fun m!632057 () Bool)

(assert (=> d!92947 m!632057))

(declare-fun m!632059 () Bool)

(assert (=> b!659685 m!632059))

(assert (=> b!659613 d!92947))

(declare-fun d!92949 () Bool)

(declare-fun res!427914 () Bool)

(declare-fun e!379036 () Bool)

(assert (=> d!92949 (=> res!427914 e!379036)))

(assert (=> d!92949 (= res!427914 ((_ is Nil!12667) Nil!12667))))

(assert (=> d!92949 (= (noDuplicate!461 Nil!12667) e!379036)))

(declare-fun b!659690 () Bool)

(declare-fun e!379037 () Bool)

(assert (=> b!659690 (= e!379036 e!379037)))

(declare-fun res!427915 () Bool)

(assert (=> b!659690 (=> (not res!427915) (not e!379037))))

(assert (=> b!659690 (= res!427915 (not (contains!3192 (t!18889 Nil!12667) (h!13711 Nil!12667))))))

(declare-fun b!659691 () Bool)

(assert (=> b!659691 (= e!379037 (noDuplicate!461 (t!18889 Nil!12667)))))

(assert (= (and d!92949 (not res!427914)) b!659690))

(assert (= (and b!659690 res!427915) b!659691))

(declare-fun m!632061 () Bool)

(assert (=> b!659690 m!632061))

(declare-fun m!632063 () Bool)

(assert (=> b!659691 m!632063))

(assert (=> b!659612 d!92949))

(declare-fun d!92951 () Bool)

(declare-fun res!427916 () Bool)

(declare-fun e!379038 () Bool)

(assert (=> d!92951 (=> res!427916 e!379038)))

(assert (=> d!92951 (= res!427916 ((_ is Nil!12667) acc!681))))

(assert (=> d!92951 (= (noDuplicate!461 acc!681) e!379038)))

(declare-fun b!659692 () Bool)

(declare-fun e!379039 () Bool)

(assert (=> b!659692 (= e!379038 e!379039)))

(declare-fun res!427917 () Bool)

(assert (=> b!659692 (=> (not res!427917) (not e!379039))))

(assert (=> b!659692 (= res!427917 (not (contains!3192 (t!18889 acc!681) (h!13711 acc!681))))))

(declare-fun b!659693 () Bool)

(assert (=> b!659693 (= e!379039 (noDuplicate!461 (t!18889 acc!681)))))

(assert (= (and d!92951 (not res!427916)) b!659692))

(assert (= (and b!659692 res!427917) b!659693))

(declare-fun m!632065 () Bool)

(assert (=> b!659692 m!632065))

(declare-fun m!632067 () Bool)

(assert (=> b!659693 m!632067))

(assert (=> b!659609 d!92951))

(declare-fun d!92953 () Bool)

(assert (=> d!92953 (= (array_inv!14473 a!3626) (bvsge (size!18955 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59720 d!92953))

(declare-fun d!92957 () Bool)

(declare-fun lt!308473 () Bool)

(assert (=> d!92957 (= lt!308473 (select (content!258 Nil!12667) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379041 () Bool)

(assert (=> d!92957 (= lt!308473 e!379041)))

(declare-fun res!427918 () Bool)

(assert (=> d!92957 (=> (not res!427918) (not e!379041))))

(assert (=> d!92957 (= res!427918 ((_ is Cons!12666) Nil!12667))))

(assert (=> d!92957 (= (contains!3192 Nil!12667 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308473)))

(declare-fun b!659694 () Bool)

(declare-fun e!379040 () Bool)

(assert (=> b!659694 (= e!379041 e!379040)))

(declare-fun res!427919 () Bool)

(assert (=> b!659694 (=> res!427919 e!379040)))

(assert (=> b!659694 (= res!427919 (= (h!13711 Nil!12667) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659695 () Bool)

(assert (=> b!659695 (= e!379040 (contains!3192 (t!18889 Nil!12667) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92957 res!427918) b!659694))

(assert (= (and b!659694 (not res!427919)) b!659695))

(declare-fun m!632069 () Bool)

(assert (=> d!92957 m!632069))

(declare-fun m!632071 () Bool)

(assert (=> d!92957 m!632071))

(declare-fun m!632073 () Bool)

(assert (=> b!659695 m!632073))

(assert (=> b!659608 d!92957))

(declare-fun d!92961 () Bool)

(declare-fun lt!308474 () Bool)

(assert (=> d!92961 (= lt!308474 (select (content!258 Nil!12667) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379043 () Bool)

(assert (=> d!92961 (= lt!308474 e!379043)))

(declare-fun res!427920 () Bool)

(assert (=> d!92961 (=> (not res!427920) (not e!379043))))

(assert (=> d!92961 (= res!427920 ((_ is Cons!12666) Nil!12667))))

(assert (=> d!92961 (= (contains!3192 Nil!12667 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308474)))

(declare-fun b!659696 () Bool)

(declare-fun e!379042 () Bool)

(assert (=> b!659696 (= e!379043 e!379042)))

(declare-fun res!427921 () Bool)

(assert (=> b!659696 (=> res!427921 e!379042)))

(assert (=> b!659696 (= res!427921 (= (h!13711 Nil!12667) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659697 () Bool)

(assert (=> b!659697 (= e!379042 (contains!3192 (t!18889 Nil!12667) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92961 res!427920) b!659696))

(assert (= (and b!659696 (not res!427921)) b!659697))

(assert (=> d!92961 m!632069))

(declare-fun m!632075 () Bool)

(assert (=> d!92961 m!632075))

(declare-fun m!632077 () Bool)

(assert (=> b!659697 m!632077))

(assert (=> b!659603 d!92961))

(declare-fun d!92963 () Bool)

(declare-fun lt!308475 () Bool)

(assert (=> d!92963 (= lt!308475 (select (content!258 acc!681) k0!2843))))

(declare-fun e!379045 () Bool)

(assert (=> d!92963 (= lt!308475 e!379045)))

(declare-fun res!427922 () Bool)

(assert (=> d!92963 (=> (not res!427922) (not e!379045))))

(assert (=> d!92963 (= res!427922 ((_ is Cons!12666) acc!681))))

(assert (=> d!92963 (= (contains!3192 acc!681 k0!2843) lt!308475)))

(declare-fun b!659698 () Bool)

(declare-fun e!379044 () Bool)

(assert (=> b!659698 (= e!379045 e!379044)))

(declare-fun res!427923 () Bool)

(assert (=> b!659698 (=> res!427923 e!379044)))

(assert (=> b!659698 (= res!427923 (= (h!13711 acc!681) k0!2843))))

(declare-fun b!659699 () Bool)

(assert (=> b!659699 (= e!379044 (contains!3192 (t!18889 acc!681) k0!2843))))

(assert (= (and d!92963 res!427922) b!659698))

(assert (= (and b!659698 (not res!427923)) b!659699))

(assert (=> d!92963 m!632055))

(declare-fun m!632079 () Bool)

(assert (=> d!92963 m!632079))

(declare-fun m!632081 () Bool)

(assert (=> b!659699 m!632081))

(assert (=> b!659605 d!92963))

(assert (=> b!659604 d!92963))

(declare-fun d!92965 () Bool)

(declare-fun lt!308476 () Bool)

(assert (=> d!92965 (= lt!308476 (select (content!258 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379049 () Bool)

(assert (=> d!92965 (= lt!308476 e!379049)))

(declare-fun res!427926 () Bool)

(assert (=> d!92965 (=> (not res!427926) (not e!379049))))

(assert (=> d!92965 (= res!427926 ((_ is Cons!12666) acc!681))))

(assert (=> d!92965 (= (contains!3192 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308476)))

(declare-fun b!659700 () Bool)

(declare-fun e!379048 () Bool)

(assert (=> b!659700 (= e!379049 e!379048)))

(declare-fun res!427927 () Bool)

(assert (=> b!659700 (=> res!427927 e!379048)))

(assert (=> b!659700 (= res!427927 (= (h!13711 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659701 () Bool)

(assert (=> b!659701 (= e!379048 (contains!3192 (t!18889 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92965 res!427926) b!659700))

(assert (= (and b!659700 (not res!427927)) b!659701))

(assert (=> d!92965 m!632055))

(declare-fun m!632083 () Bool)

(assert (=> d!92965 m!632083))

(declare-fun m!632085 () Bool)

(assert (=> b!659701 m!632085))

(assert (=> b!659611 d!92965))

(check-sat (not d!92957) (not b!659701) (not b!659685) (not b!659691) (not b!659693) (not b!659692) (not d!92965) (not d!92961) (not b!659690) (not d!92947) (not b!659699) (not b!659697) (not b!659695) (not d!92963))
(check-sat)
