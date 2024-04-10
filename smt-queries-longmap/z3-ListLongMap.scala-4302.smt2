; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59842 () Bool)

(assert start!59842)

(declare-fun b!661426 () Bool)

(declare-fun res!429495 () Bool)

(declare-fun e!379939 () Bool)

(assert (=> b!661426 (=> (not res!429495) (not e!379939))))

(declare-fun e!379938 () Bool)

(assert (=> b!661426 (= res!429495 e!379938)))

(declare-fun res!429491 () Bool)

(assert (=> b!661426 (=> res!429491 e!379938)))

(declare-fun e!379937 () Bool)

(assert (=> b!661426 (= res!429491 e!379937)))

(declare-fun res!429502 () Bool)

(assert (=> b!661426 (=> (not res!429502) (not e!379937))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661426 (= res!429502 (bvsgt from!3004 i!1382))))

(declare-fun res!429492 () Bool)

(assert (=> start!59842 (=> (not res!429492) (not e!379939))))

(declare-datatypes ((array!38889 0))(
  ( (array!38890 (arr!18637 (Array (_ BitVec 32) (_ BitVec 64))) (size!19001 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38889)

(assert (=> start!59842 (= res!429492 (and (bvslt (size!19001 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19001 a!3626))))))

(assert (=> start!59842 e!379939))

(assert (=> start!59842 true))

(declare-fun array_inv!14433 (array!38889) Bool)

(assert (=> start!59842 (array_inv!14433 a!3626)))

(declare-fun b!661427 () Bool)

(declare-fun res!429496 () Bool)

(assert (=> b!661427 (=> (not res!429496) (not e!379939))))

(declare-datatypes ((List!12678 0))(
  ( (Nil!12675) (Cons!12674 (h!13719 (_ BitVec 64)) (t!18906 List!12678)) )
))
(declare-fun acc!681 () List!12678)

(declare-fun arrayNoDuplicates!0 (array!38889 (_ BitVec 32) List!12678) Bool)

(assert (=> b!661427 (= res!429496 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661428 () Bool)

(declare-fun res!429490 () Bool)

(assert (=> b!661428 (=> (not res!429490) (not e!379939))))

(assert (=> b!661428 (= res!429490 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12675))))

(declare-fun b!661429 () Bool)

(declare-fun e!379940 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3255 (List!12678 (_ BitVec 64)) Bool)

(assert (=> b!661429 (= e!379940 (not (contains!3255 acc!681 k0!2843)))))

(declare-fun b!661430 () Bool)

(declare-fun res!429497 () Bool)

(assert (=> b!661430 (=> (not res!429497) (not e!379939))))

(declare-fun noDuplicate!502 (List!12678) Bool)

(assert (=> b!661430 (= res!429497 (noDuplicate!502 acc!681))))

(declare-fun b!661431 () Bool)

(declare-fun res!429494 () Bool)

(assert (=> b!661431 (=> (not res!429494) (not e!379939))))

(assert (=> b!661431 (= res!429494 (not (contains!3255 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661432 () Bool)

(declare-fun res!429501 () Bool)

(assert (=> b!661432 (=> (not res!429501) (not e!379939))))

(assert (=> b!661432 (= res!429501 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19001 a!3626))))))

(declare-fun b!661433 () Bool)

(declare-fun res!429500 () Bool)

(assert (=> b!661433 (=> (not res!429500) (not e!379939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661433 (= res!429500 (validKeyInArray!0 k0!2843))))

(declare-fun b!661434 () Bool)

(assert (=> b!661434 (= e!379938 e!379940)))

(declare-fun res!429493 () Bool)

(assert (=> b!661434 (=> (not res!429493) (not e!379940))))

(assert (=> b!661434 (= res!429493 (bvsle from!3004 i!1382))))

(declare-fun b!661435 () Bool)

(declare-fun res!429499 () Bool)

(assert (=> b!661435 (=> (not res!429499) (not e!379939))))

(declare-fun arrayContainsKey!0 (array!38889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661435 (= res!429499 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661436 () Bool)

(declare-fun res!429498 () Bool)

(assert (=> b!661436 (=> (not res!429498) (not e!379939))))

(assert (=> b!661436 (= res!429498 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19001 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661437 () Bool)

(declare-fun res!429503 () Bool)

(assert (=> b!661437 (=> (not res!429503) (not e!379939))))

(assert (=> b!661437 (= res!429503 (not (contains!3255 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661438 () Bool)

(assert (=> b!661438 (= e!379937 (contains!3255 acc!681 k0!2843))))

(declare-fun b!661439 () Bool)

(assert (=> b!661439 (= e!379939 (not true))))

(assert (=> b!661439 (arrayContainsKey!0 (array!38890 (store (arr!18637 a!3626) i!1382 k0!2843) (size!19001 a!3626)) k0!2843 from!3004)))

(assert (= (and start!59842 res!429492) b!661430))

(assert (= (and b!661430 res!429497) b!661437))

(assert (= (and b!661437 res!429503) b!661431))

(assert (= (and b!661431 res!429494) b!661426))

(assert (= (and b!661426 res!429502) b!661438))

(assert (= (and b!661426 (not res!429491)) b!661434))

(assert (= (and b!661434 res!429493) b!661429))

(assert (= (and b!661426 res!429495) b!661428))

(assert (= (and b!661428 res!429490) b!661427))

(assert (= (and b!661427 res!429496) b!661432))

(assert (= (and b!661432 res!429501) b!661433))

(assert (= (and b!661433 res!429500) b!661435))

(assert (= (and b!661435 res!429499) b!661436))

(assert (= (and b!661436 res!429498) b!661439))

(declare-fun m!633621 () Bool)

(assert (=> b!661429 m!633621))

(declare-fun m!633623 () Bool)

(assert (=> b!661435 m!633623))

(declare-fun m!633625 () Bool)

(assert (=> b!661437 m!633625))

(declare-fun m!633627 () Bool)

(assert (=> b!661430 m!633627))

(declare-fun m!633629 () Bool)

(assert (=> b!661428 m!633629))

(assert (=> b!661438 m!633621))

(declare-fun m!633631 () Bool)

(assert (=> b!661439 m!633631))

(declare-fun m!633633 () Bool)

(assert (=> b!661439 m!633633))

(declare-fun m!633635 () Bool)

(assert (=> b!661433 m!633635))

(declare-fun m!633637 () Bool)

(assert (=> start!59842 m!633637))

(declare-fun m!633639 () Bool)

(assert (=> b!661427 m!633639))

(declare-fun m!633641 () Bool)

(assert (=> b!661431 m!633641))

(check-sat (not b!661427) (not b!661430) (not b!661431) (not b!661438) (not b!661437) (not b!661428) (not b!661429) (not start!59842) (not b!661435) (not b!661433) (not b!661439))
