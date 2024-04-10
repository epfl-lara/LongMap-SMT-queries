; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104518 () Bool)

(assert start!104518)

(declare-fun res!832103 () Bool)

(declare-fun e!707225 () Bool)

(assert (=> start!104518 (=> (not res!832103) (not e!707225))))

(declare-datatypes ((array!80280 0))(
  ( (array!80281 (arr!38714 (Array (_ BitVec 32) (_ BitVec 64))) (size!39250 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80280)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104518 (= res!832103 (and (bvslt (size!39250 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39250 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39250 a!3892))))))

(assert (=> start!104518 e!707225))

(declare-fun array_inv!29562 (array!80280) Bool)

(assert (=> start!104518 (array_inv!29562 a!3892)))

(assert (=> start!104518 true))

(declare-fun b!1246912 () Bool)

(declare-fun res!832104 () Bool)

(assert (=> b!1246912 (=> (not res!832104) (not e!707225))))

(declare-datatypes ((List!27517 0))(
  ( (Nil!27514) (Cons!27513 (h!28722 (_ BitVec 64)) (t!40986 List!27517)) )
))
(declare-fun arrayNoDuplicates!0 (array!80280 (_ BitVec 32) List!27517) Bool)

(assert (=> b!1246912 (= res!832104 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27514))))

(declare-fun b!1246913 () Bool)

(declare-fun res!832105 () Bool)

(assert (=> b!1246913 (=> (not res!832105) (not e!707225))))

(assert (=> b!1246913 (= res!832105 (= from!3270 newFrom!287))))

(declare-fun b!1246914 () Bool)

(assert (=> b!1246914 (= e!707225 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27514)))))

(assert (= (and start!104518 res!832103) b!1246912))

(assert (= (and b!1246912 res!832104) b!1246913))

(assert (= (and b!1246913 res!832105) b!1246914))

(declare-fun m!1148621 () Bool)

(assert (=> start!104518 m!1148621))

(declare-fun m!1148623 () Bool)

(assert (=> b!1246912 m!1148623))

(declare-fun m!1148625 () Bool)

(assert (=> b!1246914 m!1148625))

(push 1)

(assert (not start!104518))

(assert (not b!1246912))

(assert (not b!1246914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

