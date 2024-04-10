; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103472 () Bool)

(assert start!103472)

(declare-fun b!1240394 () Bool)

(declare-fun res!827681 () Bool)

(declare-fun e!703046 () Bool)

(assert (=> b!1240394 (=> (not res!827681) (not e!703046))))

(declare-datatypes ((array!79945 0))(
  ( (array!79946 (arr!38568 (Array (_ BitVec 32) (_ BitVec 64))) (size!39104 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79945)

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240394 (= res!827681 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240396 () Bool)

(declare-fun res!827682 () Bool)

(assert (=> b!1240396 (=> (not res!827682) (not e!703046))))

(assert (=> b!1240396 (= res!827682 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(declare-fun b!1240397 () Bool)

(assert (=> b!1240397 (= e!703046 (not true))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> b!1240397 (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))

(declare-datatypes ((Unit!41227 0))(
  ( (Unit!41228) )
))
(declare-fun lt!561920 () Unit!41227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79945 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41227)

(assert (=> b!1240397 (= lt!561920 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun res!827683 () Bool)

(assert (=> start!103472 (=> (not res!827683) (not e!703046))))

(assert (=> start!103472 (= res!827683 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39104 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39104 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103472 e!703046))

(assert (=> start!103472 true))

(declare-fun array_inv!29416 (array!79945) Bool)

(assert (=> start!103472 (array_inv!29416 a!3575)))

(declare-fun b!1240395 () Bool)

(declare-fun res!827680 () Bool)

(assert (=> b!1240395 (=> (not res!827680) (not e!703046))))

(assert (=> b!1240395 (= res!827680 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39104 a!3575))))))

(assert (= (and start!103472 res!827683) b!1240394))

(assert (= (and b!1240394 res!827681) b!1240395))

(assert (= (and b!1240395 res!827680) b!1240396))

(assert (= (and b!1240396 res!827682) b!1240397))

(declare-fun m!1143695 () Bool)

(assert (=> b!1240394 m!1143695))

(declare-fun m!1143697 () Bool)

(assert (=> b!1240396 m!1143697))

(declare-fun m!1143699 () Bool)

(assert (=> b!1240397 m!1143699))

(declare-fun m!1143701 () Bool)

(assert (=> b!1240397 m!1143701))

(declare-fun m!1143703 () Bool)

(assert (=> start!103472 m!1143703))

(check-sat (not b!1240397) (not start!103472) (not b!1240396) (not b!1240394))
