; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103898 () Bool)

(assert start!103898)

(declare-fun res!829393 () Bool)

(declare-fun e!704948 () Bool)

(assert (=> start!103898 (=> (not res!829393) (not e!704948))))

(declare-datatypes ((array!79916 0))(
  ( (array!79917 (arr!38552 (Array (_ BitVec 32) (_ BitVec 64))) (size!39090 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79916)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103898 (= res!829393 (and (bvslt (size!39090 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39090 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39090 a!3892))))))

(assert (=> start!103898 e!704948))

(declare-fun array_inv!29535 (array!79916) Bool)

(assert (=> start!103898 (array_inv!29535 a!3892)))

(assert (=> start!103898 true))

(declare-fun b!1243572 () Bool)

(declare-fun res!829396 () Bool)

(assert (=> b!1243572 (=> (not res!829396) (not e!704948))))

(assert (=> b!1243572 (= res!829396 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39090 a!3892)) (not (= newFrom!287 (size!39090 a!3892)))))))

(declare-fun b!1243573 () Bool)

(declare-fun res!829394 () Bool)

(declare-fun e!704947 () Bool)

(assert (=> b!1243573 (=> (not res!829394) (not e!704947))))

(declare-datatypes ((List!27456 0))(
  ( (Nil!27453) (Cons!27452 (h!28661 (_ BitVec 64)) (t!40916 List!27456)) )
))
(declare-fun contains!7386 (List!27456 (_ BitVec 64)) Bool)

(assert (=> b!1243573 (= res!829394 (not (contains!7386 Nil!27453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243574 () Bool)

(assert (=> b!1243574 (= e!704947 false)))

(declare-fun lt!562267 () List!27456)

(declare-fun lt!562269 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79916 (_ BitVec 32) List!27456) Bool)

(assert (=> b!1243574 (= lt!562269 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562267))))

(declare-datatypes ((Unit!41136 0))(
  ( (Unit!41137) )
))
(declare-fun lt!562268 () Unit!41136)

(declare-fun noDuplicateSubseq!95 (List!27456 List!27456) Unit!41136)

(assert (=> b!1243574 (= lt!562268 (noDuplicateSubseq!95 Nil!27453 lt!562267))))

(declare-fun b!1243575 () Bool)

(declare-fun res!829397 () Bool)

(assert (=> b!1243575 (=> (not res!829397) (not e!704947))))

(declare-fun subseq!641 (List!27456 List!27456) Bool)

(assert (=> b!1243575 (= res!829397 (subseq!641 Nil!27453 lt!562267))))

(declare-fun b!1243576 () Bool)

(declare-fun res!829392 () Bool)

(assert (=> b!1243576 (=> (not res!829392) (not e!704947))))

(assert (=> b!1243576 (= res!829392 (not (contains!7386 lt!562267 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243577 () Bool)

(assert (=> b!1243577 (= e!704948 e!704947)))

(declare-fun res!829401 () Bool)

(assert (=> b!1243577 (=> (not res!829401) (not e!704947))))

(assert (=> b!1243577 (= res!829401 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243577 (= lt!562267 (Cons!27452 (select (arr!38552 a!3892) from!3270) Nil!27453))))

(declare-fun b!1243578 () Bool)

(declare-fun res!829398 () Bool)

(assert (=> b!1243578 (=> (not res!829398) (not e!704947))))

(assert (=> b!1243578 (= res!829398 (not (contains!7386 lt!562267 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243579 () Bool)

(declare-fun res!829400 () Bool)

(assert (=> b!1243579 (=> (not res!829400) (not e!704948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243579 (= res!829400 (validKeyInArray!0 (select (arr!38552 a!3892) from!3270)))))

(declare-fun b!1243580 () Bool)

(declare-fun res!829391 () Bool)

(assert (=> b!1243580 (=> (not res!829391) (not e!704947))))

(declare-fun noDuplicate!2011 (List!27456) Bool)

(assert (=> b!1243580 (= res!829391 (noDuplicate!2011 lt!562267))))

(declare-fun b!1243581 () Bool)

(declare-fun res!829395 () Bool)

(assert (=> b!1243581 (=> (not res!829395) (not e!704948))))

(assert (=> b!1243581 (= res!829395 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27453))))

(declare-fun b!1243582 () Bool)

(declare-fun res!829399 () Bool)

(assert (=> b!1243582 (=> (not res!829399) (not e!704947))))

(assert (=> b!1243582 (= res!829399 (not (contains!7386 Nil!27453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103898 res!829393) b!1243581))

(assert (= (and b!1243581 res!829395) b!1243572))

(assert (= (and b!1243572 res!829396) b!1243579))

(assert (= (and b!1243579 res!829400) b!1243577))

(assert (= (and b!1243577 res!829401) b!1243580))

(assert (= (and b!1243580 res!829391) b!1243578))

(assert (= (and b!1243578 res!829398) b!1243576))

(assert (= (and b!1243576 res!829392) b!1243573))

(assert (= (and b!1243573 res!829394) b!1243582))

(assert (= (and b!1243582 res!829399) b!1243575))

(assert (= (and b!1243575 res!829397) b!1243574))

(declare-fun m!1145625 () Bool)

(assert (=> b!1243574 m!1145625))

(declare-fun m!1145627 () Bool)

(assert (=> b!1243574 m!1145627))

(declare-fun m!1145629 () Bool)

(assert (=> b!1243579 m!1145629))

(assert (=> b!1243579 m!1145629))

(declare-fun m!1145631 () Bool)

(assert (=> b!1243579 m!1145631))

(declare-fun m!1145633 () Bool)

(assert (=> b!1243582 m!1145633))

(declare-fun m!1145635 () Bool)

(assert (=> b!1243578 m!1145635))

(declare-fun m!1145637 () Bool)

(assert (=> start!103898 m!1145637))

(declare-fun m!1145639 () Bool)

(assert (=> b!1243575 m!1145639))

(declare-fun m!1145641 () Bool)

(assert (=> b!1243580 m!1145641))

(assert (=> b!1243577 m!1145629))

(declare-fun m!1145643 () Bool)

(assert (=> b!1243576 m!1145643))

(declare-fun m!1145645 () Bool)

(assert (=> b!1243573 m!1145645))

(declare-fun m!1145647 () Bool)

(assert (=> b!1243581 m!1145647))

(check-sat (not start!103898) (not b!1243582) (not b!1243579) (not b!1243574) (not b!1243581) (not b!1243580) (not b!1243573) (not b!1243576) (not b!1243575) (not b!1243578))
(check-sat)
