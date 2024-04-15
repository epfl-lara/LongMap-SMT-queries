; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115438 () Bool)

(assert start!115438)

(declare-fun b!1365197 () Bool)

(declare-fun res!908828 () Bool)

(declare-fun e!774138 () Bool)

(assert (=> b!1365197 (=> (not res!908828) (not e!774138))))

(declare-datatypes ((List!31934 0))(
  ( (Nil!31931) (Cons!31930 (h!33139 (_ BitVec 64)) (t!46620 List!31934)) )
))
(declare-fun newAcc!98 () List!31934)

(declare-fun acc!866 () List!31934)

(declare-fun subseq!965 (List!31934 List!31934) Bool)

(assert (=> b!1365197 (= res!908828 (subseq!965 newAcc!98 acc!866))))

(declare-fun b!1365198 () Bool)

(declare-fun res!908827 () Bool)

(declare-fun e!774139 () Bool)

(assert (=> b!1365198 (=> (not res!908827) (not e!774139))))

(declare-fun lt!601056 () List!31934)

(declare-fun contains!9527 (List!31934 (_ BitVec 64)) Bool)

(assert (=> b!1365198 (= res!908827 (not (contains!9527 lt!601056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365200 () Bool)

(declare-fun res!908824 () Bool)

(assert (=> b!1365200 (=> (not res!908824) (not e!774138))))

(declare-fun noDuplicate!2442 (List!31934) Bool)

(assert (=> b!1365200 (= res!908824 (noDuplicate!2442 acc!866))))

(declare-fun b!1365201 () Bool)

(declare-fun res!908814 () Bool)

(assert (=> b!1365201 (=> (not res!908814) (not e!774139))))

(declare-fun lt!601054 () List!31934)

(assert (=> b!1365201 (= res!908814 (not (contains!9527 lt!601054 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365202 () Bool)

(declare-fun res!908822 () Bool)

(assert (=> b!1365202 (=> (not res!908822) (not e!774139))))

(assert (=> b!1365202 (= res!908822 (not (contains!9527 lt!601054 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365203 () Bool)

(declare-fun res!908825 () Bool)

(assert (=> b!1365203 (=> (not res!908825) (not e!774139))))

(assert (=> b!1365203 (= res!908825 (noDuplicate!2442 lt!601056))))

(declare-fun b!1365204 () Bool)

(declare-fun res!908817 () Bool)

(declare-fun e!774140 () Bool)

(assert (=> b!1365204 (=> (not res!908817) (not e!774140))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92718 0))(
  ( (array!92719 (arr!44788 (Array (_ BitVec 32) (_ BitVec 64))) (size!45340 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92718)

(assert (=> b!1365204 (= res!908817 (bvslt from!3239 (size!45340 a!3861)))))

(declare-fun b!1365205 () Bool)

(declare-fun res!908831 () Bool)

(assert (=> b!1365205 (=> (not res!908831) (not e!774140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365205 (= res!908831 (validKeyInArray!0 (select (arr!44788 a!3861) from!3239)))))

(declare-fun b!1365206 () Bool)

(declare-fun res!908819 () Bool)

(assert (=> b!1365206 (=> (not res!908819) (not e!774139))))

(assert (=> b!1365206 (= res!908819 (subseq!965 lt!601054 lt!601056))))

(declare-fun b!1365207 () Bool)

(declare-fun res!908820 () Bool)

(assert (=> b!1365207 (=> (not res!908820) (not e!774138))))

(assert (=> b!1365207 (= res!908820 (not (contains!9527 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365208 () Bool)

(declare-fun res!908818 () Bool)

(assert (=> b!1365208 (=> (not res!908818) (not e!774138))))

(assert (=> b!1365208 (= res!908818 (not (contains!9527 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908826 () Bool)

(assert (=> start!115438 (=> (not res!908826) (not e!774138))))

(assert (=> start!115438 (= res!908826 (and (bvslt (size!45340 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45340 a!3861))))))

(assert (=> start!115438 e!774138))

(declare-fun array_inv!34021 (array!92718) Bool)

(assert (=> start!115438 (array_inv!34021 a!3861)))

(assert (=> start!115438 true))

(declare-fun b!1365199 () Bool)

(declare-fun res!908816 () Bool)

(assert (=> b!1365199 (=> (not res!908816) (not e!774140))))

(assert (=> b!1365199 (= res!908816 (not (contains!9527 acc!866 (select (arr!44788 a!3861) from!3239))))))

(declare-fun b!1365209 () Bool)

(assert (=> b!1365209 (= e!774138 e!774140)))

(declare-fun res!908823 () Bool)

(assert (=> b!1365209 (=> (not res!908823) (not e!774140))))

(declare-fun arrayNoDuplicates!0 (array!92718 (_ BitVec 32) List!31934) Bool)

(assert (=> b!1365209 (= res!908823 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!44904 0))(
  ( (Unit!44905) )
))
(declare-fun lt!601055 () Unit!44904)

(declare-fun noDuplicateSubseq!152 (List!31934 List!31934) Unit!44904)

(assert (=> b!1365209 (= lt!601055 (noDuplicateSubseq!152 newAcc!98 acc!866))))

(declare-fun b!1365210 () Bool)

(declare-fun res!908821 () Bool)

(assert (=> b!1365210 (=> (not res!908821) (not e!774139))))

(assert (=> b!1365210 (= res!908821 (not (contains!9527 lt!601056 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365211 () Bool)

(declare-fun res!908829 () Bool)

(assert (=> b!1365211 (=> (not res!908829) (not e!774138))))

(assert (=> b!1365211 (= res!908829 (not (contains!9527 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365212 () Bool)

(assert (=> b!1365212 (= e!774140 e!774139)))

(declare-fun res!908830 () Bool)

(assert (=> b!1365212 (=> (not res!908830) (not e!774139))))

(assert (=> b!1365212 (= res!908830 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1365212 (= lt!601054 (Cons!31930 (select (arr!44788 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365212 (= lt!601056 (Cons!31930 (select (arr!44788 a!3861) from!3239) acc!866))))

(declare-fun b!1365213 () Bool)

(declare-fun res!908815 () Bool)

(assert (=> b!1365213 (=> (not res!908815) (not e!774138))))

(assert (=> b!1365213 (= res!908815 (not (contains!9527 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365214 () Bool)

(assert (=> b!1365214 (= e!774139 false)))

(declare-fun lt!601052 () Bool)

(assert (=> b!1365214 (= lt!601052 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601056))))

(declare-fun lt!601053 () Unit!44904)

(assert (=> b!1365214 (= lt!601053 (noDuplicateSubseq!152 lt!601054 lt!601056))))

(assert (= (and start!115438 res!908826) b!1365200))

(assert (= (and b!1365200 res!908824) b!1365207))

(assert (= (and b!1365207 res!908820) b!1365211))

(assert (= (and b!1365211 res!908829) b!1365208))

(assert (= (and b!1365208 res!908818) b!1365213))

(assert (= (and b!1365213 res!908815) b!1365197))

(assert (= (and b!1365197 res!908828) b!1365209))

(assert (= (and b!1365209 res!908823) b!1365204))

(assert (= (and b!1365204 res!908817) b!1365205))

(assert (= (and b!1365205 res!908831) b!1365199))

(assert (= (and b!1365199 res!908816) b!1365212))

(assert (= (and b!1365212 res!908830) b!1365203))

(assert (= (and b!1365203 res!908825) b!1365198))

(assert (= (and b!1365198 res!908827) b!1365210))

(assert (= (and b!1365210 res!908821) b!1365201))

(assert (= (and b!1365201 res!908814) b!1365202))

(assert (= (and b!1365202 res!908822) b!1365206))

(assert (= (and b!1365206 res!908819) b!1365214))

(declare-fun m!1249335 () Bool)

(assert (=> b!1365202 m!1249335))

(declare-fun m!1249337 () Bool)

(assert (=> b!1365197 m!1249337))

(declare-fun m!1249339 () Bool)

(assert (=> start!115438 m!1249339))

(declare-fun m!1249341 () Bool)

(assert (=> b!1365211 m!1249341))

(declare-fun m!1249343 () Bool)

(assert (=> b!1365203 m!1249343))

(declare-fun m!1249345 () Bool)

(assert (=> b!1365213 m!1249345))

(declare-fun m!1249347 () Bool)

(assert (=> b!1365210 m!1249347))

(declare-fun m!1249349 () Bool)

(assert (=> b!1365214 m!1249349))

(declare-fun m!1249351 () Bool)

(assert (=> b!1365214 m!1249351))

(declare-fun m!1249353 () Bool)

(assert (=> b!1365207 m!1249353))

(declare-fun m!1249355 () Bool)

(assert (=> b!1365205 m!1249355))

(assert (=> b!1365205 m!1249355))

(declare-fun m!1249357 () Bool)

(assert (=> b!1365205 m!1249357))

(assert (=> b!1365199 m!1249355))

(assert (=> b!1365199 m!1249355))

(declare-fun m!1249359 () Bool)

(assert (=> b!1365199 m!1249359))

(assert (=> b!1365212 m!1249355))

(declare-fun m!1249361 () Bool)

(assert (=> b!1365200 m!1249361))

(declare-fun m!1249363 () Bool)

(assert (=> b!1365209 m!1249363))

(declare-fun m!1249365 () Bool)

(assert (=> b!1365209 m!1249365))

(declare-fun m!1249367 () Bool)

(assert (=> b!1365201 m!1249367))

(declare-fun m!1249369 () Bool)

(assert (=> b!1365208 m!1249369))

(declare-fun m!1249371 () Bool)

(assert (=> b!1365206 m!1249371))

(declare-fun m!1249373 () Bool)

(assert (=> b!1365198 m!1249373))

(check-sat (not b!1365197) (not b!1365198) (not b!1365209) (not b!1365207) (not b!1365210) (not b!1365208) (not b!1365201) (not b!1365202) (not b!1365213) (not b!1365214) (not b!1365211) (not b!1365205) (not start!115438) (not b!1365206) (not b!1365203) (not b!1365200) (not b!1365199))
(check-sat)
