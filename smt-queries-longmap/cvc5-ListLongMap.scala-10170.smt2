; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119892 () Bool)

(assert start!119892)

(declare-fun b!1395992 () Bool)

(declare-fun res!935074 () Bool)

(declare-fun e!790319 () Bool)

(assert (=> b!1395992 (=> (not res!935074) (not e!790319))))

(declare-datatypes ((array!95472 0))(
  ( (array!95473 (arr!46091 (Array (_ BitVec 32) (_ BitVec 64))) (size!46641 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95472)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395992 (= res!935074 (validKeyInArray!0 (select (arr!46091 a!2901) i!1037)))))

(declare-fun res!935071 () Bool)

(assert (=> start!119892 (=> (not res!935071) (not e!790319))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119892 (= res!935071 (validMask!0 mask!2840))))

(assert (=> start!119892 e!790319))

(assert (=> start!119892 true))

(declare-fun array_inv!35119 (array!95472) Bool)

(assert (=> start!119892 (array_inv!35119 a!2901)))

(declare-fun b!1395993 () Bool)

(declare-fun res!935072 () Bool)

(assert (=> b!1395993 (=> (not res!935072) (not e!790319))))

(declare-datatypes ((List!32610 0))(
  ( (Nil!32607) (Cons!32606 (h!33845 (_ BitVec 64)) (t!47304 List!32610)) )
))
(declare-fun arrayNoDuplicates!0 (array!95472 (_ BitVec 32) List!32610) Bool)

(assert (=> b!1395993 (= res!935072 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32607))))

(declare-fun b!1395994 () Bool)

(declare-fun e!790316 () Bool)

(assert (=> b!1395994 (= e!790319 (not e!790316))))

(declare-fun res!935070 () Bool)

(assert (=> b!1395994 (=> res!935070 e!790316)))

(declare-datatypes ((SeekEntryResult!10408 0))(
  ( (MissingZero!10408 (index!44003 (_ BitVec 32))) (Found!10408 (index!44004 (_ BitVec 32))) (Intermediate!10408 (undefined!11220 Bool) (index!44005 (_ BitVec 32)) (x!125672 (_ BitVec 32))) (Undefined!10408) (MissingVacant!10408 (index!44006 (_ BitVec 32))) )
))
(declare-fun lt!613208 () SeekEntryResult!10408)

(assert (=> b!1395994 (= res!935070 (or (not (is-Intermediate!10408 lt!613208)) (undefined!11220 lt!613208)))))

(declare-fun e!790317 () Bool)

(assert (=> b!1395994 e!790317))

(declare-fun res!935076 () Bool)

(assert (=> b!1395994 (=> (not res!935076) (not e!790317))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95472 (_ BitVec 32)) Bool)

(assert (=> b!1395994 (= res!935076 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46820 0))(
  ( (Unit!46821) )
))
(declare-fun lt!613207 () Unit!46820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46820)

(assert (=> b!1395994 (= lt!613207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395994 (= lt!613208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46091 a!2901) j!112) mask!2840) (select (arr!46091 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395995 () Bool)

(declare-fun res!935073 () Bool)

(assert (=> b!1395995 (=> (not res!935073) (not e!790319))))

(assert (=> b!1395995 (= res!935073 (and (= (size!46641 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46641 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46641 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395996 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95472 (_ BitVec 32)) SeekEntryResult!10408)

(assert (=> b!1395996 (= e!790317 (= (seekEntryOrOpen!0 (select (arr!46091 a!2901) j!112) a!2901 mask!2840) (Found!10408 j!112)))))

(declare-fun b!1395997 () Bool)

(declare-fun res!935075 () Bool)

(assert (=> b!1395997 (=> (not res!935075) (not e!790319))))

(assert (=> b!1395997 (= res!935075 (validKeyInArray!0 (select (arr!46091 a!2901) j!112)))))

(declare-fun b!1395998 () Bool)

(declare-fun res!935077 () Bool)

(assert (=> b!1395998 (=> (not res!935077) (not e!790319))))

(assert (=> b!1395998 (= res!935077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395999 () Bool)

(declare-fun lt!613209 () SeekEntryResult!10408)

(assert (=> b!1395999 (= e!790316 (or (= lt!613208 lt!613209) (not (is-Intermediate!10408 lt!613209)) (bvsge mask!2840 #b00000000000000000000000000000000)))))

(assert (=> b!1395999 (= lt!613209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46091 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46091 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95473 (store (arr!46091 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46641 a!2901)) mask!2840))))

(assert (= (and start!119892 res!935071) b!1395995))

(assert (= (and b!1395995 res!935073) b!1395992))

(assert (= (and b!1395992 res!935074) b!1395997))

(assert (= (and b!1395997 res!935075) b!1395998))

(assert (= (and b!1395998 res!935077) b!1395993))

(assert (= (and b!1395993 res!935072) b!1395994))

(assert (= (and b!1395994 res!935076) b!1395996))

(assert (= (and b!1395994 (not res!935070)) b!1395999))

(declare-fun m!1282461 () Bool)

(assert (=> b!1395992 m!1282461))

(assert (=> b!1395992 m!1282461))

(declare-fun m!1282463 () Bool)

(assert (=> b!1395992 m!1282463))

(declare-fun m!1282465 () Bool)

(assert (=> b!1395997 m!1282465))

(assert (=> b!1395997 m!1282465))

(declare-fun m!1282467 () Bool)

(assert (=> b!1395997 m!1282467))

(declare-fun m!1282469 () Bool)

(assert (=> b!1395998 m!1282469))

(declare-fun m!1282471 () Bool)

(assert (=> b!1395993 m!1282471))

(declare-fun m!1282473 () Bool)

(assert (=> start!119892 m!1282473))

(declare-fun m!1282475 () Bool)

(assert (=> start!119892 m!1282475))

(assert (=> b!1395996 m!1282465))

(assert (=> b!1395996 m!1282465))

(declare-fun m!1282477 () Bool)

(assert (=> b!1395996 m!1282477))

(declare-fun m!1282479 () Bool)

(assert (=> b!1395999 m!1282479))

(declare-fun m!1282481 () Bool)

(assert (=> b!1395999 m!1282481))

(assert (=> b!1395999 m!1282481))

(declare-fun m!1282483 () Bool)

(assert (=> b!1395999 m!1282483))

(assert (=> b!1395999 m!1282483))

(assert (=> b!1395999 m!1282481))

(declare-fun m!1282485 () Bool)

(assert (=> b!1395999 m!1282485))

(assert (=> b!1395994 m!1282465))

(declare-fun m!1282487 () Bool)

(assert (=> b!1395994 m!1282487))

(assert (=> b!1395994 m!1282465))

(declare-fun m!1282489 () Bool)

(assert (=> b!1395994 m!1282489))

(assert (=> b!1395994 m!1282487))

(assert (=> b!1395994 m!1282465))

(declare-fun m!1282491 () Bool)

(assert (=> b!1395994 m!1282491))

(declare-fun m!1282493 () Bool)

(assert (=> b!1395994 m!1282493))

(push 1)

