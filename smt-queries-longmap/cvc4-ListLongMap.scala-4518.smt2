; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62580 () Bool)

(assert start!62580)

(declare-fun b!705888 () Bool)

(declare-fun res!469714 () Bool)

(declare-fun e!397879 () Bool)

(assert (=> b!705888 (=> (not res!469714) (not e!397879))))

(declare-datatypes ((List!13327 0))(
  ( (Nil!13324) (Cons!13323 (h!14368 (_ BitVec 64)) (t!19609 List!13327)) )
))
(declare-fun newAcc!49 () List!13327)

(declare-fun contains!3904 (List!13327 (_ BitVec 64)) Bool)

(assert (=> b!705888 (= res!469714 (not (contains!3904 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705889 () Bool)

(declare-fun res!469716 () Bool)

(assert (=> b!705889 (=> (not res!469716) (not e!397879))))

(declare-datatypes ((array!40259 0))(
  ( (array!40260 (arr!19286 (Array (_ BitVec 32) (_ BitVec 64))) (size!19671 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40259)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13327)

(declare-fun arrayNoDuplicates!0 (array!40259 (_ BitVec 32) List!13327) Bool)

(assert (=> b!705889 (= res!469716 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705890 () Bool)

(assert (=> b!705890 (= e!397879 (not true))))

(assert (=> b!705890 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun k!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24622 0))(
  ( (Unit!24623) )
))
(declare-fun lt!317922 () Unit!24622)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40259 (_ BitVec 64) (_ BitVec 32) List!13327 List!13327) Unit!24622)

(assert (=> b!705890 (= lt!317922 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705891 () Bool)

(declare-fun res!469709 () Bool)

(assert (=> b!705891 (=> (not res!469709) (not e!397879))))

(declare-fun subseq!349 (List!13327 List!13327) Bool)

(assert (=> b!705891 (= res!469709 (subseq!349 acc!652 newAcc!49))))

(declare-fun b!705892 () Bool)

(declare-fun res!469715 () Bool)

(assert (=> b!705892 (=> (not res!469715) (not e!397879))))

(assert (=> b!705892 (= res!469715 (not (contains!3904 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705894 () Bool)

(declare-fun res!469700 () Bool)

(assert (=> b!705894 (=> (not res!469700) (not e!397879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705894 (= res!469700 (not (validKeyInArray!0 (select (arr!19286 a!3591) from!2969))))))

(declare-fun b!705895 () Bool)

(declare-fun res!469707 () Bool)

(assert (=> b!705895 (=> (not res!469707) (not e!397879))))

(assert (=> b!705895 (= res!469707 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19671 a!3591)))))

(declare-fun b!705896 () Bool)

(declare-fun res!469706 () Bool)

(assert (=> b!705896 (=> (not res!469706) (not e!397879))))

(declare-fun arrayContainsKey!0 (array!40259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705896 (= res!469706 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705897 () Bool)

(declare-fun res!469703 () Bool)

(assert (=> b!705897 (=> (not res!469703) (not e!397879))))

(declare-fun noDuplicate!1151 (List!13327) Bool)

(assert (=> b!705897 (= res!469703 (noDuplicate!1151 acc!652))))

(declare-fun b!705898 () Bool)

(declare-fun res!469712 () Bool)

(assert (=> b!705898 (=> (not res!469712) (not e!397879))))

(declare-fun -!314 (List!13327 (_ BitVec 64)) List!13327)

(assert (=> b!705898 (= res!469712 (= (-!314 newAcc!49 k!2824) acc!652))))

(declare-fun b!705899 () Bool)

(declare-fun res!469705 () Bool)

(assert (=> b!705899 (=> (not res!469705) (not e!397879))))

(assert (=> b!705899 (= res!469705 (not (contains!3904 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705900 () Bool)

(declare-fun res!469704 () Bool)

(assert (=> b!705900 (=> (not res!469704) (not e!397879))))

(assert (=> b!705900 (= res!469704 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705901 () Bool)

(declare-fun res!469701 () Bool)

(assert (=> b!705901 (=> (not res!469701) (not e!397879))))

(assert (=> b!705901 (= res!469701 (noDuplicate!1151 newAcc!49))))

(declare-fun b!705902 () Bool)

(declare-fun res!469713 () Bool)

(assert (=> b!705902 (=> (not res!469713) (not e!397879))))

(assert (=> b!705902 (= res!469713 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705903 () Bool)

(declare-fun res!469702 () Bool)

(assert (=> b!705903 (=> (not res!469702) (not e!397879))))

(assert (=> b!705903 (= res!469702 (not (contains!3904 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705904 () Bool)

(declare-fun res!469708 () Bool)

(assert (=> b!705904 (=> (not res!469708) (not e!397879))))

(assert (=> b!705904 (= res!469708 (not (contains!3904 acc!652 k!2824)))))

(declare-fun b!705905 () Bool)

(declare-fun res!469699 () Bool)

(assert (=> b!705905 (=> (not res!469699) (not e!397879))))

(assert (=> b!705905 (= res!469699 (contains!3904 newAcc!49 k!2824))))

(declare-fun b!705906 () Bool)

(declare-fun res!469711 () Bool)

(assert (=> b!705906 (=> (not res!469711) (not e!397879))))

(assert (=> b!705906 (= res!469711 (validKeyInArray!0 k!2824))))

(declare-fun res!469710 () Bool)

(assert (=> start!62580 (=> (not res!469710) (not e!397879))))

(assert (=> start!62580 (= res!469710 (and (bvslt (size!19671 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19671 a!3591))))))

(assert (=> start!62580 e!397879))

(assert (=> start!62580 true))

(declare-fun array_inv!15082 (array!40259) Bool)

(assert (=> start!62580 (array_inv!15082 a!3591)))

(declare-fun b!705893 () Bool)

(declare-fun res!469698 () Bool)

(assert (=> b!705893 (=> (not res!469698) (not e!397879))))

(assert (=> b!705893 (= res!469698 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62580 res!469710) b!705897))

(assert (= (and b!705897 res!469703) b!705901))

(assert (= (and b!705901 res!469701) b!705892))

(assert (= (and b!705892 res!469715) b!705903))

(assert (= (and b!705903 res!469702) b!705902))

(assert (= (and b!705902 res!469713) b!705904))

(assert (= (and b!705904 res!469708) b!705906))

(assert (= (and b!705906 res!469711) b!705893))

(assert (= (and b!705893 res!469698) b!705891))

(assert (= (and b!705891 res!469709) b!705905))

(assert (= (and b!705905 res!469699) b!705898))

(assert (= (and b!705898 res!469712) b!705888))

(assert (= (and b!705888 res!469714) b!705899))

(assert (= (and b!705899 res!469705) b!705895))

(assert (= (and b!705895 res!469707) b!705894))

(assert (= (and b!705894 res!469700) b!705900))

(assert (= (and b!705900 res!469704) b!705896))

(assert (= (and b!705896 res!469706) b!705889))

(assert (= (and b!705889 res!469716) b!705890))

(declare-fun m!663915 () Bool)

(assert (=> b!705896 m!663915))

(declare-fun m!663917 () Bool)

(assert (=> b!705904 m!663917))

(declare-fun m!663919 () Bool)

(assert (=> b!705901 m!663919))

(declare-fun m!663921 () Bool)

(assert (=> b!705890 m!663921))

(declare-fun m!663923 () Bool)

(assert (=> b!705890 m!663923))

(declare-fun m!663925 () Bool)

(assert (=> b!705899 m!663925))

(declare-fun m!663927 () Bool)

(assert (=> b!705893 m!663927))

(declare-fun m!663929 () Bool)

(assert (=> b!705888 m!663929))

(declare-fun m!663931 () Bool)

(assert (=> b!705905 m!663931))

(declare-fun m!663933 () Bool)

(assert (=> b!705891 m!663933))

(declare-fun m!663935 () Bool)

(assert (=> b!705889 m!663935))

(declare-fun m!663937 () Bool)

(assert (=> b!705897 m!663937))

(declare-fun m!663939 () Bool)

(assert (=> b!705902 m!663939))

(declare-fun m!663941 () Bool)

(assert (=> start!62580 m!663941))

(declare-fun m!663943 () Bool)

(assert (=> b!705894 m!663943))

(assert (=> b!705894 m!663943))

(declare-fun m!663945 () Bool)

(assert (=> b!705894 m!663945))

(declare-fun m!663947 () Bool)

(assert (=> b!705892 m!663947))

(declare-fun m!663949 () Bool)

(assert (=> b!705903 m!663949))

(declare-fun m!663951 () Bool)

(assert (=> b!705906 m!663951))

(declare-fun m!663953 () Bool)

(assert (=> b!705898 m!663953))

(push 1)

(assert (not b!705896))

(assert (not b!705902))

(assert (not b!705894))

(assert (not b!705891))

(assert (not b!705905))

(assert (not b!705897))

(assert (not b!705906))

(assert (not b!705899))

(assert (not b!705898))

(assert (not start!62580))

(assert (not b!705890))

(assert (not b!705904))

(assert (not b!705888))

(assert (not b!705892))

(assert (not b!705903))

(assert (not b!705889))

(assert (not b!705893))

(assert (not b!705901))

