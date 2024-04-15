; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104434 () Bool)

(assert start!104434)

(declare-fun b!1246357 () Bool)

(declare-datatypes ((Unit!41253 0))(
  ( (Unit!41254) )
))
(declare-fun e!706870 () Unit!41253)

(declare-fun lt!562903 () Unit!41253)

(assert (=> b!1246357 (= e!706870 lt!562903)))

(declare-datatypes ((array!80151 0))(
  ( (array!80152 (arr!38653 (Array (_ BitVec 32) (_ BitVec 64))) (size!39191 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80151)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27557 0))(
  ( (Nil!27554) (Cons!27553 (h!28762 (_ BitVec 64)) (t!41017 List!27557)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80151 List!27557 List!27557 (_ BitVec 32)) Unit!41253)

(assert (=> b!1246357 (= lt!562903 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27553 (select (arr!38653 a!3892) from!3270) Nil!27554) Nil!27554 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80151 (_ BitVec 32) List!27557) Bool)

(assert (=> b!1246357 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27554)))

(declare-fun res!831750 () Bool)

(declare-fun e!706871 () Bool)

(assert (=> start!104434 (=> (not res!831750) (not e!706871))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104434 (= res!831750 (and (bvslt (size!39191 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39191 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39191 a!3892))))))

(assert (=> start!104434 e!706871))

(declare-fun array_inv!29636 (array!80151) Bool)

(assert (=> start!104434 (array_inv!29636 a!3892)))

(assert (=> start!104434 true))

(declare-fun b!1246358 () Bool)

(declare-fun res!831749 () Bool)

(assert (=> b!1246358 (=> (not res!831749) (not e!706871))))

(assert (=> b!1246358 (= res!831749 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27554))))

(declare-fun b!1246359 () Bool)

(assert (=> b!1246359 (= e!706871 false)))

(declare-fun lt!562902 () Unit!41253)

(assert (=> b!1246359 (= lt!562902 e!706870)))

(declare-fun c!121992 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246359 (= c!121992 (validKeyInArray!0 (select (arr!38653 a!3892) from!3270)))))

(declare-fun b!1246360 () Bool)

(declare-fun Unit!41255 () Unit!41253)

(assert (=> b!1246360 (= e!706870 Unit!41255)))

(declare-fun b!1246361 () Bool)

(declare-fun res!831748 () Bool)

(assert (=> b!1246361 (=> (not res!831748) (not e!706871))))

(assert (=> b!1246361 (= res!831748 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39191 a!3892)) (not (= newFrom!287 (size!39191 a!3892)))))))

(assert (= (and start!104434 res!831750) b!1246358))

(assert (= (and b!1246358 res!831749) b!1246361))

(assert (= (and b!1246361 res!831748) b!1246359))

(assert (= (and b!1246359 c!121992) b!1246357))

(assert (= (and b!1246359 (not c!121992)) b!1246360))

(declare-fun m!1147753 () Bool)

(assert (=> b!1246357 m!1147753))

(declare-fun m!1147755 () Bool)

(assert (=> b!1246357 m!1147755))

(declare-fun m!1147757 () Bool)

(assert (=> b!1246357 m!1147757))

(declare-fun m!1147759 () Bool)

(assert (=> start!104434 m!1147759))

(declare-fun m!1147761 () Bool)

(assert (=> b!1246358 m!1147761))

(assert (=> b!1246359 m!1147753))

(assert (=> b!1246359 m!1147753))

(declare-fun m!1147763 () Bool)

(assert (=> b!1246359 m!1147763))

(push 1)

(assert (not b!1246358))

(assert (not b!1246359))

(assert (not start!104434))

(assert (not b!1246357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

