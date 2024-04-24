; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118824 () Bool)

(assert start!118824)

(declare-fun b!1387996 () Bool)

(declare-fun res!928357 () Bool)

(declare-fun e!786357 () Bool)

(assert (=> b!1387996 (=> (not res!928357) (not e!786357))))

(declare-datatypes ((array!94998 0))(
  ( (array!94999 (arr!45873 (Array (_ BitVec 32) (_ BitVec 64))) (size!46424 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94998)

(declare-datatypes ((List!32388 0))(
  ( (Nil!32385) (Cons!32384 (h!33602 (_ BitVec 64)) (t!47074 List!32388)) )
))
(declare-fun arrayNoDuplicates!0 (array!94998 (_ BitVec 32) List!32388) Bool)

(assert (=> b!1387996 (= res!928357 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32385))))

(declare-fun b!1387997 () Bool)

(declare-datatypes ((Unit!46272 0))(
  ( (Unit!46273) )
))
(declare-fun e!786356 () Unit!46272)

(declare-fun lt!610027 () Unit!46272)

(assert (=> b!1387997 (= e!786356 lt!610027)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!610029 () Unit!46272)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46272)

(assert (=> b!1387997 (= lt!610029 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10120 0))(
  ( (MissingZero!10120 (index!42851 (_ BitVec 32))) (Found!10120 (index!42852 (_ BitVec 32))) (Intermediate!10120 (undefined!10932 Bool) (index!42853 (_ BitVec 32)) (x!124615 (_ BitVec 32))) (Undefined!10120) (MissingVacant!10120 (index!42854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94998 (_ BitVec 32)) SeekEntryResult!10120)

(assert (=> b!1387997 (= (seekEntryOrOpen!0 (select (arr!45873 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45873 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94999 (store (arr!45873 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46424 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46272)

(assert (=> b!1387997 (= lt!610027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94998 (_ BitVec 32)) Bool)

(assert (=> b!1387997 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387998 () Bool)

(declare-fun e!786358 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387998 (= e!786358 (validKeyInArray!0 (select (arr!45873 a!2938) startIndex!16)))))

(declare-fun b!1387999 () Bool)

(declare-fun res!928352 () Bool)

(assert (=> b!1387999 (=> (not res!928352) (not e!786357))))

(assert (=> b!1387999 (= res!928352 (validKeyInArray!0 (select (arr!45873 a!2938) i!1065)))))

(declare-fun res!928353 () Bool)

(assert (=> start!118824 (=> (not res!928353) (not e!786357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118824 (= res!928353 (validMask!0 mask!2987))))

(assert (=> start!118824 e!786357))

(assert (=> start!118824 true))

(declare-fun array_inv!35154 (array!94998) Bool)

(assert (=> start!118824 (array_inv!35154 a!2938)))

(declare-fun b!1388000 () Bool)

(declare-fun res!928354 () Bool)

(assert (=> b!1388000 (=> (not res!928354) (not e!786357))))

(assert (=> b!1388000 (= res!928354 (and (not (= (select (arr!45873 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45873 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388001 () Bool)

(assert (=> b!1388001 (= e!786357 false)))

(declare-fun lt!610028 () Unit!46272)

(assert (=> b!1388001 (= lt!610028 e!786356)))

(declare-fun c!129270 () Bool)

(assert (=> b!1388001 (= c!129270 e!786358)))

(declare-fun res!928356 () Bool)

(assert (=> b!1388001 (=> (not res!928356) (not e!786358))))

(assert (=> b!1388001 (= res!928356 (not (= startIndex!16 i!1065)))))

(declare-fun b!1388002 () Bool)

(declare-fun res!928355 () Bool)

(assert (=> b!1388002 (=> (not res!928355) (not e!786357))))

(assert (=> b!1388002 (= res!928355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388003 () Bool)

(declare-fun Unit!46274 () Unit!46272)

(assert (=> b!1388003 (= e!786356 Unit!46274)))

(declare-fun b!1388004 () Bool)

(declare-fun res!928351 () Bool)

(assert (=> b!1388004 (=> (not res!928351) (not e!786357))))

(assert (=> b!1388004 (= res!928351 (and (= (size!46424 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46424 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46424 a!2938))))))

(assert (= (and start!118824 res!928353) b!1388004))

(assert (= (and b!1388004 res!928351) b!1387999))

(assert (= (and b!1387999 res!928352) b!1387996))

(assert (= (and b!1387996 res!928357) b!1388002))

(assert (= (and b!1388002 res!928355) b!1388000))

(assert (= (and b!1388000 res!928354) b!1388001))

(assert (= (and b!1388001 res!928356) b!1387998))

(assert (= (and b!1388001 c!129270) b!1387997))

(assert (= (and b!1388001 (not c!129270)) b!1388003))

(declare-fun m!1273713 () Bool)

(assert (=> b!1388000 m!1273713))

(declare-fun m!1273715 () Bool)

(assert (=> b!1387997 m!1273715))

(declare-fun m!1273717 () Bool)

(assert (=> b!1387997 m!1273717))

(assert (=> b!1387997 m!1273717))

(declare-fun m!1273719 () Bool)

(assert (=> b!1387997 m!1273719))

(declare-fun m!1273721 () Bool)

(assert (=> b!1387997 m!1273721))

(declare-fun m!1273723 () Bool)

(assert (=> b!1387997 m!1273723))

(declare-fun m!1273725 () Bool)

(assert (=> b!1387997 m!1273725))

(declare-fun m!1273727 () Bool)

(assert (=> b!1387997 m!1273727))

(assert (=> b!1387997 m!1273725))

(declare-fun m!1273729 () Bool)

(assert (=> b!1387997 m!1273729))

(declare-fun m!1273731 () Bool)

(assert (=> b!1387996 m!1273731))

(assert (=> b!1387999 m!1273713))

(assert (=> b!1387999 m!1273713))

(declare-fun m!1273733 () Bool)

(assert (=> b!1387999 m!1273733))

(declare-fun m!1273735 () Bool)

(assert (=> start!118824 m!1273735))

(declare-fun m!1273737 () Bool)

(assert (=> start!118824 m!1273737))

(declare-fun m!1273739 () Bool)

(assert (=> b!1388002 m!1273739))

(assert (=> b!1387998 m!1273725))

(assert (=> b!1387998 m!1273725))

(declare-fun m!1273741 () Bool)

(assert (=> b!1387998 m!1273741))

(push 1)

(assert (not b!1388002))

(assert (not b!1387999))

(assert (not b!1387998))

(assert (not start!118824))

(assert (not b!1387997))

(assert (not b!1387996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

