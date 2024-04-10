; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114202 () Bool)

(assert start!114202)

(declare-fun res!901441 () Bool)

(declare-fun e!770149 () Bool)

(assert (=> start!114202 (=> (not res!901441) (not e!770149))))

(declare-datatypes ((array!92384 0))(
  ( (array!92385 (arr!44640 (Array (_ BitVec 32) (_ BitVec 64))) (size!45190 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92384)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114202 (= res!901441 (and (bvslt (size!45190 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45190 a!3742))))))

(assert (=> start!114202 e!770149))

(declare-fun array_inv!33668 (array!92384) Bool)

(assert (=> start!114202 (array_inv!33668 a!3742)))

(assert (=> start!114202 true))

(declare-fun b!1356681 () Bool)

(declare-fun res!901439 () Bool)

(assert (=> b!1356681 (=> (not res!901439) (not e!770149))))

(declare-datatypes ((List!31681 0))(
  ( (Nil!31678) (Cons!31677 (h!32886 (_ BitVec 64)) (t!46339 List!31681)) )
))
(declare-fun acc!759 () List!31681)

(declare-fun contains!9390 (List!31681 (_ BitVec 64)) Bool)

(assert (=> b!1356681 (= res!901439 (not (contains!9390 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356682 () Bool)

(declare-fun res!901437 () Bool)

(assert (=> b!1356682 (=> (not res!901437) (not e!770149))))

(declare-fun noDuplicate!2247 (List!31681) Bool)

(assert (=> b!1356682 (= res!901437 (noDuplicate!2247 acc!759))))

(declare-fun b!1356683 () Bool)

(declare-fun res!901440 () Bool)

(assert (=> b!1356683 (=> (not res!901440) (not e!770149))))

(declare-fun arrayNoDuplicates!0 (array!92384 (_ BitVec 32) List!31681) Bool)

(assert (=> b!1356683 (= res!901440 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31678))))

(declare-fun b!1356684 () Bool)

(declare-fun res!901438 () Bool)

(assert (=> b!1356684 (=> (not res!901438) (not e!770149))))

(assert (=> b!1356684 (= res!901438 (not (contains!9390 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356685 () Bool)

(assert (=> b!1356685 (= e!770149 false)))

(declare-fun lt!599077 () Bool)

(assert (=> b!1356685 (= lt!599077 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114202 res!901441) b!1356682))

(assert (= (and b!1356682 res!901437) b!1356684))

(assert (= (and b!1356684 res!901438) b!1356681))

(assert (= (and b!1356681 res!901439) b!1356683))

(assert (= (and b!1356683 res!901440) b!1356685))

(declare-fun m!1242631 () Bool)

(assert (=> b!1356684 m!1242631))

(declare-fun m!1242633 () Bool)

(assert (=> b!1356685 m!1242633))

(declare-fun m!1242635 () Bool)

(assert (=> b!1356683 m!1242635))

(declare-fun m!1242637 () Bool)

(assert (=> start!114202 m!1242637))

(declare-fun m!1242639 () Bool)

(assert (=> b!1356682 m!1242639))

(declare-fun m!1242641 () Bool)

(assert (=> b!1356681 m!1242641))

(check-sat (not b!1356685) (not b!1356682) (not start!114202) (not b!1356684) (not b!1356681) (not b!1356683))
(check-sat)
