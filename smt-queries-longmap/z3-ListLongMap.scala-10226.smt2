; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120410 () Bool)

(assert start!120410)

(declare-fun b!1401773 () Bool)

(declare-fun e!793750 () Bool)

(declare-fun e!793747 () Bool)

(assert (=> b!1401773 (= e!793750 e!793747)))

(declare-fun res!940291 () Bool)

(assert (=> b!1401773 (=> res!940291 e!793747)))

(declare-fun lt!617175 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10577 0))(
  ( (MissingZero!10577 (index!44685 (_ BitVec 32))) (Found!10577 (index!44686 (_ BitVec 32))) (Intermediate!10577 (undefined!11389 Bool) (index!44687 (_ BitVec 32)) (x!126316 (_ BitVec 32))) (Undefined!10577) (MissingVacant!10577 (index!44688 (_ BitVec 32))) )
))
(declare-fun lt!617181 () SeekEntryResult!10577)

(declare-fun lt!617178 () SeekEntryResult!10577)

(declare-datatypes ((array!95819 0))(
  ( (array!95820 (arr!46260 (Array (_ BitVec 32) (_ BitVec 64))) (size!46810 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95819)

(assert (=> b!1401773 (= res!940291 (or (bvslt (x!126316 lt!617181) #b00000000000000000000000000000000) (bvsgt (x!126316 lt!617181) #b01111111111111111111111111111110) (bvslt (x!126316 lt!617178) #b00000000000000000000000000000000) (bvsgt (x!126316 lt!617178) #b01111111111111111111111111111110) (bvslt lt!617175 #b00000000000000000000000000000000) (bvsge lt!617175 (size!46810 a!2901)) (bvslt (index!44687 lt!617181) #b00000000000000000000000000000000) (bvsge (index!44687 lt!617181) (size!46810 a!2901)) (bvslt (index!44687 lt!617178) #b00000000000000000000000000000000) (bvsge (index!44687 lt!617178) (size!46810 a!2901)) (not (= lt!617181 (Intermediate!10577 false (index!44687 lt!617181) (x!126316 lt!617181)))) (not (= lt!617178 (Intermediate!10577 false (index!44687 lt!617178) (x!126316 lt!617178))))))))

(declare-fun e!793746 () Bool)

(assert (=> b!1401773 e!793746))

(declare-fun res!940288 () Bool)

(assert (=> b!1401773 (=> (not res!940288) (not e!793746))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401773 (= res!940288 (and (not (undefined!11389 lt!617178)) (= (index!44687 lt!617178) i!1037) (bvslt (x!126316 lt!617178) (x!126316 lt!617181)) (= (select (store (arr!46260 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44687 lt!617178)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47158 0))(
  ( (Unit!47159) )
))
(declare-fun lt!617176 () Unit!47158)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47158)

(assert (=> b!1401773 (= lt!617176 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617175 (x!126316 lt!617181) (index!44687 lt!617181) (x!126316 lt!617178) (index!44687 lt!617178) (undefined!11389 lt!617178) mask!2840))))

(declare-fun b!1401775 () Bool)

(declare-fun e!793745 () Bool)

(declare-fun e!793748 () Bool)

(assert (=> b!1401775 (= e!793745 (not e!793748))))

(declare-fun res!940284 () Bool)

(assert (=> b!1401775 (=> res!940284 e!793748)))

(get-info :version)

(assert (=> b!1401775 (= res!940284 (or (not ((_ is Intermediate!10577) lt!617181)) (undefined!11389 lt!617181)))))

(declare-fun e!793749 () Bool)

(assert (=> b!1401775 e!793749))

(declare-fun res!940294 () Bool)

(assert (=> b!1401775 (=> (not res!940294) (not e!793749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95819 (_ BitVec 32)) Bool)

(assert (=> b!1401775 (= res!940294 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617179 () Unit!47158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47158)

(assert (=> b!1401775 (= lt!617179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10577)

(assert (=> b!1401775 (= lt!617181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617175 (select (arr!46260 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401775 (= lt!617175 (toIndex!0 (select (arr!46260 a!2901) j!112) mask!2840))))

(declare-fun b!1401776 () Bool)

(assert (=> b!1401776 (= e!793747 true)))

(declare-fun lt!617177 () SeekEntryResult!10577)

(declare-fun lt!617180 () (_ BitVec 64))

(declare-fun lt!617174 () array!95819)

(assert (=> b!1401776 (= lt!617177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617175 lt!617180 lt!617174 mask!2840))))

(declare-fun b!1401777 () Bool)

(declare-fun res!940286 () Bool)

(assert (=> b!1401777 (=> (not res!940286) (not e!793745))))

(assert (=> b!1401777 (= res!940286 (and (= (size!46810 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46810 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46810 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401778 () Bool)

(declare-fun res!940287 () Bool)

(assert (=> b!1401778 (=> (not res!940287) (not e!793745))))

(declare-datatypes ((List!32779 0))(
  ( (Nil!32776) (Cons!32775 (h!34023 (_ BitVec 64)) (t!47473 List!32779)) )
))
(declare-fun arrayNoDuplicates!0 (array!95819 (_ BitVec 32) List!32779) Bool)

(assert (=> b!1401778 (= res!940287 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32776))))

(declare-fun b!1401779 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10577)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10577)

(assert (=> b!1401779 (= e!793746 (= (seekEntryOrOpen!0 lt!617180 lt!617174 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126316 lt!617178) (index!44687 lt!617178) (index!44687 lt!617178) (select (arr!46260 a!2901) j!112) lt!617174 mask!2840)))))

(declare-fun b!1401780 () Bool)

(assert (=> b!1401780 (= e!793749 (= (seekEntryOrOpen!0 (select (arr!46260 a!2901) j!112) a!2901 mask!2840) (Found!10577 j!112)))))

(declare-fun b!1401781 () Bool)

(declare-fun res!940290 () Bool)

(assert (=> b!1401781 (=> (not res!940290) (not e!793745))))

(assert (=> b!1401781 (= res!940290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401782 () Bool)

(declare-fun res!940289 () Bool)

(assert (=> b!1401782 (=> (not res!940289) (not e!793745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401782 (= res!940289 (validKeyInArray!0 (select (arr!46260 a!2901) i!1037)))))

(declare-fun b!1401783 () Bool)

(assert (=> b!1401783 (= e!793748 e!793750)))

(declare-fun res!940293 () Bool)

(assert (=> b!1401783 (=> res!940293 e!793750)))

(assert (=> b!1401783 (= res!940293 (or (= lt!617181 lt!617178) (not ((_ is Intermediate!10577) lt!617178))))))

(assert (=> b!1401783 (= lt!617178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617180 mask!2840) lt!617180 lt!617174 mask!2840))))

(assert (=> b!1401783 (= lt!617180 (select (store (arr!46260 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401783 (= lt!617174 (array!95820 (store (arr!46260 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46810 a!2901)))))

(declare-fun res!940292 () Bool)

(assert (=> start!120410 (=> (not res!940292) (not e!793745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120410 (= res!940292 (validMask!0 mask!2840))))

(assert (=> start!120410 e!793745))

(assert (=> start!120410 true))

(declare-fun array_inv!35288 (array!95819) Bool)

(assert (=> start!120410 (array_inv!35288 a!2901)))

(declare-fun b!1401774 () Bool)

(declare-fun res!940285 () Bool)

(assert (=> b!1401774 (=> (not res!940285) (not e!793745))))

(assert (=> b!1401774 (= res!940285 (validKeyInArray!0 (select (arr!46260 a!2901) j!112)))))

(assert (= (and start!120410 res!940292) b!1401777))

(assert (= (and b!1401777 res!940286) b!1401782))

(assert (= (and b!1401782 res!940289) b!1401774))

(assert (= (and b!1401774 res!940285) b!1401781))

(assert (= (and b!1401781 res!940290) b!1401778))

(assert (= (and b!1401778 res!940287) b!1401775))

(assert (= (and b!1401775 res!940294) b!1401780))

(assert (= (and b!1401775 (not res!940284)) b!1401783))

(assert (= (and b!1401783 (not res!940293)) b!1401773))

(assert (= (and b!1401773 res!940288) b!1401779))

(assert (= (and b!1401773 (not res!940291)) b!1401776))

(declare-fun m!1289669 () Bool)

(assert (=> b!1401779 m!1289669))

(declare-fun m!1289671 () Bool)

(assert (=> b!1401779 m!1289671))

(assert (=> b!1401779 m!1289671))

(declare-fun m!1289673 () Bool)

(assert (=> b!1401779 m!1289673))

(declare-fun m!1289675 () Bool)

(assert (=> b!1401783 m!1289675))

(assert (=> b!1401783 m!1289675))

(declare-fun m!1289677 () Bool)

(assert (=> b!1401783 m!1289677))

(declare-fun m!1289679 () Bool)

(assert (=> b!1401783 m!1289679))

(declare-fun m!1289681 () Bool)

(assert (=> b!1401783 m!1289681))

(assert (=> b!1401775 m!1289671))

(declare-fun m!1289683 () Bool)

(assert (=> b!1401775 m!1289683))

(assert (=> b!1401775 m!1289671))

(declare-fun m!1289685 () Bool)

(assert (=> b!1401775 m!1289685))

(declare-fun m!1289687 () Bool)

(assert (=> b!1401775 m!1289687))

(assert (=> b!1401775 m!1289671))

(declare-fun m!1289689 () Bool)

(assert (=> b!1401775 m!1289689))

(declare-fun m!1289691 () Bool)

(assert (=> b!1401776 m!1289691))

(declare-fun m!1289693 () Bool)

(assert (=> b!1401781 m!1289693))

(assert (=> b!1401773 m!1289679))

(declare-fun m!1289695 () Bool)

(assert (=> b!1401773 m!1289695))

(declare-fun m!1289697 () Bool)

(assert (=> b!1401773 m!1289697))

(declare-fun m!1289699 () Bool)

(assert (=> b!1401782 m!1289699))

(assert (=> b!1401782 m!1289699))

(declare-fun m!1289701 () Bool)

(assert (=> b!1401782 m!1289701))

(assert (=> b!1401774 m!1289671))

(assert (=> b!1401774 m!1289671))

(declare-fun m!1289703 () Bool)

(assert (=> b!1401774 m!1289703))

(declare-fun m!1289705 () Bool)

(assert (=> start!120410 m!1289705))

(declare-fun m!1289707 () Bool)

(assert (=> start!120410 m!1289707))

(declare-fun m!1289709 () Bool)

(assert (=> b!1401778 m!1289709))

(assert (=> b!1401780 m!1289671))

(assert (=> b!1401780 m!1289671))

(declare-fun m!1289711 () Bool)

(assert (=> b!1401780 m!1289711))

(check-sat (not b!1401776) (not b!1401780) (not b!1401782) (not b!1401773) (not b!1401781) (not b!1401778) (not b!1401779) (not b!1401783) (not b!1401774) (not start!120410) (not b!1401775))
(check-sat)
