; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60372 () Bool)

(assert start!60372)

(declare-fun b!678492 () Bool)

(declare-fun res!444903 () Bool)

(declare-fun e!386632 () Bool)

(assert (=> b!678492 (=> (not res!444903) (not e!386632))))

(declare-datatypes ((List!12943 0))(
  ( (Nil!12940) (Cons!12939 (h!13984 (_ BitVec 64)) (t!19171 List!12943)) )
))
(declare-fun acc!681 () List!12943)

(declare-fun contains!3520 (List!12943 (_ BitVec 64)) Bool)

(assert (=> b!678492 (= res!444903 (not (contains!3520 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678493 () Bool)

(declare-fun e!386634 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678493 (= e!386634 (not (contains!3520 acc!681 k!2843)))))

(declare-fun b!678494 () Bool)

(declare-fun res!444908 () Bool)

(assert (=> b!678494 (=> (not res!444908) (not e!386632))))

(declare-datatypes ((array!39419 0))(
  ( (array!39420 (arr!18902 (Array (_ BitVec 32) (_ BitVec 64))) (size!19266 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39419)

(declare-fun arrayNoDuplicates!0 (array!39419 (_ BitVec 32) List!12943) Bool)

(assert (=> b!678494 (= res!444908 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12940))))

(declare-fun b!678495 () Bool)

(declare-fun e!386631 () Bool)

(assert (=> b!678495 (= e!386631 e!386634)))

(declare-fun res!444906 () Bool)

(assert (=> b!678495 (=> (not res!444906) (not e!386634))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678495 (= res!444906 (bvsle from!3004 i!1382))))

(declare-fun b!678496 () Bool)

(declare-fun res!444907 () Bool)

(assert (=> b!678496 (=> (not res!444907) (not e!386632))))

(declare-fun noDuplicate!767 (List!12943) Bool)

(assert (=> b!678496 (= res!444907 (noDuplicate!767 acc!681))))

(declare-fun res!444904 () Bool)

(assert (=> start!60372 (=> (not res!444904) (not e!386632))))

(assert (=> start!60372 (= res!444904 (and (bvslt (size!19266 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19266 a!3626))))))

(assert (=> start!60372 e!386632))

(assert (=> start!60372 true))

(declare-fun array_inv!14698 (array!39419) Bool)

(assert (=> start!60372 (array_inv!14698 a!3626)))

(declare-fun b!678497 () Bool)

(declare-fun res!444900 () Bool)

(assert (=> b!678497 (=> (not res!444900) (not e!386632))))

(assert (=> b!678497 (= res!444900 (not (contains!3520 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678498 () Bool)

(declare-fun e!386630 () Bool)

(assert (=> b!678498 (= e!386630 (contains!3520 acc!681 k!2843))))

(declare-fun b!678499 () Bool)

(assert (=> b!678499 (= e!386632 false)))

(declare-fun lt!312895 () Bool)

(assert (=> b!678499 (= lt!312895 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678500 () Bool)

(declare-fun res!444902 () Bool)

(assert (=> b!678500 (=> (not res!444902) (not e!386632))))

(assert (=> b!678500 (= res!444902 e!386631)))

(declare-fun res!444905 () Bool)

(assert (=> b!678500 (=> res!444905 e!386631)))

(assert (=> b!678500 (= res!444905 e!386630)))

(declare-fun res!444901 () Bool)

(assert (=> b!678500 (=> (not res!444901) (not e!386630))))

(assert (=> b!678500 (= res!444901 (bvsgt from!3004 i!1382))))

(assert (= (and start!60372 res!444904) b!678496))

(assert (= (and b!678496 res!444907) b!678497))

(assert (= (and b!678497 res!444900) b!678492))

(assert (= (and b!678492 res!444903) b!678500))

(assert (= (and b!678500 res!444901) b!678498))

(assert (= (and b!678500 (not res!444905)) b!678495))

(assert (= (and b!678495 res!444906) b!678493))

(assert (= (and b!678500 res!444902) b!678494))

(assert (= (and b!678494 res!444908) b!678499))

(declare-fun m!644247 () Bool)

(assert (=> b!678494 m!644247))

(declare-fun m!644249 () Bool)

(assert (=> b!678497 m!644249))

(declare-fun m!644251 () Bool)

(assert (=> b!678492 m!644251))

(declare-fun m!644253 () Bool)

(assert (=> b!678496 m!644253))

(declare-fun m!644255 () Bool)

(assert (=> b!678498 m!644255))

(declare-fun m!644257 () Bool)

(assert (=> b!678499 m!644257))

(declare-fun m!644259 () Bool)

(assert (=> start!60372 m!644259))

(assert (=> b!678493 m!644255))

(push 1)

(assert (not b!678493))

(assert (not b!678499))

(assert (not b!678494))

(assert (not b!678498))

(assert (not b!678492))

(assert (not b!678497))

(assert (not start!60372))

(assert (not b!678496))

