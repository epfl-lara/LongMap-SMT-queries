; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62510 () Bool)

(assert start!62510)

(declare-fun b!703972 () Bool)

(declare-fun res!467786 () Bool)

(declare-fun e!397669 () Bool)

(assert (=> b!703972 (=> (not res!467786) (not e!397669))))

(declare-datatypes ((array!40189 0))(
  ( (array!40190 (arr!19251 (Array (_ BitVec 32) (_ BitVec 64))) (size!19636 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40189)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703972 (= res!467786 (not (validKeyInArray!0 (select (arr!19251 a!3591) from!2969))))))

(declare-fun b!703973 () Bool)

(declare-fun res!467796 () Bool)

(assert (=> b!703973 (=> (not res!467796) (not e!397669))))

(declare-datatypes ((List!13292 0))(
  ( (Nil!13289) (Cons!13288 (h!14333 (_ BitVec 64)) (t!19574 List!13292)) )
))
(declare-fun newAcc!49 () List!13292)

(declare-fun contains!3869 (List!13292 (_ BitVec 64)) Bool)

(assert (=> b!703973 (= res!467796 (not (contains!3869 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703974 () Bool)

(declare-fun res!467792 () Bool)

(assert (=> b!703974 (=> (not res!467792) (not e!397669))))

(declare-fun acc!652 () List!13292)

(declare-fun noDuplicate!1116 (List!13292) Bool)

(assert (=> b!703974 (= res!467792 (noDuplicate!1116 acc!652))))

(declare-fun b!703975 () Bool)

(declare-fun res!467795 () Bool)

(assert (=> b!703975 (=> (not res!467795) (not e!397669))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!279 (List!13292 (_ BitVec 64)) List!13292)

(assert (=> b!703975 (= res!467795 (= (-!279 newAcc!49 k!2824) acc!652))))

(declare-fun b!703976 () Bool)

(declare-fun res!467788 () Bool)

(assert (=> b!703976 (=> (not res!467788) (not e!397669))))

(declare-fun arrayNoDuplicates!0 (array!40189 (_ BitVec 32) List!13292) Bool)

(assert (=> b!703976 (= res!467788 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703977 () Bool)

(declare-fun res!467789 () Bool)

(assert (=> b!703977 (=> (not res!467789) (not e!397669))))

(assert (=> b!703977 (= res!467789 (noDuplicate!1116 newAcc!49))))

(declare-fun b!703978 () Bool)

(declare-fun res!467782 () Bool)

(assert (=> b!703978 (=> (not res!467782) (not e!397669))))

(assert (=> b!703978 (= res!467782 (validKeyInArray!0 k!2824))))

(declare-fun b!703980 () Bool)

(assert (=> b!703980 (= e!397669 false)))

(declare-fun lt!317817 () Bool)

(assert (=> b!703980 (= lt!317817 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703981 () Bool)

(declare-fun res!467784 () Bool)

(assert (=> b!703981 (=> (not res!467784) (not e!397669))))

(assert (=> b!703981 (= res!467784 (not (contains!3869 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703982 () Bool)

(declare-fun res!467783 () Bool)

(assert (=> b!703982 (=> (not res!467783) (not e!397669))))

(declare-fun arrayContainsKey!0 (array!40189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703982 (= res!467783 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703983 () Bool)

(declare-fun res!467797 () Bool)

(assert (=> b!703983 (=> (not res!467797) (not e!397669))))

(assert (=> b!703983 (= res!467797 (contains!3869 newAcc!49 k!2824))))

(declare-fun b!703984 () Bool)

(declare-fun res!467799 () Bool)

(assert (=> b!703984 (=> (not res!467799) (not e!397669))))

(assert (=> b!703984 (= res!467799 (not (contains!3869 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703985 () Bool)

(declare-fun res!467787 () Bool)

(assert (=> b!703985 (=> (not res!467787) (not e!397669))))

(assert (=> b!703985 (= res!467787 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703986 () Bool)

(declare-fun res!467798 () Bool)

(assert (=> b!703986 (=> (not res!467798) (not e!397669))))

(declare-fun subseq!314 (List!13292 List!13292) Bool)

(assert (=> b!703986 (= res!467798 (subseq!314 acc!652 newAcc!49))))

(declare-fun b!703987 () Bool)

(declare-fun res!467791 () Bool)

(assert (=> b!703987 (=> (not res!467791) (not e!397669))))

(assert (=> b!703987 (= res!467791 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703988 () Bool)

(declare-fun res!467790 () Bool)

(assert (=> b!703988 (=> (not res!467790) (not e!397669))))

(assert (=> b!703988 (= res!467790 (not (contains!3869 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703989 () Bool)

(declare-fun res!467793 () Bool)

(assert (=> b!703989 (=> (not res!467793) (not e!397669))))

(assert (=> b!703989 (= res!467793 (not (contains!3869 acc!652 k!2824)))))

(declare-fun b!703979 () Bool)

(declare-fun res!467785 () Bool)

(assert (=> b!703979 (=> (not res!467785) (not e!397669))))

(assert (=> b!703979 (= res!467785 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19636 a!3591)))))

(declare-fun res!467794 () Bool)

(assert (=> start!62510 (=> (not res!467794) (not e!397669))))

(assert (=> start!62510 (= res!467794 (and (bvslt (size!19636 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19636 a!3591))))))

(assert (=> start!62510 e!397669))

(assert (=> start!62510 true))

(declare-fun array_inv!15047 (array!40189) Bool)

(assert (=> start!62510 (array_inv!15047 a!3591)))

(assert (= (and start!62510 res!467794) b!703974))

(assert (= (and b!703974 res!467792) b!703977))

(assert (= (and b!703977 res!467789) b!703984))

(assert (= (and b!703984 res!467799) b!703981))

(assert (= (and b!703981 res!467784) b!703982))

(assert (= (and b!703982 res!467783) b!703989))

(assert (= (and b!703989 res!467793) b!703978))

(assert (= (and b!703978 res!467782) b!703976))

(assert (= (and b!703976 res!467788) b!703986))

(assert (= (and b!703986 res!467798) b!703983))

(assert (= (and b!703983 res!467797) b!703975))

(assert (= (and b!703975 res!467795) b!703988))

(assert (= (and b!703988 res!467790) b!703973))

(assert (= (and b!703973 res!467796) b!703979))

(assert (= (and b!703979 res!467785) b!703972))

(assert (= (and b!703972 res!467786) b!703985))

(assert (= (and b!703985 res!467787) b!703987))

(assert (= (and b!703987 res!467791) b!703980))

(declare-fun m!662623 () Bool)

(assert (=> b!703989 m!662623))

(declare-fun m!662625 () Bool)

(assert (=> b!703986 m!662625))

(declare-fun m!662627 () Bool)

(assert (=> b!703984 m!662627))

(declare-fun m!662629 () Bool)

(assert (=> b!703976 m!662629))

(declare-fun m!662631 () Bool)

(assert (=> b!703978 m!662631))

(declare-fun m!662633 () Bool)

(assert (=> b!703987 m!662633))

(declare-fun m!662635 () Bool)

(assert (=> b!703981 m!662635))

(declare-fun m!662637 () Bool)

(assert (=> b!703975 m!662637))

(declare-fun m!662639 () Bool)

(assert (=> b!703977 m!662639))

(declare-fun m!662641 () Bool)

(assert (=> b!703972 m!662641))

(assert (=> b!703972 m!662641))

(declare-fun m!662643 () Bool)

(assert (=> b!703972 m!662643))

(declare-fun m!662645 () Bool)

(assert (=> start!62510 m!662645))

(declare-fun m!662647 () Bool)

(assert (=> b!703982 m!662647))

(declare-fun m!662649 () Bool)

(assert (=> b!703974 m!662649))

(declare-fun m!662651 () Bool)

(assert (=> b!703983 m!662651))

(declare-fun m!662653 () Bool)

(assert (=> b!703973 m!662653))

(declare-fun m!662655 () Bool)

(assert (=> b!703988 m!662655))

(declare-fun m!662657 () Bool)

(assert (=> b!703980 m!662657))

(push 1)

(assert (not b!703984))

(assert (not b!703983))

(assert (not b!703976))

(assert (not b!703974))

(assert (not b!703977))

(assert (not b!703972))

(assert (not b!703988))

(assert (not b!703987))

(assert (not b!703973))

(assert (not b!703989))

(assert (not b!703981))

(assert (not b!703975))

(assert (not b!703986))

(assert (not b!703980))

(assert (not start!62510))

(assert (not b!703982))

(assert (not b!703978))

(check-sat)

(pop 1)

