; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62422 () Bool)

(assert start!62422)

(declare-fun res!462416 () Bool)

(declare-fun e!397191 () Bool)

(assert (=> start!62422 (=> (not res!462416) (not e!397191))))

(declare-datatypes ((array!40041 0))(
  ( (array!40042 (arr!19174 (Array (_ BitVec 32) (_ BitVec 64))) (size!19557 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40041)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62422 (= res!462416 (and (bvslt (size!19557 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19557 a!3591))))))

(assert (=> start!62422 e!397191))

(assert (=> start!62422 true))

(declare-fun array_inv!15033 (array!40041) Bool)

(assert (=> start!62422 (array_inv!15033 a!3591)))

(declare-fun b!698705 () Bool)

(declare-fun res!462420 () Bool)

(assert (=> b!698705 (=> (not res!462420) (not e!397191))))

(declare-datatypes ((List!13122 0))(
  ( (Nil!13119) (Cons!13118 (h!14166 (_ BitVec 64)) (t!19396 List!13122)) )
))
(declare-fun acc!652 () List!13122)

(declare-fun contains!3774 (List!13122 (_ BitVec 64)) Bool)

(assert (=> b!698705 (= res!462420 (not (contains!3774 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698706 () Bool)

(declare-fun res!462419 () Bool)

(assert (=> b!698706 (=> (not res!462419) (not e!397191))))

(assert (=> b!698706 (= res!462419 (not (contains!3774 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698707 () Bool)

(assert (=> b!698707 (= e!397191 false)))

(declare-fun lt!317376 () Bool)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!698707 (= lt!317376 (contains!3774 acc!652 k0!2824))))

(declare-fun b!698708 () Bool)

(declare-fun res!462421 () Bool)

(assert (=> b!698708 (=> (not res!462421) (not e!397191))))

(declare-fun newAcc!49 () List!13122)

(declare-fun noDuplicate!1048 (List!13122) Bool)

(assert (=> b!698708 (= res!462421 (noDuplicate!1048 newAcc!49))))

(declare-fun b!698709 () Bool)

(declare-fun res!462417 () Bool)

(assert (=> b!698709 (=> (not res!462417) (not e!397191))))

(assert (=> b!698709 (= res!462417 (noDuplicate!1048 acc!652))))

(declare-fun b!698710 () Bool)

(declare-fun res!462418 () Bool)

(assert (=> b!698710 (=> (not res!462418) (not e!397191))))

(declare-fun arrayContainsKey!0 (array!40041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698710 (= res!462418 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62422 res!462416) b!698709))

(assert (= (and b!698709 res!462417) b!698708))

(assert (= (and b!698708 res!462421) b!698706))

(assert (= (and b!698706 res!462419) b!698705))

(assert (= (and b!698705 res!462420) b!698710))

(assert (= (and b!698710 res!462418) b!698707))

(declare-fun m!659409 () Bool)

(assert (=> b!698708 m!659409))

(declare-fun m!659411 () Bool)

(assert (=> b!698709 m!659411))

(declare-fun m!659413 () Bool)

(assert (=> b!698707 m!659413))

(declare-fun m!659415 () Bool)

(assert (=> start!62422 m!659415))

(declare-fun m!659417 () Bool)

(assert (=> b!698705 m!659417))

(declare-fun m!659419 () Bool)

(assert (=> b!698710 m!659419))

(declare-fun m!659421 () Bool)

(assert (=> b!698706 m!659421))

(check-sat (not start!62422) (not b!698706) (not b!698709) (not b!698707) (not b!698708) (not b!698705) (not b!698710))
(check-sat)
