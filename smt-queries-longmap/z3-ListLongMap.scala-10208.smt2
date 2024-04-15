; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120296 () Bool)

(assert start!120296)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95658 0))(
  ( (array!95659 (arr!46180 (Array (_ BitVec 32) (_ BitVec 64))) (size!46732 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95658)

(declare-fun b!1399877 () Bool)

(declare-fun e!792554 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10523 0))(
  ( (MissingZero!10523 (index!44469 (_ BitVec 32))) (Found!10523 (index!44470 (_ BitVec 32))) (Intermediate!10523 (undefined!11335 Bool) (index!44471 (_ BitVec 32)) (x!126115 (_ BitVec 32))) (Undefined!10523) (MissingVacant!10523 (index!44472 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95658 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1399877 (= e!792554 (= (seekEntryOrOpen!0 (select (arr!46180 a!2901) j!112) a!2901 mask!2840) (Found!10523 j!112)))))

(declare-fun b!1399878 () Bool)

(declare-fun res!938447 () Bool)

(declare-fun e!792553 () Bool)

(assert (=> b!1399878 (=> (not res!938447) (not e!792553))))

(declare-datatypes ((List!32777 0))(
  ( (Nil!32774) (Cons!32773 (h!34021 (_ BitVec 64)) (t!47463 List!32777)) )
))
(declare-fun arrayNoDuplicates!0 (array!95658 (_ BitVec 32) List!32777) Bool)

(assert (=> b!1399878 (= res!938447 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32774))))

(declare-fun b!1399880 () Bool)

(declare-fun res!938445 () Bool)

(assert (=> b!1399880 (=> (not res!938445) (not e!792553))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399880 (= res!938445 (and (= (size!46732 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46732 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46732 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399881 () Bool)

(declare-fun e!792556 () Bool)

(declare-fun e!792557 () Bool)

(assert (=> b!1399881 (= e!792556 e!792557)))

(declare-fun res!938441 () Bool)

(assert (=> b!1399881 (=> res!938441 e!792557)))

(declare-fun lt!615665 () SeekEntryResult!10523)

(declare-fun lt!615669 () SeekEntryResult!10523)

(get-info :version)

(assert (=> b!1399881 (= res!938441 (or (= lt!615665 lt!615669) (not ((_ is Intermediate!10523) lt!615669))))))

(declare-fun lt!615667 () (_ BitVec 64))

(declare-fun lt!615670 () array!95658)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95658 (_ BitVec 32)) SeekEntryResult!10523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399881 (= lt!615669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615667 mask!2840) lt!615667 lt!615670 mask!2840))))

(assert (=> b!1399881 (= lt!615667 (select (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399881 (= lt!615670 (array!95659 (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)))))

(declare-fun b!1399882 () Bool)

(declare-fun res!938439 () Bool)

(assert (=> b!1399882 (=> (not res!938439) (not e!792553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399882 (= res!938439 (validKeyInArray!0 (select (arr!46180 a!2901) j!112)))))

(declare-fun b!1399883 () Bool)

(assert (=> b!1399883 (= e!792553 (not e!792556))))

(declare-fun res!938446 () Bool)

(assert (=> b!1399883 (=> res!938446 e!792556)))

(assert (=> b!1399883 (= res!938446 (or (not ((_ is Intermediate!10523) lt!615665)) (undefined!11335 lt!615665)))))

(assert (=> b!1399883 e!792554))

(declare-fun res!938442 () Bool)

(assert (=> b!1399883 (=> (not res!938442) (not e!792554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95658 (_ BitVec 32)) Bool)

(assert (=> b!1399883 (= res!938442 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46893 0))(
  ( (Unit!46894) )
))
(declare-fun lt!615668 () Unit!46893)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46893)

(assert (=> b!1399883 (= lt!615668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615666 () (_ BitVec 32))

(assert (=> b!1399883 (= lt!615665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615666 (select (arr!46180 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399883 (= lt!615666 (toIndex!0 (select (arr!46180 a!2901) j!112) mask!2840))))

(declare-fun e!792555 () Bool)

(declare-fun b!1399884 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95658 (_ BitVec 32)) SeekEntryResult!10523)

(assert (=> b!1399884 (= e!792555 (= (seekEntryOrOpen!0 lt!615667 lt!615670 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126115 lt!615669) (index!44471 lt!615669) (index!44471 lt!615669) (select (arr!46180 a!2901) j!112) lt!615670 mask!2840)))))

(declare-fun b!1399885 () Bool)

(declare-fun e!792551 () Bool)

(assert (=> b!1399885 (= e!792551 true)))

(declare-fun lt!615664 () SeekEntryResult!10523)

(assert (=> b!1399885 (= lt!615664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615666 lt!615667 lt!615670 mask!2840))))

(declare-fun b!1399879 () Bool)

(declare-fun res!938449 () Bool)

(assert (=> b!1399879 (=> (not res!938449) (not e!792553))))

(assert (=> b!1399879 (= res!938449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938440 () Bool)

(assert (=> start!120296 (=> (not res!938440) (not e!792553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120296 (= res!938440 (validMask!0 mask!2840))))

(assert (=> start!120296 e!792553))

(assert (=> start!120296 true))

(declare-fun array_inv!35413 (array!95658) Bool)

(assert (=> start!120296 (array_inv!35413 a!2901)))

(declare-fun b!1399886 () Bool)

(declare-fun res!938443 () Bool)

(assert (=> b!1399886 (=> (not res!938443) (not e!792553))))

(assert (=> b!1399886 (= res!938443 (validKeyInArray!0 (select (arr!46180 a!2901) i!1037)))))

(declare-fun b!1399887 () Bool)

(assert (=> b!1399887 (= e!792557 e!792551)))

(declare-fun res!938448 () Bool)

(assert (=> b!1399887 (=> res!938448 e!792551)))

(assert (=> b!1399887 (= res!938448 (or (bvslt (x!126115 lt!615665) #b00000000000000000000000000000000) (bvsgt (x!126115 lt!615665) #b01111111111111111111111111111110) (bvslt (x!126115 lt!615669) #b00000000000000000000000000000000) (bvsgt (x!126115 lt!615669) #b01111111111111111111111111111110) (bvslt lt!615666 #b00000000000000000000000000000000) (bvsge lt!615666 (size!46732 a!2901)) (bvslt (index!44471 lt!615665) #b00000000000000000000000000000000) (bvsge (index!44471 lt!615665) (size!46732 a!2901)) (bvslt (index!44471 lt!615669) #b00000000000000000000000000000000) (bvsge (index!44471 lt!615669) (size!46732 a!2901)) (not (= lt!615665 (Intermediate!10523 false (index!44471 lt!615665) (x!126115 lt!615665)))) (not (= lt!615669 (Intermediate!10523 false (index!44471 lt!615669) (x!126115 lt!615669))))))))

(assert (=> b!1399887 e!792555))

(declare-fun res!938444 () Bool)

(assert (=> b!1399887 (=> (not res!938444) (not e!792555))))

(assert (=> b!1399887 (= res!938444 (and (not (undefined!11335 lt!615669)) (= (index!44471 lt!615669) i!1037) (bvslt (x!126115 lt!615669) (x!126115 lt!615665)) (= (select (store (arr!46180 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44471 lt!615669)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615671 () Unit!46893)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46893)

(assert (=> b!1399887 (= lt!615671 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615666 (x!126115 lt!615665) (index!44471 lt!615665) (x!126115 lt!615669) (index!44471 lt!615669) (undefined!11335 lt!615669) mask!2840))))

(assert (= (and start!120296 res!938440) b!1399880))

(assert (= (and b!1399880 res!938445) b!1399886))

(assert (= (and b!1399886 res!938443) b!1399882))

(assert (= (and b!1399882 res!938439) b!1399879))

(assert (= (and b!1399879 res!938449) b!1399878))

(assert (= (and b!1399878 res!938447) b!1399883))

(assert (= (and b!1399883 res!938442) b!1399877))

(assert (= (and b!1399883 (not res!938446)) b!1399881))

(assert (= (and b!1399881 (not res!938441)) b!1399887))

(assert (= (and b!1399887 res!938444) b!1399884))

(assert (= (and b!1399887 (not res!938448)) b!1399885))

(declare-fun m!1286713 () Bool)

(assert (=> b!1399882 m!1286713))

(assert (=> b!1399882 m!1286713))

(declare-fun m!1286715 () Bool)

(assert (=> b!1399882 m!1286715))

(declare-fun m!1286717 () Bool)

(assert (=> b!1399887 m!1286717))

(declare-fun m!1286719 () Bool)

(assert (=> b!1399887 m!1286719))

(declare-fun m!1286721 () Bool)

(assert (=> b!1399887 m!1286721))

(assert (=> b!1399877 m!1286713))

(assert (=> b!1399877 m!1286713))

(declare-fun m!1286723 () Bool)

(assert (=> b!1399877 m!1286723))

(declare-fun m!1286725 () Bool)

(assert (=> b!1399886 m!1286725))

(assert (=> b!1399886 m!1286725))

(declare-fun m!1286727 () Bool)

(assert (=> b!1399886 m!1286727))

(declare-fun m!1286729 () Bool)

(assert (=> b!1399884 m!1286729))

(assert (=> b!1399884 m!1286713))

(assert (=> b!1399884 m!1286713))

(declare-fun m!1286731 () Bool)

(assert (=> b!1399884 m!1286731))

(declare-fun m!1286733 () Bool)

(assert (=> start!120296 m!1286733))

(declare-fun m!1286735 () Bool)

(assert (=> start!120296 m!1286735))

(declare-fun m!1286737 () Bool)

(assert (=> b!1399879 m!1286737))

(declare-fun m!1286739 () Bool)

(assert (=> b!1399881 m!1286739))

(assert (=> b!1399881 m!1286739))

(declare-fun m!1286741 () Bool)

(assert (=> b!1399881 m!1286741))

(assert (=> b!1399881 m!1286717))

(declare-fun m!1286743 () Bool)

(assert (=> b!1399881 m!1286743))

(declare-fun m!1286745 () Bool)

(assert (=> b!1399878 m!1286745))

(declare-fun m!1286747 () Bool)

(assert (=> b!1399885 m!1286747))

(assert (=> b!1399883 m!1286713))

(declare-fun m!1286749 () Bool)

(assert (=> b!1399883 m!1286749))

(assert (=> b!1399883 m!1286713))

(assert (=> b!1399883 m!1286713))

(declare-fun m!1286751 () Bool)

(assert (=> b!1399883 m!1286751))

(declare-fun m!1286753 () Bool)

(assert (=> b!1399883 m!1286753))

(declare-fun m!1286755 () Bool)

(assert (=> b!1399883 m!1286755))

(check-sat (not b!1399884) (not b!1399885) (not b!1399878) (not b!1399881) (not b!1399877) (not start!120296) (not b!1399879) (not b!1399883) (not b!1399887) (not b!1399882) (not b!1399886))
(check-sat)
