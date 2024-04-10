; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62044 () Bool)

(assert start!62044)

(declare-fun b!694542 () Bool)

(declare-fun e!395081 () Bool)

(declare-datatypes ((List!13146 0))(
  ( (Nil!13143) (Cons!13142 (h!14187 (_ BitVec 64)) (t!19425 List!13146)) )
))
(declare-fun acc!681 () List!13146)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3723 (List!13146 (_ BitVec 64)) Bool)

(assert (=> b!694542 (= e!395081 (not (contains!3723 acc!681 k0!2843)))))

(declare-fun b!694543 () Bool)

(declare-fun res!458600 () Bool)

(declare-fun e!395079 () Bool)

(assert (=> b!694543 (=> (not res!458600) (not e!395079))))

(declare-fun e!395083 () Bool)

(assert (=> b!694543 (= res!458600 e!395083)))

(declare-fun res!458588 () Bool)

(assert (=> b!694543 (=> res!458588 e!395083)))

(declare-fun e!395085 () Bool)

(assert (=> b!694543 (= res!458588 e!395085)))

(declare-fun res!458577 () Bool)

(assert (=> b!694543 (=> (not res!458577) (not e!395085))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694543 (= res!458577 (bvsgt from!3004 i!1382))))

(declare-fun b!694544 () Bool)

(declare-fun e!395076 () Bool)

(declare-fun lt!316918 () List!13146)

(assert (=> b!694544 (= e!395076 (not (contains!3723 lt!316918 k0!2843)))))

(declare-fun b!694545 () Bool)

(declare-fun e!395082 () Bool)

(declare-datatypes ((array!39885 0))(
  ( (array!39886 (arr!19105 (Array (_ BitVec 32) (_ BitVec 64))) (size!19490 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39885)

(assert (=> b!694545 (= e!395082 (bvsge (bvsub (size!19490 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19490 a!3626) from!3004)))))

(declare-fun b!694546 () Bool)

(declare-fun e!395075 () Bool)

(assert (=> b!694546 (= e!395075 e!395076)))

(declare-fun res!458589 () Bool)

(assert (=> b!694546 (=> (not res!458589) (not e!395076))))

(assert (=> b!694546 (= res!458589 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694547 () Bool)

(declare-fun res!458582 () Bool)

(assert (=> b!694547 (=> (not res!458582) (not e!395079))))

(declare-fun arrayNoDuplicates!0 (array!39885 (_ BitVec 32) List!13146) Bool)

(assert (=> b!694547 (= res!458582 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13143))))

(declare-fun b!694548 () Bool)

(declare-fun res!458583 () Bool)

(assert (=> b!694548 (=> (not res!458583) (not e!395082))))

(assert (=> b!694548 (= res!458583 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316918))))

(declare-fun b!694549 () Bool)

(declare-fun res!458579 () Bool)

(assert (=> b!694549 (=> (not res!458579) (not e!395079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694549 (= res!458579 (validKeyInArray!0 k0!2843))))

(declare-fun b!694550 () Bool)

(declare-fun e!395084 () Bool)

(assert (=> b!694550 (= e!395079 e!395084)))

(declare-fun res!458580 () Bool)

(assert (=> b!694550 (=> (not res!458580) (not e!395084))))

(assert (=> b!694550 (= res!458580 (not (= (select (arr!19105 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24538 0))(
  ( (Unit!24539) )
))
(declare-fun lt!316916 () Unit!24538)

(declare-fun e!395080 () Unit!24538)

(assert (=> b!694550 (= lt!316916 e!395080)))

(declare-fun c!78350 () Bool)

(assert (=> b!694550 (= c!78350 (= (select (arr!19105 a!3626) from!3004) k0!2843))))

(declare-fun b!694551 () Bool)

(declare-fun e!395078 () Bool)

(assert (=> b!694551 (= e!395078 (contains!3723 lt!316918 k0!2843))))

(declare-fun b!694552 () Bool)

(assert (=> b!694552 (= e!395083 e!395081)))

(declare-fun res!458587 () Bool)

(assert (=> b!694552 (=> (not res!458587) (not e!395081))))

(assert (=> b!694552 (= res!458587 (bvsle from!3004 i!1382))))

(declare-fun b!694553 () Bool)

(declare-fun Unit!24540 () Unit!24538)

(assert (=> b!694553 (= e!395080 Unit!24540)))

(declare-fun arrayContainsKey!0 (array!39885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694553 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316917 () Unit!24538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39885 (_ BitVec 64) (_ BitVec 32)) Unit!24538)

(assert (=> b!694553 (= lt!316917 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694553 false))

(declare-fun b!694554 () Bool)

(declare-fun res!458592 () Bool)

(assert (=> b!694554 (=> (not res!458592) (not e!395082))))

(declare-fun noDuplicate!970 (List!13146) Bool)

(assert (=> b!694554 (= res!458592 (noDuplicate!970 lt!316918))))

(declare-fun res!458598 () Bool)

(assert (=> start!62044 (=> (not res!458598) (not e!395079))))

(assert (=> start!62044 (= res!458598 (and (bvslt (size!19490 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19490 a!3626))))))

(assert (=> start!62044 e!395079))

(assert (=> start!62044 true))

(declare-fun array_inv!14901 (array!39885) Bool)

(assert (=> start!62044 (array_inv!14901 a!3626)))

(declare-fun b!694555 () Bool)

(declare-fun res!458581 () Bool)

(assert (=> b!694555 (=> (not res!458581) (not e!395082))))

(assert (=> b!694555 (= res!458581 e!395075)))

(declare-fun res!458591 () Bool)

(assert (=> b!694555 (=> res!458591 e!395075)))

(assert (=> b!694555 (= res!458591 e!395078)))

(declare-fun res!458593 () Bool)

(assert (=> b!694555 (=> (not res!458593) (not e!395078))))

(assert (=> b!694555 (= res!458593 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694556 () Bool)

(declare-fun res!458596 () Bool)

(assert (=> b!694556 (=> (not res!458596) (not e!395079))))

(assert (=> b!694556 (= res!458596 (validKeyInArray!0 (select (arr!19105 a!3626) from!3004)))))

(declare-fun b!694557 () Bool)

(assert (=> b!694557 (= e!395085 (contains!3723 acc!681 k0!2843))))

(declare-fun b!694558 () Bool)

(declare-fun res!458594 () Bool)

(assert (=> b!694558 (=> (not res!458594) (not e!395082))))

(assert (=> b!694558 (= res!458594 (not (contains!3723 lt!316918 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694559 () Bool)

(declare-fun res!458585 () Bool)

(assert (=> b!694559 (=> (not res!458585) (not e!395082))))

(assert (=> b!694559 (= res!458585 (not (contains!3723 lt!316918 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694560 () Bool)

(declare-fun Unit!24541 () Unit!24538)

(assert (=> b!694560 (= e!395080 Unit!24541)))

(declare-fun b!694561 () Bool)

(declare-fun res!458597 () Bool)

(assert (=> b!694561 (=> (not res!458597) (not e!395079))))

(assert (=> b!694561 (= res!458597 (not (contains!3723 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694562 () Bool)

(assert (=> b!694562 (= e!395084 e!395082)))

(declare-fun res!458595 () Bool)

(assert (=> b!694562 (=> (not res!458595) (not e!395082))))

(assert (=> b!694562 (= res!458595 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!435 (List!13146 (_ BitVec 64)) List!13146)

(assert (=> b!694562 (= lt!316918 ($colon$colon!435 acc!681 (select (arr!19105 a!3626) from!3004)))))

(declare-fun b!694563 () Bool)

(declare-fun res!458586 () Bool)

(assert (=> b!694563 (=> (not res!458586) (not e!395079))))

(assert (=> b!694563 (= res!458586 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694564 () Bool)

(declare-fun res!458576 () Bool)

(assert (=> b!694564 (=> (not res!458576) (not e!395079))))

(assert (=> b!694564 (= res!458576 (noDuplicate!970 acc!681))))

(declare-fun b!694565 () Bool)

(declare-fun res!458578 () Bool)

(assert (=> b!694565 (=> (not res!458578) (not e!395079))))

(assert (=> b!694565 (= res!458578 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19490 a!3626))))))

(declare-fun b!694566 () Bool)

(declare-fun res!458599 () Bool)

(assert (=> b!694566 (=> (not res!458599) (not e!395079))))

(assert (=> b!694566 (= res!458599 (not (contains!3723 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694567 () Bool)

(declare-fun res!458584 () Bool)

(assert (=> b!694567 (=> (not res!458584) (not e!395079))))

(assert (=> b!694567 (= res!458584 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694568 () Bool)

(declare-fun res!458590 () Bool)

(assert (=> b!694568 (=> (not res!458590) (not e!395079))))

(assert (=> b!694568 (= res!458590 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19490 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!62044 res!458598) b!694564))

(assert (= (and b!694564 res!458576) b!694561))

(assert (= (and b!694561 res!458597) b!694566))

(assert (= (and b!694566 res!458599) b!694543))

(assert (= (and b!694543 res!458577) b!694557))

(assert (= (and b!694543 (not res!458588)) b!694552))

(assert (= (and b!694552 res!458587) b!694542))

(assert (= (and b!694543 res!458600) b!694547))

(assert (= (and b!694547 res!458582) b!694563))

(assert (= (and b!694563 res!458586) b!694565))

(assert (= (and b!694565 res!458578) b!694549))

(assert (= (and b!694549 res!458579) b!694567))

(assert (= (and b!694567 res!458584) b!694568))

(assert (= (and b!694568 res!458590) b!694556))

(assert (= (and b!694556 res!458596) b!694550))

(assert (= (and b!694550 c!78350) b!694553))

(assert (= (and b!694550 (not c!78350)) b!694560))

(assert (= (and b!694550 res!458580) b!694562))

(assert (= (and b!694562 res!458595) b!694554))

(assert (= (and b!694554 res!458592) b!694558))

(assert (= (and b!694558 res!458594) b!694559))

(assert (= (and b!694559 res!458585) b!694555))

(assert (= (and b!694555 res!458593) b!694551))

(assert (= (and b!694555 (not res!458591)) b!694546))

(assert (= (and b!694546 res!458589) b!694544))

(assert (= (and b!694555 res!458581) b!694548))

(assert (= (and b!694548 res!458583) b!694545))

(declare-fun m!656317 () Bool)

(assert (=> b!694563 m!656317))

(declare-fun m!656319 () Bool)

(assert (=> b!694557 m!656319))

(declare-fun m!656321 () Bool)

(assert (=> b!694553 m!656321))

(declare-fun m!656323 () Bool)

(assert (=> b!694553 m!656323))

(declare-fun m!656325 () Bool)

(assert (=> b!694561 m!656325))

(declare-fun m!656327 () Bool)

(assert (=> b!694562 m!656327))

(assert (=> b!694562 m!656327))

(declare-fun m!656329 () Bool)

(assert (=> b!694562 m!656329))

(assert (=> b!694550 m!656327))

(declare-fun m!656331 () Bool)

(assert (=> b!694554 m!656331))

(declare-fun m!656333 () Bool)

(assert (=> b!694559 m!656333))

(declare-fun m!656335 () Bool)

(assert (=> start!62044 m!656335))

(assert (=> b!694556 m!656327))

(assert (=> b!694556 m!656327))

(declare-fun m!656337 () Bool)

(assert (=> b!694556 m!656337))

(declare-fun m!656339 () Bool)

(assert (=> b!694548 m!656339))

(declare-fun m!656341 () Bool)

(assert (=> b!694564 m!656341))

(declare-fun m!656343 () Bool)

(assert (=> b!694547 m!656343))

(declare-fun m!656345 () Bool)

(assert (=> b!694566 m!656345))

(assert (=> b!694542 m!656319))

(declare-fun m!656347 () Bool)

(assert (=> b!694551 m!656347))

(assert (=> b!694544 m!656347))

(declare-fun m!656349 () Bool)

(assert (=> b!694558 m!656349))

(declare-fun m!656351 () Bool)

(assert (=> b!694567 m!656351))

(declare-fun m!656353 () Bool)

(assert (=> b!694549 m!656353))

(check-sat (not b!694542) (not b!694554) (not b!694562) (not b!694544) (not b!694564) (not b!694549) (not b!694566) (not b!694557) (not b!694556) (not b!694558) (not b!694567) (not b!694563) (not b!694547) (not b!694559) (not b!694548) (not b!694551) (not b!694553) (not b!694561) (not start!62044))
(check-sat)
