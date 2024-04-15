; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61758 () Bool)

(assert start!61758)

(declare-fun b!690978 () Bool)

(declare-fun e!393266 () Bool)

(assert (=> b!690978 (= e!393266 (not true))))

(assert (=> b!690978 false))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((Unit!24354 0))(
  ( (Unit!24355) )
))
(declare-fun lt!316191 () Unit!24354)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39790 0))(
  ( (array!39791 (arr!19063 (Array (_ BitVec 32) (_ BitVec 64))) (size!19445 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39790 (_ BitVec 64) (_ BitVec 32)) Unit!24354)

(assert (=> b!690978 (= lt!316191 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun arrayContainsKey!0 (array!39790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690978 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690979 () Bool)

(declare-fun res!455526 () Bool)

(assert (=> b!690979 (=> (not res!455526) (not e!393266))))

(declare-fun e!393262 () Bool)

(assert (=> b!690979 (= res!455526 e!393262)))

(declare-fun res!455521 () Bool)

(assert (=> b!690979 (=> res!455521 e!393262)))

(declare-fun e!393265 () Bool)

(assert (=> b!690979 (= res!455521 e!393265)))

(declare-fun res!455519 () Bool)

(assert (=> b!690979 (=> (not res!455519) (not e!393265))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690979 (= res!455519 (bvsgt from!3004 i!1382))))

(declare-fun b!690980 () Bool)

(declare-fun res!455524 () Bool)

(assert (=> b!690980 (=> (not res!455524) (not e!393266))))

(declare-datatypes ((List!13143 0))(
  ( (Nil!13140) (Cons!13139 (h!14184 (_ BitVec 64)) (t!19401 List!13143)) )
))
(declare-fun arrayNoDuplicates!0 (array!39790 (_ BitVec 32) List!13143) Bool)

(assert (=> b!690980 (= res!455524 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13140))))

(declare-fun b!690981 () Bool)

(declare-fun res!455523 () Bool)

(assert (=> b!690981 (=> (not res!455523) (not e!393266))))

(declare-fun acc!681 () List!13143)

(assert (=> b!690981 (= res!455523 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!455529 () Bool)

(assert (=> start!61758 (=> (not res!455529) (not e!393266))))

(assert (=> start!61758 (= res!455529 (and (bvslt (size!19445 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19445 a!3626))))))

(assert (=> start!61758 e!393266))

(assert (=> start!61758 true))

(declare-fun array_inv!14946 (array!39790) Bool)

(assert (=> start!61758 (array_inv!14946 a!3626)))

(declare-fun b!690982 () Bool)

(declare-fun res!455530 () Bool)

(assert (=> b!690982 (=> (not res!455530) (not e!393266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690982 (= res!455530 (validKeyInArray!0 (select (arr!19063 a!3626) from!3004)))))

(declare-fun b!690983 () Bool)

(declare-fun res!455525 () Bool)

(assert (=> b!690983 (=> (not res!455525) (not e!393266))))

(declare-fun noDuplicate!934 (List!13143) Bool)

(assert (=> b!690983 (= res!455525 (noDuplicate!934 acc!681))))

(declare-fun b!690984 () Bool)

(declare-fun contains!3665 (List!13143 (_ BitVec 64)) Bool)

(assert (=> b!690984 (= e!393265 (contains!3665 acc!681 k!2843))))

(declare-fun b!690985 () Bool)

(declare-fun res!455532 () Bool)

(assert (=> b!690985 (=> (not res!455532) (not e!393266))))

(assert (=> b!690985 (= res!455532 (not (contains!3665 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690986 () Bool)

(declare-fun e!393264 () Bool)

(assert (=> b!690986 (= e!393262 e!393264)))

(declare-fun res!455533 () Bool)

(assert (=> b!690986 (=> (not res!455533) (not e!393264))))

(assert (=> b!690986 (= res!455533 (bvsle from!3004 i!1382))))

(declare-fun b!690987 () Bool)

(declare-fun res!455527 () Bool)

(assert (=> b!690987 (=> (not res!455527) (not e!393266))))

(assert (=> b!690987 (= res!455527 (= (select (arr!19063 a!3626) from!3004) k!2843))))

(declare-fun b!690988 () Bool)

(assert (=> b!690988 (= e!393264 (not (contains!3665 acc!681 k!2843)))))

(declare-fun b!690989 () Bool)

(declare-fun res!455531 () Bool)

(assert (=> b!690989 (=> (not res!455531) (not e!393266))))

(assert (=> b!690989 (= res!455531 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690990 () Bool)

(declare-fun res!455518 () Bool)

(assert (=> b!690990 (=> (not res!455518) (not e!393266))))

(assert (=> b!690990 (= res!455518 (not (contains!3665 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690991 () Bool)

(declare-fun res!455528 () Bool)

(assert (=> b!690991 (=> (not res!455528) (not e!393266))))

(assert (=> b!690991 (= res!455528 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19445 a!3626))))))

(declare-fun b!690992 () Bool)

(declare-fun res!455520 () Bool)

(assert (=> b!690992 (=> (not res!455520) (not e!393266))))

(assert (=> b!690992 (= res!455520 (validKeyInArray!0 k!2843))))

(declare-fun b!690993 () Bool)

(declare-fun res!455522 () Bool)

(assert (=> b!690993 (=> (not res!455522) (not e!393266))))

(assert (=> b!690993 (= res!455522 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19445 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!61758 res!455529) b!690983))

(assert (= (and b!690983 res!455525) b!690985))

(assert (= (and b!690985 res!455532) b!690990))

(assert (= (and b!690990 res!455518) b!690979))

(assert (= (and b!690979 res!455519) b!690984))

(assert (= (and b!690979 (not res!455521)) b!690986))

(assert (= (and b!690986 res!455533) b!690988))

(assert (= (and b!690979 res!455526) b!690980))

(assert (= (and b!690980 res!455524) b!690981))

(assert (= (and b!690981 res!455523) b!690991))

(assert (= (and b!690991 res!455528) b!690992))

(assert (= (and b!690992 res!455520) b!690989))

(assert (= (and b!690989 res!455531) b!690993))

(assert (= (and b!690993 res!455522) b!690982))

(assert (= (and b!690982 res!455530) b!690987))

(assert (= (and b!690987 res!455527) b!690978))

(declare-fun m!653599 () Bool)

(assert (=> start!61758 m!653599))

(declare-fun m!653601 () Bool)

(assert (=> b!690980 m!653601))

(declare-fun m!653603 () Bool)

(assert (=> b!690981 m!653603))

(declare-fun m!653605 () Bool)

(assert (=> b!690989 m!653605))

(declare-fun m!653607 () Bool)

(assert (=> b!690985 m!653607))

(declare-fun m!653609 () Bool)

(assert (=> b!690992 m!653609))

(declare-fun m!653611 () Bool)

(assert (=> b!690978 m!653611))

(declare-fun m!653613 () Bool)

(assert (=> b!690978 m!653613))

(declare-fun m!653615 () Bool)

(assert (=> b!690984 m!653615))

(assert (=> b!690988 m!653615))

(declare-fun m!653617 () Bool)

(assert (=> b!690990 m!653617))

(declare-fun m!653619 () Bool)

(assert (=> b!690983 m!653619))

(declare-fun m!653621 () Bool)

(assert (=> b!690982 m!653621))

(assert (=> b!690982 m!653621))

(declare-fun m!653623 () Bool)

(assert (=> b!690982 m!653623))

(assert (=> b!690987 m!653621))

(push 1)

(assert (not b!690990))

(assert (not b!690978))

(assert (not b!690981))

(assert (not b!690992))

(assert (not b!690984))

(assert (not b!690989))

(assert (not b!690980))

(assert (not b!690982))

(assert (not b!690985))

(assert (not b!690988))

(assert (not start!61758))

(assert (not b!690983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

