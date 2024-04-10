; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60144 () Bool)

(assert start!60144)

(declare-fun b!671348 () Bool)

(declare-fun res!438055 () Bool)

(declare-fun e!383698 () Bool)

(assert (=> b!671348 (=> (not res!438055) (not e!383698))))

(declare-datatypes ((List!12829 0))(
  ( (Nil!12826) (Cons!12825 (h!13870 (_ BitVec 64)) (t!19057 List!12829)) )
))
(declare-fun acc!681 () List!12829)

(declare-fun contains!3406 (List!12829 (_ BitVec 64)) Bool)

(assert (=> b!671348 (= res!438055 (not (contains!3406 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671349 () Bool)

(assert (=> b!671349 (= e!383698 (not true))))

(declare-datatypes ((array!39191 0))(
  ( (array!39192 (arr!18788 (Array (_ BitVec 32) (_ BitVec 64))) (size!19152 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39191)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671349 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!671350 () Bool)

(declare-fun res!438046 () Bool)

(assert (=> b!671350 (=> (not res!438046) (not e!383698))))

(declare-fun noDuplicate!653 (List!12829) Bool)

(assert (=> b!671350 (= res!438046 (noDuplicate!653 acc!681))))

(declare-fun b!671351 () Bool)

(declare-fun e!383696 () Bool)

(declare-fun e!383697 () Bool)

(assert (=> b!671351 (= e!383696 e!383697)))

(declare-fun res!438057 () Bool)

(assert (=> b!671351 (=> (not res!438057) (not e!383697))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671351 (= res!438057 (bvsle from!3004 i!1382))))

(declare-fun b!671352 () Bool)

(declare-fun res!438044 () Bool)

(assert (=> b!671352 (=> (not res!438044) (not e!383698))))

(assert (=> b!671352 (= res!438044 e!383696)))

(declare-fun res!438045 () Bool)

(assert (=> b!671352 (=> res!438045 e!383696)))

(declare-fun e!383700 () Bool)

(assert (=> b!671352 (= res!438045 e!383700)))

(declare-fun res!438053 () Bool)

(assert (=> b!671352 (=> (not res!438053) (not e!383700))))

(assert (=> b!671352 (= res!438053 (bvsgt from!3004 i!1382))))

(declare-fun b!671353 () Bool)

(assert (=> b!671353 (= e!383700 (contains!3406 acc!681 k!2843))))

(declare-fun b!671354 () Bool)

(declare-fun res!438047 () Bool)

(assert (=> b!671354 (=> (not res!438047) (not e!383698))))

(declare-fun arrayNoDuplicates!0 (array!39191 (_ BitVec 32) List!12829) Bool)

(assert (=> b!671354 (= res!438047 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671355 () Bool)

(assert (=> b!671355 (= e!383697 (not (contains!3406 acc!681 k!2843)))))

(declare-fun b!671357 () Bool)

(declare-fun res!438054 () Bool)

(assert (=> b!671357 (=> (not res!438054) (not e!383698))))

(assert (=> b!671357 (= res!438054 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19152 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671358 () Bool)

(declare-fun res!438052 () Bool)

(assert (=> b!671358 (=> (not res!438052) (not e!383698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671358 (= res!438052 (validKeyInArray!0 k!2843))))

(declare-fun b!671359 () Bool)

(declare-fun res!438058 () Bool)

(assert (=> b!671359 (=> (not res!438058) (not e!383698))))

(assert (=> b!671359 (= res!438058 (= (select (arr!18788 a!3626) from!3004) k!2843))))

(declare-fun b!671360 () Bool)

(declare-fun res!438048 () Bool)

(assert (=> b!671360 (=> (not res!438048) (not e!383698))))

(assert (=> b!671360 (= res!438048 (validKeyInArray!0 (select (arr!18788 a!3626) from!3004)))))

(declare-fun b!671361 () Bool)

(declare-fun res!438059 () Bool)

(assert (=> b!671361 (=> (not res!438059) (not e!383698))))

(assert (=> b!671361 (= res!438059 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12826))))

(declare-fun res!438056 () Bool)

(assert (=> start!60144 (=> (not res!438056) (not e!383698))))

(assert (=> start!60144 (= res!438056 (and (bvslt (size!19152 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19152 a!3626))))))

(assert (=> start!60144 e!383698))

(assert (=> start!60144 true))

(declare-fun array_inv!14584 (array!39191) Bool)

(assert (=> start!60144 (array_inv!14584 a!3626)))

(declare-fun b!671356 () Bool)

(declare-fun res!438051 () Bool)

(assert (=> b!671356 (=> (not res!438051) (not e!383698))))

(assert (=> b!671356 (= res!438051 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19152 a!3626))))))

(declare-fun b!671362 () Bool)

(declare-fun res!438050 () Bool)

(assert (=> b!671362 (=> (not res!438050) (not e!383698))))

(assert (=> b!671362 (= res!438050 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671363 () Bool)

(declare-fun res!438049 () Bool)

(assert (=> b!671363 (=> (not res!438049) (not e!383698))))

(assert (=> b!671363 (= res!438049 (not (contains!3406 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60144 res!438056) b!671350))

(assert (= (and b!671350 res!438046) b!671363))

(assert (= (and b!671363 res!438049) b!671348))

(assert (= (and b!671348 res!438055) b!671352))

(assert (= (and b!671352 res!438053) b!671353))

(assert (= (and b!671352 (not res!438045)) b!671351))

(assert (= (and b!671351 res!438057) b!671355))

(assert (= (and b!671352 res!438044) b!671361))

(assert (= (and b!671361 res!438059) b!671354))

(assert (= (and b!671354 res!438047) b!671356))

(assert (= (and b!671356 res!438051) b!671358))

(assert (= (and b!671358 res!438052) b!671362))

(assert (= (and b!671362 res!438050) b!671357))

(assert (= (and b!671357 res!438054) b!671360))

(assert (= (and b!671360 res!438048) b!671359))

(assert (= (and b!671359 res!438058) b!671349))

(declare-fun m!640877 () Bool)

(assert (=> b!671355 m!640877))

(declare-fun m!640879 () Bool)

(assert (=> b!671362 m!640879))

(declare-fun m!640881 () Bool)

(assert (=> b!671363 m!640881))

(declare-fun m!640883 () Bool)

(assert (=> b!671349 m!640883))

(declare-fun m!640885 () Bool)

(assert (=> b!671350 m!640885))

(declare-fun m!640887 () Bool)

(assert (=> b!671359 m!640887))

(assert (=> b!671360 m!640887))

(assert (=> b!671360 m!640887))

(declare-fun m!640889 () Bool)

(assert (=> b!671360 m!640889))

(declare-fun m!640891 () Bool)

(assert (=> b!671361 m!640891))

(declare-fun m!640893 () Bool)

(assert (=> b!671348 m!640893))

(declare-fun m!640895 () Bool)

(assert (=> start!60144 m!640895))

(declare-fun m!640897 () Bool)

(assert (=> b!671358 m!640897))

(declare-fun m!640899 () Bool)

(assert (=> b!671354 m!640899))

(assert (=> b!671353 m!640877))

(push 1)

(assert (not b!671353))

(assert (not b!671362))

(assert (not b!671361))

(assert (not b!671348))

(assert (not start!60144))

(assert (not b!671360))

(assert (not b!671355))

(assert (not b!671358))

(assert (not b!671354))

(assert (not b!671350))

(assert (not b!671349))

(assert (not b!671363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

