; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120024 () Bool)

(assert start!120024)

(declare-fun b!1397257 () Bool)

(declare-fun res!936224 () Bool)

(declare-fun e!791039 () Bool)

(assert (=> b!1397257 (=> (not res!936224) (not e!791039))))

(declare-datatypes ((array!95506 0))(
  ( (array!95507 (arr!46107 (Array (_ BitVec 32) (_ BitVec 64))) (size!46659 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95506)

(declare-datatypes ((List!32704 0))(
  ( (Nil!32701) (Cons!32700 (h!33942 (_ BitVec 64)) (t!47390 List!32704)) )
))
(declare-fun arrayNoDuplicates!0 (array!95506 (_ BitVec 32) List!32704) Bool)

(assert (=> b!1397257 (= res!936224 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32701))))

(declare-fun b!1397258 () Bool)

(declare-fun res!936229 () Bool)

(assert (=> b!1397258 (=> (not res!936229) (not e!791039))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397258 (= res!936229 (validKeyInArray!0 (select (arr!46107 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1397259 () Bool)

(declare-fun e!791035 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10450 0))(
  ( (MissingZero!10450 (index!44171 (_ BitVec 32))) (Found!10450 (index!44172 (_ BitVec 32))) (Intermediate!10450 (undefined!11262 Bool) (index!44173 (_ BitVec 32)) (x!125821 (_ BitVec 32))) (Undefined!10450) (MissingVacant!10450 (index!44174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95506 (_ BitVec 32)) SeekEntryResult!10450)

(assert (=> b!1397259 (= e!791035 (= (seekEntryOrOpen!0 (select (arr!46107 a!2901) j!112) a!2901 mask!2840) (Found!10450 j!112)))))

(declare-fun res!936227 () Bool)

(assert (=> start!120024 (=> (not res!936227) (not e!791039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120024 (= res!936227 (validMask!0 mask!2840))))

(assert (=> start!120024 e!791039))

(assert (=> start!120024 true))

(declare-fun array_inv!35340 (array!95506) Bool)

(assert (=> start!120024 (array_inv!35340 a!2901)))

(declare-fun b!1397260 () Bool)

(declare-fun e!791037 () Bool)

(assert (=> b!1397260 (= e!791037 true)))

(declare-fun lt!613937 () (_ BitVec 32))

(declare-fun lt!613940 () (_ BitVec 64))

(declare-fun lt!613939 () array!95506)

(declare-fun lt!613938 () SeekEntryResult!10450)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95506 (_ BitVec 32)) SeekEntryResult!10450)

(assert (=> b!1397260 (= lt!613938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613937 lt!613940 lt!613939 mask!2840))))

(declare-fun b!1397261 () Bool)

(declare-fun res!936225 () Bool)

(assert (=> b!1397261 (=> (not res!936225) (not e!791039))))

(assert (=> b!1397261 (= res!936225 (validKeyInArray!0 (select (arr!46107 a!2901) j!112)))))

(declare-fun b!1397262 () Bool)

(declare-fun e!791036 () Bool)

(assert (=> b!1397262 (= e!791036 e!791037)))

(declare-fun res!936226 () Bool)

(assert (=> b!1397262 (=> res!936226 e!791037)))

(declare-fun lt!613936 () SeekEntryResult!10450)

(declare-fun lt!613935 () SeekEntryResult!10450)

(assert (=> b!1397262 (= res!936226 (or (= lt!613935 lt!613936) (not (is-Intermediate!10450 lt!613936)) (bvslt (x!125821 lt!613935) #b00000000000000000000000000000000) (bvsgt (x!125821 lt!613935) #b01111111111111111111111111111110) (bvslt lt!613937 #b00000000000000000000000000000000) (bvsge lt!613937 (size!46659 a!2901)) (bvslt (index!44173 lt!613935) #b00000000000000000000000000000000) (bvsge (index!44173 lt!613935) (size!46659 a!2901)) (not (= lt!613935 (Intermediate!10450 false (index!44173 lt!613935) (x!125821 lt!613935)))) (not (= lt!613936 (Intermediate!10450 (undefined!11262 lt!613936) (index!44173 lt!613936) (x!125821 lt!613936))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397262 (= lt!613936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613940 mask!2840) lt!613940 lt!613939 mask!2840))))

(assert (=> b!1397262 (= lt!613940 (select (store (arr!46107 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397262 (= lt!613939 (array!95507 (store (arr!46107 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46659 a!2901)))))

(declare-fun b!1397263 () Bool)

(declare-fun res!936223 () Bool)

(assert (=> b!1397263 (=> (not res!936223) (not e!791039))))

(assert (=> b!1397263 (= res!936223 (and (= (size!46659 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46659 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46659 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397264 () Bool)

(declare-fun res!936228 () Bool)

(assert (=> b!1397264 (=> (not res!936228) (not e!791039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95506 (_ BitVec 32)) Bool)

(assert (=> b!1397264 (= res!936228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397265 () Bool)

(assert (=> b!1397265 (= e!791039 (not e!791036))))

(declare-fun res!936221 () Bool)

(assert (=> b!1397265 (=> res!936221 e!791036)))

(assert (=> b!1397265 (= res!936221 (or (not (is-Intermediate!10450 lt!613935)) (undefined!11262 lt!613935)))))

(assert (=> b!1397265 e!791035))

(declare-fun res!936222 () Bool)

(assert (=> b!1397265 (=> (not res!936222) (not e!791035))))

(assert (=> b!1397265 (= res!936222 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46747 0))(
  ( (Unit!46748) )
))
(declare-fun lt!613934 () Unit!46747)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46747)

(assert (=> b!1397265 (= lt!613934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397265 (= lt!613935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613937 (select (arr!46107 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397265 (= lt!613937 (toIndex!0 (select (arr!46107 a!2901) j!112) mask!2840))))

(assert (= (and start!120024 res!936227) b!1397263))

(assert (= (and b!1397263 res!936223) b!1397258))

(assert (= (and b!1397258 res!936229) b!1397261))

(assert (= (and b!1397261 res!936225) b!1397264))

(assert (= (and b!1397264 res!936228) b!1397257))

(assert (= (and b!1397257 res!936224) b!1397265))

(assert (= (and b!1397265 res!936222) b!1397259))

(assert (= (and b!1397265 (not res!936221)) b!1397262))

(assert (= (and b!1397262 (not res!936226)) b!1397260))

(declare-fun m!1283539 () Bool)

(assert (=> b!1397260 m!1283539))

(declare-fun m!1283541 () Bool)

(assert (=> start!120024 m!1283541))

(declare-fun m!1283543 () Bool)

(assert (=> start!120024 m!1283543))

(declare-fun m!1283545 () Bool)

(assert (=> b!1397258 m!1283545))

(assert (=> b!1397258 m!1283545))

(declare-fun m!1283547 () Bool)

(assert (=> b!1397258 m!1283547))

(declare-fun m!1283549 () Bool)

(assert (=> b!1397259 m!1283549))

(assert (=> b!1397259 m!1283549))

(declare-fun m!1283551 () Bool)

(assert (=> b!1397259 m!1283551))

(declare-fun m!1283553 () Bool)

(assert (=> b!1397264 m!1283553))

(declare-fun m!1283555 () Bool)

(assert (=> b!1397257 m!1283555))

(declare-fun m!1283557 () Bool)

(assert (=> b!1397262 m!1283557))

(assert (=> b!1397262 m!1283557))

(declare-fun m!1283559 () Bool)

(assert (=> b!1397262 m!1283559))

(declare-fun m!1283561 () Bool)

(assert (=> b!1397262 m!1283561))

(declare-fun m!1283563 () Bool)

(assert (=> b!1397262 m!1283563))

(assert (=> b!1397265 m!1283549))

(declare-fun m!1283565 () Bool)

(assert (=> b!1397265 m!1283565))

(assert (=> b!1397265 m!1283549))

(assert (=> b!1397265 m!1283549))

(declare-fun m!1283567 () Bool)

(assert (=> b!1397265 m!1283567))

(declare-fun m!1283569 () Bool)

(assert (=> b!1397265 m!1283569))

(declare-fun m!1283571 () Bool)

(assert (=> b!1397265 m!1283571))

(assert (=> b!1397261 m!1283549))

(assert (=> b!1397261 m!1283549))

(declare-fun m!1283573 () Bool)

(assert (=> b!1397261 m!1283573))

(push 1)

(assert (not b!1397264))

(assert (not b!1397257))

(assert (not b!1397261))

(assert (not b!1397258))

(assert (not b!1397262))

(assert (not b!1397259))

(assert (not b!1397260))

(assert (not b!1397265))

(assert (not start!120024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

