; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120512 () Bool)

(assert start!120512)

(declare-fun b!1401494 () Bool)

(declare-fun res!939328 () Bool)

(declare-fun e!793582 () Bool)

(assert (=> b!1401494 (=> (not res!939328) (not e!793582))))

(declare-datatypes ((array!95843 0))(
  ( (array!95844 (arr!46270 (Array (_ BitVec 32) (_ BitVec 64))) (size!46821 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95843)

(declare-datatypes ((List!32776 0))(
  ( (Nil!32773) (Cons!32772 (h!34028 (_ BitVec 64)) (t!47462 List!32776)) )
))
(declare-fun arrayNoDuplicates!0 (array!95843 (_ BitVec 32) List!32776) Bool)

(assert (=> b!1401494 (= res!939328 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32773))))

(declare-fun b!1401495 () Bool)

(declare-fun res!939323 () Bool)

(assert (=> b!1401495 (=> (not res!939323) (not e!793582))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401495 (= res!939323 (validKeyInArray!0 (select (arr!46270 a!2901) j!112)))))

(declare-fun b!1401496 () Bool)

(declare-fun e!793581 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10490 0))(
  ( (MissingZero!10490 (index!44337 (_ BitVec 32))) (Found!10490 (index!44338 (_ BitVec 32))) (Intermediate!10490 (undefined!11302 Bool) (index!44339 (_ BitVec 32)) (x!126136 (_ BitVec 32))) (Undefined!10490) (MissingVacant!10490 (index!44340 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1401496 (= e!793581 (= (seekEntryOrOpen!0 (select (arr!46270 a!2901) j!112) a!2901 mask!2840) (Found!10490 j!112)))))

(declare-fun b!1401497 () Bool)

(declare-fun res!939324 () Bool)

(assert (=> b!1401497 (=> (not res!939324) (not e!793582))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401497 (= res!939324 (and (= (size!46821 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46821 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46821 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401498 () Bool)

(declare-fun res!939321 () Bool)

(assert (=> b!1401498 (=> (not res!939321) (not e!793582))))

(assert (=> b!1401498 (= res!939321 (validKeyInArray!0 (select (arr!46270 a!2901) i!1037)))))

(declare-fun b!1401499 () Bool)

(declare-fun e!793580 () Bool)

(assert (=> b!1401499 (= e!793582 (not e!793580))))

(declare-fun res!939327 () Bool)

(assert (=> b!1401499 (=> res!939327 e!793580)))

(declare-fun lt!616541 () SeekEntryResult!10490)

(get-info :version)

(assert (=> b!1401499 (= res!939327 (or (not ((_ is Intermediate!10490) lt!616541)) (undefined!11302 lt!616541)))))

(assert (=> b!1401499 e!793581))

(declare-fun res!939326 () Bool)

(assert (=> b!1401499 (=> (not res!939326) (not e!793581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95843 (_ BitVec 32)) Bool)

(assert (=> b!1401499 (= res!939326 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47011 0))(
  ( (Unit!47012) )
))
(declare-fun lt!616544 () Unit!47011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47011)

(assert (=> b!1401499 (= lt!616544 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616545 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1401499 (= lt!616541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616545 (select (arr!46270 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401499 (= lt!616545 (toIndex!0 (select (arr!46270 a!2901) j!112) mask!2840))))

(declare-fun lt!616540 () SeekEntryResult!10490)

(declare-fun e!793586 () Bool)

(declare-fun b!1401500 () Bool)

(declare-fun lt!616547 () array!95843)

(declare-fun lt!616542 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10490)

(assert (=> b!1401500 (= e!793586 (= (seekEntryOrOpen!0 lt!616542 lt!616547 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126136 lt!616540) (index!44339 lt!616540) (index!44339 lt!616540) (select (arr!46270 a!2901) j!112) lt!616547 mask!2840)))))

(declare-fun b!1401501 () Bool)

(declare-fun e!793585 () Bool)

(assert (=> b!1401501 (= e!793580 e!793585)))

(declare-fun res!939329 () Bool)

(assert (=> b!1401501 (=> res!939329 e!793585)))

(assert (=> b!1401501 (= res!939329 (or (= lt!616541 lt!616540) (not ((_ is Intermediate!10490) lt!616540))))))

(assert (=> b!1401501 (= lt!616540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616542 mask!2840) lt!616542 lt!616547 mask!2840))))

(assert (=> b!1401501 (= lt!616542 (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401501 (= lt!616547 (array!95844 (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46821 a!2901)))))

(declare-fun b!1401503 () Bool)

(declare-fun e!793583 () Bool)

(assert (=> b!1401503 (= e!793583 true)))

(declare-fun lt!616543 () SeekEntryResult!10490)

(assert (=> b!1401503 (= lt!616543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616545 lt!616542 lt!616547 mask!2840))))

(declare-fun b!1401504 () Bool)

(declare-fun res!939331 () Bool)

(assert (=> b!1401504 (=> (not res!939331) (not e!793582))))

(assert (=> b!1401504 (= res!939331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!939330 () Bool)

(assert (=> start!120512 (=> (not res!939330) (not e!793582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120512 (= res!939330 (validMask!0 mask!2840))))

(assert (=> start!120512 e!793582))

(assert (=> start!120512 true))

(declare-fun array_inv!35551 (array!95843) Bool)

(assert (=> start!120512 (array_inv!35551 a!2901)))

(declare-fun b!1401502 () Bool)

(assert (=> b!1401502 (= e!793585 e!793583)))

(declare-fun res!939322 () Bool)

(assert (=> b!1401502 (=> res!939322 e!793583)))

(assert (=> b!1401502 (= res!939322 (or (bvslt (x!126136 lt!616541) #b00000000000000000000000000000000) (bvsgt (x!126136 lt!616541) #b01111111111111111111111111111110) (bvslt (x!126136 lt!616540) #b00000000000000000000000000000000) (bvsgt (x!126136 lt!616540) #b01111111111111111111111111111110) (bvslt lt!616545 #b00000000000000000000000000000000) (bvsge lt!616545 (size!46821 a!2901)) (bvslt (index!44339 lt!616541) #b00000000000000000000000000000000) (bvsge (index!44339 lt!616541) (size!46821 a!2901)) (bvslt (index!44339 lt!616540) #b00000000000000000000000000000000) (bvsge (index!44339 lt!616540) (size!46821 a!2901)) (not (= lt!616541 (Intermediate!10490 false (index!44339 lt!616541) (x!126136 lt!616541)))) (not (= lt!616540 (Intermediate!10490 false (index!44339 lt!616540) (x!126136 lt!616540))))))))

(assert (=> b!1401502 e!793586))

(declare-fun res!939325 () Bool)

(assert (=> b!1401502 (=> (not res!939325) (not e!793586))))

(assert (=> b!1401502 (= res!939325 (and (not (undefined!11302 lt!616540)) (= (index!44339 lt!616540) i!1037) (bvslt (x!126136 lt!616540) (x!126136 lt!616541)) (= (select (store (arr!46270 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44339 lt!616540)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616546 () Unit!47011)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47011)

(assert (=> b!1401502 (= lt!616546 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616545 (x!126136 lt!616541) (index!44339 lt!616541) (x!126136 lt!616540) (index!44339 lt!616540) (undefined!11302 lt!616540) mask!2840))))

(assert (= (and start!120512 res!939330) b!1401497))

(assert (= (and b!1401497 res!939324) b!1401498))

(assert (= (and b!1401498 res!939321) b!1401495))

(assert (= (and b!1401495 res!939323) b!1401504))

(assert (= (and b!1401504 res!939331) b!1401494))

(assert (= (and b!1401494 res!939328) b!1401499))

(assert (= (and b!1401499 res!939326) b!1401496))

(assert (= (and b!1401499 (not res!939327)) b!1401501))

(assert (= (and b!1401501 (not res!939329)) b!1401502))

(assert (= (and b!1401502 res!939325) b!1401500))

(assert (= (and b!1401502 (not res!939322)) b!1401503))

(declare-fun m!1289149 () Bool)

(assert (=> b!1401499 m!1289149))

(declare-fun m!1289151 () Bool)

(assert (=> b!1401499 m!1289151))

(assert (=> b!1401499 m!1289149))

(assert (=> b!1401499 m!1289149))

(declare-fun m!1289153 () Bool)

(assert (=> b!1401499 m!1289153))

(declare-fun m!1289155 () Bool)

(assert (=> b!1401499 m!1289155))

(declare-fun m!1289157 () Bool)

(assert (=> b!1401499 m!1289157))

(declare-fun m!1289159 () Bool)

(assert (=> b!1401494 m!1289159))

(declare-fun m!1289161 () Bool)

(assert (=> b!1401500 m!1289161))

(assert (=> b!1401500 m!1289149))

(assert (=> b!1401500 m!1289149))

(declare-fun m!1289163 () Bool)

(assert (=> b!1401500 m!1289163))

(declare-fun m!1289165 () Bool)

(assert (=> b!1401503 m!1289165))

(declare-fun m!1289167 () Bool)

(assert (=> b!1401502 m!1289167))

(declare-fun m!1289169 () Bool)

(assert (=> b!1401502 m!1289169))

(declare-fun m!1289171 () Bool)

(assert (=> b!1401502 m!1289171))

(declare-fun m!1289173 () Bool)

(assert (=> b!1401498 m!1289173))

(assert (=> b!1401498 m!1289173))

(declare-fun m!1289175 () Bool)

(assert (=> b!1401498 m!1289175))

(declare-fun m!1289177 () Bool)

(assert (=> start!120512 m!1289177))

(declare-fun m!1289179 () Bool)

(assert (=> start!120512 m!1289179))

(declare-fun m!1289181 () Bool)

(assert (=> b!1401501 m!1289181))

(assert (=> b!1401501 m!1289181))

(declare-fun m!1289183 () Bool)

(assert (=> b!1401501 m!1289183))

(assert (=> b!1401501 m!1289167))

(declare-fun m!1289185 () Bool)

(assert (=> b!1401501 m!1289185))

(assert (=> b!1401496 m!1289149))

(assert (=> b!1401496 m!1289149))

(declare-fun m!1289187 () Bool)

(assert (=> b!1401496 m!1289187))

(assert (=> b!1401495 m!1289149))

(assert (=> b!1401495 m!1289149))

(declare-fun m!1289189 () Bool)

(assert (=> b!1401495 m!1289189))

(declare-fun m!1289191 () Bool)

(assert (=> b!1401504 m!1289191))

(check-sat (not b!1401500) (not b!1401496) (not b!1401495) (not b!1401494) (not start!120512) (not b!1401499) (not b!1401498) (not b!1401501) (not b!1401504) (not b!1401503) (not b!1401502))
(check-sat)
