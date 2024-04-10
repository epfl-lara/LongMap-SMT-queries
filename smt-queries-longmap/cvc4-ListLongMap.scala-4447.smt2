; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61788 () Bool)

(assert start!61788)

(declare-fun b!691732 () Bool)

(declare-fun res!456062 () Bool)

(declare-fun e!393613 () Bool)

(assert (=> b!691732 (=> (not res!456062) (not e!393613))))

(declare-datatypes ((List!13114 0))(
  ( (Nil!13111) (Cons!13110 (h!14155 (_ BitVec 64)) (t!19381 List!13114)) )
))
(declare-fun acc!681 () List!13114)

(declare-fun contains!3691 (List!13114 (_ BitVec 64)) Bool)

(assert (=> b!691732 (= res!456062 (not (contains!3691 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691733 () Bool)

(declare-fun res!456073 () Bool)

(assert (=> b!691733 (=> (not res!456073) (not e!393613))))

(declare-datatypes ((array!39809 0))(
  ( (array!39810 (arr!19073 (Array (_ BitVec 32) (_ BitVec 64))) (size!19458 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39809)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691733 (= res!456073 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691734 () Bool)

(declare-fun e!393616 () Bool)

(assert (=> b!691734 (= e!393616 (contains!3691 acc!681 k!2843))))

(declare-fun b!691735 () Bool)

(declare-datatypes ((Unit!24410 0))(
  ( (Unit!24411) )
))
(declare-fun e!393617 () Unit!24410)

(declare-fun Unit!24412 () Unit!24410)

(assert (=> b!691735 (= e!393617 Unit!24412)))

(declare-fun b!691736 () Bool)

(declare-fun res!456061 () Bool)

(assert (=> b!691736 (=> (not res!456061) (not e!393613))))

(declare-fun arrayNoDuplicates!0 (array!39809 (_ BitVec 32) List!13114) Bool)

(assert (=> b!691736 (= res!456061 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13111))))

(declare-fun b!691738 () Bool)

(declare-fun res!456070 () Bool)

(assert (=> b!691738 (=> (not res!456070) (not e!393613))))

(assert (=> b!691738 (= res!456070 (not (contains!3691 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691739 () Bool)

(declare-fun Unit!24413 () Unit!24410)

(assert (=> b!691739 (= e!393617 Unit!24413)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!691739 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316501 () Unit!24410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39809 (_ BitVec 64) (_ BitVec 32)) Unit!24410)

(assert (=> b!691739 (= lt!316501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691739 false))

(declare-fun b!691740 () Bool)

(declare-fun res!456068 () Bool)

(assert (=> b!691740 (=> (not res!456068) (not e!393613))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691740 (= res!456068 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19458 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691741 () Bool)

(declare-fun res!456069 () Bool)

(assert (=> b!691741 (=> (not res!456069) (not e!393613))))

(declare-fun noDuplicate!938 (List!13114) Bool)

(assert (=> b!691741 (= res!456069 (noDuplicate!938 acc!681))))

(declare-fun b!691742 () Bool)

(declare-fun e!393614 () Bool)

(declare-fun e!393615 () Bool)

(assert (=> b!691742 (= e!393614 e!393615)))

(declare-fun res!456074 () Bool)

(assert (=> b!691742 (=> (not res!456074) (not e!393615))))

(assert (=> b!691742 (= res!456074 (bvsle from!3004 i!1382))))

(declare-fun b!691743 () Bool)

(declare-fun res!456065 () Bool)

(assert (=> b!691743 (=> (not res!456065) (not e!393613))))

(assert (=> b!691743 (= res!456065 e!393614)))

(declare-fun res!456071 () Bool)

(assert (=> b!691743 (=> res!456071 e!393614)))

(assert (=> b!691743 (= res!456071 e!393616)))

(declare-fun res!456060 () Bool)

(assert (=> b!691743 (=> (not res!456060) (not e!393616))))

(assert (=> b!691743 (= res!456060 (bvsgt from!3004 i!1382))))

(declare-fun res!456063 () Bool)

(assert (=> start!61788 (=> (not res!456063) (not e!393613))))

(assert (=> start!61788 (= res!456063 (and (bvslt (size!19458 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19458 a!3626))))))

(assert (=> start!61788 e!393613))

(assert (=> start!61788 true))

(declare-fun array_inv!14869 (array!39809) Bool)

(assert (=> start!61788 (array_inv!14869 a!3626)))

(declare-fun b!691737 () Bool)

(assert (=> b!691737 (= e!393613 false)))

(declare-fun lt!316500 () Unit!24410)

(assert (=> b!691737 (= lt!316500 e!393617)))

(declare-fun c!78203 () Bool)

(assert (=> b!691737 (= c!78203 (= (select (arr!19073 a!3626) from!3004) k!2843))))

(declare-fun b!691744 () Bool)

(declare-fun res!456067 () Bool)

(assert (=> b!691744 (=> (not res!456067) (not e!393613))))

(assert (=> b!691744 (= res!456067 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691745 () Bool)

(assert (=> b!691745 (= e!393615 (not (contains!3691 acc!681 k!2843)))))

(declare-fun b!691746 () Bool)

(declare-fun res!456072 () Bool)

(assert (=> b!691746 (=> (not res!456072) (not e!393613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691746 (= res!456072 (validKeyInArray!0 (select (arr!19073 a!3626) from!3004)))))

(declare-fun b!691747 () Bool)

(declare-fun res!456064 () Bool)

(assert (=> b!691747 (=> (not res!456064) (not e!393613))))

(assert (=> b!691747 (= res!456064 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19458 a!3626))))))

(declare-fun b!691748 () Bool)

(declare-fun res!456066 () Bool)

(assert (=> b!691748 (=> (not res!456066) (not e!393613))))

(assert (=> b!691748 (= res!456066 (validKeyInArray!0 k!2843))))

(assert (= (and start!61788 res!456063) b!691741))

(assert (= (and b!691741 res!456069) b!691738))

(assert (= (and b!691738 res!456070) b!691732))

(assert (= (and b!691732 res!456062) b!691743))

(assert (= (and b!691743 res!456060) b!691734))

(assert (= (and b!691743 (not res!456071)) b!691742))

(assert (= (and b!691742 res!456074) b!691745))

(assert (= (and b!691743 res!456065) b!691736))

(assert (= (and b!691736 res!456061) b!691744))

(assert (= (and b!691744 res!456067) b!691747))

(assert (= (and b!691747 res!456064) b!691748))

(assert (= (and b!691748 res!456066) b!691733))

(assert (= (and b!691733 res!456073) b!691740))

(assert (= (and b!691740 res!456068) b!691746))

(assert (= (and b!691746 res!456072) b!691737))

(assert (= (and b!691737 c!78203) b!691739))

(assert (= (and b!691737 (not c!78203)) b!691735))

(declare-fun m!654615 () Bool)

(assert (=> b!691745 m!654615))

(declare-fun m!654617 () Bool)

(assert (=> b!691733 m!654617))

(declare-fun m!654619 () Bool)

(assert (=> b!691741 m!654619))

(declare-fun m!654621 () Bool)

(assert (=> b!691748 m!654621))

(declare-fun m!654623 () Bool)

(assert (=> b!691746 m!654623))

(assert (=> b!691746 m!654623))

(declare-fun m!654625 () Bool)

(assert (=> b!691746 m!654625))

(declare-fun m!654627 () Bool)

(assert (=> b!691736 m!654627))

(declare-fun m!654629 () Bool)

(assert (=> start!61788 m!654629))

(declare-fun m!654631 () Bool)

(assert (=> b!691744 m!654631))

(assert (=> b!691737 m!654623))

(declare-fun m!654633 () Bool)

(assert (=> b!691732 m!654633))

(assert (=> b!691734 m!654615))

(declare-fun m!654635 () Bool)

(assert (=> b!691738 m!654635))

(declare-fun m!654637 () Bool)

(assert (=> b!691739 m!654637))

(declare-fun m!654639 () Bool)

(assert (=> b!691739 m!654639))

(push 1)

(assert (not b!691732))

(assert (not b!691744))

(assert (not b!691741))

(assert (not b!691733))

(assert (not b!691734))

(assert (not b!691748))

(assert (not b!691739))

(assert (not b!691746))

(assert (not b!691738))

(assert (not b!691736))

(assert (not b!691745))

(assert (not start!61788))

(check-sat)

(pop 1)

