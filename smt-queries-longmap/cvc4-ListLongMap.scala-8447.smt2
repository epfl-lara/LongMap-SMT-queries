; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102820 () Bool)

(assert start!102820)

(declare-fun b!1235771 () Bool)

(declare-fun res!823852 () Bool)

(declare-fun e!700578 () Bool)

(assert (=> b!1235771 (=> (not res!823852) (not e!700578))))

(declare-datatypes ((List!27213 0))(
  ( (Nil!27210) (Cons!27209 (h!28418 (_ BitVec 64)) (t!40676 List!27213)) )
))
(declare-fun acc!846 () List!27213)

(declare-fun contains!7275 (List!27213 (_ BitVec 64)) Bool)

(assert (=> b!1235771 (= res!823852 (not (contains!7275 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235772 () Bool)

(declare-fun res!823848 () Bool)

(assert (=> b!1235772 (=> (not res!823848) (not e!700578))))

(declare-datatypes ((array!79665 0))(
  ( (array!79666 (arr!38440 (Array (_ BitVec 32) (_ BitVec 64))) (size!38976 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79665)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79665 (_ BitVec 32) List!27213) Bool)

(assert (=> b!1235772 (= res!823848 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235773 () Bool)

(declare-datatypes ((Unit!40964 0))(
  ( (Unit!40965) )
))
(declare-fun e!700580 () Unit!40964)

(declare-fun lt!560493 () Unit!40964)

(assert (=> b!1235773 (= e!700580 lt!560493)))

(declare-fun lt!560492 () List!27213)

(assert (=> b!1235773 (= lt!560492 (Cons!27209 (select (arr!38440 a!3835) from!3213) acc!846))))

(declare-fun lt!560491 () Unit!40964)

(declare-fun lemmaListSubSeqRefl!0 (List!27213) Unit!40964)

(assert (=> b!1235773 (= lt!560491 (lemmaListSubSeqRefl!0 lt!560492))))

(declare-fun subseq!547 (List!27213 List!27213) Bool)

(assert (=> b!1235773 (subseq!547 lt!560492 lt!560492)))

(declare-fun lt!560495 () Unit!40964)

(declare-fun subseqTail!40 (List!27213 List!27213) Unit!40964)

(assert (=> b!1235773 (= lt!560495 (subseqTail!40 lt!560492 lt!560492))))

(assert (=> b!1235773 (subseq!547 acc!846 lt!560492)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79665 List!27213 List!27213 (_ BitVec 32)) Unit!40964)

(assert (=> b!1235773 (= lt!560493 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560492 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235773 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235774 () Bool)

(declare-fun res!823851 () Bool)

(assert (=> b!1235774 (=> (not res!823851) (not e!700578))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235774 (= res!823851 (contains!7275 acc!846 k!2925))))

(declare-fun b!1235775 () Bool)

(declare-fun Unit!40966 () Unit!40964)

(assert (=> b!1235775 (= e!700580 Unit!40966)))

(declare-fun res!823846 () Bool)

(assert (=> start!102820 (=> (not res!823846) (not e!700578))))

(assert (=> start!102820 (= res!823846 (and (bvslt (size!38976 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38976 a!3835))))))

(assert (=> start!102820 e!700578))

(declare-fun array_inv!29288 (array!79665) Bool)

(assert (=> start!102820 (array_inv!29288 a!3835)))

(assert (=> start!102820 true))

(declare-fun b!1235776 () Bool)

(declare-fun e!700581 () Bool)

(assert (=> b!1235776 (= e!700578 e!700581)))

(declare-fun res!823845 () Bool)

(assert (=> b!1235776 (=> (not res!823845) (not e!700581))))

(assert (=> b!1235776 (= res!823845 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38976 a!3835))))))

(declare-fun lt!560494 () Unit!40964)

(assert (=> b!1235776 (= lt!560494 e!700580)))

(declare-fun c!120823 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235776 (= c!120823 (validKeyInArray!0 (select (arr!38440 a!3835) from!3213)))))

(declare-fun b!1235777 () Bool)

(declare-fun res!823849 () Bool)

(assert (=> b!1235777 (=> (not res!823849) (not e!700578))))

(assert (=> b!1235777 (= res!823849 (not (= from!3213 (bvsub (size!38976 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235778 () Bool)

(declare-fun res!823850 () Bool)

(assert (=> b!1235778 (=> (not res!823850) (not e!700578))))

(declare-fun noDuplicate!1872 (List!27213) Bool)

(assert (=> b!1235778 (= res!823850 (noDuplicate!1872 acc!846))))

(declare-fun b!1235779 () Bool)

(assert (=> b!1235779 (= e!700581 false)))

(declare-fun lt!560490 () Bool)

(assert (=> b!1235779 (= lt!560490 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235780 () Bool)

(declare-fun res!823847 () Bool)

(assert (=> b!1235780 (=> (not res!823847) (not e!700578))))

(assert (=> b!1235780 (= res!823847 (not (contains!7275 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102820 res!823846) b!1235778))

(assert (= (and b!1235778 res!823850) b!1235771))

(assert (= (and b!1235771 res!823852) b!1235780))

(assert (= (and b!1235780 res!823847) b!1235772))

(assert (= (and b!1235772 res!823848) b!1235774))

(assert (= (and b!1235774 res!823851) b!1235777))

(assert (= (and b!1235777 res!823849) b!1235776))

(assert (= (and b!1235776 c!120823) b!1235773))

(assert (= (and b!1235776 (not c!120823)) b!1235775))

(assert (= (and b!1235776 res!823845) b!1235779))

(declare-fun m!1139631 () Bool)

(assert (=> b!1235774 m!1139631))

(declare-fun m!1139633 () Bool)

(assert (=> b!1235776 m!1139633))

(assert (=> b!1235776 m!1139633))

(declare-fun m!1139635 () Bool)

(assert (=> b!1235776 m!1139635))

(declare-fun m!1139637 () Bool)

(assert (=> start!102820 m!1139637))

(declare-fun m!1139639 () Bool)

(assert (=> b!1235773 m!1139639))

(declare-fun m!1139641 () Bool)

(assert (=> b!1235773 m!1139641))

(declare-fun m!1139643 () Bool)

(assert (=> b!1235773 m!1139643))

(assert (=> b!1235773 m!1139633))

(declare-fun m!1139645 () Bool)

(assert (=> b!1235773 m!1139645))

(declare-fun m!1139647 () Bool)

(assert (=> b!1235773 m!1139647))

(declare-fun m!1139649 () Bool)

(assert (=> b!1235773 m!1139649))

(declare-fun m!1139651 () Bool)

(assert (=> b!1235780 m!1139651))

(assert (=> b!1235779 m!1139647))

(declare-fun m!1139653 () Bool)

(assert (=> b!1235771 m!1139653))

(declare-fun m!1139655 () Bool)

(assert (=> b!1235772 m!1139655))

(declare-fun m!1139657 () Bool)

(assert (=> b!1235778 m!1139657))

(push 1)

(assert (not b!1235772))

(assert (not b!1235771))

(assert (not b!1235776))

(assert (not b!1235779))

(assert (not b!1235778))

(assert (not b!1235773))

(assert (not b!1235780))

(assert (not start!102820))

