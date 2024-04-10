; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103950 () Bool)

(assert start!103950)

(declare-fun b!1244238 () Bool)

(declare-fun e!705235 () Bool)

(declare-fun e!705236 () Bool)

(assert (=> b!1244238 (= e!705235 e!705236)))

(declare-fun res!829946 () Bool)

(assert (=> b!1244238 (=> (not res!829946) (not e!705236))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244238 (= res!829946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41348 0))(
  ( (Unit!41349) )
))
(declare-fun lt!562655 () Unit!41348)

(declare-fun e!705234 () Unit!41348)

(assert (=> b!1244238 (= lt!562655 e!705234)))

(declare-fun c!121831 () Bool)

(declare-datatypes ((array!80042 0))(
  ( (array!80043 (arr!38614 (Array (_ BitVec 32) (_ BitVec 64))) (size!39150 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80042)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244238 (= c!121831 (validKeyInArray!0 (select (arr!38614 a!3892) from!3270)))))

(declare-fun b!1244239 () Bool)

(declare-fun Unit!41350 () Unit!41348)

(assert (=> b!1244239 (= e!705234 Unit!41350)))

(declare-fun b!1244240 () Bool)

(declare-fun res!829948 () Bool)

(assert (=> b!1244240 (=> (not res!829948) (not e!705235))))

(declare-datatypes ((List!27417 0))(
  ( (Nil!27414) (Cons!27413 (h!28622 (_ BitVec 64)) (t!40886 List!27417)) )
))
(declare-fun arrayNoDuplicates!0 (array!80042 (_ BitVec 32) List!27417) Bool)

(assert (=> b!1244240 (= res!829948 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27414))))

(declare-fun b!1244241 () Bool)

(assert (=> b!1244241 (= e!705236 false)))

(declare-fun lt!562653 () Bool)

(assert (=> b!1244241 (= lt!562653 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27414))))

(declare-fun res!829945 () Bool)

(assert (=> start!103950 (=> (not res!829945) (not e!705235))))

(assert (=> start!103950 (= res!829945 (and (bvslt (size!39150 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39150 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39150 a!3892))))))

(assert (=> start!103950 e!705235))

(declare-fun array_inv!29462 (array!80042) Bool)

(assert (=> start!103950 (array_inv!29462 a!3892)))

(assert (=> start!103950 true))

(declare-fun b!1244242 () Bool)

(declare-fun lt!562654 () Unit!41348)

(assert (=> b!1244242 (= e!705234 lt!562654)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80042 List!27417 List!27417 (_ BitVec 32)) Unit!41348)

(assert (=> b!1244242 (= lt!562654 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27413 (select (arr!38614 a!3892) from!3270) Nil!27414) Nil!27414 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244242 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27414)))

(declare-fun b!1244243 () Bool)

(declare-fun res!829947 () Bool)

(assert (=> b!1244243 (=> (not res!829947) (not e!705235))))

(assert (=> b!1244243 (= res!829947 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39150 a!3892)) (not (= newFrom!287 (size!39150 a!3892)))))))

(assert (= (and start!103950 res!829945) b!1244240))

(assert (= (and b!1244240 res!829948) b!1244243))

(assert (= (and b!1244243 res!829947) b!1244238))

(assert (= (and b!1244238 c!121831) b!1244242))

(assert (= (and b!1244238 (not c!121831)) b!1244239))

(assert (= (and b!1244238 res!829946) b!1244241))

(declare-fun m!1146575 () Bool)

(assert (=> b!1244242 m!1146575))

(declare-fun m!1146577 () Bool)

(assert (=> b!1244242 m!1146577))

(declare-fun m!1146579 () Bool)

(assert (=> b!1244242 m!1146579))

(assert (=> b!1244241 m!1146579))

(declare-fun m!1146581 () Bool)

(assert (=> start!103950 m!1146581))

(assert (=> b!1244238 m!1146575))

(assert (=> b!1244238 m!1146575))

(declare-fun m!1146583 () Bool)

(assert (=> b!1244238 m!1146583))

(declare-fun m!1146585 () Bool)

(assert (=> b!1244240 m!1146585))

(push 1)

(assert (not b!1244240))

(assert (not b!1244238))

(assert (not b!1244241))

(assert (not start!103950))

(assert (not b!1244242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

