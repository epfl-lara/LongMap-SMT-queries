; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101972 () Bool)

(assert start!101972)

(declare-fun b!1227637 () Bool)

(declare-fun res!816260 () Bool)

(declare-fun e!697031 () Bool)

(assert (=> b!1227637 (=> (not res!816260) (not e!697031))))

(declare-datatypes ((List!27018 0))(
  ( (Nil!27015) (Cons!27014 (h!28223 (_ BitVec 64)) (t!40481 List!27018)) )
))
(declare-fun acc!823 () List!27018)

(declare-fun contains!7080 (List!27018 (_ BitVec 64)) Bool)

(assert (=> b!1227637 (= res!816260 (not (contains!7080 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!816254 () Bool)

(assert (=> start!101972 (=> (not res!816254) (not e!697031))))

(declare-datatypes ((array!79245 0))(
  ( (array!79246 (arr!38245 (Array (_ BitVec 32) (_ BitVec 64))) (size!38781 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79245)

(assert (=> start!101972 (= res!816254 (bvslt (size!38781 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101972 e!697031))

(declare-fun array_inv!29093 (array!79245) Bool)

(assert (=> start!101972 (array_inv!29093 a!3806)))

(assert (=> start!101972 true))

(declare-fun b!1227638 () Bool)

(declare-fun res!816257 () Bool)

(assert (=> b!1227638 (=> (not res!816257) (not e!697031))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227638 (= res!816257 (validKeyInArray!0 (select (arr!38245 a!3806) from!3184)))))

(declare-fun b!1227639 () Bool)

(declare-fun res!816261 () Bool)

(assert (=> b!1227639 (=> (not res!816261) (not e!697031))))

(declare-fun noDuplicate!1677 (List!27018) Bool)

(assert (=> b!1227639 (= res!816261 (noDuplicate!1677 acc!823))))

(declare-fun b!1227640 () Bool)

(declare-fun e!697030 () Bool)

(assert (=> b!1227640 (= e!697031 (not e!697030))))

(declare-fun res!816252 () Bool)

(assert (=> b!1227640 (=> res!816252 e!697030)))

(assert (=> b!1227640 (= res!816252 (bvsgt from!3184 (size!38781 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79245 (_ BitVec 32) List!27018) Bool)

(assert (=> b!1227640 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27014 (select (arr!38245 a!3806) from!3184) acc!823))))

(declare-fun b!1227641 () Bool)

(declare-fun res!816249 () Bool)

(assert (=> b!1227641 (=> res!816249 e!697030)))

(assert (=> b!1227641 (= res!816249 (contains!7080 Nil!27015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227642 () Bool)

(declare-fun res!816251 () Bool)

(assert (=> b!1227642 (=> (not res!816251) (not e!697031))))

(assert (=> b!1227642 (= res!816251 (not (contains!7080 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227643 () Bool)

(declare-fun res!816250 () Bool)

(assert (=> b!1227643 (=> res!816250 e!697030)))

(declare-fun subseq!484 (List!27018 List!27018) Bool)

(assert (=> b!1227643 (= res!816250 (not (subseq!484 Nil!27015 acc!823)))))

(declare-fun b!1227644 () Bool)

(declare-fun res!816253 () Bool)

(assert (=> b!1227644 (=> (not res!816253) (not e!697031))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227644 (= res!816253 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227645 () Bool)

(declare-fun res!816256 () Bool)

(assert (=> b!1227645 (=> (not res!816256) (not e!697031))))

(assert (=> b!1227645 (= res!816256 (validKeyInArray!0 k!2913))))

(declare-fun b!1227646 () Bool)

(assert (=> b!1227646 (= e!697030 true)))

(declare-datatypes ((Unit!40656 0))(
  ( (Unit!40657) )
))
(declare-fun lt!558930 () Unit!40656)

(declare-fun noDuplicateSubseq!37 (List!27018 List!27018) Unit!40656)

(assert (=> b!1227646 (= lt!558930 (noDuplicateSubseq!37 Nil!27015 acc!823))))

(declare-fun b!1227647 () Bool)

(declare-fun res!816255 () Bool)

(assert (=> b!1227647 (=> res!816255 e!697030)))

(assert (=> b!1227647 (= res!816255 (contains!7080 Nil!27015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227648 () Bool)

(declare-fun res!816258 () Bool)

(assert (=> b!1227648 (=> (not res!816258) (not e!697031))))

(assert (=> b!1227648 (= res!816258 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38781 a!3806)) (bvslt from!3184 (size!38781 a!3806))))))

(declare-fun b!1227649 () Bool)

(declare-fun res!816259 () Bool)

(assert (=> b!1227649 (=> (not res!816259) (not e!697031))))

(assert (=> b!1227649 (= res!816259 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!101972 res!816254) b!1227645))

(assert (= (and b!1227645 res!816256) b!1227648))

(assert (= (and b!1227648 res!816258) b!1227639))

(assert (= (and b!1227639 res!816261) b!1227642))

(assert (= (and b!1227642 res!816251) b!1227637))

(assert (= (and b!1227637 res!816260) b!1227644))

(assert (= (and b!1227644 res!816253) b!1227649))

(assert (= (and b!1227649 res!816259) b!1227638))

(assert (= (and b!1227638 res!816257) b!1227640))

(assert (= (and b!1227640 (not res!816252)) b!1227641))

(assert (= (and b!1227641 (not res!816249)) b!1227647))

(assert (= (and b!1227647 (not res!816255)) b!1227643))

(assert (= (and b!1227643 (not res!816250)) b!1227646))

(declare-fun m!1132367 () Bool)

(assert (=> b!1227641 m!1132367))

(declare-fun m!1132369 () Bool)

(assert (=> b!1227639 m!1132369))

(declare-fun m!1132371 () Bool)

(assert (=> b!1227644 m!1132371))

(declare-fun m!1132373 () Bool)

(assert (=> b!1227643 m!1132373))

(declare-fun m!1132375 () Bool)

(assert (=> b!1227649 m!1132375))

(declare-fun m!1132377 () Bool)

(assert (=> b!1227647 m!1132377))

(declare-fun m!1132379 () Bool)

(assert (=> start!101972 m!1132379))

(declare-fun m!1132381 () Bool)

(assert (=> b!1227646 m!1132381))

(declare-fun m!1132383 () Bool)

(assert (=> b!1227637 m!1132383))

(declare-fun m!1132385 () Bool)

(assert (=> b!1227638 m!1132385))

(assert (=> b!1227638 m!1132385))

(declare-fun m!1132387 () Bool)

(assert (=> b!1227638 m!1132387))

(declare-fun m!1132389 () Bool)

(assert (=> b!1227645 m!1132389))

(assert (=> b!1227640 m!1132385))

(declare-fun m!1132391 () Bool)

(assert (=> b!1227640 m!1132391))

(declare-fun m!1132393 () Bool)

(assert (=> b!1227642 m!1132393))

(push 1)

(assert (not b!1227646))

(assert (not b!1227647))

(assert (not b!1227644))

(assert (not b!1227649))

(assert (not b!1227639))

(assert (not b!1227638))

(assert (not b!1227645))

(assert (not start!101972))

(assert (not b!1227640))

(assert (not b!1227643))

(assert (not b!1227641))

(assert (not b!1227642))

(assert (not b!1227637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

