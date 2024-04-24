; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62596 () Bool)

(assert start!62596)

(declare-fun b!704975 () Bool)

(declare-fun res!468690 () Bool)

(declare-fun e!397874 () Bool)

(assert (=> b!704975 (=> (not res!468690) (not e!397874))))

(declare-datatypes ((List!13209 0))(
  ( (Nil!13206) (Cons!13205 (h!14253 (_ BitVec 64)) (t!19483 List!13209)) )
))
(declare-fun newAcc!49 () List!13209)

(declare-fun noDuplicate!1135 (List!13209) Bool)

(assert (=> b!704975 (= res!468690 (noDuplicate!1135 newAcc!49))))

(declare-fun b!704976 () Bool)

(declare-fun res!468688 () Bool)

(assert (=> b!704976 (=> (not res!468688) (not e!397874))))

(declare-fun acc!652 () List!13209)

(declare-fun subseq!329 (List!13209 List!13209) Bool)

(assert (=> b!704976 (= res!468688 (subseq!329 acc!652 newAcc!49))))

(declare-fun b!704977 () Bool)

(declare-fun res!468693 () Bool)

(assert (=> b!704977 (=> (not res!468693) (not e!397874))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!704977 (= res!468693 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704978 () Bool)

(declare-fun res!468702 () Bool)

(assert (=> b!704978 (=> (not res!468702) (not e!397874))))

(declare-datatypes ((array!40215 0))(
  ( (array!40216 (arr!19261 (Array (_ BitVec 32) (_ BitVec 64))) (size!19644 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40215)

(declare-fun arrayNoDuplicates!0 (array!40215 (_ BitVec 32) List!13209) Bool)

(assert (=> b!704978 (= res!468702 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704979 () Bool)

(declare-fun res!468703 () Bool)

(assert (=> b!704979 (=> (not res!468703) (not e!397874))))

(declare-fun contains!3861 (List!13209 (_ BitVec 64)) Bool)

(assert (=> b!704979 (= res!468703 (not (contains!3861 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704980 () Bool)

(declare-fun res!468698 () Bool)

(assert (=> b!704980 (=> (not res!468698) (not e!397874))))

(assert (=> b!704980 (= res!468698 (not (contains!3861 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704981 () Bool)

(assert (=> b!704981 (= e!397874 false)))

(declare-fun lt!317961 () Bool)

(assert (=> b!704981 (= lt!317961 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704982 () Bool)

(declare-fun res!468692 () Bool)

(assert (=> b!704982 (=> (not res!468692) (not e!397874))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704982 (= res!468692 (validKeyInArray!0 k0!2824))))

(declare-fun b!704983 () Bool)

(declare-fun res!468697 () Bool)

(assert (=> b!704983 (=> (not res!468697) (not e!397874))))

(assert (=> b!704983 (= res!468697 (contains!3861 newAcc!49 k0!2824))))

(declare-fun b!704984 () Bool)

(declare-fun res!468701 () Bool)

(assert (=> b!704984 (=> (not res!468701) (not e!397874))))

(assert (=> b!704984 (= res!468701 (not (contains!3861 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704985 () Bool)

(declare-fun res!468700 () Bool)

(assert (=> b!704985 (=> (not res!468700) (not e!397874))))

(assert (=> b!704985 (= res!468700 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19644 a!3591)))))

(declare-fun b!704986 () Bool)

(declare-fun res!468691 () Bool)

(assert (=> b!704986 (=> (not res!468691) (not e!397874))))

(assert (=> b!704986 (= res!468691 (noDuplicate!1135 acc!652))))

(declare-fun b!704988 () Bool)

(declare-fun res!468696 () Bool)

(assert (=> b!704988 (=> (not res!468696) (not e!397874))))

(declare-fun arrayContainsKey!0 (array!40215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704988 (= res!468696 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704989 () Bool)

(declare-fun res!468689 () Bool)

(assert (=> b!704989 (=> (not res!468689) (not e!397874))))

(assert (=> b!704989 (= res!468689 (not (contains!3861 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704990 () Bool)

(declare-fun res!468687 () Bool)

(assert (=> b!704990 (=> (not res!468687) (not e!397874))))

(declare-fun -!293 (List!13209 (_ BitVec 64)) List!13209)

(assert (=> b!704990 (= res!468687 (= (-!293 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704987 () Bool)

(declare-fun res!468686 () Bool)

(assert (=> b!704987 (=> (not res!468686) (not e!397874))))

(assert (=> b!704987 (= res!468686 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!468695 () Bool)

(assert (=> start!62596 (=> (not res!468695) (not e!397874))))

(assert (=> start!62596 (= res!468695 (and (bvslt (size!19644 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19644 a!3591))))))

(assert (=> start!62596 e!397874))

(assert (=> start!62596 true))

(declare-fun array_inv!15120 (array!40215) Bool)

(assert (=> start!62596 (array_inv!15120 a!3591)))

(declare-fun b!704991 () Bool)

(declare-fun res!468699 () Bool)

(assert (=> b!704991 (=> (not res!468699) (not e!397874))))

(assert (=> b!704991 (= res!468699 (not (validKeyInArray!0 (select (arr!19261 a!3591) from!2969))))))

(declare-fun b!704992 () Bool)

(declare-fun res!468694 () Bool)

(assert (=> b!704992 (=> (not res!468694) (not e!397874))))

(assert (=> b!704992 (= res!468694 (not (contains!3861 acc!652 k0!2824)))))

(assert (= (and start!62596 res!468695) b!704986))

(assert (= (and b!704986 res!468691) b!704975))

(assert (= (and b!704975 res!468690) b!704989))

(assert (= (and b!704989 res!468689) b!704979))

(assert (= (and b!704979 res!468703) b!704988))

(assert (= (and b!704988 res!468696) b!704992))

(assert (= (and b!704992 res!468694) b!704982))

(assert (= (and b!704982 res!468692) b!704978))

(assert (= (and b!704978 res!468702) b!704976))

(assert (= (and b!704976 res!468688) b!704983))

(assert (= (and b!704983 res!468697) b!704990))

(assert (= (and b!704990 res!468687) b!704984))

(assert (= (and b!704984 res!468701) b!704980))

(assert (= (and b!704980 res!468698) b!704985))

(assert (= (and b!704985 res!468700) b!704991))

(assert (= (and b!704991 res!468699) b!704977))

(assert (= (and b!704977 res!468693) b!704987))

(assert (= (and b!704987 res!468686) b!704981))

(declare-fun m!663819 () Bool)

(assert (=> start!62596 m!663819))

(declare-fun m!663821 () Bool)

(assert (=> b!704988 m!663821))

(declare-fun m!663823 () Bool)

(assert (=> b!704992 m!663823))

(declare-fun m!663825 () Bool)

(assert (=> b!704980 m!663825))

(declare-fun m!663827 () Bool)

(assert (=> b!704981 m!663827))

(declare-fun m!663829 () Bool)

(assert (=> b!704983 m!663829))

(declare-fun m!663831 () Bool)

(assert (=> b!704979 m!663831))

(declare-fun m!663833 () Bool)

(assert (=> b!704984 m!663833))

(declare-fun m!663835 () Bool)

(assert (=> b!704982 m!663835))

(declare-fun m!663837 () Bool)

(assert (=> b!704978 m!663837))

(declare-fun m!663839 () Bool)

(assert (=> b!704989 m!663839))

(declare-fun m!663841 () Bool)

(assert (=> b!704990 m!663841))

(declare-fun m!663843 () Bool)

(assert (=> b!704976 m!663843))

(declare-fun m!663845 () Bool)

(assert (=> b!704987 m!663845))

(declare-fun m!663847 () Bool)

(assert (=> b!704975 m!663847))

(declare-fun m!663849 () Bool)

(assert (=> b!704991 m!663849))

(assert (=> b!704991 m!663849))

(declare-fun m!663851 () Bool)

(assert (=> b!704991 m!663851))

(declare-fun m!663853 () Bool)

(assert (=> b!704986 m!663853))

(check-sat (not b!704976) (not b!704990) (not b!704978) (not b!704983) (not b!704980) (not b!704988) (not b!704982) (not b!704979) (not b!704991) (not b!704986) (not b!704981) (not b!704992) (not b!704989) (not b!704987) (not start!62596) (not b!704984) (not b!704975))
(check-sat)
