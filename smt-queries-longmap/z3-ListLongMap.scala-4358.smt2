; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60178 () Bool)

(assert start!60178)

(declare-fun b!672574 () Bool)

(declare-fun e!384198 () Bool)

(declare-datatypes ((List!12846 0))(
  ( (Nil!12843) (Cons!12842 (h!13887 (_ BitVec 64)) (t!19074 List!12846)) )
))
(declare-fun lt!312332 () List!12846)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3423 (List!12846 (_ BitVec 64)) Bool)

(assert (=> b!672574 (= e!384198 (contains!3423 lt!312332 k0!2843))))

(declare-fun b!672575 () Bool)

(declare-fun res!439201 () Bool)

(declare-fun e!384206 () Bool)

(assert (=> b!672575 (=> (not res!439201) (not e!384206))))

(declare-datatypes ((array!39225 0))(
  ( (array!39226 (arr!18805 (Array (_ BitVec 32) (_ BitVec 64))) (size!19169 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39225)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!12846)

(declare-fun arrayNoDuplicates!0 (array!39225 (_ BitVec 32) List!12846) Bool)

(assert (=> b!672575 (= res!439201 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672576 () Bool)

(declare-fun res!439195 () Bool)

(assert (=> b!672576 (=> (not res!439195) (not e!384206))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672576 (= res!439195 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19169 a!3626))))))

(declare-fun b!672577 () Bool)

(declare-fun e!384197 () Bool)

(assert (=> b!672577 (= e!384197 (contains!3423 acc!681 k0!2843))))

(declare-fun b!672578 () Bool)

(declare-fun res!439203 () Bool)

(assert (=> b!672578 (=> (not res!439203) (not e!384206))))

(assert (=> b!672578 (= res!439203 (not (contains!3423 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672579 () Bool)

(declare-fun e!384207 () Bool)

(assert (=> b!672579 (= e!384206 e!384207)))

(declare-fun res!439197 () Bool)

(assert (=> b!672579 (=> (not res!439197) (not e!384207))))

(assert (=> b!672579 (= res!439197 (not (= (select (arr!18805 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23632 0))(
  ( (Unit!23633) )
))
(declare-fun lt!312333 () Unit!23632)

(declare-fun e!384203 () Unit!23632)

(assert (=> b!672579 (= lt!312333 e!384203)))

(declare-fun c!77060 () Bool)

(assert (=> b!672579 (= c!77060 (= (select (arr!18805 a!3626) from!3004) k0!2843))))

(declare-fun b!672580 () Bool)

(declare-fun e!384200 () Bool)

(assert (=> b!672580 (= e!384200 false)))

(declare-fun lt!312334 () Bool)

(assert (=> b!672580 (= lt!312334 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312332))))

(declare-fun b!672581 () Bool)

(declare-fun Unit!23634 () Unit!23632)

(assert (=> b!672581 (= e!384203 Unit!23634)))

(declare-fun arrayContainsKey!0 (array!39225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672581 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312331 () Unit!23632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39225 (_ BitVec 64) (_ BitVec 32)) Unit!23632)

(assert (=> b!672581 (= lt!312331 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672581 false))

(declare-fun b!672582 () Bool)

(declare-fun res!439210 () Bool)

(assert (=> b!672582 (=> (not res!439210) (not e!384200))))

(assert (=> b!672582 (= res!439210 (not (contains!3423 lt!312332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672583 () Bool)

(declare-fun e!384205 () Bool)

(declare-fun e!384199 () Bool)

(assert (=> b!672583 (= e!384205 e!384199)))

(declare-fun res!439191 () Bool)

(assert (=> b!672583 (=> (not res!439191) (not e!384199))))

(assert (=> b!672583 (= res!439191 (bvsle from!3004 i!1382))))

(declare-fun b!672584 () Bool)

(declare-fun res!439202 () Bool)

(assert (=> b!672584 (=> (not res!439202) (not e!384206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672584 (= res!439202 (validKeyInArray!0 (select (arr!18805 a!3626) from!3004)))))

(declare-fun b!672585 () Bool)

(declare-fun Unit!23635 () Unit!23632)

(assert (=> b!672585 (= e!384203 Unit!23635)))

(declare-fun b!672586 () Bool)

(declare-fun res!439208 () Bool)

(assert (=> b!672586 (=> (not res!439208) (not e!384206))))

(assert (=> b!672586 (= res!439208 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19169 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672587 () Bool)

(declare-fun res!439196 () Bool)

(assert (=> b!672587 (=> (not res!439196) (not e!384206))))

(assert (=> b!672587 (= res!439196 (validKeyInArray!0 k0!2843))))

(declare-fun b!672588 () Bool)

(declare-fun res!439194 () Bool)

(assert (=> b!672588 (=> (not res!439194) (not e!384200))))

(assert (=> b!672588 (= res!439194 (not (contains!3423 lt!312332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672589 () Bool)

(declare-fun res!439211 () Bool)

(assert (=> b!672589 (=> (not res!439211) (not e!384206))))

(assert (=> b!672589 (= res!439211 e!384205)))

(declare-fun res!439188 () Bool)

(assert (=> b!672589 (=> res!439188 e!384205)))

(assert (=> b!672589 (= res!439188 e!384197)))

(declare-fun res!439193 () Bool)

(assert (=> b!672589 (=> (not res!439193) (not e!384197))))

(assert (=> b!672589 (= res!439193 (bvsgt from!3004 i!1382))))

(declare-fun b!672590 () Bool)

(declare-fun res!439205 () Bool)

(assert (=> b!672590 (=> (not res!439205) (not e!384200))))

(declare-fun e!384201 () Bool)

(assert (=> b!672590 (= res!439205 e!384201)))

(declare-fun res!439204 () Bool)

(assert (=> b!672590 (=> res!439204 e!384201)))

(assert (=> b!672590 (= res!439204 e!384198)))

(declare-fun res!439206 () Bool)

(assert (=> b!672590 (=> (not res!439206) (not e!384198))))

(assert (=> b!672590 (= res!439206 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672591 () Bool)

(assert (=> b!672591 (= e!384199 (not (contains!3423 acc!681 k0!2843)))))

(declare-fun b!672592 () Bool)

(declare-fun res!439199 () Bool)

(assert (=> b!672592 (=> (not res!439199) (not e!384206))))

(assert (=> b!672592 (= res!439199 (not (contains!3423 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672593 () Bool)

(declare-fun res!439198 () Bool)

(assert (=> b!672593 (=> (not res!439198) (not e!384206))))

(assert (=> b!672593 (= res!439198 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672594 () Bool)

(declare-fun res!439190 () Bool)

(assert (=> b!672594 (=> (not res!439190) (not e!384206))))

(assert (=> b!672594 (= res!439190 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12843))))

(declare-fun b!672595 () Bool)

(declare-fun res!439200 () Bool)

(assert (=> b!672595 (=> (not res!439200) (not e!384206))))

(declare-fun noDuplicate!670 (List!12846) Bool)

(assert (=> b!672595 (= res!439200 (noDuplicate!670 acc!681))))

(declare-fun b!672597 () Bool)

(assert (=> b!672597 (= e!384207 e!384200)))

(declare-fun res!439189 () Bool)

(assert (=> b!672597 (=> (not res!439189) (not e!384200))))

(assert (=> b!672597 (= res!439189 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!273 (List!12846 (_ BitVec 64)) List!12846)

(assert (=> b!672597 (= lt!312332 ($colon$colon!273 acc!681 (select (arr!18805 a!3626) from!3004)))))

(declare-fun b!672596 () Bool)

(declare-fun res!439192 () Bool)

(assert (=> b!672596 (=> (not res!439192) (not e!384200))))

(assert (=> b!672596 (= res!439192 (noDuplicate!670 lt!312332))))

(declare-fun res!439209 () Bool)

(assert (=> start!60178 (=> (not res!439209) (not e!384206))))

(assert (=> start!60178 (= res!439209 (and (bvslt (size!19169 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19169 a!3626))))))

(assert (=> start!60178 e!384206))

(assert (=> start!60178 true))

(declare-fun array_inv!14601 (array!39225) Bool)

(assert (=> start!60178 (array_inv!14601 a!3626)))

(declare-fun b!672598 () Bool)

(declare-fun e!384202 () Bool)

(assert (=> b!672598 (= e!384202 (not (contains!3423 lt!312332 k0!2843)))))

(declare-fun b!672599 () Bool)

(assert (=> b!672599 (= e!384201 e!384202)))

(declare-fun res!439207 () Bool)

(assert (=> b!672599 (=> (not res!439207) (not e!384202))))

(assert (=> b!672599 (= res!439207 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60178 res!439209) b!672595))

(assert (= (and b!672595 res!439200) b!672578))

(assert (= (and b!672578 res!439203) b!672592))

(assert (= (and b!672592 res!439199) b!672589))

(assert (= (and b!672589 res!439193) b!672577))

(assert (= (and b!672589 (not res!439188)) b!672583))

(assert (= (and b!672583 res!439191) b!672591))

(assert (= (and b!672589 res!439211) b!672594))

(assert (= (and b!672594 res!439190) b!672575))

(assert (= (and b!672575 res!439201) b!672576))

(assert (= (and b!672576 res!439195) b!672587))

(assert (= (and b!672587 res!439196) b!672593))

(assert (= (and b!672593 res!439198) b!672586))

(assert (= (and b!672586 res!439208) b!672584))

(assert (= (and b!672584 res!439202) b!672579))

(assert (= (and b!672579 c!77060) b!672581))

(assert (= (and b!672579 (not c!77060)) b!672585))

(assert (= (and b!672579 res!439197) b!672597))

(assert (= (and b!672597 res!439189) b!672596))

(assert (= (and b!672596 res!439192) b!672582))

(assert (= (and b!672582 res!439210) b!672588))

(assert (= (and b!672588 res!439194) b!672590))

(assert (= (and b!672590 res!439206) b!672574))

(assert (= (and b!672590 (not res!439204)) b!672599))

(assert (= (and b!672599 res!439207) b!672598))

(assert (= (and b!672590 res!439205) b!672580))

(declare-fun m!641467 () Bool)

(assert (=> b!672574 m!641467))

(declare-fun m!641469 () Bool)

(assert (=> b!672577 m!641469))

(assert (=> b!672591 m!641469))

(declare-fun m!641471 () Bool)

(assert (=> b!672588 m!641471))

(declare-fun m!641473 () Bool)

(assert (=> b!672582 m!641473))

(declare-fun m!641475 () Bool)

(assert (=> b!672584 m!641475))

(assert (=> b!672584 m!641475))

(declare-fun m!641477 () Bool)

(assert (=> b!672584 m!641477))

(declare-fun m!641479 () Bool)

(assert (=> b!672575 m!641479))

(declare-fun m!641481 () Bool)

(assert (=> b!672594 m!641481))

(declare-fun m!641483 () Bool)

(assert (=> b!672595 m!641483))

(declare-fun m!641485 () Bool)

(assert (=> b!672578 m!641485))

(assert (=> b!672597 m!641475))

(assert (=> b!672597 m!641475))

(declare-fun m!641487 () Bool)

(assert (=> b!672597 m!641487))

(declare-fun m!641489 () Bool)

(assert (=> b!672581 m!641489))

(declare-fun m!641491 () Bool)

(assert (=> b!672581 m!641491))

(assert (=> b!672579 m!641475))

(assert (=> b!672598 m!641467))

(declare-fun m!641493 () Bool)

(assert (=> b!672592 m!641493))

(declare-fun m!641495 () Bool)

(assert (=> b!672593 m!641495))

(declare-fun m!641497 () Bool)

(assert (=> b!672587 m!641497))

(declare-fun m!641499 () Bool)

(assert (=> b!672596 m!641499))

(declare-fun m!641501 () Bool)

(assert (=> start!60178 m!641501))

(declare-fun m!641503 () Bool)

(assert (=> b!672580 m!641503))

(check-sat (not b!672593) (not b!672596) (not b!672575) (not b!672597) (not b!672595) (not b!672598) (not b!672578) (not b!672581) (not b!672584) (not b!672574) (not b!672577) (not b!672588) (not b!672580) (not b!672591) (not b!672587) (not b!672594) (not b!672592) (not start!60178) (not b!672582))
(check-sat)
