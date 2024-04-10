; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62204 () Bool)

(assert start!62204)

(declare-fun b!696688 () Bool)

(declare-fun e!396159 () Bool)

(declare-datatypes ((List!13181 0))(
  ( (Nil!13178) (Cons!13177 (h!14222 (_ BitVec 64)) (t!19463 List!13181)) )
))
(declare-fun acc!681 () List!13181)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3758 (List!13181 (_ BitVec 64)) Bool)

(assert (=> b!696688 (= e!396159 (contains!3758 acc!681 k!2843))))

(declare-fun b!696689 () Bool)

(declare-fun res!460609 () Bool)

(declare-fun e!396157 () Bool)

(assert (=> b!696689 (=> (not res!460609) (not e!396157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696689 (= res!460609 (validKeyInArray!0 k!2843))))

(declare-fun b!696690 () Bool)

(declare-fun res!460608 () Bool)

(assert (=> b!696690 (=> (not res!460608) (not e!396157))))

(declare-fun e!396153 () Bool)

(assert (=> b!696690 (= res!460608 e!396153)))

(declare-fun res!460610 () Bool)

(assert (=> b!696690 (=> res!460610 e!396153)))

(declare-fun e!396154 () Bool)

(assert (=> b!696690 (= res!460610 e!396154)))

(declare-fun res!460620 () Bool)

(assert (=> b!696690 (=> (not res!460620) (not e!396154))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696690 (= res!460620 (bvsgt from!3004 i!1382))))

(declare-fun b!696691 () Bool)

(assert (=> b!696691 (= e!396154 (contains!3758 acc!681 k!2843))))

(declare-fun b!696692 () Bool)

(declare-fun e!396152 () Bool)

(declare-fun e!396155 () Bool)

(assert (=> b!696692 (= e!396152 e!396155)))

(declare-fun res!460621 () Bool)

(assert (=> b!696692 (=> (not res!460621) (not e!396155))))

(assert (=> b!696692 (= res!460621 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696693 () Bool)

(declare-fun res!460624 () Bool)

(assert (=> b!696693 (=> (not res!460624) (not e!396157))))

(declare-datatypes ((array!39961 0))(
  ( (array!39962 (arr!19140 (Array (_ BitVec 32) (_ BitVec 64))) (size!19525 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39961)

(declare-fun arrayNoDuplicates!0 (array!39961 (_ BitVec 32) List!13181) Bool)

(assert (=> b!696693 (= res!460624 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13178))))

(declare-fun b!696694 () Bool)

(declare-fun res!460625 () Bool)

(assert (=> b!696694 (=> (not res!460625) (not e!396157))))

(assert (=> b!696694 (= res!460625 e!396152)))

(declare-fun res!460623 () Bool)

(assert (=> b!696694 (=> res!460623 e!396152)))

(assert (=> b!696694 (= res!460623 e!396159)))

(declare-fun res!460615 () Bool)

(assert (=> b!696694 (=> (not res!460615) (not e!396159))))

(assert (=> b!696694 (= res!460615 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696696 () Bool)

(declare-fun res!460612 () Bool)

(assert (=> b!696696 (=> (not res!460612) (not e!396157))))

(declare-fun noDuplicate!1005 (List!13181) Bool)

(assert (=> b!696696 (= res!460612 (noDuplicate!1005 acc!681))))

(declare-fun b!696697 () Bool)

(declare-fun e!396158 () Bool)

(assert (=> b!696697 (= e!396158 (not (contains!3758 acc!681 k!2843)))))

(declare-fun b!696698 () Bool)

(declare-fun res!460606 () Bool)

(assert (=> b!696698 (=> (not res!460606) (not e!396157))))

(declare-fun arrayContainsKey!0 (array!39961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696698 (= res!460606 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696699 () Bool)

(assert (=> b!696699 (= e!396155 (not (contains!3758 acc!681 k!2843)))))

(declare-fun b!696700 () Bool)

(declare-fun res!460617 () Bool)

(assert (=> b!696700 (=> (not res!460617) (not e!396157))))

(assert (=> b!696700 (= res!460617 (not (contains!3758 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696701 () Bool)

(declare-fun res!460611 () Bool)

(assert (=> b!696701 (=> (not res!460611) (not e!396157))))

(assert (=> b!696701 (= res!460611 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696702 () Bool)

(declare-fun res!460616 () Bool)

(assert (=> b!696702 (=> (not res!460616) (not e!396157))))

(assert (=> b!696702 (= res!460616 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19525 a!3626))))))

(declare-fun b!696703 () Bool)

(assert (=> b!696703 (= e!396157 false)))

(declare-fun lt!317122 () Bool)

(assert (=> b!696703 (= lt!317122 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!696704 () Bool)

(declare-fun res!460614 () Bool)

(assert (=> b!696704 (=> (not res!460614) (not e!396157))))

(assert (=> b!696704 (= res!460614 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696705 () Bool)

(declare-fun res!460622 () Bool)

(assert (=> b!696705 (=> (not res!460622) (not e!396157))))

(assert (=> b!696705 (= res!460622 (not (validKeyInArray!0 (select (arr!19140 a!3626) from!3004))))))

(declare-fun res!460613 () Bool)

(assert (=> start!62204 (=> (not res!460613) (not e!396157))))

(assert (=> start!62204 (= res!460613 (and (bvslt (size!19525 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19525 a!3626))))))

(assert (=> start!62204 e!396157))

(assert (=> start!62204 true))

(declare-fun array_inv!14936 (array!39961) Bool)

(assert (=> start!62204 (array_inv!14936 a!3626)))

(declare-fun b!696695 () Bool)

(declare-fun res!460607 () Bool)

(assert (=> b!696695 (=> (not res!460607) (not e!396157))))

(assert (=> b!696695 (= res!460607 (not (contains!3758 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696706 () Bool)

(declare-fun res!460619 () Bool)

(assert (=> b!696706 (=> (not res!460619) (not e!396157))))

(assert (=> b!696706 (= res!460619 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19525 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696707 () Bool)

(assert (=> b!696707 (= e!396153 e!396158)))

(declare-fun res!460618 () Bool)

(assert (=> b!696707 (=> (not res!460618) (not e!396158))))

(assert (=> b!696707 (= res!460618 (bvsle from!3004 i!1382))))

(assert (= (and start!62204 res!460613) b!696696))

(assert (= (and b!696696 res!460612) b!696700))

(assert (= (and b!696700 res!460617) b!696695))

(assert (= (and b!696695 res!460607) b!696690))

(assert (= (and b!696690 res!460620) b!696691))

(assert (= (and b!696690 (not res!460610)) b!696707))

(assert (= (and b!696707 res!460618) b!696697))

(assert (= (and b!696690 res!460608) b!696693))

(assert (= (and b!696693 res!460624) b!696704))

(assert (= (and b!696704 res!460614) b!696702))

(assert (= (and b!696702 res!460616) b!696689))

(assert (= (and b!696689 res!460609) b!696698))

(assert (= (and b!696698 res!460606) b!696706))

(assert (= (and b!696706 res!460619) b!696705))

(assert (= (and b!696705 res!460622) b!696701))

(assert (= (and b!696701 res!460611) b!696694))

(assert (= (and b!696694 res!460615) b!696688))

(assert (= (and b!696694 (not res!460623)) b!696692))

(assert (= (and b!696692 res!460621) b!696699))

(assert (= (and b!696694 res!460625) b!696703))

(declare-fun m!657539 () Bool)

(assert (=> b!696703 m!657539))

(declare-fun m!657541 () Bool)

(assert (=> b!696693 m!657541))

(declare-fun m!657543 () Bool)

(assert (=> b!696691 m!657543))

(assert (=> b!696699 m!657543))

(declare-fun m!657545 () Bool)

(assert (=> b!696698 m!657545))

(assert (=> b!696697 m!657543))

(declare-fun m!657547 () Bool)

(assert (=> b!696689 m!657547))

(declare-fun m!657549 () Bool)

(assert (=> b!696696 m!657549))

(declare-fun m!657551 () Bool)

(assert (=> b!696695 m!657551))

(assert (=> b!696688 m!657543))

(declare-fun m!657553 () Bool)

(assert (=> b!696700 m!657553))

(declare-fun m!657555 () Bool)

(assert (=> b!696704 m!657555))

(declare-fun m!657557 () Bool)

(assert (=> b!696705 m!657557))

(assert (=> b!696705 m!657557))

(declare-fun m!657559 () Bool)

(assert (=> b!696705 m!657559))

(declare-fun m!657561 () Bool)

(assert (=> start!62204 m!657561))

(push 1)

(assert (not b!696705))

(assert (not b!696689))

(assert (not b!696703))

(assert (not b!696697))

(assert (not b!696698))

(assert (not b!696688))

(assert (not b!696704))

(assert (not start!62204))

(assert (not b!696700))

(assert (not b!696695))

(assert (not b!696693))

(assert (not b!696696))

(assert (not b!696699))

(assert (not b!696691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

