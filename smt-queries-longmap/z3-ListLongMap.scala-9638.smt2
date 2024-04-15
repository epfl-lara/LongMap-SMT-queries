; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113966 () Bool)

(assert start!113966)

(declare-fun b!1351984 () Bool)

(declare-fun e!768649 () Bool)

(declare-fun e!768646 () Bool)

(assert (=> b!1351984 (= e!768649 e!768646)))

(declare-fun res!897431 () Bool)

(assert (=> b!1351984 (=> (not res!897431) (not e!768646))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351984 (= res!897431 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44148 0))(
  ( (Unit!44149) )
))
(declare-fun lt!597231 () Unit!44148)

(declare-fun e!768648 () Unit!44148)

(assert (=> b!1351984 (= lt!597231 e!768648)))

(declare-fun c!126722 () Bool)

(declare-datatypes ((array!92097 0))(
  ( (array!92098 (arr!44497 (Array (_ BitVec 32) (_ BitVec 64))) (size!45049 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92097)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351984 (= c!126722 (validKeyInArray!0 (select (arr!44497 a!3742) from!3120)))))

(declare-fun res!897428 () Bool)

(assert (=> start!113966 (=> (not res!897428) (not e!768649))))

(assert (=> start!113966 (= res!897428 (and (bvslt (size!45049 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45049 a!3742))))))

(assert (=> start!113966 e!768649))

(assert (=> start!113966 true))

(declare-fun array_inv!33730 (array!92097) Bool)

(assert (=> start!113966 (array_inv!33730 a!3742)))

(declare-fun b!1351985 () Bool)

(declare-fun res!897430 () Bool)

(assert (=> b!1351985 (=> (not res!897430) (not e!768649))))

(assert (=> b!1351985 (= res!897430 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45049 a!3742))))))

(declare-fun b!1351986 () Bool)

(declare-fun Unit!44150 () Unit!44148)

(assert (=> b!1351986 (= e!768648 Unit!44150)))

(declare-fun b!1351987 () Bool)

(assert (=> b!1351987 (= e!768646 false)))

(declare-datatypes ((List!31616 0))(
  ( (Nil!31613) (Cons!31612 (h!32821 (_ BitVec 64)) (t!46266 List!31616)) )
))
(declare-fun acc!759 () List!31616)

(declare-fun lt!597232 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92097 (_ BitVec 32) List!31616) Bool)

(assert (=> b!1351987 (= lt!597232 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1351988 () Bool)

(declare-fun res!897427 () Bool)

(assert (=> b!1351988 (=> (not res!897427) (not e!768649))))

(declare-fun contains!9236 (List!31616 (_ BitVec 64)) Bool)

(assert (=> b!1351988 (= res!897427 (not (contains!9236 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351989 () Bool)

(declare-fun res!897432 () Bool)

(assert (=> b!1351989 (=> (not res!897432) (not e!768649))))

(assert (=> b!1351989 (= res!897432 (not (contains!9236 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351990 () Bool)

(declare-fun res!897434 () Bool)

(assert (=> b!1351990 (=> (not res!897434) (not e!768649))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351990 (= res!897434 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351991 () Bool)

(declare-fun res!897425 () Bool)

(assert (=> b!1351991 (=> (not res!897425) (not e!768649))))

(assert (=> b!1351991 (= res!897425 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31613))))

(declare-fun b!1351992 () Bool)

(declare-fun res!897433 () Bool)

(assert (=> b!1351992 (=> (not res!897433) (not e!768649))))

(assert (=> b!1351992 (= res!897433 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351993 () Bool)

(declare-fun lt!597229 () Unit!44148)

(assert (=> b!1351993 (= e!768648 lt!597229)))

(declare-fun lt!597230 () Unit!44148)

(declare-fun lemmaListSubSeqRefl!0 (List!31616) Unit!44148)

(assert (=> b!1351993 (= lt!597230 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!692 (List!31616 List!31616) Bool)

(assert (=> b!1351993 (subseq!692 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92097 List!31616 List!31616 (_ BitVec 32)) Unit!44148)

(declare-fun $colon$colon!709 (List!31616 (_ BitVec 64)) List!31616)

(assert (=> b!1351993 (= lt!597229 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!709 acc!759 (select (arr!44497 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351993 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351994 () Bool)

(declare-fun res!897429 () Bool)

(assert (=> b!1351994 (=> (not res!897429) (not e!768649))))

(declare-fun noDuplicate!2151 (List!31616) Bool)

(assert (=> b!1351994 (= res!897429 (noDuplicate!2151 acc!759))))

(declare-fun b!1351995 () Bool)

(declare-fun res!897426 () Bool)

(assert (=> b!1351995 (=> (not res!897426) (not e!768649))))

(assert (=> b!1351995 (= res!897426 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45049 a!3742)))))

(assert (= (and start!113966 res!897428) b!1351994))

(assert (= (and b!1351994 res!897429) b!1351989))

(assert (= (and b!1351989 res!897432) b!1351988))

(assert (= (and b!1351988 res!897427) b!1351991))

(assert (= (and b!1351991 res!897425) b!1351992))

(assert (= (and b!1351992 res!897433) b!1351985))

(assert (= (and b!1351985 res!897430) b!1351990))

(assert (= (and b!1351990 res!897434) b!1351995))

(assert (= (and b!1351995 res!897426) b!1351984))

(assert (= (and b!1351984 c!126722) b!1351993))

(assert (= (and b!1351984 (not c!126722)) b!1351986))

(assert (= (and b!1351984 res!897431) b!1351987))

(declare-fun m!1238437 () Bool)

(assert (=> b!1351984 m!1238437))

(assert (=> b!1351984 m!1238437))

(declare-fun m!1238439 () Bool)

(assert (=> b!1351984 m!1238439))

(declare-fun m!1238441 () Bool)

(assert (=> b!1351991 m!1238441))

(declare-fun m!1238443 () Bool)

(assert (=> b!1351987 m!1238443))

(declare-fun m!1238445 () Bool)

(assert (=> b!1351993 m!1238445))

(assert (=> b!1351993 m!1238437))

(declare-fun m!1238447 () Bool)

(assert (=> b!1351993 m!1238447))

(declare-fun m!1238449 () Bool)

(assert (=> b!1351993 m!1238449))

(assert (=> b!1351993 m!1238443))

(assert (=> b!1351993 m!1238437))

(assert (=> b!1351993 m!1238447))

(declare-fun m!1238451 () Bool)

(assert (=> b!1351993 m!1238451))

(declare-fun m!1238453 () Bool)

(assert (=> start!113966 m!1238453))

(declare-fun m!1238455 () Bool)

(assert (=> b!1351988 m!1238455))

(declare-fun m!1238457 () Bool)

(assert (=> b!1351990 m!1238457))

(declare-fun m!1238459 () Bool)

(assert (=> b!1351989 m!1238459))

(declare-fun m!1238461 () Bool)

(assert (=> b!1351994 m!1238461))

(declare-fun m!1238463 () Bool)

(assert (=> b!1351992 m!1238463))

(check-sat (not b!1351990) (not b!1351988) (not b!1351992) (not b!1351984) (not b!1351989) (not b!1351987) (not b!1351993) (not start!113966) (not b!1351994) (not b!1351991))
(check-sat)
