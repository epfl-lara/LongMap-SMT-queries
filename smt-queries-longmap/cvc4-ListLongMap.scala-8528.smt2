; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103968 () Bool)

(assert start!103968)

(declare-fun b!1244417 () Bool)

(declare-fun e!705343 () Bool)

(declare-fun e!705344 () Bool)

(assert (=> b!1244417 (= e!705343 e!705344)))

(declare-fun res!830071 () Bool)

(assert (=> b!1244417 (=> (not res!830071) (not e!705344))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244417 (= res!830071 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41375 0))(
  ( (Unit!41376) )
))
(declare-fun lt!562736 () Unit!41375)

(declare-fun e!705345 () Unit!41375)

(assert (=> b!1244417 (= lt!562736 e!705345)))

(declare-fun c!121858 () Bool)

(declare-datatypes ((array!80060 0))(
  ( (array!80061 (arr!38623 (Array (_ BitVec 32) (_ BitVec 64))) (size!39159 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80060)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244417 (= c!121858 (validKeyInArray!0 (select (arr!38623 a!3892) from!3270)))))

(declare-fun b!1244418 () Bool)

(declare-fun Unit!41377 () Unit!41375)

(assert (=> b!1244418 (= e!705345 Unit!41377)))

(declare-fun b!1244419 () Bool)

(declare-fun res!830073 () Bool)

(assert (=> b!1244419 (=> (not res!830073) (not e!705343))))

(declare-datatypes ((List!27426 0))(
  ( (Nil!27423) (Cons!27422 (h!28631 (_ BitVec 64)) (t!40895 List!27426)) )
))
(declare-fun arrayNoDuplicates!0 (array!80060 (_ BitVec 32) List!27426) Bool)

(assert (=> b!1244419 (= res!830073 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27423))))

(declare-fun b!1244421 () Bool)

(declare-fun res!830074 () Bool)

(assert (=> b!1244421 (=> (not res!830074) (not e!705343))))

(assert (=> b!1244421 (= res!830074 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39159 a!3892)) (not (= newFrom!287 (size!39159 a!3892)))))))

(declare-fun b!1244422 () Bool)

(assert (=> b!1244422 (= e!705344 (not true))))

(assert (=> b!1244422 (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27423)))

(declare-fun lt!562734 () Unit!41375)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!80060 (_ BitVec 32) (_ BitVec 32)) Unit!41375)

(assert (=> b!1244422 (= lt!562734 (lemmaNoDuplicateFromThenFromBigger!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) newFrom!287))))

(declare-fun b!1244423 () Bool)

(declare-fun lt!562735 () Unit!41375)

(assert (=> b!1244423 (= e!705345 lt!562735)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80060 List!27426 List!27426 (_ BitVec 32)) Unit!41375)

(assert (=> b!1244423 (= lt!562735 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27422 (select (arr!38623 a!3892) from!3270) Nil!27423) Nil!27423 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244423 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27423)))

(declare-fun b!1244420 () Bool)

(declare-fun res!830072 () Bool)

(assert (=> b!1244420 (=> (not res!830072) (not e!705344))))

(assert (=> b!1244420 (= res!830072 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27423))))

(declare-fun res!830070 () Bool)

(assert (=> start!103968 (=> (not res!830070) (not e!705343))))

(assert (=> start!103968 (= res!830070 (and (bvslt (size!39159 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39159 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39159 a!3892))))))

(assert (=> start!103968 e!705343))

(declare-fun array_inv!29471 (array!80060) Bool)

(assert (=> start!103968 (array_inv!29471 a!3892)))

(assert (=> start!103968 true))

(assert (= (and start!103968 res!830070) b!1244419))

(assert (= (and b!1244419 res!830073) b!1244421))

(assert (= (and b!1244421 res!830074) b!1244417))

(assert (= (and b!1244417 c!121858) b!1244423))

(assert (= (and b!1244417 (not c!121858)) b!1244418))

(assert (= (and b!1244417 res!830071) b!1244420))

(assert (= (and b!1244420 res!830072) b!1244422))

(declare-fun m!1146703 () Bool)

(assert (=> b!1244420 m!1146703))

(declare-fun m!1146705 () Bool)

(assert (=> b!1244417 m!1146705))

(assert (=> b!1244417 m!1146705))

(declare-fun m!1146707 () Bool)

(assert (=> b!1244417 m!1146707))

(declare-fun m!1146709 () Bool)

(assert (=> b!1244419 m!1146709))

(assert (=> b!1244423 m!1146705))

(declare-fun m!1146711 () Bool)

(assert (=> b!1244423 m!1146711))

(assert (=> b!1244423 m!1146703))

(declare-fun m!1146713 () Bool)

(assert (=> b!1244422 m!1146713))

(declare-fun m!1146715 () Bool)

(assert (=> b!1244422 m!1146715))

(declare-fun m!1146717 () Bool)

(assert (=> start!103968 m!1146717))

(push 1)

