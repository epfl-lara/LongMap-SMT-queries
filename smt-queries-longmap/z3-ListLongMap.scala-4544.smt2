; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63328 () Bool)

(assert start!63328)

(declare-fun b!712976 () Bool)

(declare-fun res!476232 () Bool)

(declare-fun e!401034 () Bool)

(assert (=> b!712976 (=> (not res!476232) (not e!401034))))

(declare-datatypes ((List!13441 0))(
  ( (Nil!13438) (Cons!13437 (h!14482 (_ BitVec 64)) (t!19747 List!13441)) )
))
(declare-fun newAcc!49 () List!13441)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13441)

(declare-fun -!390 (List!13441 (_ BitVec 64)) List!13441)

(assert (=> b!712976 (= res!476232 (= (-!390 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712977 () Bool)

(declare-fun res!476229 () Bool)

(assert (=> b!712977 (=> (not res!476229) (not e!401034))))

(declare-datatypes ((array!40443 0))(
  ( (array!40444 (arr!19361 (Array (_ BitVec 32) (_ BitVec 64))) (size!19773 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40443)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712977 (= res!476229 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712978 () Bool)

(declare-fun res!476233 () Bool)

(assert (=> b!712978 (=> (not res!476233) (not e!401034))))

(declare-fun contains!3963 (List!13441 (_ BitVec 64)) Bool)

(assert (=> b!712978 (= res!476233 (not (contains!3963 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712979 () Bool)

(assert (=> b!712979 (= e!401034 false)))

(declare-fun lt!318434 () Bool)

(assert (=> b!712979 (= lt!318434 (contains!3963 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712980 () Bool)

(declare-fun res!476226 () Bool)

(assert (=> b!712980 (=> (not res!476226) (not e!401034))))

(declare-fun noDuplicate!1232 (List!13441) Bool)

(assert (=> b!712980 (= res!476226 (noDuplicate!1232 acc!652))))

(declare-fun b!712981 () Bool)

(declare-fun res!476227 () Bool)

(assert (=> b!712981 (=> (not res!476227) (not e!401034))))

(assert (=> b!712981 (= res!476227 (not (contains!3963 acc!652 k0!2824)))))

(declare-fun b!712982 () Bool)

(declare-fun res!476237 () Bool)

(assert (=> b!712982 (=> (not res!476237) (not e!401034))))

(assert (=> b!712982 (= res!476237 (noDuplicate!1232 newAcc!49))))

(declare-fun b!712983 () Bool)

(declare-fun res!476238 () Bool)

(assert (=> b!712983 (=> (not res!476238) (not e!401034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712983 (= res!476238 (validKeyInArray!0 k0!2824))))

(declare-fun res!476230 () Bool)

(assert (=> start!63328 (=> (not res!476230) (not e!401034))))

(assert (=> start!63328 (= res!476230 (and (bvslt (size!19773 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19773 a!3591))))))

(assert (=> start!63328 e!401034))

(assert (=> start!63328 true))

(declare-fun array_inv!15244 (array!40443) Bool)

(assert (=> start!63328 (array_inv!15244 a!3591)))

(declare-fun b!712984 () Bool)

(declare-fun res!476236 () Bool)

(assert (=> b!712984 (=> (not res!476236) (not e!401034))))

(assert (=> b!712984 (= res!476236 (contains!3963 newAcc!49 k0!2824))))

(declare-fun b!712985 () Bool)

(declare-fun res!476235 () Bool)

(assert (=> b!712985 (=> (not res!476235) (not e!401034))))

(declare-fun subseq!425 (List!13441 List!13441) Bool)

(assert (=> b!712985 (= res!476235 (subseq!425 acc!652 newAcc!49))))

(declare-fun b!712986 () Bool)

(declare-fun res!476231 () Bool)

(assert (=> b!712986 (=> (not res!476231) (not e!401034))))

(assert (=> b!712986 (= res!476231 (not (contains!3963 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712987 () Bool)

(declare-fun res!476234 () Bool)

(assert (=> b!712987 (=> (not res!476234) (not e!401034))))

(assert (=> b!712987 (= res!476234 (not (contains!3963 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712988 () Bool)

(declare-fun res!476228 () Bool)

(assert (=> b!712988 (=> (not res!476228) (not e!401034))))

(declare-fun arrayNoDuplicates!0 (array!40443 (_ BitVec 32) List!13441) Bool)

(assert (=> b!712988 (= res!476228 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!63328 res!476230) b!712980))

(assert (= (and b!712980 res!476226) b!712982))

(assert (= (and b!712982 res!476237) b!712987))

(assert (= (and b!712987 res!476234) b!712986))

(assert (= (and b!712986 res!476231) b!712977))

(assert (= (and b!712977 res!476229) b!712981))

(assert (= (and b!712981 res!476227) b!712983))

(assert (= (and b!712983 res!476238) b!712988))

(assert (= (and b!712988 res!476228) b!712985))

(assert (= (and b!712985 res!476235) b!712984))

(assert (= (and b!712984 res!476236) b!712976))

(assert (= (and b!712976 res!476232) b!712978))

(assert (= (and b!712978 res!476233) b!712979))

(declare-fun m!669345 () Bool)

(assert (=> b!712978 m!669345))

(declare-fun m!669347 () Bool)

(assert (=> b!712976 m!669347))

(declare-fun m!669349 () Bool)

(assert (=> b!712988 m!669349))

(declare-fun m!669351 () Bool)

(assert (=> b!712981 m!669351))

(declare-fun m!669353 () Bool)

(assert (=> b!712982 m!669353))

(declare-fun m!669355 () Bool)

(assert (=> b!712987 m!669355))

(declare-fun m!669357 () Bool)

(assert (=> b!712986 m!669357))

(declare-fun m!669359 () Bool)

(assert (=> b!712985 m!669359))

(declare-fun m!669361 () Bool)

(assert (=> b!712983 m!669361))

(declare-fun m!669363 () Bool)

(assert (=> b!712977 m!669363))

(declare-fun m!669365 () Bool)

(assert (=> b!712979 m!669365))

(declare-fun m!669367 () Bool)

(assert (=> b!712984 m!669367))

(declare-fun m!669369 () Bool)

(assert (=> start!63328 m!669369))

(declare-fun m!669371 () Bool)

(assert (=> b!712980 m!669371))

(check-sat (not b!712978) (not b!712983) (not b!712982) (not b!712986) (not b!712985) (not b!712981) (not b!712987) (not b!712980) (not b!712976) (not b!712988) (not start!63328) (not b!712979) (not b!712977) (not b!712984))
(check-sat)
