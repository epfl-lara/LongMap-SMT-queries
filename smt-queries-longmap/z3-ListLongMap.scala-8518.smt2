; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103906 () Bool)

(assert start!103906)

(declare-fun b!1243687 () Bool)

(declare-fun res!829469 () Bool)

(declare-fun e!705001 () Bool)

(assert (=> b!1243687 (=> (not res!829469) (not e!705001))))

(declare-datatypes ((List!27395 0))(
  ( (Nil!27392) (Cons!27391 (h!28600 (_ BitVec 64)) (t!40864 List!27395)) )
))
(declare-fun lt!562457 () List!27395)

(declare-fun contains!7416 (List!27395 (_ BitVec 64)) Bool)

(assert (=> b!1243687 (= res!829469 (not (contains!7416 lt!562457 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243688 () Bool)

(declare-fun res!829464 () Bool)

(declare-fun e!705003 () Bool)

(assert (=> b!1243688 (=> (not res!829464) (not e!705003))))

(declare-datatypes ((array!79998 0))(
  ( (array!79999 (arr!38592 (Array (_ BitVec 32) (_ BitVec 64))) (size!39128 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79998)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243688 (= res!829464 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39128 a!3892)) (not (= newFrom!287 (size!39128 a!3892)))))))

(declare-fun b!1243689 () Bool)

(assert (=> b!1243689 (= e!705001 false)))

(declare-fun lt!562456 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79998 (_ BitVec 32) List!27395) Bool)

(assert (=> b!1243689 (= lt!562456 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562457))))

(declare-datatypes ((Unit!41293 0))(
  ( (Unit!41294) )
))
(declare-fun lt!562455 () Unit!41293)

(declare-fun noDuplicateSubseq!96 (List!27395 List!27395) Unit!41293)

(assert (=> b!1243689 (= lt!562455 (noDuplicateSubseq!96 Nil!27392 lt!562457))))

(declare-fun b!1243690 () Bool)

(declare-fun res!829468 () Bool)

(assert (=> b!1243690 (=> (not res!829468) (not e!705001))))

(assert (=> b!1243690 (= res!829468 (not (contains!7416 Nil!27392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243691 () Bool)

(declare-fun res!829472 () Bool)

(assert (=> b!1243691 (=> (not res!829472) (not e!705001))))

(declare-fun subseq!642 (List!27395 List!27395) Bool)

(assert (=> b!1243691 (= res!829472 (subseq!642 Nil!27392 lt!562457))))

(declare-fun b!1243692 () Bool)

(assert (=> b!1243692 (= e!705003 e!705001)))

(declare-fun res!829470 () Bool)

(assert (=> b!1243692 (=> (not res!829470) (not e!705001))))

(assert (=> b!1243692 (= res!829470 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243692 (= lt!562457 (Cons!27391 (select (arr!38592 a!3892) from!3270) Nil!27392))))

(declare-fun b!1243693 () Bool)

(declare-fun res!829473 () Bool)

(assert (=> b!1243693 (=> (not res!829473) (not e!705003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243693 (= res!829473 (validKeyInArray!0 (select (arr!38592 a!3892) from!3270)))))

(declare-fun b!1243694 () Bool)

(declare-fun res!829466 () Bool)

(assert (=> b!1243694 (=> (not res!829466) (not e!705001))))

(declare-fun noDuplicate!1994 (List!27395) Bool)

(assert (=> b!1243694 (= res!829466 (noDuplicate!1994 lt!562457))))

(declare-fun b!1243695 () Bool)

(declare-fun res!829467 () Bool)

(assert (=> b!1243695 (=> (not res!829467) (not e!705003))))

(assert (=> b!1243695 (= res!829467 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27392))))

(declare-fun res!829471 () Bool)

(assert (=> start!103906 (=> (not res!829471) (not e!705003))))

(assert (=> start!103906 (= res!829471 (and (bvslt (size!39128 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39128 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39128 a!3892))))))

(assert (=> start!103906 e!705003))

(declare-fun array_inv!29440 (array!79998) Bool)

(assert (=> start!103906 (array_inv!29440 a!3892)))

(assert (=> start!103906 true))

(declare-fun b!1243696 () Bool)

(declare-fun res!829474 () Bool)

(assert (=> b!1243696 (=> (not res!829474) (not e!705001))))

(assert (=> b!1243696 (= res!829474 (not (contains!7416 Nil!27392 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243697 () Bool)

(declare-fun res!829465 () Bool)

(assert (=> b!1243697 (=> (not res!829465) (not e!705001))))

(assert (=> b!1243697 (= res!829465 (not (contains!7416 lt!562457 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103906 res!829471) b!1243695))

(assert (= (and b!1243695 res!829467) b!1243688))

(assert (= (and b!1243688 res!829464) b!1243693))

(assert (= (and b!1243693 res!829473) b!1243692))

(assert (= (and b!1243692 res!829470) b!1243694))

(assert (= (and b!1243694 res!829466) b!1243697))

(assert (= (and b!1243697 res!829465) b!1243687))

(assert (= (and b!1243687 res!829469) b!1243690))

(assert (= (and b!1243690 res!829468) b!1243696))

(assert (= (and b!1243696 res!829474) b!1243691))

(assert (= (and b!1243691 res!829472) b!1243689))

(declare-fun m!1146179 () Bool)

(assert (=> b!1243694 m!1146179))

(declare-fun m!1146181 () Bool)

(assert (=> b!1243691 m!1146181))

(declare-fun m!1146183 () Bool)

(assert (=> b!1243687 m!1146183))

(declare-fun m!1146185 () Bool)

(assert (=> b!1243692 m!1146185))

(declare-fun m!1146187 () Bool)

(assert (=> start!103906 m!1146187))

(declare-fun m!1146189 () Bool)

(assert (=> b!1243689 m!1146189))

(declare-fun m!1146191 () Bool)

(assert (=> b!1243689 m!1146191))

(declare-fun m!1146193 () Bool)

(assert (=> b!1243697 m!1146193))

(assert (=> b!1243693 m!1146185))

(assert (=> b!1243693 m!1146185))

(declare-fun m!1146195 () Bool)

(assert (=> b!1243693 m!1146195))

(declare-fun m!1146197 () Bool)

(assert (=> b!1243696 m!1146197))

(declare-fun m!1146199 () Bool)

(assert (=> b!1243695 m!1146199))

(declare-fun m!1146201 () Bool)

(assert (=> b!1243690 m!1146201))

(check-sat (not b!1243695) (not start!103906) (not b!1243689) (not b!1243691) (not b!1243690) (not b!1243694) (not b!1243696) (not b!1243693) (not b!1243697) (not b!1243687))
(check-sat)
