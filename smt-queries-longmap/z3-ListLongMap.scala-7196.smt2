; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92206 () Bool)

(assert start!92206)

(declare-fun b!1048070 () Bool)

(declare-fun e!594419 () Bool)

(declare-fun e!594417 () Bool)

(assert (=> b!1048070 (= e!594419 e!594417)))

(declare-fun res!697320 () Bool)

(assert (=> b!1048070 (=> (not res!697320) (not e!594417))))

(declare-fun lt!462943 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048070 (= res!697320 (not (= lt!462943 i!1381)))))

(declare-datatypes ((array!65975 0))(
  ( (array!65976 (arr!31728 (Array (_ BitVec 32) (_ BitVec 64))) (size!32266 (_ BitVec 32))) )
))
(declare-fun lt!462942 () array!65975)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!65975 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048070 (= lt!462943 (arrayScanForKey!0 lt!462942 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!697321 () Bool)

(declare-fun e!594418 () Bool)

(assert (=> start!92206 (=> (not res!697321) (not e!594418))))

(declare-fun a!3488 () array!65975)

(assert (=> start!92206 (= res!697321 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32266 a!3488)) (bvslt (size!32266 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92206 e!594418))

(assert (=> start!92206 true))

(declare-fun array_inv!24511 (array!65975) Bool)

(assert (=> start!92206 (array_inv!24511 a!3488)))

(declare-fun b!1048071 () Bool)

(declare-fun res!697316 () Bool)

(assert (=> b!1048071 (=> (not res!697316) (not e!594418))))

(assert (=> b!1048071 (= res!697316 (= (select (arr!31728 a!3488) i!1381) k0!2747))))

(declare-fun b!1048072 () Bool)

(declare-fun res!697318 () Bool)

(assert (=> b!1048072 (=> (not res!697318) (not e!594418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048072 (= res!697318 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048073 () Bool)

(assert (=> b!1048073 (= e!594417 (not (or (bvsle lt!462943 i!1381) (bvsge lt!462943 #b00000000000000000000000000000000))))))

(assert (=> b!1048073 (= (select (store (arr!31728 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!462943) k0!2747)))

(declare-fun b!1048074 () Bool)

(declare-fun res!697319 () Bool)

(assert (=> b!1048074 (=> (not res!697319) (not e!594418))))

(declare-datatypes ((List!22099 0))(
  ( (Nil!22096) (Cons!22095 (h!23304 (_ BitVec 64)) (t!31397 List!22099)) )
))
(declare-fun arrayNoDuplicates!0 (array!65975 (_ BitVec 32) List!22099) Bool)

(assert (=> b!1048074 (= res!697319 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22096))))

(declare-fun b!1048075 () Bool)

(assert (=> b!1048075 (= e!594418 e!594419)))

(declare-fun res!697317 () Bool)

(assert (=> b!1048075 (=> (not res!697317) (not e!594419))))

(declare-fun arrayContainsKey!0 (array!65975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048075 (= res!697317 (arrayContainsKey!0 lt!462942 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048075 (= lt!462942 (array!65976 (store (arr!31728 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32266 a!3488)))))

(assert (= (and start!92206 res!697321) b!1048074))

(assert (= (and b!1048074 res!697319) b!1048072))

(assert (= (and b!1048072 res!697318) b!1048071))

(assert (= (and b!1048071 res!697316) b!1048075))

(assert (= (and b!1048075 res!697317) b!1048070))

(assert (= (and b!1048070 res!697320) b!1048073))

(declare-fun m!968623 () Bool)

(assert (=> b!1048070 m!968623))

(declare-fun m!968625 () Bool)

(assert (=> b!1048071 m!968625))

(declare-fun m!968627 () Bool)

(assert (=> b!1048072 m!968627))

(declare-fun m!968629 () Bool)

(assert (=> b!1048073 m!968629))

(declare-fun m!968631 () Bool)

(assert (=> b!1048073 m!968631))

(declare-fun m!968633 () Bool)

(assert (=> start!92206 m!968633))

(declare-fun m!968635 () Bool)

(assert (=> b!1048075 m!968635))

(assert (=> b!1048075 m!968629))

(declare-fun m!968637 () Bool)

(assert (=> b!1048074 m!968637))

(check-sat (not b!1048074) (not b!1048072) (not start!92206) (not b!1048075) (not b!1048070))
(check-sat)
