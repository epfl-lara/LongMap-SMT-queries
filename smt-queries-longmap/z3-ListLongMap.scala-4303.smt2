; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59848 () Bool)

(assert start!59848)

(declare-fun b!661552 () Bool)

(declare-fun res!429626 () Bool)

(declare-fun e!379985 () Bool)

(assert (=> b!661552 (=> (not res!429626) (not e!379985))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38895 0))(
  ( (array!38896 (arr!18640 (Array (_ BitVec 32) (_ BitVec 64))) (size!19004 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38895)

(assert (=> b!661552 (= res!429626 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19004 a!3626))))))

(declare-fun b!661553 () Bool)

(declare-fun res!429624 () Bool)

(assert (=> b!661553 (=> (not res!429624) (not e!379985))))

(declare-fun e!379983 () Bool)

(assert (=> b!661553 (= res!429624 e!379983)))

(declare-fun res!429619 () Bool)

(assert (=> b!661553 (=> res!429619 e!379983)))

(declare-fun e!379986 () Bool)

(assert (=> b!661553 (= res!429619 e!379986)))

(declare-fun res!429625 () Bool)

(assert (=> b!661553 (=> (not res!429625) (not e!379986))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661553 (= res!429625 (bvsgt from!3004 i!1382))))

(declare-fun b!661554 () Bool)

(declare-fun res!429618 () Bool)

(assert (=> b!661554 (=> (not res!429618) (not e!379985))))

(declare-datatypes ((List!12681 0))(
  ( (Nil!12678) (Cons!12677 (h!13722 (_ BitVec 64)) (t!18909 List!12681)) )
))
(declare-fun acc!681 () List!12681)

(declare-fun noDuplicate!505 (List!12681) Bool)

(assert (=> b!661554 (= res!429618 (noDuplicate!505 acc!681))))

(declare-fun b!661555 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3258 (List!12681 (_ BitVec 64)) Bool)

(assert (=> b!661555 (= e!379986 (contains!3258 acc!681 k0!2843))))

(declare-fun b!661556 () Bool)

(declare-fun res!429628 () Bool)

(assert (=> b!661556 (=> (not res!429628) (not e!379985))))

(assert (=> b!661556 (= res!429628 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19004 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661557 () Bool)

(declare-fun res!429621 () Bool)

(assert (=> b!661557 (=> (not res!429621) (not e!379985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661557 (= res!429621 (validKeyInArray!0 k0!2843))))

(declare-fun b!661558 () Bool)

(declare-fun res!429627 () Bool)

(assert (=> b!661558 (=> (not res!429627) (not e!379985))))

(declare-fun arrayNoDuplicates!0 (array!38895 (_ BitVec 32) List!12681) Bool)

(assert (=> b!661558 (= res!429627 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661559 () Bool)

(declare-fun res!429617 () Bool)

(assert (=> b!661559 (=> (not res!429617) (not e!379985))))

(declare-fun arrayContainsKey!0 (array!38895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661559 (= res!429617 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!429620 () Bool)

(assert (=> start!59848 (=> (not res!429620) (not e!379985))))

(assert (=> start!59848 (= res!429620 (and (bvslt (size!19004 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19004 a!3626))))))

(assert (=> start!59848 e!379985))

(assert (=> start!59848 true))

(declare-fun array_inv!14436 (array!38895) Bool)

(assert (=> start!59848 (array_inv!14436 a!3626)))

(declare-fun b!661560 () Bool)

(declare-fun e!379982 () Bool)

(assert (=> b!661560 (= e!379982 (not (contains!3258 acc!681 k0!2843)))))

(declare-fun b!661561 () Bool)

(declare-fun res!429616 () Bool)

(assert (=> b!661561 (=> (not res!429616) (not e!379985))))

(assert (=> b!661561 (= res!429616 (not (contains!3258 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661562 () Bool)

(assert (=> b!661562 (= e!379983 e!379982)))

(declare-fun res!429622 () Bool)

(assert (=> b!661562 (=> (not res!429622) (not e!379982))))

(assert (=> b!661562 (= res!429622 (bvsle from!3004 i!1382))))

(declare-fun b!661563 () Bool)

(assert (=> b!661563 (= e!379985 (not true))))

(assert (=> b!661563 (arrayContainsKey!0 (array!38896 (store (arr!18640 a!3626) i!1382 k0!2843) (size!19004 a!3626)) k0!2843 from!3004)))

(declare-fun b!661564 () Bool)

(declare-fun res!429629 () Bool)

(assert (=> b!661564 (=> (not res!429629) (not e!379985))))

(assert (=> b!661564 (= res!429629 (not (contains!3258 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661565 () Bool)

(declare-fun res!429623 () Bool)

(assert (=> b!661565 (=> (not res!429623) (not e!379985))))

(assert (=> b!661565 (= res!429623 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12678))))

(assert (= (and start!59848 res!429620) b!661554))

(assert (= (and b!661554 res!429618) b!661564))

(assert (= (and b!661564 res!429629) b!661561))

(assert (= (and b!661561 res!429616) b!661553))

(assert (= (and b!661553 res!429625) b!661555))

(assert (= (and b!661553 (not res!429619)) b!661562))

(assert (= (and b!661562 res!429622) b!661560))

(assert (= (and b!661553 res!429624) b!661565))

(assert (= (and b!661565 res!429623) b!661558))

(assert (= (and b!661558 res!429627) b!661552))

(assert (= (and b!661552 res!429626) b!661557))

(assert (= (and b!661557 res!429621) b!661559))

(assert (= (and b!661559 res!429617) b!661556))

(assert (= (and b!661556 res!429628) b!661563))

(declare-fun m!633687 () Bool)

(assert (=> b!661563 m!633687))

(declare-fun m!633689 () Bool)

(assert (=> b!661563 m!633689))

(declare-fun m!633691 () Bool)

(assert (=> b!661561 m!633691))

(declare-fun m!633693 () Bool)

(assert (=> b!661564 m!633693))

(declare-fun m!633695 () Bool)

(assert (=> b!661560 m!633695))

(declare-fun m!633697 () Bool)

(assert (=> b!661557 m!633697))

(declare-fun m!633699 () Bool)

(assert (=> start!59848 m!633699))

(assert (=> b!661555 m!633695))

(declare-fun m!633701 () Bool)

(assert (=> b!661554 m!633701))

(declare-fun m!633703 () Bool)

(assert (=> b!661559 m!633703))

(declare-fun m!633705 () Bool)

(assert (=> b!661558 m!633705))

(declare-fun m!633707 () Bool)

(assert (=> b!661565 m!633707))

(check-sat (not b!661561) (not b!661564) (not b!661557) (not b!661565) (not b!661560) (not b!661558) (not start!59848) (not b!661563) (not b!661555) (not b!661554) (not b!661559))
