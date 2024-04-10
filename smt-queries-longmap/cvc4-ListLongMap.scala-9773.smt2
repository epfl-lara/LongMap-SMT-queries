; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115812 () Bool)

(assert start!115812)

(declare-fun b!1369285 () Bool)

(declare-fun res!912767 () Bool)

(declare-fun e!775672 () Bool)

(assert (=> b!1369285 (=> (not res!912767) (not e!775672))))

(declare-datatypes ((List!31970 0))(
  ( (Nil!31967) (Cons!31966 (h!33175 (_ BitVec 64)) (t!46664 List!31970)) )
))
(declare-fun newAcc!98 () List!31970)

(declare-fun contains!9652 (List!31970 (_ BitVec 64)) Bool)

(assert (=> b!1369285 (= res!912767 (not (contains!9652 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369286 () Bool)

(declare-fun res!912769 () Bool)

(assert (=> b!1369286 (=> (not res!912769) (not e!775672))))

(declare-fun acc!866 () List!31970)

(declare-fun noDuplicate!2509 (List!31970) Bool)

(assert (=> b!1369286 (= res!912769 (noDuplicate!2509 acc!866))))

(declare-fun b!1369287 () Bool)

(declare-fun res!912765 () Bool)

(assert (=> b!1369287 (=> (not res!912765) (not e!775672))))

(assert (=> b!1369287 (= res!912765 (not (contains!9652 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369288 () Bool)

(assert (=> b!1369288 (= e!775672 false)))

(declare-datatypes ((array!92959 0))(
  ( (array!92960 (arr!44902 (Array (_ BitVec 32) (_ BitVec 64))) (size!45452 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92959)

(declare-fun lt!602239 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92959 (_ BitVec 32) List!31970) Bool)

(assert (=> b!1369288 (= lt!602239 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45241 0))(
  ( (Unit!45242) )
))
(declare-fun lt!602238 () Unit!45241)

(declare-fun noDuplicateSubseq!241 (List!31970 List!31970) Unit!45241)

(assert (=> b!1369288 (= lt!602238 (noDuplicateSubseq!241 newAcc!98 acc!866))))

(declare-fun b!1369289 () Bool)

(declare-fun res!912763 () Bool)

(assert (=> b!1369289 (=> (not res!912763) (not e!775672))))

(assert (=> b!1369289 (= res!912763 (not (contains!9652 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369290 () Bool)

(declare-fun res!912764 () Bool)

(assert (=> b!1369290 (=> (not res!912764) (not e!775672))))

(declare-fun subseq!1054 (List!31970 List!31970) Bool)

(assert (=> b!1369290 (= res!912764 (subseq!1054 newAcc!98 acc!866))))

(declare-fun b!1369291 () Bool)

(declare-fun res!912766 () Bool)

(assert (=> b!1369291 (=> (not res!912766) (not e!775672))))

(assert (=> b!1369291 (= res!912766 (not (contains!9652 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912768 () Bool)

(assert (=> start!115812 (=> (not res!912768) (not e!775672))))

(assert (=> start!115812 (= res!912768 (and (bvslt (size!45452 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45452 a!3861))))))

(assert (=> start!115812 e!775672))

(declare-fun array_inv!33930 (array!92959) Bool)

(assert (=> start!115812 (array_inv!33930 a!3861)))

(assert (=> start!115812 true))

(assert (= (and start!115812 res!912768) b!1369286))

(assert (= (and b!1369286 res!912769) b!1369291))

(assert (= (and b!1369291 res!912766) b!1369289))

(assert (= (and b!1369289 res!912763) b!1369287))

(assert (= (and b!1369287 res!912765) b!1369285))

(assert (= (and b!1369285 res!912767) b!1369290))

(assert (= (and b!1369290 res!912764) b!1369288))

(declare-fun m!1253101 () Bool)

(assert (=> b!1369288 m!1253101))

(declare-fun m!1253103 () Bool)

(assert (=> b!1369288 m!1253103))

(declare-fun m!1253105 () Bool)

(assert (=> b!1369285 m!1253105))

(declare-fun m!1253107 () Bool)

(assert (=> b!1369286 m!1253107))

(declare-fun m!1253109 () Bool)

(assert (=> b!1369291 m!1253109))

(declare-fun m!1253111 () Bool)

(assert (=> b!1369290 m!1253111))

(declare-fun m!1253113 () Bool)

(assert (=> b!1369287 m!1253113))

(declare-fun m!1253115 () Bool)

(assert (=> start!115812 m!1253115))

(declare-fun m!1253117 () Bool)

(assert (=> b!1369289 m!1253117))

(push 1)

(assert (not b!1369289))

(assert (not b!1369290))

(assert (not b!1369291))

(assert (not b!1369286))

(assert (not b!1369287))

(assert (not start!115812))

(assert (not b!1369285))

(assert (not b!1369288))

(check-sat)

