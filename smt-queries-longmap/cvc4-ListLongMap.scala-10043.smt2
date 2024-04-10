; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118366 () Bool)

(assert start!118366)

(declare-fun res!925903 () Bool)

(declare-fun e!784510 () Bool)

(assert (=> start!118366 (=> (not res!925903) (not e!784510))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118366 (= res!925903 (validMask!0 mask!2987))))

(assert (=> start!118366 e!784510))

(assert (=> start!118366 true))

(declare-datatypes ((array!94669 0))(
  ( (array!94670 (arr!45712 (Array (_ BitVec 32) (_ BitVec 64))) (size!46262 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94669)

(declare-fun array_inv!34740 (array!94669) Bool)

(assert (=> start!118366 (array_inv!34740 a!2938)))

(declare-fun b!1384465 () Bool)

(declare-fun res!925899 () Bool)

(assert (=> b!1384465 (=> (not res!925899) (not e!784510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94669 (_ BitVec 32)) Bool)

(assert (=> b!1384465 (= res!925899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384466 () Bool)

(declare-fun res!925901 () Bool)

(assert (=> b!1384466 (=> (not res!925901) (not e!784510))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384466 (= res!925901 (and (not (= (select (arr!45712 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45712 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384467 () Bool)

(declare-fun res!925897 () Bool)

(assert (=> b!1384467 (=> (not res!925897) (not e!784510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384467 (= res!925897 (validKeyInArray!0 (select (arr!45712 a!2938) i!1065)))))

(declare-fun b!1384468 () Bool)

(declare-fun res!925902 () Bool)

(assert (=> b!1384468 (=> (not res!925902) (not e!784510))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384468 (= res!925902 (and (= (size!46262 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46262 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46262 a!2938))))))

(declare-fun b!1384469 () Bool)

(declare-fun e!784508 () Bool)

(assert (=> b!1384469 (= e!784508 (validKeyInArray!0 (select (arr!45712 a!2938) startIndex!16)))))

(declare-fun b!1384470 () Bool)

(assert (=> b!1384470 (= e!784510 false)))

(declare-datatypes ((Unit!46173 0))(
  ( (Unit!46174) )
))
(declare-fun lt!608901 () Unit!46173)

(declare-fun e!784511 () Unit!46173)

(assert (=> b!1384470 (= lt!608901 e!784511)))

(declare-fun c!128724 () Bool)

(assert (=> b!1384470 (= c!128724 e!784508)))

(declare-fun res!925898 () Bool)

(assert (=> b!1384470 (=> (not res!925898) (not e!784508))))

(assert (=> b!1384470 (= res!925898 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384471 () Bool)

(declare-fun res!925900 () Bool)

(assert (=> b!1384471 (=> (not res!925900) (not e!784510))))

(declare-datatypes ((List!32240 0))(
  ( (Nil!32237) (Cons!32236 (h!33445 (_ BitVec 64)) (t!46934 List!32240)) )
))
(declare-fun arrayNoDuplicates!0 (array!94669 (_ BitVec 32) List!32240) Bool)

(assert (=> b!1384471 (= res!925900 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32237))))

(declare-fun b!1384472 () Bool)

(declare-fun lt!608900 () Unit!46173)

(assert (=> b!1384472 (= e!784511 lt!608900)))

(declare-fun lt!608899 () Unit!46173)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46173)

(assert (=> b!1384472 (= lt!608899 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10105 0))(
  ( (MissingZero!10105 (index!42791 (_ BitVec 32))) (Found!10105 (index!42792 (_ BitVec 32))) (Intermediate!10105 (undefined!10917 Bool) (index!42793 (_ BitVec 32)) (x!124290 (_ BitVec 32))) (Undefined!10105) (MissingVacant!10105 (index!42794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94669 (_ BitVec 32)) SeekEntryResult!10105)

(assert (=> b!1384472 (= (seekEntryOrOpen!0 (select (arr!45712 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45712 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94670 (store (arr!45712 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46262 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46173)

(assert (=> b!1384472 (= lt!608900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384472 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384473 () Bool)

(declare-fun Unit!46175 () Unit!46173)

(assert (=> b!1384473 (= e!784511 Unit!46175)))

(assert (= (and start!118366 res!925903) b!1384468))

(assert (= (and b!1384468 res!925902) b!1384467))

(assert (= (and b!1384467 res!925897) b!1384471))

(assert (= (and b!1384471 res!925900) b!1384465))

(assert (= (and b!1384465 res!925899) b!1384466))

(assert (= (and b!1384466 res!925901) b!1384470))

(assert (= (and b!1384470 res!925898) b!1384469))

(assert (= (and b!1384470 c!128724) b!1384472))

(assert (= (and b!1384470 (not c!128724)) b!1384473))

(declare-fun m!1269711 () Bool)

(assert (=> start!118366 m!1269711))

(declare-fun m!1269713 () Bool)

(assert (=> start!118366 m!1269713))

(declare-fun m!1269715 () Bool)

(assert (=> b!1384465 m!1269715))

(declare-fun m!1269717 () Bool)

(assert (=> b!1384466 m!1269717))

(declare-fun m!1269719 () Bool)

(assert (=> b!1384469 m!1269719))

(assert (=> b!1384469 m!1269719))

(declare-fun m!1269721 () Bool)

(assert (=> b!1384469 m!1269721))

(declare-fun m!1269723 () Bool)

(assert (=> b!1384472 m!1269723))

(declare-fun m!1269725 () Bool)

(assert (=> b!1384472 m!1269725))

(assert (=> b!1384472 m!1269725))

(declare-fun m!1269727 () Bool)

(assert (=> b!1384472 m!1269727))

(declare-fun m!1269729 () Bool)

(assert (=> b!1384472 m!1269729))

(declare-fun m!1269731 () Bool)

(assert (=> b!1384472 m!1269731))

(assert (=> b!1384472 m!1269719))

(declare-fun m!1269733 () Bool)

(assert (=> b!1384472 m!1269733))

(assert (=> b!1384472 m!1269719))

(declare-fun m!1269735 () Bool)

(assert (=> b!1384472 m!1269735))

(declare-fun m!1269737 () Bool)

(assert (=> b!1384471 m!1269737))

(assert (=> b!1384467 m!1269717))

(assert (=> b!1384467 m!1269717))

(declare-fun m!1269739 () Bool)

(assert (=> b!1384467 m!1269739))

(push 1)

(assert (not start!118366))

(assert (not b!1384469))

(assert (not b!1384472))

(assert (not b!1384471))

(assert (not b!1384467))

(assert (not b!1384465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

