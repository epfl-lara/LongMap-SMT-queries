; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62586 () Bool)

(assert start!62586)

(declare-fun b!706059 () Bool)

(declare-fun res!469880 () Bool)

(declare-fun e!397897 () Bool)

(assert (=> b!706059 (=> (not res!469880) (not e!397897))))

(declare-datatypes ((List!13330 0))(
  ( (Nil!13327) (Cons!13326 (h!14371 (_ BitVec 64)) (t!19612 List!13330)) )
))
(declare-fun acc!652 () List!13330)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3907 (List!13330 (_ BitVec 64)) Bool)

(assert (=> b!706059 (= res!469880 (not (contains!3907 acc!652 k!2824)))))

(declare-fun b!706060 () Bool)

(declare-fun res!469886 () Bool)

(assert (=> b!706060 (=> (not res!469886) (not e!397897))))

(assert (=> b!706060 (= res!469886 (not (contains!3907 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706061 () Bool)

(declare-fun res!469884 () Bool)

(assert (=> b!706061 (=> (not res!469884) (not e!397897))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40265 0))(
  ( (array!40266 (arr!19289 (Array (_ BitVec 32) (_ BitVec 64))) (size!19674 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40265)

(assert (=> b!706061 (= res!469884 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19674 a!3591)))))

(declare-fun b!706062 () Bool)

(declare-fun res!469871 () Bool)

(assert (=> b!706062 (=> (not res!469871) (not e!397897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706062 (= res!469871 (not (validKeyInArray!0 (select (arr!19289 a!3591) from!2969))))))

(declare-fun b!706063 () Bool)

(declare-fun res!469881 () Bool)

(assert (=> b!706063 (=> (not res!469881) (not e!397897))))

(declare-fun newAcc!49 () List!13330)

(declare-fun -!317 (List!13330 (_ BitVec 64)) List!13330)

(assert (=> b!706063 (= res!469881 (= (-!317 newAcc!49 k!2824) acc!652))))

(declare-fun b!706064 () Bool)

(declare-fun res!469874 () Bool)

(assert (=> b!706064 (=> (not res!469874) (not e!397897))))

(assert (=> b!706064 (= res!469874 (not (contains!3907 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706065 () Bool)

(declare-fun res!469876 () Bool)

(assert (=> b!706065 (=> (not res!469876) (not e!397897))))

(declare-fun noDuplicate!1154 (List!13330) Bool)

(assert (=> b!706065 (= res!469876 (noDuplicate!1154 newAcc!49))))

(declare-fun b!706066 () Bool)

(declare-fun res!469879 () Bool)

(assert (=> b!706066 (=> (not res!469879) (not e!397897))))

(declare-fun arrayNoDuplicates!0 (array!40265 (_ BitVec 32) List!13330) Bool)

(assert (=> b!706066 (= res!469879 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!706067 () Bool)

(assert (=> b!706067 (= e!397897 (not true))))

(assert (=> b!706067 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24628 0))(
  ( (Unit!24629) )
))
(declare-fun lt!317931 () Unit!24628)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40265 (_ BitVec 64) (_ BitVec 32) List!13330 List!13330) Unit!24628)

(assert (=> b!706067 (= lt!317931 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!706068 () Bool)

(declare-fun res!469882 () Bool)

(assert (=> b!706068 (=> (not res!469882) (not e!397897))))

(assert (=> b!706068 (= res!469882 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!469878 () Bool)

(assert (=> start!62586 (=> (not res!469878) (not e!397897))))

(assert (=> start!62586 (= res!469878 (and (bvslt (size!19674 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19674 a!3591))))))

(assert (=> start!62586 e!397897))

(assert (=> start!62586 true))

(declare-fun array_inv!15085 (array!40265) Bool)

(assert (=> start!62586 (array_inv!15085 a!3591)))

(declare-fun b!706069 () Bool)

(declare-fun res!469869 () Bool)

(assert (=> b!706069 (=> (not res!469869) (not e!397897))))

(declare-fun arrayContainsKey!0 (array!40265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706069 (= res!469869 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!706070 () Bool)

(declare-fun res!469870 () Bool)

(assert (=> b!706070 (=> (not res!469870) (not e!397897))))

(assert (=> b!706070 (= res!469870 (not (contains!3907 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706071 () Bool)

(declare-fun res!469877 () Bool)

(assert (=> b!706071 (=> (not res!469877) (not e!397897))))

(assert (=> b!706071 (= res!469877 (noDuplicate!1154 acc!652))))

(declare-fun b!706072 () Bool)

(declare-fun res!469872 () Bool)

(assert (=> b!706072 (=> (not res!469872) (not e!397897))))

(assert (=> b!706072 (= res!469872 (not (contains!3907 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706073 () Bool)

(declare-fun res!469875 () Bool)

(assert (=> b!706073 (=> (not res!469875) (not e!397897))))

(assert (=> b!706073 (= res!469875 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706074 () Bool)

(declare-fun res!469873 () Bool)

(assert (=> b!706074 (=> (not res!469873) (not e!397897))))

(assert (=> b!706074 (= res!469873 (validKeyInArray!0 k!2824))))

(declare-fun b!706075 () Bool)

(declare-fun res!469887 () Bool)

(assert (=> b!706075 (=> (not res!469887) (not e!397897))))

(assert (=> b!706075 (= res!469887 (contains!3907 newAcc!49 k!2824))))

(declare-fun b!706076 () Bool)

(declare-fun res!469883 () Bool)

(assert (=> b!706076 (=> (not res!469883) (not e!397897))))

(assert (=> b!706076 (= res!469883 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706077 () Bool)

(declare-fun res!469885 () Bool)

(assert (=> b!706077 (=> (not res!469885) (not e!397897))))

(declare-fun subseq!352 (List!13330 List!13330) Bool)

(assert (=> b!706077 (= res!469885 (subseq!352 acc!652 newAcc!49))))

(assert (= (and start!62586 res!469878) b!706071))

(assert (= (and b!706071 res!469877) b!706065))

(assert (= (and b!706065 res!469876) b!706060))

(assert (= (and b!706060 res!469886) b!706072))

(assert (= (and b!706072 res!469872) b!706073))

(assert (= (and b!706073 res!469875) b!706059))

(assert (= (and b!706059 res!469880) b!706074))

(assert (= (and b!706074 res!469873) b!706068))

(assert (= (and b!706068 res!469882) b!706077))

(assert (= (and b!706077 res!469885) b!706075))

(assert (= (and b!706075 res!469887) b!706063))

(assert (= (and b!706063 res!469881) b!706070))

(assert (= (and b!706070 res!469870) b!706064))

(assert (= (and b!706064 res!469874) b!706061))

(assert (= (and b!706061 res!469884) b!706062))

(assert (= (and b!706062 res!469871) b!706076))

(assert (= (and b!706076 res!469883) b!706069))

(assert (= (and b!706069 res!469869) b!706066))

(assert (= (and b!706066 res!469879) b!706067))

(declare-fun m!664035 () Bool)

(assert (=> b!706074 m!664035))

(declare-fun m!664037 () Bool)

(assert (=> b!706060 m!664037))

(declare-fun m!664039 () Bool)

(assert (=> start!62586 m!664039))

(declare-fun m!664041 () Bool)

(assert (=> b!706064 m!664041))

(declare-fun m!664043 () Bool)

(assert (=> b!706075 m!664043))

(declare-fun m!664045 () Bool)

(assert (=> b!706065 m!664045))

(declare-fun m!664047 () Bool)

(assert (=> b!706059 m!664047))

(declare-fun m!664049 () Bool)

(assert (=> b!706073 m!664049))

(declare-fun m!664051 () Bool)

(assert (=> b!706067 m!664051))

(declare-fun m!664053 () Bool)

(assert (=> b!706067 m!664053))

(declare-fun m!664055 () Bool)

(assert (=> b!706066 m!664055))

(declare-fun m!664057 () Bool)

(assert (=> b!706063 m!664057))

(declare-fun m!664059 () Bool)

(assert (=> b!706069 m!664059))

(declare-fun m!664061 () Bool)

(assert (=> b!706077 m!664061))

(declare-fun m!664063 () Bool)

(assert (=> b!706062 m!664063))

(assert (=> b!706062 m!664063))

(declare-fun m!664065 () Bool)

(assert (=> b!706062 m!664065))

(declare-fun m!664067 () Bool)

(assert (=> b!706070 m!664067))

(declare-fun m!664069 () Bool)

(assert (=> b!706071 m!664069))

(declare-fun m!664071 () Bool)

(assert (=> b!706072 m!664071))

(declare-fun m!664073 () Bool)

(assert (=> b!706068 m!664073))

(push 1)

(assert (not b!706073))

(assert (not b!706065))

(assert (not b!706060))

(assert (not b!706063))

(assert (not b!706070))

(assert (not b!706075))

(assert (not start!62586))

(assert (not b!706074))

(assert (not b!706069))

(assert (not b!706071))

(assert (not b!706068))

(assert (not b!706064))

(assert (not b!706066))

(assert (not b!706067))

(assert (not b!706062))

(assert (not b!706077))

(assert (not b!706059))

(assert (not b!706072))

(check-sat)

