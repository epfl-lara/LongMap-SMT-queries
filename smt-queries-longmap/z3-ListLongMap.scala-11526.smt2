; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134218 () Bool)

(assert start!134218)

(declare-fun b!1567916 () Bool)

(declare-fun e!874041 () Bool)

(declare-datatypes ((List!36678 0))(
  ( (Nil!36675) (Cons!36674 (h!38121 (_ BitVec 64)) (t!51586 List!36678)) )
))
(declare-fun lt!673075 () List!36678)

(declare-fun contains!10380 (List!36678 (_ BitVec 64)) Bool)

(assert (=> b!1567916 (= e!874041 (contains!10380 lt!673075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567917 () Bool)

(declare-fun res!1071607 () Bool)

(declare-fun e!874043 () Bool)

(assert (=> b!1567917 (=> (not res!1071607) (not e!874043))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104729 0))(
  ( (array!104730 (arr!50546 (Array (_ BitVec 32) (_ BitVec 64))) (size!51096 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104729)

(assert (=> b!1567917 (= res!1071607 (bvslt from!2856 (size!51096 a!3481)))))

(declare-fun b!1567918 () Bool)

(declare-fun e!874042 () Bool)

(assert (=> b!1567918 (= e!874042 e!874041)))

(declare-fun res!1071610 () Bool)

(assert (=> b!1567918 (=> res!1071610 e!874041)))

(assert (=> b!1567918 (= res!1071610 (contains!10380 lt!673075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567919 () Bool)

(declare-fun e!874040 () Bool)

(assert (=> b!1567919 (= e!874040 e!874042)))

(declare-fun res!1071605 () Bool)

(assert (=> b!1567919 (=> (not res!1071605) (not e!874042))))

(assert (=> b!1567919 (= res!1071605 (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000))))

(declare-fun acc!619 () List!36678)

(assert (=> b!1567919 (= lt!673075 (Cons!36674 (select (arr!50546 a!3481) from!2856) acc!619))))

(declare-fun b!1567920 () Bool)

(declare-fun res!1071603 () Bool)

(assert (=> b!1567920 (=> (not res!1071603) (not e!874040))))

(declare-fun lt!673074 () Bool)

(assert (=> b!1567920 (= res!1071603 (not lt!673074))))

(declare-fun res!1071611 () Bool)

(assert (=> start!134218 (=> (not res!1071611) (not e!874043))))

(assert (=> start!134218 (= res!1071611 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51096 a!3481)) (bvslt (size!51096 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134218 e!874043))

(assert (=> start!134218 true))

(declare-fun array_inv!39273 (array!104729) Bool)

(assert (=> start!134218 (array_inv!39273 a!3481)))

(declare-fun b!1567921 () Bool)

(declare-fun res!1071606 () Bool)

(assert (=> b!1567921 (=> (not res!1071606) (not e!874043))))

(declare-fun noDuplicate!2652 (List!36678) Bool)

(assert (=> b!1567921 (= res!1071606 (noDuplicate!2652 acc!619))))

(declare-fun b!1567922 () Bool)

(declare-fun res!1071604 () Bool)

(assert (=> b!1567922 (=> (not res!1071604) (not e!874043))))

(assert (=> b!1567922 (= res!1071604 (not (contains!10380 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567923 () Bool)

(assert (=> b!1567923 (= e!874043 e!874040)))

(declare-fun res!1071609 () Bool)

(assert (=> b!1567923 (=> (not res!1071609) (not e!874040))))

(declare-fun e!874038 () Bool)

(assert (=> b!1567923 (= res!1071609 e!874038)))

(declare-fun res!1071602 () Bool)

(assert (=> b!1567923 (=> res!1071602 e!874038)))

(assert (=> b!1567923 (= res!1071602 lt!673074)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567923 (= lt!673074 (not (validKeyInArray!0 (select (arr!50546 a!3481) from!2856))))))

(declare-fun b!1567924 () Bool)

(declare-fun res!1071608 () Bool)

(assert (=> b!1567924 (=> (not res!1071608) (not e!874042))))

(assert (=> b!1567924 (= res!1071608 (noDuplicate!2652 lt!673075))))

(declare-fun b!1567925 () Bool)

(declare-fun res!1071612 () Bool)

(assert (=> b!1567925 (=> (not res!1071612) (not e!874043))))

(assert (=> b!1567925 (= res!1071612 (not (contains!10380 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567926 () Bool)

(assert (=> b!1567926 (= e!874038 (not (contains!10380 acc!619 (select (arr!50546 a!3481) from!2856))))))

(assert (= (and start!134218 res!1071611) b!1567921))

(assert (= (and b!1567921 res!1071606) b!1567922))

(assert (= (and b!1567922 res!1071604) b!1567925))

(assert (= (and b!1567925 res!1071612) b!1567917))

(assert (= (and b!1567917 res!1071607) b!1567923))

(assert (= (and b!1567923 (not res!1071602)) b!1567926))

(assert (= (and b!1567923 res!1071609) b!1567920))

(assert (= (and b!1567920 res!1071603) b!1567919))

(assert (= (and b!1567919 res!1071605) b!1567924))

(assert (= (and b!1567924 res!1071608) b!1567918))

(assert (= (and b!1567918 (not res!1071610)) b!1567916))

(declare-fun m!1442655 () Bool)

(assert (=> b!1567916 m!1442655))

(declare-fun m!1442657 () Bool)

(assert (=> b!1567921 m!1442657))

(declare-fun m!1442659 () Bool)

(assert (=> start!134218 m!1442659))

(declare-fun m!1442661 () Bool)

(assert (=> b!1567918 m!1442661))

(declare-fun m!1442663 () Bool)

(assert (=> b!1567924 m!1442663))

(declare-fun m!1442665 () Bool)

(assert (=> b!1567923 m!1442665))

(assert (=> b!1567923 m!1442665))

(declare-fun m!1442667 () Bool)

(assert (=> b!1567923 m!1442667))

(declare-fun m!1442669 () Bool)

(assert (=> b!1567925 m!1442669))

(declare-fun m!1442671 () Bool)

(assert (=> b!1567922 m!1442671))

(assert (=> b!1567919 m!1442665))

(assert (=> b!1567926 m!1442665))

(assert (=> b!1567926 m!1442665))

(declare-fun m!1442673 () Bool)

(assert (=> b!1567926 m!1442673))

(check-sat (not b!1567924) (not start!134218) (not b!1567925) (not b!1567922) (not b!1567918) (not b!1567921) (not b!1567926) (not b!1567916) (not b!1567923))
(check-sat)
(get-model)

(declare-fun d!163675 () Bool)

(declare-fun lt!673084 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!815 (List!36678) (InoxSet (_ BitVec 64)))

(assert (=> d!163675 (= lt!673084 (select (content!815 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874067 () Bool)

(assert (=> d!163675 (= lt!673084 e!874067)))

(declare-fun res!1071650 () Bool)

(assert (=> d!163675 (=> (not res!1071650) (not e!874067))))

(get-info :version)

(assert (=> d!163675 (= res!1071650 ((_ is Cons!36674) acc!619))))

(assert (=> d!163675 (= (contains!10380 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673084)))

(declare-fun b!1567964 () Bool)

(declare-fun e!874066 () Bool)

(assert (=> b!1567964 (= e!874067 e!874066)))

(declare-fun res!1071651 () Bool)

(assert (=> b!1567964 (=> res!1071651 e!874066)))

(assert (=> b!1567964 (= res!1071651 (= (h!38121 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567965 () Bool)

(assert (=> b!1567965 (= e!874066 (contains!10380 (t!51586 acc!619) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163675 res!1071650) b!1567964))

(assert (= (and b!1567964 (not res!1071651)) b!1567965))

(declare-fun m!1442695 () Bool)

(assert (=> d!163675 m!1442695))

(declare-fun m!1442697 () Bool)

(assert (=> d!163675 m!1442697))

(declare-fun m!1442699 () Bool)

(assert (=> b!1567965 m!1442699))

(assert (=> b!1567922 d!163675))

(declare-fun d!163677 () Bool)

(assert (=> d!163677 (= (validKeyInArray!0 (select (arr!50546 a!3481) from!2856)) (and (not (= (select (arr!50546 a!3481) from!2856) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50546 a!3481) from!2856) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1567923 d!163677))

(declare-fun d!163679 () Bool)

(declare-fun lt!673085 () Bool)

(assert (=> d!163679 (= lt!673085 (select (content!815 lt!673075) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874069 () Bool)

(assert (=> d!163679 (= lt!673085 e!874069)))

(declare-fun res!1071652 () Bool)

(assert (=> d!163679 (=> (not res!1071652) (not e!874069))))

(assert (=> d!163679 (= res!1071652 ((_ is Cons!36674) lt!673075))))

(assert (=> d!163679 (= (contains!10380 lt!673075 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673085)))

(declare-fun b!1567966 () Bool)

(declare-fun e!874068 () Bool)

(assert (=> b!1567966 (= e!874069 e!874068)))

(declare-fun res!1071653 () Bool)

(assert (=> b!1567966 (=> res!1071653 e!874068)))

(assert (=> b!1567966 (= res!1071653 (= (h!38121 lt!673075) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567967 () Bool)

(assert (=> b!1567967 (= e!874068 (contains!10380 (t!51586 lt!673075) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163679 res!1071652) b!1567966))

(assert (= (and b!1567966 (not res!1071653)) b!1567967))

(declare-fun m!1442701 () Bool)

(assert (=> d!163679 m!1442701))

(declare-fun m!1442703 () Bool)

(assert (=> d!163679 m!1442703))

(declare-fun m!1442705 () Bool)

(assert (=> b!1567967 m!1442705))

(assert (=> b!1567918 d!163679))

(declare-fun d!163681 () Bool)

(declare-fun res!1071658 () Bool)

(declare-fun e!874074 () Bool)

(assert (=> d!163681 (=> res!1071658 e!874074)))

(assert (=> d!163681 (= res!1071658 ((_ is Nil!36675) lt!673075))))

(assert (=> d!163681 (= (noDuplicate!2652 lt!673075) e!874074)))

(declare-fun b!1567972 () Bool)

(declare-fun e!874075 () Bool)

(assert (=> b!1567972 (= e!874074 e!874075)))

(declare-fun res!1071659 () Bool)

(assert (=> b!1567972 (=> (not res!1071659) (not e!874075))))

(assert (=> b!1567972 (= res!1071659 (not (contains!10380 (t!51586 lt!673075) (h!38121 lt!673075))))))

(declare-fun b!1567973 () Bool)

(assert (=> b!1567973 (= e!874075 (noDuplicate!2652 (t!51586 lt!673075)))))

(assert (= (and d!163681 (not res!1071658)) b!1567972))

(assert (= (and b!1567972 res!1071659) b!1567973))

(declare-fun m!1442707 () Bool)

(assert (=> b!1567972 m!1442707))

(declare-fun m!1442709 () Bool)

(assert (=> b!1567973 m!1442709))

(assert (=> b!1567924 d!163681))

(declare-fun d!163685 () Bool)

(declare-fun lt!673086 () Bool)

(assert (=> d!163685 (= lt!673086 (select (content!815 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874077 () Bool)

(assert (=> d!163685 (= lt!673086 e!874077)))

(declare-fun res!1071660 () Bool)

(assert (=> d!163685 (=> (not res!1071660) (not e!874077))))

(assert (=> d!163685 (= res!1071660 ((_ is Cons!36674) acc!619))))

(assert (=> d!163685 (= (contains!10380 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673086)))

(declare-fun b!1567974 () Bool)

(declare-fun e!874076 () Bool)

(assert (=> b!1567974 (= e!874077 e!874076)))

(declare-fun res!1071661 () Bool)

(assert (=> b!1567974 (=> res!1071661 e!874076)))

(assert (=> b!1567974 (= res!1071661 (= (h!38121 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567975 () Bool)

(assert (=> b!1567975 (= e!874076 (contains!10380 (t!51586 acc!619) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163685 res!1071660) b!1567974))

(assert (= (and b!1567974 (not res!1071661)) b!1567975))

(assert (=> d!163685 m!1442695))

(declare-fun m!1442711 () Bool)

(assert (=> d!163685 m!1442711))

(declare-fun m!1442713 () Bool)

(assert (=> b!1567975 m!1442713))

(assert (=> b!1567925 d!163685))

(declare-fun d!163687 () Bool)

(declare-fun lt!673087 () Bool)

(assert (=> d!163687 (= lt!673087 (select (content!815 acc!619) (select (arr!50546 a!3481) from!2856)))))

(declare-fun e!874079 () Bool)

(assert (=> d!163687 (= lt!673087 e!874079)))

(declare-fun res!1071662 () Bool)

(assert (=> d!163687 (=> (not res!1071662) (not e!874079))))

(assert (=> d!163687 (= res!1071662 ((_ is Cons!36674) acc!619))))

(assert (=> d!163687 (= (contains!10380 acc!619 (select (arr!50546 a!3481) from!2856)) lt!673087)))

(declare-fun b!1567976 () Bool)

(declare-fun e!874078 () Bool)

(assert (=> b!1567976 (= e!874079 e!874078)))

(declare-fun res!1071663 () Bool)

(assert (=> b!1567976 (=> res!1071663 e!874078)))

(assert (=> b!1567976 (= res!1071663 (= (h!38121 acc!619) (select (arr!50546 a!3481) from!2856)))))

(declare-fun b!1567977 () Bool)

(assert (=> b!1567977 (= e!874078 (contains!10380 (t!51586 acc!619) (select (arr!50546 a!3481) from!2856)))))

(assert (= (and d!163687 res!1071662) b!1567976))

(assert (= (and b!1567976 (not res!1071663)) b!1567977))

(assert (=> d!163687 m!1442695))

(assert (=> d!163687 m!1442665))

(declare-fun m!1442715 () Bool)

(assert (=> d!163687 m!1442715))

(assert (=> b!1567977 m!1442665))

(declare-fun m!1442717 () Bool)

(assert (=> b!1567977 m!1442717))

(assert (=> b!1567926 d!163687))

(declare-fun d!163689 () Bool)

(declare-fun res!1071664 () Bool)

(declare-fun e!874080 () Bool)

(assert (=> d!163689 (=> res!1071664 e!874080)))

(assert (=> d!163689 (= res!1071664 ((_ is Nil!36675) acc!619))))

(assert (=> d!163689 (= (noDuplicate!2652 acc!619) e!874080)))

(declare-fun b!1567978 () Bool)

(declare-fun e!874081 () Bool)

(assert (=> b!1567978 (= e!874080 e!874081)))

(declare-fun res!1071665 () Bool)

(assert (=> b!1567978 (=> (not res!1071665) (not e!874081))))

(assert (=> b!1567978 (= res!1071665 (not (contains!10380 (t!51586 acc!619) (h!38121 acc!619))))))

(declare-fun b!1567979 () Bool)

(assert (=> b!1567979 (= e!874081 (noDuplicate!2652 (t!51586 acc!619)))))

(assert (= (and d!163689 (not res!1071664)) b!1567978))

(assert (= (and b!1567978 res!1071665) b!1567979))

(declare-fun m!1442719 () Bool)

(assert (=> b!1567978 m!1442719))

(declare-fun m!1442721 () Bool)

(assert (=> b!1567979 m!1442721))

(assert (=> b!1567921 d!163689))

(declare-fun d!163691 () Bool)

(assert (=> d!163691 (= (array_inv!39273 a!3481) (bvsge (size!51096 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134218 d!163691))

(declare-fun d!163693 () Bool)

(declare-fun lt!673090 () Bool)

(assert (=> d!163693 (= lt!673090 (select (content!815 lt!673075) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!874085 () Bool)

(assert (=> d!163693 (= lt!673090 e!874085)))

(declare-fun res!1071668 () Bool)

(assert (=> d!163693 (=> (not res!1071668) (not e!874085))))

(assert (=> d!163693 (= res!1071668 ((_ is Cons!36674) lt!673075))))

(assert (=> d!163693 (= (contains!10380 lt!673075 #b1000000000000000000000000000000000000000000000000000000000000000) lt!673090)))

(declare-fun b!1567982 () Bool)

(declare-fun e!874084 () Bool)

(assert (=> b!1567982 (= e!874085 e!874084)))

(declare-fun res!1071669 () Bool)

(assert (=> b!1567982 (=> res!1071669 e!874084)))

(assert (=> b!1567982 (= res!1071669 (= (h!38121 lt!673075) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567983 () Bool)

(assert (=> b!1567983 (= e!874084 (contains!10380 (t!51586 lt!673075) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163693 res!1071668) b!1567982))

(assert (= (and b!1567982 (not res!1071669)) b!1567983))

(assert (=> d!163693 m!1442701))

(declare-fun m!1442723 () Bool)

(assert (=> d!163693 m!1442723))

(declare-fun m!1442725 () Bool)

(assert (=> b!1567983 m!1442725))

(assert (=> b!1567916 d!163693))

(check-sat (not b!1567978) (not b!1567967) (not d!163679) (not b!1567975) (not d!163685) (not d!163687) (not b!1567983) (not b!1567977) (not d!163675) (not b!1567972) (not b!1567979) (not b!1567965) (not d!163693) (not b!1567973))
(check-sat)
