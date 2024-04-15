; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120368 () Bool)

(assert start!120368)

(declare-fun b!1401065 () Bool)

(declare-fun e!793312 () Bool)

(assert (=> b!1401065 (= e!793312 true)))

(declare-datatypes ((SeekEntryResult!10559 0))(
  ( (MissingZero!10559 (index!44613 (_ BitVec 32))) (Found!10559 (index!44614 (_ BitVec 32))) (Intermediate!10559 (undefined!11371 Bool) (index!44615 (_ BitVec 32)) (x!126247 (_ BitVec 32))) (Undefined!10559) (MissingVacant!10559 (index!44616 (_ BitVec 32))) )
))
(declare-fun lt!616532 () SeekEntryResult!10559)

(declare-datatypes ((array!95730 0))(
  ( (array!95731 (arr!46216 (Array (_ BitVec 32) (_ BitVec 64))) (size!46768 (_ BitVec 32))) )
))
(declare-fun lt!616533 () array!95730)

(declare-fun lt!616534 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616535 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95730 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401065 (= lt!616532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616534 lt!616535 lt!616533 mask!2840))))

(declare-fun b!1401066 () Bool)

(declare-fun e!793310 () Bool)

(declare-fun e!793313 () Bool)

(assert (=> b!1401066 (= e!793310 (not e!793313))))

(declare-fun res!939629 () Bool)

(assert (=> b!1401066 (=> res!939629 e!793313)))

(declare-fun lt!616529 () SeekEntryResult!10559)

(get-info :version)

(assert (=> b!1401066 (= res!939629 (or (not ((_ is Intermediate!10559) lt!616529)) (undefined!11371 lt!616529)))))

(declare-fun e!793307 () Bool)

(assert (=> b!1401066 e!793307))

(declare-fun res!939628 () Bool)

(assert (=> b!1401066 (=> (not res!939628) (not e!793307))))

(declare-fun a!2901 () array!95730)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95730 (_ BitVec 32)) Bool)

(assert (=> b!1401066 (= res!939628 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46965 0))(
  ( (Unit!46966) )
))
(declare-fun lt!616528 () Unit!46965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46965)

(assert (=> b!1401066 (= lt!616528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401066 (= lt!616529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616534 (select (arr!46216 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401066 (= lt!616534 (toIndex!0 (select (arr!46216 a!2901) j!112) mask!2840))))

(declare-fun b!1401067 () Bool)

(declare-fun e!793311 () Bool)

(assert (=> b!1401067 (= e!793311 e!793312)))

(declare-fun res!939633 () Bool)

(assert (=> b!1401067 (=> res!939633 e!793312)))

(declare-fun lt!616531 () SeekEntryResult!10559)

(assert (=> b!1401067 (= res!939633 (or (bvslt (x!126247 lt!616529) #b00000000000000000000000000000000) (bvsgt (x!126247 lt!616529) #b01111111111111111111111111111110) (bvslt (x!126247 lt!616531) #b00000000000000000000000000000000) (bvsgt (x!126247 lt!616531) #b01111111111111111111111111111110) (bvslt lt!616534 #b00000000000000000000000000000000) (bvsge lt!616534 (size!46768 a!2901)) (bvslt (index!44615 lt!616529) #b00000000000000000000000000000000) (bvsge (index!44615 lt!616529) (size!46768 a!2901)) (bvslt (index!44615 lt!616531) #b00000000000000000000000000000000) (bvsge (index!44615 lt!616531) (size!46768 a!2901)) (not (= lt!616529 (Intermediate!10559 false (index!44615 lt!616529) (x!126247 lt!616529)))) (not (= lt!616531 (Intermediate!10559 false (index!44615 lt!616531) (x!126247 lt!616531))))))))

(declare-fun e!793309 () Bool)

(assert (=> b!1401067 e!793309))

(declare-fun res!939634 () Bool)

(assert (=> b!1401067 (=> (not res!939634) (not e!793309))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401067 (= res!939634 (and (not (undefined!11371 lt!616531)) (= (index!44615 lt!616531) i!1037) (bvslt (x!126247 lt!616531) (x!126247 lt!616529)) (= (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44615 lt!616531)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616530 () Unit!46965)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46965)

(assert (=> b!1401067 (= lt!616530 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616534 (x!126247 lt!616529) (index!44615 lt!616529) (x!126247 lt!616531) (index!44615 lt!616531) (undefined!11371 lt!616531) mask!2840))))

(declare-fun b!1401068 () Bool)

(declare-fun res!939636 () Bool)

(assert (=> b!1401068 (=> (not res!939636) (not e!793310))))

(assert (=> b!1401068 (= res!939636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401070 () Bool)

(declare-fun res!939632 () Bool)

(assert (=> b!1401070 (=> (not res!939632) (not e!793310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401070 (= res!939632 (validKeyInArray!0 (select (arr!46216 a!2901) i!1037)))))

(declare-fun b!1401071 () Bool)

(declare-fun res!939635 () Bool)

(assert (=> b!1401071 (=> (not res!939635) (not e!793310))))

(assert (=> b!1401071 (= res!939635 (and (= (size!46768 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46768 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46768 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401072 () Bool)

(declare-fun res!939637 () Bool)

(assert (=> b!1401072 (=> (not res!939637) (not e!793310))))

(assert (=> b!1401072 (= res!939637 (validKeyInArray!0 (select (arr!46216 a!2901) j!112)))))

(declare-fun b!1401073 () Bool)

(assert (=> b!1401073 (= e!793313 e!793311)))

(declare-fun res!939631 () Bool)

(assert (=> b!1401073 (=> res!939631 e!793311)))

(assert (=> b!1401073 (= res!939631 (or (= lt!616529 lt!616531) (not ((_ is Intermediate!10559) lt!616531))))))

(assert (=> b!1401073 (= lt!616531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616535 mask!2840) lt!616535 lt!616533 mask!2840))))

(assert (=> b!1401073 (= lt!616535 (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401073 (= lt!616533 (array!95731 (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46768 a!2901)))))

(declare-fun b!1401069 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95730 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401069 (= e!793307 (= (seekEntryOrOpen!0 (select (arr!46216 a!2901) j!112) a!2901 mask!2840) (Found!10559 j!112)))))

(declare-fun res!939630 () Bool)

(assert (=> start!120368 (=> (not res!939630) (not e!793310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120368 (= res!939630 (validMask!0 mask!2840))))

(assert (=> start!120368 e!793310))

(assert (=> start!120368 true))

(declare-fun array_inv!35449 (array!95730) Bool)

(assert (=> start!120368 (array_inv!35449 a!2901)))

(declare-fun b!1401074 () Bool)

(declare-fun res!939627 () Bool)

(assert (=> b!1401074 (=> (not res!939627) (not e!793310))))

(declare-datatypes ((List!32813 0))(
  ( (Nil!32810) (Cons!32809 (h!34057 (_ BitVec 64)) (t!47499 List!32813)) )
))
(declare-fun arrayNoDuplicates!0 (array!95730 (_ BitVec 32) List!32813) Bool)

(assert (=> b!1401074 (= res!939627 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32810))))

(declare-fun b!1401075 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95730 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401075 (= e!793309 (= (seekEntryOrOpen!0 lt!616535 lt!616533 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126247 lt!616531) (index!44615 lt!616531) (index!44615 lt!616531) (select (arr!46216 a!2901) j!112) lt!616533 mask!2840)))))

(assert (= (and start!120368 res!939630) b!1401071))

(assert (= (and b!1401071 res!939635) b!1401070))

(assert (= (and b!1401070 res!939632) b!1401072))

(assert (= (and b!1401072 res!939637) b!1401068))

(assert (= (and b!1401068 res!939636) b!1401074))

(assert (= (and b!1401074 res!939627) b!1401066))

(assert (= (and b!1401066 res!939628) b!1401069))

(assert (= (and b!1401066 (not res!939629)) b!1401073))

(assert (= (and b!1401073 (not res!939631)) b!1401067))

(assert (= (and b!1401067 res!939634) b!1401075))

(assert (= (and b!1401067 (not res!939633)) b!1401065))

(declare-fun m!1288297 () Bool)

(assert (=> b!1401073 m!1288297))

(assert (=> b!1401073 m!1288297))

(declare-fun m!1288299 () Bool)

(assert (=> b!1401073 m!1288299))

(declare-fun m!1288301 () Bool)

(assert (=> b!1401073 m!1288301))

(declare-fun m!1288303 () Bool)

(assert (=> b!1401073 m!1288303))

(declare-fun m!1288305 () Bool)

(assert (=> b!1401074 m!1288305))

(declare-fun m!1288307 () Bool)

(assert (=> b!1401075 m!1288307))

(declare-fun m!1288309 () Bool)

(assert (=> b!1401075 m!1288309))

(assert (=> b!1401075 m!1288309))

(declare-fun m!1288311 () Bool)

(assert (=> b!1401075 m!1288311))

(declare-fun m!1288313 () Bool)

(assert (=> b!1401068 m!1288313))

(assert (=> b!1401066 m!1288309))

(declare-fun m!1288315 () Bool)

(assert (=> b!1401066 m!1288315))

(assert (=> b!1401066 m!1288309))

(assert (=> b!1401066 m!1288309))

(declare-fun m!1288317 () Bool)

(assert (=> b!1401066 m!1288317))

(declare-fun m!1288319 () Bool)

(assert (=> b!1401066 m!1288319))

(declare-fun m!1288321 () Bool)

(assert (=> b!1401066 m!1288321))

(assert (=> b!1401069 m!1288309))

(assert (=> b!1401069 m!1288309))

(declare-fun m!1288323 () Bool)

(assert (=> b!1401069 m!1288323))

(declare-fun m!1288325 () Bool)

(assert (=> start!120368 m!1288325))

(declare-fun m!1288327 () Bool)

(assert (=> start!120368 m!1288327))

(declare-fun m!1288329 () Bool)

(assert (=> b!1401070 m!1288329))

(assert (=> b!1401070 m!1288329))

(declare-fun m!1288331 () Bool)

(assert (=> b!1401070 m!1288331))

(declare-fun m!1288333 () Bool)

(assert (=> b!1401065 m!1288333))

(assert (=> b!1401067 m!1288301))

(declare-fun m!1288335 () Bool)

(assert (=> b!1401067 m!1288335))

(declare-fun m!1288337 () Bool)

(assert (=> b!1401067 m!1288337))

(assert (=> b!1401072 m!1288309))

(assert (=> b!1401072 m!1288309))

(declare-fun m!1288339 () Bool)

(assert (=> b!1401072 m!1288339))

(check-sat (not b!1401067) (not b!1401065) (not b!1401072) (not b!1401070) (not start!120368) (not b!1401075) (not b!1401073) (not b!1401069) (not b!1401068) (not b!1401066) (not b!1401074))
(check-sat)
