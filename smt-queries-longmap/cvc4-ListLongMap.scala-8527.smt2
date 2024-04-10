; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103962 () Bool)

(assert start!103962)

(declare-fun b!1244354 () Bool)

(declare-fun e!705309 () Bool)

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244354 (= e!705309 (not (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!80054 0))(
  ( (array!80055 (arr!38620 (Array (_ BitVec 32) (_ BitVec 64))) (size!39156 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80054)

(declare-datatypes ((List!27423 0))(
  ( (Nil!27420) (Cons!27419 (h!28628 (_ BitVec 64)) (t!40892 List!27423)) )
))
(declare-fun arrayNoDuplicates!0 (array!80054 (_ BitVec 32) List!27423) Bool)

(assert (=> b!1244354 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27420)))

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((Unit!41366 0))(
  ( (Unit!41367) )
))
(declare-fun lt!562709 () Unit!41366)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80054 (_ BitVec 32) (_ BitVec 32)) Unit!41366)

(assert (=> b!1244354 (= lt!562709 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun res!830026 () Bool)

(declare-fun e!705306 () Bool)

(assert (=> start!103962 (=> (not res!830026) (not e!705306))))

(assert (=> start!103962 (= res!830026 (and (bvslt (size!39156 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39156 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39156 a!3892))))))

(assert (=> start!103962 e!705306))

(declare-fun array_inv!29468 (array!80054) Bool)

(assert (=> start!103962 (array_inv!29468 a!3892)))

(assert (=> start!103962 true))

(declare-fun b!1244355 () Bool)

(declare-fun res!830029 () Bool)

(assert (=> b!1244355 (=> (not res!830029) (not e!705306))))

(assert (=> b!1244355 (= res!830029 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27420))))

(declare-fun b!1244356 () Bool)

(declare-fun res!830025 () Bool)

(assert (=> b!1244356 (=> (not res!830025) (not e!705309))))

(assert (=> b!1244356 (= res!830025 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27420))))

(declare-fun b!1244357 () Bool)

(declare-fun e!705307 () Unit!41366)

(declare-fun Unit!41368 () Unit!41366)

(assert (=> b!1244357 (= e!705307 Unit!41368)))

(declare-fun b!1244358 () Bool)

(declare-fun lt!562707 () Unit!41366)

(assert (=> b!1244358 (= e!705307 lt!562707)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80054 List!27423 List!27423 (_ BitVec 32)) Unit!41366)

(assert (=> b!1244358 (= lt!562707 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27419 (select (arr!38620 a!3892) from!3270) Nil!27420) Nil!27420 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244358 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27420)))

(declare-fun b!1244359 () Bool)

(declare-fun res!830028 () Bool)

(assert (=> b!1244359 (=> (not res!830028) (not e!705306))))

(assert (=> b!1244359 (= res!830028 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39156 a!3892)) (not (= newFrom!287 (size!39156 a!3892)))))))

(declare-fun b!1244360 () Bool)

(assert (=> b!1244360 (= e!705306 e!705309)))

(declare-fun res!830027 () Bool)

(assert (=> b!1244360 (=> (not res!830027) (not e!705309))))

(assert (=> b!1244360 (= res!830027 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562708 () Unit!41366)

(assert (=> b!1244360 (= lt!562708 e!705307)))

(declare-fun c!121849 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244360 (= c!121849 (validKeyInArray!0 (select (arr!38620 a!3892) from!3270)))))

(assert (= (and start!103962 res!830026) b!1244355))

(assert (= (and b!1244355 res!830029) b!1244359))

(assert (= (and b!1244359 res!830028) b!1244360))

(assert (= (and b!1244360 c!121849) b!1244358))

(assert (= (and b!1244360 (not c!121849)) b!1244357))

(assert (= (and b!1244360 res!830027) b!1244356))

(assert (= (and b!1244356 res!830025) b!1244354))

(declare-fun m!1146655 () Bool)

(assert (=> b!1244354 m!1146655))

(declare-fun m!1146657 () Bool)

(assert (=> b!1244354 m!1146657))

(declare-fun m!1146659 () Bool)

(assert (=> b!1244358 m!1146659))

(declare-fun m!1146661 () Bool)

(assert (=> b!1244358 m!1146661))

(declare-fun m!1146663 () Bool)

(assert (=> b!1244358 m!1146663))

(declare-fun m!1146665 () Bool)

(assert (=> b!1244355 m!1146665))

(declare-fun m!1146667 () Bool)

(assert (=> start!103962 m!1146667))

(assert (=> b!1244360 m!1146659))

(assert (=> b!1244360 m!1146659))

(declare-fun m!1146669 () Bool)

(assert (=> b!1244360 m!1146669))

(assert (=> b!1244356 m!1146663))

(push 1)

