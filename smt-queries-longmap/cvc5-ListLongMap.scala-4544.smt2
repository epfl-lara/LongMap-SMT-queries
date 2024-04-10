; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63340 () Bool)

(assert start!63340)

(declare-fun res!476375 () Bool)

(declare-fun e!401230 () Bool)

(assert (=> start!63340 (=> (not res!476375) (not e!401230))))

(declare-datatypes ((array!40444 0))(
  ( (array!40445 (arr!19362 (Array (_ BitVec 32) (_ BitVec 64))) (size!19773 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40444)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63340 (= res!476375 (and (bvslt (size!19773 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19773 a!3591))))))

(assert (=> start!63340 e!401230))

(assert (=> start!63340 true))

(declare-fun array_inv!15158 (array!40444) Bool)

(assert (=> start!63340 (array_inv!15158 a!3591)))

(declare-fun b!713281 () Bool)

(declare-fun res!476370 () Bool)

(assert (=> b!713281 (=> (not res!476370) (not e!401230))))

(declare-datatypes ((List!13403 0))(
  ( (Nil!13400) (Cons!13399 (h!14444 (_ BitVec 64)) (t!19718 List!13403)) )
))
(declare-fun acc!652 () List!13403)

(declare-fun noDuplicate!1227 (List!13403) Bool)

(assert (=> b!713281 (= res!476370 (noDuplicate!1227 acc!652))))

(declare-fun b!713282 () Bool)

(declare-fun res!476374 () Bool)

(assert (=> b!713282 (=> (not res!476374) (not e!401230))))

(declare-fun arrayNoDuplicates!0 (array!40444 (_ BitVec 32) List!13403) Bool)

(assert (=> b!713282 (= res!476374 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713283 () Bool)

(declare-fun res!476368 () Bool)

(assert (=> b!713283 (=> (not res!476368) (not e!401230))))

(declare-fun contains!3980 (List!13403 (_ BitVec 64)) Bool)

(assert (=> b!713283 (= res!476368 (not (contains!3980 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713284 () Bool)

(declare-fun res!476365 () Bool)

(assert (=> b!713284 (=> (not res!476365) (not e!401230))))

(declare-fun newAcc!49 () List!13403)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!390 (List!13403 (_ BitVec 64)) List!13403)

(assert (=> b!713284 (= res!476365 (= (-!390 newAcc!49 k!2824) acc!652))))

(declare-fun b!713285 () Bool)

(declare-fun res!476366 () Bool)

(assert (=> b!713285 (=> (not res!476366) (not e!401230))))

(assert (=> b!713285 (= res!476366 (not (contains!3980 acc!652 k!2824)))))

(declare-fun b!713286 () Bool)

(declare-fun res!476373 () Bool)

(assert (=> b!713286 (=> (not res!476373) (not e!401230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713286 (= res!476373 (validKeyInArray!0 k!2824))))

(declare-fun b!713287 () Bool)

(declare-fun res!476371 () Bool)

(assert (=> b!713287 (=> (not res!476371) (not e!401230))))

(assert (=> b!713287 (= res!476371 (not (contains!3980 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713288 () Bool)

(assert (=> b!713288 (= e!401230 false)))

(declare-fun lt!318689 () Bool)

(assert (=> b!713288 (= lt!318689 (contains!3980 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713289 () Bool)

(declare-fun res!476372 () Bool)

(assert (=> b!713289 (=> (not res!476372) (not e!401230))))

(assert (=> b!713289 (= res!476372 (not (contains!3980 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713290 () Bool)

(declare-fun res!476376 () Bool)

(assert (=> b!713290 (=> (not res!476376) (not e!401230))))

(declare-fun subseq!425 (List!13403 List!13403) Bool)

(assert (=> b!713290 (= res!476376 (subseq!425 acc!652 newAcc!49))))

(declare-fun b!713291 () Bool)

(declare-fun res!476367 () Bool)

(assert (=> b!713291 (=> (not res!476367) (not e!401230))))

(assert (=> b!713291 (= res!476367 (contains!3980 newAcc!49 k!2824))))

(declare-fun b!713292 () Bool)

(declare-fun res!476377 () Bool)

(assert (=> b!713292 (=> (not res!476377) (not e!401230))))

(assert (=> b!713292 (= res!476377 (noDuplicate!1227 newAcc!49))))

(declare-fun b!713293 () Bool)

(declare-fun res!476369 () Bool)

(assert (=> b!713293 (=> (not res!476369) (not e!401230))))

(declare-fun arrayContainsKey!0 (array!40444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713293 (= res!476369 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!63340 res!476375) b!713281))

(assert (= (and b!713281 res!476370) b!713292))

(assert (= (and b!713292 res!476377) b!713283))

(assert (= (and b!713283 res!476368) b!713287))

(assert (= (and b!713287 res!476371) b!713293))

(assert (= (and b!713293 res!476369) b!713285))

(assert (= (and b!713285 res!476366) b!713286))

(assert (= (and b!713286 res!476373) b!713282))

(assert (= (and b!713282 res!476374) b!713290))

(assert (= (and b!713290 res!476376) b!713291))

(assert (= (and b!713291 res!476367) b!713284))

(assert (= (and b!713284 res!476365) b!713289))

(assert (= (and b!713289 res!476372) b!713288))

(declare-fun m!670135 () Bool)

(assert (=> b!713287 m!670135))

(declare-fun m!670137 () Bool)

(assert (=> b!713292 m!670137))

(declare-fun m!670139 () Bool)

(assert (=> b!713291 m!670139))

(declare-fun m!670141 () Bool)

(assert (=> b!713283 m!670141))

(declare-fun m!670143 () Bool)

(assert (=> b!713284 m!670143))

(declare-fun m!670145 () Bool)

(assert (=> b!713290 m!670145))

(declare-fun m!670147 () Bool)

(assert (=> b!713281 m!670147))

(declare-fun m!670149 () Bool)

(assert (=> b!713289 m!670149))

(declare-fun m!670151 () Bool)

(assert (=> b!713285 m!670151))

(declare-fun m!670153 () Bool)

(assert (=> start!63340 m!670153))

(declare-fun m!670155 () Bool)

(assert (=> b!713282 m!670155))

(declare-fun m!670157 () Bool)

(assert (=> b!713293 m!670157))

(declare-fun m!670159 () Bool)

(assert (=> b!713288 m!670159))

(declare-fun m!670161 () Bool)

(assert (=> b!713286 m!670161))

(push 1)

(assert (not b!713283))

(assert (not b!713282))

(assert (not b!713284))

(assert (not b!713292))

(assert (not b!713289))

(assert (not b!713290))

(assert (not start!63340))

(assert (not b!713285))

(assert (not b!713293))

(assert (not b!713288))

(assert (not b!713281))

(assert (not b!713291))

(assert (not b!713286))

(assert (not b!713287))

(check-sat)

