; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131536 () Bool)

(assert start!131536)

(declare-fun res!1057915 () Bool)

(declare-fun e!857160 () Bool)

(assert (=> start!131536 (=> (not res!1057915) (not e!857160))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131536 (= res!1057915 (validMask!0 mask!4052))))

(assert (=> start!131536 e!857160))

(assert (=> start!131536 true))

(declare-datatypes ((array!102422 0))(
  ( (array!102423 (arr!49419 (Array (_ BitVec 32) (_ BitVec 64))) (size!49971 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102422)

(declare-fun array_inv!38652 (array!102422) Bool)

(assert (=> start!131536 (array_inv!38652 a!3920)))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun b!1541209 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102422 (_ BitVec 32)) Bool)

(assert (=> b!1541209 (= e!857160 (not (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))))

(declare-fun b!1541206 () Bool)

(declare-fun res!1057912 () Bool)

(assert (=> b!1541206 (=> (not res!1057912) (not e!857160))))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541206 (= res!1057912 (and (= (size!49971 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49971 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49971 a!3920))))))

(declare-fun b!1541207 () Bool)

(declare-fun res!1057914 () Bool)

(assert (=> b!1541207 (=> (not res!1057914) (not e!857160))))

(assert (=> b!1541207 (= res!1057914 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541208 () Bool)

(declare-fun res!1057913 () Bool)

(assert (=> b!1541208 (=> (not res!1057913) (not e!857160))))

(assert (=> b!1541208 (= res!1057913 (bvsge from!3298 newFrom!293))))

(assert (= (and start!131536 res!1057915) b!1541206))

(assert (= (and b!1541206 res!1057912) b!1541207))

(assert (= (and b!1541207 res!1057914) b!1541208))

(assert (= (and b!1541208 res!1057913) b!1541209))

(declare-fun m!1422597 () Bool)

(assert (=> start!131536 m!1422597))

(declare-fun m!1422599 () Bool)

(assert (=> start!131536 m!1422599))

(declare-fun m!1422601 () Bool)

(assert (=> b!1541209 m!1422601))

(declare-fun m!1422603 () Bool)

(assert (=> b!1541207 m!1422603))

(push 1)

(assert (not b!1541209))

(assert (not b!1541207))

(assert (not start!131536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

