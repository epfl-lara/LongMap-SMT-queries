; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120504 () Bool)

(assert start!120504)

(declare-fun b!1403141 () Bool)

(declare-fun res!941709 () Bool)

(declare-fun e!794498 () Bool)

(assert (=> b!1403141 (=> (not res!941709) (not e!794498))))

(declare-datatypes ((array!95866 0))(
  ( (array!95867 (arr!46284 (Array (_ BitVec 32) (_ BitVec 64))) (size!46836 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95866)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1403141 (= res!941709 (and (= (size!46836 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46836 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46836 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403142 () Bool)

(declare-fun res!941704 () Bool)

(assert (=> b!1403142 (=> (not res!941704) (not e!794498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95866 (_ BitVec 32)) Bool)

(assert (=> b!1403142 (= res!941704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403143 () Bool)

(declare-fun e!794496 () Bool)

(assert (=> b!1403143 (= e!794498 (not e!794496))))

(declare-fun res!941706 () Bool)

(assert (=> b!1403143 (=> res!941706 e!794496)))

(declare-datatypes ((SeekEntryResult!10627 0))(
  ( (MissingZero!10627 (index!44885 (_ BitVec 32))) (Found!10627 (index!44886 (_ BitVec 32))) (Intermediate!10627 (undefined!11439 Bool) (index!44887 (_ BitVec 32)) (x!126491 (_ BitVec 32))) (Undefined!10627) (MissingVacant!10627 (index!44888 (_ BitVec 32))) )
))
(declare-fun lt!618130 () SeekEntryResult!10627)

(assert (=> b!1403143 (= res!941706 (or (not (is-Intermediate!10627 lt!618130)) (undefined!11439 lt!618130)))))

(declare-fun e!794495 () Bool)

(assert (=> b!1403143 e!794495))

(declare-fun res!941710 () Bool)

(assert (=> b!1403143 (=> (not res!941710) (not e!794495))))

(assert (=> b!1403143 (= res!941710 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47101 0))(
  ( (Unit!47102) )
))
(declare-fun lt!618129 () Unit!47101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47101)

(assert (=> b!1403143 (= lt!618129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95866 (_ BitVec 32)) SeekEntryResult!10627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403143 (= lt!618130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46284 a!2901) j!112) mask!2840) (select (arr!46284 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403144 () Bool)

(declare-fun res!941707 () Bool)

(assert (=> b!1403144 (=> (not res!941707) (not e!794498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403144 (= res!941707 (validKeyInArray!0 (select (arr!46284 a!2901) j!112)))))

(declare-fun b!1403145 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95866 (_ BitVec 32)) SeekEntryResult!10627)

(assert (=> b!1403145 (= e!794495 (= (seekEntryOrOpen!0 (select (arr!46284 a!2901) j!112) a!2901 mask!2840) (Found!10627 j!112)))))

(declare-fun b!1403147 () Bool)

(declare-fun res!941703 () Bool)

(assert (=> b!1403147 (=> (not res!941703) (not e!794498))))

(assert (=> b!1403147 (= res!941703 (validKeyInArray!0 (select (arr!46284 a!2901) i!1037)))))

(declare-fun b!1403148 () Bool)

(assert (=> b!1403148 (= e!794496 true)))

(declare-fun lt!618131 () SeekEntryResult!10627)

(assert (=> b!1403148 (= lt!618131 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95867 (store (arr!46284 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46836 a!2901)) mask!2840))))

(declare-fun b!1403146 () Bool)

(declare-fun res!941705 () Bool)

(assert (=> b!1403146 (=> (not res!941705) (not e!794498))))

(declare-datatypes ((List!32881 0))(
  ( (Nil!32878) (Cons!32877 (h!34125 (_ BitVec 64)) (t!47567 List!32881)) )
))
(declare-fun arrayNoDuplicates!0 (array!95866 (_ BitVec 32) List!32881) Bool)

(assert (=> b!1403146 (= res!941705 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32878))))

(declare-fun res!941708 () Bool)

(assert (=> start!120504 (=> (not res!941708) (not e!794498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120504 (= res!941708 (validMask!0 mask!2840))))

(assert (=> start!120504 e!794498))

(assert (=> start!120504 true))

(declare-fun array_inv!35517 (array!95866) Bool)

(assert (=> start!120504 (array_inv!35517 a!2901)))

(assert (= (and start!120504 res!941708) b!1403141))

(assert (= (and b!1403141 res!941709) b!1403147))

(assert (= (and b!1403147 res!941703) b!1403144))

(assert (= (and b!1403144 res!941707) b!1403142))

(assert (= (and b!1403142 res!941704) b!1403146))

(assert (= (and b!1403146 res!941705) b!1403143))

(assert (= (and b!1403143 res!941710) b!1403145))

(assert (= (and b!1403143 (not res!941706)) b!1403148))

(declare-fun m!1291233 () Bool)

(assert (=> b!1403146 m!1291233))

(declare-fun m!1291235 () Bool)

(assert (=> b!1403148 m!1291235))

(declare-fun m!1291237 () Bool)

(assert (=> b!1403148 m!1291237))

(assert (=> b!1403148 m!1291237))

(declare-fun m!1291239 () Bool)

(assert (=> b!1403148 m!1291239))

(assert (=> b!1403148 m!1291239))

(assert (=> b!1403148 m!1291237))

(declare-fun m!1291241 () Bool)

(assert (=> b!1403148 m!1291241))

(declare-fun m!1291243 () Bool)

(assert (=> b!1403143 m!1291243))

(declare-fun m!1291245 () Bool)

(assert (=> b!1403143 m!1291245))

(assert (=> b!1403143 m!1291243))

(declare-fun m!1291247 () Bool)

(assert (=> b!1403143 m!1291247))

(assert (=> b!1403143 m!1291245))

(assert (=> b!1403143 m!1291243))

(declare-fun m!1291249 () Bool)

(assert (=> b!1403143 m!1291249))

(declare-fun m!1291251 () Bool)

(assert (=> b!1403143 m!1291251))

(assert (=> b!1403145 m!1291243))

(assert (=> b!1403145 m!1291243))

(declare-fun m!1291253 () Bool)

(assert (=> b!1403145 m!1291253))

(declare-fun m!1291255 () Bool)

(assert (=> start!120504 m!1291255))

(declare-fun m!1291257 () Bool)

(assert (=> start!120504 m!1291257))

(assert (=> b!1403144 m!1291243))

(assert (=> b!1403144 m!1291243))

(declare-fun m!1291259 () Bool)

(assert (=> b!1403144 m!1291259))

(declare-fun m!1291261 () Bool)

(assert (=> b!1403142 m!1291261))

(declare-fun m!1291263 () Bool)

(assert (=> b!1403147 m!1291263))

(assert (=> b!1403147 m!1291263))

(declare-fun m!1291265 () Bool)

(assert (=> b!1403147 m!1291265))

(push 1)

(assert (not start!120504))

(assert (not b!1403144))

(assert (not b!1403148))

(assert (not b!1403142))

(assert (not b!1403143))

(assert (not b!1403147))

(assert (not b!1403146))

(assert (not b!1403145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

