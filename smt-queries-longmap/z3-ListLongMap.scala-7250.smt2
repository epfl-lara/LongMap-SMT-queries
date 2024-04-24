; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92796 () Bool)

(assert start!92796)

(declare-fun b!1054171 () Bool)

(declare-fun e!598674 () Bool)

(declare-fun e!598675 () Bool)

(assert (=> b!1054171 (= e!598674 e!598675)))

(declare-fun res!702492 () Bool)

(assert (=> b!1054171 (=> (not res!702492) (not e!598675))))

(declare-datatypes ((array!66412 0))(
  ( (array!66413 (arr!31939 (Array (_ BitVec 32) (_ BitVec 64))) (size!32476 (_ BitVec 32))) )
))
(declare-fun lt!465503 () array!66412)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054171 (= res!702492 (arrayContainsKey!0 lt!465503 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66412)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054171 (= lt!465503 (array!66413 (store (arr!31939 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32476 a!3488)))))

(declare-fun b!1054172 () Bool)

(declare-fun res!702494 () Bool)

(assert (=> b!1054172 (=> (not res!702494) (not e!598674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054172 (= res!702494 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054173 () Bool)

(declare-fun e!598673 () Bool)

(assert (=> b!1054173 (= e!598673 (not true))))

(declare-fun lt!465502 () (_ BitVec 32))

(assert (=> b!1054173 (= (select (store (arr!31939 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465502) k0!2747)))

(declare-fun b!1054174 () Bool)

(declare-fun res!702493 () Bool)

(assert (=> b!1054174 (=> (not res!702493) (not e!598674))))

(assert (=> b!1054174 (= res!702493 (= (select (arr!31939 a!3488) i!1381) k0!2747))))

(declare-fun res!702497 () Bool)

(assert (=> start!92796 (=> (not res!702497) (not e!598674))))

(assert (=> start!92796 (= res!702497 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32476 a!3488)) (bvslt (size!32476 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92796 e!598674))

(assert (=> start!92796 true))

(declare-fun array_inv!24721 (array!66412) Bool)

(assert (=> start!92796 (array_inv!24721 a!3488)))

(declare-fun b!1054175 () Bool)

(assert (=> b!1054175 (= e!598675 e!598673)))

(declare-fun res!702496 () Bool)

(assert (=> b!1054175 (=> (not res!702496) (not e!598673))))

(assert (=> b!1054175 (= res!702496 (not (= lt!465502 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66412 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054175 (= lt!465502 (arrayScanForKey!0 lt!465503 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054176 () Bool)

(declare-fun res!702495 () Bool)

(assert (=> b!1054176 (=> (not res!702495) (not e!598674))))

(declare-datatypes ((List!22221 0))(
  ( (Nil!22218) (Cons!22217 (h!23435 (_ BitVec 64)) (t!31520 List!22221)) )
))
(declare-fun arrayNoDuplicates!0 (array!66412 (_ BitVec 32) List!22221) Bool)

(assert (=> b!1054176 (= res!702495 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22218))))

(assert (= (and start!92796 res!702497) b!1054176))

(assert (= (and b!1054176 res!702495) b!1054172))

(assert (= (and b!1054172 res!702494) b!1054174))

(assert (= (and b!1054174 res!702493) b!1054171))

(assert (= (and b!1054171 res!702492) b!1054175))

(assert (= (and b!1054175 res!702496) b!1054173))

(declare-fun m!974921 () Bool)

(assert (=> start!92796 m!974921))

(declare-fun m!974923 () Bool)

(assert (=> b!1054172 m!974923))

(declare-fun m!974925 () Bool)

(assert (=> b!1054171 m!974925))

(declare-fun m!974927 () Bool)

(assert (=> b!1054171 m!974927))

(declare-fun m!974929 () Bool)

(assert (=> b!1054176 m!974929))

(declare-fun m!974931 () Bool)

(assert (=> b!1054175 m!974931))

(declare-fun m!974933 () Bool)

(assert (=> b!1054174 m!974933))

(assert (=> b!1054173 m!974927))

(declare-fun m!974935 () Bool)

(assert (=> b!1054173 m!974935))

(check-sat (not start!92796) (not b!1054171) (not b!1054172) (not b!1054175) (not b!1054176))
(check-sat)
