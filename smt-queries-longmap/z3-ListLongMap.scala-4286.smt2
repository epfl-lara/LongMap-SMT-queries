; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59696 () Bool)

(assert start!59696)

(declare-fun b!659464 () Bool)

(declare-fun res!427693 () Bool)

(declare-fun e!378886 () Bool)

(assert (=> b!659464 (=> (not res!427693) (not e!378886))))

(declare-datatypes ((List!12667 0))(
  ( (Nil!12664) (Cons!12663 (h!13708 (_ BitVec 64)) (t!18886 List!12667)) )
))
(declare-fun acc!681 () List!12667)

(declare-fun contains!3189 (List!12667 (_ BitVec 64)) Bool)

(assert (=> b!659464 (= res!427693 (not (contains!3189 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659465 () Bool)

(declare-fun e!378885 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659465 (= e!378885 (not (contains!3189 acc!681 k0!2843)))))

(declare-fun b!659466 () Bool)

(declare-fun res!427692 () Bool)

(assert (=> b!659466 (=> (not res!427692) (not e!378886))))

(declare-fun e!378887 () Bool)

(assert (=> b!659466 (= res!427692 e!378887)))

(declare-fun res!427695 () Bool)

(assert (=> b!659466 (=> res!427695 e!378887)))

(declare-fun e!378884 () Bool)

(assert (=> b!659466 (= res!427695 e!378884)))

(declare-fun res!427691 () Bool)

(assert (=> b!659466 (=> (not res!427691) (not e!378884))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659466 (= res!427691 (bvsgt from!3004 i!1382))))

(declare-fun b!659467 () Bool)

(assert (=> b!659467 (= e!378887 e!378885)))

(declare-fun res!427694 () Bool)

(assert (=> b!659467 (=> (not res!427694) (not e!378885))))

(assert (=> b!659467 (= res!427694 (bvsle from!3004 i!1382))))

(declare-fun b!659468 () Bool)

(declare-fun noDuplicate!458 (List!12667) Bool)

(assert (=> b!659468 (= e!378886 (not (noDuplicate!458 Nil!12664)))))

(declare-fun res!427696 () Bool)

(assert (=> start!59696 (=> (not res!427696) (not e!378886))))

(declare-datatypes ((array!38784 0))(
  ( (array!38785 (arr!18587 (Array (_ BitVec 32) (_ BitVec 64))) (size!18952 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38784)

(assert (=> start!59696 (= res!427696 (and (bvslt (size!18952 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18952 a!3626))))))

(assert (=> start!59696 e!378886))

(assert (=> start!59696 true))

(declare-fun array_inv!14470 (array!38784) Bool)

(assert (=> start!59696 (array_inv!14470 a!3626)))

(declare-fun b!659469 () Bool)

(assert (=> b!659469 (= e!378884 (contains!3189 acc!681 k0!2843))))

(declare-fun b!659470 () Bool)

(declare-fun res!427689 () Bool)

(assert (=> b!659470 (=> (not res!427689) (not e!378886))))

(assert (=> b!659470 (= res!427689 (bvsle #b00000000000000000000000000000000 (size!18952 a!3626)))))

(declare-fun b!659471 () Bool)

(declare-fun res!427688 () Bool)

(assert (=> b!659471 (=> (not res!427688) (not e!378886))))

(assert (=> b!659471 (= res!427688 (noDuplicate!458 acc!681))))

(declare-fun b!659472 () Bool)

(declare-fun res!427690 () Bool)

(assert (=> b!659472 (=> (not res!427690) (not e!378886))))

(assert (=> b!659472 (= res!427690 (not (contains!3189 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59696 res!427696) b!659471))

(assert (= (and b!659471 res!427688) b!659472))

(assert (= (and b!659472 res!427690) b!659464))

(assert (= (and b!659464 res!427693) b!659466))

(assert (= (and b!659466 res!427691) b!659469))

(assert (= (and b!659466 (not res!427695)) b!659467))

(assert (= (and b!659467 res!427694) b!659465))

(assert (= (and b!659466 res!427692) b!659470))

(assert (= (and b!659470 res!427689) b!659468))

(declare-fun m!631905 () Bool)

(assert (=> b!659471 m!631905))

(declare-fun m!631907 () Bool)

(assert (=> b!659469 m!631907))

(declare-fun m!631909 () Bool)

(assert (=> b!659472 m!631909))

(declare-fun m!631911 () Bool)

(assert (=> start!59696 m!631911))

(declare-fun m!631913 () Bool)

(assert (=> b!659464 m!631913))

(assert (=> b!659465 m!631907))

(declare-fun m!631915 () Bool)

(assert (=> b!659468 m!631915))

(check-sat (not b!659464) (not b!659468) (not b!659469) (not b!659471) (not b!659472) (not start!59696) (not b!659465))
(check-sat)
(get-model)

(declare-fun d!92909 () Bool)

(declare-fun lt!308457 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!255 (List!12667) (InoxSet (_ BitVec 64)))

(assert (=> d!92909 (= lt!308457 (select (content!255 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378923 () Bool)

(assert (=> d!92909 (= lt!308457 e!378923)))

(declare-fun res!427755 () Bool)

(assert (=> d!92909 (=> (not res!427755) (not e!378923))))

(get-info :version)

(assert (=> d!92909 (= res!427755 ((_ is Cons!12663) acc!681))))

(assert (=> d!92909 (= (contains!3189 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308457)))

(declare-fun b!659531 () Bool)

(declare-fun e!378922 () Bool)

(assert (=> b!659531 (= e!378923 e!378922)))

(declare-fun res!427756 () Bool)

(assert (=> b!659531 (=> res!427756 e!378922)))

(assert (=> b!659531 (= res!427756 (= (h!13708 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659532 () Bool)

(assert (=> b!659532 (= e!378922 (contains!3189 (t!18886 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92909 res!427755) b!659531))

(assert (= (and b!659531 (not res!427756)) b!659532))

(declare-fun m!631941 () Bool)

(assert (=> d!92909 m!631941))

(declare-fun m!631943 () Bool)

(assert (=> d!92909 m!631943))

(declare-fun m!631945 () Bool)

(assert (=> b!659532 m!631945))

(assert (=> b!659464 d!92909))

(declare-fun d!92911 () Bool)

(declare-fun lt!308458 () Bool)

(assert (=> d!92911 (= lt!308458 (select (content!255 acc!681) k0!2843))))

(declare-fun e!378925 () Bool)

(assert (=> d!92911 (= lt!308458 e!378925)))

(declare-fun res!427757 () Bool)

(assert (=> d!92911 (=> (not res!427757) (not e!378925))))

(assert (=> d!92911 (= res!427757 ((_ is Cons!12663) acc!681))))

(assert (=> d!92911 (= (contains!3189 acc!681 k0!2843) lt!308458)))

(declare-fun b!659533 () Bool)

(declare-fun e!378924 () Bool)

(assert (=> b!659533 (= e!378925 e!378924)))

(declare-fun res!427758 () Bool)

(assert (=> b!659533 (=> res!427758 e!378924)))

(assert (=> b!659533 (= res!427758 (= (h!13708 acc!681) k0!2843))))

(declare-fun b!659534 () Bool)

(assert (=> b!659534 (= e!378924 (contains!3189 (t!18886 acc!681) k0!2843))))

(assert (= (and d!92911 res!427757) b!659533))

(assert (= (and b!659533 (not res!427758)) b!659534))

(assert (=> d!92911 m!631941))

(declare-fun m!631947 () Bool)

(assert (=> d!92911 m!631947))

(declare-fun m!631949 () Bool)

(assert (=> b!659534 m!631949))

(assert (=> b!659469 d!92911))

(declare-fun d!92913 () Bool)

(declare-fun res!427763 () Bool)

(declare-fun e!378930 () Bool)

(assert (=> d!92913 (=> res!427763 e!378930)))

(assert (=> d!92913 (= res!427763 ((_ is Nil!12664) acc!681))))

(assert (=> d!92913 (= (noDuplicate!458 acc!681) e!378930)))

(declare-fun b!659539 () Bool)

(declare-fun e!378931 () Bool)

(assert (=> b!659539 (= e!378930 e!378931)))

(declare-fun res!427764 () Bool)

(assert (=> b!659539 (=> (not res!427764) (not e!378931))))

(assert (=> b!659539 (= res!427764 (not (contains!3189 (t!18886 acc!681) (h!13708 acc!681))))))

(declare-fun b!659540 () Bool)

(assert (=> b!659540 (= e!378931 (noDuplicate!458 (t!18886 acc!681)))))

(assert (= (and d!92913 (not res!427763)) b!659539))

(assert (= (and b!659539 res!427764) b!659540))

(declare-fun m!631951 () Bool)

(assert (=> b!659539 m!631951))

(declare-fun m!631953 () Bool)

(assert (=> b!659540 m!631953))

(assert (=> b!659471 d!92913))

(assert (=> b!659465 d!92911))

(declare-fun d!92915 () Bool)

(assert (=> d!92915 (= (array_inv!14470 a!3626) (bvsge (size!18952 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59696 d!92915))

(declare-fun d!92917 () Bool)

(declare-fun lt!308459 () Bool)

(assert (=> d!92917 (= lt!308459 (select (content!255 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378933 () Bool)

(assert (=> d!92917 (= lt!308459 e!378933)))

(declare-fun res!427765 () Bool)

(assert (=> d!92917 (=> (not res!427765) (not e!378933))))

(assert (=> d!92917 (= res!427765 ((_ is Cons!12663) acc!681))))

(assert (=> d!92917 (= (contains!3189 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308459)))

(declare-fun b!659541 () Bool)

(declare-fun e!378932 () Bool)

(assert (=> b!659541 (= e!378933 e!378932)))

(declare-fun res!427766 () Bool)

(assert (=> b!659541 (=> res!427766 e!378932)))

(assert (=> b!659541 (= res!427766 (= (h!13708 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659542 () Bool)

(assert (=> b!659542 (= e!378932 (contains!3189 (t!18886 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92917 res!427765) b!659541))

(assert (= (and b!659541 (not res!427766)) b!659542))

(assert (=> d!92917 m!631941))

(declare-fun m!631955 () Bool)

(assert (=> d!92917 m!631955))

(declare-fun m!631957 () Bool)

(assert (=> b!659542 m!631957))

(assert (=> b!659472 d!92917))

(declare-fun d!92919 () Bool)

(declare-fun res!427767 () Bool)

(declare-fun e!378934 () Bool)

(assert (=> d!92919 (=> res!427767 e!378934)))

(assert (=> d!92919 (= res!427767 ((_ is Nil!12664) Nil!12664))))

(assert (=> d!92919 (= (noDuplicate!458 Nil!12664) e!378934)))

(declare-fun b!659543 () Bool)

(declare-fun e!378935 () Bool)

(assert (=> b!659543 (= e!378934 e!378935)))

(declare-fun res!427768 () Bool)

(assert (=> b!659543 (=> (not res!427768) (not e!378935))))

(assert (=> b!659543 (= res!427768 (not (contains!3189 (t!18886 Nil!12664) (h!13708 Nil!12664))))))

(declare-fun b!659544 () Bool)

(assert (=> b!659544 (= e!378935 (noDuplicate!458 (t!18886 Nil!12664)))))

(assert (= (and d!92919 (not res!427767)) b!659543))

(assert (= (and b!659543 res!427768) b!659544))

(declare-fun m!631959 () Bool)

(assert (=> b!659543 m!631959))

(declare-fun m!631961 () Bool)

(assert (=> b!659544 m!631961))

(assert (=> b!659468 d!92919))

(check-sat (not d!92911) (not b!659540) (not b!659543) (not b!659532) (not d!92917) (not b!659542) (not b!659544) (not b!659534) (not b!659539) (not d!92909))
(check-sat)
