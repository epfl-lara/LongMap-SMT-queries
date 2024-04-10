; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120444 () Bool)

(assert start!120444)

(declare-fun b!1402323 () Bool)

(declare-fun e!794083 () Bool)

(declare-fun e!794081 () Bool)

(assert (=> b!1402323 (= e!794083 e!794081)))

(declare-fun res!940843 () Bool)

(assert (=> b!1402323 (=> res!940843 e!794081)))

(declare-datatypes ((SeekEntryResult!10594 0))(
  ( (MissingZero!10594 (index!44753 (_ BitVec 32))) (Found!10594 (index!44754 (_ BitVec 32))) (Intermediate!10594 (undefined!11406 Bool) (index!44755 (_ BitVec 32)) (x!126381 (_ BitVec 32))) (Undefined!10594) (MissingVacant!10594 (index!44756 (_ BitVec 32))) )
))
(declare-fun lt!617606 () SeekEntryResult!10594)

(declare-fun lt!617610 () SeekEntryResult!10594)

(assert (=> b!1402323 (= res!940843 (or (= lt!617606 lt!617610) (not (is-Intermediate!10594 lt!617610))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617612 () (_ BitVec 64))

(declare-datatypes ((array!95853 0))(
  ( (array!95854 (arr!46277 (Array (_ BitVec 32) (_ BitVec 64))) (size!46827 (_ BitVec 32))) )
))
(declare-fun lt!617609 () array!95853)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95853 (_ BitVec 32)) SeekEntryResult!10594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402323 (= lt!617610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617612 mask!2840) lt!617612 lt!617609 mask!2840))))

(declare-fun a!2901 () array!95853)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402323 (= lt!617612 (select (store (arr!46277 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402323 (= lt!617609 (array!95854 (store (arr!46277 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46827 a!2901)))))

(declare-fun res!940835 () Bool)

(declare-fun e!794080 () Bool)

(assert (=> start!120444 (=> (not res!940835) (not e!794080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120444 (= res!940835 (validMask!0 mask!2840))))

(assert (=> start!120444 e!794080))

(assert (=> start!120444 true))

(declare-fun array_inv!35305 (array!95853) Bool)

(assert (=> start!120444 (array_inv!35305 a!2901)))

(declare-fun b!1402324 () Bool)

(declare-fun res!940842 () Bool)

(assert (=> b!1402324 (=> (not res!940842) (not e!794080))))

(declare-datatypes ((List!32796 0))(
  ( (Nil!32793) (Cons!32792 (h!34040 (_ BitVec 64)) (t!47490 List!32796)) )
))
(declare-fun arrayNoDuplicates!0 (array!95853 (_ BitVec 32) List!32796) Bool)

(assert (=> b!1402324 (= res!940842 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32793))))

(declare-fun b!1402325 () Bool)

(declare-fun e!794082 () Bool)

(assert (=> b!1402325 (= e!794082 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!617607 () SeekEntryResult!10594)

(declare-fun lt!617604 () SeekEntryResult!10594)

(assert (=> b!1402325 (= lt!617607 lt!617604)))

(declare-datatypes ((Unit!47192 0))(
  ( (Unit!47193) )
))
(declare-fun lt!617608 () Unit!47192)

(declare-fun lt!617605 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47192)

(assert (=> b!1402325 (= lt!617608 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617605 (x!126381 lt!617606) (index!44755 lt!617606) (x!126381 lt!617610) (index!44755 lt!617610) mask!2840))))

(declare-fun b!1402326 () Bool)

(declare-fun res!940839 () Bool)

(assert (=> b!1402326 (=> (not res!940839) (not e!794080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95853 (_ BitVec 32)) Bool)

(assert (=> b!1402326 (= res!940839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402327 () Bool)

(declare-fun res!940840 () Bool)

(assert (=> b!1402327 (=> res!940840 e!794082)))

(assert (=> b!1402327 (= res!940840 (not (= lt!617610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617605 lt!617612 lt!617609 mask!2840))))))

(declare-fun b!1402328 () Bool)

(assert (=> b!1402328 (= e!794080 (not e!794083))))

(declare-fun res!940834 () Bool)

(assert (=> b!1402328 (=> res!940834 e!794083)))

(assert (=> b!1402328 (= res!940834 (or (not (is-Intermediate!10594 lt!617606)) (undefined!11406 lt!617606)))))

(assert (=> b!1402328 (= lt!617607 (Found!10594 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95853 (_ BitVec 32)) SeekEntryResult!10594)

(assert (=> b!1402328 (= lt!617607 (seekEntryOrOpen!0 (select (arr!46277 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402328 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617613 () Unit!47192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47192)

(assert (=> b!1402328 (= lt!617613 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402328 (= lt!617606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617605 (select (arr!46277 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402328 (= lt!617605 (toIndex!0 (select (arr!46277 a!2901) j!112) mask!2840))))

(declare-fun b!1402329 () Bool)

(declare-fun res!940837 () Bool)

(assert (=> b!1402329 (=> (not res!940837) (not e!794080))))

(assert (=> b!1402329 (= res!940837 (and (= (size!46827 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46827 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46827 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402330 () Bool)

(declare-fun res!940838 () Bool)

(assert (=> b!1402330 (=> (not res!940838) (not e!794080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402330 (= res!940838 (validKeyInArray!0 (select (arr!46277 a!2901) j!112)))))

(declare-fun b!1402331 () Bool)

(assert (=> b!1402331 (= e!794081 e!794082)))

(declare-fun res!940841 () Bool)

(assert (=> b!1402331 (=> res!940841 e!794082)))

(assert (=> b!1402331 (= res!940841 (or (bvslt (x!126381 lt!617606) #b00000000000000000000000000000000) (bvsgt (x!126381 lt!617606) #b01111111111111111111111111111110) (bvslt (x!126381 lt!617610) #b00000000000000000000000000000000) (bvsgt (x!126381 lt!617610) #b01111111111111111111111111111110) (bvslt lt!617605 #b00000000000000000000000000000000) (bvsge lt!617605 (size!46827 a!2901)) (bvslt (index!44755 lt!617606) #b00000000000000000000000000000000) (bvsge (index!44755 lt!617606) (size!46827 a!2901)) (bvslt (index!44755 lt!617610) #b00000000000000000000000000000000) (bvsge (index!44755 lt!617610) (size!46827 a!2901)) (not (= lt!617606 (Intermediate!10594 false (index!44755 lt!617606) (x!126381 lt!617606)))) (not (= lt!617610 (Intermediate!10594 false (index!44755 lt!617610) (x!126381 lt!617610))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95853 (_ BitVec 32)) SeekEntryResult!10594)

(assert (=> b!1402331 (= lt!617604 (seekKeyOrZeroReturnVacant!0 (x!126381 lt!617610) (index!44755 lt!617610) (index!44755 lt!617610) (select (arr!46277 a!2901) j!112) lt!617609 mask!2840))))

(assert (=> b!1402331 (= lt!617604 (seekEntryOrOpen!0 lt!617612 lt!617609 mask!2840))))

(assert (=> b!1402331 (and (not (undefined!11406 lt!617610)) (= (index!44755 lt!617610) i!1037) (bvslt (x!126381 lt!617610) (x!126381 lt!617606)) (= (select (store (arr!46277 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44755 lt!617610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617611 () Unit!47192)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47192)

(assert (=> b!1402331 (= lt!617611 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617605 (x!126381 lt!617606) (index!44755 lt!617606) (x!126381 lt!617610) (index!44755 lt!617610) (undefined!11406 lt!617610) mask!2840))))

(declare-fun b!1402332 () Bool)

(declare-fun res!940836 () Bool)

(assert (=> b!1402332 (=> (not res!940836) (not e!794080))))

(assert (=> b!1402332 (= res!940836 (validKeyInArray!0 (select (arr!46277 a!2901) i!1037)))))

(assert (= (and start!120444 res!940835) b!1402329))

(assert (= (and b!1402329 res!940837) b!1402332))

(assert (= (and b!1402332 res!940836) b!1402330))

(assert (= (and b!1402330 res!940838) b!1402326))

(assert (= (and b!1402326 res!940839) b!1402324))

(assert (= (and b!1402324 res!940842) b!1402328))

(assert (= (and b!1402328 (not res!940834)) b!1402323))

(assert (= (and b!1402323 (not res!940843)) b!1402331))

(assert (= (and b!1402331 (not res!940841)) b!1402327))

(assert (= (and b!1402327 (not res!940840)) b!1402325))

(declare-fun m!1290423 () Bool)

(assert (=> b!1402326 m!1290423))

(declare-fun m!1290425 () Bool)

(assert (=> b!1402332 m!1290425))

(assert (=> b!1402332 m!1290425))

(declare-fun m!1290427 () Bool)

(assert (=> b!1402332 m!1290427))

(declare-fun m!1290429 () Bool)

(assert (=> b!1402327 m!1290429))

(declare-fun m!1290431 () Bool)

(assert (=> b!1402328 m!1290431))

(declare-fun m!1290433 () Bool)

(assert (=> b!1402328 m!1290433))

(assert (=> b!1402328 m!1290431))

(assert (=> b!1402328 m!1290431))

(declare-fun m!1290435 () Bool)

(assert (=> b!1402328 m!1290435))

(declare-fun m!1290437 () Bool)

(assert (=> b!1402328 m!1290437))

(assert (=> b!1402328 m!1290431))

(declare-fun m!1290439 () Bool)

(assert (=> b!1402328 m!1290439))

(declare-fun m!1290441 () Bool)

(assert (=> b!1402328 m!1290441))

(assert (=> b!1402330 m!1290431))

(assert (=> b!1402330 m!1290431))

(declare-fun m!1290443 () Bool)

(assert (=> b!1402330 m!1290443))

(declare-fun m!1290445 () Bool)

(assert (=> start!120444 m!1290445))

(declare-fun m!1290447 () Bool)

(assert (=> start!120444 m!1290447))

(declare-fun m!1290449 () Bool)

(assert (=> b!1402325 m!1290449))

(declare-fun m!1290451 () Bool)

(assert (=> b!1402324 m!1290451))

(declare-fun m!1290453 () Bool)

(assert (=> b!1402331 m!1290453))

(assert (=> b!1402331 m!1290431))

(declare-fun m!1290455 () Bool)

(assert (=> b!1402331 m!1290455))

(assert (=> b!1402331 m!1290431))

(declare-fun m!1290457 () Bool)

(assert (=> b!1402331 m!1290457))

(declare-fun m!1290459 () Bool)

(assert (=> b!1402331 m!1290459))

(declare-fun m!1290461 () Bool)

(assert (=> b!1402331 m!1290461))

(declare-fun m!1290463 () Bool)

(assert (=> b!1402323 m!1290463))

(assert (=> b!1402323 m!1290463))

(declare-fun m!1290465 () Bool)

(assert (=> b!1402323 m!1290465))

(assert (=> b!1402323 m!1290459))

(declare-fun m!1290467 () Bool)

(assert (=> b!1402323 m!1290467))

(push 1)

