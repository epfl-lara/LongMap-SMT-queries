; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104672 () Bool)

(assert start!104672)

(declare-fun b!1247769 () Bool)

(declare-fun res!832324 () Bool)

(declare-fun e!707779 () Bool)

(assert (=> b!1247769 (=> (not res!832324) (not e!707779))))

(declare-datatypes ((array!80266 0))(
  ( (array!80267 (arr!38705 (Array (_ BitVec 32) (_ BitVec 64))) (size!39242 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80266)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27521 0))(
  ( (Nil!27518) (Cons!27517 (h!28735 (_ BitVec 64)) (t!40982 List!27521)) )
))
(declare-fun arrayNoDuplicates!0 (array!80266 (_ BitVec 32) List!27521) Bool)

(assert (=> b!1247769 (= res!832324 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27518))))

(declare-fun b!1247770 () Bool)

(assert (=> b!1247770 (= e!707779 (bvslt (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41384 0))(
  ( (Unit!41385) )
))
(declare-fun lt!563575 () Unit!41384)

(declare-fun e!707780 () Unit!41384)

(assert (=> b!1247770 (= lt!563575 e!707780)))

(declare-fun c!122415 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247770 (= c!122415 (validKeyInArray!0 (select (arr!38705 a!3892) from!3270)))))

(declare-fun b!1247771 () Bool)

(declare-fun res!832323 () Bool)

(assert (=> b!1247771 (=> (not res!832323) (not e!707779))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1247771 (= res!832323 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39242 a!3892)) (not (= newFrom!287 (size!39242 a!3892)))))))

(declare-fun b!1247772 () Bool)

(declare-fun lt!563574 () Unit!41384)

(assert (=> b!1247772 (= e!707780 lt!563574)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80266 List!27521 List!27521 (_ BitVec 32)) Unit!41384)

(assert (=> b!1247772 (= lt!563574 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27517 (select (arr!38705 a!3892) from!3270) Nil!27518) Nil!27518 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1247772 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27518)))

(declare-fun b!1247773 () Bool)

(declare-fun Unit!41386 () Unit!41384)

(assert (=> b!1247773 (= e!707780 Unit!41386)))

(declare-fun res!832325 () Bool)

(assert (=> start!104672 (=> (not res!832325) (not e!707779))))

(assert (=> start!104672 (= res!832325 (and (bvslt (size!39242 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39242 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39242 a!3892))))))

(assert (=> start!104672 e!707779))

(declare-fun array_inv!29643 (array!80266) Bool)

(assert (=> start!104672 (array_inv!29643 a!3892)))

(assert (=> start!104672 true))

(assert (= (and start!104672 res!832325) b!1247769))

(assert (= (and b!1247769 res!832324) b!1247771))

(assert (= (and b!1247771 res!832323) b!1247770))

(assert (= (and b!1247770 c!122415) b!1247772))

(assert (= (and b!1247770 (not c!122415)) b!1247773))

(declare-fun m!1149913 () Bool)

(assert (=> b!1247769 m!1149913))

(declare-fun m!1149915 () Bool)

(assert (=> b!1247770 m!1149915))

(assert (=> b!1247770 m!1149915))

(declare-fun m!1149917 () Bool)

(assert (=> b!1247770 m!1149917))

(assert (=> b!1247772 m!1149915))

(declare-fun m!1149919 () Bool)

(assert (=> b!1247772 m!1149919))

(declare-fun m!1149921 () Bool)

(assert (=> b!1247772 m!1149921))

(declare-fun m!1149923 () Bool)

(assert (=> start!104672 m!1149923))

(check-sat (not b!1247772) (not b!1247769) (not start!104672) (not b!1247770))
(check-sat)
