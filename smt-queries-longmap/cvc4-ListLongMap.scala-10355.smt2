; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121948 () Bool)

(assert start!121948)

(declare-fun b!1415184 () Bool)

(declare-fun e!800946 () Bool)

(declare-fun e!800947 () Bool)

(assert (=> b!1415184 (= e!800946 (not e!800947))))

(declare-fun res!951232 () Bool)

(assert (=> b!1415184 (=> res!951232 e!800947)))

(declare-datatypes ((SeekEntryResult!10959 0))(
  ( (MissingZero!10959 (index!46228 (_ BitVec 32))) (Found!10959 (index!46229 (_ BitVec 32))) (Intermediate!10959 (undefined!11771 Bool) (index!46230 (_ BitVec 32)) (x!127838 (_ BitVec 32))) (Undefined!10959) (MissingVacant!10959 (index!46231 (_ BitVec 32))) )
))
(declare-fun lt!623965 () SeekEntryResult!10959)

(assert (=> b!1415184 (= res!951232 (or (not (is-Intermediate!10959 lt!623965)) (undefined!11771 lt!623965)))))

(declare-fun e!800944 () Bool)

(assert (=> b!1415184 e!800944))

(declare-fun res!951235 () Bool)

(assert (=> b!1415184 (=> (not res!951235) (not e!800944))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96634 0))(
  ( (array!96635 (arr!46648 (Array (_ BitVec 32) (_ BitVec 64))) (size!47198 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96634)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96634 (_ BitVec 32)) Bool)

(assert (=> b!1415184 (= res!951235 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47892 0))(
  ( (Unit!47893) )
))
(declare-fun lt!623970 () Unit!47892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47892)

(assert (=> b!1415184 (= lt!623970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623967 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96634 (_ BitVec 32)) SeekEntryResult!10959)

(assert (=> b!1415184 (= lt!623965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623967 (select (arr!46648 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415184 (= lt!623967 (toIndex!0 (select (arr!46648 a!2901) j!112) mask!2840))))

(declare-fun b!1415185 () Bool)

(declare-fun e!800945 () Bool)

(assert (=> b!1415185 (= e!800947 e!800945)))

(declare-fun res!951230 () Bool)

(assert (=> b!1415185 (=> res!951230 e!800945)))

(declare-fun lt!623969 () SeekEntryResult!10959)

(assert (=> b!1415185 (= res!951230 (or (= lt!623965 lt!623969) (not (is-Intermediate!10959 lt!623969))))))

(declare-fun lt!623966 () array!96634)

(declare-fun lt!623968 () (_ BitVec 64))

(assert (=> b!1415185 (= lt!623969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623968 mask!2840) lt!623968 lt!623966 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415185 (= lt!623968 (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415185 (= lt!623966 (array!96635 (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47198 a!2901)))))

(declare-fun b!1415186 () Bool)

(declare-fun res!951231 () Bool)

(assert (=> b!1415186 (=> (not res!951231) (not e!800946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415186 (= res!951231 (validKeyInArray!0 (select (arr!46648 a!2901) i!1037)))))

(declare-fun res!951227 () Bool)

(assert (=> start!121948 (=> (not res!951227) (not e!800946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121948 (= res!951227 (validMask!0 mask!2840))))

(assert (=> start!121948 e!800946))

(assert (=> start!121948 true))

(declare-fun array_inv!35676 (array!96634) Bool)

(assert (=> start!121948 (array_inv!35676 a!2901)))

(declare-fun b!1415187 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96634 (_ BitVec 32)) SeekEntryResult!10959)

(assert (=> b!1415187 (= e!800944 (= (seekEntryOrOpen!0 (select (arr!46648 a!2901) j!112) a!2901 mask!2840) (Found!10959 j!112)))))

(declare-fun b!1415188 () Bool)

(declare-fun res!951233 () Bool)

(assert (=> b!1415188 (=> (not res!951233) (not e!800946))))

(assert (=> b!1415188 (= res!951233 (and (= (size!47198 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47198 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47198 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415189 () Bool)

(declare-fun res!951226 () Bool)

(assert (=> b!1415189 (=> (not res!951226) (not e!800946))))

(assert (=> b!1415189 (= res!951226 (validKeyInArray!0 (select (arr!46648 a!2901) j!112)))))

(declare-fun b!1415190 () Bool)

(declare-fun e!800948 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96634 (_ BitVec 32)) SeekEntryResult!10959)

(assert (=> b!1415190 (= e!800948 (= (seekEntryOrOpen!0 lt!623968 lt!623966 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127838 lt!623969) (index!46230 lt!623969) (index!46230 lt!623969) (select (arr!46648 a!2901) j!112) lt!623966 mask!2840)))))

(declare-fun b!1415191 () Bool)

(declare-fun res!951229 () Bool)

(assert (=> b!1415191 (=> (not res!951229) (not e!800946))))

(assert (=> b!1415191 (= res!951229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415192 () Bool)

(declare-fun res!951228 () Bool)

(assert (=> b!1415192 (=> (not res!951228) (not e!800946))))

(declare-datatypes ((List!33167 0))(
  ( (Nil!33164) (Cons!33163 (h!34450 (_ BitVec 64)) (t!47861 List!33167)) )
))
(declare-fun arrayNoDuplicates!0 (array!96634 (_ BitVec 32) List!33167) Bool)

(assert (=> b!1415192 (= res!951228 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33164))))

(declare-fun b!1415193 () Bool)

(assert (=> b!1415193 (= e!800945 (or (bvslt (x!127838 lt!623965) #b00000000000000000000000000000000) (bvsgt (x!127838 lt!623965) #b01111111111111111111111111111110) (bvslt (x!127838 lt!623969) #b00000000000000000000000000000000) (bvsgt (x!127838 lt!623969) #b01111111111111111111111111111110) (bvslt lt!623967 #b00000000000000000000000000000000) (bvsge lt!623967 (size!47198 a!2901)) (bvslt (index!46230 lt!623965) #b00000000000000000000000000000000) (bvsge (index!46230 lt!623965) (size!47198 a!2901)) (and (bvsge (index!46230 lt!623969) #b00000000000000000000000000000000) (bvslt (index!46230 lt!623969) (size!47198 a!2901)))))))

(assert (=> b!1415193 e!800948))

(declare-fun res!951234 () Bool)

(assert (=> b!1415193 (=> (not res!951234) (not e!800948))))

(assert (=> b!1415193 (= res!951234 (and (not (undefined!11771 lt!623969)) (= (index!46230 lt!623969) i!1037) (bvslt (x!127838 lt!623969) (x!127838 lt!623965)) (= (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46230 lt!623969)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623964 () Unit!47892)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47892)

(assert (=> b!1415193 (= lt!623964 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623967 (x!127838 lt!623965) (index!46230 lt!623965) (x!127838 lt!623969) (index!46230 lt!623969) (undefined!11771 lt!623969) mask!2840))))

(assert (= (and start!121948 res!951227) b!1415188))

(assert (= (and b!1415188 res!951233) b!1415186))

(assert (= (and b!1415186 res!951231) b!1415189))

(assert (= (and b!1415189 res!951226) b!1415191))

(assert (= (and b!1415191 res!951229) b!1415192))

(assert (= (and b!1415192 res!951228) b!1415184))

(assert (= (and b!1415184 res!951235) b!1415187))

(assert (= (and b!1415184 (not res!951232)) b!1415185))

(assert (= (and b!1415185 (not res!951230)) b!1415193))

(assert (= (and b!1415193 res!951234) b!1415190))

(declare-fun m!1305363 () Bool)

(assert (=> b!1415185 m!1305363))

(assert (=> b!1415185 m!1305363))

(declare-fun m!1305365 () Bool)

(assert (=> b!1415185 m!1305365))

(declare-fun m!1305367 () Bool)

(assert (=> b!1415185 m!1305367))

(declare-fun m!1305369 () Bool)

(assert (=> b!1415185 m!1305369))

(assert (=> b!1415193 m!1305367))

(declare-fun m!1305371 () Bool)

(assert (=> b!1415193 m!1305371))

(declare-fun m!1305373 () Bool)

(assert (=> b!1415193 m!1305373))

(declare-fun m!1305375 () Bool)

(assert (=> b!1415187 m!1305375))

(assert (=> b!1415187 m!1305375))

(declare-fun m!1305377 () Bool)

(assert (=> b!1415187 m!1305377))

(assert (=> b!1415184 m!1305375))

(declare-fun m!1305379 () Bool)

(assert (=> b!1415184 m!1305379))

(assert (=> b!1415184 m!1305375))

(declare-fun m!1305381 () Bool)

(assert (=> b!1415184 m!1305381))

(assert (=> b!1415184 m!1305375))

(declare-fun m!1305383 () Bool)

(assert (=> b!1415184 m!1305383))

(declare-fun m!1305385 () Bool)

(assert (=> b!1415184 m!1305385))

(assert (=> b!1415189 m!1305375))

(assert (=> b!1415189 m!1305375))

(declare-fun m!1305387 () Bool)

(assert (=> b!1415189 m!1305387))

(declare-fun m!1305389 () Bool)

(assert (=> b!1415186 m!1305389))

(assert (=> b!1415186 m!1305389))

(declare-fun m!1305391 () Bool)

(assert (=> b!1415186 m!1305391))

(declare-fun m!1305393 () Bool)

(assert (=> b!1415190 m!1305393))

(assert (=> b!1415190 m!1305375))

(assert (=> b!1415190 m!1305375))

(declare-fun m!1305395 () Bool)

(assert (=> b!1415190 m!1305395))

(declare-fun m!1305397 () Bool)

(assert (=> b!1415191 m!1305397))

(declare-fun m!1305399 () Bool)

(assert (=> b!1415192 m!1305399))

(declare-fun m!1305401 () Bool)

(assert (=> start!121948 m!1305401))

(declare-fun m!1305403 () Bool)

(assert (=> start!121948 m!1305403))

(push 1)

(assert (not b!1415187))

(assert (not b!1415193))

(assert (not b!1415191))

(assert (not start!121948))

(assert (not b!1415189))

(assert (not b!1415192))

(assert (not b!1415184))

(assert (not b!1415186))

(assert (not b!1415185))

(assert (not b!1415190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

