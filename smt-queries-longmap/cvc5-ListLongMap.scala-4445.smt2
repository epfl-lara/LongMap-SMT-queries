; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61764 () Bool)

(assert start!61764)

(declare-fun b!691130 () Bool)

(declare-fun res!455654 () Bool)

(declare-fun e!393316 () Bool)

(assert (=> b!691130 (=> (not res!455654) (not e!393316))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691130 (= res!455654 (validKeyInArray!0 k!2843))))

(declare-fun b!691131 () Bool)

(declare-fun res!455665 () Bool)

(assert (=> b!691131 (=> (not res!455665) (not e!393316))))

(declare-datatypes ((List!13146 0))(
  ( (Nil!13143) (Cons!13142 (h!14187 (_ BitVec 64)) (t!19404 List!13146)) )
))
(declare-fun acc!681 () List!13146)

(declare-fun contains!3668 (List!13146 (_ BitVec 64)) Bool)

(assert (=> b!691131 (= res!455665 (not (contains!3668 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691132 () Bool)

(assert (=> b!691132 (= e!393316 false)))

(declare-datatypes ((Unit!24364 0))(
  ( (Unit!24365) )
))
(declare-fun lt!316209 () Unit!24364)

(declare-fun e!393318 () Unit!24364)

(assert (=> b!691132 (= lt!316209 e!393318)))

(declare-datatypes ((array!39796 0))(
  ( (array!39797 (arr!19066 (Array (_ BitVec 32) (_ BitVec 64))) (size!19448 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39796)

(declare-fun c!78105 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!691132 (= c!78105 (= (select (arr!19066 a!3626) from!3004) k!2843))))

(declare-fun b!691133 () Bool)

(declare-fun res!455661 () Bool)

(assert (=> b!691133 (=> (not res!455661) (not e!393316))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691133 (= res!455661 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19448 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691134 () Bool)

(declare-fun Unit!24366 () Unit!24364)

(assert (=> b!691134 (= e!393318 Unit!24366)))

(declare-fun b!691135 () Bool)

(declare-fun e!393320 () Bool)

(assert (=> b!691135 (= e!393320 (contains!3668 acc!681 k!2843))))

(declare-fun b!691136 () Bool)

(declare-fun res!455655 () Bool)

(assert (=> b!691136 (=> (not res!455655) (not e!393316))))

(assert (=> b!691136 (= res!455655 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19448 a!3626))))))

(declare-fun b!691138 () Bool)

(declare-fun res!455662 () Bool)

(assert (=> b!691138 (=> (not res!455662) (not e!393316))))

(assert (=> b!691138 (= res!455662 (validKeyInArray!0 (select (arr!19066 a!3626) from!3004)))))

(declare-fun b!691139 () Bool)

(declare-fun res!455659 () Bool)

(assert (=> b!691139 (=> (not res!455659) (not e!393316))))

(declare-fun arrayNoDuplicates!0 (array!39796 (_ BitVec 32) List!13146) Bool)

(assert (=> b!691139 (= res!455659 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691140 () Bool)

(declare-fun res!455658 () Bool)

(assert (=> b!691140 (=> (not res!455658) (not e!393316))))

(declare-fun arrayContainsKey!0 (array!39796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691140 (= res!455658 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691141 () Bool)

(declare-fun e!393319 () Bool)

(declare-fun e!393315 () Bool)

(assert (=> b!691141 (= e!393319 e!393315)))

(declare-fun res!455668 () Bool)

(assert (=> b!691141 (=> (not res!455668) (not e!393315))))

(assert (=> b!691141 (= res!455668 (bvsle from!3004 i!1382))))

(declare-fun b!691142 () Bool)

(declare-fun res!455657 () Bool)

(assert (=> b!691142 (=> (not res!455657) (not e!393316))))

(declare-fun noDuplicate!937 (List!13146) Bool)

(assert (=> b!691142 (= res!455657 (noDuplicate!937 acc!681))))

(declare-fun b!691143 () Bool)

(declare-fun res!455656 () Bool)

(assert (=> b!691143 (=> (not res!455656) (not e!393316))))

(assert (=> b!691143 (= res!455656 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13143))))

(declare-fun b!691144 () Bool)

(assert (=> b!691144 (= e!393315 (not (contains!3668 acc!681 k!2843)))))

(declare-fun b!691137 () Bool)

(declare-fun res!455666 () Bool)

(assert (=> b!691137 (=> (not res!455666) (not e!393316))))

(assert (=> b!691137 (= res!455666 e!393319)))

(declare-fun res!455664 () Bool)

(assert (=> b!691137 (=> res!455664 e!393319)))

(assert (=> b!691137 (= res!455664 e!393320)))

(declare-fun res!455667 () Bool)

(assert (=> b!691137 (=> (not res!455667) (not e!393320))))

(assert (=> b!691137 (= res!455667 (bvsgt from!3004 i!1382))))

(declare-fun res!455663 () Bool)

(assert (=> start!61764 (=> (not res!455663) (not e!393316))))

(assert (=> start!61764 (= res!455663 (and (bvslt (size!19448 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19448 a!3626))))))

(assert (=> start!61764 e!393316))

(assert (=> start!61764 true))

(declare-fun array_inv!14949 (array!39796) Bool)

(assert (=> start!61764 (array_inv!14949 a!3626)))

(declare-fun b!691145 () Bool)

(declare-fun Unit!24367 () Unit!24364)

(assert (=> b!691145 (= e!393318 Unit!24367)))

(assert (=> b!691145 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316208 () Unit!24364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39796 (_ BitVec 64) (_ BitVec 32)) Unit!24364)

(assert (=> b!691145 (= lt!316208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691145 false))

(declare-fun b!691146 () Bool)

(declare-fun res!455660 () Bool)

(assert (=> b!691146 (=> (not res!455660) (not e!393316))))

(assert (=> b!691146 (= res!455660 (not (contains!3668 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61764 res!455663) b!691142))

(assert (= (and b!691142 res!455657) b!691131))

(assert (= (and b!691131 res!455665) b!691146))

(assert (= (and b!691146 res!455660) b!691137))

(assert (= (and b!691137 res!455667) b!691135))

(assert (= (and b!691137 (not res!455664)) b!691141))

(assert (= (and b!691141 res!455668) b!691144))

(assert (= (and b!691137 res!455666) b!691143))

(assert (= (and b!691143 res!455656) b!691139))

(assert (= (and b!691139 res!455659) b!691136))

(assert (= (and b!691136 res!455655) b!691130))

(assert (= (and b!691130 res!455654) b!691140))

(assert (= (and b!691140 res!455658) b!691133))

(assert (= (and b!691133 res!455661) b!691138))

(assert (= (and b!691138 res!455662) b!691132))

(assert (= (and b!691132 c!78105) b!691145))

(assert (= (and b!691132 (not c!78105)) b!691134))

(declare-fun m!653677 () Bool)

(assert (=> b!691142 m!653677))

(declare-fun m!653679 () Bool)

(assert (=> b!691139 m!653679))

(declare-fun m!653681 () Bool)

(assert (=> b!691146 m!653681))

(declare-fun m!653683 () Bool)

(assert (=> start!61764 m!653683))

(declare-fun m!653685 () Bool)

(assert (=> b!691131 m!653685))

(declare-fun m!653687 () Bool)

(assert (=> b!691143 m!653687))

(declare-fun m!653689 () Bool)

(assert (=> b!691145 m!653689))

(declare-fun m!653691 () Bool)

(assert (=> b!691145 m!653691))

(declare-fun m!653693 () Bool)

(assert (=> b!691135 m!653693))

(declare-fun m!653695 () Bool)

(assert (=> b!691140 m!653695))

(assert (=> b!691144 m!653693))

(declare-fun m!653697 () Bool)

(assert (=> b!691138 m!653697))

(assert (=> b!691138 m!653697))

(declare-fun m!653699 () Bool)

(assert (=> b!691138 m!653699))

(declare-fun m!653701 () Bool)

(assert (=> b!691130 m!653701))

(assert (=> b!691132 m!653697))

(push 1)

(assert (not b!691142))

(assert (not b!691135))

(assert (not b!691143))

(assert (not b!691138))

(assert (not start!61764))

(assert (not b!691145))

(assert (not b!691146))

(assert (not b!691130))

(assert (not b!691139))

(assert (not b!691131))

(assert (not b!691140))

(assert (not b!691144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

