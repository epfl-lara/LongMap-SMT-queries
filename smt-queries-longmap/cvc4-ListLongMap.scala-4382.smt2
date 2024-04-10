; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60324 () Bool)

(assert start!60324)

(declare-fun b!677580 () Bool)

(declare-fun e!386236 () Bool)

(assert (=> b!677580 (= e!386236 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12919 0))(
  ( (Nil!12916) (Cons!12915 (h!13960 (_ BitVec 64)) (t!19147 List!12919)) )
))
(declare-fun acc!681 () List!12919)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39371 0))(
  ( (array!39372 (arr!18878 (Array (_ BitVec 32) (_ BitVec 64))) (size!19242 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39371)

(declare-fun arrayNoDuplicates!0 (array!39371 (_ BitVec 32) List!12919) Bool)

(assert (=> b!677580 (arrayNoDuplicates!0 (array!39372 (store (arr!18878 a!3626) i!1382 k!2843) (size!19242 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23776 0))(
  ( (Unit!23777) )
))
(declare-fun lt!312832 () Unit!23776)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12919) Unit!23776)

(assert (=> b!677580 (= lt!312832 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677581 () Bool)

(declare-fun e!386234 () Bool)

(declare-fun contains!3496 (List!12919 (_ BitVec 64)) Bool)

(assert (=> b!677581 (= e!386234 (not (contains!3496 acc!681 k!2843)))))

(declare-fun b!677582 () Bool)

(declare-fun res!444012 () Bool)

(assert (=> b!677582 (=> (not res!444012) (not e!386236))))

(declare-fun e!386238 () Bool)

(assert (=> b!677582 (= res!444012 e!386238)))

(declare-fun res!444023 () Bool)

(assert (=> b!677582 (=> res!444023 e!386238)))

(declare-fun e!386235 () Bool)

(assert (=> b!677582 (= res!444023 e!386235)))

(declare-fun res!444009 () Bool)

(assert (=> b!677582 (=> (not res!444009) (not e!386235))))

(assert (=> b!677582 (= res!444009 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677583 () Bool)

(declare-fun e!386237 () Bool)

(assert (=> b!677583 (= e!386237 e!386234)))

(declare-fun res!444018 () Bool)

(assert (=> b!677583 (=> (not res!444018) (not e!386234))))

(assert (=> b!677583 (= res!444018 (bvsle from!3004 i!1382))))

(declare-fun b!677584 () Bool)

(assert (=> b!677584 (= e!386235 (contains!3496 acc!681 k!2843))))

(declare-fun b!677585 () Bool)

(declare-fun e!386232 () Bool)

(assert (=> b!677585 (= e!386238 e!386232)))

(declare-fun res!444010 () Bool)

(assert (=> b!677585 (=> (not res!444010) (not e!386232))))

(assert (=> b!677585 (= res!444010 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677586 () Bool)

(declare-fun res!444022 () Bool)

(assert (=> b!677586 (=> (not res!444022) (not e!386236))))

(declare-fun noDuplicate!743 (List!12919) Bool)

(assert (=> b!677586 (= res!444022 (noDuplicate!743 acc!681))))

(declare-fun b!677587 () Bool)

(declare-fun res!444007 () Bool)

(assert (=> b!677587 (=> (not res!444007) (not e!386236))))

(assert (=> b!677587 (= res!444007 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677588 () Bool)

(declare-fun res!444008 () Bool)

(assert (=> b!677588 (=> (not res!444008) (not e!386236))))

(assert (=> b!677588 (= res!444008 (not (contains!3496 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677590 () Bool)

(declare-fun res!444015 () Bool)

(assert (=> b!677590 (=> (not res!444015) (not e!386236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677590 (= res!444015 (not (validKeyInArray!0 (select (arr!18878 a!3626) from!3004))))))

(declare-fun b!677591 () Bool)

(declare-fun e!386233 () Bool)

(assert (=> b!677591 (= e!386233 (contains!3496 acc!681 k!2843))))

(declare-fun b!677592 () Bool)

(declare-fun res!444016 () Bool)

(assert (=> b!677592 (=> (not res!444016) (not e!386236))))

(assert (=> b!677592 (= res!444016 (validKeyInArray!0 k!2843))))

(declare-fun b!677593 () Bool)

(assert (=> b!677593 (= e!386232 (not (contains!3496 acc!681 k!2843)))))

(declare-fun b!677594 () Bool)

(declare-fun res!444025 () Bool)

(assert (=> b!677594 (=> (not res!444025) (not e!386236))))

(assert (=> b!677594 (= res!444025 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19242 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677595 () Bool)

(declare-fun res!444014 () Bool)

(assert (=> b!677595 (=> (not res!444014) (not e!386236))))

(assert (=> b!677595 (= res!444014 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19242 a!3626))))))

(declare-fun b!677596 () Bool)

(declare-fun res!444026 () Bool)

(assert (=> b!677596 (=> (not res!444026) (not e!386236))))

(assert (=> b!677596 (= res!444026 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!444017 () Bool)

(assert (=> start!60324 (=> (not res!444017) (not e!386236))))

(assert (=> start!60324 (= res!444017 (and (bvslt (size!19242 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19242 a!3626))))))

(assert (=> start!60324 e!386236))

(assert (=> start!60324 true))

(declare-fun array_inv!14674 (array!39371) Bool)

(assert (=> start!60324 (array_inv!14674 a!3626)))

(declare-fun b!677589 () Bool)

(declare-fun res!444019 () Bool)

(assert (=> b!677589 (=> (not res!444019) (not e!386236))))

(declare-fun arrayContainsKey!0 (array!39371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677589 (= res!444019 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677597 () Bool)

(declare-fun res!444013 () Bool)

(assert (=> b!677597 (=> (not res!444013) (not e!386236))))

(assert (=> b!677597 (= res!444013 (not (contains!3496 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677598 () Bool)

(declare-fun res!444020 () Bool)

(assert (=> b!677598 (=> (not res!444020) (not e!386236))))

(assert (=> b!677598 (= res!444020 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12916))))

(declare-fun b!677599 () Bool)

(declare-fun res!444021 () Bool)

(assert (=> b!677599 (=> (not res!444021) (not e!386236))))

(assert (=> b!677599 (= res!444021 e!386237)))

(declare-fun res!444024 () Bool)

(assert (=> b!677599 (=> res!444024 e!386237)))

(assert (=> b!677599 (= res!444024 e!386233)))

(declare-fun res!444006 () Bool)

(assert (=> b!677599 (=> (not res!444006) (not e!386233))))

(assert (=> b!677599 (= res!444006 (bvsgt from!3004 i!1382))))

(declare-fun b!677600 () Bool)

(declare-fun res!444011 () Bool)

(assert (=> b!677600 (=> (not res!444011) (not e!386236))))

(assert (=> b!677600 (= res!444011 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!60324 res!444017) b!677586))

(assert (= (and b!677586 res!444022) b!677588))

(assert (= (and b!677588 res!444008) b!677597))

(assert (= (and b!677597 res!444013) b!677599))

(assert (= (and b!677599 res!444006) b!677591))

(assert (= (and b!677599 (not res!444024)) b!677583))

(assert (= (and b!677583 res!444018) b!677581))

(assert (= (and b!677599 res!444021) b!677598))

(assert (= (and b!677598 res!444020) b!677596))

(assert (= (and b!677596 res!444026) b!677595))

(assert (= (and b!677595 res!444014) b!677592))

(assert (= (and b!677592 res!444016) b!677589))

(assert (= (and b!677589 res!444019) b!677594))

(assert (= (and b!677594 res!444025) b!677590))

(assert (= (and b!677590 res!444015) b!677587))

(assert (= (and b!677587 res!444007) b!677582))

(assert (= (and b!677582 res!444009) b!677584))

(assert (= (and b!677582 (not res!444023)) b!677585))

(assert (= (and b!677585 res!444010) b!677593))

(assert (= (and b!677582 res!444012) b!677600))

(assert (= (and b!677600 res!444011) b!677580))

(declare-fun m!643787 () Bool)

(assert (=> b!677590 m!643787))

(assert (=> b!677590 m!643787))

(declare-fun m!643789 () Bool)

(assert (=> b!677590 m!643789))

(declare-fun m!643791 () Bool)

(assert (=> b!677597 m!643791))

(declare-fun m!643793 () Bool)

(assert (=> b!677580 m!643793))

(declare-fun m!643795 () Bool)

(assert (=> b!677580 m!643795))

(declare-fun m!643797 () Bool)

(assert (=> b!677580 m!643797))

(declare-fun m!643799 () Bool)

(assert (=> b!677586 m!643799))

(declare-fun m!643801 () Bool)

(assert (=> b!677581 m!643801))

(declare-fun m!643803 () Bool)

(assert (=> b!677589 m!643803))

(declare-fun m!643805 () Bool)

(assert (=> b!677588 m!643805))

(assert (=> b!677584 m!643801))

(assert (=> b!677593 m!643801))

(declare-fun m!643807 () Bool)

(assert (=> b!677592 m!643807))

(declare-fun m!643809 () Bool)

(assert (=> b!677598 m!643809))

(declare-fun m!643811 () Bool)

(assert (=> b!677600 m!643811))

(assert (=> b!677591 m!643801))

(declare-fun m!643813 () Bool)

(assert (=> start!60324 m!643813))

(declare-fun m!643815 () Bool)

(assert (=> b!677596 m!643815))

(push 1)

(assert (not b!677588))

(assert (not b!677598))

(assert (not b!677597))

(assert (not b!677584))

(assert (not b!677591))

(assert (not b!677586))

(assert (not b!677593))

(assert (not b!677581))

(assert (not b!677596))

(assert (not b!677590))

(assert (not b!677580))

(assert (not start!60324))

(assert (not b!677600))

(assert (not b!677589))

(assert (not b!677592))

(check-sat)

