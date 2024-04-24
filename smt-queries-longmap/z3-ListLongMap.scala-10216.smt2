; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120536 () Bool)

(assert start!120536)

(declare-fun b!1401890 () Bool)

(declare-fun res!939719 () Bool)

(declare-fun e!793838 () Bool)

(assert (=> b!1401890 (=> (not res!939719) (not e!793838))))

(declare-datatypes ((array!95867 0))(
  ( (array!95868 (arr!46282 (Array (_ BitVec 32) (_ BitVec 64))) (size!46833 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95867)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95867 (_ BitVec 32)) Bool)

(assert (=> b!1401890 (= res!939719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401891 () Bool)

(declare-fun res!939720 () Bool)

(assert (=> b!1401891 (=> (not res!939720) (not e!793838))))

(declare-datatypes ((List!32788 0))(
  ( (Nil!32785) (Cons!32784 (h!34040 (_ BitVec 64)) (t!47474 List!32788)) )
))
(declare-fun arrayNoDuplicates!0 (array!95867 (_ BitVec 32) List!32788) Bool)

(assert (=> b!1401891 (= res!939720 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32785))))

(declare-fun b!1401892 () Bool)

(declare-fun e!793833 () Bool)

(assert (=> b!1401892 (= e!793838 (not e!793833))))

(declare-fun res!939723 () Bool)

(assert (=> b!1401892 (=> res!939723 e!793833)))

(declare-datatypes ((SeekEntryResult!10502 0))(
  ( (MissingZero!10502 (index!44385 (_ BitVec 32))) (Found!10502 (index!44386 (_ BitVec 32))) (Intermediate!10502 (undefined!11314 Bool) (index!44387 (_ BitVec 32)) (x!126180 (_ BitVec 32))) (Undefined!10502) (MissingVacant!10502 (index!44388 (_ BitVec 32))) )
))
(declare-fun lt!616829 () SeekEntryResult!10502)

(get-info :version)

(assert (=> b!1401892 (= res!939723 (or (not ((_ is Intermediate!10502) lt!616829)) (undefined!11314 lt!616829)))))

(declare-fun e!793836 () Bool)

(assert (=> b!1401892 e!793836))

(declare-fun res!939725 () Bool)

(assert (=> b!1401892 (=> (not res!939725) (not e!793836))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401892 (= res!939725 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47035 0))(
  ( (Unit!47036) )
))
(declare-fun lt!616835 () Unit!47035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47035)

(assert (=> b!1401892 (= lt!616835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616828 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10502)

(assert (=> b!1401892 (= lt!616829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616828 (select (arr!46282 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401892 (= lt!616828 (toIndex!0 (select (arr!46282 a!2901) j!112) mask!2840))))

(declare-fun b!1401893 () Bool)

(declare-fun res!939724 () Bool)

(assert (=> b!1401893 (=> (not res!939724) (not e!793838))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401893 (= res!939724 (validKeyInArray!0 (select (arr!46282 a!2901) i!1037)))))

(declare-fun b!1401895 () Bool)

(declare-fun res!939726 () Bool)

(assert (=> b!1401895 (=> (not res!939726) (not e!793838))))

(assert (=> b!1401895 (= res!939726 (validKeyInArray!0 (select (arr!46282 a!2901) j!112)))))

(declare-fun b!1401896 () Bool)

(declare-fun e!793835 () Bool)

(assert (=> b!1401896 (= e!793833 e!793835)))

(declare-fun res!939717 () Bool)

(assert (=> b!1401896 (=> res!939717 e!793835)))

(declare-fun lt!616834 () SeekEntryResult!10502)

(assert (=> b!1401896 (= res!939717 (or (= lt!616829 lt!616834) (not ((_ is Intermediate!10502) lt!616834))))))

(declare-fun lt!616830 () (_ BitVec 64))

(declare-fun lt!616831 () array!95867)

(assert (=> b!1401896 (= lt!616834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616830 mask!2840) lt!616830 lt!616831 mask!2840))))

(assert (=> b!1401896 (= lt!616830 (select (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401896 (= lt!616831 (array!95868 (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46833 a!2901)))))

(declare-fun b!1401897 () Bool)

(declare-fun res!939722 () Bool)

(assert (=> b!1401897 (=> (not res!939722) (not e!793838))))

(assert (=> b!1401897 (= res!939722 (and (= (size!46833 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46833 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46833 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401898 () Bool)

(declare-fun e!793832 () Bool)

(assert (=> b!1401898 (= e!793835 e!793832)))

(declare-fun res!939718 () Bool)

(assert (=> b!1401898 (=> res!939718 e!793832)))

(assert (=> b!1401898 (= res!939718 (or (bvslt (x!126180 lt!616829) #b00000000000000000000000000000000) (bvsgt (x!126180 lt!616829) #b01111111111111111111111111111110) (bvslt (x!126180 lt!616834) #b00000000000000000000000000000000) (bvsgt (x!126180 lt!616834) #b01111111111111111111111111111110) (bvslt lt!616828 #b00000000000000000000000000000000) (bvsge lt!616828 (size!46833 a!2901)) (bvslt (index!44387 lt!616829) #b00000000000000000000000000000000) (bvsge (index!44387 lt!616829) (size!46833 a!2901)) (bvslt (index!44387 lt!616834) #b00000000000000000000000000000000) (bvsge (index!44387 lt!616834) (size!46833 a!2901)) (not (= lt!616829 (Intermediate!10502 false (index!44387 lt!616829) (x!126180 lt!616829)))) (not (= lt!616834 (Intermediate!10502 false (index!44387 lt!616834) (x!126180 lt!616834))))))))

(declare-fun e!793837 () Bool)

(assert (=> b!1401898 e!793837))

(declare-fun res!939721 () Bool)

(assert (=> b!1401898 (=> (not res!939721) (not e!793837))))

(assert (=> b!1401898 (= res!939721 (and (not (undefined!11314 lt!616834)) (= (index!44387 lt!616834) i!1037) (bvslt (x!126180 lt!616834) (x!126180 lt!616829)) (= (select (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44387 lt!616834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616833 () Unit!47035)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47035)

(assert (=> b!1401898 (= lt!616833 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616828 (x!126180 lt!616829) (index!44387 lt!616829) (x!126180 lt!616834) (index!44387 lt!616834) (undefined!11314 lt!616834) mask!2840))))

(declare-fun b!1401899 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10502)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95867 (_ BitVec 32)) SeekEntryResult!10502)

(assert (=> b!1401899 (= e!793837 (= (seekEntryOrOpen!0 lt!616830 lt!616831 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126180 lt!616834) (index!44387 lt!616834) (index!44387 lt!616834) (select (arr!46282 a!2901) j!112) lt!616831 mask!2840)))))

(declare-fun b!1401900 () Bool)

(assert (=> b!1401900 (= e!793836 (= (seekEntryOrOpen!0 (select (arr!46282 a!2901) j!112) a!2901 mask!2840) (Found!10502 j!112)))))

(declare-fun b!1401894 () Bool)

(assert (=> b!1401894 (= e!793832 true)))

(declare-fun lt!616832 () SeekEntryResult!10502)

(assert (=> b!1401894 (= lt!616832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616828 lt!616830 lt!616831 mask!2840))))

(declare-fun res!939727 () Bool)

(assert (=> start!120536 (=> (not res!939727) (not e!793838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120536 (= res!939727 (validMask!0 mask!2840))))

(assert (=> start!120536 e!793838))

(assert (=> start!120536 true))

(declare-fun array_inv!35563 (array!95867) Bool)

(assert (=> start!120536 (array_inv!35563 a!2901)))

(assert (= (and start!120536 res!939727) b!1401897))

(assert (= (and b!1401897 res!939722) b!1401893))

(assert (= (and b!1401893 res!939724) b!1401895))

(assert (= (and b!1401895 res!939726) b!1401890))

(assert (= (and b!1401890 res!939719) b!1401891))

(assert (= (and b!1401891 res!939720) b!1401892))

(assert (= (and b!1401892 res!939725) b!1401900))

(assert (= (and b!1401892 (not res!939723)) b!1401896))

(assert (= (and b!1401896 (not res!939717)) b!1401898))

(assert (= (and b!1401898 res!939721) b!1401899))

(assert (= (and b!1401898 (not res!939718)) b!1401894))

(declare-fun m!1289677 () Bool)

(assert (=> b!1401891 m!1289677))

(declare-fun m!1289679 () Bool)

(assert (=> start!120536 m!1289679))

(declare-fun m!1289681 () Bool)

(assert (=> start!120536 m!1289681))

(declare-fun m!1289683 () Bool)

(assert (=> b!1401892 m!1289683))

(declare-fun m!1289685 () Bool)

(assert (=> b!1401892 m!1289685))

(assert (=> b!1401892 m!1289683))

(declare-fun m!1289687 () Bool)

(assert (=> b!1401892 m!1289687))

(assert (=> b!1401892 m!1289683))

(declare-fun m!1289689 () Bool)

(assert (=> b!1401892 m!1289689))

(declare-fun m!1289691 () Bool)

(assert (=> b!1401892 m!1289691))

(declare-fun m!1289693 () Bool)

(assert (=> b!1401893 m!1289693))

(assert (=> b!1401893 m!1289693))

(declare-fun m!1289695 () Bool)

(assert (=> b!1401893 m!1289695))

(assert (=> b!1401895 m!1289683))

(assert (=> b!1401895 m!1289683))

(declare-fun m!1289697 () Bool)

(assert (=> b!1401895 m!1289697))

(declare-fun m!1289699 () Bool)

(assert (=> b!1401899 m!1289699))

(assert (=> b!1401899 m!1289683))

(assert (=> b!1401899 m!1289683))

(declare-fun m!1289701 () Bool)

(assert (=> b!1401899 m!1289701))

(declare-fun m!1289703 () Bool)

(assert (=> b!1401896 m!1289703))

(assert (=> b!1401896 m!1289703))

(declare-fun m!1289705 () Bool)

(assert (=> b!1401896 m!1289705))

(declare-fun m!1289707 () Bool)

(assert (=> b!1401896 m!1289707))

(declare-fun m!1289709 () Bool)

(assert (=> b!1401896 m!1289709))

(declare-fun m!1289711 () Bool)

(assert (=> b!1401894 m!1289711))

(assert (=> b!1401900 m!1289683))

(assert (=> b!1401900 m!1289683))

(declare-fun m!1289713 () Bool)

(assert (=> b!1401900 m!1289713))

(declare-fun m!1289715 () Bool)

(assert (=> b!1401890 m!1289715))

(assert (=> b!1401898 m!1289707))

(declare-fun m!1289717 () Bool)

(assert (=> b!1401898 m!1289717))

(declare-fun m!1289719 () Bool)

(assert (=> b!1401898 m!1289719))

(check-sat (not b!1401898) (not b!1401896) (not b!1401890) (not b!1401892) (not start!120536) (not b!1401899) (not b!1401895) (not b!1401900) (not b!1401891) (not b!1401894) (not b!1401893))
(check-sat)
