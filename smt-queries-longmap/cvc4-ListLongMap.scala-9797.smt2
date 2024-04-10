; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116352 () Bool)

(assert start!116352)

(declare-fun b!1373324 () Bool)

(declare-fun e!777941 () Bool)

(declare-datatypes ((array!93130 0))(
  ( (array!93131 (arr!44974 (Array (_ BitVec 32) (_ BitVec 64))) (size!45524 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93130)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1373324 (= e!777941 (bvsge (bvsub (size!45524 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) (bvsub (size!45524 a!3861) from!3239)))))

(declare-fun b!1373325 () Bool)

(declare-fun res!916576 () Bool)

(declare-fun e!777943 () Bool)

(assert (=> b!1373325 (=> (not res!916576) (not e!777943))))

(declare-datatypes ((List!32042 0))(
  ( (Nil!32039) (Cons!32038 (h!33247 (_ BitVec 64)) (t!46736 List!32042)) )
))
(declare-fun newAcc!98 () List!32042)

(declare-fun contains!9724 (List!32042 (_ BitVec 64)) Bool)

(assert (=> b!1373325 (= res!916576 (not (contains!9724 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373326 () Bool)

(declare-fun res!916579 () Bool)

(assert (=> b!1373326 (=> (not res!916579) (not e!777941))))

(declare-fun acc!866 () List!32042)

(declare-fun arrayNoDuplicates!0 (array!93130 (_ BitVec 32) List!32042) Bool)

(assert (=> b!1373326 (= res!916579 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1373327 () Bool)

(declare-fun res!916572 () Bool)

(assert (=> b!1373327 (=> (not res!916572) (not e!777943))))

(assert (=> b!1373327 (= res!916572 (not (contains!9724 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373328 () Bool)

(declare-fun res!916569 () Bool)

(assert (=> b!1373328 (=> (not res!916569) (not e!777943))))

(declare-fun subseq!1126 (List!32042 List!32042) Bool)

(assert (=> b!1373328 (= res!916569 (subseq!1126 newAcc!98 acc!866))))

(declare-fun res!916577 () Bool)

(assert (=> start!116352 (=> (not res!916577) (not e!777943))))

(assert (=> start!116352 (= res!916577 (and (bvslt (size!45524 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45524 a!3861))))))

(assert (=> start!116352 e!777943))

(declare-fun array_inv!34002 (array!93130) Bool)

(assert (=> start!116352 (array_inv!34002 a!3861)))

(assert (=> start!116352 true))

(declare-fun b!1373329 () Bool)

(assert (=> b!1373329 (= e!777943 e!777941)))

(declare-fun res!916568 () Bool)

(assert (=> b!1373329 (=> (not res!916568) (not e!777941))))

(assert (=> b!1373329 (= res!916568 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45385 0))(
  ( (Unit!45386) )
))
(declare-fun lt!603034 () Unit!45385)

(declare-fun noDuplicateSubseq!313 (List!32042 List!32042) Unit!45385)

(assert (=> b!1373329 (= lt!603034 (noDuplicateSubseq!313 newAcc!98 acc!866))))

(declare-fun b!1373330 () Bool)

(declare-fun res!916578 () Bool)

(assert (=> b!1373330 (=> (not res!916578) (not e!777943))))

(assert (=> b!1373330 (= res!916578 (not (contains!9724 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373331 () Bool)

(declare-fun res!916574 () Bool)

(assert (=> b!1373331 (=> (not res!916574) (not e!777941))))

(assert (=> b!1373331 (= res!916574 (bvslt from!3239 (size!45524 a!3861)))))

(declare-fun b!1373332 () Bool)

(declare-fun res!916571 () Bool)

(assert (=> b!1373332 (=> (not res!916571) (not e!777941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373332 (= res!916571 (not (validKeyInArray!0 (select (arr!44974 a!3861) from!3239))))))

(declare-fun b!1373333 () Bool)

(declare-fun res!916575 () Bool)

(assert (=> b!1373333 (=> (not res!916575) (not e!777943))))

(declare-fun noDuplicate!2581 (List!32042) Bool)

(assert (=> b!1373333 (= res!916575 (noDuplicate!2581 acc!866))))

(declare-fun b!1373334 () Bool)

(declare-fun res!916573 () Bool)

(assert (=> b!1373334 (=> (not res!916573) (not e!777941))))

(assert (=> b!1373334 (= res!916573 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373335 () Bool)

(declare-fun res!916570 () Bool)

(assert (=> b!1373335 (=> (not res!916570) (not e!777943))))

(assert (=> b!1373335 (= res!916570 (not (contains!9724 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116352 res!916577) b!1373333))

(assert (= (and b!1373333 res!916575) b!1373330))

(assert (= (and b!1373330 res!916578) b!1373327))

(assert (= (and b!1373327 res!916572) b!1373335))

(assert (= (and b!1373335 res!916570) b!1373325))

(assert (= (and b!1373325 res!916576) b!1373328))

(assert (= (and b!1373328 res!916569) b!1373329))

(assert (= (and b!1373329 res!916568) b!1373331))

(assert (= (and b!1373331 res!916574) b!1373332))

(assert (= (and b!1373332 res!916571) b!1373334))

(assert (= (and b!1373334 res!916573) b!1373326))

(assert (= (and b!1373326 res!916579) b!1373324))

(declare-fun m!1256593 () Bool)

(assert (=> b!1373335 m!1256593))

(declare-fun m!1256595 () Bool)

(assert (=> b!1373329 m!1256595))

(declare-fun m!1256597 () Bool)

(assert (=> b!1373329 m!1256597))

(declare-fun m!1256599 () Bool)

(assert (=> b!1373333 m!1256599))

(declare-fun m!1256601 () Bool)

(assert (=> b!1373327 m!1256601))

(declare-fun m!1256603 () Bool)

(assert (=> b!1373328 m!1256603))

(declare-fun m!1256605 () Bool)

(assert (=> b!1373325 m!1256605))

(declare-fun m!1256607 () Bool)

(assert (=> start!116352 m!1256607))

(declare-fun m!1256609 () Bool)

(assert (=> b!1373326 m!1256609))

(declare-fun m!1256611 () Bool)

(assert (=> b!1373332 m!1256611))

(assert (=> b!1373332 m!1256611))

(declare-fun m!1256613 () Bool)

(assert (=> b!1373332 m!1256613))

(declare-fun m!1256615 () Bool)

(assert (=> b!1373330 m!1256615))

(push 1)

(assert (not b!1373325))

(assert (not b!1373327))

(assert (not b!1373329))

(assert (not start!116352))

(assert (not b!1373330))

(assert (not b!1373332))

(assert (not b!1373328))

(assert (not b!1373326))

(assert (not b!1373333))

(assert (not b!1373335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

