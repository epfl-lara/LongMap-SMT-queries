; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62600 () Bool)

(assert start!62600)

(declare-fun b!706295 () Bool)

(declare-fun res!470270 () Bool)

(declare-fun e!397792 () Bool)

(assert (=> b!706295 (=> (not res!470270) (not e!397792))))

(declare-datatypes ((List!13381 0))(
  ( (Nil!13378) (Cons!13377 (h!14422 (_ BitVec 64)) (t!19654 List!13381)) )
))
(declare-fun newAcc!49 () List!13381)

(declare-fun acc!652 () List!13381)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!330 (List!13381 (_ BitVec 64)) List!13381)

(assert (=> b!706295 (= res!470270 (= (-!330 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706296 () Bool)

(declare-fun res!470278 () Bool)

(assert (=> b!706296 (=> (not res!470278) (not e!397792))))

(declare-fun subseq!365 (List!13381 List!13381) Bool)

(assert (=> b!706296 (= res!470278 (subseq!365 acc!652 newAcc!49))))

(declare-fun b!706297 () Bool)

(declare-fun res!470267 () Bool)

(assert (=> b!706297 (=> (not res!470267) (not e!397792))))

(declare-datatypes ((array!40290 0))(
  ( (array!40291 (arr!19301 (Array (_ BitVec 32) (_ BitVec 64))) (size!19683 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40290)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706297 (= res!470267 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706298 () Bool)

(assert (=> b!706298 (= e!397792 (bvslt (bvsub (size!19683 a!3591) from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706299 () Bool)

(declare-fun res!470276 () Bool)

(assert (=> b!706299 (=> (not res!470276) (not e!397792))))

(declare-fun contains!3903 (List!13381 (_ BitVec 64)) Bool)

(assert (=> b!706299 (= res!470276 (not (contains!3903 acc!652 k0!2824)))))

(declare-fun b!706300 () Bool)

(declare-fun res!470265 () Bool)

(assert (=> b!706300 (=> (not res!470265) (not e!397792))))

(declare-fun arrayNoDuplicates!0 (array!40290 (_ BitVec 32) List!13381) Bool)

(assert (=> b!706300 (= res!470265 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706301 () Bool)

(declare-fun res!470275 () Bool)

(assert (=> b!706301 (=> (not res!470275) (not e!397792))))

(assert (=> b!706301 (= res!470275 (not (contains!3903 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706302 () Bool)

(declare-fun res!470273 () Bool)

(assert (=> b!706302 (=> (not res!470273) (not e!397792))))

(declare-fun noDuplicate!1172 (List!13381) Bool)

(assert (=> b!706302 (= res!470273 (noDuplicate!1172 acc!652))))

(declare-fun b!706303 () Bool)

(declare-fun res!470268 () Bool)

(assert (=> b!706303 (=> (not res!470268) (not e!397792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706303 (= res!470268 (validKeyInArray!0 k0!2824))))

(declare-fun b!706304 () Bool)

(declare-fun res!470271 () Bool)

(assert (=> b!706304 (=> (not res!470271) (not e!397792))))

(assert (=> b!706304 (= res!470271 (not (contains!3903 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706305 () Bool)

(declare-fun res!470269 () Bool)

(assert (=> b!706305 (=> (not res!470269) (not e!397792))))

(assert (=> b!706305 (= res!470269 (not (contains!3903 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706306 () Bool)

(declare-fun res!470274 () Bool)

(assert (=> b!706306 (=> (not res!470274) (not e!397792))))

(assert (=> b!706306 (= res!470274 (not (contains!3903 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!470266 () Bool)

(assert (=> start!62600 (=> (not res!470266) (not e!397792))))

(assert (=> start!62600 (= res!470266 (and (bvslt (size!19683 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19683 a!3591))))))

(assert (=> start!62600 e!397792))

(assert (=> start!62600 true))

(declare-fun array_inv!15184 (array!40290) Bool)

(assert (=> start!62600 (array_inv!15184 a!3591)))

(declare-fun b!706307 () Bool)

(declare-fun res!470272 () Bool)

(assert (=> b!706307 (=> (not res!470272) (not e!397792))))

(assert (=> b!706307 (= res!470272 (noDuplicate!1172 newAcc!49))))

(declare-fun b!706308 () Bool)

(declare-fun res!470277 () Bool)

(assert (=> b!706308 (=> (not res!470277) (not e!397792))))

(assert (=> b!706308 (= res!470277 (contains!3903 newAcc!49 k0!2824))))

(assert (= (and start!62600 res!470266) b!706302))

(assert (= (and b!706302 res!470273) b!706307))

(assert (= (and b!706307 res!470272) b!706301))

(assert (= (and b!706301 res!470275) b!706305))

(assert (= (and b!706305 res!470269) b!706297))

(assert (= (and b!706297 res!470267) b!706299))

(assert (= (and b!706299 res!470276) b!706303))

(assert (= (and b!706303 res!470268) b!706300))

(assert (= (and b!706300 res!470265) b!706296))

(assert (= (and b!706296 res!470278) b!706308))

(assert (= (and b!706308 res!470277) b!706295))

(assert (= (and b!706295 res!470270) b!706306))

(assert (= (and b!706306 res!470274) b!706304))

(assert (= (and b!706304 res!470271) b!706298))

(declare-fun m!663651 () Bool)

(assert (=> b!706300 m!663651))

(declare-fun m!663653 () Bool)

(assert (=> b!706307 m!663653))

(declare-fun m!663655 () Bool)

(assert (=> b!706306 m!663655))

(declare-fun m!663657 () Bool)

(assert (=> b!706295 m!663657))

(declare-fun m!663659 () Bool)

(assert (=> start!62600 m!663659))

(declare-fun m!663661 () Bool)

(assert (=> b!706297 m!663661))

(declare-fun m!663663 () Bool)

(assert (=> b!706301 m!663663))

(declare-fun m!663665 () Bool)

(assert (=> b!706305 m!663665))

(declare-fun m!663667 () Bool)

(assert (=> b!706296 m!663667))

(declare-fun m!663669 () Bool)

(assert (=> b!706303 m!663669))

(declare-fun m!663671 () Bool)

(assert (=> b!706304 m!663671))

(declare-fun m!663673 () Bool)

(assert (=> b!706308 m!663673))

(declare-fun m!663675 () Bool)

(assert (=> b!706302 m!663675))

(declare-fun m!663677 () Bool)

(assert (=> b!706299 m!663677))

(check-sat (not b!706299) (not b!706300) (not start!62600) (not b!706305) (not b!706301) (not b!706295) (not b!706304) (not b!706303) (not b!706297) (not b!706308) (not b!706306) (not b!706302) (not b!706296) (not b!706307))
(check-sat)
