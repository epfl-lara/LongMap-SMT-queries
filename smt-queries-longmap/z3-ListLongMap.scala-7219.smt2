; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92374 () Bool)

(assert start!92374)

(declare-fun b!1050137 () Bool)

(declare-fun e!595891 () Bool)

(declare-fun e!595895 () Bool)

(assert (=> b!1050137 (= e!595891 (not e!595895))))

(declare-fun res!699351 () Bool)

(assert (=> b!1050137 (=> res!699351 e!595895)))

(declare-fun lt!463668 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050137 (= res!699351 (bvsle lt!463668 i!1381))))

(declare-fun e!595892 () Bool)

(assert (=> b!1050137 e!595892))

(declare-fun res!699349 () Bool)

(assert (=> b!1050137 (=> (not res!699349) (not e!595892))))

(declare-datatypes ((array!66116 0))(
  ( (array!66117 (arr!31797 (Array (_ BitVec 32) (_ BitVec 64))) (size!32335 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66116)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1050137 (= res!699349 (= (select (store (arr!31797 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463668) k0!2747))))

(declare-fun res!699355 () Bool)

(declare-fun e!595893 () Bool)

(assert (=> start!92374 (=> (not res!699355) (not e!595893))))

(assert (=> start!92374 (= res!699355 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32335 a!3488)) (bvslt (size!32335 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92374 e!595893))

(assert (=> start!92374 true))

(declare-fun array_inv!24580 (array!66116) Bool)

(assert (=> start!92374 (array_inv!24580 a!3488)))

(declare-fun b!1050138 () Bool)

(declare-fun e!595890 () Bool)

(assert (=> b!1050138 (= e!595890 e!595891)))

(declare-fun res!699348 () Bool)

(assert (=> b!1050138 (=> (not res!699348) (not e!595891))))

(assert (=> b!1050138 (= res!699348 (not (= lt!463668 i!1381)))))

(declare-fun lt!463672 () array!66116)

(declare-fun arrayScanForKey!0 (array!66116 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050138 (= lt!463668 (arrayScanForKey!0 lt!463672 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050139 () Bool)

(declare-fun res!699350 () Bool)

(assert (=> b!1050139 (=> (not res!699350) (not e!595893))))

(declare-datatypes ((List!22168 0))(
  ( (Nil!22165) (Cons!22164 (h!23373 (_ BitVec 64)) (t!31466 List!22168)) )
))
(declare-fun arrayNoDuplicates!0 (array!66116 (_ BitVec 32) List!22168) Bool)

(assert (=> b!1050139 (= res!699350 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22165))))

(declare-fun b!1050140 () Bool)

(declare-fun e!595896 () Bool)

(assert (=> b!1050140 (= e!595892 e!595896)))

(declare-fun res!699353 () Bool)

(assert (=> b!1050140 (=> res!699353 e!595896)))

(assert (=> b!1050140 (= res!699353 (bvsle lt!463668 i!1381))))

(declare-fun b!1050141 () Bool)

(assert (=> b!1050141 (= e!595893 e!595890)))

(declare-fun res!699347 () Bool)

(assert (=> b!1050141 (=> (not res!699347) (not e!595890))))

(declare-fun arrayContainsKey!0 (array!66116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050141 (= res!699347 (arrayContainsKey!0 lt!463672 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050141 (= lt!463672 (array!66117 (store (arr!31797 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32335 a!3488)))))

(declare-fun b!1050142 () Bool)

(assert (=> b!1050142 (= e!595896 (arrayContainsKey!0 a!3488 k0!2747 lt!463668))))

(declare-fun b!1050143 () Bool)

(assert (=> b!1050143 (= e!595895 true)))

(assert (=> b!1050143 false))

(declare-datatypes ((Unit!34247 0))(
  ( (Unit!34248) )
))
(declare-fun lt!463670 () Unit!34247)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66116 (_ BitVec 64) (_ BitVec 32) List!22168) Unit!34247)

(assert (=> b!1050143 (= lt!463670 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22165))))

(assert (=> b!1050143 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463671 () Unit!34247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66116 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34247)

(assert (=> b!1050143 (= lt!463671 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463668 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050143 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22165)))

(declare-fun lt!463669 () Unit!34247)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66116 (_ BitVec 32) (_ BitVec 32)) Unit!34247)

(assert (=> b!1050143 (= lt!463669 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050144 () Bool)

(declare-fun res!699352 () Bool)

(assert (=> b!1050144 (=> (not res!699352) (not e!595893))))

(assert (=> b!1050144 (= res!699352 (= (select (arr!31797 a!3488) i!1381) k0!2747))))

(declare-fun b!1050145 () Bool)

(declare-fun res!699354 () Bool)

(assert (=> b!1050145 (=> (not res!699354) (not e!595893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050145 (= res!699354 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92374 res!699355) b!1050139))

(assert (= (and b!1050139 res!699350) b!1050145))

(assert (= (and b!1050145 res!699354) b!1050144))

(assert (= (and b!1050144 res!699352) b!1050141))

(assert (= (and b!1050141 res!699347) b!1050138))

(assert (= (and b!1050138 res!699348) b!1050137))

(assert (= (and b!1050137 res!699349) b!1050140))

(assert (= (and b!1050140 (not res!699353)) b!1050142))

(assert (= (and b!1050137 (not res!699351)) b!1050143))

(declare-fun m!970345 () Bool)

(assert (=> b!1050145 m!970345))

(declare-fun m!970347 () Bool)

(assert (=> b!1050139 m!970347))

(declare-fun m!970349 () Bool)

(assert (=> b!1050138 m!970349))

(declare-fun m!970351 () Bool)

(assert (=> b!1050141 m!970351))

(declare-fun m!970353 () Bool)

(assert (=> b!1050141 m!970353))

(declare-fun m!970355 () Bool)

(assert (=> start!92374 m!970355))

(declare-fun m!970357 () Bool)

(assert (=> b!1050142 m!970357))

(assert (=> b!1050137 m!970353))

(declare-fun m!970359 () Bool)

(assert (=> b!1050137 m!970359))

(declare-fun m!970361 () Bool)

(assert (=> b!1050143 m!970361))

(declare-fun m!970363 () Bool)

(assert (=> b!1050143 m!970363))

(declare-fun m!970365 () Bool)

(assert (=> b!1050143 m!970365))

(declare-fun m!970367 () Bool)

(assert (=> b!1050143 m!970367))

(declare-fun m!970369 () Bool)

(assert (=> b!1050143 m!970369))

(declare-fun m!970371 () Bool)

(assert (=> b!1050144 m!970371))

(check-sat (not b!1050141) (not b!1050145) (not start!92374) (not b!1050139) (not b!1050138) (not b!1050142) (not b!1050143))
(check-sat)
