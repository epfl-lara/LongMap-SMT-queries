; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93058 () Bool)

(assert start!93058)

(declare-fun b!1055785 () Bool)

(declare-fun e!600094 () Bool)

(assert (=> b!1055785 (= e!600094 true)))

(assert (=> b!1055785 false))

(declare-datatypes ((array!66583 0))(
  ( (array!66584 (arr!32019 (Array (_ BitVec 32) (_ BitVec 64))) (size!32555 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66583)

(declare-datatypes ((Unit!34596 0))(
  ( (Unit!34597) )
))
(declare-fun lt!465909 () Unit!34596)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22331 0))(
  ( (Nil!22328) (Cons!22327 (h!23536 (_ BitVec 64)) (t!31638 List!22331)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66583 (_ BitVec 64) (_ BitVec 32) List!22331) Unit!34596)

(assert (=> b!1055785 (= lt!465909 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22328))))

(declare-fun arrayContainsKey!0 (array!66583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055785 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465908 () (_ BitVec 32))

(declare-fun lt!465910 () Unit!34596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34596)

(assert (=> b!1055785 (= lt!465910 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465908 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66583 (_ BitVec 32) List!22331) Bool)

(assert (=> b!1055785 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22328)))

(declare-fun lt!465911 () Unit!34596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66583 (_ BitVec 32) (_ BitVec 32)) Unit!34596)

(assert (=> b!1055785 (= lt!465911 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055786 () Bool)

(declare-fun e!600095 () Bool)

(declare-fun e!600099 () Bool)

(assert (=> b!1055786 (= e!600095 e!600099)))

(declare-fun res!704598 () Bool)

(assert (=> b!1055786 (=> (not res!704598) (not e!600099))))

(assert (=> b!1055786 (= res!704598 (not (= lt!465908 i!1381)))))

(declare-fun lt!465912 () array!66583)

(declare-fun arrayScanForKey!0 (array!66583 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055786 (= lt!465908 (arrayScanForKey!0 lt!465912 k!2747 #b00000000000000000000000000000000))))

(declare-fun e!600097 () Bool)

(declare-fun b!1055787 () Bool)

(assert (=> b!1055787 (= e!600097 (arrayContainsKey!0 a!3488 k!2747 lt!465908))))

(declare-fun b!1055788 () Bool)

(declare-fun res!704603 () Bool)

(declare-fun e!600098 () Bool)

(assert (=> b!1055788 (=> (not res!704603) (not e!600098))))

(assert (=> b!1055788 (= res!704603 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22328))))

(declare-fun b!1055789 () Bool)

(declare-fun res!704604 () Bool)

(assert (=> b!1055789 (=> (not res!704604) (not e!600098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055789 (= res!704604 (validKeyInArray!0 k!2747))))

(declare-fun b!1055790 () Bool)

(assert (=> b!1055790 (= e!600098 e!600095)))

(declare-fun res!704606 () Bool)

(assert (=> b!1055790 (=> (not res!704606) (not e!600095))))

(assert (=> b!1055790 (= res!704606 (arrayContainsKey!0 lt!465912 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055790 (= lt!465912 (array!66584 (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32555 a!3488)))))

(declare-fun res!704600 () Bool)

(assert (=> start!93058 (=> (not res!704600) (not e!600098))))

(assert (=> start!93058 (= res!704600 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32555 a!3488)) (bvslt (size!32555 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93058 e!600098))

(assert (=> start!93058 true))

(declare-fun array_inv!24799 (array!66583) Bool)

(assert (=> start!93058 (array_inv!24799 a!3488)))

(declare-fun b!1055784 () Bool)

(assert (=> b!1055784 (= e!600099 (not e!600094))))

(declare-fun res!704605 () Bool)

(assert (=> b!1055784 (=> res!704605 e!600094)))

(assert (=> b!1055784 (= res!704605 (bvsle lt!465908 i!1381))))

(declare-fun e!600100 () Bool)

(assert (=> b!1055784 e!600100))

(declare-fun res!704599 () Bool)

(assert (=> b!1055784 (=> (not res!704599) (not e!600100))))

(assert (=> b!1055784 (= res!704599 (= (select (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465908) k!2747))))

(declare-fun b!1055791 () Bool)

(declare-fun res!704602 () Bool)

(assert (=> b!1055791 (=> (not res!704602) (not e!600098))))

(assert (=> b!1055791 (= res!704602 (= (select (arr!32019 a!3488) i!1381) k!2747))))

(declare-fun b!1055792 () Bool)

(assert (=> b!1055792 (= e!600100 e!600097)))

(declare-fun res!704601 () Bool)

(assert (=> b!1055792 (=> res!704601 e!600097)))

(assert (=> b!1055792 (= res!704601 (bvsle lt!465908 i!1381))))

(assert (= (and start!93058 res!704600) b!1055788))

(assert (= (and b!1055788 res!704603) b!1055789))

(assert (= (and b!1055789 res!704604) b!1055791))

(assert (= (and b!1055791 res!704602) b!1055790))

(assert (= (and b!1055790 res!704606) b!1055786))

(assert (= (and b!1055786 res!704598) b!1055784))

(assert (= (and b!1055784 res!704599) b!1055792))

(assert (= (and b!1055792 (not res!704601)) b!1055787))

(assert (= (and b!1055784 (not res!704605)) b!1055785))

(declare-fun m!975757 () Bool)

(assert (=> b!1055784 m!975757))

(declare-fun m!975759 () Bool)

(assert (=> b!1055784 m!975759))

(declare-fun m!975761 () Bool)

(assert (=> b!1055788 m!975761))

(declare-fun m!975763 () Bool)

(assert (=> b!1055791 m!975763))

(declare-fun m!975765 () Bool)

(assert (=> b!1055786 m!975765))

(declare-fun m!975767 () Bool)

(assert (=> start!93058 m!975767))

(declare-fun m!975769 () Bool)

(assert (=> b!1055790 m!975769))

(assert (=> b!1055790 m!975757))

(declare-fun m!975771 () Bool)

(assert (=> b!1055785 m!975771))

(declare-fun m!975773 () Bool)

(assert (=> b!1055785 m!975773))

(declare-fun m!975775 () Bool)

(assert (=> b!1055785 m!975775))

(declare-fun m!975777 () Bool)

(assert (=> b!1055785 m!975777))

(declare-fun m!975779 () Bool)

(assert (=> b!1055785 m!975779))

(declare-fun m!975781 () Bool)

(assert (=> b!1055787 m!975781))

(declare-fun m!975783 () Bool)

(assert (=> b!1055789 m!975783))

(push 1)

(assert (not start!93058))

(assert (not b!1055789))

