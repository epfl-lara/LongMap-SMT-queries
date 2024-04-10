; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61790 () Bool)

(assert start!61790)

(declare-fun b!691783 () Bool)

(declare-fun e!393633 () Bool)

(declare-datatypes ((List!13115 0))(
  ( (Nil!13112) (Cons!13111 (h!14156 (_ BitVec 64)) (t!19382 List!13115)) )
))
(declare-fun acc!681 () List!13115)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3692 (List!13115 (_ BitVec 64)) Bool)

(assert (=> b!691783 (= e!393633 (contains!3692 acc!681 k!2843))))

(declare-fun res!456114 () Bool)

(declare-fun e!393632 () Bool)

(assert (=> start!61790 (=> (not res!456114) (not e!393632))))

(declare-datatypes ((array!39811 0))(
  ( (array!39812 (arr!19074 (Array (_ BitVec 32) (_ BitVec 64))) (size!19459 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39811)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61790 (= res!456114 (and (bvslt (size!19459 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19459 a!3626))))))

(assert (=> start!61790 e!393632))

(assert (=> start!61790 true))

(declare-fun array_inv!14870 (array!39811) Bool)

(assert (=> start!61790 (array_inv!14870 a!3626)))

(declare-fun b!691784 () Bool)

(declare-fun res!456111 () Bool)

(assert (=> b!691784 (=> (not res!456111) (not e!393632))))

(declare-fun e!393634 () Bool)

(assert (=> b!691784 (= res!456111 e!393634)))

(declare-fun res!456117 () Bool)

(assert (=> b!691784 (=> res!456117 e!393634)))

(assert (=> b!691784 (= res!456117 e!393633)))

(declare-fun res!456115 () Bool)

(assert (=> b!691784 (=> (not res!456115) (not e!393633))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691784 (= res!456115 (bvsgt from!3004 i!1382))))

(declare-fun b!691785 () Bool)

(declare-fun e!393631 () Bool)

(assert (=> b!691785 (= e!393634 e!393631)))

(declare-fun res!456109 () Bool)

(assert (=> b!691785 (=> (not res!456109) (not e!393631))))

(assert (=> b!691785 (= res!456109 (bvsle from!3004 i!1382))))

(declare-fun b!691786 () Bool)

(assert (=> b!691786 (= e!393631 (not (contains!3692 acc!681 k!2843)))))

(declare-fun b!691787 () Bool)

(declare-fun res!456106 () Bool)

(assert (=> b!691787 (=> (not res!456106) (not e!393632))))

(assert (=> b!691787 (= res!456106 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19459 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691788 () Bool)

(declare-fun res!456112 () Bool)

(assert (=> b!691788 (=> (not res!456112) (not e!393632))))

(assert (=> b!691788 (= res!456112 (not (contains!3692 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691789 () Bool)

(declare-fun res!456118 () Bool)

(assert (=> b!691789 (=> (not res!456118) (not e!393632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691789 (= res!456118 (validKeyInArray!0 k!2843))))

(declare-fun b!691790 () Bool)

(declare-fun res!456119 () Bool)

(assert (=> b!691790 (=> (not res!456119) (not e!393632))))

(declare-fun arrayNoDuplicates!0 (array!39811 (_ BitVec 32) List!13115) Bool)

(assert (=> b!691790 (= res!456119 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691791 () Bool)

(declare-fun res!456113 () Bool)

(assert (=> b!691791 (=> (not res!456113) (not e!393632))))

(assert (=> b!691791 (= res!456113 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13112))))

(declare-fun b!691792 () Bool)

(declare-fun res!456107 () Bool)

(assert (=> b!691792 (=> (not res!456107) (not e!393632))))

(assert (=> b!691792 (= res!456107 (not (contains!3692 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691793 () Bool)

(declare-datatypes ((Unit!24414 0))(
  ( (Unit!24415) )
))
(declare-fun e!393636 () Unit!24414)

(declare-fun Unit!24416 () Unit!24414)

(assert (=> b!691793 (= e!393636 Unit!24416)))

(declare-fun arrayContainsKey!0 (array!39811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691793 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316507 () Unit!24414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39811 (_ BitVec 64) (_ BitVec 32)) Unit!24414)

(assert (=> b!691793 (= lt!316507 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691793 false))

(declare-fun b!691794 () Bool)

(assert (=> b!691794 (= e!393632 (and (not (= (select (arr!19074 a!3626) from!3004) k!2843)) (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316506 () Unit!24414)

(assert (=> b!691794 (= lt!316506 e!393636)))

(declare-fun c!78206 () Bool)

(assert (=> b!691794 (= c!78206 (= (select (arr!19074 a!3626) from!3004) k!2843))))

(declare-fun b!691795 () Bool)

(declare-fun res!456105 () Bool)

(assert (=> b!691795 (=> (not res!456105) (not e!393632))))

(assert (=> b!691795 (= res!456105 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19459 a!3626))))))

(declare-fun b!691796 () Bool)

(declare-fun Unit!24417 () Unit!24414)

(assert (=> b!691796 (= e!393636 Unit!24417)))

(declare-fun b!691797 () Bool)

(declare-fun res!456108 () Bool)

(assert (=> b!691797 (=> (not res!456108) (not e!393632))))

(assert (=> b!691797 (= res!456108 (validKeyInArray!0 (select (arr!19074 a!3626) from!3004)))))

(declare-fun b!691798 () Bool)

(declare-fun res!456116 () Bool)

(assert (=> b!691798 (=> (not res!456116) (not e!393632))))

(assert (=> b!691798 (= res!456116 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691799 () Bool)

(declare-fun res!456110 () Bool)

(assert (=> b!691799 (=> (not res!456110) (not e!393632))))

(declare-fun noDuplicate!939 (List!13115) Bool)

(assert (=> b!691799 (= res!456110 (noDuplicate!939 acc!681))))

(assert (= (and start!61790 res!456114) b!691799))

(assert (= (and b!691799 res!456110) b!691792))

(assert (= (and b!691792 res!456107) b!691788))

(assert (= (and b!691788 res!456112) b!691784))

(assert (= (and b!691784 res!456115) b!691783))

(assert (= (and b!691784 (not res!456117)) b!691785))

(assert (= (and b!691785 res!456109) b!691786))

(assert (= (and b!691784 res!456111) b!691791))

(assert (= (and b!691791 res!456113) b!691790))

(assert (= (and b!691790 res!456119) b!691795))

(assert (= (and b!691795 res!456105) b!691789))

(assert (= (and b!691789 res!456118) b!691798))

(assert (= (and b!691798 res!456116) b!691787))

(assert (= (and b!691787 res!456106) b!691797))

(assert (= (and b!691797 res!456108) b!691794))

(assert (= (and b!691794 c!78206) b!691793))

(assert (= (and b!691794 (not c!78206)) b!691796))

(declare-fun m!654641 () Bool)

(assert (=> b!691792 m!654641))

(declare-fun m!654643 () Bool)

(assert (=> b!691783 m!654643))

(declare-fun m!654645 () Bool)

(assert (=> b!691797 m!654645))

(assert (=> b!691797 m!654645))

(declare-fun m!654647 () Bool)

(assert (=> b!691797 m!654647))

(declare-fun m!654649 () Bool)

(assert (=> b!691789 m!654649))

(declare-fun m!654651 () Bool)

(assert (=> b!691790 m!654651))

(declare-fun m!654653 () Bool)

(assert (=> b!691798 m!654653))

(declare-fun m!654655 () Bool)

(assert (=> b!691788 m!654655))

(assert (=> b!691794 m!654645))

(declare-fun m!654657 () Bool)

(assert (=> b!691793 m!654657))

(declare-fun m!654659 () Bool)

(assert (=> b!691793 m!654659))

(declare-fun m!654661 () Bool)

(assert (=> start!61790 m!654661))

(assert (=> b!691786 m!654643))

(declare-fun m!654663 () Bool)

(assert (=> b!691799 m!654663))

(declare-fun m!654665 () Bool)

(assert (=> b!691791 m!654665))

(push 1)

