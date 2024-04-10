; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114980 () Bool)

(assert start!114980)

(declare-fun b!1362870 () Bool)

(declare-fun res!906789 () Bool)

(declare-fun e!773001 () Bool)

(assert (=> b!1362870 (=> (not res!906789) (not e!773001))))

(declare-datatypes ((array!92658 0))(
  ( (array!92659 (arr!44762 (Array (_ BitVec 32) (_ BitVec 64))) (size!45312 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92658)

(declare-datatypes ((List!31803 0))(
  ( (Nil!31800) (Cons!31799 (h!33008 (_ BitVec 64)) (t!46491 List!31803)) )
))
(declare-fun arrayNoDuplicates!0 (array!92658 (_ BitVec 32) List!31803) Bool)

(assert (=> b!1362870 (= res!906789 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31800))))

(declare-fun b!1362871 () Bool)

(declare-fun res!906790 () Bool)

(assert (=> b!1362871 (=> (not res!906790) (not e!773001))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362871 (= res!906790 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362872 () Bool)

(assert (=> b!1362872 (= e!773001 false)))

(declare-datatypes ((Unit!44946 0))(
  ( (Unit!44947) )
))
(declare-fun lt!600613 () Unit!44946)

(declare-fun e!773002 () Unit!44946)

(assert (=> b!1362872 (= lt!600613 e!773002)))

(declare-fun c!127484 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1362872 (= c!127484 (validKeyInArray!0 (select (arr!44762 a!3742) from!3120)))))

(declare-fun b!1362873 () Bool)

(declare-fun res!906784 () Bool)

(assert (=> b!1362873 (=> (not res!906784) (not e!773001))))

(declare-fun acc!759 () List!31803)

(assert (=> b!1362873 (= res!906784 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!906783 () Bool)

(assert (=> start!114980 (=> (not res!906783) (not e!773001))))

(assert (=> start!114980 (= res!906783 (and (bvslt (size!45312 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45312 a!3742))))))

(assert (=> start!114980 e!773001))

(assert (=> start!114980 true))

(declare-fun array_inv!33790 (array!92658) Bool)

(assert (=> start!114980 (array_inv!33790 a!3742)))

(declare-fun b!1362874 () Bool)

(declare-fun res!906785 () Bool)

(assert (=> b!1362874 (=> (not res!906785) (not e!773001))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362874 (= res!906785 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45312 a!3742))))))

(declare-fun b!1362875 () Bool)

(declare-fun res!906787 () Bool)

(assert (=> b!1362875 (=> (not res!906787) (not e!773001))))

(assert (=> b!1362875 (= res!906787 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45312 a!3742)))))

(declare-fun b!1362876 () Bool)

(declare-fun res!906788 () Bool)

(assert (=> b!1362876 (=> (not res!906788) (not e!773001))))

(declare-fun contains!9512 (List!31803 (_ BitVec 64)) Bool)

(assert (=> b!1362876 (= res!906788 (not (contains!9512 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362877 () Bool)

(declare-fun Unit!44948 () Unit!44946)

(assert (=> b!1362877 (= e!773002 Unit!44948)))

(declare-fun b!1362878 () Bool)

(declare-fun res!906786 () Bool)

(assert (=> b!1362878 (=> (not res!906786) (not e!773001))))

(assert (=> b!1362878 (= res!906786 (not (contains!9512 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362879 () Bool)

(declare-fun res!906782 () Bool)

(assert (=> b!1362879 (=> (not res!906782) (not e!773001))))

(declare-fun noDuplicate!2369 (List!31803) Bool)

(assert (=> b!1362879 (= res!906782 (noDuplicate!2369 acc!759))))

(declare-fun b!1362880 () Bool)

(declare-fun lt!600612 () Unit!44946)

(assert (=> b!1362880 (= e!773002 lt!600612)))

(declare-fun lt!600611 () Unit!44946)

(declare-fun lemmaListSubSeqRefl!0 (List!31803) Unit!44946)

(assert (=> b!1362880 (= lt!600611 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!914 (List!31803 List!31803) Bool)

(assert (=> b!1362880 (subseq!914 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92658 List!31803 List!31803 (_ BitVec 32)) Unit!44946)

(declare-fun $colon$colon!917 (List!31803 (_ BitVec 64)) List!31803)

(assert (=> b!1362880 (= lt!600612 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!917 acc!759 (select (arr!44762 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362880 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114980 res!906783) b!1362879))

(assert (= (and b!1362879 res!906782) b!1362876))

(assert (= (and b!1362876 res!906788) b!1362878))

(assert (= (and b!1362878 res!906786) b!1362870))

(assert (= (and b!1362870 res!906789) b!1362873))

(assert (= (and b!1362873 res!906784) b!1362874))

(assert (= (and b!1362874 res!906785) b!1362871))

(assert (= (and b!1362871 res!906790) b!1362875))

(assert (= (and b!1362875 res!906787) b!1362872))

(assert (= (and b!1362872 c!127484) b!1362880))

(assert (= (and b!1362872 (not c!127484)) b!1362877))

(declare-fun m!1247779 () Bool)

(assert (=> b!1362871 m!1247779))

(declare-fun m!1247781 () Bool)

(assert (=> b!1362876 m!1247781))

(declare-fun m!1247783 () Bool)

(assert (=> b!1362870 m!1247783))

(declare-fun m!1247785 () Bool)

(assert (=> b!1362878 m!1247785))

(declare-fun m!1247787 () Bool)

(assert (=> start!114980 m!1247787))

(declare-fun m!1247789 () Bool)

(assert (=> b!1362873 m!1247789))

(declare-fun m!1247791 () Bool)

(assert (=> b!1362880 m!1247791))

(declare-fun m!1247793 () Bool)

(assert (=> b!1362880 m!1247793))

(declare-fun m!1247795 () Bool)

(assert (=> b!1362880 m!1247795))

(declare-fun m!1247797 () Bool)

(assert (=> b!1362880 m!1247797))

(declare-fun m!1247799 () Bool)

(assert (=> b!1362880 m!1247799))

(assert (=> b!1362880 m!1247793))

(assert (=> b!1362880 m!1247795))

(declare-fun m!1247801 () Bool)

(assert (=> b!1362880 m!1247801))

(assert (=> b!1362872 m!1247793))

(assert (=> b!1362872 m!1247793))

(declare-fun m!1247803 () Bool)

(assert (=> b!1362872 m!1247803))

(declare-fun m!1247805 () Bool)

(assert (=> b!1362879 m!1247805))

(push 1)

(assert (not b!1362879))

(assert (not b!1362872))

(assert (not b!1362880))

(assert (not b!1362873))

(assert (not b!1362870))

(assert (not b!1362876))

(assert (not start!114980))

(assert (not b!1362878))

(assert (not b!1362871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

