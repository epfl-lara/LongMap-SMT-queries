; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115486 () Bool)

(assert start!115486)

(declare-fun res!909885 () Bool)

(declare-fun e!774403 () Bool)

(assert (=> start!115486 (=> (not res!909885) (not e!774403))))

(declare-datatypes ((array!92807 0))(
  ( (array!92808 (arr!44832 (Array (_ BitVec 32) (_ BitVec 64))) (size!45382 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92807)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115486 (= res!909885 (and (bvslt (size!45382 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45382 a!3861))))))

(assert (=> start!115486 e!774403))

(declare-fun array_inv!33860 (array!92807) Bool)

(assert (=> start!115486 (array_inv!33860 a!3861)))

(assert (=> start!115486 true))

(declare-fun b!1366295 () Bool)

(declare-fun res!909874 () Bool)

(declare-fun e!774402 () Bool)

(assert (=> b!1366295 (=> (not res!909874) (not e!774402))))

(declare-datatypes ((List!31900 0))(
  ( (Nil!31897) (Cons!31896 (h!33105 (_ BitVec 64)) (t!46594 List!31900)) )
))
(declare-fun lt!601524 () List!31900)

(declare-fun lt!601525 () List!31900)

(declare-fun subseq!984 (List!31900 List!31900) Bool)

(assert (=> b!1366295 (= res!909874 (subseq!984 lt!601524 lt!601525))))

(declare-fun b!1366296 () Bool)

(declare-fun res!909877 () Bool)

(assert (=> b!1366296 (=> (not res!909877) (not e!774402))))

(declare-fun contains!9582 (List!31900 (_ BitVec 64)) Bool)

(assert (=> b!1366296 (= res!909877 (not (contains!9582 lt!601525 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366297 () Bool)

(declare-fun res!909871 () Bool)

(assert (=> b!1366297 (=> (not res!909871) (not e!774402))))

(assert (=> b!1366297 (= res!909871 (not (contains!9582 lt!601525 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366298 () Bool)

(declare-fun res!909880 () Bool)

(assert (=> b!1366298 (=> (not res!909880) (not e!774403))))

(declare-fun acc!866 () List!31900)

(assert (=> b!1366298 (= res!909880 (not (contains!9582 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366299 () Bool)

(declare-fun e!774401 () Bool)

(assert (=> b!1366299 (= e!774403 e!774401)))

(declare-fun res!909886 () Bool)

(assert (=> b!1366299 (=> (not res!909886) (not e!774401))))

(declare-fun arrayNoDuplicates!0 (array!92807 (_ BitVec 32) List!31900) Bool)

(assert (=> b!1366299 (= res!909886 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45101 0))(
  ( (Unit!45102) )
))
(declare-fun lt!601528 () Unit!45101)

(declare-fun newAcc!98 () List!31900)

(declare-fun noDuplicateSubseq!171 (List!31900 List!31900) Unit!45101)

(assert (=> b!1366299 (= lt!601528 (noDuplicateSubseq!171 newAcc!98 acc!866))))

(declare-fun b!1366300 () Bool)

(declare-fun res!909873 () Bool)

(assert (=> b!1366300 (=> (not res!909873) (not e!774402))))

(assert (=> b!1366300 (= res!909873 (not (contains!9582 lt!601524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366301 () Bool)

(declare-fun res!909878 () Bool)

(assert (=> b!1366301 (=> (not res!909878) (not e!774403))))

(assert (=> b!1366301 (= res!909878 (not (contains!9582 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366302 () Bool)

(assert (=> b!1366302 (= e!774402 false)))

(declare-fun lt!601527 () Bool)

(assert (=> b!1366302 (= lt!601527 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601525))))

(declare-fun lt!601526 () Unit!45101)

(assert (=> b!1366302 (= lt!601526 (noDuplicateSubseq!171 lt!601524 lt!601525))))

(declare-fun b!1366303 () Bool)

(declare-fun res!909875 () Bool)

(assert (=> b!1366303 (=> (not res!909875) (not e!774401))))

(assert (=> b!1366303 (= res!909875 (not (contains!9582 acc!866 (select (arr!44832 a!3861) from!3239))))))

(declare-fun b!1366304 () Bool)

(assert (=> b!1366304 (= e!774401 e!774402)))

(declare-fun res!909876 () Bool)

(assert (=> b!1366304 (=> (not res!909876) (not e!774402))))

(assert (=> b!1366304 (= res!909876 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1366304 (= lt!601524 (Cons!31896 (select (arr!44832 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366304 (= lt!601525 (Cons!31896 (select (arr!44832 a!3861) from!3239) acc!866))))

(declare-fun b!1366305 () Bool)

(declare-fun res!909870 () Bool)

(assert (=> b!1366305 (=> (not res!909870) (not e!774403))))

(assert (=> b!1366305 (= res!909870 (not (contains!9582 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366306 () Bool)

(declare-fun res!909881 () Bool)

(assert (=> b!1366306 (=> (not res!909881) (not e!774402))))

(declare-fun noDuplicate!2439 (List!31900) Bool)

(assert (=> b!1366306 (= res!909881 (noDuplicate!2439 lt!601525))))

(declare-fun b!1366307 () Bool)

(declare-fun res!909882 () Bool)

(assert (=> b!1366307 (=> (not res!909882) (not e!774403))))

(assert (=> b!1366307 (= res!909882 (noDuplicate!2439 acc!866))))

(declare-fun b!1366308 () Bool)

(declare-fun res!909869 () Bool)

(assert (=> b!1366308 (=> (not res!909869) (not e!774401))))

(assert (=> b!1366308 (= res!909869 (bvslt from!3239 (size!45382 a!3861)))))

(declare-fun b!1366309 () Bool)

(declare-fun res!909883 () Bool)

(assert (=> b!1366309 (=> (not res!909883) (not e!774401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366309 (= res!909883 (validKeyInArray!0 (select (arr!44832 a!3861) from!3239)))))

(declare-fun b!1366310 () Bool)

(declare-fun res!909879 () Bool)

(assert (=> b!1366310 (=> (not res!909879) (not e!774402))))

(assert (=> b!1366310 (= res!909879 (not (contains!9582 lt!601524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366311 () Bool)

(declare-fun res!909884 () Bool)

(assert (=> b!1366311 (=> (not res!909884) (not e!774403))))

(assert (=> b!1366311 (= res!909884 (not (contains!9582 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366312 () Bool)

(declare-fun res!909872 () Bool)

(assert (=> b!1366312 (=> (not res!909872) (not e!774403))))

(assert (=> b!1366312 (= res!909872 (subseq!984 newAcc!98 acc!866))))

(assert (= (and start!115486 res!909885) b!1366307))

(assert (= (and b!1366307 res!909882) b!1366305))

(assert (= (and b!1366305 res!909870) b!1366298))

(assert (= (and b!1366298 res!909880) b!1366311))

(assert (= (and b!1366311 res!909884) b!1366301))

(assert (= (and b!1366301 res!909878) b!1366312))

(assert (= (and b!1366312 res!909872) b!1366299))

(assert (= (and b!1366299 res!909886) b!1366308))

(assert (= (and b!1366308 res!909869) b!1366309))

(assert (= (and b!1366309 res!909883) b!1366303))

(assert (= (and b!1366303 res!909875) b!1366304))

(assert (= (and b!1366304 res!909876) b!1366306))

(assert (= (and b!1366306 res!909881) b!1366296))

(assert (= (and b!1366296 res!909877) b!1366297))

(assert (= (and b!1366297 res!909871) b!1366310))

(assert (= (and b!1366310 res!909879) b!1366300))

(assert (= (and b!1366300 res!909873) b!1366295))

(assert (= (and b!1366295 res!909874) b!1366302))

(declare-fun m!1250621 () Bool)

(assert (=> b!1366302 m!1250621))

(declare-fun m!1250623 () Bool)

(assert (=> b!1366302 m!1250623))

(declare-fun m!1250625 () Bool)

(assert (=> b!1366298 m!1250625))

(declare-fun m!1250627 () Bool)

(assert (=> start!115486 m!1250627))

(declare-fun m!1250629 () Bool)

(assert (=> b!1366312 m!1250629))

(declare-fun m!1250631 () Bool)

(assert (=> b!1366307 m!1250631))

(declare-fun m!1250633 () Bool)

(assert (=> b!1366303 m!1250633))

(assert (=> b!1366303 m!1250633))

(declare-fun m!1250635 () Bool)

(assert (=> b!1366303 m!1250635))

(assert (=> b!1366309 m!1250633))

(assert (=> b!1366309 m!1250633))

(declare-fun m!1250637 () Bool)

(assert (=> b!1366309 m!1250637))

(declare-fun m!1250639 () Bool)

(assert (=> b!1366306 m!1250639))

(declare-fun m!1250641 () Bool)

(assert (=> b!1366310 m!1250641))

(declare-fun m!1250643 () Bool)

(assert (=> b!1366297 m!1250643))

(declare-fun m!1250645 () Bool)

(assert (=> b!1366295 m!1250645))

(declare-fun m!1250647 () Bool)

(assert (=> b!1366301 m!1250647))

(declare-fun m!1250649 () Bool)

(assert (=> b!1366300 m!1250649))

(declare-fun m!1250651 () Bool)

(assert (=> b!1366296 m!1250651))

(declare-fun m!1250653 () Bool)

(assert (=> b!1366311 m!1250653))

(declare-fun m!1250655 () Bool)

(assert (=> b!1366305 m!1250655))

(assert (=> b!1366304 m!1250633))

(declare-fun m!1250657 () Bool)

(assert (=> b!1366299 m!1250657))

(declare-fun m!1250659 () Bool)

(assert (=> b!1366299 m!1250659))

(check-sat (not b!1366295) (not b!1366302) (not b!1366299) (not b!1366305) (not start!115486) (not b!1366296) (not b!1366297) (not b!1366301) (not b!1366298) (not b!1366311) (not b!1366306) (not b!1366312) (not b!1366309) (not b!1366303) (not b!1366310) (not b!1366300) (not b!1366307))
(check-sat)
