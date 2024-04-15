; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120602 () Bool)

(assert start!120602)

(declare-fun b!1404160 () Bool)

(declare-fun res!942723 () Bool)

(declare-fun e!794935 () Bool)

(assert (=> b!1404160 (=> (not res!942723) (not e!794935))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95964 0))(
  ( (array!95965 (arr!46333 (Array (_ BitVec 32) (_ BitVec 64))) (size!46885 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95964)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404160 (= res!942723 (and (= (size!46885 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46885 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46885 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404161 () Bool)

(declare-fun res!942722 () Bool)

(assert (=> b!1404161 (=> (not res!942722) (not e!794935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404161 (= res!942722 (validKeyInArray!0 (select (arr!46333 a!2901) i!1037)))))

(declare-fun res!942727 () Bool)

(assert (=> start!120602 (=> (not res!942727) (not e!794935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120602 (= res!942727 (validMask!0 mask!2840))))

(assert (=> start!120602 e!794935))

(assert (=> start!120602 true))

(declare-fun array_inv!35566 (array!95964) Bool)

(assert (=> start!120602 (array_inv!35566 a!2901)))

(declare-fun b!1404162 () Bool)

(declare-fun res!942726 () Bool)

(assert (=> b!1404162 (=> (not res!942726) (not e!794935))))

(assert (=> b!1404162 (= res!942726 (validKeyInArray!0 (select (arr!46333 a!2901) j!112)))))

(declare-fun b!1404163 () Bool)

(declare-fun res!942725 () Bool)

(assert (=> b!1404163 (=> (not res!942725) (not e!794935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95964 (_ BitVec 32)) Bool)

(assert (=> b!1404163 (= res!942725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404164 () Bool)

(declare-fun res!942724 () Bool)

(assert (=> b!1404164 (=> (not res!942724) (not e!794935))))

(declare-datatypes ((List!32930 0))(
  ( (Nil!32927) (Cons!32926 (h!34174 (_ BitVec 64)) (t!47616 List!32930)) )
))
(declare-fun arrayNoDuplicates!0 (array!95964 (_ BitVec 32) List!32930) Bool)

(assert (=> b!1404164 (= res!942724 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32927))))

(declare-fun b!1404165 () Bool)

(assert (=> b!1404165 (= e!794935 (bvsgt #b00000000000000000000000000000000 (size!46885 a!2901)))))

(declare-datatypes ((SeekEntryResult!10670 0))(
  ( (MissingZero!10670 (index!45057 (_ BitVec 32))) (Found!10670 (index!45058 (_ BitVec 32))) (Intermediate!10670 (undefined!11482 Bool) (index!45059 (_ BitVec 32)) (x!126670 (_ BitVec 32))) (Undefined!10670) (MissingVacant!10670 (index!45060 (_ BitVec 32))) )
))
(declare-fun lt!618422 () SeekEntryResult!10670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95964 (_ BitVec 32)) SeekEntryResult!10670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404165 (= lt!618422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46333 a!2901) j!112) mask!2840) (select (arr!46333 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120602 res!942727) b!1404160))

(assert (= (and b!1404160 res!942723) b!1404161))

(assert (= (and b!1404161 res!942722) b!1404162))

(assert (= (and b!1404162 res!942726) b!1404163))

(assert (= (and b!1404163 res!942725) b!1404164))

(assert (= (and b!1404164 res!942724) b!1404165))

(declare-fun m!1292521 () Bool)

(assert (=> b!1404163 m!1292521))

(declare-fun m!1292523 () Bool)

(assert (=> start!120602 m!1292523))

(declare-fun m!1292525 () Bool)

(assert (=> start!120602 m!1292525))

(declare-fun m!1292527 () Bool)

(assert (=> b!1404164 m!1292527))

(declare-fun m!1292529 () Bool)

(assert (=> b!1404162 m!1292529))

(assert (=> b!1404162 m!1292529))

(declare-fun m!1292531 () Bool)

(assert (=> b!1404162 m!1292531))

(assert (=> b!1404165 m!1292529))

(assert (=> b!1404165 m!1292529))

(declare-fun m!1292533 () Bool)

(assert (=> b!1404165 m!1292533))

(assert (=> b!1404165 m!1292533))

(assert (=> b!1404165 m!1292529))

(declare-fun m!1292535 () Bool)

(assert (=> b!1404165 m!1292535))

(declare-fun m!1292537 () Bool)

(assert (=> b!1404161 m!1292537))

(assert (=> b!1404161 m!1292537))

(declare-fun m!1292539 () Bool)

(assert (=> b!1404161 m!1292539))

(check-sat (not start!120602) (not b!1404165) (not b!1404161) (not b!1404162) (not b!1404163) (not b!1404164))
(check-sat)
