; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120362 () Bool)

(assert start!120362)

(declare-fun b!1400981 () Bool)

(declare-fun e!793247 () Bool)

(declare-fun e!793243 () Bool)

(assert (=> b!1400981 (= e!793247 (not e!793243))))

(declare-fun res!939499 () Bool)

(assert (=> b!1400981 (=> res!939499 e!793243)))

(declare-datatypes ((SeekEntryResult!10553 0))(
  ( (MissingZero!10553 (index!44589 (_ BitVec 32))) (Found!10553 (index!44590 (_ BitVec 32))) (Intermediate!10553 (undefined!11365 Bool) (index!44591 (_ BitVec 32)) (x!126228 (_ BitVec 32))) (Undefined!10553) (MissingVacant!10553 (index!44592 (_ BitVec 32))) )
))
(declare-fun lt!616600 () SeekEntryResult!10553)

(get-info :version)

(assert (=> b!1400981 (= res!939499 (or (not ((_ is Intermediate!10553) lt!616600)) (undefined!11365 lt!616600)))))

(declare-fun e!793246 () Bool)

(assert (=> b!1400981 e!793246))

(declare-fun res!939492 () Bool)

(assert (=> b!1400981 (=> (not res!939492) (not e!793246))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95771 0))(
  ( (array!95772 (arr!46236 (Array (_ BitVec 32) (_ BitVec 64))) (size!46786 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95771)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95771 (_ BitVec 32)) Bool)

(assert (=> b!1400981 (= res!939492 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47110 0))(
  ( (Unit!47111) )
))
(declare-fun lt!616598 () Unit!47110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47110)

(assert (=> b!1400981 (= lt!616598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616604 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95771 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400981 (= lt!616600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616604 (select (arr!46236 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400981 (= lt!616604 (toIndex!0 (select (arr!46236 a!2901) j!112) mask!2840))))

(declare-fun b!1400982 () Bool)

(declare-fun res!939497 () Bool)

(assert (=> b!1400982 (=> (not res!939497) (not e!793247))))

(assert (=> b!1400982 (= res!939497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400983 () Bool)

(declare-fun res!939502 () Bool)

(assert (=> b!1400983 (=> (not res!939502) (not e!793247))))

(declare-datatypes ((List!32755 0))(
  ( (Nil!32752) (Cons!32751 (h!33999 (_ BitVec 64)) (t!47449 List!32755)) )
))
(declare-fun arrayNoDuplicates!0 (array!95771 (_ BitVec 32) List!32755) Bool)

(assert (=> b!1400983 (= res!939502 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32752))))

(declare-fun res!939495 () Bool)

(assert (=> start!120362 (=> (not res!939495) (not e!793247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120362 (= res!939495 (validMask!0 mask!2840))))

(assert (=> start!120362 e!793247))

(assert (=> start!120362 true))

(declare-fun array_inv!35264 (array!95771) Bool)

(assert (=> start!120362 (array_inv!35264 a!2901)))

(declare-fun b!1400984 () Bool)

(declare-fun res!939493 () Bool)

(assert (=> b!1400984 (=> (not res!939493) (not e!793247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400984 (= res!939493 (validKeyInArray!0 (select (arr!46236 a!2901) j!112)))))

(declare-fun b!1400985 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95771 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400985 (= e!793246 (= (seekEntryOrOpen!0 (select (arr!46236 a!2901) j!112) a!2901 mask!2840) (Found!10553 j!112)))))

(declare-fun b!1400986 () Bool)

(declare-fun res!939496 () Bool)

(assert (=> b!1400986 (=> (not res!939496) (not e!793247))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400986 (= res!939496 (and (= (size!46786 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46786 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46786 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400987 () Bool)

(declare-fun e!793244 () Bool)

(assert (=> b!1400987 (= e!793243 e!793244)))

(declare-fun res!939501 () Bool)

(assert (=> b!1400987 (=> res!939501 e!793244)))

(declare-fun lt!616599 () SeekEntryResult!10553)

(assert (=> b!1400987 (= res!939501 (or (= lt!616600 lt!616599) (not ((_ is Intermediate!10553) lt!616599))))))

(declare-fun lt!616605 () array!95771)

(declare-fun lt!616602 () (_ BitVec 64))

(assert (=> b!1400987 (= lt!616599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616602 mask!2840) lt!616602 lt!616605 mask!2840))))

(assert (=> b!1400987 (= lt!616602 (select (store (arr!46236 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400987 (= lt!616605 (array!95772 (store (arr!46236 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46786 a!2901)))))

(declare-fun b!1400988 () Bool)

(declare-fun e!793241 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95771 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1400988 (= e!793241 (= (seekEntryOrOpen!0 lt!616602 lt!616605 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126228 lt!616599) (index!44591 lt!616599) (index!44591 lt!616599) (select (arr!46236 a!2901) j!112) lt!616605 mask!2840)))))

(declare-fun b!1400989 () Bool)

(declare-fun e!793245 () Bool)

(assert (=> b!1400989 (= e!793244 e!793245)))

(declare-fun res!939500 () Bool)

(assert (=> b!1400989 (=> res!939500 e!793245)))

(assert (=> b!1400989 (= res!939500 (or (bvslt (x!126228 lt!616600) #b00000000000000000000000000000000) (bvsgt (x!126228 lt!616600) #b01111111111111111111111111111110) (bvslt (x!126228 lt!616599) #b00000000000000000000000000000000) (bvsgt (x!126228 lt!616599) #b01111111111111111111111111111110) (bvslt lt!616604 #b00000000000000000000000000000000) (bvsge lt!616604 (size!46786 a!2901)) (bvslt (index!44591 lt!616600) #b00000000000000000000000000000000) (bvsge (index!44591 lt!616600) (size!46786 a!2901)) (bvslt (index!44591 lt!616599) #b00000000000000000000000000000000) (bvsge (index!44591 lt!616599) (size!46786 a!2901)) (not (= lt!616600 (Intermediate!10553 false (index!44591 lt!616600) (x!126228 lt!616600)))) (not (= lt!616599 (Intermediate!10553 false (index!44591 lt!616599) (x!126228 lt!616599))))))))

(assert (=> b!1400989 e!793241))

(declare-fun res!939498 () Bool)

(assert (=> b!1400989 (=> (not res!939498) (not e!793241))))

(assert (=> b!1400989 (= res!939498 (and (not (undefined!11365 lt!616599)) (= (index!44591 lt!616599) i!1037) (bvslt (x!126228 lt!616599) (x!126228 lt!616600)) (= (select (store (arr!46236 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44591 lt!616599)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616603 () Unit!47110)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47110)

(assert (=> b!1400989 (= lt!616603 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616604 (x!126228 lt!616600) (index!44591 lt!616600) (x!126228 lt!616599) (index!44591 lt!616599) (undefined!11365 lt!616599) mask!2840))))

(declare-fun b!1400990 () Bool)

(declare-fun res!939494 () Bool)

(assert (=> b!1400990 (=> (not res!939494) (not e!793247))))

(assert (=> b!1400990 (= res!939494 (validKeyInArray!0 (select (arr!46236 a!2901) i!1037)))))

(declare-fun b!1400991 () Bool)

(assert (=> b!1400991 (= e!793245 true)))

(declare-fun lt!616601 () SeekEntryResult!10553)

(assert (=> b!1400991 (= lt!616601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616604 lt!616602 lt!616605 mask!2840))))

(assert (= (and start!120362 res!939495) b!1400986))

(assert (= (and b!1400986 res!939496) b!1400990))

(assert (= (and b!1400990 res!939494) b!1400984))

(assert (= (and b!1400984 res!939493) b!1400982))

(assert (= (and b!1400982 res!939497) b!1400983))

(assert (= (and b!1400983 res!939502) b!1400981))

(assert (= (and b!1400981 res!939492) b!1400985))

(assert (= (and b!1400981 (not res!939499)) b!1400987))

(assert (= (and b!1400987 (not res!939501)) b!1400989))

(assert (= (and b!1400989 res!939498) b!1400988))

(assert (= (and b!1400989 (not res!939500)) b!1400991))

(declare-fun m!1288613 () Bool)

(assert (=> b!1400985 m!1288613))

(assert (=> b!1400985 m!1288613))

(declare-fun m!1288615 () Bool)

(assert (=> b!1400985 m!1288615))

(declare-fun m!1288617 () Bool)

(assert (=> b!1400989 m!1288617))

(declare-fun m!1288619 () Bool)

(assert (=> b!1400989 m!1288619))

(declare-fun m!1288621 () Bool)

(assert (=> b!1400989 m!1288621))

(declare-fun m!1288623 () Bool)

(assert (=> b!1400991 m!1288623))

(declare-fun m!1288625 () Bool)

(assert (=> b!1400990 m!1288625))

(assert (=> b!1400990 m!1288625))

(declare-fun m!1288627 () Bool)

(assert (=> b!1400990 m!1288627))

(declare-fun m!1288629 () Bool)

(assert (=> b!1400982 m!1288629))

(declare-fun m!1288631 () Bool)

(assert (=> b!1400988 m!1288631))

(assert (=> b!1400988 m!1288613))

(assert (=> b!1400988 m!1288613))

(declare-fun m!1288633 () Bool)

(assert (=> b!1400988 m!1288633))

(declare-fun m!1288635 () Bool)

(assert (=> start!120362 m!1288635))

(declare-fun m!1288637 () Bool)

(assert (=> start!120362 m!1288637))

(assert (=> b!1400981 m!1288613))

(declare-fun m!1288639 () Bool)

(assert (=> b!1400981 m!1288639))

(assert (=> b!1400981 m!1288613))

(declare-fun m!1288641 () Bool)

(assert (=> b!1400981 m!1288641))

(assert (=> b!1400981 m!1288613))

(declare-fun m!1288643 () Bool)

(assert (=> b!1400981 m!1288643))

(declare-fun m!1288645 () Bool)

(assert (=> b!1400981 m!1288645))

(assert (=> b!1400984 m!1288613))

(assert (=> b!1400984 m!1288613))

(declare-fun m!1288647 () Bool)

(assert (=> b!1400984 m!1288647))

(declare-fun m!1288649 () Bool)

(assert (=> b!1400983 m!1288649))

(declare-fun m!1288651 () Bool)

(assert (=> b!1400987 m!1288651))

(assert (=> b!1400987 m!1288651))

(declare-fun m!1288653 () Bool)

(assert (=> b!1400987 m!1288653))

(assert (=> b!1400987 m!1288617))

(declare-fun m!1288655 () Bool)

(assert (=> b!1400987 m!1288655))

(check-sat (not b!1400984) (not start!120362) (not b!1400989) (not b!1400988) (not b!1400990) (not b!1400985) (not b!1400991) (not b!1400981) (not b!1400983) (not b!1400982) (not b!1400987))
(check-sat)
