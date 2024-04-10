; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104456 () Bool)

(assert start!104456)

(declare-fun b!1246574 () Bool)

(declare-fun res!831870 () Bool)

(declare-fun e!706996 () Bool)

(assert (=> b!1246574 (=> (not res!831870) (not e!706996))))

(declare-datatypes ((array!80248 0))(
  ( (array!80249 (arr!38701 (Array (_ BitVec 32) (_ BitVec 64))) (size!39237 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80248)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27504 0))(
  ( (Nil!27501) (Cons!27500 (h!28709 (_ BitVec 64)) (t!40973 List!27504)) )
))
(declare-fun arrayNoDuplicates!0 (array!80248 (_ BitVec 32) List!27504) Bool)

(assert (=> b!1246574 (= res!831870 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27501))))

(declare-fun res!831871 () Bool)

(assert (=> start!104456 (=> (not res!831871) (not e!706996))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104456 (= res!831871 (and (bvslt (size!39237 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39237 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39237 a!3892))))))

(assert (=> start!104456 e!706996))

(declare-fun array_inv!29549 (array!80248) Bool)

(assert (=> start!104456 (array_inv!29549 a!3892)))

(assert (=> start!104456 true))

(declare-fun b!1246575 () Bool)

(assert (=> b!1246575 (= e!706996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvslt newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41435 0))(
  ( (Unit!41436) )
))
(declare-fun lt!563135 () Unit!41435)

(declare-fun e!706995 () Unit!41435)

(assert (=> b!1246575 (= lt!563135 e!706995)))

(declare-fun c!122037 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246575 (= c!122037 (validKeyInArray!0 (select (arr!38701 a!3892) from!3270)))))

(declare-fun b!1246576 () Bool)

(declare-fun lt!563136 () Unit!41435)

(assert (=> b!1246576 (= e!706995 lt!563136)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80248 List!27504 List!27504 (_ BitVec 32)) Unit!41435)

(assert (=> b!1246576 (= lt!563136 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27500 (select (arr!38701 a!3892) from!3270) Nil!27501) Nil!27501 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246576 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27501)))

(declare-fun b!1246577 () Bool)

(declare-fun Unit!41437 () Unit!41435)

(assert (=> b!1246577 (= e!706995 Unit!41437)))

(declare-fun b!1246578 () Bool)

(declare-fun res!831869 () Bool)

(assert (=> b!1246578 (=> (not res!831869) (not e!706996))))

(assert (=> b!1246578 (= res!831869 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39237 a!3892)) (not (= newFrom!287 (size!39237 a!3892)))))))

(assert (= (and start!104456 res!831871) b!1246574))

(assert (= (and b!1246574 res!831870) b!1246578))

(assert (= (and b!1246578 res!831869) b!1246575))

(assert (= (and b!1246575 c!122037) b!1246576))

(assert (= (and b!1246575 (not c!122037)) b!1246577))

(declare-fun m!1148381 () Bool)

(assert (=> b!1246574 m!1148381))

(declare-fun m!1148383 () Bool)

(assert (=> start!104456 m!1148383))

(declare-fun m!1148385 () Bool)

(assert (=> b!1246575 m!1148385))

(assert (=> b!1246575 m!1148385))

(declare-fun m!1148387 () Bool)

(assert (=> b!1246575 m!1148387))

(assert (=> b!1246576 m!1148385))

(declare-fun m!1148389 () Bool)

(assert (=> b!1246576 m!1148389))

(declare-fun m!1148391 () Bool)

(assert (=> b!1246576 m!1148391))

(push 1)

(assert (not start!104456))

(assert (not b!1246574))

(assert (not b!1246575))

(assert (not b!1246576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

