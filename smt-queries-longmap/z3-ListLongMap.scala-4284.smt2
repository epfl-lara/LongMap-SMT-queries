; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59684 () Bool)

(assert start!59684)

(declare-fun b!659327 () Bool)

(declare-fun res!427557 () Bool)

(declare-fun e!378795 () Bool)

(assert (=> b!659327 (=> (not res!427557) (not e!378795))))

(declare-datatypes ((List!12661 0))(
  ( (Nil!12658) (Cons!12657 (h!13702 (_ BitVec 64)) (t!18880 List!12661)) )
))
(declare-fun acc!681 () List!12661)

(declare-fun noDuplicate!452 (List!12661) Bool)

(assert (=> b!659327 (= res!427557 (noDuplicate!452 acc!681))))

(declare-fun b!659328 () Bool)

(declare-fun res!427553 () Bool)

(assert (=> b!659328 (=> (not res!427553) (not e!378795))))

(declare-fun contains!3183 (List!12661 (_ BitVec 64)) Bool)

(assert (=> b!659328 (= res!427553 (not (contains!3183 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659329 () Bool)

(declare-fun res!427555 () Bool)

(assert (=> b!659329 (=> (not res!427555) (not e!378795))))

(assert (=> b!659329 (= res!427555 (not (contains!3183 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659330 () Bool)

(declare-fun e!378794 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659330 (= e!378794 (not (contains!3183 acc!681 k0!2843)))))

(declare-fun b!659331 () Bool)

(declare-datatypes ((array!38772 0))(
  ( (array!38773 (arr!18581 (Array (_ BitVec 32) (_ BitVec 64))) (size!18946 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38772)

(assert (=> b!659331 (= e!378795 (bvsgt #b00000000000000000000000000000000 (size!18946 a!3626)))))

(declare-fun b!659332 () Bool)

(declare-fun e!378797 () Bool)

(assert (=> b!659332 (= e!378797 e!378794)))

(declare-fun res!427552 () Bool)

(assert (=> b!659332 (=> (not res!427552) (not e!378794))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659332 (= res!427552 (bvsle from!3004 i!1382))))

(declare-fun b!659333 () Bool)

(declare-fun res!427558 () Bool)

(assert (=> b!659333 (=> (not res!427558) (not e!378795))))

(assert (=> b!659333 (= res!427558 e!378797)))

(declare-fun res!427556 () Bool)

(assert (=> b!659333 (=> res!427556 e!378797)))

(declare-fun e!378796 () Bool)

(assert (=> b!659333 (= res!427556 e!378796)))

(declare-fun res!427551 () Bool)

(assert (=> b!659333 (=> (not res!427551) (not e!378796))))

(assert (=> b!659333 (= res!427551 (bvsgt from!3004 i!1382))))

(declare-fun res!427554 () Bool)

(assert (=> start!59684 (=> (not res!427554) (not e!378795))))

(assert (=> start!59684 (= res!427554 (and (bvslt (size!18946 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18946 a!3626))))))

(assert (=> start!59684 e!378795))

(assert (=> start!59684 true))

(declare-fun array_inv!14464 (array!38772) Bool)

(assert (=> start!59684 (array_inv!14464 a!3626)))

(declare-fun b!659334 () Bool)

(assert (=> b!659334 (= e!378796 (contains!3183 acc!681 k0!2843))))

(assert (= (and start!59684 res!427554) b!659327))

(assert (= (and b!659327 res!427557) b!659328))

(assert (= (and b!659328 res!427553) b!659329))

(assert (= (and b!659329 res!427555) b!659333))

(assert (= (and b!659333 res!427551) b!659334))

(assert (= (and b!659333 (not res!427556)) b!659332))

(assert (= (and b!659332 res!427552) b!659330))

(assert (= (and b!659333 res!427558) b!659331))

(declare-fun m!631845 () Bool)

(assert (=> b!659330 m!631845))

(declare-fun m!631847 () Bool)

(assert (=> b!659328 m!631847))

(declare-fun m!631849 () Bool)

(assert (=> b!659327 m!631849))

(declare-fun m!631851 () Bool)

(assert (=> b!659329 m!631851))

(assert (=> b!659334 m!631845))

(declare-fun m!631853 () Bool)

(assert (=> start!59684 m!631853))

(check-sat (not b!659334) (not b!659329) (not start!59684) (not b!659327) (not b!659330) (not b!659328))
(check-sat)
