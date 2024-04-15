; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92182 () Bool)

(assert start!92182)

(declare-fun res!697221 () Bool)

(declare-fun e!594341 () Bool)

(assert (=> start!92182 (=> (not res!697221) (not e!594341))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65951 0))(
  ( (array!65952 (arr!31716 (Array (_ BitVec 32) (_ BitVec 64))) (size!32254 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65951)

(assert (=> start!92182 (= res!697221 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32254 a!3488)) (bvslt (size!32254 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92182 e!594341))

(assert (=> start!92182 true))

(declare-fun array_inv!24499 (array!65951) Bool)

(assert (=> start!92182 (array_inv!24499 a!3488)))

(declare-fun b!1047974 () Bool)

(declare-fun res!697220 () Bool)

(assert (=> b!1047974 (=> (not res!697220) (not e!594341))))

(declare-datatypes ((List!22087 0))(
  ( (Nil!22084) (Cons!22083 (h!23292 (_ BitVec 64)) (t!31385 List!22087)) )
))
(declare-fun arrayNoDuplicates!0 (array!65951 (_ BitVec 32) List!22087) Bool)

(assert (=> b!1047974 (= res!697220 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22084))))

(declare-fun b!1047975 () Bool)

(declare-fun res!697222 () Bool)

(assert (=> b!1047975 (=> (not res!697222) (not e!594341))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1047975 (= res!697222 (validKeyInArray!0 k0!2747))))

(declare-fun b!1047976 () Bool)

(assert (=> b!1047976 (= e!594341 (and (= (select (arr!31716 a!3488) i!1381) k0!2747) (bvsge #b00000000000000000000000000000000 (size!32254 a!3488))))))

(assert (= (and start!92182 res!697221) b!1047974))

(assert (= (and b!1047974 res!697220) b!1047975))

(assert (= (and b!1047975 res!697222) b!1047976))

(declare-fun m!968539 () Bool)

(assert (=> start!92182 m!968539))

(declare-fun m!968541 () Bool)

(assert (=> b!1047974 m!968541))

(declare-fun m!968543 () Bool)

(assert (=> b!1047975 m!968543))

(declare-fun m!968545 () Bool)

(assert (=> b!1047976 m!968545))

(check-sat (not b!1047975) (not start!92182) (not b!1047974))
(check-sat)
