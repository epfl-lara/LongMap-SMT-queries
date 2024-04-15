; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131530 () Bool)

(assert start!131530)

(declare-fun b!1541169 () Bool)

(declare-fun res!1057879 () Bool)

(declare-fun e!857143 () Bool)

(assert (=> b!1541169 (=> (not res!1057879) (not e!857143))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102416 0))(
  ( (array!102417 (arr!49416 (Array (_ BitVec 32) (_ BitVec 64))) (size!49968 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102416)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1541169 (= res!1057879 (and (= (size!49968 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49968 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49968 a!3920))))))

(declare-fun b!1541170 () Bool)

(declare-fun res!1057875 () Bool)

(assert (=> b!1541170 (=> (not res!1057875) (not e!857143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102416 (_ BitVec 32)) Bool)

(assert (=> b!1541170 (= res!1057875 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541171 () Bool)

(assert (=> b!1541171 (= e!857143 (not true))))

(assert (=> b!1541171 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51315 0))(
  ( (Unit!51316) )
))
(declare-fun lt!665409 () Unit!51315)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51315)

(assert (=> b!1541171 (= lt!665409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1541172 () Bool)

(declare-fun res!1057877 () Bool)

(assert (=> b!1541172 (=> (not res!1057877) (not e!857143))))

(assert (=> b!1541172 (= res!1057877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541173 () Bool)

(declare-fun res!1057876 () Bool)

(assert (=> b!1541173 (=> (not res!1057876) (not e!857143))))

(assert (=> b!1541173 (= res!1057876 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49968 a!3920))))))

(declare-fun res!1057878 () Bool)

(assert (=> start!131530 (=> (not res!1057878) (not e!857143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131530 (= res!1057878 (validMask!0 mask!4052))))

(assert (=> start!131530 e!857143))

(assert (=> start!131530 true))

(declare-fun array_inv!38649 (array!102416) Bool)

(assert (=> start!131530 (array_inv!38649 a!3920)))

(assert (= (and start!131530 res!1057878) b!1541169))

(assert (= (and b!1541169 res!1057879) b!1541170))

(assert (= (and b!1541170 res!1057875) b!1541173))

(assert (= (and b!1541173 res!1057876) b!1541172))

(assert (= (and b!1541172 res!1057877) b!1541171))

(declare-fun m!1422569 () Bool)

(assert (=> b!1541170 m!1422569))

(declare-fun m!1422571 () Bool)

(assert (=> b!1541171 m!1422571))

(declare-fun m!1422573 () Bool)

(assert (=> b!1541171 m!1422573))

(declare-fun m!1422575 () Bool)

(assert (=> b!1541172 m!1422575))

(declare-fun m!1422577 () Bool)

(assert (=> start!131530 m!1422577))

(declare-fun m!1422579 () Bool)

(assert (=> start!131530 m!1422579))

(push 1)

(assert (not b!1541170))

(assert (not b!1541172))

(assert (not b!1541171))

(assert (not start!131530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

