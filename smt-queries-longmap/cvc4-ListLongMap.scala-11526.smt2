; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134220 () Bool)

(assert start!134220)

(declare-fun b!1567949 () Bool)

(declare-fun res!1071637 () Bool)

(declare-fun e!874060 () Bool)

(assert (=> b!1567949 (=> (not res!1071637) (not e!874060))))

(declare-datatypes ((List!36679 0))(
  ( (Nil!36676) (Cons!36675 (h!38122 (_ BitVec 64)) (t!51587 List!36679)) )
))
(declare-fun lt!673081 () List!36679)

(declare-fun noDuplicate!2653 (List!36679) Bool)

(assert (=> b!1567949 (= res!1071637 (noDuplicate!2653 lt!673081))))

(declare-fun b!1567950 () Bool)

(declare-fun e!874059 () Bool)

(assert (=> b!1567950 (= e!874059 e!874060)))

(declare-fun res!1071641 () Bool)

(assert (=> b!1567950 (=> (not res!1071641) (not e!874060))))

(declare-fun from!2856 () (_ BitVec 32))

(assert (=> b!1567950 (= res!1071641 (bvsge (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000))))

(declare-datatypes ((array!104731 0))(
  ( (array!104732 (arr!50547 (Array (_ BitVec 32) (_ BitVec 64))) (size!51097 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104731)

(declare-fun acc!619 () List!36679)

(assert (=> b!1567950 (= lt!673081 (Cons!36675 (select (arr!50547 a!3481) from!2856) acc!619))))

(declare-fun b!1567951 () Bool)

(declare-fun res!1071644 () Bool)

(declare-fun e!874056 () Bool)

(assert (=> b!1567951 (=> (not res!1071644) (not e!874056))))

(declare-fun contains!10381 (List!36679 (_ BitVec 64)) Bool)

(assert (=> b!1567951 (= res!1071644 (not (contains!10381 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567952 () Bool)

(declare-fun res!1071639 () Bool)

(assert (=> b!1567952 (=> (not res!1071639) (not e!874056))))

(assert (=> b!1567952 (= res!1071639 (noDuplicate!2653 acc!619))))

(declare-fun b!1567953 () Bool)

(declare-fun res!1071635 () Bool)

(assert (=> b!1567953 (=> (not res!1071635) (not e!874056))))

(assert (=> b!1567953 (= res!1071635 (bvslt from!2856 (size!51097 a!3481)))))

(declare-fun b!1567954 () Bool)

(declare-fun res!1071643 () Bool)

(assert (=> b!1567954 (=> (not res!1071643) (not e!874059))))

(declare-fun lt!673080 () Bool)

(assert (=> b!1567954 (= res!1071643 (not lt!673080))))

(declare-fun res!1071640 () Bool)

(assert (=> start!134220 (=> (not res!1071640) (not e!874056))))

(assert (=> start!134220 (= res!1071640 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51097 a!3481)) (bvslt (size!51097 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134220 e!874056))

(assert (=> start!134220 true))

(declare-fun array_inv!39274 (array!104731) Bool)

(assert (=> start!134220 (array_inv!39274 a!3481)))

(declare-fun b!1567955 () Bool)

(declare-fun e!874058 () Bool)

(assert (=> b!1567955 (= e!874058 (contains!10381 lt!673081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1567956 () Bool)

(declare-fun res!1071636 () Bool)

(assert (=> b!1567956 (=> (not res!1071636) (not e!874056))))

(assert (=> b!1567956 (= res!1071636 (not (contains!10381 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567957 () Bool)

(assert (=> b!1567957 (= e!874056 e!874059)))

(declare-fun res!1071642 () Bool)

(assert (=> b!1567957 (=> (not res!1071642) (not e!874059))))

(declare-fun e!874061 () Bool)

(assert (=> b!1567957 (= res!1071642 e!874061)))

(declare-fun res!1071638 () Bool)

(assert (=> b!1567957 (=> res!1071638 e!874061)))

(assert (=> b!1567957 (= res!1071638 lt!673080)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567957 (= lt!673080 (not (validKeyInArray!0 (select (arr!50547 a!3481) from!2856))))))

(declare-fun b!1567958 () Bool)

(assert (=> b!1567958 (= e!874061 (not (contains!10381 acc!619 (select (arr!50547 a!3481) from!2856))))))

(declare-fun b!1567959 () Bool)

(assert (=> b!1567959 (= e!874060 e!874058)))

(declare-fun res!1071645 () Bool)

(assert (=> b!1567959 (=> res!1071645 e!874058)))

(assert (=> b!1567959 (= res!1071645 (contains!10381 lt!673081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134220 res!1071640) b!1567952))

(assert (= (and b!1567952 res!1071639) b!1567956))

(assert (= (and b!1567956 res!1071636) b!1567951))

(assert (= (and b!1567951 res!1071644) b!1567953))

(assert (= (and b!1567953 res!1071635) b!1567957))

(assert (= (and b!1567957 (not res!1071638)) b!1567958))

(assert (= (and b!1567957 res!1071642) b!1567954))

(assert (= (and b!1567954 res!1071643) b!1567950))

(assert (= (and b!1567950 res!1071641) b!1567949))

(assert (= (and b!1567949 res!1071637) b!1567959))

(assert (= (and b!1567959 (not res!1071645)) b!1567955))

(declare-fun m!1442675 () Bool)

(assert (=> b!1567955 m!1442675))

(declare-fun m!1442677 () Bool)

(assert (=> b!1567958 m!1442677))

(assert (=> b!1567958 m!1442677))

(declare-fun m!1442679 () Bool)

(assert (=> b!1567958 m!1442679))

(declare-fun m!1442681 () Bool)

(assert (=> b!1567952 m!1442681))

(declare-fun m!1442683 () Bool)

(assert (=> start!134220 m!1442683))

(assert (=> b!1567957 m!1442677))

(assert (=> b!1567957 m!1442677))

(declare-fun m!1442685 () Bool)

(assert (=> b!1567957 m!1442685))

(declare-fun m!1442687 () Bool)

(assert (=> b!1567949 m!1442687))

(declare-fun m!1442689 () Bool)

(assert (=> b!1567951 m!1442689))

(declare-fun m!1442691 () Bool)

(assert (=> b!1567959 m!1442691))

(assert (=> b!1567950 m!1442677))

(declare-fun m!1442693 () Bool)

(assert (=> b!1567956 m!1442693))

(push 1)

(assert (not b!1567956))

(assert (not b!1567949))

(assert (not b!1567955))

(assert (not b!1567951))

(assert (not b!1567957))

(assert (not start!134220))

(assert (not b!1567952))

(assert (not b!1567959))

(assert (not b!1567958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163703 () Bool)

(declare-fun lt!673098 () Bool)

(declare-fun content!817 (List!36679) (Set (_ BitVec 64)))

(assert (=> d!163703 (= lt!673098 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!817 lt!673081)))))

(declare-fun e!874111 () Bool)

(assert (=> d!163703 (= lt!673098 e!874111)))

(declare-fun res!1071695 () Bool)

(assert (=> d!163703 (=> (not res!1071695) (not e!874111))))

(assert (=> d!163703 (= res!1071695 (is-Cons!36675 lt!673081))))

(assert (=> d!163703 (= (contains!10381 lt!673081 #b0000000000000000000000000000000000000000000000000000000000000000) lt!673098)))

(declare-fun b!1568008 () Bool)

(declare-fun e!874110 () Bool)

(assert (=> b!1568008 (= e!874111 e!874110)))

(declare-fun res!1071694 () Bool)

(assert (=> b!1568008 (=> res!1071694 e!874110)))

(assert (=> b!1568008 (= res!1071694 (= (h!38122 lt!673081) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1568009 () Bool)

(assert (=> b!1568009 (= e!874110 (contains!10381 (t!51587 lt!673081) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163703 res!1071695) b!1568008))

(assert (= (and b!1568008 (not res!1071694)) b!1568009))

(declare-fun m!1442759 () Bool)

(assert (=> d!163703 m!1442759))

(declare-fun m!1442761 () Bool)

(assert (=> d!163703 m!1442761))

(declare-fun m!1442763 () Bool)

(assert (=> b!1568009 m!1442763))

(assert (=> b!1567959 d!163703))

(declare-fun d!163713 () Bool)

(assert (=> d!163713 (= (array_inv!39274 a!3481) (bvsge (size!51097 a!3481) #b00000000000000000000000000000000))))

(assert (=> start!134220 d!163713))

(declare-fun d!163715 () Bool)

(declare-fun res!1071700 () Bool)

(declare-fun e!874116 () Bool)

(assert (=> d!163715 (=> res!1071700 e!874116)))

(assert (=> d!163715 (= res!1071700 (is-Nil!36676 lt!673081))))

(assert (=> d!163715 (= (noDuplicate!2653 lt!673081) e!874116)))

(declare-fun b!1568014 () Bool)

(declare-fun e!874117 () Bool)

(assert (=> b!1568014 (= e!874116 e!874117)))

(declare-fun res!1071701 () Bool)

(assert (=> b!1568014 (=> (not res!1071701) (not e!874117))))

(assert (=> b!1568014 (= res!1071701 (not (contains!10381 (t!51587 lt!673081) (h!38122 lt!673081))))))

(declare-fun b!1568015 () Bool)

(assert (=> b!1568015 (= e!874117 (noDuplicate!2653 (t!51587 lt!673081)))))

(assert (= (and d!163715 (not res!1071700)) b!1568014))

(assert (= (and b!1568014 res!1071701) b!1568015))

(declare-fun m!1442765 () Bool)

(assert (=> b!1568014 m!1442765))

