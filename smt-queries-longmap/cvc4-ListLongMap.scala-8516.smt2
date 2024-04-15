; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103888 () Bool)

(assert start!103888)

(declare-fun b!1243407 () Bool)

(declare-fun res!829230 () Bool)

(declare-fun e!704903 () Bool)

(assert (=> b!1243407 (=> (not res!829230) (not e!704903))))

(declare-datatypes ((List!27451 0))(
  ( (Nil!27448) (Cons!27447 (h!28656 (_ BitVec 64)) (t!40911 List!27451)) )
))
(declare-fun contains!7381 (List!27451 (_ BitVec 64)) Bool)

(assert (=> b!1243407 (= res!829230 (not (contains!7381 Nil!27448 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243408 () Bool)

(declare-fun res!829231 () Bool)

(assert (=> b!1243408 (=> (not res!829231) (not e!704903))))

(declare-fun lt!562223 () List!27451)

(declare-fun noDuplicate!2006 (List!27451) Bool)

(assert (=> b!1243408 (= res!829231 (noDuplicate!2006 lt!562223))))

(declare-fun b!1243409 () Bool)

(declare-fun res!829235 () Bool)

(declare-fun e!704902 () Bool)

(assert (=> b!1243409 (=> (not res!829235) (not e!704902))))

(declare-datatypes ((array!79906 0))(
  ( (array!79907 (arr!38547 (Array (_ BitVec 32) (_ BitVec 64))) (size!39085 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79906)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79906 (_ BitVec 32) List!27451) Bool)

(assert (=> b!1243409 (= res!829235 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27448))))

(declare-fun b!1243410 () Bool)

(declare-fun res!829227 () Bool)

(assert (=> b!1243410 (=> (not res!829227) (not e!704903))))

(declare-fun subseq!636 (List!27451 List!27451) Bool)

(assert (=> b!1243410 (= res!829227 (subseq!636 Nil!27448 lt!562223))))

(declare-fun b!1243411 () Bool)

(declare-fun res!829233 () Bool)

(assert (=> b!1243411 (=> (not res!829233) (not e!704903))))

(assert (=> b!1243411 (= res!829233 (not (contains!7381 lt!562223 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243412 () Bool)

(declare-fun res!829236 () Bool)

(assert (=> b!1243412 (=> (not res!829236) (not e!704902))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243412 (= res!829236 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39085 a!3892)) (not (= newFrom!287 (size!39085 a!3892)))))))

(declare-fun b!1243413 () Bool)

(declare-fun res!829229 () Bool)

(assert (=> b!1243413 (=> (not res!829229) (not e!704903))))

(assert (=> b!1243413 (= res!829229 (not (contains!7381 Nil!27448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829226 () Bool)

(assert (=> start!103888 (=> (not res!829226) (not e!704902))))

(assert (=> start!103888 (= res!829226 (and (bvslt (size!39085 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39085 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39085 a!3892))))))

(assert (=> start!103888 e!704902))

(declare-fun array_inv!29530 (array!79906) Bool)

(assert (=> start!103888 (array_inv!29530 a!3892)))

(assert (=> start!103888 true))

(declare-fun b!1243414 () Bool)

(assert (=> b!1243414 (= e!704902 e!704903)))

(declare-fun res!829232 () Bool)

(assert (=> b!1243414 (=> (not res!829232) (not e!704903))))

(assert (=> b!1243414 (= res!829232 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243414 (= lt!562223 (Cons!27447 (select (arr!38547 a!3892) from!3270) Nil!27448))))

(declare-fun b!1243415 () Bool)

(declare-fun res!829228 () Bool)

(assert (=> b!1243415 (=> (not res!829228) (not e!704902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243415 (= res!829228 (validKeyInArray!0 (select (arr!38547 a!3892) from!3270)))))

(declare-fun b!1243416 () Bool)

(declare-fun res!829234 () Bool)

(assert (=> b!1243416 (=> (not res!829234) (not e!704903))))

(assert (=> b!1243416 (= res!829234 (not (contains!7381 lt!562223 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243417 () Bool)

(assert (=> b!1243417 (= e!704903 false)))

(declare-fun lt!562222 () Bool)

(assert (=> b!1243417 (= lt!562222 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562223))))

(declare-datatypes ((Unit!41126 0))(
  ( (Unit!41127) )
))
(declare-fun lt!562224 () Unit!41126)

(declare-fun noDuplicateSubseq!90 (List!27451 List!27451) Unit!41126)

(assert (=> b!1243417 (= lt!562224 (noDuplicateSubseq!90 Nil!27448 lt!562223))))

(assert (= (and start!103888 res!829226) b!1243409))

(assert (= (and b!1243409 res!829235) b!1243412))

(assert (= (and b!1243412 res!829236) b!1243415))

(assert (= (and b!1243415 res!829228) b!1243414))

(assert (= (and b!1243414 res!829232) b!1243408))

(assert (= (and b!1243408 res!829231) b!1243416))

(assert (= (and b!1243416 res!829234) b!1243411))

(assert (= (and b!1243411 res!829233) b!1243413))

(assert (= (and b!1243413 res!829229) b!1243407))

(assert (= (and b!1243407 res!829230) b!1243410))

(assert (= (and b!1243410 res!829227) b!1243417))

(declare-fun m!1145505 () Bool)

(assert (=> b!1243407 m!1145505))

(declare-fun m!1145507 () Bool)

(assert (=> b!1243415 m!1145507))

(assert (=> b!1243415 m!1145507))

(declare-fun m!1145509 () Bool)

(assert (=> b!1243415 m!1145509))

(declare-fun m!1145511 () Bool)

(assert (=> start!103888 m!1145511))

(assert (=> b!1243414 m!1145507))

(declare-fun m!1145513 () Bool)

(assert (=> b!1243410 m!1145513))

(declare-fun m!1145515 () Bool)

(assert (=> b!1243413 m!1145515))

(declare-fun m!1145517 () Bool)

(assert (=> b!1243417 m!1145517))

(declare-fun m!1145519 () Bool)

(assert (=> b!1243417 m!1145519))

(declare-fun m!1145521 () Bool)

(assert (=> b!1243409 m!1145521))

(declare-fun m!1145523 () Bool)

(assert (=> b!1243411 m!1145523))

(declare-fun m!1145525 () Bool)

(assert (=> b!1243408 m!1145525))

(declare-fun m!1145527 () Bool)

(assert (=> b!1243416 m!1145527))

(push 1)

(assert (not start!103888))

(assert (not b!1243417))

(assert (not b!1243413))

(assert (not b!1243410))

(assert (not b!1243409))

(assert (not b!1243415))

(assert (not b!1243411))

(assert (not b!1243407))

(assert (not b!1243416))

(assert (not b!1243408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

