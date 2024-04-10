; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115624 () Bool)

(assert start!115624)

(declare-fun b!1367368 () Bool)

(declare-fun e!774936 () Bool)

(declare-fun e!774937 () Bool)

(assert (=> b!1367368 (= e!774936 e!774937)))

(declare-fun res!910895 () Bool)

(assert (=> b!1367368 (=> (not res!910895) (not e!774937))))

(declare-datatypes ((array!92855 0))(
  ( (array!92856 (arr!44853 (Array (_ BitVec 32) (_ BitVec 64))) (size!45403 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92855)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31921 0))(
  ( (Nil!31918) (Cons!31917 (h!33126 (_ BitVec 64)) (t!46615 List!31921)) )
))
(declare-fun acc!866 () List!31921)

(declare-fun arrayNoDuplicates!0 (array!92855 (_ BitVec 32) List!31921) Bool)

(assert (=> b!1367368 (= res!910895 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45143 0))(
  ( (Unit!45144) )
))
(declare-fun lt!601878 () Unit!45143)

(declare-fun newAcc!98 () List!31921)

(declare-fun noDuplicateSubseq!192 (List!31921 List!31921) Unit!45143)

(assert (=> b!1367368 (= lt!601878 (noDuplicateSubseq!192 newAcc!98 acc!866))))

(declare-fun b!1367369 () Bool)

(declare-fun res!910902 () Bool)

(assert (=> b!1367369 (=> (not res!910902) (not e!774937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367369 (= res!910902 (validKeyInArray!0 (select (arr!44853 a!3861) from!3239)))))

(declare-fun b!1367370 () Bool)

(declare-fun res!910896 () Bool)

(assert (=> b!1367370 (=> (not res!910896) (not e!774936))))

(declare-fun contains!9603 (List!31921 (_ BitVec 64)) Bool)

(assert (=> b!1367370 (= res!910896 (not (contains!9603 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367371 () Bool)

(declare-fun res!910900 () Bool)

(assert (=> b!1367371 (=> (not res!910900) (not e!774936))))

(declare-fun subseq!1005 (List!31921 List!31921) Bool)

(assert (=> b!1367371 (= res!910900 (subseq!1005 newAcc!98 acc!866))))

(declare-fun b!1367372 () Bool)

(declare-fun res!910897 () Bool)

(assert (=> b!1367372 (=> (not res!910897) (not e!774937))))

(assert (=> b!1367372 (= res!910897 (bvslt from!3239 (size!45403 a!3861)))))

(declare-fun b!1367373 () Bool)

(declare-fun res!910903 () Bool)

(assert (=> b!1367373 (=> (not res!910903) (not e!774936))))

(declare-fun noDuplicate!2460 (List!31921) Bool)

(assert (=> b!1367373 (= res!910903 (noDuplicate!2460 acc!866))))

(declare-fun res!910898 () Bool)

(assert (=> start!115624 (=> (not res!910898) (not e!774936))))

(assert (=> start!115624 (= res!910898 (and (bvslt (size!45403 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45403 a!3861))))))

(assert (=> start!115624 e!774936))

(declare-fun array_inv!33881 (array!92855) Bool)

(assert (=> start!115624 (array_inv!33881 a!3861)))

(assert (=> start!115624 true))

(declare-fun b!1367374 () Bool)

(declare-fun res!910901 () Bool)

(assert (=> b!1367374 (=> (not res!910901) (not e!774936))))

(assert (=> b!1367374 (= res!910901 (not (contains!9603 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367375 () Bool)

(assert (=> b!1367375 (= e!774937 false)))

(declare-fun lt!601879 () Bool)

(assert (=> b!1367375 (= lt!601879 (contains!9603 acc!866 (select (arr!44853 a!3861) from!3239)))))

(declare-fun b!1367376 () Bool)

(declare-fun res!910899 () Bool)

(assert (=> b!1367376 (=> (not res!910899) (not e!774936))))

(assert (=> b!1367376 (= res!910899 (not (contains!9603 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367377 () Bool)

(declare-fun res!910894 () Bool)

(assert (=> b!1367377 (=> (not res!910894) (not e!774936))))

(assert (=> b!1367377 (= res!910894 (not (contains!9603 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115624 res!910898) b!1367373))

(assert (= (and b!1367373 res!910903) b!1367377))

(assert (= (and b!1367377 res!910894) b!1367374))

(assert (= (and b!1367374 res!910901) b!1367376))

(assert (= (and b!1367376 res!910899) b!1367370))

(assert (= (and b!1367370 res!910896) b!1367371))

(assert (= (and b!1367371 res!910900) b!1367368))

(assert (= (and b!1367368 res!910895) b!1367372))

(assert (= (and b!1367372 res!910897) b!1367369))

(assert (= (and b!1367369 res!910902) b!1367375))

(declare-fun m!1251607 () Bool)

(assert (=> b!1367373 m!1251607))

(declare-fun m!1251609 () Bool)

(assert (=> b!1367368 m!1251609))

(declare-fun m!1251611 () Bool)

(assert (=> b!1367368 m!1251611))

(declare-fun m!1251613 () Bool)

(assert (=> b!1367374 m!1251613))

(declare-fun m!1251615 () Bool)

(assert (=> b!1367376 m!1251615))

(declare-fun m!1251617 () Bool)

(assert (=> b!1367370 m!1251617))

(declare-fun m!1251619 () Bool)

(assert (=> b!1367369 m!1251619))

(assert (=> b!1367369 m!1251619))

(declare-fun m!1251621 () Bool)

(assert (=> b!1367369 m!1251621))

(assert (=> b!1367375 m!1251619))

(assert (=> b!1367375 m!1251619))

(declare-fun m!1251623 () Bool)

(assert (=> b!1367375 m!1251623))

(declare-fun m!1251625 () Bool)

(assert (=> start!115624 m!1251625))

(declare-fun m!1251627 () Bool)

(assert (=> b!1367371 m!1251627))

(declare-fun m!1251629 () Bool)

(assert (=> b!1367377 m!1251629))

(check-sat (not b!1367374) (not b!1367377) (not b!1367368) (not b!1367375) (not b!1367376) (not b!1367369) (not b!1367370) (not start!115624) (not b!1367373) (not b!1367371))
(check-sat)
