; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120524 () Bool)

(assert start!120524)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95933 0))(
  ( (array!95934 (arr!46317 (Array (_ BitVec 32) (_ BitVec 64))) (size!46867 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95933)

(declare-fun b!1403414 () Bool)

(declare-fun e!794633 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10634 0))(
  ( (MissingZero!10634 (index!44913 (_ BitVec 32))) (Found!10634 (index!44914 (_ BitVec 32))) (Intermediate!10634 (undefined!11446 Bool) (index!44915 (_ BitVec 32)) (x!126525 (_ BitVec 32))) (Undefined!10634) (MissingVacant!10634 (index!44916 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95933 (_ BitVec 32)) SeekEntryResult!10634)

(assert (=> b!1403414 (= e!794633 (= (seekEntryOrOpen!0 (select (arr!46317 a!2901) j!112) a!2901 mask!2840) (Found!10634 j!112)))))

(declare-fun b!1403415 () Bool)

(declare-fun res!941932 () Bool)

(declare-fun e!794632 () Bool)

(assert (=> b!1403415 (=> (not res!941932) (not e!794632))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403415 (= res!941932 (and (= (size!46867 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46867 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46867 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403416 () Bool)

(declare-fun e!794631 () Bool)

(assert (=> b!1403416 (= e!794632 (not e!794631))))

(declare-fun res!941930 () Bool)

(assert (=> b!1403416 (=> res!941930 e!794631)))

(declare-fun lt!618392 () SeekEntryResult!10634)

(get-info :version)

(assert (=> b!1403416 (= res!941930 (or (not ((_ is Intermediate!10634) lt!618392)) (undefined!11446 lt!618392)))))

(assert (=> b!1403416 e!794633))

(declare-fun res!941925 () Bool)

(assert (=> b!1403416 (=> (not res!941925) (not e!794633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95933 (_ BitVec 32)) Bool)

(assert (=> b!1403416 (= res!941925 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47272 0))(
  ( (Unit!47273) )
))
(declare-fun lt!618391 () Unit!47272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47272)

(assert (=> b!1403416 (= lt!618391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95933 (_ BitVec 32)) SeekEntryResult!10634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403416 (= lt!618392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46317 a!2901) j!112) mask!2840) (select (arr!46317 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403417 () Bool)

(declare-fun res!941928 () Bool)

(assert (=> b!1403417 (=> (not res!941928) (not e!794632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403417 (= res!941928 (validKeyInArray!0 (select (arr!46317 a!2901) i!1037)))))

(declare-fun b!1403418 () Bool)

(declare-fun res!941927 () Bool)

(assert (=> b!1403418 (=> (not res!941927) (not e!794632))))

(declare-datatypes ((List!32836 0))(
  ( (Nil!32833) (Cons!32832 (h!34080 (_ BitVec 64)) (t!47530 List!32836)) )
))
(declare-fun arrayNoDuplicates!0 (array!95933 (_ BitVec 32) List!32836) Bool)

(assert (=> b!1403418 (= res!941927 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32833))))

(declare-fun b!1403419 () Bool)

(declare-fun res!941926 () Bool)

(assert (=> b!1403419 (=> (not res!941926) (not e!794632))))

(assert (=> b!1403419 (= res!941926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403420 () Bool)

(declare-fun res!941929 () Bool)

(assert (=> b!1403420 (=> (not res!941929) (not e!794632))))

(assert (=> b!1403420 (= res!941929 (validKeyInArray!0 (select (arr!46317 a!2901) j!112)))))

(declare-fun b!1403421 () Bool)

(assert (=> b!1403421 (= e!794631 true)))

(declare-fun lt!618393 () SeekEntryResult!10634)

(assert (=> b!1403421 (= lt!618393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46317 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46317 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95934 (store (arr!46317 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46867 a!2901)) mask!2840))))

(declare-fun res!941931 () Bool)

(assert (=> start!120524 (=> (not res!941931) (not e!794632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120524 (= res!941931 (validMask!0 mask!2840))))

(assert (=> start!120524 e!794632))

(assert (=> start!120524 true))

(declare-fun array_inv!35345 (array!95933) Bool)

(assert (=> start!120524 (array_inv!35345 a!2901)))

(assert (= (and start!120524 res!941931) b!1403415))

(assert (= (and b!1403415 res!941932) b!1403417))

(assert (= (and b!1403417 res!941928) b!1403420))

(assert (= (and b!1403420 res!941929) b!1403419))

(assert (= (and b!1403419 res!941926) b!1403418))

(assert (= (and b!1403418 res!941927) b!1403416))

(assert (= (and b!1403416 res!941925) b!1403414))

(assert (= (and b!1403416 (not res!941930)) b!1403421))

(declare-fun m!1292041 () Bool)

(assert (=> b!1403417 m!1292041))

(assert (=> b!1403417 m!1292041))

(declare-fun m!1292043 () Bool)

(assert (=> b!1403417 m!1292043))

(declare-fun m!1292045 () Bool)

(assert (=> b!1403414 m!1292045))

(assert (=> b!1403414 m!1292045))

(declare-fun m!1292047 () Bool)

(assert (=> b!1403414 m!1292047))

(assert (=> b!1403420 m!1292045))

(assert (=> b!1403420 m!1292045))

(declare-fun m!1292049 () Bool)

(assert (=> b!1403420 m!1292049))

(assert (=> b!1403416 m!1292045))

(declare-fun m!1292051 () Bool)

(assert (=> b!1403416 m!1292051))

(assert (=> b!1403416 m!1292045))

(declare-fun m!1292053 () Bool)

(assert (=> b!1403416 m!1292053))

(assert (=> b!1403416 m!1292051))

(assert (=> b!1403416 m!1292045))

(declare-fun m!1292055 () Bool)

(assert (=> b!1403416 m!1292055))

(declare-fun m!1292057 () Bool)

(assert (=> b!1403416 m!1292057))

(declare-fun m!1292059 () Bool)

(assert (=> b!1403421 m!1292059))

(declare-fun m!1292061 () Bool)

(assert (=> b!1403421 m!1292061))

(assert (=> b!1403421 m!1292061))

(declare-fun m!1292063 () Bool)

(assert (=> b!1403421 m!1292063))

(assert (=> b!1403421 m!1292063))

(assert (=> b!1403421 m!1292061))

(declare-fun m!1292065 () Bool)

(assert (=> b!1403421 m!1292065))

(declare-fun m!1292067 () Bool)

(assert (=> b!1403419 m!1292067))

(declare-fun m!1292069 () Bool)

(assert (=> start!120524 m!1292069))

(declare-fun m!1292071 () Bool)

(assert (=> start!120524 m!1292071))

(declare-fun m!1292073 () Bool)

(assert (=> b!1403418 m!1292073))

(check-sat (not b!1403416) (not b!1403419) (not start!120524) (not b!1403414) (not b!1403421) (not b!1403418) (not b!1403420) (not b!1403417))
