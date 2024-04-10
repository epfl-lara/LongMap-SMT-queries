; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115734 () Bool)

(assert start!115734)

(declare-fun res!912167 () Bool)

(declare-fun e!775388 () Bool)

(assert (=> start!115734 (=> (not res!912167) (not e!775388))))

(declare-datatypes ((array!92926 0))(
  ( (array!92927 (arr!44887 (Array (_ BitVec 32) (_ BitVec 64))) (size!45437 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92926)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115734 (= res!912167 (and (bvslt (size!45437 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45437 a!3861))))))

(assert (=> start!115734 e!775388))

(declare-fun array_inv!33915 (array!92926) Bool)

(assert (=> start!115734 (array_inv!33915 a!3861)))

(assert (=> start!115734 true))

(declare-fun b!1368650 () Bool)

(declare-fun res!912168 () Bool)

(assert (=> b!1368650 (=> (not res!912168) (not e!775388))))

(declare-datatypes ((List!31955 0))(
  ( (Nil!31952) (Cons!31951 (h!33160 (_ BitVec 64)) (t!46649 List!31955)) )
))
(declare-fun acc!866 () List!31955)

(declare-fun contains!9637 (List!31955 (_ BitVec 64)) Bool)

(assert (=> b!1368650 (= res!912168 (not (contains!9637 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368651 () Bool)

(declare-fun res!912162 () Bool)

(assert (=> b!1368651 (=> (not res!912162) (not e!775388))))

(declare-fun newAcc!98 () List!31955)

(declare-fun subseq!1039 (List!31955 List!31955) Bool)

(assert (=> b!1368651 (= res!912162 (subseq!1039 newAcc!98 acc!866))))

(declare-fun b!1368652 () Bool)

(declare-fun res!912158 () Bool)

(assert (=> b!1368652 (=> (not res!912158) (not e!775388))))

(declare-fun noDuplicate!2494 (List!31955) Bool)

(assert (=> b!1368652 (= res!912158 (noDuplicate!2494 acc!866))))

(declare-fun b!1368653 () Bool)

(declare-fun res!912169 () Bool)

(declare-fun e!775389 () Bool)

(assert (=> b!1368653 (=> (not res!912169) (not e!775389))))

(assert (=> b!1368653 (= res!912169 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368654 () Bool)

(assert (=> b!1368654 (= e!775388 e!775389)))

(declare-fun res!912161 () Bool)

(assert (=> b!1368654 (=> (not res!912161) (not e!775389))))

(declare-fun arrayNoDuplicates!0 (array!92926 (_ BitVec 32) List!31955) Bool)

(assert (=> b!1368654 (= res!912161 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45211 0))(
  ( (Unit!45212) )
))
(declare-fun lt!602104 () Unit!45211)

(declare-fun noDuplicateSubseq!226 (List!31955 List!31955) Unit!45211)

(assert (=> b!1368654 (= lt!602104 (noDuplicateSubseq!226 newAcc!98 acc!866))))

(declare-fun b!1368655 () Bool)

(assert (=> b!1368655 (= e!775389 (not true))))

(assert (=> b!1368655 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602103 () Unit!45211)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92926 List!31955 List!31955 (_ BitVec 32)) Unit!45211)

(assert (=> b!1368655 (= lt!602103 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368656 () Bool)

(declare-fun res!912166 () Bool)

(assert (=> b!1368656 (=> (not res!912166) (not e!775388))))

(assert (=> b!1368656 (= res!912166 (not (contains!9637 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368657 () Bool)

(declare-fun res!912163 () Bool)

(assert (=> b!1368657 (=> (not res!912163) (not e!775389))))

(assert (=> b!1368657 (= res!912163 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368658 () Bool)

(declare-fun res!912160 () Bool)

(assert (=> b!1368658 (=> (not res!912160) (not e!775388))))

(assert (=> b!1368658 (= res!912160 (not (contains!9637 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368659 () Bool)

(declare-fun res!912164 () Bool)

(assert (=> b!1368659 (=> (not res!912164) (not e!775389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368659 (= res!912164 (not (validKeyInArray!0 (select (arr!44887 a!3861) from!3239))))))

(declare-fun b!1368660 () Bool)

(declare-fun res!912165 () Bool)

(assert (=> b!1368660 (=> (not res!912165) (not e!775388))))

(assert (=> b!1368660 (= res!912165 (not (contains!9637 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368661 () Bool)

(declare-fun res!912159 () Bool)

(assert (=> b!1368661 (=> (not res!912159) (not e!775389))))

(assert (=> b!1368661 (= res!912159 (bvslt from!3239 (size!45437 a!3861)))))

(assert (= (and start!115734 res!912167) b!1368652))

(assert (= (and b!1368652 res!912158) b!1368656))

(assert (= (and b!1368656 res!912166) b!1368650))

(assert (= (and b!1368650 res!912168) b!1368658))

(assert (= (and b!1368658 res!912160) b!1368660))

(assert (= (and b!1368660 res!912165) b!1368651))

(assert (= (and b!1368651 res!912162) b!1368654))

(assert (= (and b!1368654 res!912161) b!1368661))

(assert (= (and b!1368661 res!912159) b!1368659))

(assert (= (and b!1368659 res!912164) b!1368653))

(assert (= (and b!1368653 res!912169) b!1368657))

(assert (= (and b!1368657 res!912163) b!1368655))

(declare-fun m!1252563 () Bool)

(assert (=> b!1368652 m!1252563))

(declare-fun m!1252565 () Bool)

(assert (=> b!1368651 m!1252565))

(declare-fun m!1252567 () Bool)

(assert (=> b!1368655 m!1252567))

(declare-fun m!1252569 () Bool)

(assert (=> b!1368655 m!1252569))

(declare-fun m!1252571 () Bool)

(assert (=> b!1368650 m!1252571))

(declare-fun m!1252573 () Bool)

(assert (=> b!1368657 m!1252573))

(declare-fun m!1252575 () Bool)

(assert (=> b!1368654 m!1252575))

(declare-fun m!1252577 () Bool)

(assert (=> b!1368654 m!1252577))

(declare-fun m!1252579 () Bool)

(assert (=> start!115734 m!1252579))

(declare-fun m!1252581 () Bool)

(assert (=> b!1368660 m!1252581))

(declare-fun m!1252583 () Bool)

(assert (=> b!1368659 m!1252583))

(assert (=> b!1368659 m!1252583))

(declare-fun m!1252585 () Bool)

(assert (=> b!1368659 m!1252585))

(declare-fun m!1252587 () Bool)

(assert (=> b!1368658 m!1252587))

(declare-fun m!1252589 () Bool)

(assert (=> b!1368656 m!1252589))

(push 1)

(assert (not b!1368650))

(assert (not b!1368657))

