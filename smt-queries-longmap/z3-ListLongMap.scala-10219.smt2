; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120362 () Bool)

(assert start!120362)

(declare-fun b!1400966 () Bool)

(declare-fun e!793244 () Bool)

(declare-fun e!793250 () Bool)

(assert (=> b!1400966 (= e!793244 e!793250)))

(declare-fun res!939529 () Bool)

(assert (=> b!1400966 (=> res!939529 e!793250)))

(declare-datatypes ((SeekEntryResult!10556 0))(
  ( (MissingZero!10556 (index!44601 (_ BitVec 32))) (Found!10556 (index!44602 (_ BitVec 32))) (Intermediate!10556 (undefined!11368 Bool) (index!44603 (_ BitVec 32)) (x!126236 (_ BitVec 32))) (Undefined!10556) (MissingVacant!10556 (index!44604 (_ BitVec 32))) )
))
(declare-fun lt!616461 () SeekEntryResult!10556)

(declare-fun lt!616462 () SeekEntryResult!10556)

(get-info :version)

(assert (=> b!1400966 (= res!939529 (or (= lt!616461 lt!616462) (not ((_ is Intermediate!10556) lt!616462))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616457 () (_ BitVec 64))

(declare-datatypes ((array!95724 0))(
  ( (array!95725 (arr!46213 (Array (_ BitVec 32) (_ BitVec 64))) (size!46765 (_ BitVec 32))) )
))
(declare-fun lt!616460 () array!95724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95724 (_ BitVec 32)) SeekEntryResult!10556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400966 (= lt!616462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616457 mask!2840) lt!616457 lt!616460 mask!2840))))

(declare-fun a!2901 () array!95724)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400966 (= lt!616457 (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400966 (= lt!616460 (array!95725 (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46765 a!2901)))))

(declare-fun e!793246 () Bool)

(declare-fun b!1400967 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95724 (_ BitVec 32)) SeekEntryResult!10556)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95724 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1400967 (= e!793246 (= (seekEntryOrOpen!0 lt!616457 lt!616460 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126236 lt!616462) (index!44603 lt!616462) (index!44603 lt!616462) (select (arr!46213 a!2901) j!112) lt!616460 mask!2840)))))

(declare-fun b!1400968 () Bool)

(declare-fun res!939531 () Bool)

(declare-fun e!793245 () Bool)

(assert (=> b!1400968 (=> (not res!939531) (not e!793245))))

(declare-datatypes ((List!32810 0))(
  ( (Nil!32807) (Cons!32806 (h!34054 (_ BitVec 64)) (t!47496 List!32810)) )
))
(declare-fun arrayNoDuplicates!0 (array!95724 (_ BitVec 32) List!32810) Bool)

(assert (=> b!1400968 (= res!939531 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32807))))

(declare-fun b!1400969 () Bool)

(declare-fun res!939535 () Bool)

(assert (=> b!1400969 (=> (not res!939535) (not e!793245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400969 (= res!939535 (validKeyInArray!0 (select (arr!46213 a!2901) j!112)))))

(declare-fun b!1400970 () Bool)

(declare-fun res!939538 () Bool)

(assert (=> b!1400970 (=> (not res!939538) (not e!793245))))

(assert (=> b!1400970 (= res!939538 (and (= (size!46765 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46765 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46765 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400971 () Bool)

(declare-fun e!793248 () Bool)

(assert (=> b!1400971 (= e!793250 e!793248)))

(declare-fun res!939534 () Bool)

(assert (=> b!1400971 (=> res!939534 e!793248)))

(declare-fun lt!616458 () (_ BitVec 32))

(assert (=> b!1400971 (= res!939534 (or (bvslt (x!126236 lt!616461) #b00000000000000000000000000000000) (bvsgt (x!126236 lt!616461) #b01111111111111111111111111111110) (bvslt (x!126236 lt!616462) #b00000000000000000000000000000000) (bvsgt (x!126236 lt!616462) #b01111111111111111111111111111110) (bvslt lt!616458 #b00000000000000000000000000000000) (bvsge lt!616458 (size!46765 a!2901)) (bvslt (index!44603 lt!616461) #b00000000000000000000000000000000) (bvsge (index!44603 lt!616461) (size!46765 a!2901)) (bvslt (index!44603 lt!616462) #b00000000000000000000000000000000) (bvsge (index!44603 lt!616462) (size!46765 a!2901)) (not (= lt!616461 (Intermediate!10556 false (index!44603 lt!616461) (x!126236 lt!616461)))) (not (= lt!616462 (Intermediate!10556 false (index!44603 lt!616462) (x!126236 lt!616462))))))))

(assert (=> b!1400971 e!793246))

(declare-fun res!939530 () Bool)

(assert (=> b!1400971 (=> (not res!939530) (not e!793246))))

(assert (=> b!1400971 (= res!939530 (and (not (undefined!11368 lt!616462)) (= (index!44603 lt!616462) i!1037) (bvslt (x!126236 lt!616462) (x!126236 lt!616461)) (= (select (store (arr!46213 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44603 lt!616462)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46959 0))(
  ( (Unit!46960) )
))
(declare-fun lt!616463 () Unit!46959)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46959)

(assert (=> b!1400971 (= lt!616463 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616458 (x!126236 lt!616461) (index!44603 lt!616461) (x!126236 lt!616462) (index!44603 lt!616462) (undefined!11368 lt!616462) mask!2840))))

(declare-fun res!939533 () Bool)

(assert (=> start!120362 (=> (not res!939533) (not e!793245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120362 (= res!939533 (validMask!0 mask!2840))))

(assert (=> start!120362 e!793245))

(assert (=> start!120362 true))

(declare-fun array_inv!35446 (array!95724) Bool)

(assert (=> start!120362 (array_inv!35446 a!2901)))

(declare-fun b!1400972 () Bool)

(assert (=> b!1400972 (= e!793248 true)))

(declare-fun lt!616459 () SeekEntryResult!10556)

(assert (=> b!1400972 (= lt!616459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616458 lt!616457 lt!616460 mask!2840))))

(declare-fun b!1400973 () Bool)

(declare-fun res!939536 () Bool)

(assert (=> b!1400973 (=> (not res!939536) (not e!793245))))

(assert (=> b!1400973 (= res!939536 (validKeyInArray!0 (select (arr!46213 a!2901) i!1037)))))

(declare-fun b!1400974 () Bool)

(declare-fun res!939528 () Bool)

(assert (=> b!1400974 (=> (not res!939528) (not e!793245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95724 (_ BitVec 32)) Bool)

(assert (=> b!1400974 (= res!939528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400975 () Bool)

(assert (=> b!1400975 (= e!793245 (not e!793244))))

(declare-fun res!939532 () Bool)

(assert (=> b!1400975 (=> res!939532 e!793244)))

(assert (=> b!1400975 (= res!939532 (or (not ((_ is Intermediate!10556) lt!616461)) (undefined!11368 lt!616461)))))

(declare-fun e!793247 () Bool)

(assert (=> b!1400975 e!793247))

(declare-fun res!939537 () Bool)

(assert (=> b!1400975 (=> (not res!939537) (not e!793247))))

(assert (=> b!1400975 (= res!939537 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616456 () Unit!46959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46959)

(assert (=> b!1400975 (= lt!616456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400975 (= lt!616461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616458 (select (arr!46213 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400975 (= lt!616458 (toIndex!0 (select (arr!46213 a!2901) j!112) mask!2840))))

(declare-fun b!1400976 () Bool)

(assert (=> b!1400976 (= e!793247 (= (seekEntryOrOpen!0 (select (arr!46213 a!2901) j!112) a!2901 mask!2840) (Found!10556 j!112)))))

(assert (= (and start!120362 res!939533) b!1400970))

(assert (= (and b!1400970 res!939538) b!1400973))

(assert (= (and b!1400973 res!939536) b!1400969))

(assert (= (and b!1400969 res!939535) b!1400974))

(assert (= (and b!1400974 res!939528) b!1400968))

(assert (= (and b!1400968 res!939531) b!1400975))

(assert (= (and b!1400975 res!939537) b!1400976))

(assert (= (and b!1400975 (not res!939532)) b!1400966))

(assert (= (and b!1400966 (not res!939529)) b!1400971))

(assert (= (and b!1400971 res!939530) b!1400967))

(assert (= (and b!1400971 (not res!939534)) b!1400972))

(declare-fun m!1288165 () Bool)

(assert (=> b!1400968 m!1288165))

(declare-fun m!1288167 () Bool)

(assert (=> b!1400971 m!1288167))

(declare-fun m!1288169 () Bool)

(assert (=> b!1400971 m!1288169))

(declare-fun m!1288171 () Bool)

(assert (=> b!1400971 m!1288171))

(declare-fun m!1288173 () Bool)

(assert (=> b!1400976 m!1288173))

(assert (=> b!1400976 m!1288173))

(declare-fun m!1288175 () Bool)

(assert (=> b!1400976 m!1288175))

(assert (=> b!1400975 m!1288173))

(declare-fun m!1288177 () Bool)

(assert (=> b!1400975 m!1288177))

(assert (=> b!1400975 m!1288173))

(assert (=> b!1400975 m!1288173))

(declare-fun m!1288179 () Bool)

(assert (=> b!1400975 m!1288179))

(declare-fun m!1288181 () Bool)

(assert (=> b!1400975 m!1288181))

(declare-fun m!1288183 () Bool)

(assert (=> b!1400975 m!1288183))

(declare-fun m!1288185 () Bool)

(assert (=> b!1400967 m!1288185))

(assert (=> b!1400967 m!1288173))

(assert (=> b!1400967 m!1288173))

(declare-fun m!1288187 () Bool)

(assert (=> b!1400967 m!1288187))

(assert (=> b!1400969 m!1288173))

(assert (=> b!1400969 m!1288173))

(declare-fun m!1288189 () Bool)

(assert (=> b!1400969 m!1288189))

(declare-fun m!1288191 () Bool)

(assert (=> b!1400966 m!1288191))

(assert (=> b!1400966 m!1288191))

(declare-fun m!1288193 () Bool)

(assert (=> b!1400966 m!1288193))

(assert (=> b!1400966 m!1288167))

(declare-fun m!1288195 () Bool)

(assert (=> b!1400966 m!1288195))

(declare-fun m!1288197 () Bool)

(assert (=> b!1400973 m!1288197))

(assert (=> b!1400973 m!1288197))

(declare-fun m!1288199 () Bool)

(assert (=> b!1400973 m!1288199))

(declare-fun m!1288201 () Bool)

(assert (=> b!1400972 m!1288201))

(declare-fun m!1288203 () Bool)

(assert (=> b!1400974 m!1288203))

(declare-fun m!1288205 () Bool)

(assert (=> start!120362 m!1288205))

(declare-fun m!1288207 () Bool)

(assert (=> start!120362 m!1288207))

(check-sat (not b!1400972) (not b!1400966) (not b!1400976) (not b!1400974) (not b!1400968) (not b!1400967) (not start!120362) (not b!1400973) (not b!1400975) (not b!1400969) (not b!1400971))
(check-sat)
