; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120206 () Bool)

(assert start!120206)

(declare-fun res!937944 () Bool)

(declare-fun e!792128 () Bool)

(assert (=> start!120206 (=> (not res!937944) (not e!792128))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120206 (= res!937944 (validMask!0 mask!2840))))

(assert (=> start!120206 e!792128))

(assert (=> start!120206 true))

(declare-datatypes ((array!95678 0))(
  ( (array!95679 (arr!46191 (Array (_ BitVec 32) (_ BitVec 64))) (size!46741 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95678)

(declare-fun array_inv!35219 (array!95678) Bool)

(assert (=> start!120206 (array_inv!35219 a!2901)))

(declare-fun b!1399195 () Bool)

(declare-fun e!792129 () Bool)

(declare-fun e!792131 () Bool)

(assert (=> b!1399195 (= e!792129 e!792131)))

(declare-fun res!937951 () Bool)

(assert (=> b!1399195 (=> res!937951 e!792131)))

(declare-datatypes ((SeekEntryResult!10508 0))(
  ( (MissingZero!10508 (index!44406 (_ BitVec 32))) (Found!10508 (index!44407 (_ BitVec 32))) (Intermediate!10508 (undefined!11320 Bool) (index!44408 (_ BitVec 32)) (x!126051 (_ BitVec 32))) (Undefined!10508) (MissingVacant!10508 (index!44409 (_ BitVec 32))) )
))
(declare-fun lt!615393 () SeekEntryResult!10508)

(declare-fun lt!615388 () SeekEntryResult!10508)

(get-info :version)

(assert (=> b!1399195 (= res!937951 (or (= lt!615393 lt!615388) (not ((_ is Intermediate!10508) lt!615388))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!615389 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95678 (_ BitVec 32)) SeekEntryResult!10508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399195 (= lt!615388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615389 mask!2840) lt!615389 (array!95679 (store (arr!46191 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46741 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399195 (= lt!615389 (select (store (arr!46191 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1399196 () Bool)

(declare-fun res!937950 () Bool)

(assert (=> b!1399196 (=> (not res!937950) (not e!792128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399196 (= res!937950 (validKeyInArray!0 (select (arr!46191 a!2901) i!1037)))))

(declare-fun b!1399197 () Bool)

(declare-fun res!937947 () Bool)

(assert (=> b!1399197 (=> (not res!937947) (not e!792128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95678 (_ BitVec 32)) Bool)

(assert (=> b!1399197 (= res!937947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399198 () Bool)

(declare-fun res!937949 () Bool)

(assert (=> b!1399198 (=> (not res!937949) (not e!792128))))

(assert (=> b!1399198 (= res!937949 (validKeyInArray!0 (select (arr!46191 a!2901) j!112)))))

(declare-fun b!1399199 () Bool)

(assert (=> b!1399199 (= e!792128 (not e!792129))))

(declare-fun res!937948 () Bool)

(assert (=> b!1399199 (=> res!937948 e!792129)))

(assert (=> b!1399199 (= res!937948 (or (not ((_ is Intermediate!10508) lt!615393)) (undefined!11320 lt!615393)))))

(declare-fun e!792127 () Bool)

(assert (=> b!1399199 e!792127))

(declare-fun res!937946 () Bool)

(assert (=> b!1399199 (=> (not res!937946) (not e!792127))))

(assert (=> b!1399199 (= res!937946 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47020 0))(
  ( (Unit!47021) )
))
(declare-fun lt!615390 () Unit!47020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47020)

(assert (=> b!1399199 (= lt!615390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615392 () (_ BitVec 32))

(assert (=> b!1399199 (= lt!615393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615392 (select (arr!46191 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399199 (= lt!615392 (toIndex!0 (select (arr!46191 a!2901) j!112) mask!2840))))

(declare-fun b!1399200 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95678 (_ BitVec 32)) SeekEntryResult!10508)

(assert (=> b!1399200 (= e!792127 (= (seekEntryOrOpen!0 (select (arr!46191 a!2901) j!112) a!2901 mask!2840) (Found!10508 j!112)))))

(declare-fun b!1399201 () Bool)

(declare-fun res!937943 () Bool)

(assert (=> b!1399201 (=> (not res!937943) (not e!792128))))

(declare-datatypes ((List!32710 0))(
  ( (Nil!32707) (Cons!32706 (h!33951 (_ BitVec 64)) (t!47404 List!32710)) )
))
(declare-fun arrayNoDuplicates!0 (array!95678 (_ BitVec 32) List!32710) Bool)

(assert (=> b!1399201 (= res!937943 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32707))))

(declare-fun b!1399202 () Bool)

(assert (=> b!1399202 (= e!792131 true)))

(assert (=> b!1399202 (and (not (undefined!11320 lt!615388)) (= (index!44408 lt!615388) i!1037) (bvslt (x!126051 lt!615388) (x!126051 lt!615393)) (= (select (store (arr!46191 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44408 lt!615388)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615391 () Unit!47020)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47020)

(assert (=> b!1399202 (= lt!615391 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615392 (x!126051 lt!615393) (index!44408 lt!615393) (x!126051 lt!615388) (index!44408 lt!615388) (undefined!11320 lt!615388) mask!2840))))

(declare-fun b!1399203 () Bool)

(declare-fun res!937945 () Bool)

(assert (=> b!1399203 (=> (not res!937945) (not e!792128))))

(assert (=> b!1399203 (= res!937945 (and (= (size!46741 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46741 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46741 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120206 res!937944) b!1399203))

(assert (= (and b!1399203 res!937945) b!1399196))

(assert (= (and b!1399196 res!937950) b!1399198))

(assert (= (and b!1399198 res!937949) b!1399197))

(assert (= (and b!1399197 res!937947) b!1399201))

(assert (= (and b!1399201 res!937943) b!1399199))

(assert (= (and b!1399199 res!937946) b!1399200))

(assert (= (and b!1399199 (not res!937948)) b!1399195))

(assert (= (and b!1399195 (not res!937951)) b!1399202))

(declare-fun m!1286435 () Bool)

(assert (=> b!1399195 m!1286435))

(declare-fun m!1286437 () Bool)

(assert (=> b!1399195 m!1286437))

(assert (=> b!1399195 m!1286435))

(declare-fun m!1286439 () Bool)

(assert (=> b!1399195 m!1286439))

(declare-fun m!1286441 () Bool)

(assert (=> b!1399195 m!1286441))

(assert (=> b!1399202 m!1286437))

(declare-fun m!1286443 () Bool)

(assert (=> b!1399202 m!1286443))

(declare-fun m!1286445 () Bool)

(assert (=> b!1399202 m!1286445))

(declare-fun m!1286447 () Bool)

(assert (=> b!1399199 m!1286447))

(declare-fun m!1286449 () Bool)

(assert (=> b!1399199 m!1286449))

(assert (=> b!1399199 m!1286447))

(declare-fun m!1286451 () Bool)

(assert (=> b!1399199 m!1286451))

(assert (=> b!1399199 m!1286447))

(declare-fun m!1286453 () Bool)

(assert (=> b!1399199 m!1286453))

(declare-fun m!1286455 () Bool)

(assert (=> b!1399199 m!1286455))

(declare-fun m!1286457 () Bool)

(assert (=> b!1399201 m!1286457))

(assert (=> b!1399198 m!1286447))

(assert (=> b!1399198 m!1286447))

(declare-fun m!1286459 () Bool)

(assert (=> b!1399198 m!1286459))

(assert (=> b!1399200 m!1286447))

(assert (=> b!1399200 m!1286447))

(declare-fun m!1286461 () Bool)

(assert (=> b!1399200 m!1286461))

(declare-fun m!1286463 () Bool)

(assert (=> b!1399197 m!1286463))

(declare-fun m!1286465 () Bool)

(assert (=> start!120206 m!1286465))

(declare-fun m!1286467 () Bool)

(assert (=> start!120206 m!1286467))

(declare-fun m!1286469 () Bool)

(assert (=> b!1399196 m!1286469))

(assert (=> b!1399196 m!1286469))

(declare-fun m!1286471 () Bool)

(assert (=> b!1399196 m!1286471))

(check-sat (not b!1399200) (not b!1399202) (not start!120206) (not b!1399199) (not b!1399198) (not b!1399197) (not b!1399195) (not b!1399201) (not b!1399196))
(check-sat)
