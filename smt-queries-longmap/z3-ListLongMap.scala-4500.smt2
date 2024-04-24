; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62524 () Bool)

(assert start!62524)

(declare-fun b!702855 () Bool)

(declare-fun res!466578 () Bool)

(declare-fun e!397643 () Bool)

(assert (=> b!702855 (=> (not res!466578) (not e!397643))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-datatypes ((List!13173 0))(
  ( (Nil!13170) (Cons!13169 (h!14217 (_ BitVec 64)) (t!19447 List!13173)) )
))
(declare-fun lt!317821 () List!13173)

(declare-fun lt!317823 () List!13173)

(declare-fun -!257 (List!13173 (_ BitVec 64)) List!13173)

(assert (=> b!702855 (= res!466578 (= (-!257 lt!317821 k0!2824) lt!317823))))

(declare-fun b!702856 () Bool)

(declare-fun res!466572 () Bool)

(assert (=> b!702856 (=> (not res!466572) (not e!397643))))

(declare-fun subseq!293 (List!13173 List!13173) Bool)

(assert (=> b!702856 (= res!466572 (subseq!293 lt!317823 lt!317821))))

(declare-fun b!702858 () Bool)

(declare-fun res!466589 () Bool)

(declare-fun e!397642 () Bool)

(assert (=> b!702858 (=> (not res!466589) (not e!397642))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40143 0))(
  ( (array!40144 (arr!19225 (Array (_ BitVec 32) (_ BitVec 64))) (size!19608 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40143)

(declare-fun arrayContainsKey!0 (array!40143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702858 (= res!466589 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702859 () Bool)

(declare-fun res!466574 () Bool)

(assert (=> b!702859 (=> (not res!466574) (not e!397642))))

(declare-fun acc!652 () List!13173)

(declare-fun contains!3825 (List!13173 (_ BitVec 64)) Bool)

(assert (=> b!702859 (= res!466574 (not (contains!3825 acc!652 k0!2824)))))

(declare-fun b!702860 () Bool)

(declare-fun res!466580 () Bool)

(assert (=> b!702860 (=> (not res!466580) (not e!397643))))

(assert (=> b!702860 (= res!466580 (not (contains!3825 lt!317823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702861 () Bool)

(declare-fun res!466582 () Bool)

(assert (=> b!702861 (=> (not res!466582) (not e!397643))))

(declare-fun noDuplicate!1099 (List!13173) Bool)

(assert (=> b!702861 (= res!466582 (noDuplicate!1099 lt!317823))))

(declare-fun b!702862 () Bool)

(declare-fun res!466591 () Bool)

(assert (=> b!702862 (=> (not res!466591) (not e!397643))))

(assert (=> b!702862 (= res!466591 (not (contains!3825 lt!317821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702863 () Bool)

(declare-fun res!466588 () Bool)

(assert (=> b!702863 (=> (not res!466588) (not e!397642))))

(declare-fun newAcc!49 () List!13173)

(assert (=> b!702863 (= res!466588 (not (contains!3825 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702864 () Bool)

(assert (=> b!702864 (= e!397643 (not true))))

(declare-fun arrayNoDuplicates!0 (array!40143 (_ BitVec 32) List!13173) Bool)

(assert (=> b!702864 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317821)))

(declare-datatypes ((Unit!24573 0))(
  ( (Unit!24574) )
))
(declare-fun lt!317822 () Unit!24573)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40143 (_ BitVec 64) (_ BitVec 32) List!13173 List!13173) Unit!24573)

(assert (=> b!702864 (= lt!317822 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317823 lt!317821))))

(declare-fun b!702865 () Bool)

(declare-fun res!466590 () Bool)

(assert (=> b!702865 (=> (not res!466590) (not e!397642))))

(assert (=> b!702865 (= res!466590 (not (contains!3825 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702866 () Bool)

(declare-fun res!466592 () Bool)

(assert (=> b!702866 (=> (not res!466592) (not e!397642))))

(assert (=> b!702866 (= res!466592 (not (contains!3825 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702867 () Bool)

(declare-fun res!466583 () Bool)

(assert (=> b!702867 (=> (not res!466583) (not e!397642))))

(assert (=> b!702867 (= res!466583 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19608 a!3591)))))

(declare-fun b!702868 () Bool)

(declare-fun res!466594 () Bool)

(assert (=> b!702868 (=> (not res!466594) (not e!397642))))

(assert (=> b!702868 (= res!466594 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702869 () Bool)

(declare-fun res!466586 () Bool)

(assert (=> b!702869 (=> (not res!466586) (not e!397643))))

(assert (=> b!702869 (= res!466586 (noDuplicate!1099 lt!317821))))

(declare-fun b!702870 () Bool)

(declare-fun res!466579 () Bool)

(assert (=> b!702870 (=> (not res!466579) (not e!397643))))

(assert (=> b!702870 (= res!466579 (not (contains!3825 lt!317823 k0!2824)))))

(declare-fun b!702871 () Bool)

(assert (=> b!702871 (= e!397642 e!397643)))

(declare-fun res!466571 () Bool)

(assert (=> b!702871 (=> (not res!466571) (not e!397643))))

(assert (=> b!702871 (= res!466571 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!488 (List!13173 (_ BitVec 64)) List!13173)

(assert (=> b!702871 (= lt!317821 ($colon$colon!488 newAcc!49 (select (arr!19225 a!3591) from!2969)))))

(assert (=> b!702871 (= lt!317823 ($colon$colon!488 acc!652 (select (arr!19225 a!3591) from!2969)))))

(declare-fun b!702872 () Bool)

(declare-fun res!466576 () Bool)

(assert (=> b!702872 (=> (not res!466576) (not e!397642))))

(assert (=> b!702872 (= res!466576 (contains!3825 newAcc!49 k0!2824))))

(declare-fun b!702873 () Bool)

(declare-fun res!466585 () Bool)

(assert (=> b!702873 (=> (not res!466585) (not e!397643))))

(assert (=> b!702873 (= res!466585 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!466567 () Bool)

(assert (=> start!62524 (=> (not res!466567) (not e!397642))))

(assert (=> start!62524 (= res!466567 (and (bvslt (size!19608 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19608 a!3591))))))

(assert (=> start!62524 e!397642))

(assert (=> start!62524 true))

(declare-fun array_inv!15084 (array!40143) Bool)

(assert (=> start!62524 (array_inv!15084 a!3591)))

(declare-fun b!702857 () Bool)

(declare-fun res!466577 () Bool)

(assert (=> b!702857 (=> (not res!466577) (not e!397643))))

(assert (=> b!702857 (= res!466577 (not (contains!3825 lt!317821 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702874 () Bool)

(declare-fun res!466568 () Bool)

(assert (=> b!702874 (=> (not res!466568) (not e!397642))))

(assert (=> b!702874 (= res!466568 (subseq!293 acc!652 newAcc!49))))

(declare-fun b!702875 () Bool)

(declare-fun res!466575 () Bool)

(assert (=> b!702875 (=> (not res!466575) (not e!397643))))

(assert (=> b!702875 (= res!466575 (not (contains!3825 lt!317823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702876 () Bool)

(declare-fun res!466587 () Bool)

(assert (=> b!702876 (=> (not res!466587) (not e!397642))))

(assert (=> b!702876 (= res!466587 (noDuplicate!1099 acc!652))))

(declare-fun b!702877 () Bool)

(declare-fun res!466569 () Bool)

(assert (=> b!702877 (=> (not res!466569) (not e!397642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702877 (= res!466569 (validKeyInArray!0 (select (arr!19225 a!3591) from!2969)))))

(declare-fun b!702878 () Bool)

(declare-fun res!466570 () Bool)

(assert (=> b!702878 (=> (not res!466570) (not e!397643))))

(assert (=> b!702878 (= res!466570 (contains!3825 lt!317821 k0!2824))))

(declare-fun b!702879 () Bool)

(declare-fun res!466581 () Bool)

(assert (=> b!702879 (=> (not res!466581) (not e!397642))))

(assert (=> b!702879 (= res!466581 (validKeyInArray!0 k0!2824))))

(declare-fun b!702880 () Bool)

(declare-fun res!466593 () Bool)

(assert (=> b!702880 (=> (not res!466593) (not e!397642))))

(assert (=> b!702880 (= res!466593 (noDuplicate!1099 newAcc!49))))

(declare-fun b!702881 () Bool)

(declare-fun res!466566 () Bool)

(assert (=> b!702881 (=> (not res!466566) (not e!397642))))

(assert (=> b!702881 (= res!466566 (= (-!257 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702882 () Bool)

(declare-fun res!466584 () Bool)

(assert (=> b!702882 (=> (not res!466584) (not e!397642))))

(assert (=> b!702882 (= res!466584 (not (contains!3825 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702883 () Bool)

(declare-fun res!466573 () Bool)

(assert (=> b!702883 (=> (not res!466573) (not e!397643))))

(assert (=> b!702883 (= res!466573 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317823))))

(assert (= (and start!62524 res!466567) b!702876))

(assert (= (and b!702876 res!466587) b!702880))

(assert (= (and b!702880 res!466593) b!702882))

(assert (= (and b!702882 res!466584) b!702866))

(assert (= (and b!702866 res!466592) b!702858))

(assert (= (and b!702858 res!466589) b!702859))

(assert (= (and b!702859 res!466574) b!702879))

(assert (= (and b!702879 res!466581) b!702868))

(assert (= (and b!702868 res!466594) b!702874))

(assert (= (and b!702874 res!466568) b!702872))

(assert (= (and b!702872 res!466576) b!702881))

(assert (= (and b!702881 res!466566) b!702865))

(assert (= (and b!702865 res!466590) b!702863))

(assert (= (and b!702863 res!466588) b!702867))

(assert (= (and b!702867 res!466583) b!702877))

(assert (= (and b!702877 res!466569) b!702871))

(assert (= (and b!702871 res!466571) b!702861))

(assert (= (and b!702861 res!466582) b!702869))

(assert (= (and b!702869 res!466586) b!702875))

(assert (= (and b!702875 res!466575) b!702860))

(assert (= (and b!702860 res!466580) b!702873))

(assert (= (and b!702873 res!466585) b!702870))

(assert (= (and b!702870 res!466579) b!702883))

(assert (= (and b!702883 res!466573) b!702856))

(assert (= (and b!702856 res!466572) b!702878))

(assert (= (and b!702878 res!466570) b!702855))

(assert (= (and b!702855 res!466578) b!702862))

(assert (= (and b!702862 res!466591) b!702857))

(assert (= (and b!702857 res!466577) b!702864))

(declare-fun m!662355 () Bool)

(assert (=> b!702860 m!662355))

(declare-fun m!662357 () Bool)

(assert (=> b!702866 m!662357))

(declare-fun m!662359 () Bool)

(assert (=> b!702873 m!662359))

(declare-fun m!662361 () Bool)

(assert (=> b!702875 m!662361))

(declare-fun m!662363 () Bool)

(assert (=> b!702870 m!662363))

(declare-fun m!662365 () Bool)

(assert (=> b!702869 m!662365))

(declare-fun m!662367 () Bool)

(assert (=> b!702876 m!662367))

(declare-fun m!662369 () Bool)

(assert (=> b!702881 m!662369))

(declare-fun m!662371 () Bool)

(assert (=> b!702861 m!662371))

(declare-fun m!662373 () Bool)

(assert (=> b!702864 m!662373))

(declare-fun m!662375 () Bool)

(assert (=> b!702864 m!662375))

(declare-fun m!662377 () Bool)

(assert (=> b!702862 m!662377))

(declare-fun m!662379 () Bool)

(assert (=> b!702865 m!662379))

(declare-fun m!662381 () Bool)

(assert (=> b!702863 m!662381))

(declare-fun m!662383 () Bool)

(assert (=> start!62524 m!662383))

(declare-fun m!662385 () Bool)

(assert (=> b!702868 m!662385))

(declare-fun m!662387 () Bool)

(assert (=> b!702880 m!662387))

(declare-fun m!662389 () Bool)

(assert (=> b!702872 m!662389))

(declare-fun m!662391 () Bool)

(assert (=> b!702859 m!662391))

(declare-fun m!662393 () Bool)

(assert (=> b!702874 m!662393))

(declare-fun m!662395 () Bool)

(assert (=> b!702858 m!662395))

(declare-fun m!662397 () Bool)

(assert (=> b!702883 m!662397))

(declare-fun m!662399 () Bool)

(assert (=> b!702879 m!662399))

(declare-fun m!662401 () Bool)

(assert (=> b!702857 m!662401))

(declare-fun m!662403 () Bool)

(assert (=> b!702877 m!662403))

(assert (=> b!702877 m!662403))

(declare-fun m!662405 () Bool)

(assert (=> b!702877 m!662405))

(declare-fun m!662407 () Bool)

(assert (=> b!702878 m!662407))

(assert (=> b!702871 m!662403))

(assert (=> b!702871 m!662403))

(declare-fun m!662409 () Bool)

(assert (=> b!702871 m!662409))

(assert (=> b!702871 m!662403))

(declare-fun m!662411 () Bool)

(assert (=> b!702871 m!662411))

(declare-fun m!662413 () Bool)

(assert (=> b!702855 m!662413))

(declare-fun m!662415 () Bool)

(assert (=> b!702882 m!662415))

(declare-fun m!662417 () Bool)

(assert (=> b!702856 m!662417))

(check-sat (not start!62524) (not b!702882) (not b!702870) (not b!702856) (not b!702873) (not b!702880) (not b!702879) (not b!702864) (not b!702862) (not b!702881) (not b!702858) (not b!702871) (not b!702857) (not b!702876) (not b!702869) (not b!702872) (not b!702868) (not b!702883) (not b!702875) (not b!702877) (not b!702865) (not b!702859) (not b!702866) (not b!702860) (not b!702878) (not b!702861) (not b!702874) (not b!702863) (not b!702855))
(check-sat)
