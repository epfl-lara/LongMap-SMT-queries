; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120374 () Bool)

(assert start!120374)

(declare-fun b!1401179 () Bool)

(declare-fun e!793371 () Bool)

(declare-fun e!793369 () Bool)

(assert (=> b!1401179 (= e!793371 (not e!793369))))

(declare-fun res!939692 () Bool)

(assert (=> b!1401179 (=> res!939692 e!793369)))

(declare-datatypes ((SeekEntryResult!10559 0))(
  ( (MissingZero!10559 (index!44613 (_ BitVec 32))) (Found!10559 (index!44614 (_ BitVec 32))) (Intermediate!10559 (undefined!11371 Bool) (index!44615 (_ BitVec 32)) (x!126250 (_ BitVec 32))) (Undefined!10559) (MissingVacant!10559 (index!44616 (_ BitVec 32))) )
))
(declare-fun lt!616745 () SeekEntryResult!10559)

(get-info :version)

(assert (=> b!1401179 (= res!939692 (or (not ((_ is Intermediate!10559) lt!616745)) (undefined!11371 lt!616745)))))

(declare-fun e!793368 () Bool)

(assert (=> b!1401179 e!793368))

(declare-fun res!939690 () Bool)

(assert (=> b!1401179 (=> (not res!939690) (not e!793368))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95783 0))(
  ( (array!95784 (arr!46242 (Array (_ BitVec 32) (_ BitVec 64))) (size!46792 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95783)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95783 (_ BitVec 32)) Bool)

(assert (=> b!1401179 (= res!939690 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47122 0))(
  ( (Unit!47123) )
))
(declare-fun lt!616742 () Unit!47122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47122)

(assert (=> b!1401179 (= lt!616742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616747 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95783 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401179 (= lt!616745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616747 (select (arr!46242 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401179 (= lt!616747 (toIndex!0 (select (arr!46242 a!2901) j!112) mask!2840))))

(declare-fun b!1401181 () Bool)

(declare-fun e!793372 () Bool)

(assert (=> b!1401181 (= e!793369 e!793372)))

(declare-fun res!939695 () Bool)

(assert (=> b!1401181 (=> res!939695 e!793372)))

(declare-fun lt!616746 () SeekEntryResult!10559)

(assert (=> b!1401181 (= res!939695 (or (= lt!616745 lt!616746) (not ((_ is Intermediate!10559) lt!616746))))))

(declare-fun lt!616743 () array!95783)

(declare-fun lt!616748 () (_ BitVec 64))

(assert (=> b!1401181 (= lt!616746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616748 mask!2840) lt!616748 lt!616743 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401181 (= lt!616748 (select (store (arr!46242 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401181 (= lt!616743 (array!95784 (store (arr!46242 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46792 a!2901)))))

(declare-fun b!1401182 () Bool)

(declare-fun e!793373 () Bool)

(assert (=> b!1401182 (= e!793373 true)))

(declare-fun lt!616749 () SeekEntryResult!10559)

(assert (=> b!1401182 (= lt!616749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616747 lt!616748 lt!616743 mask!2840))))

(declare-fun b!1401183 () Bool)

(declare-fun res!939697 () Bool)

(assert (=> b!1401183 (=> (not res!939697) (not e!793371))))

(assert (=> b!1401183 (= res!939697 (and (= (size!46792 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46792 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46792 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401184 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95783 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401184 (= e!793368 (= (seekEntryOrOpen!0 (select (arr!46242 a!2901) j!112) a!2901 mask!2840) (Found!10559 j!112)))))

(declare-fun b!1401185 () Bool)

(declare-fun res!939699 () Bool)

(assert (=> b!1401185 (=> (not res!939699) (not e!793371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401185 (= res!939699 (validKeyInArray!0 (select (arr!46242 a!2901) i!1037)))))

(declare-fun b!1401186 () Bool)

(declare-fun res!939698 () Bool)

(assert (=> b!1401186 (=> (not res!939698) (not e!793371))))

(assert (=> b!1401186 (= res!939698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401187 () Bool)

(declare-fun res!939693 () Bool)

(assert (=> b!1401187 (=> (not res!939693) (not e!793371))))

(assert (=> b!1401187 (= res!939693 (validKeyInArray!0 (select (arr!46242 a!2901) j!112)))))

(declare-fun e!793370 () Bool)

(declare-fun b!1401180 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95783 (_ BitVec 32)) SeekEntryResult!10559)

(assert (=> b!1401180 (= e!793370 (= (seekEntryOrOpen!0 lt!616748 lt!616743 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126250 lt!616746) (index!44615 lt!616746) (index!44615 lt!616746) (select (arr!46242 a!2901) j!112) lt!616743 mask!2840)))))

(declare-fun res!939700 () Bool)

(assert (=> start!120374 (=> (not res!939700) (not e!793371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120374 (= res!939700 (validMask!0 mask!2840))))

(assert (=> start!120374 e!793371))

(assert (=> start!120374 true))

(declare-fun array_inv!35270 (array!95783) Bool)

(assert (=> start!120374 (array_inv!35270 a!2901)))

(declare-fun b!1401188 () Bool)

(assert (=> b!1401188 (= e!793372 e!793373)))

(declare-fun res!939691 () Bool)

(assert (=> b!1401188 (=> res!939691 e!793373)))

(assert (=> b!1401188 (= res!939691 (or (bvslt (x!126250 lt!616745) #b00000000000000000000000000000000) (bvsgt (x!126250 lt!616745) #b01111111111111111111111111111110) (bvslt (x!126250 lt!616746) #b00000000000000000000000000000000) (bvsgt (x!126250 lt!616746) #b01111111111111111111111111111110) (bvslt lt!616747 #b00000000000000000000000000000000) (bvsge lt!616747 (size!46792 a!2901)) (bvslt (index!44615 lt!616745) #b00000000000000000000000000000000) (bvsge (index!44615 lt!616745) (size!46792 a!2901)) (bvslt (index!44615 lt!616746) #b00000000000000000000000000000000) (bvsge (index!44615 lt!616746) (size!46792 a!2901)) (not (= lt!616745 (Intermediate!10559 false (index!44615 lt!616745) (x!126250 lt!616745)))) (not (= lt!616746 (Intermediate!10559 false (index!44615 lt!616746) (x!126250 lt!616746))))))))

(assert (=> b!1401188 e!793370))

(declare-fun res!939696 () Bool)

(assert (=> b!1401188 (=> (not res!939696) (not e!793370))))

(assert (=> b!1401188 (= res!939696 (and (not (undefined!11371 lt!616746)) (= (index!44615 lt!616746) i!1037) (bvslt (x!126250 lt!616746) (x!126250 lt!616745)) (= (select (store (arr!46242 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44615 lt!616746)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616744 () Unit!47122)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47122)

(assert (=> b!1401188 (= lt!616744 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616747 (x!126250 lt!616745) (index!44615 lt!616745) (x!126250 lt!616746) (index!44615 lt!616746) (undefined!11371 lt!616746) mask!2840))))

(declare-fun b!1401189 () Bool)

(declare-fun res!939694 () Bool)

(assert (=> b!1401189 (=> (not res!939694) (not e!793371))))

(declare-datatypes ((List!32761 0))(
  ( (Nil!32758) (Cons!32757 (h!34005 (_ BitVec 64)) (t!47455 List!32761)) )
))
(declare-fun arrayNoDuplicates!0 (array!95783 (_ BitVec 32) List!32761) Bool)

(assert (=> b!1401189 (= res!939694 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32758))))

(assert (= (and start!120374 res!939700) b!1401183))

(assert (= (and b!1401183 res!939697) b!1401185))

(assert (= (and b!1401185 res!939699) b!1401187))

(assert (= (and b!1401187 res!939693) b!1401186))

(assert (= (and b!1401186 res!939698) b!1401189))

(assert (= (and b!1401189 res!939694) b!1401179))

(assert (= (and b!1401179 res!939690) b!1401184))

(assert (= (and b!1401179 (not res!939692)) b!1401181))

(assert (= (and b!1401181 (not res!939695)) b!1401188))

(assert (= (and b!1401188 res!939696) b!1401180))

(assert (= (and b!1401188 (not res!939691)) b!1401182))

(declare-fun m!1288877 () Bool)

(assert (=> b!1401184 m!1288877))

(assert (=> b!1401184 m!1288877))

(declare-fun m!1288879 () Bool)

(assert (=> b!1401184 m!1288879))

(declare-fun m!1288881 () Bool)

(assert (=> b!1401181 m!1288881))

(assert (=> b!1401181 m!1288881))

(declare-fun m!1288883 () Bool)

(assert (=> b!1401181 m!1288883))

(declare-fun m!1288885 () Bool)

(assert (=> b!1401181 m!1288885))

(declare-fun m!1288887 () Bool)

(assert (=> b!1401181 m!1288887))

(declare-fun m!1288889 () Bool)

(assert (=> start!120374 m!1288889))

(declare-fun m!1288891 () Bool)

(assert (=> start!120374 m!1288891))

(declare-fun m!1288893 () Bool)

(assert (=> b!1401180 m!1288893))

(assert (=> b!1401180 m!1288877))

(assert (=> b!1401180 m!1288877))

(declare-fun m!1288895 () Bool)

(assert (=> b!1401180 m!1288895))

(declare-fun m!1288897 () Bool)

(assert (=> b!1401189 m!1288897))

(declare-fun m!1288899 () Bool)

(assert (=> b!1401185 m!1288899))

(assert (=> b!1401185 m!1288899))

(declare-fun m!1288901 () Bool)

(assert (=> b!1401185 m!1288901))

(declare-fun m!1288903 () Bool)

(assert (=> b!1401186 m!1288903))

(assert (=> b!1401188 m!1288885))

(declare-fun m!1288905 () Bool)

(assert (=> b!1401188 m!1288905))

(declare-fun m!1288907 () Bool)

(assert (=> b!1401188 m!1288907))

(declare-fun m!1288909 () Bool)

(assert (=> b!1401182 m!1288909))

(assert (=> b!1401179 m!1288877))

(declare-fun m!1288911 () Bool)

(assert (=> b!1401179 m!1288911))

(assert (=> b!1401179 m!1288877))

(declare-fun m!1288913 () Bool)

(assert (=> b!1401179 m!1288913))

(assert (=> b!1401179 m!1288877))

(declare-fun m!1288915 () Bool)

(assert (=> b!1401179 m!1288915))

(declare-fun m!1288917 () Bool)

(assert (=> b!1401179 m!1288917))

(assert (=> b!1401187 m!1288877))

(assert (=> b!1401187 m!1288877))

(declare-fun m!1288919 () Bool)

(assert (=> b!1401187 m!1288919))

(check-sat (not b!1401185) (not b!1401189) (not b!1401186) (not b!1401181) (not start!120374) (not b!1401187) (not b!1401182) (not b!1401184) (not b!1401188) (not b!1401179) (not b!1401180))
(check-sat)
