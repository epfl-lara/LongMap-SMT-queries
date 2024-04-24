; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102486 () Bool)

(assert start!102486)

(declare-fun b!1231937 () Bool)

(declare-fun res!819611 () Bool)

(declare-fun e!699086 () Bool)

(assert (=> b!1231937 (=> (not res!819611) (not e!699086))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231937 (= res!819611 (validKeyInArray!0 k0!2913))))

(declare-fun res!819612 () Bool)

(assert (=> start!102486 (=> (not res!819612) (not e!699086))))

(declare-datatypes ((array!79424 0))(
  ( (array!79425 (arr!38324 (Array (_ BitVec 32) (_ BitVec 64))) (size!38861 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79424)

(assert (=> start!102486 (= res!819612 (bvslt (size!38861 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102486 e!699086))

(declare-fun array_inv!29262 (array!79424) Bool)

(assert (=> start!102486 (array_inv!29262 a!3806)))

(assert (=> start!102486 true))

(declare-fun b!1231938 () Bool)

(declare-fun res!819609 () Bool)

(assert (=> b!1231938 (=> (not res!819609) (not e!699086))))

(declare-datatypes ((List!27110 0))(
  ( (Nil!27107) (Cons!27106 (h!28324 (_ BitVec 64)) (t!40565 List!27110)) )
))
(declare-fun acc!823 () List!27110)

(declare-fun contains!7181 (List!27110 (_ BitVec 64)) Bool)

(assert (=> b!1231938 (= res!819609 (not (contains!7181 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231939 () Bool)

(declare-fun res!819608 () Bool)

(assert (=> b!1231939 (=> (not res!819608) (not e!699086))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79424 (_ BitVec 32) List!27110) Bool)

(assert (=> b!1231939 (= res!819608 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231940 () Bool)

(declare-fun res!819614 () Bool)

(assert (=> b!1231940 (=> (not res!819614) (not e!699086))))

(declare-fun noDuplicate!1762 (List!27110) Bool)

(assert (=> b!1231940 (= res!819614 (noDuplicate!1762 acc!823))))

(declare-fun b!1231941 () Bool)

(declare-fun res!819613 () Bool)

(assert (=> b!1231941 (=> (not res!819613) (not e!699086))))

(assert (=> b!1231941 (= res!819613 (validKeyInArray!0 (select (arr!38324 a!3806) from!3184)))))

(declare-fun b!1231942 () Bool)

(declare-fun res!819607 () Bool)

(assert (=> b!1231942 (=> (not res!819607) (not e!699086))))

(assert (=> b!1231942 (= res!819607 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38861 a!3806)) (bvslt from!3184 (size!38861 a!3806))))))

(declare-fun b!1231943 () Bool)

(declare-fun res!819610 () Bool)

(assert (=> b!1231943 (=> (not res!819610) (not e!699086))))

(assert (=> b!1231943 (= res!819610 (not (contains!7181 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231944 () Bool)

(declare-fun res!819606 () Bool)

(assert (=> b!1231944 (=> (not res!819606) (not e!699086))))

(declare-fun arrayContainsKey!0 (array!79424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231944 (= res!819606 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231945 () Bool)

(assert (=> b!1231945 (= e!699086 (not true))))

(assert (=> b!1231945 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27106 (select (arr!38324 a!3806) from!3184) acc!823))))

(assert (= (and start!102486 res!819612) b!1231937))

(assert (= (and b!1231937 res!819611) b!1231942))

(assert (= (and b!1231942 res!819607) b!1231940))

(assert (= (and b!1231940 res!819614) b!1231938))

(assert (= (and b!1231938 res!819609) b!1231943))

(assert (= (and b!1231943 res!819610) b!1231944))

(assert (= (and b!1231944 res!819606) b!1231939))

(assert (= (and b!1231939 res!819608) b!1231941))

(assert (= (and b!1231941 res!819613) b!1231945))

(declare-fun m!1136625 () Bool)

(assert (=> start!102486 m!1136625))

(declare-fun m!1136627 () Bool)

(assert (=> b!1231943 m!1136627))

(declare-fun m!1136629 () Bool)

(assert (=> b!1231940 m!1136629))

(declare-fun m!1136631 () Bool)

(assert (=> b!1231939 m!1136631))

(declare-fun m!1136633 () Bool)

(assert (=> b!1231944 m!1136633))

(declare-fun m!1136635 () Bool)

(assert (=> b!1231937 m!1136635))

(declare-fun m!1136637 () Bool)

(assert (=> b!1231941 m!1136637))

(assert (=> b!1231941 m!1136637))

(declare-fun m!1136639 () Bool)

(assert (=> b!1231941 m!1136639))

(assert (=> b!1231945 m!1136637))

(declare-fun m!1136641 () Bool)

(assert (=> b!1231945 m!1136641))

(declare-fun m!1136643 () Bool)

(assert (=> b!1231938 m!1136643))

(check-sat (not b!1231945) (not b!1231937) (not b!1231944) (not b!1231939) (not start!102486) (not b!1231943) (not b!1231938) (not b!1231940) (not b!1231941))
(check-sat)
