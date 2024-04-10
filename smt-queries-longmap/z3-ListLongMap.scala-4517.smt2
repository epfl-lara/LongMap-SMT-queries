; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62572 () Bool)

(assert start!62572)

(declare-fun b!705660 () Bool)

(declare-fun res!469475 () Bool)

(declare-fun e!397855 () Bool)

(assert (=> b!705660 (=> (not res!469475) (not e!397855))))

(declare-datatypes ((List!13323 0))(
  ( (Nil!13320) (Cons!13319 (h!14364 (_ BitVec 64)) (t!19605 List!13323)) )
))
(declare-fun newAcc!49 () List!13323)

(declare-fun noDuplicate!1147 (List!13323) Bool)

(assert (=> b!705660 (= res!469475 (noDuplicate!1147 newAcc!49))))

(declare-fun b!705661 () Bool)

(declare-fun res!469473 () Bool)

(assert (=> b!705661 (=> (not res!469473) (not e!397855))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3900 (List!13323 (_ BitVec 64)) Bool)

(assert (=> b!705661 (= res!469473 (contains!3900 newAcc!49 k0!2824))))

(declare-fun b!705662 () Bool)

(declare-fun res!469479 () Bool)

(assert (=> b!705662 (=> (not res!469479) (not e!397855))))

(declare-datatypes ((array!40251 0))(
  ( (array!40252 (arr!19282 (Array (_ BitVec 32) (_ BitVec 64))) (size!19667 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40251)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705662 (= res!469479 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705663 () Bool)

(declare-fun res!469472 () Bool)

(assert (=> b!705663 (=> (not res!469472) (not e!397855))))

(assert (=> b!705663 (= res!469472 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705664 () Bool)

(declare-fun res!469478 () Bool)

(assert (=> b!705664 (=> (not res!469478) (not e!397855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705664 (= res!469478 (validKeyInArray!0 k0!2824))))

(declare-fun res!469476 () Bool)

(assert (=> start!62572 (=> (not res!469476) (not e!397855))))

(assert (=> start!62572 (= res!469476 (and (bvslt (size!19667 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19667 a!3591))))))

(assert (=> start!62572 e!397855))

(assert (=> start!62572 true))

(declare-fun array_inv!15078 (array!40251) Bool)

(assert (=> start!62572 (array_inv!15078 a!3591)))

(declare-fun b!705665 () Bool)

(declare-fun res!469488 () Bool)

(assert (=> b!705665 (=> (not res!469488) (not e!397855))))

(declare-fun acc!652 () List!13323)

(assert (=> b!705665 (= res!469488 (not (contains!3900 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705666 () Bool)

(declare-fun res!469470 () Bool)

(assert (=> b!705666 (=> (not res!469470) (not e!397855))))

(assert (=> b!705666 (= res!469470 (not (validKeyInArray!0 (select (arr!19282 a!3591) from!2969))))))

(declare-fun b!705667 () Bool)

(assert (=> b!705667 (= e!397855 (not true))))

(declare-fun arrayNoDuplicates!0 (array!40251 (_ BitVec 32) List!13323) Bool)

(assert (=> b!705667 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24614 0))(
  ( (Unit!24615) )
))
(declare-fun lt!317910 () Unit!24614)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40251 (_ BitVec 64) (_ BitVec 32) List!13323 List!13323) Unit!24614)

(assert (=> b!705667 (= lt!317910 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705668 () Bool)

(declare-fun res!469486 () Bool)

(assert (=> b!705668 (=> (not res!469486) (not e!397855))))

(assert (=> b!705668 (= res!469486 (not (contains!3900 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705669 () Bool)

(declare-fun res!469487 () Bool)

(assert (=> b!705669 (=> (not res!469487) (not e!397855))))

(assert (=> b!705669 (= res!469487 (noDuplicate!1147 acc!652))))

(declare-fun b!705670 () Bool)

(declare-fun res!469474 () Bool)

(assert (=> b!705670 (=> (not res!469474) (not e!397855))))

(assert (=> b!705670 (= res!469474 (not (contains!3900 acc!652 k0!2824)))))

(declare-fun b!705671 () Bool)

(declare-fun res!469484 () Bool)

(assert (=> b!705671 (=> (not res!469484) (not e!397855))))

(assert (=> b!705671 (= res!469484 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19667 a!3591)))))

(declare-fun b!705672 () Bool)

(declare-fun res!469471 () Bool)

(assert (=> b!705672 (=> (not res!469471) (not e!397855))))

(assert (=> b!705672 (= res!469471 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705673 () Bool)

(declare-fun res!469485 () Bool)

(assert (=> b!705673 (=> (not res!469485) (not e!397855))))

(assert (=> b!705673 (= res!469485 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705674 () Bool)

(declare-fun res!469483 () Bool)

(assert (=> b!705674 (=> (not res!469483) (not e!397855))))

(assert (=> b!705674 (= res!469483 (not (contains!3900 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705675 () Bool)

(declare-fun res!469482 () Bool)

(assert (=> b!705675 (=> (not res!469482) (not e!397855))))

(declare-fun subseq!345 (List!13323 List!13323) Bool)

(assert (=> b!705675 (= res!469482 (subseq!345 acc!652 newAcc!49))))

(declare-fun b!705676 () Bool)

(declare-fun res!469480 () Bool)

(assert (=> b!705676 (=> (not res!469480) (not e!397855))))

(assert (=> b!705676 (= res!469480 (not (contains!3900 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705677 () Bool)

(declare-fun res!469477 () Bool)

(assert (=> b!705677 (=> (not res!469477) (not e!397855))))

(declare-fun -!310 (List!13323 (_ BitVec 64)) List!13323)

(assert (=> b!705677 (= res!469477 (= (-!310 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705678 () Bool)

(declare-fun res!469481 () Bool)

(assert (=> b!705678 (=> (not res!469481) (not e!397855))))

(assert (=> b!705678 (= res!469481 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62572 res!469476) b!705669))

(assert (= (and b!705669 res!469487) b!705660))

(assert (= (and b!705660 res!469475) b!705674))

(assert (= (and b!705674 res!469483) b!705665))

(assert (= (and b!705665 res!469488) b!705678))

(assert (= (and b!705678 res!469481) b!705670))

(assert (= (and b!705670 res!469474) b!705664))

(assert (= (and b!705664 res!469478) b!705672))

(assert (= (and b!705672 res!469471) b!705675))

(assert (= (and b!705675 res!469482) b!705661))

(assert (= (and b!705661 res!469473) b!705677))

(assert (= (and b!705677 res!469477) b!705668))

(assert (= (and b!705668 res!469486) b!705676))

(assert (= (and b!705676 res!469480) b!705671))

(assert (= (and b!705671 res!469484) b!705666))

(assert (= (and b!705666 res!469470) b!705663))

(assert (= (and b!705663 res!469472) b!705662))

(assert (= (and b!705662 res!469479) b!705673))

(assert (= (and b!705673 res!469485) b!705667))

(declare-fun m!663755 () Bool)

(assert (=> b!705664 m!663755))

(declare-fun m!663757 () Bool)

(assert (=> b!705669 m!663757))

(declare-fun m!663759 () Bool)

(assert (=> b!705678 m!663759))

(declare-fun m!663761 () Bool)

(assert (=> b!705674 m!663761))

(declare-fun m!663763 () Bool)

(assert (=> b!705666 m!663763))

(assert (=> b!705666 m!663763))

(declare-fun m!663765 () Bool)

(assert (=> b!705666 m!663765))

(declare-fun m!663767 () Bool)

(assert (=> b!705672 m!663767))

(declare-fun m!663769 () Bool)

(assert (=> b!705675 m!663769))

(declare-fun m!663771 () Bool)

(assert (=> start!62572 m!663771))

(declare-fun m!663773 () Bool)

(assert (=> b!705677 m!663773))

(declare-fun m!663775 () Bool)

(assert (=> b!705665 m!663775))

(declare-fun m!663777 () Bool)

(assert (=> b!705676 m!663777))

(declare-fun m!663779 () Bool)

(assert (=> b!705662 m!663779))

(declare-fun m!663781 () Bool)

(assert (=> b!705660 m!663781))

(declare-fun m!663783 () Bool)

(assert (=> b!705673 m!663783))

(declare-fun m!663785 () Bool)

(assert (=> b!705668 m!663785))

(declare-fun m!663787 () Bool)

(assert (=> b!705667 m!663787))

(declare-fun m!663789 () Bool)

(assert (=> b!705667 m!663789))

(declare-fun m!663791 () Bool)

(assert (=> b!705661 m!663791))

(declare-fun m!663793 () Bool)

(assert (=> b!705670 m!663793))

(check-sat (not b!705668) (not b!705674) (not b!705669) (not start!62572) (not b!705672) (not b!705661) (not b!705662) (not b!705675) (not b!705678) (not b!705664) (not b!705677) (not b!705667) (not b!705670) (not b!705660) (not b!705666) (not b!705665) (not b!705673) (not b!705676))
(check-sat)
