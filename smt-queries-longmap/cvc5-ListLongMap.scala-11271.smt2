; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131422 () Bool)

(assert start!131422)

(declare-fun b!1540680 () Bool)

(declare-fun res!1057411 () Bool)

(declare-fun e!856837 () Bool)

(assert (=> b!1540680 (=> (not res!1057411) (not e!856837))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102323 0))(
  ( (array!102324 (arr!49371 (Array (_ BitVec 32) (_ BitVec 64))) (size!49923 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102323)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540680 (= res!1057411 (and (= (size!49923 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49923 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49923 a!3920))))))

(declare-fun res!1057414 () Bool)

(assert (=> start!131422 (=> (not res!1057414) (not e!856837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131422 (= res!1057414 (validMask!0 mask!4052))))

(assert (=> start!131422 e!856837))

(assert (=> start!131422 true))

(declare-fun array_inv!38604 (array!102323) Bool)

(assert (=> start!131422 (array_inv!38604 a!3920)))

(declare-fun b!1540681 () Bool)

(declare-fun res!1057413 () Bool)

(assert (=> b!1540681 (=> (not res!1057413) (not e!856837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102323 (_ BitVec 32)) Bool)

(assert (=> b!1540681 (= res!1057413 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1540682 () Bool)

(declare-fun res!1057410 () Bool)

(assert (=> b!1540682 (=> (not res!1057410) (not e!856837))))

(assert (=> b!1540682 (= res!1057410 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49923 a!3920))))))

(declare-fun b!1540683 () Bool)

(assert (=> b!1540683 (= e!856837 (not true))))

(assert (=> b!1540683 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51285 0))(
  ( (Unit!51286) )
))
(declare-fun lt!665274 () Unit!51285)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51285)

(assert (=> b!1540683 (= lt!665274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1540684 () Bool)

(declare-fun res!1057412 () Bool)

(assert (=> b!1540684 (=> (not res!1057412) (not e!856837))))

(assert (=> b!1540684 (= res!1057412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(assert (= (and start!131422 res!1057414) b!1540680))

(assert (= (and b!1540680 res!1057411) b!1540681))

(assert (= (and b!1540681 res!1057413) b!1540682))

(assert (= (and b!1540682 res!1057410) b!1540684))

(assert (= (and b!1540684 res!1057412) b!1540683))

(declare-fun m!1422143 () Bool)

(assert (=> start!131422 m!1422143))

(declare-fun m!1422145 () Bool)

(assert (=> start!131422 m!1422145))

(declare-fun m!1422147 () Bool)

(assert (=> b!1540681 m!1422147))

(declare-fun m!1422149 () Bool)

(assert (=> b!1540683 m!1422149))

(declare-fun m!1422151 () Bool)

(assert (=> b!1540683 m!1422151))

(declare-fun m!1422153 () Bool)

(assert (=> b!1540684 m!1422153))

(push 1)

(assert (not b!1540684))

(assert (not b!1540681))

(assert (not start!131422))

(assert (not b!1540683))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

