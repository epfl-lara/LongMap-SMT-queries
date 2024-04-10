; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115472 () Bool)

(assert start!115472)

(declare-fun b!1365917 () Bool)

(declare-fun res!909496 () Bool)

(declare-fun e!774316 () Bool)

(assert (=> b!1365917 (=> (not res!909496) (not e!774316))))

(declare-datatypes ((List!31893 0))(
  ( (Nil!31890) (Cons!31889 (h!33098 (_ BitVec 64)) (t!46587 List!31893)) )
))
(declare-fun lt!601423 () List!31893)

(declare-fun lt!601420 () List!31893)

(declare-fun subseq!977 (List!31893 List!31893) Bool)

(assert (=> b!1365917 (= res!909496 (subseq!977 lt!601423 lt!601420))))

(declare-fun b!1365918 () Bool)

(declare-fun res!909498 () Bool)

(declare-fun e!774318 () Bool)

(assert (=> b!1365918 (=> (not res!909498) (not e!774318))))

(declare-fun acc!866 () List!31893)

(declare-fun noDuplicate!2432 (List!31893) Bool)

(assert (=> b!1365918 (= res!909498 (noDuplicate!2432 acc!866))))

(declare-fun b!1365919 () Bool)

(declare-fun res!909503 () Bool)

(assert (=> b!1365919 (=> (not res!909503) (not e!774318))))

(declare-fun newAcc!98 () List!31893)

(declare-fun contains!9575 (List!31893 (_ BitVec 64)) Bool)

(assert (=> b!1365919 (= res!909503 (not (contains!9575 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365920 () Bool)

(declare-fun res!909495 () Bool)

(assert (=> b!1365920 (=> (not res!909495) (not e!774316))))

(assert (=> b!1365920 (= res!909495 (noDuplicate!2432 lt!601420))))

(declare-fun b!1365921 () Bool)

(declare-fun res!909497 () Bool)

(assert (=> b!1365921 (=> (not res!909497) (not e!774316))))

(assert (=> b!1365921 (= res!909497 (not (contains!9575 lt!601420 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365922 () Bool)

(declare-fun res!909499 () Bool)

(assert (=> b!1365922 (=> (not res!909499) (not e!774318))))

(assert (=> b!1365922 (= res!909499 (not (contains!9575 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365923 () Bool)

(declare-fun res!909501 () Bool)

(assert (=> b!1365923 (=> (not res!909501) (not e!774318))))

(assert (=> b!1365923 (= res!909501 (subseq!977 newAcc!98 acc!866))))

(declare-fun b!1365924 () Bool)

(declare-fun res!909491 () Bool)

(assert (=> b!1365924 (=> (not res!909491) (not e!774316))))

(assert (=> b!1365924 (= res!909491 (not (contains!9575 lt!601420 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365925 () Bool)

(declare-fun res!909502 () Bool)

(declare-fun e!774319 () Bool)

(assert (=> b!1365925 (=> (not res!909502) (not e!774319))))

(declare-datatypes ((array!92793 0))(
  ( (array!92794 (arr!44825 (Array (_ BitVec 32) (_ BitVec 64))) (size!45375 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92793)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365925 (= res!909502 (not (contains!9575 acc!866 (select (arr!44825 a!3861) from!3239))))))

(declare-fun b!1365926 () Bool)

(assert (=> b!1365926 (= e!774319 e!774316)))

(declare-fun res!909494 () Bool)

(assert (=> b!1365926 (=> (not res!909494) (not e!774316))))

(assert (=> b!1365926 (= res!909494 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365926 (= lt!601423 (Cons!31889 (select (arr!44825 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365926 (= lt!601420 (Cons!31889 (select (arr!44825 a!3861) from!3239) acc!866))))

(declare-fun b!1365927 () Bool)

(assert (=> b!1365927 (= e!774316 false)))

(declare-fun lt!601421 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92793 (_ BitVec 32) List!31893) Bool)

(assert (=> b!1365927 (= lt!601421 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601420))))

(declare-datatypes ((Unit!45087 0))(
  ( (Unit!45088) )
))
(declare-fun lt!601419 () Unit!45087)

(declare-fun noDuplicateSubseq!164 (List!31893 List!31893) Unit!45087)

(assert (=> b!1365927 (= lt!601419 (noDuplicateSubseq!164 lt!601423 lt!601420))))

(declare-fun b!1365928 () Bool)

(declare-fun res!909504 () Bool)

(assert (=> b!1365928 (=> (not res!909504) (not e!774316))))

(assert (=> b!1365928 (= res!909504 (not (contains!9575 lt!601423 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909506 () Bool)

(assert (=> start!115472 (=> (not res!909506) (not e!774318))))

(assert (=> start!115472 (= res!909506 (and (bvslt (size!45375 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45375 a!3861))))))

(assert (=> start!115472 e!774318))

(declare-fun array_inv!33853 (array!92793) Bool)

(assert (=> start!115472 (array_inv!33853 a!3861)))

(assert (=> start!115472 true))

(declare-fun b!1365929 () Bool)

(declare-fun res!909500 () Bool)

(assert (=> b!1365929 (=> (not res!909500) (not e!774318))))

(assert (=> b!1365929 (= res!909500 (not (contains!9575 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365930 () Bool)

(declare-fun res!909493 () Bool)

(assert (=> b!1365930 (=> (not res!909493) (not e!774319))))

(assert (=> b!1365930 (= res!909493 (bvslt from!3239 (size!45375 a!3861)))))

(declare-fun b!1365931 () Bool)

(declare-fun res!909508 () Bool)

(assert (=> b!1365931 (=> (not res!909508) (not e!774316))))

(assert (=> b!1365931 (= res!909508 (not (contains!9575 lt!601423 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365932 () Bool)

(assert (=> b!1365932 (= e!774318 e!774319)))

(declare-fun res!909505 () Bool)

(assert (=> b!1365932 (=> (not res!909505) (not e!774319))))

(assert (=> b!1365932 (= res!909505 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601422 () Unit!45087)

(assert (=> b!1365932 (= lt!601422 (noDuplicateSubseq!164 newAcc!98 acc!866))))

(declare-fun b!1365933 () Bool)

(declare-fun res!909492 () Bool)

(assert (=> b!1365933 (=> (not res!909492) (not e!774318))))

(assert (=> b!1365933 (= res!909492 (not (contains!9575 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365934 () Bool)

(declare-fun res!909507 () Bool)

(assert (=> b!1365934 (=> (not res!909507) (not e!774319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365934 (= res!909507 (validKeyInArray!0 (select (arr!44825 a!3861) from!3239)))))

(assert (= (and start!115472 res!909506) b!1365918))

(assert (= (and b!1365918 res!909498) b!1365929))

(assert (= (and b!1365929 res!909500) b!1365933))

(assert (= (and b!1365933 res!909492) b!1365919))

(assert (= (and b!1365919 res!909503) b!1365922))

(assert (= (and b!1365922 res!909499) b!1365923))

(assert (= (and b!1365923 res!909501) b!1365932))

(assert (= (and b!1365932 res!909505) b!1365930))

(assert (= (and b!1365930 res!909493) b!1365934))

(assert (= (and b!1365934 res!909507) b!1365925))

(assert (= (and b!1365925 res!909502) b!1365926))

(assert (= (and b!1365926 res!909494) b!1365920))

(assert (= (and b!1365920 res!909495) b!1365921))

(assert (= (and b!1365921 res!909497) b!1365924))

(assert (= (and b!1365924 res!909491) b!1365931))

(assert (= (and b!1365931 res!909508) b!1365928))

(assert (= (and b!1365928 res!909504) b!1365917))

(assert (= (and b!1365917 res!909496) b!1365927))

(declare-fun m!1250341 () Bool)

(assert (=> b!1365917 m!1250341))

(declare-fun m!1250343 () Bool)

(assert (=> b!1365928 m!1250343))

(declare-fun m!1250345 () Bool)

(assert (=> start!115472 m!1250345))

(declare-fun m!1250347 () Bool)

(assert (=> b!1365919 m!1250347))

(declare-fun m!1250349 () Bool)

(assert (=> b!1365922 m!1250349))

(declare-fun m!1250351 () Bool)

(assert (=> b!1365918 m!1250351))

(declare-fun m!1250353 () Bool)

(assert (=> b!1365933 m!1250353))

(declare-fun m!1250355 () Bool)

(assert (=> b!1365924 m!1250355))

(declare-fun m!1250357 () Bool)

(assert (=> b!1365923 m!1250357))

(declare-fun m!1250359 () Bool)

(assert (=> b!1365921 m!1250359))

(declare-fun m!1250361 () Bool)

(assert (=> b!1365929 m!1250361))

(declare-fun m!1250363 () Bool)

(assert (=> b!1365931 m!1250363))

(declare-fun m!1250365 () Bool)

(assert (=> b!1365934 m!1250365))

(assert (=> b!1365934 m!1250365))

(declare-fun m!1250367 () Bool)

(assert (=> b!1365934 m!1250367))

(assert (=> b!1365925 m!1250365))

(assert (=> b!1365925 m!1250365))

(declare-fun m!1250369 () Bool)

(assert (=> b!1365925 m!1250369))

(assert (=> b!1365926 m!1250365))

(declare-fun m!1250371 () Bool)

(assert (=> b!1365932 m!1250371))

(declare-fun m!1250373 () Bool)

(assert (=> b!1365932 m!1250373))

(declare-fun m!1250375 () Bool)

(assert (=> b!1365920 m!1250375))

(declare-fun m!1250377 () Bool)

(assert (=> b!1365927 m!1250377))

(declare-fun m!1250379 () Bool)

(assert (=> b!1365927 m!1250379))

(push 1)

