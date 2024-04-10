; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134184 () Bool)

(assert start!134184)

(declare-fun res!1071419 () Bool)

(declare-fun e!873916 () Bool)

(assert (=> start!134184 (=> (not res!1071419) (not e!873916))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104716 0))(
  ( (array!104717 (arr!50541 (Array (_ BitVec 32) (_ BitVec 64))) (size!51091 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104716)

(assert (=> start!134184 (= res!1071419 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51091 a!3481)) (bvslt (size!51091 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134184 e!873916))

(assert (=> start!134184 true))

(declare-fun array_inv!39268 (array!104716) Bool)

(assert (=> start!134184 (array_inv!39268 a!3481)))

(declare-fun b!1567729 () Bool)

(declare-fun res!1071418 () Bool)

(assert (=> b!1567729 (=> (not res!1071418) (not e!873916))))

(assert (=> b!1567729 (= res!1071418 (bvslt from!2856 (size!51091 a!3481)))))

(declare-fun b!1567730 () Bool)

(declare-fun res!1071415 () Bool)

(assert (=> b!1567730 (=> (not res!1071415) (not e!873916))))

(declare-datatypes ((List!36673 0))(
  ( (Nil!36670) (Cons!36669 (h!38116 (_ BitVec 64)) (t!51581 List!36673)) )
))
(declare-fun acc!619 () List!36673)

(declare-fun contains!10375 (List!36673 (_ BitVec 64)) Bool)

(assert (=> b!1567730 (= res!1071415 (not (contains!10375 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567731 () Bool)

(declare-fun e!873915 () Bool)

(assert (=> b!1567731 (= e!873915 (not (contains!10375 acc!619 (select (arr!50541 a!3481) from!2856))))))

(declare-fun b!1567732 () Bool)

(declare-fun res!1071416 () Bool)

(assert (=> b!1567732 (=> (not res!1071416) (not e!873916))))

(assert (=> b!1567732 (= res!1071416 (not (contains!10375 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567733 () Bool)

(declare-fun res!1071420 () Bool)

(assert (=> b!1567733 (=> (not res!1071420) (not e!873916))))

(declare-fun noDuplicate!2647 (List!36673) Bool)

(assert (=> b!1567733 (= res!1071420 (noDuplicate!2647 acc!619))))

(declare-fun b!1567734 () Bool)

(assert (=> b!1567734 (= e!873916 false)))

(declare-fun lt!673039 () Bool)

(assert (=> b!1567734 (= lt!673039 e!873915)))

(declare-fun res!1071417 () Bool)

(assert (=> b!1567734 (=> res!1071417 e!873915)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567734 (= res!1071417 (not (validKeyInArray!0 (select (arr!50541 a!3481) from!2856))))))

(assert (= (and start!134184 res!1071419) b!1567733))

(assert (= (and b!1567733 res!1071420) b!1567730))

(assert (= (and b!1567730 res!1071415) b!1567732))

(assert (= (and b!1567732 res!1071416) b!1567729))

(assert (= (and b!1567729 res!1071418) b!1567734))

(assert (= (and b!1567734 (not res!1071417)) b!1567731))

(declare-fun m!1442507 () Bool)

(assert (=> b!1567733 m!1442507))

(declare-fun m!1442509 () Bool)

(assert (=> b!1567730 m!1442509))

(declare-fun m!1442511 () Bool)

(assert (=> b!1567731 m!1442511))

(assert (=> b!1567731 m!1442511))

(declare-fun m!1442513 () Bool)

(assert (=> b!1567731 m!1442513))

(declare-fun m!1442515 () Bool)

(assert (=> start!134184 m!1442515))

(assert (=> b!1567734 m!1442511))

(assert (=> b!1567734 m!1442511))

(declare-fun m!1442517 () Bool)

(assert (=> b!1567734 m!1442517))

(declare-fun m!1442519 () Bool)

(assert (=> b!1567732 m!1442519))

(push 1)

(assert (not b!1567733))

(assert (not start!134184))

(assert (not b!1567731))

(assert (not b!1567734))

(assert (not b!1567730))

(assert (not b!1567732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

