; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118280 () Bool)

(assert start!118280)

(declare-fun b!1383770 () Bool)

(declare-fun res!924574 () Bool)

(declare-fun e!784431 () Bool)

(assert (=> b!1383770 (=> (not res!924574) (not e!784431))))

(declare-datatypes ((array!94540 0))(
  ( (array!94541 (arr!45649 (Array (_ BitVec 32) (_ BitVec 64))) (size!46200 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94540)

(declare-datatypes ((List!32170 0))(
  ( (Nil!32167) (Cons!32166 (h!33384 (_ BitVec 64)) (t!46856 List!32170)) )
))
(declare-fun arrayNoDuplicates!0 (array!94540 (_ BitVec 32) List!32170) Bool)

(assert (=> b!1383770 (= res!924574 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32167))))

(declare-fun b!1383771 () Bool)

(declare-fun res!924573 () Bool)

(assert (=> b!1383771 (=> (not res!924573) (not e!784431))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383771 (= res!924573 (and (= (size!46200 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46200 a!2971))))))

(declare-fun b!1383772 () Bool)

(declare-fun res!924575 () Bool)

(assert (=> b!1383772 (=> (not res!924575) (not e!784431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94540 (_ BitVec 32)) Bool)

(assert (=> b!1383772 (= res!924575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924577 () Bool)

(assert (=> start!118280 (=> (not res!924577) (not e!784431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118280 (= res!924577 (validMask!0 mask!3034))))

(assert (=> start!118280 e!784431))

(assert (=> start!118280 true))

(declare-fun array_inv!34930 (array!94540) Bool)

(assert (=> start!118280 (array_inv!34930 a!2971)))

(declare-fun b!1383773 () Bool)

(assert (=> b!1383773 (= e!784431 (and (not (= (select (arr!45649 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45649 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!46200 a!2971))))))

(declare-fun b!1383774 () Bool)

(declare-fun res!924576 () Bool)

(assert (=> b!1383774 (=> (not res!924576) (not e!784431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383774 (= res!924576 (validKeyInArray!0 (select (arr!45649 a!2971) i!1094)))))

(assert (= (and start!118280 res!924577) b!1383771))

(assert (= (and b!1383771 res!924573) b!1383774))

(assert (= (and b!1383774 res!924576) b!1383770))

(assert (= (and b!1383770 res!924574) b!1383772))

(assert (= (and b!1383772 res!924575) b!1383773))

(declare-fun m!1269231 () Bool)

(assert (=> start!118280 m!1269231))

(declare-fun m!1269233 () Bool)

(assert (=> start!118280 m!1269233))

(declare-fun m!1269235 () Bool)

(assert (=> b!1383770 m!1269235))

(declare-fun m!1269237 () Bool)

(assert (=> b!1383772 m!1269237))

(declare-fun m!1269239 () Bool)

(assert (=> b!1383774 m!1269239))

(assert (=> b!1383774 m!1269239))

(declare-fun m!1269241 () Bool)

(assert (=> b!1383774 m!1269241))

(assert (=> b!1383773 m!1269239))

(check-sat (not b!1383774) (not start!118280) (not b!1383770) (not b!1383772))
(check-sat)
