; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116350 () Bool)

(assert start!116350)

(declare-fun b!1373288 () Bool)

(declare-fun e!777933 () Bool)

(declare-datatypes ((array!93128 0))(
  ( (array!93129 (arr!44973 (Array (_ BitVec 32) (_ BitVec 64))) (size!45523 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93128)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1373288 (= e!777933 (bvsge (bvsub (size!45523 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45523 a!3861) from!3239)))))

(declare-fun b!1373289 () Bool)

(declare-fun res!916543 () Bool)

(declare-fun e!777932 () Bool)

(assert (=> b!1373289 (=> (not res!916543) (not e!777932))))

(declare-datatypes ((List!32041 0))(
  ( (Nil!32038) (Cons!32037 (h!33246 (_ BitVec 64)) (t!46735 List!32041)) )
))
(declare-fun acc!866 () List!32041)

(declare-fun contains!9723 (List!32041 (_ BitVec 64)) Bool)

(assert (=> b!1373289 (= res!916543 (not (contains!9723 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373290 () Bool)

(declare-fun res!916541 () Bool)

(assert (=> b!1373290 (=> (not res!916541) (not e!777933))))

(assert (=> b!1373290 (= res!916541 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373291 () Bool)

(declare-fun res!916538 () Bool)

(assert (=> b!1373291 (=> (not res!916538) (not e!777933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373291 (= res!916538 (not (validKeyInArray!0 (select (arr!44973 a!3861) from!3239))))))

(declare-fun b!1373292 () Bool)

(declare-fun res!916535 () Bool)

(assert (=> b!1373292 (=> (not res!916535) (not e!777933))))

(assert (=> b!1373292 (= res!916535 (bvslt from!3239 (size!45523 a!3861)))))

(declare-fun b!1373293 () Bool)

(declare-fun res!916540 () Bool)

(assert (=> b!1373293 (=> (not res!916540) (not e!777932))))

(declare-fun noDuplicate!2580 (List!32041) Bool)

(assert (=> b!1373293 (= res!916540 (noDuplicate!2580 acc!866))))

(declare-fun b!1373294 () Bool)

(assert (=> b!1373294 (= e!777932 e!777933)))

(declare-fun res!916537 () Bool)

(assert (=> b!1373294 (=> (not res!916537) (not e!777933))))

(declare-fun arrayNoDuplicates!0 (array!93128 (_ BitVec 32) List!32041) Bool)

(assert (=> b!1373294 (= res!916537 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45383 0))(
  ( (Unit!45384) )
))
(declare-fun lt!603031 () Unit!45383)

(declare-fun newAcc!98 () List!32041)

(declare-fun noDuplicateSubseq!312 (List!32041 List!32041) Unit!45383)

(assert (=> b!1373294 (= lt!603031 (noDuplicateSubseq!312 newAcc!98 acc!866))))

(declare-fun b!1373295 () Bool)

(declare-fun res!916542 () Bool)

(assert (=> b!1373295 (=> (not res!916542) (not e!777933))))

(assert (=> b!1373295 (= res!916542 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373296 () Bool)

(declare-fun res!916534 () Bool)

(assert (=> b!1373296 (=> (not res!916534) (not e!777932))))

(assert (=> b!1373296 (= res!916534 (not (contains!9723 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373297 () Bool)

(declare-fun res!916533 () Bool)

(assert (=> b!1373297 (=> (not res!916533) (not e!777932))))

(assert (=> b!1373297 (= res!916533 (not (contains!9723 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916536 () Bool)

(assert (=> start!116350 (=> (not res!916536) (not e!777932))))

(assert (=> start!116350 (= res!916536 (and (bvslt (size!45523 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45523 a!3861))))))

(assert (=> start!116350 e!777932))

(declare-fun array_inv!34001 (array!93128) Bool)

(assert (=> start!116350 (array_inv!34001 a!3861)))

(assert (=> start!116350 true))

(declare-fun b!1373298 () Bool)

(declare-fun res!916539 () Bool)

(assert (=> b!1373298 (=> (not res!916539) (not e!777932))))

(assert (=> b!1373298 (= res!916539 (not (contains!9723 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373299 () Bool)

(declare-fun res!916532 () Bool)

(assert (=> b!1373299 (=> (not res!916532) (not e!777932))))

(declare-fun subseq!1125 (List!32041 List!32041) Bool)

(assert (=> b!1373299 (= res!916532 (subseq!1125 newAcc!98 acc!866))))

(assert (= (and start!116350 res!916536) b!1373293))

(assert (= (and b!1373293 res!916540) b!1373289))

(assert (= (and b!1373289 res!916543) b!1373298))

(assert (= (and b!1373298 res!916539) b!1373296))

(assert (= (and b!1373296 res!916534) b!1373297))

(assert (= (and b!1373297 res!916533) b!1373299))

(assert (= (and b!1373299 res!916532) b!1373294))

(assert (= (and b!1373294 res!916537) b!1373292))

(assert (= (and b!1373292 res!916535) b!1373291))

(assert (= (and b!1373291 res!916538) b!1373290))

(assert (= (and b!1373290 res!916541) b!1373295))

(assert (= (and b!1373295 res!916542) b!1373288))

(declare-fun m!1256569 () Bool)

(assert (=> b!1373291 m!1256569))

(assert (=> b!1373291 m!1256569))

(declare-fun m!1256571 () Bool)

(assert (=> b!1373291 m!1256571))

(declare-fun m!1256573 () Bool)

(assert (=> b!1373293 m!1256573))

(declare-fun m!1256575 () Bool)

(assert (=> b!1373297 m!1256575))

(declare-fun m!1256577 () Bool)

(assert (=> b!1373298 m!1256577))

(declare-fun m!1256579 () Bool)

(assert (=> b!1373294 m!1256579))

(declare-fun m!1256581 () Bool)

(assert (=> b!1373294 m!1256581))

(declare-fun m!1256583 () Bool)

(assert (=> b!1373299 m!1256583))

(declare-fun m!1256585 () Bool)

(assert (=> b!1373289 m!1256585))

(declare-fun m!1256587 () Bool)

(assert (=> b!1373296 m!1256587))

(declare-fun m!1256589 () Bool)

(assert (=> b!1373295 m!1256589))

(declare-fun m!1256591 () Bool)

(assert (=> start!116350 m!1256591))

(check-sat (not b!1373297) (not b!1373289) (not b!1373295) (not b!1373298) (not b!1373291) (not b!1373299) (not b!1373296) (not b!1373294) (not start!116350) (not b!1373293))
(check-sat)
