; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115768 () Bool)

(assert start!115768)

(declare-fun res!910751 () Bool)

(declare-fun e!775472 () Bool)

(assert (=> start!115768 (=> (not res!910751) (not e!775472))))

(declare-datatypes ((array!92935 0))(
  ( (array!92936 (arr!44890 (Array (_ BitVec 32) (_ BitVec 64))) (size!45441 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92935)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115768 (= res!910751 (and (bvslt (size!45441 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45441 a!3861))))))

(assert (=> start!115768 e!775472))

(declare-fun array_inv!34171 (array!92935) Bool)

(assert (=> start!115768 (array_inv!34171 a!3861)))

(assert (=> start!115768 true))

(declare-fun b!1367979 () Bool)

(declare-fun res!910748 () Bool)

(assert (=> b!1367979 (=> (not res!910748) (not e!775472))))

(declare-datatypes ((List!31945 0))(
  ( (Nil!31942) (Cons!31941 (h!33159 (_ BitVec 64)) (t!46631 List!31945)) )
))
(declare-fun acc!866 () List!31945)

(declare-fun noDuplicate!2461 (List!31945) Bool)

(assert (=> b!1367979 (= res!910748 (noDuplicate!2461 acc!866))))

(declare-fun b!1367980 () Bool)

(declare-fun e!775474 () Bool)

(assert (=> b!1367980 (= e!775472 e!775474)))

(declare-fun res!910754 () Bool)

(assert (=> b!1367980 (=> (not res!910754) (not e!775474))))

(declare-fun arrayNoDuplicates!0 (array!92935 (_ BitVec 32) List!31945) Bool)

(assert (=> b!1367980 (= res!910754 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45050 0))(
  ( (Unit!45051) )
))
(declare-fun lt!602107 () Unit!45050)

(declare-fun newAcc!98 () List!31945)

(declare-fun noDuplicateSubseq!176 (List!31945 List!31945) Unit!45050)

(assert (=> b!1367980 (= lt!602107 (noDuplicateSubseq!176 newAcc!98 acc!866))))

(declare-fun b!1367981 () Bool)

(declare-fun res!910750 () Bool)

(assert (=> b!1367981 (=> (not res!910750) (not e!775474))))

(assert (=> b!1367981 (= res!910750 (bvslt from!3239 (size!45441 a!3861)))))

(declare-fun b!1367982 () Bool)

(declare-fun res!910752 () Bool)

(assert (=> b!1367982 (=> (not res!910752) (not e!775472))))

(declare-fun subseq!989 (List!31945 List!31945) Bool)

(assert (=> b!1367982 (= res!910752 (subseq!989 newAcc!98 acc!866))))

(declare-fun b!1367983 () Bool)

(declare-fun res!910753 () Bool)

(assert (=> b!1367983 (=> (not res!910753) (not e!775472))))

(declare-fun contains!9630 (List!31945 (_ BitVec 64)) Bool)

(assert (=> b!1367983 (= res!910753 (not (contains!9630 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367984 () Bool)

(declare-fun res!910758 () Bool)

(assert (=> b!1367984 (=> (not res!910758) (not e!775474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367984 (= res!910758 (validKeyInArray!0 (select (arr!44890 a!3861) from!3239)))))

(declare-fun b!1367985 () Bool)

(declare-fun res!910756 () Bool)

(assert (=> b!1367985 (=> (not res!910756) (not e!775472))))

(assert (=> b!1367985 (= res!910756 (not (contains!9630 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367986 () Bool)

(declare-fun res!910757 () Bool)

(assert (=> b!1367986 (=> (not res!910757) (not e!775472))))

(assert (=> b!1367986 (= res!910757 (not (contains!9630 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367987 () Bool)

(assert (=> b!1367987 (= e!775474 (not true))))

(declare-fun lt!602108 () Unit!45050)

(declare-fun lt!602106 () List!31945)

(declare-fun lt!602105 () List!31945)

(assert (=> b!1367987 (= lt!602108 (noDuplicateSubseq!176 lt!602106 lt!602105))))

(assert (=> b!1367987 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602106)))

(declare-fun lt!602109 () Unit!45050)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92935 List!31945 List!31945 (_ BitVec 32)) Unit!45050)

(assert (=> b!1367987 (= lt!602109 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602105 lt!602106 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367987 (= lt!602106 (Cons!31941 (select (arr!44890 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367987 (= lt!602105 (Cons!31941 (select (arr!44890 a!3861) from!3239) acc!866))))

(declare-fun b!1367988 () Bool)

(declare-fun res!910749 () Bool)

(assert (=> b!1367988 (=> (not res!910749) (not e!775472))))

(assert (=> b!1367988 (= res!910749 (not (contains!9630 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367989 () Bool)

(declare-fun res!910755 () Bool)

(assert (=> b!1367989 (=> (not res!910755) (not e!775474))))

(assert (=> b!1367989 (= res!910755 (not (contains!9630 acc!866 (select (arr!44890 a!3861) from!3239))))))

(assert (= (and start!115768 res!910751) b!1367979))

(assert (= (and b!1367979 res!910748) b!1367986))

(assert (= (and b!1367986 res!910757) b!1367988))

(assert (= (and b!1367988 res!910749) b!1367983))

(assert (= (and b!1367983 res!910753) b!1367985))

(assert (= (and b!1367985 res!910756) b!1367982))

(assert (= (and b!1367982 res!910752) b!1367980))

(assert (= (and b!1367980 res!910754) b!1367981))

(assert (= (and b!1367981 res!910750) b!1367984))

(assert (= (and b!1367984 res!910758) b!1367989))

(assert (= (and b!1367989 res!910755) b!1367987))

(declare-fun m!1252561 () Bool)

(assert (=> b!1367989 m!1252561))

(assert (=> b!1367989 m!1252561))

(declare-fun m!1252563 () Bool)

(assert (=> b!1367989 m!1252563))

(declare-fun m!1252565 () Bool)

(assert (=> b!1367986 m!1252565))

(declare-fun m!1252567 () Bool)

(assert (=> b!1367980 m!1252567))

(declare-fun m!1252569 () Bool)

(assert (=> b!1367980 m!1252569))

(declare-fun m!1252571 () Bool)

(assert (=> b!1367985 m!1252571))

(declare-fun m!1252573 () Bool)

(assert (=> b!1367983 m!1252573))

(assert (=> b!1367984 m!1252561))

(assert (=> b!1367984 m!1252561))

(declare-fun m!1252575 () Bool)

(assert (=> b!1367984 m!1252575))

(declare-fun m!1252577 () Bool)

(assert (=> b!1367979 m!1252577))

(declare-fun m!1252579 () Bool)

(assert (=> b!1367988 m!1252579))

(declare-fun m!1252581 () Bool)

(assert (=> b!1367987 m!1252581))

(declare-fun m!1252583 () Bool)

(assert (=> b!1367987 m!1252583))

(declare-fun m!1252585 () Bool)

(assert (=> b!1367987 m!1252585))

(assert (=> b!1367987 m!1252561))

(declare-fun m!1252587 () Bool)

(assert (=> start!115768 m!1252587))

(declare-fun m!1252589 () Bool)

(assert (=> b!1367982 m!1252589))

(check-sat (not b!1367988) (not b!1367987) (not b!1367984) (not b!1367986) (not b!1367985) (not b!1367979) (not b!1367989) (not start!115768) (not b!1367983) (not b!1367982) (not b!1367980))
(check-sat)
