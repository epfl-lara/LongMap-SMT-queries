; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103948 () Bool)

(assert start!103948)

(declare-fun b!1244220 () Bool)

(declare-datatypes ((Unit!41345 0))(
  ( (Unit!41346) )
))
(declare-fun e!705222 () Unit!41345)

(declare-fun Unit!41347 () Unit!41345)

(assert (=> b!1244220 (= e!705222 Unit!41347)))

(declare-fun b!1244221 () Bool)

(declare-fun lt!562645 () Unit!41345)

(assert (=> b!1244221 (= e!705222 lt!562645)))

(declare-datatypes ((array!80040 0))(
  ( (array!80041 (arr!38613 (Array (_ BitVec 32) (_ BitVec 64))) (size!39149 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80040)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27416 0))(
  ( (Nil!27413) (Cons!27412 (h!28621 (_ BitVec 64)) (t!40885 List!27416)) )
))
(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80040 List!27416 List!27416 (_ BitVec 32)) Unit!41345)

(assert (=> b!1244221 (= lt!562645 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27412 (select (arr!38613 a!3892) from!3270) Nil!27413) Nil!27413 (bvadd #b00000000000000000000000000000001 from!3270)))))

(declare-fun arrayNoDuplicates!0 (array!80040 (_ BitVec 32) List!27416) Bool)

(assert (=> b!1244221 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27413)))

(declare-fun res!829936 () Bool)

(declare-fun e!705224 () Bool)

(assert (=> start!103948 (=> (not res!829936) (not e!705224))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103948 (= res!829936 (and (bvslt (size!39149 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39149 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39149 a!3892))))))

(assert (=> start!103948 e!705224))

(declare-fun array_inv!29461 (array!80040) Bool)

(assert (=> start!103948 (array_inv!29461 a!3892)))

(assert (=> start!103948 true))

(declare-fun b!1244222 () Bool)

(declare-fun res!829933 () Bool)

(assert (=> b!1244222 (=> (not res!829933) (not e!705224))))

(assert (=> b!1244222 (= res!829933 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39149 a!3892)) (not (= newFrom!287 (size!39149 a!3892)))))))

(declare-fun b!1244223 () Bool)

(declare-fun e!705223 () Bool)

(assert (=> b!1244223 (= e!705224 e!705223)))

(declare-fun res!829934 () Bool)

(assert (=> b!1244223 (=> (not res!829934) (not e!705223))))

(assert (=> b!1244223 (= res!829934 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562644 () Unit!41345)

(assert (=> b!1244223 (= lt!562644 e!705222)))

(declare-fun c!121828 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244223 (= c!121828 (validKeyInArray!0 (select (arr!38613 a!3892) from!3270)))))

(declare-fun b!1244224 () Bool)

(declare-fun res!829935 () Bool)

(assert (=> b!1244224 (=> (not res!829935) (not e!705224))))

(assert (=> b!1244224 (= res!829935 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27413))))

(declare-fun b!1244225 () Bool)

(assert (=> b!1244225 (= e!705223 false)))

(declare-fun lt!562646 () Bool)

(assert (=> b!1244225 (= lt!562646 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27413))))

(assert (= (and start!103948 res!829936) b!1244224))

(assert (= (and b!1244224 res!829935) b!1244222))

(assert (= (and b!1244222 res!829933) b!1244223))

(assert (= (and b!1244223 c!121828) b!1244221))

(assert (= (and b!1244223 (not c!121828)) b!1244220))

(assert (= (and b!1244223 res!829934) b!1244225))

(declare-fun m!1146563 () Bool)

(assert (=> b!1244221 m!1146563))

(declare-fun m!1146565 () Bool)

(assert (=> b!1244221 m!1146565))

(declare-fun m!1146567 () Bool)

(assert (=> b!1244221 m!1146567))

(declare-fun m!1146569 () Bool)

(assert (=> start!103948 m!1146569))

(declare-fun m!1146571 () Bool)

(assert (=> b!1244224 m!1146571))

(assert (=> b!1244223 m!1146563))

(assert (=> b!1244223 m!1146563))

(declare-fun m!1146573 () Bool)

(assert (=> b!1244223 m!1146573))

(assert (=> b!1244225 m!1146567))

(check-sat (not b!1244223) (not start!103948) (not b!1244225) (not b!1244224) (not b!1244221))
(check-sat)
