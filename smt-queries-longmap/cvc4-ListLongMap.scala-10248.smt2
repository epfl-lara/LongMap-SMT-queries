; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120544 () Bool)

(assert start!120544)

(declare-fun b!1403637 () Bool)

(declare-fun e!794734 () Bool)

(assert (=> b!1403637 (= e!794734 (not true))))

(declare-fun e!794735 () Bool)

(assert (=> b!1403637 e!794735))

(declare-fun res!942153 () Bool)

(assert (=> b!1403637 (=> (not res!942153) (not e!794735))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95953 0))(
  ( (array!95954 (arr!46327 (Array (_ BitVec 32) (_ BitVec 64))) (size!46877 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95953)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95953 (_ BitVec 32)) Bool)

(assert (=> b!1403637 (= res!942153 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47292 0))(
  ( (Unit!47293) )
))
(declare-fun lt!618465 () Unit!47292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47292)

(assert (=> b!1403637 (= lt!618465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10644 0))(
  ( (MissingZero!10644 (index!44953 (_ BitVec 32))) (Found!10644 (index!44954 (_ BitVec 32))) (Intermediate!10644 (undefined!11456 Bool) (index!44955 (_ BitVec 32)) (x!126559 (_ BitVec 32))) (Undefined!10644) (MissingVacant!10644 (index!44956 (_ BitVec 32))) )
))
(declare-fun lt!618464 () SeekEntryResult!10644)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95953 (_ BitVec 32)) SeekEntryResult!10644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403637 (= lt!618464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46327 a!2901) j!112) mask!2840) (select (arr!46327 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403638 () Bool)

(declare-fun res!942154 () Bool)

(assert (=> b!1403638 (=> (not res!942154) (not e!794734))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403638 (= res!942154 (and (= (size!46877 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46877 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46877 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403639 () Bool)

(declare-fun res!942150 () Bool)

(assert (=> b!1403639 (=> (not res!942150) (not e!794734))))

(assert (=> b!1403639 (= res!942150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403640 () Bool)

(declare-fun res!942148 () Bool)

(assert (=> b!1403640 (=> (not res!942148) (not e!794734))))

(declare-datatypes ((List!32846 0))(
  ( (Nil!32843) (Cons!32842 (h!34090 (_ BitVec 64)) (t!47540 List!32846)) )
))
(declare-fun arrayNoDuplicates!0 (array!95953 (_ BitVec 32) List!32846) Bool)

(assert (=> b!1403640 (= res!942148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32843))))

(declare-fun res!942151 () Bool)

(assert (=> start!120544 (=> (not res!942151) (not e!794734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120544 (= res!942151 (validMask!0 mask!2840))))

(assert (=> start!120544 e!794734))

(assert (=> start!120544 true))

(declare-fun array_inv!35355 (array!95953) Bool)

(assert (=> start!120544 (array_inv!35355 a!2901)))

(declare-fun b!1403641 () Bool)

(declare-fun res!942152 () Bool)

(assert (=> b!1403641 (=> (not res!942152) (not e!794734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403641 (= res!942152 (validKeyInArray!0 (select (arr!46327 a!2901) j!112)))))

(declare-fun b!1403642 () Bool)

(declare-fun res!942149 () Bool)

(assert (=> b!1403642 (=> (not res!942149) (not e!794734))))

(assert (=> b!1403642 (= res!942149 (validKeyInArray!0 (select (arr!46327 a!2901) i!1037)))))

(declare-fun b!1403643 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95953 (_ BitVec 32)) SeekEntryResult!10644)

(assert (=> b!1403643 (= e!794735 (= (seekEntryOrOpen!0 (select (arr!46327 a!2901) j!112) a!2901 mask!2840) (Found!10644 j!112)))))

(assert (= (and start!120544 res!942151) b!1403638))

(assert (= (and b!1403638 res!942154) b!1403642))

(assert (= (and b!1403642 res!942149) b!1403641))

(assert (= (and b!1403641 res!942152) b!1403639))

(assert (= (and b!1403639 res!942150) b!1403640))

(assert (= (and b!1403640 res!942148) b!1403637))

(assert (= (and b!1403637 res!942153) b!1403643))

(declare-fun m!1292341 () Bool)

(assert (=> b!1403643 m!1292341))

(assert (=> b!1403643 m!1292341))

(declare-fun m!1292343 () Bool)

(assert (=> b!1403643 m!1292343))

(declare-fun m!1292345 () Bool)

(assert (=> b!1403642 m!1292345))

(assert (=> b!1403642 m!1292345))

(declare-fun m!1292347 () Bool)

(assert (=> b!1403642 m!1292347))

(declare-fun m!1292349 () Bool)

(assert (=> b!1403640 m!1292349))

(assert (=> b!1403637 m!1292341))

(declare-fun m!1292351 () Bool)

(assert (=> b!1403637 m!1292351))

(assert (=> b!1403637 m!1292341))

(declare-fun m!1292353 () Bool)

(assert (=> b!1403637 m!1292353))

(assert (=> b!1403637 m!1292351))

(assert (=> b!1403637 m!1292341))

(declare-fun m!1292355 () Bool)

(assert (=> b!1403637 m!1292355))

(declare-fun m!1292357 () Bool)

(assert (=> b!1403637 m!1292357))

(declare-fun m!1292359 () Bool)

(assert (=> start!120544 m!1292359))

(declare-fun m!1292361 () Bool)

(assert (=> start!120544 m!1292361))

(assert (=> b!1403641 m!1292341))

(assert (=> b!1403641 m!1292341))

(declare-fun m!1292363 () Bool)

(assert (=> b!1403641 m!1292363))

(declare-fun m!1292365 () Bool)

(assert (=> b!1403639 m!1292365))

(push 1)

(assert (not b!1403639))

(assert (not b!1403637))

(assert (not b!1403642))

(assert (not b!1403643))

(assert (not b!1403640))

(assert (not start!120544))

(assert (not b!1403641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

