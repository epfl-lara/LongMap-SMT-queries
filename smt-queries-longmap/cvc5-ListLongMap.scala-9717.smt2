; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114974 () Bool)

(assert start!114974)

(declare-fun res!906704 () Bool)

(declare-fun e!772974 () Bool)

(assert (=> start!114974 (=> (not res!906704) (not e!772974))))

(declare-datatypes ((array!92652 0))(
  ( (array!92653 (arr!44759 (Array (_ BitVec 32) (_ BitVec 64))) (size!45309 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92652)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114974 (= res!906704 (and (bvslt (size!45309 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45309 a!3742))))))

(assert (=> start!114974 e!772974))

(assert (=> start!114974 true))

(declare-fun array_inv!33787 (array!92652) Bool)

(assert (=> start!114974 (array_inv!33787 a!3742)))

(declare-fun b!1362771 () Bool)

(declare-datatypes ((Unit!44937 0))(
  ( (Unit!44938) )
))
(declare-fun e!772975 () Unit!44937)

(declare-fun lt!600584 () Unit!44937)

(assert (=> b!1362771 (= e!772975 lt!600584)))

(declare-fun lt!600585 () Unit!44937)

(declare-datatypes ((List!31800 0))(
  ( (Nil!31797) (Cons!31796 (h!33005 (_ BitVec 64)) (t!46488 List!31800)) )
))
(declare-fun acc!759 () List!31800)

(declare-fun lemmaListSubSeqRefl!0 (List!31800) Unit!44937)

(assert (=> b!1362771 (= lt!600585 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!911 (List!31800 List!31800) Bool)

(assert (=> b!1362771 (subseq!911 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92652 List!31800 List!31800 (_ BitVec 32)) Unit!44937)

(declare-fun $colon$colon!914 (List!31800 (_ BitVec 64)) List!31800)

(assert (=> b!1362771 (= lt!600584 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!914 acc!759 (select (arr!44759 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92652 (_ BitVec 32) List!31800) Bool)

(assert (=> b!1362771 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362772 () Bool)

(declare-fun res!906701 () Bool)

(assert (=> b!1362772 (=> (not res!906701) (not e!772974))))

(assert (=> b!1362772 (= res!906701 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31797))))

(declare-fun b!1362773 () Bool)

(declare-fun res!906709 () Bool)

(assert (=> b!1362773 (=> (not res!906709) (not e!772974))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362773 (= res!906709 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45309 a!3742))))))

(declare-fun b!1362774 () Bool)

(declare-fun res!906706 () Bool)

(assert (=> b!1362774 (=> (not res!906706) (not e!772974))))

(assert (=> b!1362774 (= res!906706 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362775 () Bool)

(declare-fun res!906707 () Bool)

(assert (=> b!1362775 (=> (not res!906707) (not e!772974))))

(declare-fun contains!9509 (List!31800 (_ BitVec 64)) Bool)

(assert (=> b!1362775 (= res!906707 (not (contains!9509 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362776 () Bool)

(declare-fun Unit!44939 () Unit!44937)

(assert (=> b!1362776 (= e!772975 Unit!44939)))

(declare-fun b!1362777 () Bool)

(declare-fun res!906702 () Bool)

(assert (=> b!1362777 (=> (not res!906702) (not e!772974))))

(declare-fun noDuplicate!2366 (List!31800) Bool)

(assert (=> b!1362777 (= res!906702 (noDuplicate!2366 acc!759))))

(declare-fun b!1362778 () Bool)

(assert (=> b!1362778 (= e!772974 false)))

(declare-fun lt!600586 () Unit!44937)

(assert (=> b!1362778 (= lt!600586 e!772975)))

(declare-fun c!127475 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362778 (= c!127475 (validKeyInArray!0 (select (arr!44759 a!3742) from!3120)))))

(declare-fun b!1362779 () Bool)

(declare-fun res!906703 () Bool)

(assert (=> b!1362779 (=> (not res!906703) (not e!772974))))

(assert (=> b!1362779 (= res!906703 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45309 a!3742)))))

(declare-fun b!1362780 () Bool)

(declare-fun res!906705 () Bool)

(assert (=> b!1362780 (=> (not res!906705) (not e!772974))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362780 (= res!906705 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362781 () Bool)

(declare-fun res!906708 () Bool)

(assert (=> b!1362781 (=> (not res!906708) (not e!772974))))

(assert (=> b!1362781 (= res!906708 (not (contains!9509 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114974 res!906704) b!1362777))

(assert (= (and b!1362777 res!906702) b!1362781))

(assert (= (and b!1362781 res!906708) b!1362775))

(assert (= (and b!1362775 res!906707) b!1362772))

(assert (= (and b!1362772 res!906701) b!1362774))

(assert (= (and b!1362774 res!906706) b!1362773))

(assert (= (and b!1362773 res!906709) b!1362780))

(assert (= (and b!1362780 res!906705) b!1362779))

(assert (= (and b!1362779 res!906703) b!1362778))

(assert (= (and b!1362778 c!127475) b!1362771))

(assert (= (and b!1362778 (not c!127475)) b!1362776))

(declare-fun m!1247695 () Bool)

(assert (=> b!1362780 m!1247695))

(declare-fun m!1247697 () Bool)

(assert (=> b!1362771 m!1247697))

(declare-fun m!1247699 () Bool)

(assert (=> b!1362771 m!1247699))

(declare-fun m!1247701 () Bool)

(assert (=> b!1362771 m!1247701))

(declare-fun m!1247703 () Bool)

(assert (=> b!1362771 m!1247703))

(declare-fun m!1247705 () Bool)

(assert (=> b!1362771 m!1247705))

(assert (=> b!1362771 m!1247699))

(assert (=> b!1362771 m!1247701))

(declare-fun m!1247707 () Bool)

(assert (=> b!1362771 m!1247707))

(declare-fun m!1247709 () Bool)

(assert (=> b!1362777 m!1247709))

(declare-fun m!1247711 () Bool)

(assert (=> b!1362772 m!1247711))

(declare-fun m!1247713 () Bool)

(assert (=> b!1362774 m!1247713))

(declare-fun m!1247715 () Bool)

(assert (=> start!114974 m!1247715))

(assert (=> b!1362778 m!1247699))

(assert (=> b!1362778 m!1247699))

(declare-fun m!1247717 () Bool)

(assert (=> b!1362778 m!1247717))

(declare-fun m!1247719 () Bool)

(assert (=> b!1362775 m!1247719))

(declare-fun m!1247721 () Bool)

(assert (=> b!1362781 m!1247721))

(push 1)

(assert (not b!1362781))

(assert (not b!1362775))

(assert (not b!1362780))

(assert (not b!1362772))

(assert (not b!1362777))

(assert (not b!1362771))

(assert (not b!1362778))

(assert (not start!114974))

(assert (not b!1362774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

