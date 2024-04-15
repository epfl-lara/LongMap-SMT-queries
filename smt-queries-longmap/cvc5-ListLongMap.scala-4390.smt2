; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60360 () Bool)

(assert start!60360)

(declare-fun b!678196 () Bool)

(declare-fun res!444768 () Bool)

(declare-fun e!386442 () Bool)

(assert (=> b!678196 (=> (not res!444768) (not e!386442))))

(declare-fun e!386440 () Bool)

(assert (=> b!678196 (= res!444768 e!386440)))

(declare-fun res!444769 () Bool)

(assert (=> b!678196 (=> res!444769 e!386440)))

(declare-fun e!386443 () Bool)

(assert (=> b!678196 (= res!444769 e!386443)))

(declare-fun res!444765 () Bool)

(assert (=> b!678196 (=> (not res!444765) (not e!386443))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678196 (= res!444765 (bvsgt from!3004 i!1382))))

(declare-fun b!678197 () Bool)

(declare-fun res!444767 () Bool)

(assert (=> b!678197 (=> (not res!444767) (not e!386442))))

(declare-datatypes ((List!12981 0))(
  ( (Nil!12978) (Cons!12977 (h!14022 (_ BitVec 64)) (t!19200 List!12981)) )
))
(declare-fun acc!681 () List!12981)

(declare-fun contains!3503 (List!12981 (_ BitVec 64)) Bool)

(assert (=> b!678197 (= res!444767 (not (contains!3503 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444772 () Bool)

(assert (=> start!60360 (=> (not res!444772) (not e!386442))))

(declare-datatypes ((array!39418 0))(
  ( (array!39419 (arr!18901 (Array (_ BitVec 32) (_ BitVec 64))) (size!19266 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39418)

(assert (=> start!60360 (= res!444772 (and (bvslt (size!19266 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19266 a!3626))))))

(assert (=> start!60360 e!386442))

(assert (=> start!60360 true))

(declare-fun array_inv!14784 (array!39418) Bool)

(assert (=> start!60360 (array_inv!14784 a!3626)))

(declare-fun b!678198 () Bool)

(declare-fun e!386441 () Bool)

(assert (=> b!678198 (= e!386440 e!386441)))

(declare-fun res!444771 () Bool)

(assert (=> b!678198 (=> (not res!444771) (not e!386441))))

(assert (=> b!678198 (= res!444771 (bvsle from!3004 i!1382))))

(declare-fun b!678199 () Bool)

(assert (=> b!678199 (= e!386442 false)))

(declare-fun lt!312639 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39418 (_ BitVec 32) List!12981) Bool)

(assert (=> b!678199 (= lt!312639 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678200 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678200 (= e!386443 (contains!3503 acc!681 k!2843))))

(declare-fun b!678201 () Bool)

(declare-fun res!444770 () Bool)

(assert (=> b!678201 (=> (not res!444770) (not e!386442))))

(declare-fun noDuplicate!772 (List!12981) Bool)

(assert (=> b!678201 (= res!444770 (noDuplicate!772 acc!681))))

(declare-fun b!678202 () Bool)

(assert (=> b!678202 (= e!386441 (not (contains!3503 acc!681 k!2843)))))

(declare-fun b!678203 () Bool)

(declare-fun res!444764 () Bool)

(assert (=> b!678203 (=> (not res!444764) (not e!386442))))

(assert (=> b!678203 (= res!444764 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12978))))

(declare-fun b!678204 () Bool)

(declare-fun res!444766 () Bool)

(assert (=> b!678204 (=> (not res!444766) (not e!386442))))

(assert (=> b!678204 (= res!444766 (not (contains!3503 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60360 res!444772) b!678201))

(assert (= (and b!678201 res!444770) b!678197))

(assert (= (and b!678197 res!444767) b!678204))

(assert (= (and b!678204 res!444766) b!678196))

(assert (= (and b!678196 res!444765) b!678200))

(assert (= (and b!678196 (not res!444769)) b!678198))

(assert (= (and b!678198 res!444771) b!678202))

(assert (= (and b!678196 res!444768) b!678203))

(assert (= (and b!678203 res!444764) b!678199))

(declare-fun m!643465 () Bool)

(assert (=> b!678201 m!643465))

(declare-fun m!643467 () Bool)

(assert (=> b!678204 m!643467))

(declare-fun m!643469 () Bool)

(assert (=> b!678203 m!643469))

(declare-fun m!643471 () Bool)

(assert (=> b!678202 m!643471))

(assert (=> b!678200 m!643471))

(declare-fun m!643473 () Bool)

(assert (=> b!678197 m!643473))

(declare-fun m!643475 () Bool)

(assert (=> b!678199 m!643475))

(declare-fun m!643477 () Bool)

(assert (=> start!60360 m!643477))

(push 1)

(assert (not b!678204))

(assert (not b!678202))

(assert (not b!678197))

(assert (not start!60360))

(assert (not b!678203))

(assert (not b!678200))

(assert (not b!678199))

(assert (not b!678201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

