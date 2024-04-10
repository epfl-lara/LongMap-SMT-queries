; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116134 () Bool)

(assert start!116134)

(declare-fun b!1371704 () Bool)

(declare-fun res!915076 () Bool)

(declare-fun e!777058 () Bool)

(assert (=> b!1371704 (=> (not res!915076) (not e!777058))))

(declare-datatypes ((List!32008 0))(
  ( (Nil!32005) (Cons!32004 (h!33213 (_ BitVec 64)) (t!46702 List!32008)) )
))
(declare-fun newAcc!98 () List!32008)

(declare-fun contains!9690 (List!32008 (_ BitVec 64)) Bool)

(assert (=> b!1371704 (= res!915076 (not (contains!9690 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371705 () Bool)

(declare-fun e!777057 () Bool)

(assert (=> b!1371705 (= e!777058 e!777057)))

(declare-fun res!915084 () Bool)

(assert (=> b!1371705 (=> (not res!915084) (not e!777057))))

(declare-datatypes ((array!93053 0))(
  ( (array!93054 (arr!44940 (Array (_ BitVec 32) (_ BitVec 64))) (size!45490 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93053)

(declare-fun acc!866 () List!32008)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93053 (_ BitVec 32) List!32008) Bool)

(assert (=> b!1371705 (= res!915084 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45317 0))(
  ( (Unit!45318) )
))
(declare-fun lt!602709 () Unit!45317)

(declare-fun noDuplicateSubseq!279 (List!32008 List!32008) Unit!45317)

(assert (=> b!1371705 (= lt!602709 (noDuplicateSubseq!279 newAcc!98 acc!866))))

(declare-fun b!1371706 () Bool)

(declare-fun e!777061 () Bool)

(assert (=> b!1371706 (= e!777057 e!777061)))

(declare-fun res!915075 () Bool)

(assert (=> b!1371706 (=> (not res!915075) (not e!777061))))

(assert (=> b!1371706 (= res!915075 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun lt!602707 () List!32008)

(assert (=> b!1371706 (= lt!602707 (Cons!32004 (select (arr!44940 a!3861) from!3239) newAcc!98))))

(declare-fun lt!602710 () List!32008)

(assert (=> b!1371706 (= lt!602710 (Cons!32004 (select (arr!44940 a!3861) from!3239) acc!866))))

(declare-fun b!1371707 () Bool)

(declare-fun res!915069 () Bool)

(assert (=> b!1371707 (=> (not res!915069) (not e!777061))))

(assert (=> b!1371707 (= res!915069 (not (contains!9690 lt!602707 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371708 () Bool)

(declare-fun res!915073 () Bool)

(assert (=> b!1371708 (=> (not res!915073) (not e!777061))))

(declare-fun subseq!1092 (List!32008 List!32008) Bool)

(assert (=> b!1371708 (= res!915073 (subseq!1092 lt!602707 lt!602710))))

(declare-fun b!1371709 () Bool)

(declare-fun res!915082 () Bool)

(assert (=> b!1371709 (=> (not res!915082) (not e!777058))))

(assert (=> b!1371709 (= res!915082 (not (contains!9690 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371710 () Bool)

(declare-fun res!915078 () Bool)

(assert (=> b!1371710 (=> (not res!915078) (not e!777057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371710 (= res!915078 (validKeyInArray!0 (select (arr!44940 a!3861) from!3239)))))

(declare-fun b!1371711 () Bool)

(declare-fun res!915072 () Bool)

(assert (=> b!1371711 (=> (not res!915072) (not e!777058))))

(assert (=> b!1371711 (= res!915072 (not (contains!9690 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371712 () Bool)

(declare-fun res!915070 () Bool)

(assert (=> b!1371712 (=> (not res!915070) (not e!777058))))

(assert (=> b!1371712 (= res!915070 (subseq!1092 newAcc!98 acc!866))))

(declare-fun b!1371713 () Bool)

(declare-fun res!915071 () Bool)

(assert (=> b!1371713 (=> (not res!915071) (not e!777058))))

(assert (=> b!1371713 (= res!915071 (not (contains!9690 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371714 () Bool)

(declare-fun e!777060 () Bool)

(assert (=> b!1371714 (= e!777061 e!777060)))

(declare-fun res!915083 () Bool)

(assert (=> b!1371714 (=> (not res!915083) (not e!777060))))

(assert (=> b!1371714 (= res!915083 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602710))))

(declare-fun lt!602708 () Unit!45317)

(assert (=> b!1371714 (= lt!602708 (noDuplicateSubseq!279 lt!602707 lt!602710))))

(declare-fun b!1371715 () Bool)

(declare-fun res!915081 () Bool)

(assert (=> b!1371715 (=> (not res!915081) (not e!777061))))

(assert (=> b!1371715 (= res!915081 (not (contains!9690 lt!602710 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371703 () Bool)

(declare-fun res!915068 () Bool)

(assert (=> b!1371703 (=> (not res!915068) (not e!777057))))

(assert (=> b!1371703 (= res!915068 (not (contains!9690 acc!866 (select (arr!44940 a!3861) from!3239))))))

(declare-fun res!915085 () Bool)

(assert (=> start!116134 (=> (not res!915085) (not e!777058))))

(assert (=> start!116134 (= res!915085 (and (bvslt (size!45490 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45490 a!3861))))))

(assert (=> start!116134 e!777058))

(declare-fun array_inv!33968 (array!93053) Bool)

(assert (=> start!116134 (array_inv!33968 a!3861)))

(assert (=> start!116134 true))

(declare-fun b!1371716 () Bool)

(assert (=> b!1371716 (= e!777060 (bvsge (bvsub (size!45490 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45490 a!3861) from!3239)))))

(declare-fun b!1371717 () Bool)

(declare-fun res!915067 () Bool)

(assert (=> b!1371717 (=> (not res!915067) (not e!777061))))

(assert (=> b!1371717 (= res!915067 (not (contains!9690 lt!602710 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371718 () Bool)

(declare-fun res!915077 () Bool)

(assert (=> b!1371718 (=> (not res!915077) (not e!777061))))

(declare-fun noDuplicate!2547 (List!32008) Bool)

(assert (=> b!1371718 (= res!915077 (noDuplicate!2547 lt!602710))))

(declare-fun b!1371719 () Bool)

(declare-fun res!915074 () Bool)

(assert (=> b!1371719 (=> (not res!915074) (not e!777061))))

(assert (=> b!1371719 (= res!915074 (not (contains!9690 lt!602707 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371720 () Bool)

(declare-fun res!915080 () Bool)

(assert (=> b!1371720 (=> (not res!915080) (not e!777058))))

(assert (=> b!1371720 (= res!915080 (noDuplicate!2547 acc!866))))

(declare-fun b!1371721 () Bool)

(declare-fun res!915079 () Bool)

(assert (=> b!1371721 (=> (not res!915079) (not e!777057))))

(assert (=> b!1371721 (= res!915079 (bvslt from!3239 (size!45490 a!3861)))))

(assert (= (and start!116134 res!915085) b!1371720))

(assert (= (and b!1371720 res!915080) b!1371713))

(assert (= (and b!1371713 res!915071) b!1371711))

(assert (= (and b!1371711 res!915072) b!1371709))

(assert (= (and b!1371709 res!915082) b!1371704))

(assert (= (and b!1371704 res!915076) b!1371712))

(assert (= (and b!1371712 res!915070) b!1371705))

(assert (= (and b!1371705 res!915084) b!1371721))

(assert (= (and b!1371721 res!915079) b!1371710))

(assert (= (and b!1371710 res!915078) b!1371703))

(assert (= (and b!1371703 res!915068) b!1371706))

(assert (= (and b!1371706 res!915075) b!1371718))

(assert (= (and b!1371718 res!915077) b!1371717))

(assert (= (and b!1371717 res!915067) b!1371715))

(assert (= (and b!1371715 res!915081) b!1371719))

(assert (= (and b!1371719 res!915074) b!1371707))

(assert (= (and b!1371707 res!915069) b!1371708))

(assert (= (and b!1371708 res!915073) b!1371714))

(assert (= (and b!1371714 res!915083) b!1371716))

(declare-fun m!1255127 () Bool)

(assert (=> b!1371710 m!1255127))

(assert (=> b!1371710 m!1255127))

(declare-fun m!1255129 () Bool)

(assert (=> b!1371710 m!1255129))

(declare-fun m!1255131 () Bool)

(assert (=> b!1371707 m!1255131))

(assert (=> b!1371706 m!1255127))

(declare-fun m!1255133 () Bool)

(assert (=> b!1371705 m!1255133))

(declare-fun m!1255135 () Bool)

(assert (=> b!1371705 m!1255135))

(declare-fun m!1255137 () Bool)

(assert (=> b!1371704 m!1255137))

(declare-fun m!1255139 () Bool)

(assert (=> b!1371718 m!1255139))

(assert (=> b!1371703 m!1255127))

(assert (=> b!1371703 m!1255127))

(declare-fun m!1255141 () Bool)

(assert (=> b!1371703 m!1255141))

(declare-fun m!1255143 () Bool)

(assert (=> b!1371709 m!1255143))

(declare-fun m!1255145 () Bool)

(assert (=> start!116134 m!1255145))

(declare-fun m!1255147 () Bool)

(assert (=> b!1371713 m!1255147))

(declare-fun m!1255149 () Bool)

(assert (=> b!1371719 m!1255149))

(declare-fun m!1255151 () Bool)

(assert (=> b!1371711 m!1255151))

(declare-fun m!1255153 () Bool)

(assert (=> b!1371708 m!1255153))

(declare-fun m!1255155 () Bool)

(assert (=> b!1371717 m!1255155))

(declare-fun m!1255157 () Bool)

(assert (=> b!1371712 m!1255157))

(declare-fun m!1255159 () Bool)

(assert (=> b!1371715 m!1255159))

(declare-fun m!1255161 () Bool)

(assert (=> b!1371714 m!1255161))

(declare-fun m!1255163 () Bool)

(assert (=> b!1371714 m!1255163))

(declare-fun m!1255165 () Bool)

(assert (=> b!1371720 m!1255165))

(check-sat (not b!1371718) (not b!1371704) (not b!1371720) (not b!1371711) (not b!1371709) (not b!1371714) (not b!1371719) (not b!1371717) (not b!1371712) (not b!1371710) (not start!116134) (not b!1371707) (not b!1371703) (not b!1371713) (not b!1371715) (not b!1371708) (not b!1371705))
(check-sat)
