; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61788 () Bool)

(assert start!61788)

(declare-fun b!691742 () Bool)

(declare-fun res!456204 () Bool)

(declare-fun e!393534 () Bool)

(assert (=> b!691742 (=> (not res!456204) (not e!393534))))

(declare-datatypes ((array!39820 0))(
  ( (array!39821 (arr!19078 (Array (_ BitVec 32) (_ BitVec 64))) (size!19460 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39820)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691742 (= res!456204 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19460 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691743 () Bool)

(declare-fun res!456198 () Bool)

(assert (=> b!691743 (=> (not res!456198) (not e!393534))))

(declare-datatypes ((List!13158 0))(
  ( (Nil!13155) (Cons!13154 (h!14199 (_ BitVec 64)) (t!19416 List!13158)) )
))
(declare-fun arrayNoDuplicates!0 (array!39820 (_ BitVec 32) List!13158) Bool)

(assert (=> b!691743 (= res!456198 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13155))))

(declare-fun b!691744 () Bool)

(declare-datatypes ((Unit!24412 0))(
  ( (Unit!24413) )
))
(declare-fun e!393531 () Unit!24412)

(declare-fun Unit!24414 () Unit!24412)

(assert (=> b!691744 (= e!393531 Unit!24414)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691744 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316281 () Unit!24412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39820 (_ BitVec 64) (_ BitVec 32)) Unit!24412)

(assert (=> b!691744 (= lt!316281 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691744 false))

(declare-fun b!691745 () Bool)

(declare-fun res!456197 () Bool)

(assert (=> b!691745 (=> (not res!456197) (not e!393534))))

(declare-fun e!393533 () Bool)

(assert (=> b!691745 (= res!456197 e!393533)))

(declare-fun res!456200 () Bool)

(assert (=> b!691745 (=> res!456200 e!393533)))

(declare-fun e!393536 () Bool)

(assert (=> b!691745 (= res!456200 e!393536)))

(declare-fun res!456199 () Bool)

(assert (=> b!691745 (=> (not res!456199) (not e!393536))))

(assert (=> b!691745 (= res!456199 (bvsgt from!3004 i!1382))))

(declare-fun b!691746 () Bool)

(assert (=> b!691746 (= e!393534 false)))

(declare-fun lt!316280 () Unit!24412)

(assert (=> b!691746 (= lt!316280 e!393531)))

(declare-fun c!78141 () Bool)

(assert (=> b!691746 (= c!78141 (= (select (arr!19078 a!3626) from!3004) k!2843))))

(declare-fun b!691747 () Bool)

(declare-fun res!456195 () Bool)

(assert (=> b!691747 (=> (not res!456195) (not e!393534))))

(declare-fun acc!681 () List!13158)

(declare-fun contains!3680 (List!13158 (_ BitVec 64)) Bool)

(assert (=> b!691747 (= res!456195 (not (contains!3680 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691748 () Bool)

(declare-fun res!456205 () Bool)

(assert (=> b!691748 (=> (not res!456205) (not e!393534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691748 (= res!456205 (validKeyInArray!0 k!2843))))

(declare-fun b!691749 () Bool)

(declare-fun e!393535 () Bool)

(assert (=> b!691749 (= e!393533 e!393535)))

(declare-fun res!456202 () Bool)

(assert (=> b!691749 (=> (not res!456202) (not e!393535))))

(assert (=> b!691749 (= res!456202 (bvsle from!3004 i!1382))))

(declare-fun res!456201 () Bool)

(assert (=> start!61788 (=> (not res!456201) (not e!393534))))

(assert (=> start!61788 (= res!456201 (and (bvslt (size!19460 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19460 a!3626))))))

(assert (=> start!61788 e!393534))

(assert (=> start!61788 true))

(declare-fun array_inv!14961 (array!39820) Bool)

(assert (=> start!61788 (array_inv!14961 a!3626)))

(declare-fun b!691750 () Bool)

(assert (=> b!691750 (= e!393536 (contains!3680 acc!681 k!2843))))

(declare-fun b!691751 () Bool)

(declare-fun res!456194 () Bool)

(assert (=> b!691751 (=> (not res!456194) (not e!393534))))

(assert (=> b!691751 (= res!456194 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691752 () Bool)

(declare-fun Unit!24415 () Unit!24412)

(assert (=> b!691752 (= e!393531 Unit!24415)))

(declare-fun b!691753 () Bool)

(declare-fun res!456208 () Bool)

(assert (=> b!691753 (=> (not res!456208) (not e!393534))))

(assert (=> b!691753 (= res!456208 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691754 () Bool)

(assert (=> b!691754 (= e!393535 (not (contains!3680 acc!681 k!2843)))))

(declare-fun b!691755 () Bool)

(declare-fun res!456203 () Bool)

(assert (=> b!691755 (=> (not res!456203) (not e!393534))))

(declare-fun noDuplicate!949 (List!13158) Bool)

(assert (=> b!691755 (= res!456203 (noDuplicate!949 acc!681))))

(declare-fun b!691756 () Bool)

(declare-fun res!456196 () Bool)

(assert (=> b!691756 (=> (not res!456196) (not e!393534))))

(assert (=> b!691756 (= res!456196 (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!691757 () Bool)

(declare-fun res!456207 () Bool)

(assert (=> b!691757 (=> (not res!456207) (not e!393534))))

(assert (=> b!691757 (= res!456207 (not (contains!3680 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691758 () Bool)

(declare-fun res!456206 () Bool)

(assert (=> b!691758 (=> (not res!456206) (not e!393534))))

(assert (=> b!691758 (= res!456206 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19460 a!3626))))))

(assert (= (and start!61788 res!456201) b!691755))

(assert (= (and b!691755 res!456203) b!691747))

(assert (= (and b!691747 res!456195) b!691757))

(assert (= (and b!691757 res!456207) b!691745))

(assert (= (and b!691745 res!456199) b!691750))

(assert (= (and b!691745 (not res!456200)) b!691749))

(assert (= (and b!691749 res!456202) b!691754))

(assert (= (and b!691745 res!456197) b!691743))

(assert (= (and b!691743 res!456198) b!691751))

(assert (= (and b!691751 res!456194) b!691758))

(assert (= (and b!691758 res!456206) b!691748))

(assert (= (and b!691748 res!456205) b!691753))

(assert (= (and b!691753 res!456208) b!691742))

(assert (= (and b!691742 res!456204) b!691756))

(assert (= (and b!691756 res!456196) b!691746))

(assert (= (and b!691746 c!78141) b!691744))

(assert (= (and b!691746 (not c!78141)) b!691752))

(declare-fun m!653989 () Bool)

(assert (=> b!691755 m!653989))

(declare-fun m!653991 () Bool)

(assert (=> b!691746 m!653991))

(declare-fun m!653993 () Bool)

(assert (=> b!691743 m!653993))

(declare-fun m!653995 () Bool)

(assert (=> b!691750 m!653995))

(declare-fun m!653997 () Bool)

(assert (=> b!691753 m!653997))

(assert (=> b!691754 m!653995))

(declare-fun m!653999 () Bool)

(assert (=> start!61788 m!653999))

(declare-fun m!654001 () Bool)

(assert (=> b!691744 m!654001))

(declare-fun m!654003 () Bool)

(assert (=> b!691744 m!654003))

(declare-fun m!654005 () Bool)

(assert (=> b!691747 m!654005))

(declare-fun m!654007 () Bool)

(assert (=> b!691748 m!654007))

(declare-fun m!654009 () Bool)

(assert (=> b!691751 m!654009))

(declare-fun m!654011 () Bool)

(assert (=> b!691757 m!654011))

(assert (=> b!691756 m!653991))

(assert (=> b!691756 m!653991))

(declare-fun m!654013 () Bool)

(assert (=> b!691756 m!654013))

(push 1)

(assert (not b!691748))

(assert (not b!691755))

(assert (not b!691750))

(assert (not b!691744))

(assert (not b!691757))

(assert (not b!691743))

(assert (not start!61788))

(assert (not b!691747))

(assert (not b!691756))

(assert (not b!691754))

(assert (not b!691751))

(assert (not b!691753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

