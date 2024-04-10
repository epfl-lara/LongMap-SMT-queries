; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61768 () Bool)

(assert start!61768)

(declare-fun b!691226 () Bool)

(declare-fun res!455618 () Bool)

(declare-fun e!393441 () Bool)

(assert (=> b!691226 (=> (not res!455618) (not e!393441))))

(declare-datatypes ((array!39789 0))(
  ( (array!39790 (arr!19063 (Array (_ BitVec 32) (_ BitVec 64))) (size!19448 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39789)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691226 (= res!455618 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!455616 () Bool)

(assert (=> start!61768 (=> (not res!455616) (not e!393441))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61768 (= res!455616 (and (bvslt (size!19448 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19448 a!3626))))))

(assert (=> start!61768 e!393441))

(assert (=> start!61768 true))

(declare-fun array_inv!14859 (array!39789) Bool)

(assert (=> start!61768 (array_inv!14859 a!3626)))

(declare-fun b!691227 () Bool)

(declare-fun e!393437 () Bool)

(declare-datatypes ((List!13104 0))(
  ( (Nil!13101) (Cons!13100 (h!14145 (_ BitVec 64)) (t!19371 List!13104)) )
))
(declare-fun acc!681 () List!13104)

(declare-fun contains!3681 (List!13104 (_ BitVec 64)) Bool)

(assert (=> b!691227 (= e!393437 (contains!3681 acc!681 k0!2843))))

(declare-fun b!691228 () Bool)

(declare-fun res!455612 () Bool)

(assert (=> b!691228 (=> (not res!455612) (not e!393441))))

(declare-fun arrayNoDuplicates!0 (array!39789 (_ BitVec 32) List!13104) Bool)

(assert (=> b!691228 (= res!455612 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691229 () Bool)

(declare-fun e!393440 () Bool)

(assert (=> b!691229 (= e!393440 (not (contains!3681 acc!681 k0!2843)))))

(declare-fun b!691230 () Bool)

(declare-fun e!393439 () Bool)

(assert (=> b!691230 (= e!393439 e!393440)))

(declare-fun res!455620 () Bool)

(assert (=> b!691230 (=> (not res!455620) (not e!393440))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691230 (= res!455620 (bvsle from!3004 i!1382))))

(declare-fun b!691231 () Bool)

(declare-fun res!455621 () Bool)

(assert (=> b!691231 (=> (not res!455621) (not e!393441))))

(assert (=> b!691231 (= res!455621 (not (contains!3681 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691232 () Bool)

(declare-fun res!455609 () Bool)

(assert (=> b!691232 (=> (not res!455609) (not e!393441))))

(assert (=> b!691232 (= res!455609 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13101))))

(declare-fun b!691233 () Bool)

(declare-fun res!455606 () Bool)

(assert (=> b!691233 (=> (not res!455606) (not e!393441))))

(assert (=> b!691233 (= res!455606 (= (select (arr!19063 a!3626) from!3004) k0!2843))))

(declare-fun b!691234 () Bool)

(assert (=> b!691234 (= e!393441 (not true))))

(assert (=> b!691234 false))

(declare-datatypes ((Unit!24374 0))(
  ( (Unit!24375) )
))
(declare-fun lt!316444 () Unit!24374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39789 (_ BitVec 64) (_ BitVec 32)) Unit!24374)

(assert (=> b!691234 (= lt!316444 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!691234 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun b!691235 () Bool)

(declare-fun res!455614 () Bool)

(assert (=> b!691235 (=> (not res!455614) (not e!393441))))

(assert (=> b!691235 (= res!455614 (not (contains!3681 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691236 () Bool)

(declare-fun res!455615 () Bool)

(assert (=> b!691236 (=> (not res!455615) (not e!393441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691236 (= res!455615 (validKeyInArray!0 k0!2843))))

(declare-fun b!691237 () Bool)

(declare-fun res!455607 () Bool)

(assert (=> b!691237 (=> (not res!455607) (not e!393441))))

(assert (=> b!691237 (= res!455607 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19448 a!3626))))))

(declare-fun b!691238 () Bool)

(declare-fun res!455613 () Bool)

(assert (=> b!691238 (=> (not res!455613) (not e!393441))))

(declare-fun noDuplicate!928 (List!13104) Bool)

(assert (=> b!691238 (= res!455613 (noDuplicate!928 acc!681))))

(declare-fun b!691239 () Bool)

(declare-fun res!455611 () Bool)

(assert (=> b!691239 (=> (not res!455611) (not e!393441))))

(assert (=> b!691239 (= res!455611 (validKeyInArray!0 (select (arr!19063 a!3626) from!3004)))))

(declare-fun b!691240 () Bool)

(declare-fun res!455619 () Bool)

(assert (=> b!691240 (=> (not res!455619) (not e!393441))))

(assert (=> b!691240 (= res!455619 e!393439)))

(declare-fun res!455610 () Bool)

(assert (=> b!691240 (=> res!455610 e!393439)))

(assert (=> b!691240 (= res!455610 e!393437)))

(declare-fun res!455617 () Bool)

(assert (=> b!691240 (=> (not res!455617) (not e!393437))))

(assert (=> b!691240 (= res!455617 (bvsgt from!3004 i!1382))))

(declare-fun b!691241 () Bool)

(declare-fun res!455608 () Bool)

(assert (=> b!691241 (=> (not res!455608) (not e!393441))))

(assert (=> b!691241 (= res!455608 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19448 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!61768 res!455616) b!691238))

(assert (= (and b!691238 res!455613) b!691231))

(assert (= (and b!691231 res!455621) b!691235))

(assert (= (and b!691235 res!455614) b!691240))

(assert (= (and b!691240 res!455617) b!691227))

(assert (= (and b!691240 (not res!455610)) b!691230))

(assert (= (and b!691230 res!455620) b!691229))

(assert (= (and b!691240 res!455619) b!691232))

(assert (= (and b!691232 res!455609) b!691228))

(assert (= (and b!691228 res!455612) b!691237))

(assert (= (and b!691237 res!455607) b!691236))

(assert (= (and b!691236 res!455615) b!691226))

(assert (= (and b!691226 res!455618) b!691241))

(assert (= (and b!691241 res!455608) b!691239))

(assert (= (and b!691239 res!455611) b!691233))

(assert (= (and b!691233 res!455606) b!691234))

(declare-fun m!654355 () Bool)

(assert (=> b!691239 m!654355))

(assert (=> b!691239 m!654355))

(declare-fun m!654357 () Bool)

(assert (=> b!691239 m!654357))

(declare-fun m!654359 () Bool)

(assert (=> b!691228 m!654359))

(declare-fun m!654361 () Bool)

(assert (=> b!691231 m!654361))

(declare-fun m!654363 () Bool)

(assert (=> b!691232 m!654363))

(declare-fun m!654365 () Bool)

(assert (=> b!691229 m!654365))

(declare-fun m!654367 () Bool)

(assert (=> b!691238 m!654367))

(declare-fun m!654369 () Bool)

(assert (=> b!691236 m!654369))

(declare-fun m!654371 () Bool)

(assert (=> b!691235 m!654371))

(declare-fun m!654373 () Bool)

(assert (=> b!691226 m!654373))

(assert (=> b!691227 m!654365))

(declare-fun m!654375 () Bool)

(assert (=> b!691234 m!654375))

(declare-fun m!654377 () Bool)

(assert (=> b!691234 m!654377))

(declare-fun m!654379 () Bool)

(assert (=> start!61768 m!654379))

(assert (=> b!691233 m!654355))

(check-sat (not b!691238) (not b!691239) (not b!691236) (not b!691235) (not b!691234) (not start!61768) (not b!691232) (not b!691226) (not b!691227) (not b!691231) (not b!691228) (not b!691229))
