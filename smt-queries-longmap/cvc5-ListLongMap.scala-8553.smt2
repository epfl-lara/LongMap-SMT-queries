; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104446 () Bool)

(assert start!104446)

(declare-fun b!1246447 () Bool)

(declare-fun res!831804 () Bool)

(declare-fun e!706925 () Bool)

(assert (=> b!1246447 (=> (not res!831804) (not e!706925))))

(declare-datatypes ((array!80163 0))(
  ( (array!80164 (arr!38659 (Array (_ BitVec 32) (_ BitVec 64))) (size!39197 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80163)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1246447 (= res!831804 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39197 a!3892)) (not (= newFrom!287 (size!39197 a!3892)))))))

(declare-fun res!831803 () Bool)

(assert (=> start!104446 (=> (not res!831803) (not e!706925))))

(assert (=> start!104446 (= res!831803 (and (bvslt (size!39197 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39197 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39197 a!3892))))))

(assert (=> start!104446 e!706925))

(declare-fun array_inv!29642 (array!80163) Bool)

(assert (=> start!104446 (array_inv!29642 a!3892)))

(assert (=> start!104446 true))

(declare-fun b!1246448 () Bool)

(declare-datatypes ((Unit!41271 0))(
  ( (Unit!41272) )
))
(declare-fun e!706923 () Unit!41271)

(declare-fun Unit!41273 () Unit!41271)

(assert (=> b!1246448 (= e!706923 Unit!41273)))

(declare-fun b!1246449 () Bool)

(assert (=> b!1246449 (= e!706925 false)))

(declare-fun lt!562938 () Unit!41271)

(assert (=> b!1246449 (= lt!562938 e!706923)))

(declare-fun c!122010 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246449 (= c!122010 (validKeyInArray!0 (select (arr!38659 a!3892) from!3270)))))

(declare-fun b!1246450 () Bool)

(declare-fun res!831802 () Bool)

(assert (=> b!1246450 (=> (not res!831802) (not e!706925))))

(declare-datatypes ((List!27563 0))(
  ( (Nil!27560) (Cons!27559 (h!28768 (_ BitVec 64)) (t!41023 List!27563)) )
))
(declare-fun arrayNoDuplicates!0 (array!80163 (_ BitVec 32) List!27563) Bool)

(assert (=> b!1246450 (= res!831802 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27560))))

(declare-fun b!1246451 () Bool)

(declare-fun lt!562939 () Unit!41271)

(assert (=> b!1246451 (= e!706923 lt!562939)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80163 List!27563 List!27563 (_ BitVec 32)) Unit!41271)

(assert (=> b!1246451 (= lt!562939 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27559 (select (arr!38659 a!3892) from!3270) Nil!27560) Nil!27560 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1246451 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27560)))

(assert (= (and start!104446 res!831803) b!1246450))

(assert (= (and b!1246450 res!831802) b!1246447))

(assert (= (and b!1246447 res!831804) b!1246449))

(assert (= (and b!1246449 c!122010) b!1246451))

(assert (= (and b!1246449 (not c!122010)) b!1246448))

(declare-fun m!1147825 () Bool)

(assert (=> start!104446 m!1147825))

(declare-fun m!1147827 () Bool)

(assert (=> b!1246449 m!1147827))

(assert (=> b!1246449 m!1147827))

(declare-fun m!1147829 () Bool)

(assert (=> b!1246449 m!1147829))

(declare-fun m!1147831 () Bool)

(assert (=> b!1246450 m!1147831))

(assert (=> b!1246451 m!1147827))

(declare-fun m!1147833 () Bool)

(assert (=> b!1246451 m!1147833))

(declare-fun m!1147835 () Bool)

(assert (=> b!1246451 m!1147835))

(push 1)

(assert (not b!1246449))

(assert (not b!1246450))

(assert (not b!1246451))

(assert (not start!104446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

