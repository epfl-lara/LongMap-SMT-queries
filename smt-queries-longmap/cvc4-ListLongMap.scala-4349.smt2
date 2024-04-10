; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60126 () Bool)

(assert start!60126)

(declare-fun res!437627 () Bool)

(declare-fun e!383564 () Bool)

(assert (=> start!60126 (=> (not res!437627) (not e!383564))))

(declare-datatypes ((array!39173 0))(
  ( (array!39174 (arr!18779 (Array (_ BitVec 32) (_ BitVec 64))) (size!19143 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39173)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60126 (= res!437627 (and (bvslt (size!19143 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19143 a!3626))))))

(assert (=> start!60126 e!383564))

(assert (=> start!60126 true))

(declare-fun array_inv!14575 (array!39173) Bool)

(assert (=> start!60126 (array_inv!14575 a!3626)))

(declare-fun b!670923 () Bool)

(declare-fun e!383563 () Bool)

(declare-datatypes ((List!12820 0))(
  ( (Nil!12817) (Cons!12816 (h!13861 (_ BitVec 64)) (t!19048 List!12820)) )
))
(declare-fun acc!681 () List!12820)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3397 (List!12820 (_ BitVec 64)) Bool)

(assert (=> b!670923 (= e!383563 (not (contains!3397 acc!681 k!2843)))))

(declare-fun b!670924 () Bool)

(declare-fun res!437621 () Bool)

(assert (=> b!670924 (=> (not res!437621) (not e!383564))))

(assert (=> b!670924 (= res!437621 (not (contains!3397 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670925 () Bool)

(declare-fun res!437620 () Bool)

(assert (=> b!670925 (=> (not res!437620) (not e!383564))))

(assert (=> b!670925 (= res!437620 (not (contains!3397 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670926 () Bool)

(assert (=> b!670926 (= e!383564 false)))

(declare-fun lt!312166 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39173 (_ BitVec 32) List!12820) Bool)

(assert (=> b!670926 (= lt!312166 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670927 () Bool)

(declare-fun e!383565 () Bool)

(assert (=> b!670927 (= e!383565 (contains!3397 acc!681 k!2843))))

(declare-fun b!670928 () Bool)

(declare-fun e!383562 () Bool)

(assert (=> b!670928 (= e!383562 e!383563)))

(declare-fun res!437626 () Bool)

(assert (=> b!670928 (=> (not res!437626) (not e!383563))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670928 (= res!437626 (bvsle from!3004 i!1382))))

(declare-fun b!670929 () Bool)

(declare-fun res!437625 () Bool)

(assert (=> b!670929 (=> (not res!437625) (not e!383564))))

(assert (=> b!670929 (= res!437625 e!383562)))

(declare-fun res!437623 () Bool)

(assert (=> b!670929 (=> res!437623 e!383562)))

(assert (=> b!670929 (= res!437623 e!383565)))

(declare-fun res!437624 () Bool)

(assert (=> b!670929 (=> (not res!437624) (not e!383565))))

(assert (=> b!670929 (= res!437624 (bvsgt from!3004 i!1382))))

(declare-fun b!670930 () Bool)

(declare-fun res!437619 () Bool)

(assert (=> b!670930 (=> (not res!437619) (not e!383564))))

(declare-fun noDuplicate!644 (List!12820) Bool)

(assert (=> b!670930 (= res!437619 (noDuplicate!644 acc!681))))

(declare-fun b!670931 () Bool)

(declare-fun res!437622 () Bool)

(assert (=> b!670931 (=> (not res!437622) (not e!383564))))

(assert (=> b!670931 (= res!437622 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12817))))

(assert (= (and start!60126 res!437627) b!670930))

(assert (= (and b!670930 res!437619) b!670924))

(assert (= (and b!670924 res!437621) b!670925))

(assert (= (and b!670925 res!437620) b!670929))

(assert (= (and b!670929 res!437624) b!670927))

(assert (= (and b!670929 (not res!437623)) b!670928))

(assert (= (and b!670928 res!437626) b!670923))

(assert (= (and b!670929 res!437625) b!670931))

(assert (= (and b!670931 res!437622) b!670926))

(declare-fun m!640671 () Bool)

(assert (=> b!670927 m!640671))

(declare-fun m!640673 () Bool)

(assert (=> b!670924 m!640673))

(declare-fun m!640675 () Bool)

(assert (=> b!670930 m!640675))

(declare-fun m!640677 () Bool)

(assert (=> start!60126 m!640677))

(declare-fun m!640679 () Bool)

(assert (=> b!670926 m!640679))

(assert (=> b!670923 m!640671))

(declare-fun m!640681 () Bool)

(assert (=> b!670931 m!640681))

(declare-fun m!640683 () Bool)

(assert (=> b!670925 m!640683))

(push 1)

(assert (not b!670923))

(assert (not b!670927))

(assert (not b!670926))

(assert (not b!670931))

(assert (not b!670924))

(assert (not start!60126))

(assert (not b!670925))

(assert (not b!670930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

