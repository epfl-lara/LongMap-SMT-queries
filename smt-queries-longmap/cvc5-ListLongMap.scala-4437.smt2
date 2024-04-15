; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61680 () Bool)

(assert start!61680)

(declare-fun b!689908 () Bool)

(declare-fun res!454478 () Bool)

(declare-fun e!392830 () Bool)

(assert (=> b!689908 (=> (not res!454478) (not e!392830))))

(declare-datatypes ((List!13122 0))(
  ( (Nil!13119) (Cons!13118 (h!14163 (_ BitVec 64)) (t!19380 List!13122)) )
))
(declare-fun acc!681 () List!13122)

(declare-fun contains!3644 (List!13122 (_ BitVec 64)) Bool)

(assert (=> b!689908 (= res!454478 (not (contains!3644 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689909 () Bool)

(declare-fun res!454473 () Bool)

(assert (=> b!689909 (=> (not res!454473) (not e!392830))))

(declare-fun noDuplicate!913 (List!13122) Bool)

(assert (=> b!689909 (= res!454473 (noDuplicate!913 acc!681))))

(declare-fun b!689911 () Bool)

(declare-fun e!392829 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!689911 (= e!392829 (contains!3644 acc!681 k!2843))))

(declare-fun b!689912 () Bool)

(assert (=> b!689912 (= e!392830 false)))

(declare-fun lt!316158 () Bool)

(declare-datatypes ((array!39745 0))(
  ( (array!39746 (arr!19042 (Array (_ BitVec 32) (_ BitVec 64))) (size!19424 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39745)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39745 (_ BitVec 32) List!13122) Bool)

(assert (=> b!689912 (= lt!316158 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689913 () Bool)

(declare-fun res!454475 () Bool)

(assert (=> b!689913 (=> (not res!454475) (not e!392830))))

(assert (=> b!689913 (= res!454475 (not (contains!3644 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689914 () Bool)

(declare-fun res!454472 () Bool)

(assert (=> b!689914 (=> (not res!454472) (not e!392830))))

(assert (=> b!689914 (= res!454472 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13119))))

(declare-fun b!689915 () Bool)

(declare-fun res!454479 () Bool)

(assert (=> b!689915 (=> (not res!454479) (not e!392830))))

(declare-fun e!392827 () Bool)

(assert (=> b!689915 (= res!454479 e!392827)))

(declare-fun res!454480 () Bool)

(assert (=> b!689915 (=> res!454480 e!392827)))

(assert (=> b!689915 (= res!454480 e!392829)))

(declare-fun res!454474 () Bool)

(assert (=> b!689915 (=> (not res!454474) (not e!392829))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689915 (= res!454474 (bvsgt from!3004 i!1382))))

(declare-fun b!689916 () Bool)

(declare-fun e!392831 () Bool)

(assert (=> b!689916 (= e!392831 (not (contains!3644 acc!681 k!2843)))))

(declare-fun b!689910 () Bool)

(assert (=> b!689910 (= e!392827 e!392831)))

(declare-fun res!454476 () Bool)

(assert (=> b!689910 (=> (not res!454476) (not e!392831))))

(assert (=> b!689910 (= res!454476 (bvsle from!3004 i!1382))))

(declare-fun res!454477 () Bool)

(assert (=> start!61680 (=> (not res!454477) (not e!392830))))

(assert (=> start!61680 (= res!454477 (and (bvslt (size!19424 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19424 a!3626))))))

(assert (=> start!61680 e!392830))

(assert (=> start!61680 true))

(declare-fun array_inv!14925 (array!39745) Bool)

(assert (=> start!61680 (array_inv!14925 a!3626)))

(assert (= (and start!61680 res!454477) b!689909))

(assert (= (and b!689909 res!454473) b!689908))

(assert (= (and b!689908 res!454478) b!689913))

(assert (= (and b!689913 res!454475) b!689915))

(assert (= (and b!689915 res!454474) b!689911))

(assert (= (and b!689915 (not res!454480)) b!689910))

(assert (= (and b!689910 res!454476) b!689916))

(assert (= (and b!689915 res!454479) b!689914))

(assert (= (and b!689914 res!454472) b!689912))

(declare-fun m!653029 () Bool)

(assert (=> b!689913 m!653029))

(declare-fun m!653031 () Bool)

(assert (=> b!689916 m!653031))

(declare-fun m!653033 () Bool)

(assert (=> b!689914 m!653033))

(assert (=> b!689911 m!653031))

(declare-fun m!653035 () Bool)

(assert (=> start!61680 m!653035))

(declare-fun m!653037 () Bool)

(assert (=> b!689912 m!653037))

(declare-fun m!653039 () Bool)

(assert (=> b!689909 m!653039))

(declare-fun m!653041 () Bool)

(assert (=> b!689908 m!653041))

(push 1)

(assert (not b!689909))

(assert (not start!61680))

(assert (not b!689913))

(assert (not b!689912))

(assert (not b!689916))

(assert (not b!689911))

(assert (not b!689908))

(assert (not b!689914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

