; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120470 () Bool)

(assert start!120470)

(declare-fun res!941263 () Bool)

(declare-fun e!794266 () Bool)

(assert (=> start!120470 (=> (not res!941263) (not e!794266))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120470 (= res!941263 (validMask!0 mask!2840))))

(assert (=> start!120470 e!794266))

(assert (=> start!120470 true))

(declare-datatypes ((array!95832 0))(
  ( (array!95833 (arr!46267 (Array (_ BitVec 32) (_ BitVec 64))) (size!46819 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95832)

(declare-fun array_inv!35500 (array!95832) Bool)

(assert (=> start!120470 (array_inv!35500 a!2901)))

(declare-fun b!1402692 () Bool)

(declare-fun e!794267 () Bool)

(assert (=> b!1402692 (= e!794266 (not e!794267))))

(declare-fun res!941261 () Bool)

(assert (=> b!1402692 (=> res!941261 e!794267)))

(declare-datatypes ((SeekEntryResult!10610 0))(
  ( (MissingZero!10610 (index!44817 (_ BitVec 32))) (Found!10610 (index!44818 (_ BitVec 32))) (Intermediate!10610 (undefined!11422 Bool) (index!44819 (_ BitVec 32)) (x!126434 (_ BitVec 32))) (Undefined!10610) (MissingVacant!10610 (index!44820 (_ BitVec 32))) )
))
(declare-fun lt!617867 () SeekEntryResult!10610)

(get-info :version)

(assert (=> b!1402692 (= res!941261 (or (not ((_ is Intermediate!10610) lt!617867)) (undefined!11422 lt!617867)))))

(declare-fun lt!617864 () SeekEntryResult!10610)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402692 (= lt!617864 (Found!10610 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95832 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402692 (= lt!617864 (seekEntryOrOpen!0 (select (arr!46267 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95832 (_ BitVec 32)) Bool)

(assert (=> b!1402692 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47067 0))(
  ( (Unit!47068) )
))
(declare-fun lt!617871 () Unit!47067)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47067)

(assert (=> b!1402692 (= lt!617871 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617869 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95832 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402692 (= lt!617867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617869 (select (arr!46267 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402692 (= lt!617869 (toIndex!0 (select (arr!46267 a!2901) j!112) mask!2840))))

(declare-fun b!1402693 () Bool)

(declare-fun e!794269 () Bool)

(declare-fun e!794270 () Bool)

(assert (=> b!1402693 (= e!794269 e!794270)))

(declare-fun res!941257 () Bool)

(assert (=> b!1402693 (=> res!941257 e!794270)))

(declare-fun lt!617872 () SeekEntryResult!10610)

(assert (=> b!1402693 (= res!941257 (or (bvslt (x!126434 lt!617867) #b00000000000000000000000000000000) (bvsgt (x!126434 lt!617867) #b01111111111111111111111111111110) (bvslt (x!126434 lt!617872) #b00000000000000000000000000000000) (bvsgt (x!126434 lt!617872) #b01111111111111111111111111111110) (bvslt lt!617869 #b00000000000000000000000000000000) (bvsge lt!617869 (size!46819 a!2901)) (bvslt (index!44819 lt!617867) #b00000000000000000000000000000000) (bvsge (index!44819 lt!617867) (size!46819 a!2901)) (bvslt (index!44819 lt!617872) #b00000000000000000000000000000000) (bvsge (index!44819 lt!617872) (size!46819 a!2901)) (not (= lt!617867 (Intermediate!10610 false (index!44819 lt!617867) (x!126434 lt!617867)))) (not (= lt!617872 (Intermediate!10610 false (index!44819 lt!617872) (x!126434 lt!617872))))))))

(declare-fun lt!617868 () SeekEntryResult!10610)

(declare-fun lt!617870 () array!95832)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95832 (_ BitVec 32)) SeekEntryResult!10610)

(assert (=> b!1402693 (= lt!617868 (seekKeyOrZeroReturnVacant!0 (x!126434 lt!617872) (index!44819 lt!617872) (index!44819 lt!617872) (select (arr!46267 a!2901) j!112) lt!617870 mask!2840))))

(declare-fun lt!617865 () (_ BitVec 64))

(assert (=> b!1402693 (= lt!617868 (seekEntryOrOpen!0 lt!617865 lt!617870 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402693 (and (not (undefined!11422 lt!617872)) (= (index!44819 lt!617872) i!1037) (bvslt (x!126434 lt!617872) (x!126434 lt!617867)) (= (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44819 lt!617872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617866 () Unit!47067)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47067)

(assert (=> b!1402693 (= lt!617866 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617869 (x!126434 lt!617867) (index!44819 lt!617867) (x!126434 lt!617872) (index!44819 lt!617872) (undefined!11422 lt!617872) mask!2840))))

(declare-fun b!1402694 () Bool)

(declare-fun res!941262 () Bool)

(assert (=> b!1402694 (=> (not res!941262) (not e!794266))))

(assert (=> b!1402694 (= res!941262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402695 () Bool)

(declare-fun res!941254 () Bool)

(assert (=> b!1402695 (=> (not res!941254) (not e!794266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402695 (= res!941254 (validKeyInArray!0 (select (arr!46267 a!2901) i!1037)))))

(declare-fun b!1402696 () Bool)

(declare-fun res!941259 () Bool)

(assert (=> b!1402696 (=> (not res!941259) (not e!794266))))

(declare-datatypes ((List!32864 0))(
  ( (Nil!32861) (Cons!32860 (h!34108 (_ BitVec 64)) (t!47550 List!32864)) )
))
(declare-fun arrayNoDuplicates!0 (array!95832 (_ BitVec 32) List!32864) Bool)

(assert (=> b!1402696 (= res!941259 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32861))))

(declare-fun b!1402697 () Bool)

(declare-fun res!941256 () Bool)

(assert (=> b!1402697 (=> res!941256 e!794270)))

(assert (=> b!1402697 (= res!941256 (not (= lt!617872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617869 lt!617865 lt!617870 mask!2840))))))

(declare-fun b!1402698 () Bool)

(assert (=> b!1402698 (= e!794270 true)))

(assert (=> b!1402698 (= lt!617864 lt!617868)))

(declare-fun lt!617873 () Unit!47067)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47067)

(assert (=> b!1402698 (= lt!617873 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617869 (x!126434 lt!617867) (index!44819 lt!617867) (x!126434 lt!617872) (index!44819 lt!617872) mask!2840))))

(declare-fun b!1402699 () Bool)

(declare-fun res!941258 () Bool)

(assert (=> b!1402699 (=> (not res!941258) (not e!794266))))

(assert (=> b!1402699 (= res!941258 (and (= (size!46819 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46819 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46819 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402700 () Bool)

(assert (=> b!1402700 (= e!794267 e!794269)))

(declare-fun res!941260 () Bool)

(assert (=> b!1402700 (=> res!941260 e!794269)))

(assert (=> b!1402700 (= res!941260 (or (= lt!617867 lt!617872) (not ((_ is Intermediate!10610) lt!617872))))))

(assert (=> b!1402700 (= lt!617872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617865 mask!2840) lt!617865 lt!617870 mask!2840))))

(assert (=> b!1402700 (= lt!617865 (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402700 (= lt!617870 (array!95833 (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46819 a!2901)))))

(declare-fun b!1402701 () Bool)

(declare-fun res!941255 () Bool)

(assert (=> b!1402701 (=> (not res!941255) (not e!794266))))

(assert (=> b!1402701 (= res!941255 (validKeyInArray!0 (select (arr!46267 a!2901) j!112)))))

(assert (= (and start!120470 res!941263) b!1402699))

(assert (= (and b!1402699 res!941258) b!1402695))

(assert (= (and b!1402695 res!941254) b!1402701))

(assert (= (and b!1402701 res!941255) b!1402694))

(assert (= (and b!1402694 res!941262) b!1402696))

(assert (= (and b!1402696 res!941259) b!1402692))

(assert (= (and b!1402692 (not res!941261)) b!1402700))

(assert (= (and b!1402700 (not res!941260)) b!1402693))

(assert (= (and b!1402693 (not res!941257)) b!1402697))

(assert (= (and b!1402697 (not res!941256)) b!1402698))

(declare-fun m!1290577 () Bool)

(assert (=> b!1402696 m!1290577))

(declare-fun m!1290579 () Bool)

(assert (=> b!1402700 m!1290579))

(assert (=> b!1402700 m!1290579))

(declare-fun m!1290581 () Bool)

(assert (=> b!1402700 m!1290581))

(declare-fun m!1290583 () Bool)

(assert (=> b!1402700 m!1290583))

(declare-fun m!1290585 () Bool)

(assert (=> b!1402700 m!1290585))

(declare-fun m!1290587 () Bool)

(assert (=> b!1402693 m!1290587))

(declare-fun m!1290589 () Bool)

(assert (=> b!1402693 m!1290589))

(declare-fun m!1290591 () Bool)

(assert (=> b!1402693 m!1290591))

(assert (=> b!1402693 m!1290589))

(declare-fun m!1290593 () Bool)

(assert (=> b!1402693 m!1290593))

(declare-fun m!1290595 () Bool)

(assert (=> b!1402693 m!1290595))

(assert (=> b!1402693 m!1290583))

(declare-fun m!1290597 () Bool)

(assert (=> b!1402695 m!1290597))

(assert (=> b!1402695 m!1290597))

(declare-fun m!1290599 () Bool)

(assert (=> b!1402695 m!1290599))

(declare-fun m!1290601 () Bool)

(assert (=> start!120470 m!1290601))

(declare-fun m!1290603 () Bool)

(assert (=> start!120470 m!1290603))

(assert (=> b!1402701 m!1290589))

(assert (=> b!1402701 m!1290589))

(declare-fun m!1290605 () Bool)

(assert (=> b!1402701 m!1290605))

(declare-fun m!1290607 () Bool)

(assert (=> b!1402698 m!1290607))

(assert (=> b!1402692 m!1290589))

(declare-fun m!1290609 () Bool)

(assert (=> b!1402692 m!1290609))

(declare-fun m!1290611 () Bool)

(assert (=> b!1402692 m!1290611))

(assert (=> b!1402692 m!1290589))

(declare-fun m!1290613 () Bool)

(assert (=> b!1402692 m!1290613))

(declare-fun m!1290615 () Bool)

(assert (=> b!1402692 m!1290615))

(assert (=> b!1402692 m!1290589))

(declare-fun m!1290617 () Bool)

(assert (=> b!1402692 m!1290617))

(assert (=> b!1402692 m!1290589))

(declare-fun m!1290619 () Bool)

(assert (=> b!1402697 m!1290619))

(declare-fun m!1290621 () Bool)

(assert (=> b!1402694 m!1290621))

(check-sat (not start!120470) (not b!1402701) (not b!1402695) (not b!1402700) (not b!1402697) (not b!1402693) (not b!1402694) (not b!1402692) (not b!1402696) (not b!1402698))
(check-sat)
