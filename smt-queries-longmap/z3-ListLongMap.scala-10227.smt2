; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120410 () Bool)

(assert start!120410)

(declare-fun b!1401758 () Bool)

(declare-fun e!793751 () Bool)

(assert (=> b!1401758 (= e!793751 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95772 0))(
  ( (array!95773 (arr!46237 (Array (_ BitVec 32) (_ BitVec 64))) (size!46789 (_ BitVec 32))) )
))
(declare-fun lt!617032 () array!95772)

(declare-fun lt!617034 () (_ BitVec 64))

(declare-fun lt!617039 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10580 0))(
  ( (MissingZero!10580 (index!44697 (_ BitVec 32))) (Found!10580 (index!44698 (_ BitVec 32))) (Intermediate!10580 (undefined!11392 Bool) (index!44699 (_ BitVec 32)) (x!126324 (_ BitVec 32))) (Undefined!10580) (MissingVacant!10580 (index!44700 (_ BitVec 32))) )
))
(declare-fun lt!617033 () SeekEntryResult!10580)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95772 (_ BitVec 32)) SeekEntryResult!10580)

(assert (=> b!1401758 (= lt!617033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617039 lt!617034 lt!617032 mask!2840))))

(declare-fun b!1401759 () Bool)

(declare-fun res!940325 () Bool)

(declare-fun e!793754 () Bool)

(assert (=> b!1401759 (=> (not res!940325) (not e!793754))))

(declare-fun a!2901 () array!95772)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95772 (_ BitVec 32)) Bool)

(assert (=> b!1401759 (= res!940325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!793753 () Bool)

(declare-fun lt!617037 () SeekEntryResult!10580)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1401760 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95772 (_ BitVec 32)) SeekEntryResult!10580)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95772 (_ BitVec 32)) SeekEntryResult!10580)

(assert (=> b!1401760 (= e!793753 (= (seekEntryOrOpen!0 lt!617034 lt!617032 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126324 lt!617037) (index!44699 lt!617037) (index!44699 lt!617037) (select (arr!46237 a!2901) j!112) lt!617032 mask!2840)))))

(declare-fun b!1401761 () Bool)

(declare-fun res!940321 () Bool)

(assert (=> b!1401761 (=> (not res!940321) (not e!793754))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401761 (= res!940321 (and (= (size!46789 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46789 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46789 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401762 () Bool)

(declare-fun e!793748 () Bool)

(declare-fun e!793749 () Bool)

(assert (=> b!1401762 (= e!793748 e!793749)))

(declare-fun res!940330 () Bool)

(assert (=> b!1401762 (=> res!940330 e!793749)))

(declare-fun lt!617036 () SeekEntryResult!10580)

(get-info :version)

(assert (=> b!1401762 (= res!940330 (or (= lt!617036 lt!617037) (not ((_ is Intermediate!10580) lt!617037))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401762 (= lt!617037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617034 mask!2840) lt!617034 lt!617032 mask!2840))))

(assert (=> b!1401762 (= lt!617034 (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401762 (= lt!617032 (array!95773 (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46789 a!2901)))))

(declare-fun e!793752 () Bool)

(declare-fun b!1401763 () Bool)

(assert (=> b!1401763 (= e!793752 (= (seekEntryOrOpen!0 (select (arr!46237 a!2901) j!112) a!2901 mask!2840) (Found!10580 j!112)))))

(declare-fun b!1401764 () Bool)

(assert (=> b!1401764 (= e!793754 (not e!793748))))

(declare-fun res!940324 () Bool)

(assert (=> b!1401764 (=> res!940324 e!793748)))

(assert (=> b!1401764 (= res!940324 (or (not ((_ is Intermediate!10580) lt!617036)) (undefined!11392 lt!617036)))))

(assert (=> b!1401764 e!793752))

(declare-fun res!940323 () Bool)

(assert (=> b!1401764 (=> (not res!940323) (not e!793752))))

(assert (=> b!1401764 (= res!940323 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47007 0))(
  ( (Unit!47008) )
))
(declare-fun lt!617038 () Unit!47007)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47007)

(assert (=> b!1401764 (= lt!617038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401764 (= lt!617036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617039 (select (arr!46237 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401764 (= lt!617039 (toIndex!0 (select (arr!46237 a!2901) j!112) mask!2840))))

(declare-fun b!1401765 () Bool)

(declare-fun res!940322 () Bool)

(assert (=> b!1401765 (=> (not res!940322) (not e!793754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401765 (= res!940322 (validKeyInArray!0 (select (arr!46237 a!2901) j!112)))))

(declare-fun b!1401766 () Bool)

(declare-fun res!940328 () Bool)

(assert (=> b!1401766 (=> (not res!940328) (not e!793754))))

(assert (=> b!1401766 (= res!940328 (validKeyInArray!0 (select (arr!46237 a!2901) i!1037)))))

(declare-fun b!1401767 () Bool)

(declare-fun res!940320 () Bool)

(assert (=> b!1401767 (=> (not res!940320) (not e!793754))))

(declare-datatypes ((List!32834 0))(
  ( (Nil!32831) (Cons!32830 (h!34078 (_ BitVec 64)) (t!47520 List!32834)) )
))
(declare-fun arrayNoDuplicates!0 (array!95772 (_ BitVec 32) List!32834) Bool)

(assert (=> b!1401767 (= res!940320 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32831))))

(declare-fun res!940327 () Bool)

(assert (=> start!120410 (=> (not res!940327) (not e!793754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120410 (= res!940327 (validMask!0 mask!2840))))

(assert (=> start!120410 e!793754))

(assert (=> start!120410 true))

(declare-fun array_inv!35470 (array!95772) Bool)

(assert (=> start!120410 (array_inv!35470 a!2901)))

(declare-fun b!1401768 () Bool)

(assert (=> b!1401768 (= e!793749 e!793751)))

(declare-fun res!940329 () Bool)

(assert (=> b!1401768 (=> res!940329 e!793751)))

(assert (=> b!1401768 (= res!940329 (or (bvslt (x!126324 lt!617036) #b00000000000000000000000000000000) (bvsgt (x!126324 lt!617036) #b01111111111111111111111111111110) (bvslt (x!126324 lt!617037) #b00000000000000000000000000000000) (bvsgt (x!126324 lt!617037) #b01111111111111111111111111111110) (bvslt lt!617039 #b00000000000000000000000000000000) (bvsge lt!617039 (size!46789 a!2901)) (bvslt (index!44699 lt!617036) #b00000000000000000000000000000000) (bvsge (index!44699 lt!617036) (size!46789 a!2901)) (bvslt (index!44699 lt!617037) #b00000000000000000000000000000000) (bvsge (index!44699 lt!617037) (size!46789 a!2901)) (not (= lt!617036 (Intermediate!10580 false (index!44699 lt!617036) (x!126324 lt!617036)))) (not (= lt!617037 (Intermediate!10580 false (index!44699 lt!617037) (x!126324 lt!617037))))))))

(assert (=> b!1401768 e!793753))

(declare-fun res!940326 () Bool)

(assert (=> b!1401768 (=> (not res!940326) (not e!793753))))

(assert (=> b!1401768 (= res!940326 (and (not (undefined!11392 lt!617037)) (= (index!44699 lt!617037) i!1037) (bvslt (x!126324 lt!617037) (x!126324 lt!617036)) (= (select (store (arr!46237 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44699 lt!617037)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617035 () Unit!47007)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47007)

(assert (=> b!1401768 (= lt!617035 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617039 (x!126324 lt!617036) (index!44699 lt!617036) (x!126324 lt!617037) (index!44699 lt!617037) (undefined!11392 lt!617037) mask!2840))))

(assert (= (and start!120410 res!940327) b!1401761))

(assert (= (and b!1401761 res!940321) b!1401766))

(assert (= (and b!1401766 res!940328) b!1401765))

(assert (= (and b!1401765 res!940322) b!1401759))

(assert (= (and b!1401759 res!940325) b!1401767))

(assert (= (and b!1401767 res!940320) b!1401764))

(assert (= (and b!1401764 res!940323) b!1401763))

(assert (= (and b!1401764 (not res!940324)) b!1401762))

(assert (= (and b!1401762 (not res!940330)) b!1401768))

(assert (= (and b!1401768 res!940326) b!1401760))

(assert (= (and b!1401768 (not res!940329)) b!1401758))

(declare-fun m!1289221 () Bool)

(assert (=> start!120410 m!1289221))

(declare-fun m!1289223 () Bool)

(assert (=> start!120410 m!1289223))

(declare-fun m!1289225 () Bool)

(assert (=> b!1401767 m!1289225))

(declare-fun m!1289227 () Bool)

(assert (=> b!1401760 m!1289227))

(declare-fun m!1289229 () Bool)

(assert (=> b!1401760 m!1289229))

(assert (=> b!1401760 m!1289229))

(declare-fun m!1289231 () Bool)

(assert (=> b!1401760 m!1289231))

(declare-fun m!1289233 () Bool)

(assert (=> b!1401766 m!1289233))

(assert (=> b!1401766 m!1289233))

(declare-fun m!1289235 () Bool)

(assert (=> b!1401766 m!1289235))

(assert (=> b!1401765 m!1289229))

(assert (=> b!1401765 m!1289229))

(declare-fun m!1289237 () Bool)

(assert (=> b!1401765 m!1289237))

(declare-fun m!1289239 () Bool)

(assert (=> b!1401762 m!1289239))

(assert (=> b!1401762 m!1289239))

(declare-fun m!1289241 () Bool)

(assert (=> b!1401762 m!1289241))

(declare-fun m!1289243 () Bool)

(assert (=> b!1401762 m!1289243))

(declare-fun m!1289245 () Bool)

(assert (=> b!1401762 m!1289245))

(assert (=> b!1401764 m!1289229))

(declare-fun m!1289247 () Bool)

(assert (=> b!1401764 m!1289247))

(assert (=> b!1401764 m!1289229))

(assert (=> b!1401764 m!1289229))

(declare-fun m!1289249 () Bool)

(assert (=> b!1401764 m!1289249))

(declare-fun m!1289251 () Bool)

(assert (=> b!1401764 m!1289251))

(declare-fun m!1289253 () Bool)

(assert (=> b!1401764 m!1289253))

(assert (=> b!1401763 m!1289229))

(assert (=> b!1401763 m!1289229))

(declare-fun m!1289255 () Bool)

(assert (=> b!1401763 m!1289255))

(assert (=> b!1401768 m!1289243))

(declare-fun m!1289257 () Bool)

(assert (=> b!1401768 m!1289257))

(declare-fun m!1289259 () Bool)

(assert (=> b!1401768 m!1289259))

(declare-fun m!1289261 () Bool)

(assert (=> b!1401758 m!1289261))

(declare-fun m!1289263 () Bool)

(assert (=> b!1401759 m!1289263))

(check-sat (not start!120410) (not b!1401765) (not b!1401768) (not b!1401767) (not b!1401758) (not b!1401766) (not b!1401763) (not b!1401762) (not b!1401760) (not b!1401759) (not b!1401764))
(check-sat)
