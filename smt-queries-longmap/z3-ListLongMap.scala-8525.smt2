; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103940 () Bool)

(assert start!103940)

(declare-fun b!1244120 () Bool)

(declare-fun e!705168 () Bool)

(assert (=> b!1244120 (= e!705168 false)))

(declare-fun lt!562457 () Bool)

(declare-datatypes ((array!79958 0))(
  ( (array!79959 (arr!38573 (Array (_ BitVec 32) (_ BitVec 64))) (size!39111 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79958)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27477 0))(
  ( (Nil!27474) (Cons!27473 (h!28682 (_ BitVec 64)) (t!40937 List!27477)) )
))
(declare-fun arrayNoDuplicates!0 (array!79958 (_ BitVec 32) List!27477) Bool)

(assert (=> b!1244120 (= lt!562457 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27474))))

(declare-fun res!829881 () Bool)

(declare-fun e!705165 () Bool)

(assert (=> start!103940 (=> (not res!829881) (not e!705165))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103940 (= res!829881 (and (bvslt (size!39111 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39111 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39111 a!3892))))))

(assert (=> start!103940 e!705165))

(declare-fun array_inv!29556 (array!79958) Bool)

(assert (=> start!103940 (array_inv!29556 a!3892)))

(assert (=> start!103940 true))

(declare-fun b!1244121 () Bool)

(assert (=> b!1244121 (= e!705165 e!705168)))

(declare-fun res!829884 () Bool)

(assert (=> b!1244121 (=> (not res!829884) (not e!705168))))

(assert (=> b!1244121 (= res!829884 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-datatypes ((Unit!41187 0))(
  ( (Unit!41188) )
))
(declare-fun lt!562458 () Unit!41187)

(declare-fun e!705166 () Unit!41187)

(assert (=> b!1244121 (= lt!562458 e!705166)))

(declare-fun c!121807 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244121 (= c!121807 (validKeyInArray!0 (select (arr!38573 a!3892) from!3270)))))

(declare-fun b!1244122 () Bool)

(declare-fun res!829883 () Bool)

(assert (=> b!1244122 (=> (not res!829883) (not e!705165))))

(assert (=> b!1244122 (= res!829883 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27474))))

(declare-fun b!1244123 () Bool)

(declare-fun lt!562456 () Unit!41187)

(assert (=> b!1244123 (= e!705166 lt!562456)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79958 List!27477 List!27477 (_ BitVec 32)) Unit!41187)

(assert (=> b!1244123 (= lt!562456 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27473 (select (arr!38573 a!3892) from!3270) Nil!27474) Nil!27474 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244123 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27474)))

(declare-fun b!1244124 () Bool)

(declare-fun res!829882 () Bool)

(assert (=> b!1244124 (=> (not res!829882) (not e!705165))))

(assert (=> b!1244124 (= res!829882 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39111 a!3892)) (not (= newFrom!287 (size!39111 a!3892)))))))

(declare-fun b!1244125 () Bool)

(declare-fun Unit!41189 () Unit!41187)

(assert (=> b!1244125 (= e!705166 Unit!41189)))

(assert (= (and start!103940 res!829881) b!1244122))

(assert (= (and b!1244122 res!829883) b!1244124))

(assert (= (and b!1244124 res!829882) b!1244121))

(assert (= (and b!1244121 c!121807) b!1244123))

(assert (= (and b!1244121 (not c!121807)) b!1244125))

(assert (= (and b!1244121 res!829884) b!1244120))

(declare-fun m!1146021 () Bool)

(assert (=> b!1244122 m!1146021))

(declare-fun m!1146023 () Bool)

(assert (=> start!103940 m!1146023))

(declare-fun m!1146025 () Bool)

(assert (=> b!1244123 m!1146025))

(declare-fun m!1146027 () Bool)

(assert (=> b!1244123 m!1146027))

(declare-fun m!1146029 () Bool)

(assert (=> b!1244123 m!1146029))

(assert (=> b!1244121 m!1146025))

(assert (=> b!1244121 m!1146025))

(declare-fun m!1146031 () Bool)

(assert (=> b!1244121 m!1146031))

(assert (=> b!1244120 m!1146029))

(check-sat (not b!1244123) (not b!1244120) (not start!103940) (not b!1244121) (not b!1244122))
(check-sat)
