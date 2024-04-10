; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103938 () Bool)

(assert start!103938)

(declare-fun b!1244130 () Bool)

(declare-fun res!829873 () Bool)

(declare-fun e!705165 () Bool)

(assert (=> b!1244130 (=> (not res!829873) (not e!705165))))

(declare-datatypes ((array!80030 0))(
  ( (array!80031 (arr!38608 (Array (_ BitVec 32) (_ BitVec 64))) (size!39144 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80030)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27411 0))(
  ( (Nil!27408) (Cons!27407 (h!28616 (_ BitVec 64)) (t!40880 List!27411)) )
))
(declare-fun arrayNoDuplicates!0 (array!80030 (_ BitVec 32) List!27411) Bool)

(assert (=> b!1244130 (= res!829873 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27408))))

(declare-fun b!1244131 () Bool)

(declare-datatypes ((Unit!41330 0))(
  ( (Unit!41331) )
))
(declare-fun e!705162 () Unit!41330)

(declare-fun Unit!41332 () Unit!41330)

(assert (=> b!1244131 (= e!705162 Unit!41332)))

(declare-fun b!1244132 () Bool)

(declare-fun e!705163 () Bool)

(assert (=> b!1244132 (= e!705163 false)))

(declare-fun lt!562601 () Bool)

(assert (=> b!1244132 (= lt!562601 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27408))))

(declare-fun b!1244133 () Bool)

(declare-fun res!829875 () Bool)

(assert (=> b!1244133 (=> (not res!829875) (not e!705165))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244133 (= res!829875 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39144 a!3892)) (not (= newFrom!287 (size!39144 a!3892)))))))

(declare-fun b!1244134 () Bool)

(declare-fun lt!562600 () Unit!41330)

(assert (=> b!1244134 (= e!705162 lt!562600)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80030 List!27411 List!27411 (_ BitVec 32)) Unit!41330)

(assert (=> b!1244134 (= lt!562600 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27407 (select (arr!38608 a!3892) from!3270) Nil!27408) Nil!27408 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244134 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27408)))

(declare-fun b!1244135 () Bool)

(assert (=> b!1244135 (= e!705165 e!705163)))

(declare-fun res!829874 () Bool)

(assert (=> b!1244135 (=> (not res!829874) (not e!705163))))

(assert (=> b!1244135 (= res!829874 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562599 () Unit!41330)

(assert (=> b!1244135 (= lt!562599 e!705162)))

(declare-fun c!121813 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244135 (= c!121813 (validKeyInArray!0 (select (arr!38608 a!3892) from!3270)))))

(declare-fun res!829876 () Bool)

(assert (=> start!103938 (=> (not res!829876) (not e!705165))))

(assert (=> start!103938 (= res!829876 (and (bvslt (size!39144 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39144 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39144 a!3892))))))

(assert (=> start!103938 e!705165))

(declare-fun array_inv!29456 (array!80030) Bool)

(assert (=> start!103938 (array_inv!29456 a!3892)))

(assert (=> start!103938 true))

(assert (= (and start!103938 res!829876) b!1244130))

(assert (= (and b!1244130 res!829873) b!1244133))

(assert (= (and b!1244133 res!829875) b!1244135))

(assert (= (and b!1244135 c!121813) b!1244134))

(assert (= (and b!1244135 (not c!121813)) b!1244131))

(assert (= (and b!1244135 res!829874) b!1244132))

(declare-fun m!1146503 () Bool)

(assert (=> b!1244135 m!1146503))

(assert (=> b!1244135 m!1146503))

(declare-fun m!1146505 () Bool)

(assert (=> b!1244135 m!1146505))

(declare-fun m!1146507 () Bool)

(assert (=> b!1244130 m!1146507))

(declare-fun m!1146509 () Bool)

(assert (=> b!1244132 m!1146509))

(assert (=> b!1244134 m!1146503))

(declare-fun m!1146511 () Bool)

(assert (=> b!1244134 m!1146511))

(assert (=> b!1244134 m!1146509))

(declare-fun m!1146513 () Bool)

(assert (=> start!103938 m!1146513))

(push 1)

