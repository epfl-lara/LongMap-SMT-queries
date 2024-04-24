; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103016 () Bool)

(assert start!103016)

(declare-fun b!1236427 () Bool)

(declare-fun res!823798 () Bool)

(declare-fun e!701208 () Bool)

(assert (=> b!1236427 (=> res!823798 e!701208)))

(declare-datatypes ((List!27217 0))(
  ( (Nil!27214) (Cons!27213 (h!28431 (_ BitVec 64)) (t!40672 List!27217)) )
))
(declare-fun lt!560618 () List!27217)

(declare-fun contains!7288 (List!27217 (_ BitVec 64)) Bool)

(assert (=> b!1236427 (= res!823798 (contains!7288 lt!560618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236428 () Bool)

(declare-fun res!823799 () Bool)

(declare-fun e!701209 () Bool)

(assert (=> b!1236428 (=> (not res!823799) (not e!701209))))

(declare-fun acc!846 () List!27217)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236428 (= res!823799 (contains!7288 acc!846 k!2925))))

(declare-fun b!1236429 () Bool)

(declare-fun res!823808 () Bool)

(assert (=> b!1236429 (=> (not res!823808) (not e!701209))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79659 0))(
  ( (array!79660 (arr!38431 (Array (_ BitVec 32) (_ BitVec 64))) (size!38968 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79659)

(assert (=> b!1236429 (= res!823808 (not (= from!3213 (bvsub (size!38968 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236430 () Bool)

(declare-fun res!823806 () Bool)

(assert (=> b!1236430 (=> (not res!823806) (not e!701209))))

(declare-fun noDuplicate!1869 (List!27217) Bool)

(assert (=> b!1236430 (= res!823806 (noDuplicate!1869 acc!846))))

(declare-fun b!1236431 () Bool)

(declare-fun res!823800 () Bool)

(assert (=> b!1236431 (=> (not res!823800) (not e!701209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236431 (= res!823800 (validKeyInArray!0 (select (arr!38431 a!3835) from!3213)))))

(declare-fun b!1236432 () Bool)

(declare-fun res!823801 () Bool)

(assert (=> b!1236432 (=> res!823801 e!701208)))

(assert (=> b!1236432 (= res!823801 (contains!7288 lt!560618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236433 () Bool)

(assert (=> b!1236433 (= e!701209 (not e!701208))))

(declare-fun res!823802 () Bool)

(assert (=> b!1236433 (=> res!823802 e!701208)))

(assert (=> b!1236433 (= res!823802 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!526 (List!27217 List!27217) Bool)

(assert (=> b!1236433 (subseq!526 acc!846 lt!560618)))

(declare-datatypes ((Unit!40881 0))(
  ( (Unit!40882) )
))
(declare-fun lt!560619 () Unit!40881)

(declare-fun subseqTail!19 (List!27217 List!27217) Unit!40881)

(assert (=> b!1236433 (= lt!560619 (subseqTail!19 lt!560618 lt!560618))))

(assert (=> b!1236433 (subseq!526 lt!560618 lt!560618)))

(declare-fun lt!560620 () Unit!40881)

(declare-fun lemmaListSubSeqRefl!0 (List!27217) Unit!40881)

(assert (=> b!1236433 (= lt!560620 (lemmaListSubSeqRefl!0 lt!560618))))

(assert (=> b!1236433 (= lt!560618 (Cons!27213 (select (arr!38431 a!3835) from!3213) acc!846))))

(declare-fun b!1236434 () Bool)

(declare-fun res!823804 () Bool)

(assert (=> b!1236434 (=> res!823804 e!701208)))

(assert (=> b!1236434 (= res!823804 (not (noDuplicate!1869 lt!560618)))))

(declare-fun b!1236435 () Bool)

(declare-fun res!823807 () Bool)

(assert (=> b!1236435 (=> (not res!823807) (not e!701209))))

(declare-fun arrayNoDuplicates!0 (array!79659 (_ BitVec 32) List!27217) Bool)

(assert (=> b!1236435 (= res!823807 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823803 () Bool)

(assert (=> start!103016 (=> (not res!823803) (not e!701209))))

(assert (=> start!103016 (= res!823803 (and (bvslt (size!38968 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38968 a!3835))))))

(assert (=> start!103016 e!701209))

(declare-fun array_inv!29369 (array!79659) Bool)

(assert (=> start!103016 (array_inv!29369 a!3835)))

(assert (=> start!103016 true))

(declare-fun b!1236436 () Bool)

(declare-fun res!823805 () Bool)

(assert (=> b!1236436 (=> (not res!823805) (not e!701209))))

(assert (=> b!1236436 (= res!823805 (not (contains!7288 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236437 () Bool)

(declare-fun res!823809 () Bool)

(assert (=> b!1236437 (=> (not res!823809) (not e!701209))))

(assert (=> b!1236437 (= res!823809 (not (contains!7288 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236438 () Bool)

(assert (=> b!1236438 (= e!701208 true)))

(declare-fun lt!560617 () Bool)

(assert (=> b!1236438 (= lt!560617 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560618))))

(declare-fun lt!560621 () Unit!40881)

(declare-fun noDuplicateSubseq!73 (List!27217 List!27217) Unit!40881)

(assert (=> b!1236438 (= lt!560621 (noDuplicateSubseq!73 acc!846 lt!560618))))

(assert (= (and start!103016 res!823803) b!1236430))

(assert (= (and b!1236430 res!823806) b!1236436))

(assert (= (and b!1236436 res!823805) b!1236437))

(assert (= (and b!1236437 res!823809) b!1236435))

(assert (= (and b!1236435 res!823807) b!1236428))

(assert (= (and b!1236428 res!823799) b!1236429))

(assert (= (and b!1236429 res!823808) b!1236431))

(assert (= (and b!1236431 res!823800) b!1236433))

(assert (= (and b!1236433 (not res!823802)) b!1236434))

(assert (= (and b!1236434 (not res!823804)) b!1236432))

(assert (= (and b!1236432 (not res!823801)) b!1236427))

(assert (= (and b!1236427 (not res!823798)) b!1236438))

(declare-fun m!1140649 () Bool)

(assert (=> b!1236430 m!1140649))

(declare-fun m!1140651 () Bool)

(assert (=> b!1236435 m!1140651))

(declare-fun m!1140653 () Bool)

(assert (=> b!1236432 m!1140653))

(declare-fun m!1140655 () Bool)

(assert (=> b!1236438 m!1140655))

(declare-fun m!1140657 () Bool)

(assert (=> b!1236438 m!1140657))

(declare-fun m!1140659 () Bool)

(assert (=> b!1236436 m!1140659))

(declare-fun m!1140661 () Bool)

(assert (=> b!1236437 m!1140661))

(declare-fun m!1140663 () Bool)

(assert (=> b!1236434 m!1140663))

(declare-fun m!1140665 () Bool)

(assert (=> b!1236433 m!1140665))

(declare-fun m!1140667 () Bool)

(assert (=> b!1236433 m!1140667))

(declare-fun m!1140669 () Bool)

(assert (=> b!1236433 m!1140669))

(declare-fun m!1140671 () Bool)

(assert (=> b!1236433 m!1140671))

(declare-fun m!1140673 () Bool)

(assert (=> b!1236433 m!1140673))

(declare-fun m!1140675 () Bool)

(assert (=> b!1236427 m!1140675))

(declare-fun m!1140677 () Bool)

(assert (=> start!103016 m!1140677))

(declare-fun m!1140679 () Bool)

(assert (=> b!1236428 m!1140679))

(assert (=> b!1236431 m!1140669))

(assert (=> b!1236431 m!1140669))

(declare-fun m!1140681 () Bool)

(assert (=> b!1236431 m!1140681))

(push 1)

(assert (not b!1236428))

(assert (not b!1236431))

(assert (not b!1236427))

(assert (not b!1236438))

(assert (not b!1236435))

(assert (not b!1236437))

(assert (not b!1236432))

(assert (not b!1236430))

(assert (not b!1236436))

(assert (not b!1236434))

(assert (not b!1236433))

(assert (not start!103016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

