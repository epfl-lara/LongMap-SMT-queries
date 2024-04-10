; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60262 () Bool)

(assert start!60262)

(declare-fun b!675694 () Bool)

(declare-fun res!442125 () Bool)

(declare-fun e!385491 () Bool)

(assert (=> b!675694 (=> (not res!442125) (not e!385491))))

(declare-datatypes ((List!12888 0))(
  ( (Nil!12885) (Cons!12884 (h!13929 (_ BitVec 64)) (t!19116 List!12888)) )
))
(declare-fun acc!681 () List!12888)

(declare-fun contains!3465 (List!12888 (_ BitVec 64)) Bool)

(assert (=> b!675694 (= res!442125 (not (contains!3465 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!675695 () Bool)

(declare-fun res!442120 () Bool)

(assert (=> b!675695 (=> (not res!442120) (not e!385491))))

(declare-datatypes ((array!39309 0))(
  ( (array!39310 (arr!18847 (Array (_ BitVec 32) (_ BitVec 64))) (size!19211 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39309)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39309 (_ BitVec 32) List!12888) Bool)

(assert (=> b!675695 (= res!442120 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!675696 () Bool)

(declare-fun res!442133 () Bool)

(assert (=> b!675696 (=> (not res!442133) (not e!385491))))

(assert (=> b!675696 (= res!442133 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!675697 () Bool)

(declare-fun e!385494 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!675697 (= e!385494 (contains!3465 acc!681 k0!2843))))

(declare-fun b!675699 () Bool)

(declare-fun res!442134 () Bool)

(assert (=> b!675699 (=> (not res!442134) (not e!385491))))

(declare-fun noDuplicate!712 (List!12888) Bool)

(assert (=> b!675699 (= res!442134 (noDuplicate!712 acc!681))))

(declare-fun b!675700 () Bool)

(declare-fun res!442130 () Bool)

(assert (=> b!675700 (=> (not res!442130) (not e!385491))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675700 (= res!442130 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19211 a!3626))))))

(declare-fun b!675701 () Bool)

(declare-fun e!385489 () Bool)

(assert (=> b!675701 (= e!385489 (not (contains!3465 acc!681 k0!2843)))))

(declare-fun b!675702 () Bool)

(declare-fun res!442131 () Bool)

(assert (=> b!675702 (=> (not res!442131) (not e!385491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!675702 (= res!442131 (not (validKeyInArray!0 (select (arr!18847 a!3626) from!3004))))))

(declare-fun b!675703 () Bool)

(declare-fun res!442135 () Bool)

(assert (=> b!675703 (=> (not res!442135) (not e!385491))))

(declare-fun e!385492 () Bool)

(assert (=> b!675703 (= res!442135 e!385492)))

(declare-fun res!442127 () Bool)

(assert (=> b!675703 (=> res!442127 e!385492)))

(declare-fun e!385490 () Bool)

(assert (=> b!675703 (= res!442127 e!385490)))

(declare-fun res!442123 () Bool)

(assert (=> b!675703 (=> (not res!442123) (not e!385490))))

(assert (=> b!675703 (= res!442123 (bvsgt from!3004 i!1382))))

(declare-fun b!675704 () Bool)

(declare-fun res!442129 () Bool)

(assert (=> b!675704 (=> (not res!442129) (not e!385491))))

(assert (=> b!675704 (= res!442129 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12885))))

(declare-fun b!675705 () Bool)

(assert (=> b!675705 (= e!385490 (contains!3465 acc!681 k0!2843))))

(declare-fun b!675706 () Bool)

(assert (=> b!675706 (= e!385491 false)))

(declare-fun lt!312739 () Bool)

(assert (=> b!675706 (= lt!312739 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!675707 () Bool)

(declare-fun res!442128 () Bool)

(assert (=> b!675707 (=> (not res!442128) (not e!385491))))

(assert (=> b!675707 (= res!442128 (validKeyInArray!0 k0!2843))))

(declare-fun b!675708 () Bool)

(declare-fun res!442137 () Bool)

(assert (=> b!675708 (=> (not res!442137) (not e!385491))))

(assert (=> b!675708 (= res!442137 (not (contains!3465 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!442126 () Bool)

(assert (=> start!60262 (=> (not res!442126) (not e!385491))))

(assert (=> start!60262 (= res!442126 (and (bvslt (size!19211 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19211 a!3626))))))

(assert (=> start!60262 e!385491))

(assert (=> start!60262 true))

(declare-fun array_inv!14643 (array!39309) Bool)

(assert (=> start!60262 (array_inv!14643 a!3626)))

(declare-fun b!675698 () Bool)

(declare-fun e!385493 () Bool)

(assert (=> b!675698 (= e!385493 (not (contains!3465 acc!681 k0!2843)))))

(declare-fun b!675709 () Bool)

(assert (=> b!675709 (= e!385492 e!385493)))

(declare-fun res!442122 () Bool)

(assert (=> b!675709 (=> (not res!442122) (not e!385493))))

(assert (=> b!675709 (= res!442122 (bvsle from!3004 i!1382))))

(declare-fun b!675710 () Bool)

(declare-fun res!442124 () Bool)

(assert (=> b!675710 (=> (not res!442124) (not e!385491))))

(assert (=> b!675710 (= res!442124 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19211 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!675711 () Bool)

(declare-fun res!442138 () Bool)

(assert (=> b!675711 (=> (not res!442138) (not e!385491))))

(declare-fun e!385487 () Bool)

(assert (=> b!675711 (= res!442138 e!385487)))

(declare-fun res!442139 () Bool)

(assert (=> b!675711 (=> res!442139 e!385487)))

(assert (=> b!675711 (= res!442139 e!385494)))

(declare-fun res!442136 () Bool)

(assert (=> b!675711 (=> (not res!442136) (not e!385494))))

(assert (=> b!675711 (= res!442136 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675712 () Bool)

(assert (=> b!675712 (= e!385487 e!385489)))

(declare-fun res!442121 () Bool)

(assert (=> b!675712 (=> (not res!442121) (not e!385489))))

(assert (=> b!675712 (= res!442121 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!675713 () Bool)

(declare-fun res!442132 () Bool)

(assert (=> b!675713 (=> (not res!442132) (not e!385491))))

(declare-fun arrayContainsKey!0 (array!39309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!675713 (= res!442132 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60262 res!442126) b!675699))

(assert (= (and b!675699 res!442134) b!675694))

(assert (= (and b!675694 res!442125) b!675708))

(assert (= (and b!675708 res!442137) b!675703))

(assert (= (and b!675703 res!442123) b!675705))

(assert (= (and b!675703 (not res!442127)) b!675709))

(assert (= (and b!675709 res!442122) b!675698))

(assert (= (and b!675703 res!442135) b!675704))

(assert (= (and b!675704 res!442129) b!675695))

(assert (= (and b!675695 res!442120) b!675700))

(assert (= (and b!675700 res!442130) b!675707))

(assert (= (and b!675707 res!442128) b!675713))

(assert (= (and b!675713 res!442132) b!675710))

(assert (= (and b!675710 res!442124) b!675702))

(assert (= (and b!675702 res!442131) b!675696))

(assert (= (and b!675696 res!442133) b!675711))

(assert (= (and b!675711 res!442136) b!675697))

(assert (= (and b!675711 (not res!442139)) b!675712))

(assert (= (and b!675712 res!442121) b!675701))

(assert (= (and b!675711 res!442138) b!675706))

(declare-fun m!642995 () Bool)

(assert (=> b!675695 m!642995))

(declare-fun m!642997 () Bool)

(assert (=> b!675704 m!642997))

(declare-fun m!642999 () Bool)

(assert (=> b!675707 m!642999))

(declare-fun m!643001 () Bool)

(assert (=> b!675705 m!643001))

(assert (=> b!675701 m!643001))

(declare-fun m!643003 () Bool)

(assert (=> b!675702 m!643003))

(assert (=> b!675702 m!643003))

(declare-fun m!643005 () Bool)

(assert (=> b!675702 m!643005))

(declare-fun m!643007 () Bool)

(assert (=> b!675699 m!643007))

(declare-fun m!643009 () Bool)

(assert (=> b!675713 m!643009))

(assert (=> b!675698 m!643001))

(declare-fun m!643011 () Bool)

(assert (=> b!675708 m!643011))

(declare-fun m!643013 () Bool)

(assert (=> start!60262 m!643013))

(declare-fun m!643015 () Bool)

(assert (=> b!675694 m!643015))

(declare-fun m!643017 () Bool)

(assert (=> b!675706 m!643017))

(assert (=> b!675697 m!643001))

(check-sat (not b!675701) (not b!675699) (not b!675705) (not start!60262) (not b!675698) (not b!675707) (not b!675695) (not b!675713) (not b!675702) (not b!675697) (not b!675706) (not b!675694) (not b!675708) (not b!675704))
