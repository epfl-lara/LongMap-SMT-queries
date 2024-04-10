; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62964 () Bool)

(assert start!62964)

(declare-fun b!709726 () Bool)

(declare-fun res!473219 () Bool)

(declare-fun e!399418 () Bool)

(assert (=> b!709726 (=> (not res!473219) (not e!399418))))

(declare-datatypes ((array!40380 0))(
  ( (array!40381 (arr!19339 (Array (_ BitVec 32) (_ BitVec 64))) (size!19735 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40380)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709726 (= res!473219 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709728 () Bool)

(declare-fun res!473218 () Bool)

(declare-fun e!399419 () Bool)

(assert (=> b!709728 (=> (not res!473218) (not e!399419))))

(declare-datatypes ((List!13380 0))(
  ( (Nil!13377) (Cons!13376 (h!14421 (_ BitVec 64)) (t!19677 List!13380)) )
))
(declare-fun lt!318259 () List!13380)

(declare-fun contains!3957 (List!13380 (_ BitVec 64)) Bool)

(assert (=> b!709728 (= res!473218 (not (contains!3957 lt!318259 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709729 () Bool)

(assert (=> b!709729 (= e!399418 e!399419)))

(declare-fun res!473229 () Bool)

(assert (=> b!709729 (=> (not res!473229) (not e!399419))))

(assert (=> b!709729 (= res!473229 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun acc!652 () List!13380)

(declare-fun $colon$colon!513 (List!13380 (_ BitVec 64)) List!13380)

(assert (=> b!709729 (= lt!318259 ($colon$colon!513 acc!652 (select (arr!19339 a!3591) from!2969)))))

(declare-fun b!709730 () Bool)

(declare-fun res!473225 () Bool)

(assert (=> b!709730 (=> (not res!473225) (not e!399419))))

(declare-fun noDuplicate!1204 (List!13380) Bool)

(assert (=> b!709730 (= res!473225 (noDuplicate!1204 lt!318259))))

(declare-fun b!709731 () Bool)

(declare-fun res!473235 () Bool)

(assert (=> b!709731 (=> (not res!473235) (not e!399418))))

(declare-fun newAcc!49 () List!13380)

(assert (=> b!709731 (= res!473235 (noDuplicate!1204 newAcc!49))))

(declare-fun b!709732 () Bool)

(declare-fun res!473239 () Bool)

(assert (=> b!709732 (=> (not res!473239) (not e!399418))))

(assert (=> b!709732 (= res!473239 (not (contains!3957 acc!652 k0!2824)))))

(declare-fun b!709733 () Bool)

(declare-fun res!473223 () Bool)

(assert (=> b!709733 (=> (not res!473223) (not e!399418))))

(assert (=> b!709733 (= res!473223 (not (contains!3957 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709734 () Bool)

(declare-fun res!473236 () Bool)

(assert (=> b!709734 (=> (not res!473236) (not e!399418))))

(assert (=> b!709734 (= res!473236 (not (contains!3957 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709735 () Bool)

(declare-fun res!473232 () Bool)

(assert (=> b!709735 (=> (not res!473232) (not e!399418))))

(assert (=> b!709735 (= res!473232 (not (contains!3957 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709736 () Bool)

(declare-fun res!473222 () Bool)

(assert (=> b!709736 (=> (not res!473222) (not e!399419))))

(assert (=> b!709736 (= res!473222 (noDuplicate!1204 ($colon$colon!513 newAcc!49 (select (arr!19339 a!3591) from!2969))))))

(declare-fun b!709737 () Bool)

(declare-fun res!473238 () Bool)

(assert (=> b!709737 (=> (not res!473238) (not e!399418))))

(assert (=> b!709737 (= res!473238 (noDuplicate!1204 acc!652))))

(declare-fun b!709738 () Bool)

(declare-fun res!473224 () Bool)

(assert (=> b!709738 (=> (not res!473224) (not e!399418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709738 (= res!473224 (validKeyInArray!0 (select (arr!19339 a!3591) from!2969)))))

(declare-fun b!709727 () Bool)

(declare-fun res!473237 () Bool)

(assert (=> b!709727 (=> (not res!473237) (not e!399419))))

(assert (=> b!709727 (= res!473237 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!473231 () Bool)

(assert (=> start!62964 (=> (not res!473231) (not e!399418))))

(assert (=> start!62964 (= res!473231 (and (bvslt (size!19735 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19735 a!3591))))))

(assert (=> start!62964 e!399418))

(assert (=> start!62964 true))

(declare-fun array_inv!15135 (array!40380) Bool)

(assert (=> start!62964 (array_inv!15135 a!3591)))

(declare-fun b!709739 () Bool)

(assert (=> b!709739 (= e!399419 false)))

(declare-fun lt!318260 () Bool)

(assert (=> b!709739 (= lt!318260 (contains!3957 lt!318259 k0!2824))))

(declare-fun b!709740 () Bool)

(declare-fun res!473234 () Bool)

(assert (=> b!709740 (=> (not res!473234) (not e!399418))))

(declare-fun -!367 (List!13380 (_ BitVec 64)) List!13380)

(assert (=> b!709740 (= res!473234 (= (-!367 newAcc!49 k0!2824) acc!652))))

(declare-fun b!709741 () Bool)

(declare-fun res!473233 () Bool)

(assert (=> b!709741 (=> (not res!473233) (not e!399418))))

(assert (=> b!709741 (= res!473233 (contains!3957 newAcc!49 k0!2824))))

(declare-fun b!709742 () Bool)

(declare-fun res!473226 () Bool)

(assert (=> b!709742 (=> (not res!473226) (not e!399419))))

(assert (=> b!709742 (= res!473226 (not (contains!3957 lt!318259 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709743 () Bool)

(declare-fun res!473227 () Bool)

(assert (=> b!709743 (=> (not res!473227) (not e!399418))))

(declare-fun arrayNoDuplicates!0 (array!40380 (_ BitVec 32) List!13380) Bool)

(assert (=> b!709743 (= res!473227 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709744 () Bool)

(declare-fun res!473220 () Bool)

(assert (=> b!709744 (=> (not res!473220) (not e!399418))))

(assert (=> b!709744 (= res!473220 (not (contains!3957 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709745 () Bool)

(declare-fun res!473228 () Bool)

(assert (=> b!709745 (=> (not res!473228) (not e!399418))))

(assert (=> b!709745 (= res!473228 (validKeyInArray!0 k0!2824))))

(declare-fun b!709746 () Bool)

(declare-fun res!473221 () Bool)

(assert (=> b!709746 (=> (not res!473221) (not e!399418))))

(declare-fun subseq!402 (List!13380 List!13380) Bool)

(assert (=> b!709746 (= res!473221 (subseq!402 acc!652 newAcc!49))))

(declare-fun b!709747 () Bool)

(declare-fun res!473230 () Bool)

(assert (=> b!709747 (=> (not res!473230) (not e!399418))))

(assert (=> b!709747 (= res!473230 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19735 a!3591)))))

(assert (= (and start!62964 res!473231) b!709737))

(assert (= (and b!709737 res!473238) b!709731))

(assert (= (and b!709731 res!473235) b!709734))

(assert (= (and b!709734 res!473236) b!709744))

(assert (= (and b!709744 res!473220) b!709726))

(assert (= (and b!709726 res!473219) b!709732))

(assert (= (and b!709732 res!473239) b!709745))

(assert (= (and b!709745 res!473228) b!709743))

(assert (= (and b!709743 res!473227) b!709746))

(assert (= (and b!709746 res!473221) b!709741))

(assert (= (and b!709741 res!473233) b!709740))

(assert (= (and b!709740 res!473234) b!709733))

(assert (= (and b!709733 res!473223) b!709735))

(assert (= (and b!709735 res!473232) b!709747))

(assert (= (and b!709747 res!473230) b!709738))

(assert (= (and b!709738 res!473224) b!709729))

(assert (= (and b!709729 res!473229) b!709730))

(assert (= (and b!709730 res!473225) b!709736))

(assert (= (and b!709736 res!473222) b!709742))

(assert (= (and b!709742 res!473226) b!709728))

(assert (= (and b!709728 res!473218) b!709727))

(assert (= (and b!709727 res!473237) b!709739))

(declare-fun m!666979 () Bool)

(assert (=> b!709741 m!666979))

(declare-fun m!666981 () Bool)

(assert (=> b!709726 m!666981))

(declare-fun m!666983 () Bool)

(assert (=> b!709745 m!666983))

(declare-fun m!666985 () Bool)

(assert (=> b!709742 m!666985))

(declare-fun m!666987 () Bool)

(assert (=> b!709736 m!666987))

(assert (=> b!709736 m!666987))

(declare-fun m!666989 () Bool)

(assert (=> b!709736 m!666989))

(assert (=> b!709736 m!666989))

(declare-fun m!666991 () Bool)

(assert (=> b!709736 m!666991))

(declare-fun m!666993 () Bool)

(assert (=> b!709731 m!666993))

(declare-fun m!666995 () Bool)

(assert (=> b!709727 m!666995))

(declare-fun m!666997 () Bool)

(assert (=> b!709734 m!666997))

(assert (=> b!709738 m!666987))

(assert (=> b!709738 m!666987))

(declare-fun m!666999 () Bool)

(assert (=> b!709738 m!666999))

(declare-fun m!667001 () Bool)

(assert (=> b!709743 m!667001))

(declare-fun m!667003 () Bool)

(assert (=> b!709737 m!667003))

(declare-fun m!667005 () Bool)

(assert (=> b!709730 m!667005))

(declare-fun m!667007 () Bool)

(assert (=> b!709746 m!667007))

(declare-fun m!667009 () Bool)

(assert (=> b!709728 m!667009))

(declare-fun m!667011 () Bool)

(assert (=> b!709740 m!667011))

(declare-fun m!667013 () Bool)

(assert (=> b!709744 m!667013))

(declare-fun m!667015 () Bool)

(assert (=> b!709733 m!667015))

(declare-fun m!667017 () Bool)

(assert (=> b!709732 m!667017))

(declare-fun m!667019 () Bool)

(assert (=> b!709739 m!667019))

(declare-fun m!667021 () Bool)

(assert (=> start!62964 m!667021))

(assert (=> b!709729 m!666987))

(assert (=> b!709729 m!666987))

(declare-fun m!667023 () Bool)

(assert (=> b!709729 m!667023))

(declare-fun m!667025 () Bool)

(assert (=> b!709735 m!667025))

(check-sat (not b!709726) (not b!709729) (not b!709731) (not b!709728) (not b!709734) (not b!709744) (not b!709733) (not b!709741) (not b!709735) (not start!62964) (not b!709739) (not b!709746) (not b!709732) (not b!709745) (not b!709738) (not b!709736) (not b!709743) (not b!709737) (not b!709740) (not b!709727) (not b!709742) (not b!709730))
(check-sat)
