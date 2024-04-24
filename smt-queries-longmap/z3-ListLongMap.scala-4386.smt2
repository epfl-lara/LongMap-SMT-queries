; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60402 () Bool)

(assert start!60402)

(declare-fun b!678230 () Bool)

(declare-fun e!386556 () Bool)

(declare-datatypes ((List!12831 0))(
  ( (Nil!12828) (Cons!12827 (h!13875 (_ BitVec 64)) (t!19051 List!12831)) )
))
(declare-fun acc!681 () List!12831)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3483 (List!12831 (_ BitVec 64)) Bool)

(assert (=> b!678230 (= e!386556 (contains!3483 acc!681 k0!2843))))

(declare-fun res!444549 () Bool)

(declare-fun e!386554 () Bool)

(assert (=> start!60402 (=> (not res!444549) (not e!386554))))

(declare-datatypes ((array!39387 0))(
  ( (array!39388 (arr!18883 (Array (_ BitVec 32) (_ BitVec 64))) (size!19247 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39387)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60402 (= res!444549 (and (bvslt (size!19247 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19247 a!3626))))))

(assert (=> start!60402 e!386554))

(assert (=> start!60402 true))

(declare-fun array_inv!14742 (array!39387) Bool)

(assert (=> start!60402 (array_inv!14742 a!3626)))

(declare-fun b!678231 () Bool)

(declare-fun e!386552 () Bool)

(declare-fun e!386555 () Bool)

(assert (=> b!678231 (= e!386552 e!386555)))

(declare-fun res!444547 () Bool)

(assert (=> b!678231 (=> (not res!444547) (not e!386555))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678231 (= res!444547 (bvsle from!3004 i!1382))))

(declare-fun b!678232 () Bool)

(declare-fun res!444553 () Bool)

(assert (=> b!678232 (=> (not res!444553) (not e!386554))))

(assert (=> b!678232 (= res!444553 (not (contains!3483 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678233 () Bool)

(declare-fun res!444546 () Bool)

(assert (=> b!678233 (=> (not res!444546) (not e!386554))))

(declare-fun arrayNoDuplicates!0 (array!39387 (_ BitVec 32) List!12831) Bool)

(assert (=> b!678233 (= res!444546 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12828))))

(declare-fun b!678234 () Bool)

(declare-fun res!444550 () Bool)

(assert (=> b!678234 (=> (not res!444550) (not e!386554))))

(assert (=> b!678234 (= res!444550 e!386552)))

(declare-fun res!444548 () Bool)

(assert (=> b!678234 (=> res!444548 e!386552)))

(assert (=> b!678234 (= res!444548 e!386556)))

(declare-fun res!444552 () Bool)

(assert (=> b!678234 (=> (not res!444552) (not e!386556))))

(assert (=> b!678234 (= res!444552 (bvsgt from!3004 i!1382))))

(declare-fun b!678235 () Bool)

(assert (=> b!678235 (= e!386554 false)))

(declare-fun lt!312955 () Bool)

(assert (=> b!678235 (= lt!312955 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678236 () Bool)

(assert (=> b!678236 (= e!386555 (not (contains!3483 acc!681 k0!2843)))))

(declare-fun b!678237 () Bool)

(declare-fun res!444545 () Bool)

(assert (=> b!678237 (=> (not res!444545) (not e!386554))))

(declare-fun noDuplicate!757 (List!12831) Bool)

(assert (=> b!678237 (= res!444545 (noDuplicate!757 acc!681))))

(declare-fun b!678238 () Bool)

(declare-fun res!444551 () Bool)

(assert (=> b!678238 (=> (not res!444551) (not e!386554))))

(assert (=> b!678238 (= res!444551 (not (contains!3483 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60402 res!444549) b!678237))

(assert (= (and b!678237 res!444545) b!678238))

(assert (= (and b!678238 res!444551) b!678232))

(assert (= (and b!678232 res!444553) b!678234))

(assert (= (and b!678234 res!444552) b!678230))

(assert (= (and b!678234 (not res!444548)) b!678231))

(assert (= (and b!678231 res!444547) b!678236))

(assert (= (and b!678234 res!444550) b!678233))

(assert (= (and b!678233 res!444546) b!678235))

(declare-fun m!644701 () Bool)

(assert (=> b!678237 m!644701))

(declare-fun m!644703 () Bool)

(assert (=> b!678233 m!644703))

(declare-fun m!644705 () Bool)

(assert (=> b!678238 m!644705))

(declare-fun m!644707 () Bool)

(assert (=> b!678232 m!644707))

(declare-fun m!644709 () Bool)

(assert (=> b!678236 m!644709))

(declare-fun m!644711 () Bool)

(assert (=> b!678235 m!644711))

(assert (=> b!678230 m!644709))

(declare-fun m!644713 () Bool)

(assert (=> start!60402 m!644713))

(check-sat (not start!60402) (not b!678230) (not b!678238) (not b!678237) (not b!678236) (not b!678233) (not b!678232) (not b!678235))
(check-sat)
