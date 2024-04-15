; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62036 () Bool)

(assert start!62036)

(declare-fun b!694408 () Bool)

(declare-datatypes ((Unit!24524 0))(
  ( (Unit!24525) )
))
(declare-fun e!394961 () Unit!24524)

(declare-fun Unit!24526 () Unit!24524)

(assert (=> b!694408 (= e!394961 Unit!24526)))

(declare-fun b!694409 () Bool)

(declare-fun e!394956 () Bool)

(declare-fun e!394959 () Bool)

(assert (=> b!694409 (= e!394956 e!394959)))

(declare-fun res!458590 () Bool)

(assert (=> b!694409 (=> (not res!458590) (not e!394959))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694409 (= res!458590 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694410 () Bool)

(declare-fun res!458613 () Bool)

(declare-fun e!394954 () Bool)

(assert (=> b!694410 (=> (not res!458613) (not e!394954))))

(declare-datatypes ((array!39888 0))(
  ( (array!39889 (arr!19106 (Array (_ BitVec 32) (_ BitVec 64))) (size!19488 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39888)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694410 (= res!458613 (validKeyInArray!0 (select (arr!19106 a!3626) from!3004)))))

(declare-fun b!694411 () Bool)

(declare-fun res!458606 () Bool)

(assert (=> b!694411 (=> (not res!458606) (not e!394954))))

(declare-datatypes ((List!13186 0))(
  ( (Nil!13183) (Cons!13182 (h!14227 (_ BitVec 64)) (t!19456 List!13186)) )
))
(declare-fun acc!681 () List!13186)

(declare-fun contains!3708 (List!13186 (_ BitVec 64)) Bool)

(assert (=> b!694411 (= res!458606 (not (contains!3708 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694412 () Bool)

(declare-fun e!394955 () Bool)

(declare-fun lt!316681 () List!13186)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!694412 (= e!394955 (contains!3708 lt!316681 k0!2843))))

(declare-fun res!458605 () Bool)

(assert (=> start!62036 (=> (not res!458605) (not e!394954))))

(assert (=> start!62036 (= res!458605 (and (bvslt (size!19488 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19488 a!3626))))))

(assert (=> start!62036 e!394954))

(assert (=> start!62036 true))

(declare-fun array_inv!14989 (array!39888) Bool)

(assert (=> start!62036 (array_inv!14989 a!3626)))

(declare-fun b!694413 () Bool)

(declare-fun res!458598 () Bool)

(declare-fun e!394960 () Bool)

(assert (=> b!694413 (=> (not res!458598) (not e!394960))))

(assert (=> b!694413 (= res!458598 e!394956)))

(declare-fun res!458609 () Bool)

(assert (=> b!694413 (=> res!458609 e!394956)))

(assert (=> b!694413 (= res!458609 e!394955)))

(declare-fun res!458596 () Bool)

(assert (=> b!694413 (=> (not res!458596) (not e!394955))))

(assert (=> b!694413 (= res!458596 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694414 () Bool)

(declare-fun e!394951 () Bool)

(declare-fun e!394953 () Bool)

(assert (=> b!694414 (= e!394951 e!394953)))

(declare-fun res!458604 () Bool)

(assert (=> b!694414 (=> (not res!458604) (not e!394953))))

(assert (=> b!694414 (= res!458604 (bvsle from!3004 i!1382))))

(declare-fun b!694415 () Bool)

(declare-fun e!394958 () Bool)

(assert (=> b!694415 (= e!394958 (contains!3708 acc!681 k0!2843))))

(declare-fun b!694416 () Bool)

(declare-fun res!458608 () Bool)

(assert (=> b!694416 (=> (not res!458608) (not e!394960))))

(declare-fun noDuplicate!977 (List!13186) Bool)

(assert (=> b!694416 (= res!458608 (noDuplicate!977 lt!316681))))

(declare-fun b!694417 () Bool)

(assert (=> b!694417 (= e!394953 (not (contains!3708 acc!681 k0!2843)))))

(declare-fun b!694418 () Bool)

(declare-fun res!458597 () Bool)

(assert (=> b!694418 (=> (not res!458597) (not e!394954))))

(assert (=> b!694418 (= res!458597 (not (contains!3708 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694419 () Bool)

(declare-fun res!458610 () Bool)

(assert (=> b!694419 (=> (not res!458610) (not e!394954))))

(declare-fun arrayContainsKey!0 (array!39888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694419 (= res!458610 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694420 () Bool)

(declare-fun res!458603 () Bool)

(assert (=> b!694420 (=> (not res!458603) (not e!394960))))

(assert (=> b!694420 (= res!458603 (not (contains!3708 lt!316681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694421 () Bool)

(declare-fun res!458591 () Bool)

(assert (=> b!694421 (=> (not res!458591) (not e!394954))))

(assert (=> b!694421 (= res!458591 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19488 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694422 () Bool)

(declare-fun res!458611 () Bool)

(assert (=> b!694422 (=> (not res!458611) (not e!394954))))

(assert (=> b!694422 (= res!458611 e!394951)))

(declare-fun res!458600 () Bool)

(assert (=> b!694422 (=> res!458600 e!394951)))

(assert (=> b!694422 (= res!458600 e!394958)))

(declare-fun res!458601 () Bool)

(assert (=> b!694422 (=> (not res!458601) (not e!394958))))

(assert (=> b!694422 (= res!458601 (bvsgt from!3004 i!1382))))

(declare-fun b!694423 () Bool)

(declare-fun res!458599 () Bool)

(assert (=> b!694423 (=> (not res!458599) (not e!394954))))

(assert (=> b!694423 (= res!458599 (validKeyInArray!0 k0!2843))))

(declare-fun b!694424 () Bool)

(declare-fun Unit!24527 () Unit!24524)

(assert (=> b!694424 (= e!394961 Unit!24527)))

(assert (=> b!694424 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316682 () Unit!24524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39888 (_ BitVec 64) (_ BitVec 32)) Unit!24524)

(assert (=> b!694424 (= lt!316682 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694424 false))

(declare-fun b!694425 () Bool)

(declare-fun res!458593 () Bool)

(assert (=> b!694425 (=> (not res!458593) (not e!394960))))

(declare-fun arrayNoDuplicates!0 (array!39888 (_ BitVec 32) List!13186) Bool)

(assert (=> b!694425 (= res!458593 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316681))))

(declare-fun b!694426 () Bool)

(assert (=> b!694426 (= e!394959 (not (contains!3708 lt!316681 k0!2843)))))

(declare-fun b!694427 () Bool)

(declare-fun e!394952 () Bool)

(assert (=> b!694427 (= e!394952 e!394960)))

(declare-fun res!458614 () Bool)

(assert (=> b!694427 (=> (not res!458614) (not e!394960))))

(assert (=> b!694427 (= res!458614 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!436 (List!13186 (_ BitVec 64)) List!13186)

(assert (=> b!694427 (= lt!316681 ($colon$colon!436 acc!681 (select (arr!19106 a!3626) from!3004)))))

(declare-fun b!694428 () Bool)

(declare-fun res!458592 () Bool)

(assert (=> b!694428 (=> (not res!458592) (not e!394954))))

(assert (=> b!694428 (= res!458592 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19488 a!3626))))))

(declare-fun b!694429 () Bool)

(declare-fun res!458602 () Bool)

(assert (=> b!694429 (=> (not res!458602) (not e!394954))))

(assert (=> b!694429 (= res!458602 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13183))))

(declare-fun b!694430 () Bool)

(assert (=> b!694430 (= e!394954 e!394952)))

(declare-fun res!458612 () Bool)

(assert (=> b!694430 (=> (not res!458612) (not e!394952))))

(assert (=> b!694430 (= res!458612 (not (= (select (arr!19106 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316683 () Unit!24524)

(assert (=> b!694430 (= lt!316683 e!394961)))

(declare-fun c!78276 () Bool)

(assert (=> b!694430 (= c!78276 (= (select (arr!19106 a!3626) from!3004) k0!2843))))

(declare-fun b!694431 () Bool)

(declare-fun res!458595 () Bool)

(assert (=> b!694431 (=> (not res!458595) (not e!394960))))

(assert (=> b!694431 (= res!458595 (not (contains!3708 lt!316681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694432 () Bool)

(assert (=> b!694432 (= e!394960 (not true))))

(assert (=> b!694432 (arrayNoDuplicates!0 (array!39889 (store (arr!19106 a!3626) i!1382 k0!2843) (size!19488 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316681)))

(declare-fun lt!316680 () Unit!24524)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39888 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13186) Unit!24524)

(assert (=> b!694432 (= lt!316680 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316681))))

(declare-fun b!694433 () Bool)

(declare-fun res!458607 () Bool)

(assert (=> b!694433 (=> (not res!458607) (not e!394954))))

(assert (=> b!694433 (= res!458607 (noDuplicate!977 acc!681))))

(declare-fun b!694434 () Bool)

(declare-fun res!458594 () Bool)

(assert (=> b!694434 (=> (not res!458594) (not e!394954))))

(assert (=> b!694434 (= res!458594 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62036 res!458605) b!694433))

(assert (= (and b!694433 res!458607) b!694418))

(assert (= (and b!694418 res!458597) b!694411))

(assert (= (and b!694411 res!458606) b!694422))

(assert (= (and b!694422 res!458601) b!694415))

(assert (= (and b!694422 (not res!458600)) b!694414))

(assert (= (and b!694414 res!458604) b!694417))

(assert (= (and b!694422 res!458611) b!694429))

(assert (= (and b!694429 res!458602) b!694434))

(assert (= (and b!694434 res!458594) b!694428))

(assert (= (and b!694428 res!458592) b!694423))

(assert (= (and b!694423 res!458599) b!694419))

(assert (= (and b!694419 res!458610) b!694421))

(assert (= (and b!694421 res!458591) b!694410))

(assert (= (and b!694410 res!458613) b!694430))

(assert (= (and b!694430 c!78276) b!694424))

(assert (= (and b!694430 (not c!78276)) b!694408))

(assert (= (and b!694430 res!458612) b!694427))

(assert (= (and b!694427 res!458614) b!694416))

(assert (= (and b!694416 res!458608) b!694420))

(assert (= (and b!694420 res!458603) b!694431))

(assert (= (and b!694431 res!458595) b!694413))

(assert (= (and b!694413 res!458596) b!694412))

(assert (= (and b!694413 (not res!458609)) b!694409))

(assert (= (and b!694409 res!458590) b!694426))

(assert (= (and b!694413 res!458598) b!694425))

(assert (= (and b!694425 res!458593) b!694432))

(declare-fun m!655611 () Bool)

(assert (=> b!694412 m!655611))

(declare-fun m!655613 () Bool)

(assert (=> b!694427 m!655613))

(assert (=> b!694427 m!655613))

(declare-fun m!655615 () Bool)

(assert (=> b!694427 m!655615))

(assert (=> b!694430 m!655613))

(declare-fun m!655617 () Bool)

(assert (=> b!694416 m!655617))

(declare-fun m!655619 () Bool)

(assert (=> b!694417 m!655619))

(declare-fun m!655621 () Bool)

(assert (=> b!694431 m!655621))

(declare-fun m!655623 () Bool)

(assert (=> b!694419 m!655623))

(assert (=> b!694410 m!655613))

(assert (=> b!694410 m!655613))

(declare-fun m!655625 () Bool)

(assert (=> b!694410 m!655625))

(declare-fun m!655627 () Bool)

(assert (=> b!694420 m!655627))

(declare-fun m!655629 () Bool)

(assert (=> b!694434 m!655629))

(declare-fun m!655631 () Bool)

(assert (=> start!62036 m!655631))

(declare-fun m!655633 () Bool)

(assert (=> b!694429 m!655633))

(declare-fun m!655635 () Bool)

(assert (=> b!694432 m!655635))

(declare-fun m!655637 () Bool)

(assert (=> b!694432 m!655637))

(declare-fun m!655639 () Bool)

(assert (=> b!694432 m!655639))

(assert (=> b!694426 m!655611))

(declare-fun m!655641 () Bool)

(assert (=> b!694418 m!655641))

(assert (=> b!694415 m!655619))

(declare-fun m!655643 () Bool)

(assert (=> b!694433 m!655643))

(declare-fun m!655645 () Bool)

(assert (=> b!694424 m!655645))

(declare-fun m!655647 () Bool)

(assert (=> b!694424 m!655647))

(declare-fun m!655649 () Bool)

(assert (=> b!694423 m!655649))

(declare-fun m!655651 () Bool)

(assert (=> b!694425 m!655651))

(declare-fun m!655653 () Bool)

(assert (=> b!694411 m!655653))

(check-sat (not b!694416) (not start!62036) (not b!694425) (not b!694418) (not b!694417) (not b!694423) (not b!694419) (not b!694429) (not b!694411) (not b!694424) (not b!694427) (not b!694415) (not b!694433) (not b!694434) (not b!694426) (not b!694410) (not b!694420) (not b!694431) (not b!694432) (not b!694412))
(check-sat)
