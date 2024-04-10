; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59710 () Bool)

(assert start!59710)

(declare-fun b!659787 () Bool)

(declare-fun res!427857 () Bool)

(declare-fun e!379092 () Bool)

(assert (=> b!659787 (=> (not res!427857) (not e!379092))))

(declare-datatypes ((List!12630 0))(
  ( (Nil!12627) (Cons!12626 (h!13671 (_ BitVec 64)) (t!18858 List!12630)) )
))
(declare-fun acc!681 () List!12630)

(declare-fun contains!3207 (List!12630 (_ BitVec 64)) Bool)

(assert (=> b!659787 (= res!427857 (not (contains!3207 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659788 () Bool)

(declare-fun noDuplicate!454 (List!12630) Bool)

(assert (=> b!659788 (= e!379092 (not (noDuplicate!454 Nil!12627)))))

(declare-fun b!659789 () Bool)

(declare-fun res!427853 () Bool)

(assert (=> b!659789 (=> (not res!427853) (not e!379092))))

(declare-datatypes ((array!38787 0))(
  ( (array!38788 (arr!18589 (Array (_ BitVec 32) (_ BitVec 64))) (size!18953 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38787)

(assert (=> b!659789 (= res!427853 (bvsle #b00000000000000000000000000000000 (size!18953 a!3626)))))

(declare-fun res!427859 () Bool)

(assert (=> start!59710 (=> (not res!427859) (not e!379092))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59710 (= res!427859 (and (bvslt (size!18953 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18953 a!3626))))))

(assert (=> start!59710 e!379092))

(assert (=> start!59710 true))

(declare-fun array_inv!14385 (array!38787) Bool)

(assert (=> start!59710 (array_inv!14385 a!3626)))

(declare-fun b!659790 () Bool)

(declare-fun res!427852 () Bool)

(assert (=> b!659790 (=> (not res!427852) (not e!379092))))

(assert (=> b!659790 (= res!427852 (not (contains!3207 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659791 () Bool)

(declare-fun res!427851 () Bool)

(assert (=> b!659791 (=> (not res!427851) (not e!379092))))

(declare-fun e!379089 () Bool)

(assert (=> b!659791 (= res!427851 e!379089)))

(declare-fun res!427855 () Bool)

(assert (=> b!659791 (=> res!427855 e!379089)))

(declare-fun e!379091 () Bool)

(assert (=> b!659791 (= res!427855 e!379091)))

(declare-fun res!427856 () Bool)

(assert (=> b!659791 (=> (not res!427856) (not e!379091))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659791 (= res!427856 (bvsgt from!3004 i!1382))))

(declare-fun b!659792 () Bool)

(declare-fun e!379088 () Bool)

(assert (=> b!659792 (= e!379089 e!379088)))

(declare-fun res!427854 () Bool)

(assert (=> b!659792 (=> (not res!427854) (not e!379088))))

(assert (=> b!659792 (= res!427854 (bvsle from!3004 i!1382))))

(declare-fun b!659793 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659793 (= e!379091 (contains!3207 acc!681 k0!2843))))

(declare-fun b!659794 () Bool)

(declare-fun res!427858 () Bool)

(assert (=> b!659794 (=> (not res!427858) (not e!379092))))

(assert (=> b!659794 (= res!427858 (noDuplicate!454 acc!681))))

(declare-fun b!659795 () Bool)

(assert (=> b!659795 (= e!379088 (not (contains!3207 acc!681 k0!2843)))))

(assert (= (and start!59710 res!427859) b!659794))

(assert (= (and b!659794 res!427858) b!659787))

(assert (= (and b!659787 res!427857) b!659790))

(assert (= (and b!659790 res!427852) b!659791))

(assert (= (and b!659791 res!427856) b!659793))

(assert (= (and b!659791 (not res!427855)) b!659792))

(assert (= (and b!659792 res!427854) b!659795))

(assert (= (and b!659791 res!427851) b!659789))

(assert (= (and b!659789 res!427853) b!659788))

(declare-fun m!632699 () Bool)

(assert (=> b!659794 m!632699))

(declare-fun m!632701 () Bool)

(assert (=> b!659787 m!632701))

(declare-fun m!632703 () Bool)

(assert (=> b!659788 m!632703))

(declare-fun m!632705 () Bool)

(assert (=> b!659795 m!632705))

(declare-fun m!632707 () Bool)

(assert (=> b!659790 m!632707))

(declare-fun m!632709 () Bool)

(assert (=> start!59710 m!632709))

(assert (=> b!659793 m!632705))

(check-sat (not b!659795) (not start!59710) (not b!659790) (not b!659788) (not b!659787) (not b!659794) (not b!659793))
(check-sat)
(get-model)

(declare-fun d!93125 () Bool)

(declare-fun lt!308713 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!255 (List!12630) (InoxSet (_ BitVec 64)))

(assert (=> d!93125 (= lt!308713 (select (content!255 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379113 () Bool)

(assert (=> d!93125 (= lt!308713 e!379113)))

(declare-fun res!427892 () Bool)

(assert (=> d!93125 (=> (not res!427892) (not e!379113))))

(get-info :version)

(assert (=> d!93125 (= res!427892 ((_ is Cons!12626) acc!681))))

(assert (=> d!93125 (= (contains!3207 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308713)))

(declare-fun b!659827 () Bool)

(declare-fun e!379112 () Bool)

(assert (=> b!659827 (= e!379113 e!379112)))

(declare-fun res!427891 () Bool)

(assert (=> b!659827 (=> res!427891 e!379112)))

(assert (=> b!659827 (= res!427891 (= (h!13671 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659828 () Bool)

(assert (=> b!659828 (= e!379112 (contains!3207 (t!18858 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93125 res!427892) b!659827))

(assert (= (and b!659827 (not res!427891)) b!659828))

(declare-fun m!632723 () Bool)

(assert (=> d!93125 m!632723))

(declare-fun m!632725 () Bool)

(assert (=> d!93125 m!632725))

(declare-fun m!632727 () Bool)

(assert (=> b!659828 m!632727))

(assert (=> b!659787 d!93125))

(declare-fun d!93127 () Bool)

(declare-fun res!427897 () Bool)

(declare-fun e!379118 () Bool)

(assert (=> d!93127 (=> res!427897 e!379118)))

(assert (=> d!93127 (= res!427897 ((_ is Nil!12627) Nil!12627))))

(assert (=> d!93127 (= (noDuplicate!454 Nil!12627) e!379118)))

(declare-fun b!659833 () Bool)

(declare-fun e!379119 () Bool)

(assert (=> b!659833 (= e!379118 e!379119)))

(declare-fun res!427898 () Bool)

(assert (=> b!659833 (=> (not res!427898) (not e!379119))))

(assert (=> b!659833 (= res!427898 (not (contains!3207 (t!18858 Nil!12627) (h!13671 Nil!12627))))))

(declare-fun b!659834 () Bool)

(assert (=> b!659834 (= e!379119 (noDuplicate!454 (t!18858 Nil!12627)))))

(assert (= (and d!93127 (not res!427897)) b!659833))

(assert (= (and b!659833 res!427898) b!659834))

(declare-fun m!632729 () Bool)

(assert (=> b!659833 m!632729))

(declare-fun m!632731 () Bool)

(assert (=> b!659834 m!632731))

(assert (=> b!659788 d!93127))

(declare-fun d!93129 () Bool)

(declare-fun lt!308714 () Bool)

(assert (=> d!93129 (= lt!308714 (select (content!255 acc!681) k0!2843))))

(declare-fun e!379121 () Bool)

(assert (=> d!93129 (= lt!308714 e!379121)))

(declare-fun res!427900 () Bool)

(assert (=> d!93129 (=> (not res!427900) (not e!379121))))

(assert (=> d!93129 (= res!427900 ((_ is Cons!12626) acc!681))))

(assert (=> d!93129 (= (contains!3207 acc!681 k0!2843) lt!308714)))

(declare-fun b!659835 () Bool)

(declare-fun e!379120 () Bool)

(assert (=> b!659835 (= e!379121 e!379120)))

(declare-fun res!427899 () Bool)

(assert (=> b!659835 (=> res!427899 e!379120)))

(assert (=> b!659835 (= res!427899 (= (h!13671 acc!681) k0!2843))))

(declare-fun b!659836 () Bool)

(assert (=> b!659836 (= e!379120 (contains!3207 (t!18858 acc!681) k0!2843))))

(assert (= (and d!93129 res!427900) b!659835))

(assert (= (and b!659835 (not res!427899)) b!659836))

(assert (=> d!93129 m!632723))

(declare-fun m!632733 () Bool)

(assert (=> d!93129 m!632733))

(declare-fun m!632735 () Bool)

(assert (=> b!659836 m!632735))

(assert (=> b!659793 d!93129))

(declare-fun d!93131 () Bool)

(declare-fun res!427901 () Bool)

(declare-fun e!379122 () Bool)

(assert (=> d!93131 (=> res!427901 e!379122)))

(assert (=> d!93131 (= res!427901 ((_ is Nil!12627) acc!681))))

(assert (=> d!93131 (= (noDuplicate!454 acc!681) e!379122)))

(declare-fun b!659837 () Bool)

(declare-fun e!379123 () Bool)

(assert (=> b!659837 (= e!379122 e!379123)))

(declare-fun res!427902 () Bool)

(assert (=> b!659837 (=> (not res!427902) (not e!379123))))

(assert (=> b!659837 (= res!427902 (not (contains!3207 (t!18858 acc!681) (h!13671 acc!681))))))

(declare-fun b!659838 () Bool)

(assert (=> b!659838 (= e!379123 (noDuplicate!454 (t!18858 acc!681)))))

(assert (= (and d!93131 (not res!427901)) b!659837))

(assert (= (and b!659837 res!427902) b!659838))

(declare-fun m!632737 () Bool)

(assert (=> b!659837 m!632737))

(declare-fun m!632739 () Bool)

(assert (=> b!659838 m!632739))

(assert (=> b!659794 d!93131))

(declare-fun d!93133 () Bool)

(declare-fun lt!308715 () Bool)

(assert (=> d!93133 (= lt!308715 (select (content!255 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379125 () Bool)

(assert (=> d!93133 (= lt!308715 e!379125)))

(declare-fun res!427904 () Bool)

(assert (=> d!93133 (=> (not res!427904) (not e!379125))))

(assert (=> d!93133 (= res!427904 ((_ is Cons!12626) acc!681))))

(assert (=> d!93133 (= (contains!3207 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308715)))

(declare-fun b!659839 () Bool)

(declare-fun e!379124 () Bool)

(assert (=> b!659839 (= e!379125 e!379124)))

(declare-fun res!427903 () Bool)

(assert (=> b!659839 (=> res!427903 e!379124)))

(assert (=> b!659839 (= res!427903 (= (h!13671 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659840 () Bool)

(assert (=> b!659840 (= e!379124 (contains!3207 (t!18858 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93133 res!427904) b!659839))

(assert (= (and b!659839 (not res!427903)) b!659840))

(assert (=> d!93133 m!632723))

(declare-fun m!632741 () Bool)

(assert (=> d!93133 m!632741))

(declare-fun m!632743 () Bool)

(assert (=> b!659840 m!632743))

(assert (=> b!659790 d!93133))

(declare-fun d!93135 () Bool)

(assert (=> d!93135 (= (array_inv!14385 a!3626) (bvsge (size!18953 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59710 d!93135))

(assert (=> b!659795 d!93129))

(check-sat (not d!93133) (not d!93125) (not d!93129) (not b!659836) (not b!659840) (not b!659833) (not b!659834) (not b!659837) (not b!659828) (not b!659838))
(check-sat)
