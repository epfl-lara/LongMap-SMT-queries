; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59804 () Bool)

(assert start!59804)

(declare-fun b!660584 () Bool)

(declare-fun res!428820 () Bool)

(declare-fun e!379555 () Bool)

(assert (=> b!660584 (=> (not res!428820) (not e!379555))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660584 (= res!428820 (validKeyInArray!0 k0!2843))))

(declare-fun b!660585 () Bool)

(declare-fun res!428812 () Bool)

(assert (=> b!660585 (=> (not res!428812) (not e!379555))))

(declare-datatypes ((List!12703 0))(
  ( (Nil!12700) (Cons!12699 (h!13744 (_ BitVec 64)) (t!18922 List!12703)) )
))
(declare-fun acc!681 () List!12703)

(declare-fun noDuplicate!494 (List!12703) Bool)

(assert (=> b!660585 (= res!428812 (noDuplicate!494 acc!681))))

(declare-fun b!660586 () Bool)

(declare-fun res!428810 () Bool)

(assert (=> b!660586 (=> (not res!428810) (not e!379555))))

(declare-fun contains!3225 (List!12703 (_ BitVec 64)) Bool)

(assert (=> b!660586 (= res!428810 (not (contains!3225 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660587 () Bool)

(declare-fun res!428819 () Bool)

(assert (=> b!660587 (=> (not res!428819) (not e!379555))))

(declare-datatypes ((array!38862 0))(
  ( (array!38863 (arr!18623 (Array (_ BitVec 32) (_ BitVec 64))) (size!18988 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38862)

(declare-fun arrayNoDuplicates!0 (array!38862 (_ BitVec 32) List!12703) Bool)

(assert (=> b!660587 (= res!428819 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12700))))

(declare-fun b!660588 () Bool)

(declare-fun e!379552 () Bool)

(assert (=> b!660588 (= e!379552 (not (contains!3225 acc!681 k0!2843)))))

(declare-fun b!660589 () Bool)

(declare-fun e!379553 () Bool)

(assert (=> b!660589 (= e!379553 (contains!3225 acc!681 k0!2843))))

(declare-fun b!660591 () Bool)

(declare-fun res!428816 () Bool)

(assert (=> b!660591 (=> (not res!428816) (not e!379555))))

(declare-fun arrayContainsKey!0 (array!38862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660591 (= res!428816 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660592 () Bool)

(declare-fun e!379556 () Bool)

(assert (=> b!660592 (= e!379556 e!379552)))

(declare-fun res!428815 () Bool)

(assert (=> b!660592 (=> (not res!428815) (not e!379552))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660592 (= res!428815 (bvsle from!3004 i!1382))))

(declare-fun b!660593 () Bool)

(declare-fun res!428818 () Bool)

(assert (=> b!660593 (=> (not res!428818) (not e!379555))))

(assert (=> b!660593 (= res!428818 (not (contains!3225 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660594 () Bool)

(declare-fun res!428808 () Bool)

(assert (=> b!660594 (=> (not res!428808) (not e!379555))))

(assert (=> b!660594 (= res!428808 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660595 () Bool)

(declare-fun res!428809 () Bool)

(assert (=> b!660595 (=> (not res!428809) (not e!379555))))

(assert (=> b!660595 (= res!428809 e!379556)))

(declare-fun res!428814 () Bool)

(assert (=> b!660595 (=> res!428814 e!379556)))

(assert (=> b!660595 (= res!428814 e!379553)))

(declare-fun res!428813 () Bool)

(assert (=> b!660595 (=> (not res!428813) (not e!379553))))

(assert (=> b!660595 (= res!428813 (bvsgt from!3004 i!1382))))

(declare-fun res!428821 () Bool)

(assert (=> start!59804 (=> (not res!428821) (not e!379555))))

(assert (=> start!59804 (= res!428821 (and (bvslt (size!18988 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18988 a!3626))))))

(assert (=> start!59804 e!379555))

(assert (=> start!59804 true))

(declare-fun array_inv!14506 (array!38862) Bool)

(assert (=> start!59804 (array_inv!14506 a!3626)))

(declare-fun b!660590 () Bool)

(assert (=> b!660590 (= e!379555 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(assert (=> b!660590 (arrayContainsKey!0 (array!38863 (store (arr!18623 a!3626) i!1382 k0!2843) (size!18988 a!3626)) k0!2843 from!3004)))

(declare-fun b!660596 () Bool)

(declare-fun res!428811 () Bool)

(assert (=> b!660596 (=> (not res!428811) (not e!379555))))

(assert (=> b!660596 (= res!428811 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18988 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!660597 () Bool)

(declare-fun res!428817 () Bool)

(assert (=> b!660597 (=> (not res!428817) (not e!379555))))

(assert (=> b!660597 (= res!428817 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18988 a!3626))))))

(assert (= (and start!59804 res!428821) b!660585))

(assert (= (and b!660585 res!428812) b!660593))

(assert (= (and b!660593 res!428818) b!660586))

(assert (= (and b!660586 res!428810) b!660595))

(assert (= (and b!660595 res!428813) b!660589))

(assert (= (and b!660595 (not res!428814)) b!660592))

(assert (= (and b!660592 res!428815) b!660588))

(assert (= (and b!660595 res!428809) b!660587))

(assert (= (and b!660587 res!428819) b!660594))

(assert (= (and b!660594 res!428808) b!660597))

(assert (= (and b!660597 res!428817) b!660584))

(assert (= (and b!660584 res!428820) b!660591))

(assert (= (and b!660591 res!428816) b!660596))

(assert (= (and b!660596 res!428811) b!660590))

(declare-fun m!632553 () Bool)

(assert (=> start!59804 m!632553))

(declare-fun m!632555 () Bool)

(assert (=> b!660586 m!632555))

(declare-fun m!632557 () Bool)

(assert (=> b!660589 m!632557))

(declare-fun m!632559 () Bool)

(assert (=> b!660594 m!632559))

(declare-fun m!632561 () Bool)

(assert (=> b!660587 m!632561))

(declare-fun m!632563 () Bool)

(assert (=> b!660584 m!632563))

(declare-fun m!632565 () Bool)

(assert (=> b!660590 m!632565))

(declare-fun m!632567 () Bool)

(assert (=> b!660590 m!632567))

(declare-fun m!632569 () Bool)

(assert (=> b!660593 m!632569))

(assert (=> b!660588 m!632557))

(declare-fun m!632571 () Bool)

(assert (=> b!660591 m!632571))

(declare-fun m!632573 () Bool)

(assert (=> b!660585 m!632573))

(check-sat (not b!660590) (not b!660584) (not b!660589) (not b!660585) (not b!660587) (not b!660588) (not b!660591) (not b!660593) (not b!660594) (not start!59804) (not b!660586))
(check-sat)
