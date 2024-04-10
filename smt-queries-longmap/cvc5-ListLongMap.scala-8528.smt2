; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103964 () Bool)

(assert start!103964)

(declare-fun b!1244375 () Bool)

(declare-datatypes ((Unit!41369 0))(
  ( (Unit!41370) )
))
(declare-fun e!705318 () Unit!41369)

(declare-fun Unit!41371 () Unit!41369)

(assert (=> b!1244375 (= e!705318 Unit!41371)))

(declare-fun b!1244376 () Bool)

(declare-fun e!705319 () Bool)

(declare-fun e!705320 () Bool)

(assert (=> b!1244376 (= e!705319 e!705320)))

(declare-fun res!830041 () Bool)

(assert (=> b!1244376 (=> (not res!830041) (not e!705320))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244376 (= res!830041 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562718 () Unit!41369)

(assert (=> b!1244376 (= lt!562718 e!705318)))

(declare-fun c!121852 () Bool)

(declare-datatypes ((array!80056 0))(
  ( (array!80057 (arr!38621 (Array (_ BitVec 32) (_ BitVec 64))) (size!39157 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80056)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244376 (= c!121852 (validKeyInArray!0 (select (arr!38621 a!3892) from!3270)))))

(declare-fun b!1244377 () Bool)

(declare-fun res!830042 () Bool)

(assert (=> b!1244377 (=> (not res!830042) (not e!705320))))

(declare-datatypes ((List!27424 0))(
  ( (Nil!27421) (Cons!27420 (h!28629 (_ BitVec 64)) (t!40893 List!27424)) )
))
(declare-fun arrayNoDuplicates!0 (array!80056 (_ BitVec 32) List!27424) Bool)

(assert (=> b!1244377 (= res!830042 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27421))))

(declare-fun b!1244378 () Bool)

(declare-fun res!830040 () Bool)

(assert (=> b!1244378 (=> (not res!830040) (not e!705319))))

(assert (=> b!1244378 (= res!830040 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39157 a!3892)) (not (= newFrom!287 (size!39157 a!3892)))))))

(declare-fun b!1244379 () Bool)

(declare-fun res!830043 () Bool)

(assert (=> b!1244379 (=> (not res!830043) (not e!705319))))

(assert (=> b!1244379 (= res!830043 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27421))))

(declare-fun res!830044 () Bool)

(assert (=> start!103964 (=> (not res!830044) (not e!705319))))

(assert (=> start!103964 (= res!830044 (and (bvslt (size!39157 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39157 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39157 a!3892))))))

(assert (=> start!103964 e!705319))

(declare-fun array_inv!29469 (array!80056) Bool)

(assert (=> start!103964 (array_inv!29469 a!3892)))

(assert (=> start!103964 true))

(declare-fun b!1244380 () Bool)

(declare-fun lt!562716 () Unit!41369)

(assert (=> b!1244380 (= e!705318 lt!562716)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80056 List!27424 List!27424 (_ BitVec 32)) Unit!41369)

(assert (=> b!1244380 (= lt!562716 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27420 (select (arr!38621 a!3892) from!3270) Nil!27421) Nil!27421 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244380 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27421)))

(declare-fun b!1244381 () Bool)

(assert (=> b!1244381 (= e!705320 (not true))))

(assert (=> b!1244381 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27421)))

(declare-fun lt!562717 () Unit!41369)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80056 (_ BitVec 32) (_ BitVec 32)) Unit!41369)

(assert (=> b!1244381 (= lt!562717 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(assert (= (and start!103964 res!830044) b!1244379))

(assert (= (and b!1244379 res!830043) b!1244378))

(assert (= (and b!1244378 res!830040) b!1244376))

(assert (= (and b!1244376 c!121852) b!1244380))

(assert (= (and b!1244376 (not c!121852)) b!1244375))

(assert (= (and b!1244376 res!830041) b!1244377))

(assert (= (and b!1244377 res!830042) b!1244381))

(declare-fun m!1146671 () Bool)

(assert (=> b!1244381 m!1146671))

(declare-fun m!1146673 () Bool)

(assert (=> b!1244381 m!1146673))

(declare-fun m!1146675 () Bool)

(assert (=> start!103964 m!1146675))

(declare-fun m!1146677 () Bool)

(assert (=> b!1244377 m!1146677))

(declare-fun m!1146679 () Bool)

(assert (=> b!1244376 m!1146679))

(assert (=> b!1244376 m!1146679))

(declare-fun m!1146681 () Bool)

(assert (=> b!1244376 m!1146681))

(assert (=> b!1244380 m!1146679))

(declare-fun m!1146683 () Bool)

(assert (=> b!1244380 m!1146683))

(assert (=> b!1244380 m!1146677))

(declare-fun m!1146685 () Bool)

(assert (=> b!1244379 m!1146685))

(push 1)

