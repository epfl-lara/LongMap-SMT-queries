; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103966 () Bool)

(assert start!103966)

(declare-fun b!1244396 () Bool)

(declare-fun e!705330 () Bool)

(declare-fun e!705332 () Bool)

(assert (=> b!1244396 (= e!705330 e!705332)))

(declare-fun res!830055 () Bool)

(assert (=> b!1244396 (=> (not res!830055) (not e!705332))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244396 (= res!830055 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41372 0))(
  ( (Unit!41373) )
))
(declare-fun lt!562727 () Unit!41372)

(declare-fun e!705331 () Unit!41372)

(assert (=> b!1244396 (= lt!562727 e!705331)))

(declare-fun c!121855 () Bool)

(declare-datatypes ((array!80058 0))(
  ( (array!80059 (arr!38622 (Array (_ BitVec 32) (_ BitVec 64))) (size!39158 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80058)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244396 (= c!121855 (validKeyInArray!0 (select (arr!38622 a!3892) from!3270)))))

(declare-fun b!1244397 () Bool)

(assert (=> b!1244397 (= e!705332 (not true))))

(declare-datatypes ((List!27425 0))(
  ( (Nil!27422) (Cons!27421 (h!28630 (_ BitVec 64)) (t!40894 List!27425)) )
))
(declare-fun arrayNoDuplicates!0 (array!80058 (_ BitVec 32) List!27425) Bool)

(assert (=> b!1244397 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27422)))

(declare-fun lt!562725 () Unit!41372)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80058 (_ BitVec 32) (_ BitVec 32)) Unit!41372)

(assert (=> b!1244397 (= lt!562725 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244398 () Bool)

(declare-fun res!830056 () Bool)

(assert (=> b!1244398 (=> (not res!830056) (not e!705330))))

(assert (=> b!1244398 (= res!830056 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39158 a!3892)) (not (= newFrom!287 (size!39158 a!3892)))))))

(declare-fun b!1244399 () Bool)

(declare-fun lt!562726 () Unit!41372)

(assert (=> b!1244399 (= e!705331 lt!562726)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80058 List!27425 List!27425 (_ BitVec 32)) Unit!41372)

(assert (=> b!1244399 (= lt!562726 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27421 (select (arr!38622 a!3892) from!3270) Nil!27422) Nil!27422 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244399 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27422)))

(declare-fun res!830057 () Bool)

(assert (=> start!103966 (=> (not res!830057) (not e!705330))))

(assert (=> start!103966 (= res!830057 (and (bvslt (size!39158 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39158 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39158 a!3892))))))

(assert (=> start!103966 e!705330))

(declare-fun array_inv!29470 (array!80058) Bool)

(assert (=> start!103966 (array_inv!29470 a!3892)))

(assert (=> start!103966 true))

(declare-fun b!1244400 () Bool)

(declare-fun Unit!41374 () Unit!41372)

(assert (=> b!1244400 (= e!705331 Unit!41374)))

(declare-fun b!1244401 () Bool)

(declare-fun res!830059 () Bool)

(assert (=> b!1244401 (=> (not res!830059) (not e!705332))))

(assert (=> b!1244401 (= res!830059 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27422))))

(declare-fun b!1244402 () Bool)

(declare-fun res!830058 () Bool)

(assert (=> b!1244402 (=> (not res!830058) (not e!705330))))

(assert (=> b!1244402 (= res!830058 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27422))))

(assert (= (and start!103966 res!830057) b!1244402))

(assert (= (and b!1244402 res!830058) b!1244398))

(assert (= (and b!1244398 res!830056) b!1244396))

(assert (= (and b!1244396 c!121855) b!1244399))

(assert (= (and b!1244396 (not c!121855)) b!1244400))

(assert (= (and b!1244396 res!830055) b!1244401))

(assert (= (and b!1244401 res!830059) b!1244397))

(declare-fun m!1146687 () Bool)

(assert (=> b!1244402 m!1146687))

(declare-fun m!1146689 () Bool)

(assert (=> b!1244397 m!1146689))

(declare-fun m!1146691 () Bool)

(assert (=> b!1244397 m!1146691))

(declare-fun m!1146693 () Bool)

(assert (=> b!1244399 m!1146693))

(declare-fun m!1146695 () Bool)

(assert (=> b!1244399 m!1146695))

(declare-fun m!1146697 () Bool)

(assert (=> b!1244399 m!1146697))

(assert (=> b!1244401 m!1146697))

(assert (=> b!1244396 m!1146693))

(assert (=> b!1244396 m!1146693))

(declare-fun m!1146699 () Bool)

(assert (=> b!1244396 m!1146699))

(declare-fun m!1146701 () Bool)

(assert (=> start!103966 m!1146701))

(check-sat (not b!1244399) (not b!1244397) (not b!1244396) (not start!103966) (not b!1244401) (not b!1244402))
(check-sat)
