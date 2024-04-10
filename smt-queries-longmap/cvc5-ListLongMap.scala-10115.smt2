; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119184 () Bool)

(assert start!119184)

(declare-fun b!1390308 () Bool)

(declare-fun res!930471 () Bool)

(declare-fun e!787364 () Bool)

(assert (=> b!1390308 (=> (not res!930471) (not e!787364))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95121 0))(
  ( (array!95122 (arr!45926 (Array (_ BitVec 32) (_ BitVec 64))) (size!46476 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95121)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390308 (= res!930471 (and (= (size!46476 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46476 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46476 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390310 () Bool)

(assert (=> b!1390310 (= e!787364 (not true))))

(declare-fun e!787362 () Bool)

(assert (=> b!1390310 e!787362))

(declare-fun res!930469 () Bool)

(assert (=> b!1390310 (=> (not res!930469) (not e!787362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95121 (_ BitVec 32)) Bool)

(assert (=> b!1390310 (= res!930469 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46490 0))(
  ( (Unit!46491) )
))
(declare-fun lt!610788 () Unit!46490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46490)

(assert (=> b!1390310 (= lt!610788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10243 0))(
  ( (MissingZero!10243 (index!43343 (_ BitVec 32))) (Found!10243 (index!43344 (_ BitVec 32))) (Intermediate!10243 (undefined!11055 Bool) (index!43345 (_ BitVec 32)) (x!125025 (_ BitVec 32))) (Undefined!10243) (MissingVacant!10243 (index!43346 (_ BitVec 32))) )
))
(declare-fun lt!610787 () SeekEntryResult!10243)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95121 (_ BitVec 32)) SeekEntryResult!10243)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390310 (= lt!610787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45926 a!2901) j!112) mask!2840) (select (arr!45926 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930473 () Bool)

(assert (=> start!119184 (=> (not res!930473) (not e!787364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119184 (= res!930473 (validMask!0 mask!2840))))

(assert (=> start!119184 e!787364))

(assert (=> start!119184 true))

(declare-fun array_inv!34954 (array!95121) Bool)

(assert (=> start!119184 (array_inv!34954 a!2901)))

(declare-fun b!1390309 () Bool)

(declare-fun res!930472 () Bool)

(assert (=> b!1390309 (=> (not res!930472) (not e!787364))))

(assert (=> b!1390309 (= res!930472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390311 () Bool)

(declare-fun res!930474 () Bool)

(assert (=> b!1390311 (=> (not res!930474) (not e!787364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390311 (= res!930474 (validKeyInArray!0 (select (arr!45926 a!2901) i!1037)))))

(declare-fun b!1390312 () Bool)

(declare-fun res!930475 () Bool)

(assert (=> b!1390312 (=> (not res!930475) (not e!787364))))

(assert (=> b!1390312 (= res!930475 (validKeyInArray!0 (select (arr!45926 a!2901) j!112)))))

(declare-fun b!1390313 () Bool)

(declare-fun res!930470 () Bool)

(assert (=> b!1390313 (=> (not res!930470) (not e!787364))))

(declare-datatypes ((List!32445 0))(
  ( (Nil!32442) (Cons!32441 (h!33659 (_ BitVec 64)) (t!47139 List!32445)) )
))
(declare-fun arrayNoDuplicates!0 (array!95121 (_ BitVec 32) List!32445) Bool)

(assert (=> b!1390313 (= res!930470 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32442))))

(declare-fun b!1390314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95121 (_ BitVec 32)) SeekEntryResult!10243)

(assert (=> b!1390314 (= e!787362 (= (seekEntryOrOpen!0 (select (arr!45926 a!2901) j!112) a!2901 mask!2840) (Found!10243 j!112)))))

(assert (= (and start!119184 res!930473) b!1390308))

(assert (= (and b!1390308 res!930471) b!1390311))

(assert (= (and b!1390311 res!930474) b!1390312))

(assert (= (and b!1390312 res!930475) b!1390309))

(assert (= (and b!1390309 res!930472) b!1390313))

(assert (= (and b!1390313 res!930470) b!1390310))

(assert (= (and b!1390310 res!930469) b!1390314))

(declare-fun m!1276125 () Bool)

(assert (=> b!1390312 m!1276125))

(assert (=> b!1390312 m!1276125))

(declare-fun m!1276127 () Bool)

(assert (=> b!1390312 m!1276127))

(assert (=> b!1390314 m!1276125))

(assert (=> b!1390314 m!1276125))

(declare-fun m!1276129 () Bool)

(assert (=> b!1390314 m!1276129))

(declare-fun m!1276131 () Bool)

(assert (=> b!1390309 m!1276131))

(declare-fun m!1276133 () Bool)

(assert (=> b!1390313 m!1276133))

(declare-fun m!1276135 () Bool)

(assert (=> start!119184 m!1276135))

(declare-fun m!1276137 () Bool)

(assert (=> start!119184 m!1276137))

(assert (=> b!1390310 m!1276125))

(declare-fun m!1276139 () Bool)

(assert (=> b!1390310 m!1276139))

(assert (=> b!1390310 m!1276125))

(declare-fun m!1276141 () Bool)

(assert (=> b!1390310 m!1276141))

(assert (=> b!1390310 m!1276139))

(assert (=> b!1390310 m!1276125))

(declare-fun m!1276143 () Bool)

(assert (=> b!1390310 m!1276143))

(declare-fun m!1276145 () Bool)

(assert (=> b!1390310 m!1276145))

(declare-fun m!1276147 () Bool)

(assert (=> b!1390311 m!1276147))

(assert (=> b!1390311 m!1276147))

(declare-fun m!1276149 () Bool)

(assert (=> b!1390311 m!1276149))

(push 1)

(assert (not b!1390314))

(assert (not b!1390309))

(assert (not b!1390312))

(assert (not b!1390313))

(assert (not b!1390310))

(assert (not start!119184))

(assert (not b!1390311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

