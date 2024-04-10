; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115878 () Bool)

(assert start!115878)

(declare-fun b!1369810 () Bool)

(declare-fun res!913271 () Bool)

(declare-fun e!775929 () Bool)

(assert (=> b!1369810 (=> (not res!913271) (not e!775929))))

(declare-datatypes ((List!31985 0))(
  ( (Nil!31982) (Cons!31981 (h!33190 (_ BitVec 64)) (t!46679 List!31985)) )
))
(declare-fun newAcc!98 () List!31985)

(declare-fun contains!9667 (List!31985 (_ BitVec 64)) Bool)

(assert (=> b!1369810 (= res!913271 (not (contains!9667 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369811 () Bool)

(declare-fun res!913274 () Bool)

(assert (=> b!1369811 (=> (not res!913274) (not e!775929))))

(declare-fun acc!866 () List!31985)

(assert (=> b!1369811 (= res!913274 (not (contains!9667 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369812 () Bool)

(declare-fun res!913272 () Bool)

(declare-fun e!775930 () Bool)

(assert (=> b!1369812 (=> (not res!913272) (not e!775930))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92992 0))(
  ( (array!92993 (arr!44917 (Array (_ BitVec 32) (_ BitVec 64))) (size!45467 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92992)

(assert (=> b!1369812 (= res!913272 (bvslt from!3239 (size!45467 a!3861)))))

(declare-fun res!913276 () Bool)

(assert (=> start!115878 (=> (not res!913276) (not e!775929))))

(assert (=> start!115878 (= res!913276 (and (bvslt (size!45467 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45467 a!3861))))))

(assert (=> start!115878 e!775929))

(declare-fun array_inv!33945 (array!92992) Bool)

(assert (=> start!115878 (array_inv!33945 a!3861)))

(assert (=> start!115878 true))

(declare-fun b!1369813 () Bool)

(assert (=> b!1369813 (= e!775930 false)))

(declare-fun lt!602347 () Bool)

(assert (=> b!1369813 (= lt!602347 (contains!9667 acc!866 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1369814 () Bool)

(declare-fun res!913277 () Bool)

(assert (=> b!1369814 (=> (not res!913277) (not e!775929))))

(assert (=> b!1369814 (= res!913277 (not (contains!9667 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369815 () Bool)

(declare-fun res!913270 () Bool)

(assert (=> b!1369815 (=> (not res!913270) (not e!775929))))

(declare-fun noDuplicate!2524 (List!31985) Bool)

(assert (=> b!1369815 (= res!913270 (noDuplicate!2524 acc!866))))

(declare-fun b!1369816 () Bool)

(declare-fun res!913273 () Bool)

(assert (=> b!1369816 (=> (not res!913273) (not e!775929))))

(assert (=> b!1369816 (= res!913273 (not (contains!9667 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369817 () Bool)

(assert (=> b!1369817 (= e!775929 e!775930)))

(declare-fun res!913279 () Bool)

(assert (=> b!1369817 (=> (not res!913279) (not e!775930))))

(declare-fun arrayNoDuplicates!0 (array!92992 (_ BitVec 32) List!31985) Bool)

(assert (=> b!1369817 (= res!913279 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45271 0))(
  ( (Unit!45272) )
))
(declare-fun lt!602346 () Unit!45271)

(declare-fun noDuplicateSubseq!256 (List!31985 List!31985) Unit!45271)

(assert (=> b!1369817 (= lt!602346 (noDuplicateSubseq!256 newAcc!98 acc!866))))

(declare-fun b!1369818 () Bool)

(declare-fun res!913278 () Bool)

(assert (=> b!1369818 (=> (not res!913278) (not e!775930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369818 (= res!913278 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1369819 () Bool)

(declare-fun res!913275 () Bool)

(assert (=> b!1369819 (=> (not res!913275) (not e!775929))))

(declare-fun subseq!1069 (List!31985 List!31985) Bool)

(assert (=> b!1369819 (= res!913275 (subseq!1069 newAcc!98 acc!866))))

(assert (= (and start!115878 res!913276) b!1369815))

(assert (= (and b!1369815 res!913270) b!1369811))

(assert (= (and b!1369811 res!913274) b!1369814))

(assert (= (and b!1369814 res!913277) b!1369810))

(assert (= (and b!1369810 res!913271) b!1369816))

(assert (= (and b!1369816 res!913273) b!1369819))

(assert (= (and b!1369819 res!913275) b!1369817))

(assert (= (and b!1369817 res!913279) b!1369812))

(assert (= (and b!1369812 res!913272) b!1369818))

(assert (= (and b!1369818 res!913278) b!1369813))

(declare-fun m!1253521 () Bool)

(assert (=> b!1369818 m!1253521))

(assert (=> b!1369818 m!1253521))

(declare-fun m!1253523 () Bool)

(assert (=> b!1369818 m!1253523))

(declare-fun m!1253525 () Bool)

(assert (=> b!1369819 m!1253525))

(declare-fun m!1253527 () Bool)

(assert (=> b!1369816 m!1253527))

(declare-fun m!1253529 () Bool)

(assert (=> b!1369817 m!1253529))

(declare-fun m!1253531 () Bool)

(assert (=> b!1369817 m!1253531))

(declare-fun m!1253533 () Bool)

(assert (=> b!1369815 m!1253533))

(declare-fun m!1253535 () Bool)

(assert (=> b!1369811 m!1253535))

(assert (=> b!1369813 m!1253521))

(assert (=> b!1369813 m!1253521))

(declare-fun m!1253537 () Bool)

(assert (=> b!1369813 m!1253537))

(declare-fun m!1253539 () Bool)

(assert (=> b!1369814 m!1253539))

(declare-fun m!1253541 () Bool)

(assert (=> start!115878 m!1253541))

(declare-fun m!1253543 () Bool)

(assert (=> b!1369810 m!1253543))

(push 1)

