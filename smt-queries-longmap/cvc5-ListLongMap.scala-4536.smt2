; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62962 () Bool)

(assert start!62962)

(declare-fun b!709660 () Bool)

(declare-fun res!473170 () Bool)

(declare-fun e!399409 () Bool)

(assert (=> b!709660 (=> (not res!473170) (not e!399409))))

(declare-datatypes ((array!40378 0))(
  ( (array!40379 (arr!19338 (Array (_ BitVec 32) (_ BitVec 64))) (size!19734 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40378)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709660 (= res!473170 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709661 () Bool)

(declare-fun res!473165 () Bool)

(declare-fun e!399410 () Bool)

(assert (=> b!709661 (=> (not res!473165) (not e!399410))))

(declare-datatypes ((List!13379 0))(
  ( (Nil!13376) (Cons!13375 (h!14420 (_ BitVec 64)) (t!19676 List!13379)) )
))
(declare-fun acc!652 () List!13379)

(declare-fun newAcc!49 () List!13379)

(declare-fun subseq!401 (List!13379 List!13379) Bool)

(assert (=> b!709661 (= res!473165 (subseq!401 acc!652 newAcc!49))))

(declare-fun b!709662 () Bool)

(declare-fun res!473163 () Bool)

(assert (=> b!709662 (=> (not res!473163) (not e!399410))))

(assert (=> b!709662 (= res!473163 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!709663 () Bool)

(declare-fun res!473168 () Bool)

(assert (=> b!709663 (=> (not res!473168) (not e!399410))))

(declare-fun arrayNoDuplicates!0 (array!40378 (_ BitVec 32) List!13379) Bool)

(assert (=> b!709663 (= res!473168 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709664 () Bool)

(declare-fun res!473157 () Bool)

(assert (=> b!709664 (=> (not res!473157) (not e!399409))))

(declare-fun noDuplicate!1203 (List!13379) Bool)

(declare-fun $colon$colon!512 (List!13379 (_ BitVec 64)) List!13379)

(assert (=> b!709664 (= res!473157 (noDuplicate!1203 ($colon$colon!512 newAcc!49 (select (arr!19338 a!3591) from!2969))))))

(declare-fun b!709665 () Bool)

(declare-fun res!473173 () Bool)

(assert (=> b!709665 (=> (not res!473173) (not e!399410))))

(declare-fun contains!3956 (List!13379 (_ BitVec 64)) Bool)

(assert (=> b!709665 (= res!473173 (contains!3956 newAcc!49 k!2824))))

(declare-fun b!709666 () Bool)

(declare-fun res!473172 () Bool)

(assert (=> b!709666 (=> (not res!473172) (not e!399410))))

(assert (=> b!709666 (= res!473172 (noDuplicate!1203 newAcc!49))))

(declare-fun b!709667 () Bool)

(declare-fun res!473154 () Bool)

(assert (=> b!709667 (=> (not res!473154) (not e!399409))))

(declare-fun lt!318254 () List!13379)

(assert (=> b!709667 (= res!473154 (noDuplicate!1203 lt!318254))))

(declare-fun res!473160 () Bool)

(assert (=> start!62962 (=> (not res!473160) (not e!399410))))

(assert (=> start!62962 (= res!473160 (and (bvslt (size!19734 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19734 a!3591))))))

(assert (=> start!62962 e!399410))

(assert (=> start!62962 true))

(declare-fun array_inv!15134 (array!40378) Bool)

(assert (=> start!62962 (array_inv!15134 a!3591)))

(declare-fun b!709668 () Bool)

(declare-fun res!473169 () Bool)

(assert (=> b!709668 (=> (not res!473169) (not e!399410))))

(assert (=> b!709668 (= res!473169 (not (contains!3956 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709669 () Bool)

(declare-fun res!473153 () Bool)

(assert (=> b!709669 (=> (not res!473153) (not e!399410))))

(assert (=> b!709669 (= res!473153 (not (contains!3956 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709670 () Bool)

(declare-fun res!473152 () Bool)

(assert (=> b!709670 (=> (not res!473152) (not e!399409))))

(assert (=> b!709670 (= res!473152 (not (contains!3956 lt!318254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709671 () Bool)

(declare-fun res!473162 () Bool)

(assert (=> b!709671 (=> (not res!473162) (not e!399410))))

(assert (=> b!709671 (= res!473162 (not (contains!3956 acc!652 k!2824)))))

(declare-fun b!709672 () Bool)

(declare-fun res!473155 () Bool)

(assert (=> b!709672 (=> (not res!473155) (not e!399410))))

(assert (=> b!709672 (= res!473155 (noDuplicate!1203 acc!652))))

(declare-fun b!709673 () Bool)

(declare-fun res!473161 () Bool)

(assert (=> b!709673 (=> (not res!473161) (not e!399410))))

(assert (=> b!709673 (= res!473161 (not (contains!3956 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709674 () Bool)

(assert (=> b!709674 (= e!399410 e!399409)))

(declare-fun res!473164 () Bool)

(assert (=> b!709674 (=> (not res!473164) (not e!399409))))

(assert (=> b!709674 (= res!473164 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!709674 (= lt!318254 ($colon$colon!512 acc!652 (select (arr!19338 a!3591) from!2969)))))

(declare-fun b!709675 () Bool)

(declare-fun res!473156 () Bool)

(assert (=> b!709675 (=> (not res!473156) (not e!399410))))

(assert (=> b!709675 (= res!473156 (not (contains!3956 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709676 () Bool)

(declare-fun res!473171 () Bool)

(assert (=> b!709676 (=> (not res!473171) (not e!399410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709676 (= res!473171 (validKeyInArray!0 (select (arr!19338 a!3591) from!2969)))))

(declare-fun b!709677 () Bool)

(declare-fun res!473159 () Bool)

(assert (=> b!709677 (=> (not res!473159) (not e!399410))))

(assert (=> b!709677 (= res!473159 (validKeyInArray!0 k!2824))))

(declare-fun b!709678 () Bool)

(assert (=> b!709678 (= e!399409 false)))

(declare-fun lt!318253 () Bool)

(assert (=> b!709678 (= lt!318253 (contains!3956 lt!318254 k!2824))))

(declare-fun b!709679 () Bool)

(declare-fun res!473158 () Bool)

(assert (=> b!709679 (=> (not res!473158) (not e!399410))))

(assert (=> b!709679 (= res!473158 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19734 a!3591)))))

(declare-fun b!709680 () Bool)

(declare-fun res!473167 () Bool)

(assert (=> b!709680 (=> (not res!473167) (not e!399410))))

(declare-fun -!366 (List!13379 (_ BitVec 64)) List!13379)

(assert (=> b!709680 (= res!473167 (= (-!366 newAcc!49 k!2824) acc!652))))

(declare-fun b!709681 () Bool)

(declare-fun res!473166 () Bool)

(assert (=> b!709681 (=> (not res!473166) (not e!399409))))

(assert (=> b!709681 (= res!473166 (not (contains!3956 lt!318254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62962 res!473160) b!709672))

(assert (= (and b!709672 res!473155) b!709666))

(assert (= (and b!709666 res!473172) b!709669))

(assert (= (and b!709669 res!473153) b!709668))

(assert (= (and b!709668 res!473169) b!709662))

(assert (= (and b!709662 res!473163) b!709671))

(assert (= (and b!709671 res!473162) b!709677))

(assert (= (and b!709677 res!473159) b!709663))

(assert (= (and b!709663 res!473168) b!709661))

(assert (= (and b!709661 res!473165) b!709665))

(assert (= (and b!709665 res!473173) b!709680))

(assert (= (and b!709680 res!473167) b!709675))

(assert (= (and b!709675 res!473156) b!709673))

(assert (= (and b!709673 res!473161) b!709679))

(assert (= (and b!709679 res!473158) b!709676))

(assert (= (and b!709676 res!473171) b!709674))

(assert (= (and b!709674 res!473164) b!709667))

(assert (= (and b!709667 res!473154) b!709664))

(assert (= (and b!709664 res!473157) b!709670))

(assert (= (and b!709670 res!473152) b!709681))

(assert (= (and b!709681 res!473166) b!709660))

(assert (= (and b!709660 res!473170) b!709678))

(declare-fun m!666931 () Bool)

(assert (=> b!709664 m!666931))

(assert (=> b!709664 m!666931))

(declare-fun m!666933 () Bool)

(assert (=> b!709664 m!666933))

(assert (=> b!709664 m!666933))

(declare-fun m!666935 () Bool)

(assert (=> b!709664 m!666935))

(declare-fun m!666937 () Bool)

(assert (=> b!709671 m!666937))

(assert (=> b!709676 m!666931))

(assert (=> b!709676 m!666931))

(declare-fun m!666939 () Bool)

(assert (=> b!709676 m!666939))

(declare-fun m!666941 () Bool)

(assert (=> b!709677 m!666941))

(declare-fun m!666943 () Bool)

(assert (=> b!709681 m!666943))

(declare-fun m!666945 () Bool)

(assert (=> b!709662 m!666945))

(declare-fun m!666947 () Bool)

(assert (=> start!62962 m!666947))

(declare-fun m!666949 () Bool)

(assert (=> b!709665 m!666949))

(declare-fun m!666951 () Bool)

(assert (=> b!709666 m!666951))

(declare-fun m!666953 () Bool)

(assert (=> b!709669 m!666953))

(declare-fun m!666955 () Bool)

(assert (=> b!709663 m!666955))

(declare-fun m!666957 () Bool)

(assert (=> b!709660 m!666957))

(declare-fun m!666959 () Bool)

(assert (=> b!709672 m!666959))

(declare-fun m!666961 () Bool)

(assert (=> b!709678 m!666961))

(declare-fun m!666963 () Bool)

(assert (=> b!709680 m!666963))

(declare-fun m!666965 () Bool)

(assert (=> b!709667 m!666965))

(declare-fun m!666967 () Bool)

(assert (=> b!709675 m!666967))

(declare-fun m!666969 () Bool)

(assert (=> b!709661 m!666969))

(assert (=> b!709674 m!666931))

(assert (=> b!709674 m!666931))

(declare-fun m!666971 () Bool)

(assert (=> b!709674 m!666971))

(declare-fun m!666973 () Bool)

(assert (=> b!709673 m!666973))

(declare-fun m!666975 () Bool)

(assert (=> b!709668 m!666975))

(declare-fun m!666977 () Bool)

(assert (=> b!709670 m!666977))

(push 1)

