; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103940 () Bool)

(assert start!103940)

(declare-fun b!1244148 () Bool)

(declare-fun e!705177 () Bool)

(declare-fun e!705174 () Bool)

(assert (=> b!1244148 (= e!705177 e!705174)))

(declare-fun res!829886 () Bool)

(assert (=> b!1244148 (=> (not res!829886) (not e!705174))))

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244148 (= res!829886 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41333 0))(
  ( (Unit!41334) )
))
(declare-fun lt!562609 () Unit!41333)

(declare-fun e!705175 () Unit!41333)

(assert (=> b!1244148 (= lt!562609 e!705175)))

(declare-fun c!121816 () Bool)

(declare-datatypes ((array!80032 0))(
  ( (array!80033 (arr!38609 (Array (_ BitVec 32) (_ BitVec 64))) (size!39145 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80032)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244148 (= c!121816 (validKeyInArray!0 (select (arr!38609 a!3892) from!3270)))))

(declare-fun res!829887 () Bool)

(assert (=> start!103940 (=> (not res!829887) (not e!705177))))

(assert (=> start!103940 (= res!829887 (and (bvslt (size!39145 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39145 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39145 a!3892))))))

(assert (=> start!103940 e!705177))

(declare-fun array_inv!29457 (array!80032) Bool)

(assert (=> start!103940 (array_inv!29457 a!3892)))

(assert (=> start!103940 true))

(declare-fun b!1244149 () Bool)

(assert (=> b!1244149 (= e!705174 false)))

(declare-fun lt!562610 () Bool)

(declare-datatypes ((List!27412 0))(
  ( (Nil!27409) (Cons!27408 (h!28617 (_ BitVec 64)) (t!40881 List!27412)) )
))
(declare-fun arrayNoDuplicates!0 (array!80032 (_ BitVec 32) List!27412) Bool)

(assert (=> b!1244149 (= lt!562610 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27409))))

(declare-fun b!1244150 () Bool)

(declare-fun Unit!41335 () Unit!41333)

(assert (=> b!1244150 (= e!705175 Unit!41335)))

(declare-fun b!1244151 () Bool)

(declare-fun lt!562608 () Unit!41333)

(assert (=> b!1244151 (= e!705175 lt!562608)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80032 List!27412 List!27412 (_ BitVec 32)) Unit!41333)

(assert (=> b!1244151 (= lt!562608 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27408 (select (arr!38609 a!3892) from!3270) Nil!27409) Nil!27409 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244151 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27409)))

(declare-fun b!1244152 () Bool)

(declare-fun res!829885 () Bool)

(assert (=> b!1244152 (=> (not res!829885) (not e!705177))))

(assert (=> b!1244152 (= res!829885 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39145 a!3892)) (not (= newFrom!287 (size!39145 a!3892)))))))

(declare-fun b!1244153 () Bool)

(declare-fun res!829888 () Bool)

(assert (=> b!1244153 (=> (not res!829888) (not e!705177))))

(assert (=> b!1244153 (= res!829888 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27409))))

(assert (= (and start!103940 res!829887) b!1244153))

(assert (= (and b!1244153 res!829888) b!1244152))

(assert (= (and b!1244152 res!829885) b!1244148))

(assert (= (and b!1244148 c!121816) b!1244151))

(assert (= (and b!1244148 (not c!121816)) b!1244150))

(assert (= (and b!1244148 res!829886) b!1244149))

(declare-fun m!1146515 () Bool)

(assert (=> start!103940 m!1146515))

(declare-fun m!1146517 () Bool)

(assert (=> b!1244149 m!1146517))

(declare-fun m!1146519 () Bool)

(assert (=> b!1244151 m!1146519))

(declare-fun m!1146521 () Bool)

(assert (=> b!1244151 m!1146521))

(assert (=> b!1244151 m!1146517))

(assert (=> b!1244148 m!1146519))

(assert (=> b!1244148 m!1146519))

(declare-fun m!1146523 () Bool)

(assert (=> b!1244148 m!1146523))

(declare-fun m!1146525 () Bool)

(assert (=> b!1244153 m!1146525))

(push 1)

(assert (not b!1244151))

(assert (not b!1244149))

(assert (not b!1244148))

(assert (not b!1244153))

(assert (not start!103940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

