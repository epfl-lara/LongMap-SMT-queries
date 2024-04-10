; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118636 () Bool)

(assert start!118636)

(declare-fun b!1387012 () Bool)

(declare-fun res!928087 () Bool)

(declare-fun e!785651 () Bool)

(assert (=> b!1387012 (=> (not res!928087) (not e!785651))))

(declare-datatypes ((array!94912 0))(
  ( (array!94913 (arr!45832 (Array (_ BitVec 32) (_ BitVec 64))) (size!46382 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94912)

(declare-datatypes ((List!32360 0))(
  ( (Nil!32357) (Cons!32356 (h!33565 (_ BitVec 64)) (t!47054 List!32360)) )
))
(declare-fun arrayNoDuplicates!0 (array!94912 (_ BitVec 32) List!32360) Bool)

(assert (=> b!1387012 (= res!928087 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32357))))

(declare-fun b!1387013 () Bool)

(declare-fun res!928088 () Bool)

(assert (=> b!1387013 (=> (not res!928088) (not e!785651))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387013 (= res!928088 (and (= (size!46382 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46382 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46382 a!2938))))))

(declare-fun b!1387014 () Bool)

(declare-fun e!785652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387014 (= e!785652 (validKeyInArray!0 (select (arr!45832 a!2938) startIndex!16)))))

(declare-fun b!1387015 () Bool)

(declare-fun res!928086 () Bool)

(assert (=> b!1387015 (=> (not res!928086) (not e!785651))))

(assert (=> b!1387015 (= res!928086 (and (not (= (select (arr!45832 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45832 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387016 () Bool)

(declare-fun res!928085 () Bool)

(assert (=> b!1387016 (=> (not res!928085) (not e!785651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94912 (_ BitVec 32)) Bool)

(assert (=> b!1387016 (= res!928085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387017 () Bool)

(declare-datatypes ((Unit!46367 0))(
  ( (Unit!46368) )
))
(declare-fun e!785654 () Unit!46367)

(declare-fun Unit!46369 () Unit!46367)

(assert (=> b!1387017 (= e!785654 Unit!46369)))

(declare-fun b!1387018 () Bool)

(assert (=> b!1387018 (= e!785651 (and (bvslt startIndex!16 (bvsub (size!46382 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000) (bvsge (bvsub (size!46382 a!2938) (bvadd #b00000000000000000000000000000001 startIndex!16)) (bvsub (size!46382 a!2938) startIndex!16))))))

(declare-fun lt!609656 () Unit!46367)

(assert (=> b!1387018 (= lt!609656 e!785654)))

(declare-fun c!128904 () Bool)

(assert (=> b!1387018 (= c!128904 e!785652)))

(declare-fun res!928090 () Bool)

(assert (=> b!1387018 (=> (not res!928090) (not e!785652))))

(assert (=> b!1387018 (= res!928090 (not (= startIndex!16 i!1065)))))

(declare-fun res!928084 () Bool)

(assert (=> start!118636 (=> (not res!928084) (not e!785651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118636 (= res!928084 (validMask!0 mask!2987))))

(assert (=> start!118636 e!785651))

(assert (=> start!118636 true))

(declare-fun array_inv!34860 (array!94912) Bool)

(assert (=> start!118636 (array_inv!34860 a!2938)))

(declare-fun b!1387019 () Bool)

(declare-fun lt!609655 () Unit!46367)

(assert (=> b!1387019 (= e!785654 lt!609655)))

(declare-fun lt!609657 () Unit!46367)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46367)

(assert (=> b!1387019 (= lt!609657 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10175 0))(
  ( (MissingZero!10175 (index!43071 (_ BitVec 32))) (Found!10175 (index!43072 (_ BitVec 32))) (Intermediate!10175 (undefined!10987 Bool) (index!43073 (_ BitVec 32)) (x!124680 (_ BitVec 32))) (Undefined!10175) (MissingVacant!10175 (index!43074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94912 (_ BitVec 32)) SeekEntryResult!10175)

(assert (=> b!1387019 (= (seekEntryOrOpen!0 (select (arr!45832 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45832 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94913 (store (arr!45832 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46382 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46367)

(assert (=> b!1387019 (= lt!609655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387019 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387020 () Bool)

(declare-fun res!928089 () Bool)

(assert (=> b!1387020 (=> (not res!928089) (not e!785651))))

(assert (=> b!1387020 (= res!928089 (validKeyInArray!0 (select (arr!45832 a!2938) i!1065)))))

(assert (= (and start!118636 res!928084) b!1387013))

(assert (= (and b!1387013 res!928088) b!1387020))

(assert (= (and b!1387020 res!928089) b!1387012))

(assert (= (and b!1387012 res!928087) b!1387016))

(assert (= (and b!1387016 res!928085) b!1387015))

(assert (= (and b!1387015 res!928086) b!1387018))

(assert (= (and b!1387018 res!928090) b!1387014))

(assert (= (and b!1387018 c!128904) b!1387019))

(assert (= (and b!1387018 (not c!128904)) b!1387017))

(declare-fun m!1272441 () Bool)

(assert (=> b!1387012 m!1272441))

(declare-fun m!1272443 () Bool)

(assert (=> b!1387016 m!1272443))

(declare-fun m!1272445 () Bool)

(assert (=> b!1387014 m!1272445))

(assert (=> b!1387014 m!1272445))

(declare-fun m!1272447 () Bool)

(assert (=> b!1387014 m!1272447))

(declare-fun m!1272449 () Bool)

(assert (=> b!1387019 m!1272449))

(declare-fun m!1272451 () Bool)

(assert (=> b!1387019 m!1272451))

(assert (=> b!1387019 m!1272451))

(declare-fun m!1272453 () Bool)

(assert (=> b!1387019 m!1272453))

(declare-fun m!1272455 () Bool)

(assert (=> b!1387019 m!1272455))

(declare-fun m!1272457 () Bool)

(assert (=> b!1387019 m!1272457))

(assert (=> b!1387019 m!1272445))

(declare-fun m!1272459 () Bool)

(assert (=> b!1387019 m!1272459))

(assert (=> b!1387019 m!1272445))

(declare-fun m!1272461 () Bool)

(assert (=> b!1387019 m!1272461))

(declare-fun m!1272463 () Bool)

(assert (=> start!118636 m!1272463))

(declare-fun m!1272465 () Bool)

(assert (=> start!118636 m!1272465))

(declare-fun m!1272467 () Bool)

(assert (=> b!1387015 m!1272467))

(assert (=> b!1387020 m!1272467))

(assert (=> b!1387020 m!1272467))

(declare-fun m!1272469 () Bool)

(assert (=> b!1387020 m!1272469))

(push 1)

(assert (not b!1387014))

(assert (not b!1387019))

(assert (not b!1387012))

(assert (not start!118636))

(assert (not b!1387020))

(assert (not b!1387016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

