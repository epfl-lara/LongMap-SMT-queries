; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103942 () Bool)

(assert start!103942)

(declare-fun b!1244166 () Bool)

(declare-datatypes ((Unit!41336 0))(
  ( (Unit!41337) )
))
(declare-fun e!705187 () Unit!41336)

(declare-fun Unit!41338 () Unit!41336)

(assert (=> b!1244166 (= e!705187 Unit!41338)))

(declare-fun b!1244167 () Bool)

(declare-fun res!829897 () Bool)

(declare-fun e!705188 () Bool)

(assert (=> b!1244167 (=> (not res!829897) (not e!705188))))

(declare-datatypes ((array!80034 0))(
  ( (array!80035 (arr!38610 (Array (_ BitVec 32) (_ BitVec 64))) (size!39146 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80034)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27413 0))(
  ( (Nil!27410) (Cons!27409 (h!28618 (_ BitVec 64)) (t!40882 List!27413)) )
))
(declare-fun arrayNoDuplicates!0 (array!80034 (_ BitVec 32) List!27413) Bool)

(assert (=> b!1244167 (= res!829897 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27410))))

(declare-fun b!1244168 () Bool)

(declare-fun e!705186 () Bool)

(assert (=> b!1244168 (= e!705188 e!705186)))

(declare-fun res!829899 () Bool)

(assert (=> b!1244168 (=> (not res!829899) (not e!705186))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244168 (= res!829899 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562618 () Unit!41336)

(assert (=> b!1244168 (= lt!562618 e!705187)))

(declare-fun c!121819 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244168 (= c!121819 (validKeyInArray!0 (select (arr!38610 a!3892) from!3270)))))

(declare-fun res!829900 () Bool)

(assert (=> start!103942 (=> (not res!829900) (not e!705188))))

(assert (=> start!103942 (= res!829900 (and (bvslt (size!39146 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39146 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39146 a!3892))))))

(assert (=> start!103942 e!705188))

(declare-fun array_inv!29458 (array!80034) Bool)

(assert (=> start!103942 (array_inv!29458 a!3892)))

(assert (=> start!103942 true))

(declare-fun b!1244169 () Bool)

(declare-fun res!829898 () Bool)

(assert (=> b!1244169 (=> (not res!829898) (not e!705188))))

(assert (=> b!1244169 (= res!829898 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39146 a!3892)) (not (= newFrom!287 (size!39146 a!3892)))))))

(declare-fun b!1244170 () Bool)

(assert (=> b!1244170 (= e!705186 false)))

(declare-fun lt!562619 () Bool)

(assert (=> b!1244170 (= lt!562619 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27410))))

(declare-fun b!1244171 () Bool)

(declare-fun lt!562617 () Unit!41336)

(assert (=> b!1244171 (= e!705187 lt!562617)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80034 List!27413 List!27413 (_ BitVec 32)) Unit!41336)

(assert (=> b!1244171 (= lt!562617 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27409 (select (arr!38610 a!3892) from!3270) Nil!27410) Nil!27410 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244171 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27410)))

(assert (= (and start!103942 res!829900) b!1244167))

(assert (= (and b!1244167 res!829897) b!1244169))

(assert (= (and b!1244169 res!829898) b!1244168))

(assert (= (and b!1244168 c!121819) b!1244171))

(assert (= (and b!1244168 (not c!121819)) b!1244166))

(assert (= (and b!1244168 res!829899) b!1244170))

(declare-fun m!1146527 () Bool)

(assert (=> b!1244167 m!1146527))

(declare-fun m!1146529 () Bool)

(assert (=> b!1244168 m!1146529))

(assert (=> b!1244168 m!1146529))

(declare-fun m!1146531 () Bool)

(assert (=> b!1244168 m!1146531))

(declare-fun m!1146533 () Bool)

(assert (=> b!1244170 m!1146533))

(declare-fun m!1146535 () Bool)

(assert (=> start!103942 m!1146535))

(assert (=> b!1244171 m!1146529))

(declare-fun m!1146537 () Bool)

(assert (=> b!1244171 m!1146537))

(assert (=> b!1244171 m!1146533))

(check-sat (not b!1244167) (not b!1244170) (not b!1244168) (not start!103942) (not b!1244171))
