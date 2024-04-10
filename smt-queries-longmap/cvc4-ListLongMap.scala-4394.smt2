; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60432 () Bool)

(assert start!60432)

(declare-fun b!679123 () Bool)

(declare-fun res!445513 () Bool)

(declare-fun e!386933 () Bool)

(assert (=> b!679123 (=> (not res!445513) (not e!386933))))

(declare-datatypes ((List!12955 0))(
  ( (Nil!12952) (Cons!12951 (h!13996 (_ BitVec 64)) (t!19183 List!12955)) )
))
(declare-fun acc!681 () List!12955)

(declare-fun noDuplicate!779 (List!12955) Bool)

(assert (=> b!679123 (= res!445513 (noDuplicate!779 acc!681))))

(declare-fun b!679124 () Bool)

(assert (=> b!679124 (= e!386933 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39446 0))(
  ( (array!39447 (arr!18914 (Array (_ BitVec 32) (_ BitVec 64))) (size!19278 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39446)

(declare-fun arrayContainsKey!0 (array!39446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679124 (arrayContainsKey!0 (array!39447 (store (arr!18914 a!3626) i!1382 k!2843) (size!19278 a!3626)) k!2843 from!3004)))

(declare-fun b!679125 () Bool)

(declare-fun res!445514 () Bool)

(assert (=> b!679125 (=> (not res!445514) (not e!386933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679125 (= res!445514 (validKeyInArray!0 k!2843))))

(declare-fun b!679126 () Bool)

(declare-fun res!445518 () Bool)

(assert (=> b!679126 (=> (not res!445518) (not e!386933))))

(assert (=> b!679126 (= res!445518 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19278 a!3626))))))

(declare-fun b!679127 () Bool)

(declare-fun e!386931 () Bool)

(declare-fun e!386932 () Bool)

(assert (=> b!679127 (= e!386931 e!386932)))

(declare-fun res!445519 () Bool)

(assert (=> b!679127 (=> (not res!445519) (not e!386932))))

(assert (=> b!679127 (= res!445519 (bvsle from!3004 i!1382))))

(declare-fun b!679128 () Bool)

(declare-fun res!445520 () Bool)

(assert (=> b!679128 (=> (not res!445520) (not e!386933))))

(assert (=> b!679128 (= res!445520 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!445507 () Bool)

(assert (=> start!60432 (=> (not res!445507) (not e!386933))))

(assert (=> start!60432 (= res!445507 (and (bvslt (size!19278 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19278 a!3626))))))

(assert (=> start!60432 e!386933))

(assert (=> start!60432 true))

(declare-fun array_inv!14710 (array!39446) Bool)

(assert (=> start!60432 (array_inv!14710 a!3626)))

(declare-fun b!679129 () Bool)

(declare-fun res!445517 () Bool)

(assert (=> b!679129 (=> (not res!445517) (not e!386933))))

(declare-fun arrayNoDuplicates!0 (array!39446 (_ BitVec 32) List!12955) Bool)

(assert (=> b!679129 (= res!445517 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679130 () Bool)

(declare-fun res!445509 () Bool)

(assert (=> b!679130 (=> (not res!445509) (not e!386933))))

(assert (=> b!679130 (= res!445509 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12952))))

(declare-fun b!679131 () Bool)

(declare-fun res!445511 () Bool)

(assert (=> b!679131 (=> (not res!445511) (not e!386933))))

(assert (=> b!679131 (= res!445511 e!386931)))

(declare-fun res!445512 () Bool)

(assert (=> b!679131 (=> res!445512 e!386931)))

(declare-fun e!386934 () Bool)

(assert (=> b!679131 (= res!445512 e!386934)))

(declare-fun res!445508 () Bool)

(assert (=> b!679131 (=> (not res!445508) (not e!386934))))

(assert (=> b!679131 (= res!445508 (bvsgt from!3004 i!1382))))

(declare-fun b!679132 () Bool)

(declare-fun res!445510 () Bool)

(assert (=> b!679132 (=> (not res!445510) (not e!386933))))

(declare-fun contains!3532 (List!12955 (_ BitVec 64)) Bool)

(assert (=> b!679132 (= res!445510 (not (contains!3532 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679133 () Bool)

(declare-fun res!445516 () Bool)

(assert (=> b!679133 (=> (not res!445516) (not e!386933))))

(assert (=> b!679133 (= res!445516 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19278 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679134 () Bool)

(declare-fun res!445515 () Bool)

(assert (=> b!679134 (=> (not res!445515) (not e!386933))))

(assert (=> b!679134 (= res!445515 (not (contains!3532 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679135 () Bool)

(assert (=> b!679135 (= e!386934 (contains!3532 acc!681 k!2843))))

(declare-fun b!679136 () Bool)

(assert (=> b!679136 (= e!386932 (not (contains!3532 acc!681 k!2843)))))

(assert (= (and start!60432 res!445507) b!679123))

(assert (= (and b!679123 res!445513) b!679132))

(assert (= (and b!679132 res!445510) b!679134))

(assert (= (and b!679134 res!445515) b!679131))

(assert (= (and b!679131 res!445508) b!679135))

(assert (= (and b!679131 (not res!445512)) b!679127))

(assert (= (and b!679127 res!445519) b!679136))

(assert (= (and b!679131 res!445511) b!679130))

(assert (= (and b!679130 res!445509) b!679129))

(assert (= (and b!679129 res!445517) b!679126))

(assert (= (and b!679126 res!445518) b!679125))

(assert (= (and b!679125 res!445514) b!679128))

(assert (= (and b!679128 res!445520) b!679133))

(assert (= (and b!679133 res!445516) b!679124))

(declare-fun m!644623 () Bool)

(assert (=> b!679135 m!644623))

(declare-fun m!644625 () Bool)

(assert (=> b!679134 m!644625))

(declare-fun m!644627 () Bool)

(assert (=> b!679132 m!644627))

(declare-fun m!644629 () Bool)

(assert (=> b!679125 m!644629))

(assert (=> b!679136 m!644623))

(declare-fun m!644631 () Bool)

(assert (=> start!60432 m!644631))

(declare-fun m!644633 () Bool)

(assert (=> b!679123 m!644633))

(declare-fun m!644635 () Bool)

(assert (=> b!679129 m!644635))

(declare-fun m!644637 () Bool)

(assert (=> b!679128 m!644637))

(declare-fun m!644639 () Bool)

(assert (=> b!679124 m!644639))

(declare-fun m!644641 () Bool)

(assert (=> b!679124 m!644641))

(declare-fun m!644643 () Bool)

(assert (=> b!679130 m!644643))

(push 1)

(assert (not b!679123))

(assert (not b!679136))

(assert (not b!679124))

(assert (not b!679132))

(assert (not start!60432))

(assert (not b!679135))

(assert (not b!679128))

(assert (not b!679134))

(assert (not b!679130))

(assert (not b!679125))

(assert (not b!679129))

(check-sat)

