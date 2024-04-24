; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115708 () Bool)

(assert start!115708)

(declare-fun b!1367540 () Bool)

(declare-fun res!910349 () Bool)

(declare-fun e!775231 () Bool)

(assert (=> b!1367540 (=> (not res!910349) (not e!775231))))

(declare-datatypes ((List!31939 0))(
  ( (Nil!31936) (Cons!31935 (h!33153 (_ BitVec 64)) (t!46625 List!31939)) )
))
(declare-fun acc!866 () List!31939)

(declare-fun contains!9624 (List!31939 (_ BitVec 64)) Bool)

(assert (=> b!1367540 (= res!910349 (not (contains!9624 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367541 () Bool)

(declare-fun res!910341 () Bool)

(declare-fun e!775233 () Bool)

(assert (=> b!1367541 (=> (not res!910341) (not e!775233))))

(declare-fun lt!601987 () List!31939)

(declare-fun lt!601988 () List!31939)

(declare-fun subseq!983 (List!31939 List!31939) Bool)

(assert (=> b!1367541 (= res!910341 (subseq!983 lt!601987 lt!601988))))

(declare-fun b!1367542 () Bool)

(declare-fun res!910346 () Bool)

(assert (=> b!1367542 (=> (not res!910346) (not e!775231))))

(declare-fun newAcc!98 () List!31939)

(assert (=> b!1367542 (= res!910346 (subseq!983 newAcc!98 acc!866))))

(declare-fun b!1367543 () Bool)

(declare-fun res!910342 () Bool)

(assert (=> b!1367543 (=> (not res!910342) (not e!775231))))

(declare-fun noDuplicate!2455 (List!31939) Bool)

(assert (=> b!1367543 (= res!910342 (noDuplicate!2455 acc!866))))

(declare-fun b!1367544 () Bool)

(declare-fun res!910334 () Bool)

(declare-fun e!775232 () Bool)

(assert (=> b!1367544 (=> (not res!910334) (not e!775232))))

(declare-datatypes ((array!92920 0))(
  ( (array!92921 (arr!44884 (Array (_ BitVec 32) (_ BitVec 64))) (size!45435 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92920)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367544 (= res!910334 (not (contains!9624 acc!866 (select (arr!44884 a!3861) from!3239))))))

(declare-fun b!1367545 () Bool)

(declare-fun res!910350 () Bool)

(assert (=> b!1367545 (=> (not res!910350) (not e!775231))))

(assert (=> b!1367545 (= res!910350 (not (contains!9624 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367546 () Bool)

(declare-fun res!910348 () Bool)

(assert (=> b!1367546 (=> (not res!910348) (not e!775232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367546 (= res!910348 (validKeyInArray!0 (select (arr!44884 a!3861) from!3239)))))

(declare-fun b!1367547 () Bool)

(declare-fun res!910335 () Bool)

(assert (=> b!1367547 (=> (not res!910335) (not e!775233))))

(assert (=> b!1367547 (= res!910335 (not (contains!9624 lt!601987 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367549 () Bool)

(declare-fun res!910336 () Bool)

(assert (=> b!1367549 (=> (not res!910336) (not e!775233))))

(assert (=> b!1367549 (= res!910336 (not (contains!9624 lt!601988 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367550 () Bool)

(assert (=> b!1367550 (= e!775232 e!775233)))

(declare-fun res!910333 () Bool)

(assert (=> b!1367550 (=> (not res!910333) (not e!775233))))

(assert (=> b!1367550 (= res!910333 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1367550 (= lt!601987 (Cons!31935 (select (arr!44884 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367550 (= lt!601988 (Cons!31935 (select (arr!44884 a!3861) from!3239) acc!866))))

(declare-fun b!1367551 () Bool)

(declare-fun res!910344 () Bool)

(assert (=> b!1367551 (=> (not res!910344) (not e!775231))))

(assert (=> b!1367551 (= res!910344 (not (contains!9624 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367552 () Bool)

(assert (=> b!1367552 (= e!775233 false)))

(declare-fun lt!601985 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92920 (_ BitVec 32) List!31939) Bool)

(assert (=> b!1367552 (= lt!601985 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601988))))

(declare-datatypes ((Unit!45038 0))(
  ( (Unit!45039) )
))
(declare-fun lt!601986 () Unit!45038)

(declare-fun noDuplicateSubseq!170 (List!31939 List!31939) Unit!45038)

(assert (=> b!1367552 (= lt!601986 (noDuplicateSubseq!170 lt!601987 lt!601988))))

(declare-fun b!1367553 () Bool)

(declare-fun res!910340 () Bool)

(assert (=> b!1367553 (=> (not res!910340) (not e!775233))))

(assert (=> b!1367553 (= res!910340 (noDuplicate!2455 lt!601988))))

(declare-fun b!1367554 () Bool)

(declare-fun res!910337 () Bool)

(assert (=> b!1367554 (=> (not res!910337) (not e!775233))))

(assert (=> b!1367554 (= res!910337 (not (contains!9624 lt!601987 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367555 () Bool)

(declare-fun res!910339 () Bool)

(assert (=> b!1367555 (=> (not res!910339) (not e!775231))))

(assert (=> b!1367555 (= res!910339 (not (contains!9624 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367556 () Bool)

(declare-fun res!910343 () Bool)

(assert (=> b!1367556 (=> (not res!910343) (not e!775233))))

(assert (=> b!1367556 (= res!910343 (not (contains!9624 lt!601988 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367557 () Bool)

(declare-fun res!910338 () Bool)

(assert (=> b!1367557 (=> (not res!910338) (not e!775232))))

(assert (=> b!1367557 (= res!910338 (bvslt from!3239 (size!45435 a!3861)))))

(declare-fun b!1367548 () Bool)

(assert (=> b!1367548 (= e!775231 e!775232)))

(declare-fun res!910345 () Bool)

(assert (=> b!1367548 (=> (not res!910345) (not e!775232))))

(assert (=> b!1367548 (= res!910345 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601989 () Unit!45038)

(assert (=> b!1367548 (= lt!601989 (noDuplicateSubseq!170 newAcc!98 acc!866))))

(declare-fun res!910347 () Bool)

(assert (=> start!115708 (=> (not res!910347) (not e!775231))))

(assert (=> start!115708 (= res!910347 (and (bvslt (size!45435 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45435 a!3861))))))

(assert (=> start!115708 e!775231))

(declare-fun array_inv!34165 (array!92920) Bool)

(assert (=> start!115708 (array_inv!34165 a!3861)))

(assert (=> start!115708 true))

(assert (= (and start!115708 res!910347) b!1367543))

(assert (= (and b!1367543 res!910342) b!1367540))

(assert (= (and b!1367540 res!910349) b!1367551))

(assert (= (and b!1367551 res!910344) b!1367555))

(assert (= (and b!1367555 res!910339) b!1367545))

(assert (= (and b!1367545 res!910350) b!1367542))

(assert (= (and b!1367542 res!910346) b!1367548))

(assert (= (and b!1367548 res!910345) b!1367557))

(assert (= (and b!1367557 res!910338) b!1367546))

(assert (= (and b!1367546 res!910348) b!1367544))

(assert (= (and b!1367544 res!910334) b!1367550))

(assert (= (and b!1367550 res!910333) b!1367553))

(assert (= (and b!1367553 res!910340) b!1367549))

(assert (= (and b!1367549 res!910336) b!1367556))

(assert (= (and b!1367556 res!910343) b!1367554))

(assert (= (and b!1367554 res!910337) b!1367547))

(assert (= (and b!1367547 res!910335) b!1367541))

(assert (= (and b!1367541 res!910341) b!1367552))

(declare-fun m!1252177 () Bool)

(assert (=> b!1367547 m!1252177))

(declare-fun m!1252179 () Bool)

(assert (=> b!1367544 m!1252179))

(assert (=> b!1367544 m!1252179))

(declare-fun m!1252181 () Bool)

(assert (=> b!1367544 m!1252181))

(declare-fun m!1252183 () Bool)

(assert (=> b!1367545 m!1252183))

(declare-fun m!1252185 () Bool)

(assert (=> b!1367552 m!1252185))

(declare-fun m!1252187 () Bool)

(assert (=> b!1367552 m!1252187))

(declare-fun m!1252189 () Bool)

(assert (=> b!1367540 m!1252189))

(declare-fun m!1252191 () Bool)

(assert (=> b!1367548 m!1252191))

(declare-fun m!1252193 () Bool)

(assert (=> b!1367548 m!1252193))

(declare-fun m!1252195 () Bool)

(assert (=> start!115708 m!1252195))

(declare-fun m!1252197 () Bool)

(assert (=> b!1367554 m!1252197))

(assert (=> b!1367546 m!1252179))

(assert (=> b!1367546 m!1252179))

(declare-fun m!1252199 () Bool)

(assert (=> b!1367546 m!1252199))

(declare-fun m!1252201 () Bool)

(assert (=> b!1367543 m!1252201))

(declare-fun m!1252203 () Bool)

(assert (=> b!1367541 m!1252203))

(declare-fun m!1252205 () Bool)

(assert (=> b!1367555 m!1252205))

(assert (=> b!1367550 m!1252179))

(declare-fun m!1252207 () Bool)

(assert (=> b!1367556 m!1252207))

(declare-fun m!1252209 () Bool)

(assert (=> b!1367551 m!1252209))

(declare-fun m!1252211 () Bool)

(assert (=> b!1367553 m!1252211))

(declare-fun m!1252213 () Bool)

(assert (=> b!1367549 m!1252213))

(declare-fun m!1252215 () Bool)

(assert (=> b!1367542 m!1252215))

(check-sat (not b!1367543) (not b!1367553) (not b!1367544) (not b!1367541) (not b!1367551) (not b!1367552) (not b!1367540) (not b!1367547) (not b!1367549) (not b!1367542) (not b!1367548) (not b!1367546) (not start!115708) (not b!1367545) (not b!1367554) (not b!1367556) (not b!1367555))
(check-sat)
