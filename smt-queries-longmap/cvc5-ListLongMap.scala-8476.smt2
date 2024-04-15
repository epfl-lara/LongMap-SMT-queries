; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103214 () Bool)

(assert start!103214)

(declare-fun b!1238959 () Bool)

(declare-datatypes ((Unit!41003 0))(
  ( (Unit!41004) )
))
(declare-fun e!702121 () Unit!41003)

(declare-fun lt!561391 () Unit!41003)

(assert (=> b!1238959 (= e!702121 lt!561391)))

(declare-datatypes ((array!79772 0))(
  ( (array!79773 (arr!38488 (Array (_ BitVec 32) (_ BitVec 64))) (size!39026 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79772)

(declare-datatypes ((List!27362 0))(
  ( (Nil!27359) (Cons!27358 (h!28567 (_ BitVec 64)) (t!40816 List!27362)) )
))
(declare-fun acc!846 () List!27362)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!561392 () List!27362)

(assert (=> b!1238959 (= lt!561392 (Cons!27358 (select (arr!38488 a!3835) from!3213) acc!846))))

(declare-fun lt!561389 () Unit!41003)

(declare-fun lemmaListSubSeqRefl!0 (List!27362) Unit!41003)

(assert (=> b!1238959 (= lt!561389 (lemmaListSubSeqRefl!0 lt!561392))))

(declare-fun subseq!616 (List!27362 List!27362) Bool)

(assert (=> b!1238959 (subseq!616 lt!561392 lt!561392)))

(declare-fun lt!561390 () Unit!41003)

(declare-fun subseqTail!103 (List!27362 List!27362) Unit!41003)

(assert (=> b!1238959 (= lt!561390 (subseqTail!103 lt!561392 lt!561392))))

(assert (=> b!1238959 (subseq!616 acc!846 lt!561392)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79772 List!27362 List!27362 (_ BitVec 32)) Unit!41003)

(assert (=> b!1238959 (= lt!561391 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561392 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79772 (_ BitVec 32) List!27362) Bool)

(assert (=> b!1238959 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238960 () Bool)

(declare-fun e!702120 () Bool)

(assert (=> b!1238960 (= e!702120 false)))

(declare-fun lt!561388 () Unit!41003)

(assert (=> b!1238960 (= lt!561388 e!702121)))

(declare-fun c!121066 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238960 (= c!121066 (validKeyInArray!0 (select (arr!38488 a!3835) from!3213)))))

(declare-fun b!1238961 () Bool)

(declare-fun res!826554 () Bool)

(assert (=> b!1238961 (=> (not res!826554) (not e!702120))))

(declare-fun contains!7334 (List!27362 (_ BitVec 64)) Bool)

(assert (=> b!1238961 (= res!826554 (not (contains!7334 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238962 () Bool)

(declare-fun res!826556 () Bool)

(assert (=> b!1238962 (=> (not res!826556) (not e!702120))))

(assert (=> b!1238962 (= res!826556 (not (= from!3213 (bvsub (size!39026 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238963 () Bool)

(declare-fun res!826557 () Bool)

(assert (=> b!1238963 (=> (not res!826557) (not e!702120))))

(assert (=> b!1238963 (= res!826557 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238964 () Bool)

(declare-fun res!826558 () Bool)

(assert (=> b!1238964 (=> (not res!826558) (not e!702120))))

(assert (=> b!1238964 (= res!826558 (not (contains!7334 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238965 () Bool)

(declare-fun res!826559 () Bool)

(assert (=> b!1238965 (=> (not res!826559) (not e!702120))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238965 (= res!826559 (contains!7334 acc!846 k!2925))))

(declare-fun res!826555 () Bool)

(assert (=> start!103214 (=> (not res!826555) (not e!702120))))

(assert (=> start!103214 (= res!826555 (and (bvslt (size!39026 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39026 a!3835))))))

(assert (=> start!103214 e!702120))

(declare-fun array_inv!29471 (array!79772) Bool)

(assert (=> start!103214 (array_inv!29471 a!3835)))

(assert (=> start!103214 true))

(declare-fun b!1238966 () Bool)

(declare-fun res!826553 () Bool)

(assert (=> b!1238966 (=> (not res!826553) (not e!702120))))

(declare-fun noDuplicate!1977 (List!27362) Bool)

(assert (=> b!1238966 (= res!826553 (noDuplicate!1977 acc!846))))

(declare-fun b!1238967 () Bool)

(declare-fun Unit!41005 () Unit!41003)

(assert (=> b!1238967 (= e!702121 Unit!41005)))

(assert (= (and start!103214 res!826555) b!1238966))

(assert (= (and b!1238966 res!826553) b!1238964))

(assert (= (and b!1238964 res!826558) b!1238961))

(assert (= (and b!1238961 res!826554) b!1238963))

(assert (= (and b!1238963 res!826557) b!1238965))

(assert (= (and b!1238965 res!826559) b!1238962))

(assert (= (and b!1238962 res!826556) b!1238960))

(assert (= (and b!1238960 c!121066) b!1238959))

(assert (= (and b!1238960 (not c!121066)) b!1238967))

(declare-fun m!1142051 () Bool)

(assert (=> b!1238960 m!1142051))

(assert (=> b!1238960 m!1142051))

(declare-fun m!1142053 () Bool)

(assert (=> b!1238960 m!1142053))

(declare-fun m!1142055 () Bool)

(assert (=> b!1238959 m!1142055))

(declare-fun m!1142057 () Bool)

(assert (=> b!1238959 m!1142057))

(declare-fun m!1142059 () Bool)

(assert (=> b!1238959 m!1142059))

(declare-fun m!1142061 () Bool)

(assert (=> b!1238959 m!1142061))

(assert (=> b!1238959 m!1142051))

(declare-fun m!1142063 () Bool)

(assert (=> b!1238959 m!1142063))

(declare-fun m!1142065 () Bool)

(assert (=> b!1238959 m!1142065))

(declare-fun m!1142067 () Bool)

(assert (=> b!1238963 m!1142067))

(declare-fun m!1142069 () Bool)

(assert (=> b!1238964 m!1142069))

(declare-fun m!1142071 () Bool)

(assert (=> b!1238961 m!1142071))

(declare-fun m!1142073 () Bool)

(assert (=> b!1238965 m!1142073))

(declare-fun m!1142075 () Bool)

(assert (=> start!103214 m!1142075))

(declare-fun m!1142077 () Bool)

(assert (=> b!1238966 m!1142077))

(push 1)

(assert (not b!1238960))

(assert (not b!1238965))

(assert (not b!1238961))

(assert (not b!1238963))

(assert (not b!1238959))

(assert (not b!1238964))

(assert (not b!1238966))

(assert (not start!103214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

