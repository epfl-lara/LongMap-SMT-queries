; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103894 () Bool)

(assert start!103894)

(declare-fun b!1243489 () Bool)

(declare-fun res!829271 () Bool)

(declare-fun e!704949 () Bool)

(assert (=> b!1243489 (=> (not res!829271) (not e!704949))))

(declare-datatypes ((List!27389 0))(
  ( (Nil!27386) (Cons!27385 (h!28594 (_ BitVec 64)) (t!40858 List!27389)) )
))
(declare-fun lt!562403 () List!27389)

(declare-fun noDuplicate!1988 (List!27389) Bool)

(assert (=> b!1243489 (= res!829271 (noDuplicate!1988 lt!562403))))

(declare-fun b!1243490 () Bool)

(declare-fun res!829273 () Bool)

(assert (=> b!1243490 (=> (not res!829273) (not e!704949))))

(declare-fun contains!7410 (List!27389 (_ BitVec 64)) Bool)

(assert (=> b!1243490 (= res!829273 (not (contains!7410 lt!562403 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243491 () Bool)

(declare-fun res!829268 () Bool)

(declare-fun e!704947 () Bool)

(assert (=> b!1243491 (=> (not res!829268) (not e!704947))))

(declare-datatypes ((array!79986 0))(
  ( (array!79987 (arr!38586 (Array (_ BitVec 32) (_ BitVec 64))) (size!39122 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79986)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243491 (= res!829268 (validKeyInArray!0 (select (arr!38586 a!3892) from!3270)))))

(declare-fun b!1243492 () Bool)

(declare-fun res!829274 () Bool)

(assert (=> b!1243492 (=> (not res!829274) (not e!704947))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243492 (= res!829274 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39122 a!3892)) (not (= newFrom!287 (size!39122 a!3892)))))))

(declare-fun b!1243493 () Bool)

(declare-fun res!829276 () Bool)

(assert (=> b!1243493 (=> (not res!829276) (not e!704947))))

(declare-fun arrayNoDuplicates!0 (array!79986 (_ BitVec 32) List!27389) Bool)

(assert (=> b!1243493 (= res!829276 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27386))))

(declare-fun b!1243494 () Bool)

(declare-fun res!829267 () Bool)

(assert (=> b!1243494 (=> (not res!829267) (not e!704949))))

(assert (=> b!1243494 (= res!829267 (not (contains!7410 Nil!27386 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243495 () Bool)

(assert (=> b!1243495 (= e!704947 e!704949)))

(declare-fun res!829269 () Bool)

(assert (=> b!1243495 (=> (not res!829269) (not e!704949))))

(assert (=> b!1243495 (= res!829269 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243495 (= lt!562403 (Cons!27385 (select (arr!38586 a!3892) from!3270) Nil!27386))))

(declare-fun b!1243496 () Bool)

(assert (=> b!1243496 (= e!704949 false)))

(declare-fun lt!562401 () Bool)

(assert (=> b!1243496 (= lt!562401 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562403))))

(declare-datatypes ((Unit!41281 0))(
  ( (Unit!41282) )
))
(declare-fun lt!562402 () Unit!41281)

(declare-fun noDuplicateSubseq!90 (List!27389 List!27389) Unit!41281)

(assert (=> b!1243496 (= lt!562402 (noDuplicateSubseq!90 Nil!27386 lt!562403))))

(declare-fun b!1243497 () Bool)

(declare-fun res!829266 () Bool)

(assert (=> b!1243497 (=> (not res!829266) (not e!704949))))

(assert (=> b!1243497 (= res!829266 (not (contains!7410 Nil!27386 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829270 () Bool)

(assert (=> start!103894 (=> (not res!829270) (not e!704947))))

(assert (=> start!103894 (= res!829270 (and (bvslt (size!39122 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39122 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39122 a!3892))))))

(assert (=> start!103894 e!704947))

(declare-fun array_inv!29434 (array!79986) Bool)

(assert (=> start!103894 (array_inv!29434 a!3892)))

(assert (=> start!103894 true))

(declare-fun b!1243498 () Bool)

(declare-fun res!829272 () Bool)

(assert (=> b!1243498 (=> (not res!829272) (not e!704949))))

(assert (=> b!1243498 (= res!829272 (not (contains!7410 lt!562403 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243499 () Bool)

(declare-fun res!829275 () Bool)

(assert (=> b!1243499 (=> (not res!829275) (not e!704949))))

(declare-fun subseq!636 (List!27389 List!27389) Bool)

(assert (=> b!1243499 (= res!829275 (subseq!636 Nil!27386 lt!562403))))

(assert (= (and start!103894 res!829270) b!1243493))

(assert (= (and b!1243493 res!829276) b!1243492))

(assert (= (and b!1243492 res!829274) b!1243491))

(assert (= (and b!1243491 res!829268) b!1243495))

(assert (= (and b!1243495 res!829269) b!1243489))

(assert (= (and b!1243489 res!829271) b!1243498))

(assert (= (and b!1243498 res!829272) b!1243490))

(assert (= (and b!1243490 res!829273) b!1243497))

(assert (= (and b!1243497 res!829266) b!1243494))

(assert (= (and b!1243494 res!829267) b!1243499))

(assert (= (and b!1243499 res!829275) b!1243496))

(declare-fun m!1146035 () Bool)

(assert (=> start!103894 m!1146035))

(declare-fun m!1146037 () Bool)

(assert (=> b!1243490 m!1146037))

(declare-fun m!1146039 () Bool)

(assert (=> b!1243496 m!1146039))

(declare-fun m!1146041 () Bool)

(assert (=> b!1243496 m!1146041))

(declare-fun m!1146043 () Bool)

(assert (=> b!1243495 m!1146043))

(declare-fun m!1146045 () Bool)

(assert (=> b!1243493 m!1146045))

(declare-fun m!1146047 () Bool)

(assert (=> b!1243489 m!1146047))

(declare-fun m!1146049 () Bool)

(assert (=> b!1243499 m!1146049))

(declare-fun m!1146051 () Bool)

(assert (=> b!1243497 m!1146051))

(assert (=> b!1243491 m!1146043))

(assert (=> b!1243491 m!1146043))

(declare-fun m!1146053 () Bool)

(assert (=> b!1243491 m!1146053))

(declare-fun m!1146055 () Bool)

(assert (=> b!1243498 m!1146055))

(declare-fun m!1146057 () Bool)

(assert (=> b!1243494 m!1146057))

(check-sat (not b!1243497) (not b!1243499) (not start!103894) (not b!1243494) (not b!1243498) (not b!1243491) (not b!1243489) (not b!1243493) (not b!1243496) (not b!1243490))
(check-sat)
