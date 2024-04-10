; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62518 () Bool)

(assert start!62518)

(declare-fun b!704188 () Bool)

(declare-fun res!468014 () Bool)

(declare-fun e!397693 () Bool)

(assert (=> b!704188 (=> (not res!468014) (not e!397693))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40197 0))(
  ( (array!40198 (arr!19255 (Array (_ BitVec 32) (_ BitVec 64))) (size!19640 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40197)

(assert (=> b!704188 (= res!468014 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19640 a!3591)))))

(declare-fun b!704189 () Bool)

(declare-fun res!468005 () Bool)

(assert (=> b!704189 (=> (not res!468005) (not e!397693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704189 (= res!468005 (not (validKeyInArray!0 (select (arr!19255 a!3591) from!2969))))))

(declare-fun b!704190 () Bool)

(declare-fun res!468006 () Bool)

(assert (=> b!704190 (=> (not res!468006) (not e!397693))))

(declare-datatypes ((List!13296 0))(
  ( (Nil!13293) (Cons!13292 (h!14337 (_ BitVec 64)) (t!19578 List!13296)) )
))
(declare-fun newAcc!49 () List!13296)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13296)

(declare-fun -!283 (List!13296 (_ BitVec 64)) List!13296)

(assert (=> b!704190 (= res!468006 (= (-!283 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704191 () Bool)

(declare-fun res!468002 () Bool)

(assert (=> b!704191 (=> (not res!468002) (not e!397693))))

(declare-fun contains!3873 (List!13296 (_ BitVec 64)) Bool)

(assert (=> b!704191 (= res!468002 (not (contains!3873 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704192 () Bool)

(declare-fun res!468015 () Bool)

(assert (=> b!704192 (=> (not res!468015) (not e!397693))))

(assert (=> b!704192 (= res!468015 (not (contains!3873 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704193 () Bool)

(declare-fun res!468008 () Bool)

(assert (=> b!704193 (=> (not res!468008) (not e!397693))))

(assert (=> b!704193 (= res!468008 (not (contains!3873 acc!652 k0!2824)))))

(declare-fun b!704194 () Bool)

(declare-fun res!468013 () Bool)

(assert (=> b!704194 (=> (not res!468013) (not e!397693))))

(assert (=> b!704194 (= res!468013 (not (contains!3873 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704195 () Bool)

(declare-fun res!468011 () Bool)

(assert (=> b!704195 (=> (not res!468011) (not e!397693))))

(declare-fun arrayContainsKey!0 (array!40197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704195 (= res!468011 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704196 () Bool)

(declare-fun res!468012 () Bool)

(assert (=> b!704196 (=> (not res!468012) (not e!397693))))

(assert (=> b!704196 (= res!468012 (not (contains!3873 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704197 () Bool)

(declare-fun res!468003 () Bool)

(assert (=> b!704197 (=> (not res!468003) (not e!397693))))

(assert (=> b!704197 (= res!468003 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704198 () Bool)

(declare-fun res!468007 () Bool)

(assert (=> b!704198 (=> (not res!468007) (not e!397693))))

(assert (=> b!704198 (= res!468007 (contains!3873 newAcc!49 k0!2824))))

(declare-fun b!704199 () Bool)

(declare-fun res!468010 () Bool)

(assert (=> b!704199 (=> (not res!468010) (not e!397693))))

(declare-fun noDuplicate!1120 (List!13296) Bool)

(assert (=> b!704199 (= res!468010 (noDuplicate!1120 acc!652))))

(declare-fun b!704200 () Bool)

(declare-fun res!468001 () Bool)

(assert (=> b!704200 (=> (not res!468001) (not e!397693))))

(assert (=> b!704200 (= res!468001 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704201 () Bool)

(declare-fun res!467998 () Bool)

(assert (=> b!704201 (=> (not res!467998) (not e!397693))))

(assert (=> b!704201 (= res!467998 (validKeyInArray!0 k0!2824))))

(declare-fun b!704202 () Bool)

(declare-fun res!468009 () Bool)

(assert (=> b!704202 (=> (not res!468009) (not e!397693))))

(assert (=> b!704202 (= res!468009 (noDuplicate!1120 newAcc!49))))

(declare-fun b!704203 () Bool)

(declare-fun res!468000 () Bool)

(assert (=> b!704203 (=> (not res!468000) (not e!397693))))

(declare-fun subseq!318 (List!13296 List!13296) Bool)

(assert (=> b!704203 (= res!468000 (subseq!318 acc!652 newAcc!49))))

(declare-fun b!704204 () Bool)

(assert (=> b!704204 (= e!397693 false)))

(declare-fun lt!317829 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40197 (_ BitVec 32) List!13296) Bool)

(assert (=> b!704204 (= lt!317829 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704205 () Bool)

(declare-fun res!467999 () Bool)

(assert (=> b!704205 (=> (not res!467999) (not e!397693))))

(assert (=> b!704205 (= res!467999 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!468004 () Bool)

(assert (=> start!62518 (=> (not res!468004) (not e!397693))))

(assert (=> start!62518 (= res!468004 (and (bvslt (size!19640 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19640 a!3591))))))

(assert (=> start!62518 e!397693))

(assert (=> start!62518 true))

(declare-fun array_inv!15051 (array!40197) Bool)

(assert (=> start!62518 (array_inv!15051 a!3591)))

(assert (= (and start!62518 res!468004) b!704199))

(assert (= (and b!704199 res!468010) b!704202))

(assert (= (and b!704202 res!468009) b!704194))

(assert (= (and b!704194 res!468013) b!704192))

(assert (= (and b!704192 res!468015) b!704195))

(assert (= (and b!704195 res!468011) b!704193))

(assert (= (and b!704193 res!468008) b!704201))

(assert (= (and b!704201 res!467998) b!704205))

(assert (= (and b!704205 res!467999) b!704203))

(assert (= (and b!704203 res!468000) b!704198))

(assert (= (and b!704198 res!468007) b!704190))

(assert (= (and b!704190 res!468006) b!704191))

(assert (= (and b!704191 res!468002) b!704196))

(assert (= (and b!704196 res!468012) b!704188))

(assert (= (and b!704188 res!468014) b!704189))

(assert (= (and b!704189 res!468005) b!704197))

(assert (= (and b!704197 res!468003) b!704200))

(assert (= (and b!704200 res!468001) b!704204))

(declare-fun m!662767 () Bool)

(assert (=> b!704191 m!662767))

(declare-fun m!662769 () Bool)

(assert (=> b!704195 m!662769))

(declare-fun m!662771 () Bool)

(assert (=> b!704203 m!662771))

(declare-fun m!662773 () Bool)

(assert (=> b!704194 m!662773))

(declare-fun m!662775 () Bool)

(assert (=> start!62518 m!662775))

(declare-fun m!662777 () Bool)

(assert (=> b!704190 m!662777))

(declare-fun m!662779 () Bool)

(assert (=> b!704189 m!662779))

(assert (=> b!704189 m!662779))

(declare-fun m!662781 () Bool)

(assert (=> b!704189 m!662781))

(declare-fun m!662783 () Bool)

(assert (=> b!704200 m!662783))

(declare-fun m!662785 () Bool)

(assert (=> b!704196 m!662785))

(declare-fun m!662787 () Bool)

(assert (=> b!704201 m!662787))

(declare-fun m!662789 () Bool)

(assert (=> b!704204 m!662789))

(declare-fun m!662791 () Bool)

(assert (=> b!704192 m!662791))

(declare-fun m!662793 () Bool)

(assert (=> b!704202 m!662793))

(declare-fun m!662795 () Bool)

(assert (=> b!704199 m!662795))

(declare-fun m!662797 () Bool)

(assert (=> b!704198 m!662797))

(declare-fun m!662799 () Bool)

(assert (=> b!704205 m!662799))

(declare-fun m!662801 () Bool)

(assert (=> b!704193 m!662801))

(check-sat (not b!704201) (not b!704191) (not b!704199) (not b!704200) (not start!62518) (not b!704203) (not b!704195) (not b!704198) (not b!704204) (not b!704193) (not b!704202) (not b!704190) (not b!704194) (not b!704196) (not b!704192) (not b!704189) (not b!704205))
(check-sat)
