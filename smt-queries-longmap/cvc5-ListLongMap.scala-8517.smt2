; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103898 () Bool)

(assert start!103898)

(declare-fun b!1243555 () Bool)

(declare-fun res!829342 () Bool)

(declare-fun e!704965 () Bool)

(assert (=> b!1243555 (=> (not res!829342) (not e!704965))))

(declare-datatypes ((List!27391 0))(
  ( (Nil!27388) (Cons!27387 (h!28596 (_ BitVec 64)) (t!40860 List!27391)) )
))
(declare-fun lt!562421 () List!27391)

(declare-fun contains!7412 (List!27391 (_ BitVec 64)) Bool)

(assert (=> b!1243555 (= res!829342 (not (contains!7412 lt!562421 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243556 () Bool)

(declare-fun res!829336 () Bool)

(assert (=> b!1243556 (=> (not res!829336) (not e!704965))))

(declare-fun noDuplicate!1990 (List!27391) Bool)

(assert (=> b!1243556 (= res!829336 (noDuplicate!1990 lt!562421))))

(declare-fun b!1243557 () Bool)

(declare-fun e!704967 () Bool)

(assert (=> b!1243557 (= e!704967 e!704965)))

(declare-fun res!829333 () Bool)

(assert (=> b!1243557 (=> (not res!829333) (not e!704965))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243557 (= res!829333 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79990 0))(
  ( (array!79991 (arr!38588 (Array (_ BitVec 32) (_ BitVec 64))) (size!39124 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79990)

(assert (=> b!1243557 (= lt!562421 (Cons!27387 (select (arr!38588 a!3892) from!3270) Nil!27388))))

(declare-fun b!1243558 () Bool)

(declare-fun res!829341 () Bool)

(assert (=> b!1243558 (=> (not res!829341) (not e!704965))))

(assert (=> b!1243558 (= res!829341 (not (contains!7412 Nil!27388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243559 () Bool)

(declare-fun res!829339 () Bool)

(assert (=> b!1243559 (=> (not res!829339) (not e!704965))))

(declare-fun subseq!638 (List!27391 List!27391) Bool)

(assert (=> b!1243559 (= res!829339 (subseq!638 Nil!27388 lt!562421))))

(declare-fun res!829334 () Bool)

(assert (=> start!103898 (=> (not res!829334) (not e!704967))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103898 (= res!829334 (and (bvslt (size!39124 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39124 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39124 a!3892))))))

(assert (=> start!103898 e!704967))

(declare-fun array_inv!29436 (array!79990) Bool)

(assert (=> start!103898 (array_inv!29436 a!3892)))

(assert (=> start!103898 true))

(declare-fun b!1243560 () Bool)

(declare-fun res!829340 () Bool)

(assert (=> b!1243560 (=> (not res!829340) (not e!704967))))

(declare-fun arrayNoDuplicates!0 (array!79990 (_ BitVec 32) List!27391) Bool)

(assert (=> b!1243560 (= res!829340 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27388))))

(declare-fun b!1243561 () Bool)

(declare-fun res!829332 () Bool)

(assert (=> b!1243561 (=> (not res!829332) (not e!704967))))

(assert (=> b!1243561 (= res!829332 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39124 a!3892)) (not (= newFrom!287 (size!39124 a!3892)))))))

(declare-fun b!1243562 () Bool)

(assert (=> b!1243562 (= e!704965 false)))

(declare-fun lt!562419 () Bool)

(assert (=> b!1243562 (= lt!562419 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562421))))

(declare-datatypes ((Unit!41285 0))(
  ( (Unit!41286) )
))
(declare-fun lt!562420 () Unit!41285)

(declare-fun noDuplicateSubseq!92 (List!27391 List!27391) Unit!41285)

(assert (=> b!1243562 (= lt!562420 (noDuplicateSubseq!92 Nil!27388 lt!562421))))

(declare-fun b!1243563 () Bool)

(declare-fun res!829337 () Bool)

(assert (=> b!1243563 (=> (not res!829337) (not e!704967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243563 (= res!829337 (validKeyInArray!0 (select (arr!38588 a!3892) from!3270)))))

(declare-fun b!1243564 () Bool)

(declare-fun res!829338 () Bool)

(assert (=> b!1243564 (=> (not res!829338) (not e!704965))))

(assert (=> b!1243564 (= res!829338 (not (contains!7412 Nil!27388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243565 () Bool)

(declare-fun res!829335 () Bool)

(assert (=> b!1243565 (=> (not res!829335) (not e!704965))))

(assert (=> b!1243565 (= res!829335 (not (contains!7412 lt!562421 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103898 res!829334) b!1243560))

(assert (= (and b!1243560 res!829340) b!1243561))

(assert (= (and b!1243561 res!829332) b!1243563))

(assert (= (and b!1243563 res!829337) b!1243557))

(assert (= (and b!1243557 res!829333) b!1243556))

(assert (= (and b!1243556 res!829336) b!1243565))

(assert (= (and b!1243565 res!829335) b!1243555))

(assert (= (and b!1243555 res!829342) b!1243558))

(assert (= (and b!1243558 res!829341) b!1243564))

(assert (= (and b!1243564 res!829338) b!1243559))

(assert (= (and b!1243559 res!829339) b!1243562))

(declare-fun m!1146083 () Bool)

(assert (=> b!1243558 m!1146083))

(declare-fun m!1146085 () Bool)

(assert (=> b!1243557 m!1146085))

(declare-fun m!1146087 () Bool)

(assert (=> b!1243560 m!1146087))

(declare-fun m!1146089 () Bool)

(assert (=> b!1243565 m!1146089))

(assert (=> b!1243563 m!1146085))

(assert (=> b!1243563 m!1146085))

(declare-fun m!1146091 () Bool)

(assert (=> b!1243563 m!1146091))

(declare-fun m!1146093 () Bool)

(assert (=> b!1243562 m!1146093))

(declare-fun m!1146095 () Bool)

(assert (=> b!1243562 m!1146095))

(declare-fun m!1146097 () Bool)

(assert (=> start!103898 m!1146097))

(declare-fun m!1146099 () Bool)

(assert (=> b!1243556 m!1146099))

(declare-fun m!1146101 () Bool)

(assert (=> b!1243559 m!1146101))

(declare-fun m!1146103 () Bool)

(assert (=> b!1243555 m!1146103))

(declare-fun m!1146105 () Bool)

(assert (=> b!1243564 m!1146105))

(push 1)

