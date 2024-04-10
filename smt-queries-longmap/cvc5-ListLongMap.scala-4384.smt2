; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60332 () Bool)

(assert start!60332)

(declare-fun b!677816 () Bool)

(declare-fun res!444248 () Bool)

(declare-fun e!386321 () Bool)

(assert (=> b!677816 (=> (not res!444248) (not e!386321))))

(declare-datatypes ((List!12923 0))(
  ( (Nil!12920) (Cons!12919 (h!13964 (_ BitVec 64)) (t!19151 List!12923)) )
))
(declare-fun acc!681 () List!12923)

(declare-fun contains!3500 (List!12923 (_ BitVec 64)) Bool)

(assert (=> b!677816 (= res!444248 (not (contains!3500 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677817 () Bool)

(declare-fun res!444246 () Bool)

(assert (=> b!677817 (=> (not res!444246) (not e!386321))))

(declare-datatypes ((array!39379 0))(
  ( (array!39380 (arr!18882 (Array (_ BitVec 32) (_ BitVec 64))) (size!19246 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39379)

(declare-fun arrayNoDuplicates!0 (array!39379 (_ BitVec 32) List!12923) Bool)

(assert (=> b!677817 (= res!444246 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12920))))

(declare-fun b!677818 () Bool)

(declare-fun res!444250 () Bool)

(assert (=> b!677818 (=> (not res!444250) (not e!386321))))

(declare-fun e!386322 () Bool)

(assert (=> b!677818 (= res!444250 e!386322)))

(declare-fun res!444242 () Bool)

(assert (=> b!677818 (=> res!444242 e!386322)))

(declare-fun e!386324 () Bool)

(assert (=> b!677818 (= res!444242 e!386324)))

(declare-fun res!444244 () Bool)

(assert (=> b!677818 (=> (not res!444244) (not e!386324))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677818 (= res!444244 (bvsgt from!3004 i!1382))))

(declare-fun b!677819 () Bool)

(assert (=> b!677819 (= e!386321 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19246 a!3626)) (bvsgt from!3004 (size!19246 a!3626))))))

(declare-fun b!677820 () Bool)

(declare-fun res!444252 () Bool)

(assert (=> b!677820 (=> (not res!444252) (not e!386321))))

(assert (=> b!677820 (= res!444252 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19246 a!3626))))))

(declare-fun b!677821 () Bool)

(declare-fun res!444251 () Bool)

(assert (=> b!677821 (=> (not res!444251) (not e!386321))))

(assert (=> b!677821 (= res!444251 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677822 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677822 (= e!386324 (contains!3500 acc!681 k!2843))))

(declare-fun b!677823 () Bool)

(declare-fun res!444245 () Bool)

(assert (=> b!677823 (=> (not res!444245) (not e!386321))))

(assert (=> b!677823 (= res!444245 (not (contains!3500 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444254 () Bool)

(assert (=> start!60332 (=> (not res!444254) (not e!386321))))

(assert (=> start!60332 (= res!444254 (and (bvslt (size!19246 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19246 a!3626))))))

(assert (=> start!60332 e!386321))

(assert (=> start!60332 true))

(declare-fun array_inv!14678 (array!39379) Bool)

(assert (=> start!60332 (array_inv!14678 a!3626)))

(declare-fun b!677824 () Bool)

(declare-fun res!444243 () Bool)

(assert (=> b!677824 (=> (not res!444243) (not e!386321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677824 (= res!444243 (validKeyInArray!0 k!2843))))

(declare-fun b!677825 () Bool)

(declare-fun e!386325 () Bool)

(assert (=> b!677825 (= e!386325 (not (contains!3500 acc!681 k!2843)))))

(declare-fun b!677826 () Bool)

(assert (=> b!677826 (= e!386322 e!386325)))

(declare-fun res!444247 () Bool)

(assert (=> b!677826 (=> (not res!444247) (not e!386325))))

(assert (=> b!677826 (= res!444247 (bvsle from!3004 i!1382))))

(declare-fun b!677827 () Bool)

(declare-fun res!444249 () Bool)

(assert (=> b!677827 (=> (not res!444249) (not e!386321))))

(declare-fun arrayContainsKey!0 (array!39379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677827 (= res!444249 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677828 () Bool)

(declare-fun res!444253 () Bool)

(assert (=> b!677828 (=> (not res!444253) (not e!386321))))

(declare-fun noDuplicate!747 (List!12923) Bool)

(assert (=> b!677828 (= res!444253 (noDuplicate!747 acc!681))))

(assert (= (and start!60332 res!444254) b!677828))

(assert (= (and b!677828 res!444253) b!677816))

(assert (= (and b!677816 res!444248) b!677823))

(assert (= (and b!677823 res!444245) b!677818))

(assert (= (and b!677818 res!444244) b!677822))

(assert (= (and b!677818 (not res!444242)) b!677826))

(assert (= (and b!677826 res!444247) b!677825))

(assert (= (and b!677818 res!444250) b!677817))

(assert (= (and b!677817 res!444246) b!677821))

(assert (= (and b!677821 res!444251) b!677820))

(assert (= (and b!677820 res!444252) b!677824))

(assert (= (and b!677824 res!444243) b!677827))

(assert (= (and b!677827 res!444249) b!677819))

(declare-fun m!643907 () Bool)

(assert (=> b!677821 m!643907))

(declare-fun m!643909 () Bool)

(assert (=> b!677827 m!643909))

(declare-fun m!643911 () Bool)

(assert (=> b!677823 m!643911))

(declare-fun m!643913 () Bool)

(assert (=> b!677817 m!643913))

(declare-fun m!643915 () Bool)

(assert (=> b!677825 m!643915))

(declare-fun m!643917 () Bool)

(assert (=> b!677828 m!643917))

(assert (=> b!677822 m!643915))

(declare-fun m!643919 () Bool)

(assert (=> b!677824 m!643919))

(declare-fun m!643921 () Bool)

(assert (=> start!60332 m!643921))

(declare-fun m!643923 () Bool)

(assert (=> b!677816 m!643923))

(push 1)

(assert (not b!677828))

(assert (not b!677816))

(assert (not b!677827))

(assert (not start!60332))

(assert (not b!677817))

(assert (not b!677824))

(assert (not b!677823))

(assert (not b!677825))

(assert (not b!677821))

(assert (not b!677822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

