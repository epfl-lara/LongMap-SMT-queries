; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62118 () Bool)

(assert start!62118)

(declare-fun b!695418 () Bool)

(declare-fun e!395550 () Bool)

(declare-datatypes ((List!13156 0))(
  ( (Nil!13153) (Cons!13152 (h!14197 (_ BitVec 64)) (t!19438 List!13156)) )
))
(declare-fun acc!681 () List!13156)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3733 (List!13156 (_ BitVec 64)) Bool)

(assert (=> b!695418 (= e!395550 (not (contains!3733 acc!681 k!2843)))))

(declare-fun b!695419 () Bool)

(declare-fun res!459371 () Bool)

(declare-fun e!395548 () Bool)

(assert (=> b!695419 (=> (not res!459371) (not e!395548))))

(declare-datatypes ((array!39908 0))(
  ( (array!39909 (arr!19115 (Array (_ BitVec 32) (_ BitVec 64))) (size!19500 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39908)

(declare-fun arrayNoDuplicates!0 (array!39908 (_ BitVec 32) List!13156) Bool)

(assert (=> b!695419 (= res!459371 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13153))))

(declare-fun b!695420 () Bool)

(declare-fun res!459374 () Bool)

(assert (=> b!695420 (=> (not res!459374) (not e!395548))))

(assert (=> b!695420 (= res!459374 (not (contains!3733 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!459370 () Bool)

(assert (=> start!62118 (=> (not res!459370) (not e!395548))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62118 (= res!459370 (and (bvslt (size!19500 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19500 a!3626))))))

(assert (=> start!62118 e!395548))

(assert (=> start!62118 true))

(declare-fun array_inv!14911 (array!39908) Bool)

(assert (=> start!62118 (array_inv!14911 a!3626)))

(declare-fun b!695421 () Bool)

(declare-fun e!395546 () Bool)

(assert (=> b!695421 (= e!395546 e!395550)))

(declare-fun res!459367 () Bool)

(assert (=> b!695421 (=> (not res!459367) (not e!395550))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695421 (= res!459367 (bvsle from!3004 i!1382))))

(declare-fun b!695422 () Bool)

(declare-fun e!395547 () Bool)

(assert (=> b!695422 (= e!395547 (contains!3733 acc!681 k!2843))))

(declare-fun b!695423 () Bool)

(assert (=> b!695423 (= e!395548 false)))

(declare-fun lt!317059 () Bool)

(assert (=> b!695423 (= lt!317059 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695424 () Bool)

(declare-fun res!459373 () Bool)

(assert (=> b!695424 (=> (not res!459373) (not e!395548))))

(assert (=> b!695424 (= res!459373 e!395546)))

(declare-fun res!459368 () Bool)

(assert (=> b!695424 (=> res!459368 e!395546)))

(assert (=> b!695424 (= res!459368 e!395547)))

(declare-fun res!459372 () Bool)

(assert (=> b!695424 (=> (not res!459372) (not e!395547))))

(assert (=> b!695424 (= res!459372 (bvsgt from!3004 i!1382))))

(declare-fun b!695425 () Bool)

(declare-fun res!459369 () Bool)

(assert (=> b!695425 (=> (not res!459369) (not e!395548))))

(assert (=> b!695425 (= res!459369 (not (contains!3733 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695426 () Bool)

(declare-fun res!459366 () Bool)

(assert (=> b!695426 (=> (not res!459366) (not e!395548))))

(declare-fun noDuplicate!980 (List!13156) Bool)

(assert (=> b!695426 (= res!459366 (noDuplicate!980 acc!681))))

(assert (= (and start!62118 res!459370) b!695426))

(assert (= (and b!695426 res!459366) b!695425))

(assert (= (and b!695425 res!459369) b!695420))

(assert (= (and b!695420 res!459374) b!695424))

(assert (= (and b!695424 res!459372) b!695422))

(assert (= (and b!695424 (not res!459368)) b!695421))

(assert (= (and b!695421 res!459367) b!695418))

(assert (= (and b!695424 res!459373) b!695419))

(assert (= (and b!695419 res!459371) b!695423))

(declare-fun m!656937 () Bool)

(assert (=> b!695423 m!656937))

(declare-fun m!656939 () Bool)

(assert (=> b!695419 m!656939))

(declare-fun m!656941 () Bool)

(assert (=> b!695420 m!656941))

(declare-fun m!656943 () Bool)

(assert (=> b!695418 m!656943))

(declare-fun m!656945 () Bool)

(assert (=> b!695426 m!656945))

(declare-fun m!656947 () Bool)

(assert (=> b!695425 m!656947))

(declare-fun m!656949 () Bool)

(assert (=> start!62118 m!656949))

(assert (=> b!695422 m!656943))

(push 1)

(assert (not b!695419))

(assert (not b!695422))

(assert (not b!695425))

(assert (not start!62118))

(assert (not b!695420))

(assert (not b!695418))

(assert (not b!695423))

(assert (not b!695426))

(check-sat)

