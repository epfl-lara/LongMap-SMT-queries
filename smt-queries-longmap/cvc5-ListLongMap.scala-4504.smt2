; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62552 () Bool)

(assert start!62552)

(declare-fun b!703788 () Bool)

(declare-fun res!467511 () Bool)

(declare-fun e!397743 () Bool)

(assert (=> b!703788 (=> (not res!467511) (not e!397743))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703788 (= res!467511 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703789 () Bool)

(declare-fun res!467508 () Bool)

(assert (=> b!703789 (=> (not res!467508) (not e!397743))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703789 (= res!467508 (validKeyInArray!0 k!2824))))

(declare-fun b!703790 () Bool)

(declare-fun res!467500 () Bool)

(assert (=> b!703790 (=> (not res!467500) (not e!397743))))

(declare-datatypes ((List!13187 0))(
  ( (Nil!13184) (Cons!13183 (h!14231 (_ BitVec 64)) (t!19461 List!13187)) )
))
(declare-fun acc!652 () List!13187)

(declare-fun contains!3839 (List!13187 (_ BitVec 64)) Bool)

(assert (=> b!703790 (= res!467500 (not (contains!3839 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703791 () Bool)

(declare-fun res!467502 () Bool)

(assert (=> b!703791 (=> (not res!467502) (not e!397743))))

(declare-fun noDuplicate!1113 (List!13187) Bool)

(assert (=> b!703791 (= res!467502 (noDuplicate!1113 acc!652))))

(declare-fun b!703792 () Bool)

(assert (=> b!703792 (= e!397743 false)))

(declare-datatypes ((array!40171 0))(
  ( (array!40172 (arr!19239 (Array (_ BitVec 32) (_ BitVec 64))) (size!19622 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40171)

(declare-fun lt!317895 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40171 (_ BitVec 32) List!13187) Bool)

(assert (=> b!703792 (= lt!317895 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703793 () Bool)

(declare-fun res!467510 () Bool)

(assert (=> b!703793 (=> (not res!467510) (not e!397743))))

(declare-fun newAcc!49 () List!13187)

(declare-fun -!271 (List!13187 (_ BitVec 64)) List!13187)

(assert (=> b!703793 (= res!467510 (= (-!271 newAcc!49 k!2824) acc!652))))

(declare-fun b!703794 () Bool)

(declare-fun res!467505 () Bool)

(assert (=> b!703794 (=> (not res!467505) (not e!397743))))

(assert (=> b!703794 (= res!467505 (noDuplicate!1113 newAcc!49))))

(declare-fun b!703795 () Bool)

(declare-fun res!467509 () Bool)

(assert (=> b!703795 (=> (not res!467509) (not e!397743))))

(assert (=> b!703795 (= res!467509 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19622 a!3591)))))

(declare-fun b!703796 () Bool)

(declare-fun res!467498 () Bool)

(assert (=> b!703796 (=> (not res!467498) (not e!397743))))

(declare-fun arrayContainsKey!0 (array!40171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703796 (= res!467498 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703787 () Bool)

(declare-fun res!467512 () Bool)

(assert (=> b!703787 (=> (not res!467512) (not e!397743))))

(assert (=> b!703787 (= res!467512 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!467513 () Bool)

(assert (=> start!62552 (=> (not res!467513) (not e!397743))))

(assert (=> start!62552 (= res!467513 (and (bvslt (size!19622 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19622 a!3591))))))

(assert (=> start!62552 e!397743))

(assert (=> start!62552 true))

(declare-fun array_inv!15098 (array!40171) Bool)

(assert (=> start!62552 (array_inv!15098 a!3591)))

(declare-fun b!703797 () Bool)

(declare-fun res!467506 () Bool)

(assert (=> b!703797 (=> (not res!467506) (not e!397743))))

(assert (=> b!703797 (= res!467506 (not (validKeyInArray!0 (select (arr!19239 a!3591) from!2969))))))

(declare-fun b!703798 () Bool)

(declare-fun res!467499 () Bool)

(assert (=> b!703798 (=> (not res!467499) (not e!397743))))

(assert (=> b!703798 (= res!467499 (not (contains!3839 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703799 () Bool)

(declare-fun res!467504 () Bool)

(assert (=> b!703799 (=> (not res!467504) (not e!397743))))

(assert (=> b!703799 (= res!467504 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703800 () Bool)

(declare-fun res!467515 () Bool)

(assert (=> b!703800 (=> (not res!467515) (not e!397743))))

(assert (=> b!703800 (= res!467515 (not (contains!3839 acc!652 k!2824)))))

(declare-fun b!703801 () Bool)

(declare-fun res!467514 () Bool)

(assert (=> b!703801 (=> (not res!467514) (not e!397743))))

(assert (=> b!703801 (= res!467514 (contains!3839 newAcc!49 k!2824))))

(declare-fun b!703802 () Bool)

(declare-fun res!467507 () Bool)

(assert (=> b!703802 (=> (not res!467507) (not e!397743))))

(assert (=> b!703802 (= res!467507 (not (contains!3839 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703803 () Bool)

(declare-fun res!467501 () Bool)

(assert (=> b!703803 (=> (not res!467501) (not e!397743))))

(assert (=> b!703803 (= res!467501 (not (contains!3839 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703804 () Bool)

(declare-fun res!467503 () Bool)

(assert (=> b!703804 (=> (not res!467503) (not e!397743))))

(declare-fun subseq!307 (List!13187 List!13187) Bool)

(assert (=> b!703804 (= res!467503 (subseq!307 acc!652 newAcc!49))))

(assert (= (and start!62552 res!467513) b!703791))

(assert (= (and b!703791 res!467502) b!703794))

(assert (= (and b!703794 res!467505) b!703798))

(assert (= (and b!703798 res!467499) b!703790))

(assert (= (and b!703790 res!467500) b!703799))

(assert (= (and b!703799 res!467504) b!703800))

(assert (= (and b!703800 res!467515) b!703789))

(assert (= (and b!703789 res!467508) b!703787))

(assert (= (and b!703787 res!467512) b!703804))

(assert (= (and b!703804 res!467503) b!703801))

(assert (= (and b!703801 res!467514) b!703793))

(assert (= (and b!703793 res!467510) b!703803))

(assert (= (and b!703803 res!467501) b!703802))

(assert (= (and b!703802 res!467507) b!703795))

(assert (= (and b!703795 res!467509) b!703797))

(assert (= (and b!703797 res!467506) b!703788))

(assert (= (and b!703788 res!467511) b!703796))

(assert (= (and b!703796 res!467498) b!703792))

(declare-fun m!663027 () Bool)

(assert (=> b!703798 m!663027))

(declare-fun m!663029 () Bool)

(assert (=> b!703801 m!663029))

(declare-fun m!663031 () Bool)

(assert (=> b!703794 m!663031))

(declare-fun m!663033 () Bool)

(assert (=> b!703800 m!663033))

(declare-fun m!663035 () Bool)

(assert (=> b!703787 m!663035))

(declare-fun m!663037 () Bool)

(assert (=> start!62552 m!663037))

(declare-fun m!663039 () Bool)

(assert (=> b!703796 m!663039))

(declare-fun m!663041 () Bool)

(assert (=> b!703799 m!663041))

(declare-fun m!663043 () Bool)

(assert (=> b!703802 m!663043))

(declare-fun m!663045 () Bool)

(assert (=> b!703797 m!663045))

(assert (=> b!703797 m!663045))

(declare-fun m!663047 () Bool)

(assert (=> b!703797 m!663047))

(declare-fun m!663049 () Bool)

(assert (=> b!703803 m!663049))

(declare-fun m!663051 () Bool)

(assert (=> b!703793 m!663051))

(declare-fun m!663053 () Bool)

(assert (=> b!703792 m!663053))

(declare-fun m!663055 () Bool)

(assert (=> b!703789 m!663055))

(declare-fun m!663057 () Bool)

(assert (=> b!703804 m!663057))

(declare-fun m!663059 () Bool)

(assert (=> b!703790 m!663059))

(declare-fun m!663061 () Bool)

(assert (=> b!703791 m!663061))

(push 1)

(assert (not b!703801))

(assert (not b!703797))

(assert (not b!703793))

(assert (not b!703790))

(assert (not b!703799))

(assert (not b!703800))

(assert (not b!703796))

(assert (not start!62552))

(assert (not b!703804))

(assert (not b!703792))

(assert (not b!703791))

(assert (not b!703798))

(assert (not b!703794))

(assert (not b!703789))

(assert (not b!703802))

(assert (not b!703787))

(assert (not b!703803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

