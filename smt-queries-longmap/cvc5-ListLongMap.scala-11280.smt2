; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131522 () Bool)

(assert start!131522)

(declare-fun res!1057782 () Bool)

(declare-fun e!857184 () Bool)

(assert (=> start!131522 (=> (not res!1057782) (not e!857184))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131522 (= res!1057782 (validMask!0 mask!4052))))

(assert (=> start!131522 e!857184))

(assert (=> start!131522 true))

(declare-datatypes ((array!102425 0))(
  ( (array!102426 (arr!49421 (Array (_ BitVec 32) (_ BitVec 64))) (size!49971 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102425)

(declare-fun array_inv!38449 (array!102425) Bool)

(assert (=> start!131522 (array_inv!38449 a!3920)))

(declare-fun b!1541236 () Bool)

(declare-fun res!1057783 () Bool)

(assert (=> b!1541236 (=> (not res!1057783) (not e!857184))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541236 (= res!1057783 (and (= (size!49971 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49971 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49971 a!3920))))))

(declare-fun b!1541237 () Bool)

(assert (=> b!1541237 (= e!857184 false)))

(declare-fun lt!665626 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102425 (_ BitVec 32)) Bool)

(assert (=> b!1541237 (= lt!665626 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131522 res!1057782) b!1541236))

(assert (= (and b!1541236 res!1057783) b!1541237))

(declare-fun m!1423245 () Bool)

(assert (=> start!131522 m!1423245))

(declare-fun m!1423247 () Bool)

(assert (=> start!131522 m!1423247))

(declare-fun m!1423249 () Bool)

(assert (=> b!1541237 m!1423249))

(push 1)

(assert (not b!1541237))

(assert (not start!131522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

