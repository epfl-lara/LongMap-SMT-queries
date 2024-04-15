; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92194 () Bool)

(assert start!92194)

(declare-fun b!1048014 () Bool)

(declare-fun res!697264 () Bool)

(declare-fun e!594378 () Bool)

(assert (=> b!1048014 (=> (not res!697264) (not e!594378))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048014 (= res!697264 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048015 () Bool)

(declare-fun res!697261 () Bool)

(assert (=> b!1048015 (=> (not res!697261) (not e!594378))))

(declare-datatypes ((array!65963 0))(
  ( (array!65964 (arr!31722 (Array (_ BitVec 32) (_ BitVec 64))) (size!32260 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65963)

(declare-datatypes ((List!22093 0))(
  ( (Nil!22090) (Cons!22089 (h!23298 (_ BitVec 64)) (t!31391 List!22093)) )
))
(declare-fun arrayNoDuplicates!0 (array!65963 (_ BitVec 32) List!22093) Bool)

(assert (=> b!1048015 (= res!697261 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22090))))

(declare-fun res!697260 () Bool)

(assert (=> start!92194 (=> (not res!697260) (not e!594378))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92194 (= res!697260 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32260 a!3488)) (bvslt (size!32260 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92194 e!594378))

(assert (=> start!92194 true))

(declare-fun array_inv!24505 (array!65963) Bool)

(assert (=> start!92194 (array_inv!24505 a!3488)))

(declare-fun b!1048016 () Bool)

(declare-fun res!697263 () Bool)

(assert (=> b!1048016 (=> (not res!697263) (not e!594378))))

(assert (=> b!1048016 (= res!697263 (= (select (arr!31722 a!3488) i!1381) k0!2747))))

(declare-fun b!1048017 () Bool)

(declare-fun res!697262 () Bool)

(assert (=> b!1048017 (=> (not res!697262) (not e!594378))))

(declare-fun arrayContainsKey!0 (array!65963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048017 (= res!697262 (arrayContainsKey!0 (array!65964 (store (arr!31722 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32260 a!3488)) k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048018 () Bool)

(assert (=> b!1048018 (= e!594378 (bvsge #b00000000000000000000000000000000 (size!32260 a!3488)))))

(assert (= (and start!92194 res!697260) b!1048015))

(assert (= (and b!1048015 res!697261) b!1048014))

(assert (= (and b!1048014 res!697264) b!1048016))

(assert (= (and b!1048016 res!697263) b!1048017))

(assert (= (and b!1048017 res!697262) b!1048018))

(declare-fun m!968575 () Bool)

(assert (=> b!1048017 m!968575))

(declare-fun m!968577 () Bool)

(assert (=> b!1048017 m!968577))

(declare-fun m!968579 () Bool)

(assert (=> b!1048016 m!968579))

(declare-fun m!968581 () Bool)

(assert (=> b!1048014 m!968581))

(declare-fun m!968583 () Bool)

(assert (=> start!92194 m!968583))

(declare-fun m!968585 () Bool)

(assert (=> b!1048015 m!968585))

(check-sat (not b!1048017) (not b!1048015) (not b!1048014) (not start!92194))
(check-sat)
