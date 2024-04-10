; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62576 () Bool)

(assert start!62576)

(declare-fun res!469596 () Bool)

(declare-fun e!397867 () Bool)

(assert (=> start!62576 (=> (not res!469596) (not e!397867))))

(declare-datatypes ((array!40255 0))(
  ( (array!40256 (arr!19284 (Array (_ BitVec 32) (_ BitVec 64))) (size!19669 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40255)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62576 (= res!469596 (and (bvslt (size!19669 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19669 a!3591))))))

(assert (=> start!62576 e!397867))

(assert (=> start!62576 true))

(declare-fun array_inv!15080 (array!40255) Bool)

(assert (=> start!62576 (array_inv!15080 a!3591)))

(declare-fun b!705774 () Bool)

(declare-fun res!469586 () Bool)

(assert (=> b!705774 (=> (not res!469586) (not e!397867))))

(declare-datatypes ((List!13325 0))(
  ( (Nil!13322) (Cons!13321 (h!14366 (_ BitVec 64)) (t!19607 List!13325)) )
))
(declare-fun newAcc!49 () List!13325)

(declare-fun noDuplicate!1149 (List!13325) Bool)

(assert (=> b!705774 (= res!469586 (noDuplicate!1149 newAcc!49))))

(declare-fun b!705775 () Bool)

(declare-fun res!469584 () Bool)

(assert (=> b!705775 (=> (not res!469584) (not e!397867))))

(declare-fun acc!652 () List!13325)

(declare-fun arrayNoDuplicates!0 (array!40255 (_ BitVec 32) List!13325) Bool)

(assert (=> b!705775 (= res!469584 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705776 () Bool)

(declare-fun res!469598 () Bool)

(assert (=> b!705776 (=> (not res!469598) (not e!397867))))

(declare-fun contains!3902 (List!13325 (_ BitVec 64)) Bool)

(assert (=> b!705776 (= res!469598 (not (contains!3902 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705777 () Bool)

(declare-fun res!469597 () Bool)

(assert (=> b!705777 (=> (not res!469597) (not e!397867))))

(assert (=> b!705777 (= res!469597 (not (contains!3902 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705778 () Bool)

(declare-fun res!469585 () Bool)

(assert (=> b!705778 (=> (not res!469585) (not e!397867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705778 (= res!469585 (not (validKeyInArray!0 (select (arr!19284 a!3591) from!2969))))))

(declare-fun b!705779 () Bool)

(declare-fun res!469592 () Bool)

(assert (=> b!705779 (=> (not res!469592) (not e!397867))))

(assert (=> b!705779 (= res!469592 (not (contains!3902 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705780 () Bool)

(declare-fun res!469588 () Bool)

(assert (=> b!705780 (=> (not res!469588) (not e!397867))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!705780 (= res!469588 (validKeyInArray!0 k!2824))))

(declare-fun b!705781 () Bool)

(declare-fun res!469587 () Bool)

(assert (=> b!705781 (=> (not res!469587) (not e!397867))))

(assert (=> b!705781 (= res!469587 (not (contains!3902 acc!652 k!2824)))))

(declare-fun b!705782 () Bool)

(declare-fun res!469599 () Bool)

(assert (=> b!705782 (=> (not res!469599) (not e!397867))))

(declare-fun arrayContainsKey!0 (array!40255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705782 (= res!469599 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705783 () Bool)

(declare-fun res!469602 () Bool)

(assert (=> b!705783 (=> (not res!469602) (not e!397867))))

(assert (=> b!705783 (= res!469602 (not (contains!3902 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705784 () Bool)

(declare-fun res!469600 () Bool)

(assert (=> b!705784 (=> (not res!469600) (not e!397867))))

(declare-fun subseq!347 (List!13325 List!13325) Bool)

(assert (=> b!705784 (= res!469600 (subseq!347 acc!652 newAcc!49))))

(declare-fun b!705785 () Bool)

(declare-fun res!469589 () Bool)

(assert (=> b!705785 (=> (not res!469589) (not e!397867))))

(assert (=> b!705785 (= res!469589 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705786 () Bool)

(declare-fun res!469601 () Bool)

(assert (=> b!705786 (=> (not res!469601) (not e!397867))))

(declare-fun -!312 (List!13325 (_ BitVec 64)) List!13325)

(assert (=> b!705786 (= res!469601 (= (-!312 newAcc!49 k!2824) acc!652))))

(declare-fun b!705787 () Bool)

(declare-fun res!469595 () Bool)

(assert (=> b!705787 (=> (not res!469595) (not e!397867))))

(assert (=> b!705787 (= res!469595 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19669 a!3591)))))

(declare-fun b!705788 () Bool)

(assert (=> b!705788 (= e!397867 (not true))))

(assert (=> b!705788 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24618 0))(
  ( (Unit!24619) )
))
(declare-fun lt!317916 () Unit!24618)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40255 (_ BitVec 64) (_ BitVec 32) List!13325 List!13325) Unit!24618)

(assert (=> b!705788 (= lt!317916 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705789 () Bool)

(declare-fun res!469593 () Bool)

(assert (=> b!705789 (=> (not res!469593) (not e!397867))))

(assert (=> b!705789 (= res!469593 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705790 () Bool)

(declare-fun res!469590 () Bool)

(assert (=> b!705790 (=> (not res!469590) (not e!397867))))

(assert (=> b!705790 (= res!469590 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705791 () Bool)

(declare-fun res!469594 () Bool)

(assert (=> b!705791 (=> (not res!469594) (not e!397867))))

(assert (=> b!705791 (= res!469594 (contains!3902 newAcc!49 k!2824))))

(declare-fun b!705792 () Bool)

(declare-fun res!469591 () Bool)

(assert (=> b!705792 (=> (not res!469591) (not e!397867))))

(assert (=> b!705792 (= res!469591 (noDuplicate!1149 acc!652))))

(assert (= (and start!62576 res!469596) b!705792))

(assert (= (and b!705792 res!469591) b!705774))

(assert (= (and b!705774 res!469586) b!705783))

(assert (= (and b!705783 res!469602) b!705777))

(assert (= (and b!705777 res!469597) b!705790))

(assert (= (and b!705790 res!469590) b!705781))

(assert (= (and b!705781 res!469587) b!705780))

(assert (= (and b!705780 res!469588) b!705775))

(assert (= (and b!705775 res!469584) b!705784))

(assert (= (and b!705784 res!469600) b!705791))

(assert (= (and b!705791 res!469594) b!705786))

(assert (= (and b!705786 res!469601) b!705776))

(assert (= (and b!705776 res!469598) b!705779))

(assert (= (and b!705779 res!469592) b!705787))

(assert (= (and b!705787 res!469595) b!705778))

(assert (= (and b!705778 res!469585) b!705789))

(assert (= (and b!705789 res!469593) b!705782))

(assert (= (and b!705782 res!469599) b!705785))

(assert (= (and b!705785 res!469589) b!705788))

(declare-fun m!663835 () Bool)

(assert (=> b!705780 m!663835))

(declare-fun m!663837 () Bool)

(assert (=> b!705775 m!663837))

(declare-fun m!663839 () Bool)

(assert (=> b!705776 m!663839))

(declare-fun m!663841 () Bool)

(assert (=> b!705786 m!663841))

(declare-fun m!663843 () Bool)

(assert (=> b!705790 m!663843))

(declare-fun m!663845 () Bool)

(assert (=> start!62576 m!663845))

(declare-fun m!663847 () Bool)

(assert (=> b!705774 m!663847))

(declare-fun m!663849 () Bool)

(assert (=> b!705792 m!663849))

(declare-fun m!663851 () Bool)

(assert (=> b!705781 m!663851))

(declare-fun m!663853 () Bool)

(assert (=> b!705779 m!663853))

(declare-fun m!663855 () Bool)

(assert (=> b!705784 m!663855))

(declare-fun m!663857 () Bool)

(assert (=> b!705785 m!663857))

(declare-fun m!663859 () Bool)

(assert (=> b!705783 m!663859))

(declare-fun m!663861 () Bool)

(assert (=> b!705778 m!663861))

(assert (=> b!705778 m!663861))

(declare-fun m!663863 () Bool)

(assert (=> b!705778 m!663863))

(declare-fun m!663865 () Bool)

(assert (=> b!705791 m!663865))

(declare-fun m!663867 () Bool)

(assert (=> b!705782 m!663867))

(declare-fun m!663869 () Bool)

(assert (=> b!705788 m!663869))

(declare-fun m!663871 () Bool)

(assert (=> b!705788 m!663871))

(declare-fun m!663873 () Bool)

(assert (=> b!705777 m!663873))

(push 1)

(assert (not b!705774))

(assert (not b!705782))

(assert (not b!705786))

(assert (not b!705775))

(assert (not b!705778))

(assert (not b!705777))

(assert (not b!705776))

(assert (not b!705781))

(assert (not b!705784))

(assert (not b!705791))

(assert (not b!705788))

(assert (not b!705785))

(assert (not b!705783))

(assert (not b!705790))

(assert (not b!705779))

(assert (not b!705780))

(assert (not start!62576))

(assert (not b!705792))

(check-sat)

