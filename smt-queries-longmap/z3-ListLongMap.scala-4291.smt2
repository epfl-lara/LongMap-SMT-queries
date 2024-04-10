; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59776 () Bool)

(assert start!59776)

(declare-fun b!660307 () Bool)

(declare-fun e!379446 () Bool)

(declare-datatypes ((List!12645 0))(
  ( (Nil!12642) (Cons!12641 (h!13686 (_ BitVec 64)) (t!18873 List!12645)) )
))
(declare-fun acc!681 () List!12645)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3222 (List!12645 (_ BitVec 64)) Bool)

(assert (=> b!660307 (= e!379446 (contains!3222 acc!681 k0!2843))))

(declare-fun b!660308 () Bool)

(declare-fun e!379444 () Bool)

(declare-fun e!379442 () Bool)

(assert (=> b!660308 (= e!379444 e!379442)))

(declare-fun res!428374 () Bool)

(assert (=> b!660308 (=> (not res!428374) (not e!379442))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660308 (= res!428374 (bvsle from!3004 i!1382))))

(declare-fun b!660309 () Bool)

(declare-fun res!428378 () Bool)

(declare-fun e!379443 () Bool)

(assert (=> b!660309 (=> (not res!428378) (not e!379443))))

(assert (=> b!660309 (= res!428378 (not (contains!3222 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428372 () Bool)

(assert (=> start!59776 (=> (not res!428372) (not e!379443))))

(declare-datatypes ((array!38823 0))(
  ( (array!38824 (arr!18604 (Array (_ BitVec 32) (_ BitVec 64))) (size!18968 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38823)

(assert (=> start!59776 (= res!428372 (and (bvslt (size!18968 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18968 a!3626))))))

(assert (=> start!59776 e!379443))

(assert (=> start!59776 true))

(declare-fun array_inv!14400 (array!38823) Bool)

(assert (=> start!59776 (array_inv!14400 a!3626)))

(declare-fun b!660310 () Bool)

(assert (=> b!660310 (= e!379442 (not (contains!3222 acc!681 k0!2843)))))

(declare-fun b!660311 () Bool)

(declare-fun res!428375 () Bool)

(assert (=> b!660311 (=> (not res!428375) (not e!379443))))

(declare-fun noDuplicate!469 (List!12645) Bool)

(assert (=> b!660311 (= res!428375 (noDuplicate!469 acc!681))))

(declare-fun b!660312 () Bool)

(declare-fun res!428377 () Bool)

(assert (=> b!660312 (=> (not res!428377) (not e!379443))))

(assert (=> b!660312 (= res!428377 (not (contains!3222 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660313 () Bool)

(assert (=> b!660313 (= e!379443 false)))

(declare-fun lt!308770 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38823 (_ BitVec 32) List!12645) Bool)

(assert (=> b!660313 (= lt!308770 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12642))))

(declare-fun b!660314 () Bool)

(declare-fun res!428371 () Bool)

(assert (=> b!660314 (=> (not res!428371) (not e!379443))))

(assert (=> b!660314 (= res!428371 e!379444)))

(declare-fun res!428373 () Bool)

(assert (=> b!660314 (=> res!428373 e!379444)))

(assert (=> b!660314 (= res!428373 e!379446)))

(declare-fun res!428376 () Bool)

(assert (=> b!660314 (=> (not res!428376) (not e!379446))))

(assert (=> b!660314 (= res!428376 (bvsgt from!3004 i!1382))))

(assert (= (and start!59776 res!428372) b!660311))

(assert (= (and b!660311 res!428375) b!660312))

(assert (= (and b!660312 res!428377) b!660309))

(assert (= (and b!660309 res!428378) b!660314))

(assert (= (and b!660314 res!428376) b!660307))

(assert (= (and b!660314 (not res!428373)) b!660308))

(assert (= (and b!660308 res!428374) b!660310))

(assert (= (and b!660314 res!428371) b!660313))

(declare-fun m!633053 () Bool)

(assert (=> b!660310 m!633053))

(declare-fun m!633055 () Bool)

(assert (=> b!660313 m!633055))

(declare-fun m!633057 () Bool)

(assert (=> b!660312 m!633057))

(declare-fun m!633059 () Bool)

(assert (=> b!660311 m!633059))

(declare-fun m!633061 () Bool)

(assert (=> start!59776 m!633061))

(declare-fun m!633063 () Bool)

(assert (=> b!660309 m!633063))

(assert (=> b!660307 m!633053))

(check-sat (not b!660307) (not start!59776) (not b!660309) (not b!660313) (not b!660311) (not b!660312) (not b!660310))
