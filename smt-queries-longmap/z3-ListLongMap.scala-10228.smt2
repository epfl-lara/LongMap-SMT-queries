; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120416 () Bool)

(assert start!120416)

(declare-fun res!940423 () Bool)

(declare-fun e!793816 () Bool)

(assert (=> start!120416 (=> (not res!940423) (not e!793816))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120416 (= res!940423 (validMask!0 mask!2840))))

(assert (=> start!120416 e!793816))

(assert (=> start!120416 true))

(declare-datatypes ((array!95778 0))(
  ( (array!95779 (arr!46240 (Array (_ BitVec 32) (_ BitVec 64))) (size!46792 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95778)

(declare-fun array_inv!35473 (array!95778) Bool)

(assert (=> start!120416 (array_inv!35473 a!2901)))

(declare-fun b!1401857 () Bool)

(declare-fun e!793812 () Bool)

(assert (=> b!1401857 (= e!793812 true)))

(declare-fun lt!617104 () (_ BitVec 64))

(declare-fun lt!617107 () array!95778)

(declare-datatypes ((SeekEntryResult!10583 0))(
  ( (MissingZero!10583 (index!44709 (_ BitVec 32))) (Found!10583 (index!44710 (_ BitVec 32))) (Intermediate!10583 (undefined!11395 Bool) (index!44711 (_ BitVec 32)) (x!126335 (_ BitVec 32))) (Undefined!10583) (MissingVacant!10583 (index!44712 (_ BitVec 32))) )
))
(declare-fun lt!617108 () SeekEntryResult!10583)

(declare-fun lt!617105 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95778 (_ BitVec 32)) SeekEntryResult!10583)

(assert (=> b!1401857 (= lt!617108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617105 lt!617104 lt!617107 mask!2840))))

(declare-fun b!1401858 () Bool)

(declare-fun e!793814 () Bool)

(assert (=> b!1401858 (= e!793816 (not e!793814))))

(declare-fun res!940428 () Bool)

(assert (=> b!1401858 (=> res!940428 e!793814)))

(declare-fun lt!617106 () SeekEntryResult!10583)

(get-info :version)

(assert (=> b!1401858 (= res!940428 (or (not ((_ is Intermediate!10583) lt!617106)) (undefined!11395 lt!617106)))))

(declare-fun e!793815 () Bool)

(assert (=> b!1401858 e!793815))

(declare-fun res!940419 () Bool)

(assert (=> b!1401858 (=> (not res!940419) (not e!793815))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95778 (_ BitVec 32)) Bool)

(assert (=> b!1401858 (= res!940419 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47013 0))(
  ( (Unit!47014) )
))
(declare-fun lt!617111 () Unit!47013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47013)

(assert (=> b!1401858 (= lt!617111 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401858 (= lt!617106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617105 (select (arr!46240 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401858 (= lt!617105 (toIndex!0 (select (arr!46240 a!2901) j!112) mask!2840))))

(declare-fun b!1401859 () Bool)

(declare-fun e!793813 () Bool)

(assert (=> b!1401859 (= e!793814 e!793813)))

(declare-fun res!940425 () Bool)

(assert (=> b!1401859 (=> res!940425 e!793813)))

(declare-fun lt!617109 () SeekEntryResult!10583)

(assert (=> b!1401859 (= res!940425 (or (= lt!617106 lt!617109) (not ((_ is Intermediate!10583) lt!617109))))))

(assert (=> b!1401859 (= lt!617109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617104 mask!2840) lt!617104 lt!617107 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401859 (= lt!617104 (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401859 (= lt!617107 (array!95779 (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46792 a!2901)))))

(declare-fun b!1401860 () Bool)

(declare-fun res!940429 () Bool)

(assert (=> b!1401860 (=> (not res!940429) (not e!793816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401860 (= res!940429 (validKeyInArray!0 (select (arr!46240 a!2901) i!1037)))))

(declare-fun b!1401861 () Bool)

(declare-fun res!940427 () Bool)

(assert (=> b!1401861 (=> (not res!940427) (not e!793816))))

(assert (=> b!1401861 (= res!940427 (and (= (size!46792 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46792 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46792 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401862 () Bool)

(assert (=> b!1401862 (= e!793813 e!793812)))

(declare-fun res!940424 () Bool)

(assert (=> b!1401862 (=> res!940424 e!793812)))

(assert (=> b!1401862 (= res!940424 (or (bvslt (x!126335 lt!617106) #b00000000000000000000000000000000) (bvsgt (x!126335 lt!617106) #b01111111111111111111111111111110) (bvslt (x!126335 lt!617109) #b00000000000000000000000000000000) (bvsgt (x!126335 lt!617109) #b01111111111111111111111111111110) (bvslt lt!617105 #b00000000000000000000000000000000) (bvsge lt!617105 (size!46792 a!2901)) (bvslt (index!44711 lt!617106) #b00000000000000000000000000000000) (bvsge (index!44711 lt!617106) (size!46792 a!2901)) (bvslt (index!44711 lt!617109) #b00000000000000000000000000000000) (bvsge (index!44711 lt!617109) (size!46792 a!2901)) (not (= lt!617106 (Intermediate!10583 false (index!44711 lt!617106) (x!126335 lt!617106)))) (not (= lt!617109 (Intermediate!10583 false (index!44711 lt!617109) (x!126335 lt!617109))))))))

(declare-fun e!793817 () Bool)

(assert (=> b!1401862 e!793817))

(declare-fun res!940422 () Bool)

(assert (=> b!1401862 (=> (not res!940422) (not e!793817))))

(assert (=> b!1401862 (= res!940422 (and (not (undefined!11395 lt!617109)) (= (index!44711 lt!617109) i!1037) (bvslt (x!126335 lt!617109) (x!126335 lt!617106)) (= (select (store (arr!46240 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44711 lt!617109)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617110 () Unit!47013)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47013)

(assert (=> b!1401862 (= lt!617110 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617105 (x!126335 lt!617106) (index!44711 lt!617106) (x!126335 lt!617109) (index!44711 lt!617109) (undefined!11395 lt!617109) mask!2840))))

(declare-fun b!1401863 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95778 (_ BitVec 32)) SeekEntryResult!10583)

(assert (=> b!1401863 (= e!793815 (= (seekEntryOrOpen!0 (select (arr!46240 a!2901) j!112) a!2901 mask!2840) (Found!10583 j!112)))))

(declare-fun b!1401864 () Bool)

(declare-fun res!940420 () Bool)

(assert (=> b!1401864 (=> (not res!940420) (not e!793816))))

(assert (=> b!1401864 (= res!940420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401865 () Bool)

(declare-fun res!940426 () Bool)

(assert (=> b!1401865 (=> (not res!940426) (not e!793816))))

(declare-datatypes ((List!32837 0))(
  ( (Nil!32834) (Cons!32833 (h!34081 (_ BitVec 64)) (t!47523 List!32837)) )
))
(declare-fun arrayNoDuplicates!0 (array!95778 (_ BitVec 32) List!32837) Bool)

(assert (=> b!1401865 (= res!940426 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32834))))

(declare-fun b!1401866 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95778 (_ BitVec 32)) SeekEntryResult!10583)

(assert (=> b!1401866 (= e!793817 (= (seekEntryOrOpen!0 lt!617104 lt!617107 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126335 lt!617109) (index!44711 lt!617109) (index!44711 lt!617109) (select (arr!46240 a!2901) j!112) lt!617107 mask!2840)))))

(declare-fun b!1401867 () Bool)

(declare-fun res!940421 () Bool)

(assert (=> b!1401867 (=> (not res!940421) (not e!793816))))

(assert (=> b!1401867 (= res!940421 (validKeyInArray!0 (select (arr!46240 a!2901) j!112)))))

(assert (= (and start!120416 res!940423) b!1401861))

(assert (= (and b!1401861 res!940427) b!1401860))

(assert (= (and b!1401860 res!940429) b!1401867))

(assert (= (and b!1401867 res!940421) b!1401864))

(assert (= (and b!1401864 res!940420) b!1401865))

(assert (= (and b!1401865 res!940426) b!1401858))

(assert (= (and b!1401858 res!940419) b!1401863))

(assert (= (and b!1401858 (not res!940428)) b!1401859))

(assert (= (and b!1401859 (not res!940425)) b!1401862))

(assert (= (and b!1401862 res!940422) b!1401866))

(assert (= (and b!1401862 (not res!940424)) b!1401857))

(declare-fun m!1289353 () Bool)

(assert (=> b!1401865 m!1289353))

(declare-fun m!1289355 () Bool)

(assert (=> b!1401859 m!1289355))

(assert (=> b!1401859 m!1289355))

(declare-fun m!1289357 () Bool)

(assert (=> b!1401859 m!1289357))

(declare-fun m!1289359 () Bool)

(assert (=> b!1401859 m!1289359))

(declare-fun m!1289361 () Bool)

(assert (=> b!1401859 m!1289361))

(declare-fun m!1289363 () Bool)

(assert (=> b!1401864 m!1289363))

(assert (=> b!1401862 m!1289359))

(declare-fun m!1289365 () Bool)

(assert (=> b!1401862 m!1289365))

(declare-fun m!1289367 () Bool)

(assert (=> b!1401862 m!1289367))

(declare-fun m!1289369 () Bool)

(assert (=> start!120416 m!1289369))

(declare-fun m!1289371 () Bool)

(assert (=> start!120416 m!1289371))

(declare-fun m!1289373 () Bool)

(assert (=> b!1401858 m!1289373))

(declare-fun m!1289375 () Bool)

(assert (=> b!1401858 m!1289375))

(assert (=> b!1401858 m!1289373))

(declare-fun m!1289377 () Bool)

(assert (=> b!1401858 m!1289377))

(assert (=> b!1401858 m!1289373))

(declare-fun m!1289379 () Bool)

(assert (=> b!1401858 m!1289379))

(declare-fun m!1289381 () Bool)

(assert (=> b!1401858 m!1289381))

(assert (=> b!1401867 m!1289373))

(assert (=> b!1401867 m!1289373))

(declare-fun m!1289383 () Bool)

(assert (=> b!1401867 m!1289383))

(declare-fun m!1289385 () Bool)

(assert (=> b!1401857 m!1289385))

(assert (=> b!1401863 m!1289373))

(assert (=> b!1401863 m!1289373))

(declare-fun m!1289387 () Bool)

(assert (=> b!1401863 m!1289387))

(declare-fun m!1289389 () Bool)

(assert (=> b!1401860 m!1289389))

(assert (=> b!1401860 m!1289389))

(declare-fun m!1289391 () Bool)

(assert (=> b!1401860 m!1289391))

(declare-fun m!1289393 () Bool)

(assert (=> b!1401866 m!1289393))

(assert (=> b!1401866 m!1289373))

(assert (=> b!1401866 m!1289373))

(declare-fun m!1289395 () Bool)

(assert (=> b!1401866 m!1289395))

(check-sat (not b!1401857) (not b!1401864) (not start!120416) (not b!1401862) (not b!1401866) (not b!1401867) (not b!1401860) (not b!1401863) (not b!1401865) (not b!1401859) (not b!1401858))
(check-sat)
