; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115804 () Bool)

(assert start!115804)

(declare-fun b!1369201 () Bool)

(declare-fun res!912683 () Bool)

(declare-fun e!775648 () Bool)

(assert (=> b!1369201 (=> (not res!912683) (not e!775648))))

(declare-datatypes ((List!31966 0))(
  ( (Nil!31963) (Cons!31962 (h!33171 (_ BitVec 64)) (t!46660 List!31966)) )
))
(declare-fun acc!866 () List!31966)

(declare-fun contains!9648 (List!31966 (_ BitVec 64)) Bool)

(assert (=> b!1369201 (= res!912683 (not (contains!9648 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369202 () Bool)

(assert (=> b!1369202 (= e!775648 false)))

(declare-datatypes ((array!92951 0))(
  ( (array!92952 (arr!44898 (Array (_ BitVec 32) (_ BitVec 64))) (size!45448 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92951)

(declare-fun lt!602214 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92951 (_ BitVec 32) List!31966) Bool)

(assert (=> b!1369202 (= lt!602214 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45233 0))(
  ( (Unit!45234) )
))
(declare-fun lt!602215 () Unit!45233)

(declare-fun newAcc!98 () List!31966)

(declare-fun noDuplicateSubseq!237 (List!31966 List!31966) Unit!45233)

(assert (=> b!1369202 (= lt!602215 (noDuplicateSubseq!237 newAcc!98 acc!866))))

(declare-fun res!912679 () Bool)

(assert (=> start!115804 (=> (not res!912679) (not e!775648))))

(assert (=> start!115804 (= res!912679 (and (bvslt (size!45448 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45448 a!3861))))))

(assert (=> start!115804 e!775648))

(declare-fun array_inv!33926 (array!92951) Bool)

(assert (=> start!115804 (array_inv!33926 a!3861)))

(assert (=> start!115804 true))

(declare-fun b!1369203 () Bool)

(declare-fun res!912681 () Bool)

(assert (=> b!1369203 (=> (not res!912681) (not e!775648))))

(declare-fun noDuplicate!2505 (List!31966) Bool)

(assert (=> b!1369203 (= res!912681 (noDuplicate!2505 acc!866))))

(declare-fun b!1369204 () Bool)

(declare-fun res!912682 () Bool)

(assert (=> b!1369204 (=> (not res!912682) (not e!775648))))

(assert (=> b!1369204 (= res!912682 (not (contains!9648 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369205 () Bool)

(declare-fun res!912684 () Bool)

(assert (=> b!1369205 (=> (not res!912684) (not e!775648))))

(assert (=> b!1369205 (= res!912684 (not (contains!9648 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369206 () Bool)

(declare-fun res!912680 () Bool)

(assert (=> b!1369206 (=> (not res!912680) (not e!775648))))

(assert (=> b!1369206 (= res!912680 (not (contains!9648 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369207 () Bool)

(declare-fun res!912685 () Bool)

(assert (=> b!1369207 (=> (not res!912685) (not e!775648))))

(declare-fun subseq!1050 (List!31966 List!31966) Bool)

(assert (=> b!1369207 (= res!912685 (subseq!1050 newAcc!98 acc!866))))

(assert (= (and start!115804 res!912679) b!1369203))

(assert (= (and b!1369203 res!912681) b!1369204))

(assert (= (and b!1369204 res!912682) b!1369201))

(assert (= (and b!1369201 res!912683) b!1369205))

(assert (= (and b!1369205 res!912684) b!1369206))

(assert (= (and b!1369206 res!912680) b!1369207))

(assert (= (and b!1369207 res!912685) b!1369202))

(declare-fun m!1253029 () Bool)

(assert (=> b!1369207 m!1253029))

(declare-fun m!1253031 () Bool)

(assert (=> b!1369202 m!1253031))

(declare-fun m!1253033 () Bool)

(assert (=> b!1369202 m!1253033))

(declare-fun m!1253035 () Bool)

(assert (=> b!1369204 m!1253035))

(declare-fun m!1253037 () Bool)

(assert (=> b!1369205 m!1253037))

(declare-fun m!1253039 () Bool)

(assert (=> b!1369201 m!1253039))

(declare-fun m!1253041 () Bool)

(assert (=> start!115804 m!1253041))

(declare-fun m!1253043 () Bool)

(assert (=> b!1369203 m!1253043))

(declare-fun m!1253045 () Bool)

(assert (=> b!1369206 m!1253045))

(check-sat (not b!1369206) (not start!115804) (not b!1369202) (not b!1369201) (not b!1369205) (not b!1369204) (not b!1369207) (not b!1369203))
(check-sat)
