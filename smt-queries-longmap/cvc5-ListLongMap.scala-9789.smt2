; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116258 () Bool)

(assert start!116258)

(declare-fun b!1372516 () Bool)

(declare-fun res!915788 () Bool)

(declare-fun e!777612 () Bool)

(assert (=> b!1372516 (=> (not res!915788) (not e!777612))))

(declare-datatypes ((List!32016 0))(
  ( (Nil!32013) (Cons!32012 (h!33221 (_ BitVec 64)) (t!46710 List!32016)) )
))
(declare-fun newAcc!98 () List!32016)

(declare-fun contains!9698 (List!32016 (_ BitVec 64)) Bool)

(assert (=> b!1372516 (= res!915788 (not (contains!9698 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372517 () Bool)

(declare-fun res!915785 () Bool)

(assert (=> b!1372517 (=> (not res!915785) (not e!777612))))

(assert (=> b!1372517 (= res!915785 (not (contains!9698 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372518 () Bool)

(declare-fun res!915790 () Bool)

(assert (=> b!1372518 (=> (not res!915790) (not e!777612))))

(declare-fun acc!866 () List!32016)

(declare-fun noDuplicate!2555 (List!32016) Bool)

(assert (=> b!1372518 (= res!915790 (noDuplicate!2555 acc!866))))

(declare-fun b!1372519 () Bool)

(declare-fun res!915789 () Bool)

(assert (=> b!1372519 (=> (not res!915789) (not e!777612))))

(assert (=> b!1372519 (= res!915789 (not (contains!9698 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372520 () Bool)

(declare-fun res!915784 () Bool)

(assert (=> b!1372520 (=> (not res!915784) (not e!777612))))

(assert (=> b!1372520 (= res!915784 (not (contains!9698 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372521 () Bool)

(assert (=> b!1372521 (= e!777612 false)))

(declare-datatypes ((array!93075 0))(
  ( (array!93076 (arr!44948 (Array (_ BitVec 32) (_ BitVec 64))) (size!45498 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93075)

(declare-fun lt!602877 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93075 (_ BitVec 32) List!32016) Bool)

(assert (=> b!1372521 (= lt!602877 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45333 0))(
  ( (Unit!45334) )
))
(declare-fun lt!602878 () Unit!45333)

(declare-fun noDuplicateSubseq!287 (List!32016 List!32016) Unit!45333)

(assert (=> b!1372521 (= lt!602878 (noDuplicateSubseq!287 newAcc!98 acc!866))))

(declare-fun b!1372522 () Bool)

(declare-fun res!915787 () Bool)

(assert (=> b!1372522 (=> (not res!915787) (not e!777612))))

(declare-fun subseq!1100 (List!32016 List!32016) Bool)

(assert (=> b!1372522 (= res!915787 (subseq!1100 newAcc!98 acc!866))))

(declare-fun res!915786 () Bool)

(assert (=> start!116258 (=> (not res!915786) (not e!777612))))

(assert (=> start!116258 (= res!915786 (and (bvslt (size!45498 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45498 a!3861))))))

(assert (=> start!116258 e!777612))

(declare-fun array_inv!33976 (array!93075) Bool)

(assert (=> start!116258 (array_inv!33976 a!3861)))

(assert (=> start!116258 true))

(assert (= (and start!116258 res!915786) b!1372518))

(assert (= (and b!1372518 res!915790) b!1372519))

(assert (= (and b!1372519 res!915789) b!1372520))

(assert (= (and b!1372520 res!915784) b!1372516))

(assert (= (and b!1372516 res!915788) b!1372517))

(assert (= (and b!1372517 res!915785) b!1372522))

(assert (= (and b!1372522 res!915787) b!1372521))

(declare-fun m!1255951 () Bool)

(assert (=> b!1372518 m!1255951))

(declare-fun m!1255953 () Bool)

(assert (=> b!1372520 m!1255953))

(declare-fun m!1255955 () Bool)

(assert (=> b!1372517 m!1255955))

(declare-fun m!1255957 () Bool)

(assert (=> b!1372522 m!1255957))

(declare-fun m!1255959 () Bool)

(assert (=> b!1372519 m!1255959))

(declare-fun m!1255961 () Bool)

(assert (=> b!1372516 m!1255961))

(declare-fun m!1255963 () Bool)

(assert (=> start!116258 m!1255963))

(declare-fun m!1255965 () Bool)

(assert (=> b!1372521 m!1255965))

(declare-fun m!1255967 () Bool)

(assert (=> b!1372521 m!1255967))

(push 1)

(assert (not b!1372520))

(assert (not start!116258))

(assert (not b!1372518))

(assert (not b!1372519))

(assert (not b!1372517))

(assert (not b!1372516))

(assert (not b!1372522))

(assert (not b!1372521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

