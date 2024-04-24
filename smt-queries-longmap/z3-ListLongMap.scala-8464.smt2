; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103228 () Bool)

(assert start!103228)

(declare-fun b!1238591 () Bool)

(declare-fun res!825671 () Bool)

(declare-fun e!702124 () Bool)

(assert (=> b!1238591 (=> (not res!825671) (not e!702124))))

(declare-datatypes ((List!27287 0))(
  ( (Nil!27284) (Cons!27283 (h!28501 (_ BitVec 64)) (t!40742 List!27287)) )
))
(declare-fun acc!846 () List!27287)

(declare-fun noDuplicate!1939 (List!27287) Bool)

(assert (=> b!1238591 (= res!825671 (noDuplicate!1939 acc!846))))

(declare-fun b!1238592 () Bool)

(assert (=> b!1238592 (= e!702124 (not true))))

(declare-fun lt!561472 () List!27287)

(declare-fun subseq!578 (List!27287 List!27287) Bool)

(assert (=> b!1238592 (subseq!578 acc!846 lt!561472)))

(declare-datatypes ((Unit!41025 0))(
  ( (Unit!41026) )
))
(declare-fun lt!561473 () Unit!41025)

(declare-fun subseqTail!65 (List!27287 List!27287) Unit!41025)

(assert (=> b!1238592 (= lt!561473 (subseqTail!65 lt!561472 lt!561472))))

(assert (=> b!1238592 (subseq!578 lt!561472 lt!561472)))

(declare-fun lt!561471 () Unit!41025)

(declare-fun lemmaListSubSeqRefl!0 (List!27287) Unit!41025)

(assert (=> b!1238592 (= lt!561471 (lemmaListSubSeqRefl!0 lt!561472))))

(declare-datatypes ((array!79802 0))(
  ( (array!79803 (arr!38501 (Array (_ BitVec 32) (_ BitVec 64))) (size!39038 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79802)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238592 (= lt!561472 (Cons!27283 (select (arr!38501 a!3835) from!3213) acc!846))))

(declare-fun b!1238593 () Bool)

(declare-fun res!825675 () Bool)

(assert (=> b!1238593 (=> (not res!825675) (not e!702124))))

(assert (=> b!1238593 (= res!825675 (not (= from!3213 (bvsub (size!39038 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238594 () Bool)

(declare-fun res!825670 () Bool)

(assert (=> b!1238594 (=> (not res!825670) (not e!702124))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7358 (List!27287 (_ BitVec 64)) Bool)

(assert (=> b!1238594 (= res!825670 (contains!7358 acc!846 k0!2925))))

(declare-fun b!1238595 () Bool)

(declare-fun res!825674 () Bool)

(assert (=> b!1238595 (=> (not res!825674) (not e!702124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238595 (= res!825674 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1238596 () Bool)

(declare-fun res!825669 () Bool)

(assert (=> b!1238596 (=> (not res!825669) (not e!702124))))

(assert (=> b!1238596 (= res!825669 (not (contains!7358 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238597 () Bool)

(declare-fun res!825672 () Bool)

(assert (=> b!1238597 (=> (not res!825672) (not e!702124))))

(assert (=> b!1238597 (= res!825672 (not (contains!7358 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!825673 () Bool)

(assert (=> start!103228 (=> (not res!825673) (not e!702124))))

(assert (=> start!103228 (= res!825673 (and (bvslt (size!39038 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39038 a!3835))))))

(assert (=> start!103228 e!702124))

(declare-fun array_inv!29439 (array!79802) Bool)

(assert (=> start!103228 (array_inv!29439 a!3835)))

(assert (=> start!103228 true))

(declare-fun b!1238598 () Bool)

(declare-fun res!825668 () Bool)

(assert (=> b!1238598 (=> (not res!825668) (not e!702124))))

(declare-fun arrayNoDuplicates!0 (array!79802 (_ BitVec 32) List!27287) Bool)

(assert (=> b!1238598 (= res!825668 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103228 res!825673) b!1238591))

(assert (= (and b!1238591 res!825671) b!1238596))

(assert (= (and b!1238596 res!825669) b!1238597))

(assert (= (and b!1238597 res!825672) b!1238598))

(assert (= (and b!1238598 res!825668) b!1238594))

(assert (= (and b!1238594 res!825670) b!1238593))

(assert (= (and b!1238593 res!825675) b!1238595))

(assert (= (and b!1238595 res!825674) b!1238592))

(declare-fun m!1142633 () Bool)

(assert (=> b!1238598 m!1142633))

(declare-fun m!1142635 () Bool)

(assert (=> b!1238591 m!1142635))

(declare-fun m!1142637 () Bool)

(assert (=> b!1238596 m!1142637))

(declare-fun m!1142639 () Bool)

(assert (=> start!103228 m!1142639))

(declare-fun m!1142641 () Bool)

(assert (=> b!1238597 m!1142641))

(declare-fun m!1142643 () Bool)

(assert (=> b!1238592 m!1142643))

(declare-fun m!1142645 () Bool)

(assert (=> b!1238592 m!1142645))

(declare-fun m!1142647 () Bool)

(assert (=> b!1238592 m!1142647))

(declare-fun m!1142649 () Bool)

(assert (=> b!1238592 m!1142649))

(declare-fun m!1142651 () Bool)

(assert (=> b!1238592 m!1142651))

(assert (=> b!1238595 m!1142651))

(assert (=> b!1238595 m!1142651))

(declare-fun m!1142653 () Bool)

(assert (=> b!1238595 m!1142653))

(declare-fun m!1142655 () Bool)

(assert (=> b!1238594 m!1142655))

(check-sat (not b!1238598) (not b!1238594) (not b!1238596) (not start!103228) (not b!1238592) (not b!1238595) (not b!1238597) (not b!1238591))
(check-sat)
