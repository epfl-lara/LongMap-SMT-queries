; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47774 () Bool)

(assert start!47774)

(declare-fun b!526054 () Bool)

(declare-fun res!322736 () Bool)

(declare-fun e!306670 () Bool)

(assert (=> b!526054 (=> (not res!322736) (not e!306670))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33411 0))(
  ( (array!33412 (arr!16057 (Array (_ BitVec 32) (_ BitVec 64))) (size!16421 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33411)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526054 (= res!322736 (and (= (size!16421 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16421 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16421 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526055 () Bool)

(declare-fun res!322739 () Bool)

(assert (=> b!526055 (=> (not res!322739) (not e!306670))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526055 (= res!322739 (validKeyInArray!0 k0!2280))))

(declare-fun b!526056 () Bool)

(declare-fun res!322737 () Bool)

(assert (=> b!526056 (=> (not res!322737) (not e!306670))))

(declare-fun arrayContainsKey!0 (array!33411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526056 (= res!322737 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526057 () Bool)

(declare-fun e!306672 () Bool)

(declare-fun e!306671 () Bool)

(assert (=> b!526057 (= e!306672 (not e!306671))))

(declare-fun res!322733 () Bool)

(assert (=> b!526057 (=> res!322733 e!306671)))

(declare-datatypes ((SeekEntryResult!4524 0))(
  ( (MissingZero!4524 (index!20308 (_ BitVec 32))) (Found!4524 (index!20309 (_ BitVec 32))) (Intermediate!4524 (undefined!5336 Bool) (index!20310 (_ BitVec 32)) (x!49281 (_ BitVec 32))) (Undefined!4524) (MissingVacant!4524 (index!20311 (_ BitVec 32))) )
))
(declare-fun lt!241840 () SeekEntryResult!4524)

(declare-fun lt!241835 () array!33411)

(declare-fun lt!241843 () (_ BitVec 64))

(declare-fun lt!241836 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33411 (_ BitVec 32)) SeekEntryResult!4524)

(assert (=> b!526057 (= res!322733 (= lt!241840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241836 lt!241843 lt!241835 mask!3524)))))

(declare-fun lt!241841 () (_ BitVec 32))

(assert (=> b!526057 (= lt!241840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241841 (select (arr!16057 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526057 (= lt!241836 (toIndex!0 lt!241843 mask!3524))))

(assert (=> b!526057 (= lt!241843 (select (store (arr!16057 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526057 (= lt!241841 (toIndex!0 (select (arr!16057 a!3235) j!176) mask!3524))))

(assert (=> b!526057 (= lt!241835 (array!33412 (store (arr!16057 a!3235) i!1204 k0!2280) (size!16421 a!3235)))))

(declare-fun e!306666 () Bool)

(assert (=> b!526057 e!306666))

(declare-fun res!322740 () Bool)

(assert (=> b!526057 (=> (not res!322740) (not e!306666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33411 (_ BitVec 32)) Bool)

(assert (=> b!526057 (= res!322740 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16548 0))(
  ( (Unit!16549) )
))
(declare-fun lt!241839 () Unit!16548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16548)

(assert (=> b!526057 (= lt!241839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526058 () Bool)

(declare-fun e!306668 () Unit!16548)

(declare-fun Unit!16550 () Unit!16548)

(assert (=> b!526058 (= e!306668 Unit!16550)))

(declare-fun lt!241842 () Unit!16548)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16548)

(assert (=> b!526058 (= lt!241842 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241841 #b00000000000000000000000000000000 (index!20310 lt!241840) (x!49281 lt!241840) mask!3524))))

(declare-fun res!322742 () Bool)

(assert (=> b!526058 (= res!322742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241841 lt!241843 lt!241835 mask!3524) (Intermediate!4524 false (index!20310 lt!241840) (x!49281 lt!241840))))))

(declare-fun e!306667 () Bool)

(assert (=> b!526058 (=> (not res!322742) (not e!306667))))

(assert (=> b!526058 e!306667))

(declare-fun b!526059 () Bool)

(declare-fun res!322741 () Bool)

(assert (=> b!526059 (=> (not res!322741) (not e!306672))))

(declare-datatypes ((List!10215 0))(
  ( (Nil!10212) (Cons!10211 (h!11142 (_ BitVec 64)) (t!16443 List!10215)) )
))
(declare-fun arrayNoDuplicates!0 (array!33411 (_ BitVec 32) List!10215) Bool)

(assert (=> b!526059 (= res!322741 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10212))))

(declare-fun b!526060 () Bool)

(assert (=> b!526060 (= e!306671 true)))

(assert (=> b!526060 (= (index!20310 lt!241840) i!1204)))

(declare-fun lt!241837 () Unit!16548)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33411 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16548)

(assert (=> b!526060 (= lt!241837 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241841 #b00000000000000000000000000000000 (index!20310 lt!241840) (x!49281 lt!241840) mask!3524))))

(assert (=> b!526060 (and (or (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241834 () Unit!16548)

(assert (=> b!526060 (= lt!241834 e!306668)))

(declare-fun c!61967 () Bool)

(assert (=> b!526060 (= c!61967 (= (select (arr!16057 a!3235) (index!20310 lt!241840)) (select (arr!16057 a!3235) j!176)))))

(assert (=> b!526060 (and (bvslt (x!49281 lt!241840) #b01111111111111111111111111111110) (or (= (select (arr!16057 a!3235) (index!20310 lt!241840)) (select (arr!16057 a!3235) j!176)) (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16057 a!3235) (index!20310 lt!241840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526061 () Bool)

(declare-fun Unit!16551 () Unit!16548)

(assert (=> b!526061 (= e!306668 Unit!16551)))

(declare-fun b!526062 () Bool)

(declare-fun res!322731 () Bool)

(assert (=> b!526062 (=> (not res!322731) (not e!306672))))

(assert (=> b!526062 (= res!322731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526063 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33411 (_ BitVec 32)) SeekEntryResult!4524)

(assert (=> b!526063 (= e!306666 (= (seekEntryOrOpen!0 (select (arr!16057 a!3235) j!176) a!3235 mask!3524) (Found!4524 j!176)))))

(declare-fun res!322732 () Bool)

(assert (=> start!47774 (=> (not res!322732) (not e!306670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47774 (= res!322732 (validMask!0 mask!3524))))

(assert (=> start!47774 e!306670))

(assert (=> start!47774 true))

(declare-fun array_inv!11853 (array!33411) Bool)

(assert (=> start!47774 (array_inv!11853 a!3235)))

(declare-fun b!526064 () Bool)

(assert (=> b!526064 (= e!306667 false)))

(declare-fun b!526065 () Bool)

(declare-fun res!322734 () Bool)

(assert (=> b!526065 (=> res!322734 e!306671)))

(get-info :version)

(assert (=> b!526065 (= res!322734 (or (undefined!5336 lt!241840) (not ((_ is Intermediate!4524) lt!241840))))))

(declare-fun b!526066 () Bool)

(assert (=> b!526066 (= e!306670 e!306672)))

(declare-fun res!322735 () Bool)

(assert (=> b!526066 (=> (not res!322735) (not e!306672))))

(declare-fun lt!241838 () SeekEntryResult!4524)

(assert (=> b!526066 (= res!322735 (or (= lt!241838 (MissingZero!4524 i!1204)) (= lt!241838 (MissingVacant!4524 i!1204))))))

(assert (=> b!526066 (= lt!241838 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526067 () Bool)

(declare-fun res!322738 () Bool)

(assert (=> b!526067 (=> (not res!322738) (not e!306670))))

(assert (=> b!526067 (= res!322738 (validKeyInArray!0 (select (arr!16057 a!3235) j!176)))))

(assert (= (and start!47774 res!322732) b!526054))

(assert (= (and b!526054 res!322736) b!526067))

(assert (= (and b!526067 res!322738) b!526055))

(assert (= (and b!526055 res!322739) b!526056))

(assert (= (and b!526056 res!322737) b!526066))

(assert (= (and b!526066 res!322735) b!526062))

(assert (= (and b!526062 res!322731) b!526059))

(assert (= (and b!526059 res!322741) b!526057))

(assert (= (and b!526057 res!322740) b!526063))

(assert (= (and b!526057 (not res!322733)) b!526065))

(assert (= (and b!526065 (not res!322734)) b!526060))

(assert (= (and b!526060 c!61967) b!526058))

(assert (= (and b!526060 (not c!61967)) b!526061))

(assert (= (and b!526058 res!322742) b!526064))

(declare-fun m!506741 () Bool)

(assert (=> b!526058 m!506741))

(declare-fun m!506743 () Bool)

(assert (=> b!526058 m!506743))

(declare-fun m!506745 () Bool)

(assert (=> b!526057 m!506745))

(declare-fun m!506747 () Bool)

(assert (=> b!526057 m!506747))

(declare-fun m!506749 () Bool)

(assert (=> b!526057 m!506749))

(declare-fun m!506751 () Bool)

(assert (=> b!526057 m!506751))

(declare-fun m!506753 () Bool)

(assert (=> b!526057 m!506753))

(assert (=> b!526057 m!506751))

(declare-fun m!506755 () Bool)

(assert (=> b!526057 m!506755))

(assert (=> b!526057 m!506751))

(declare-fun m!506757 () Bool)

(assert (=> b!526057 m!506757))

(declare-fun m!506759 () Bool)

(assert (=> b!526057 m!506759))

(declare-fun m!506761 () Bool)

(assert (=> b!526057 m!506761))

(declare-fun m!506763 () Bool)

(assert (=> b!526059 m!506763))

(assert (=> b!526067 m!506751))

(assert (=> b!526067 m!506751))

(declare-fun m!506765 () Bool)

(assert (=> b!526067 m!506765))

(declare-fun m!506767 () Bool)

(assert (=> start!47774 m!506767))

(declare-fun m!506769 () Bool)

(assert (=> start!47774 m!506769))

(declare-fun m!506771 () Bool)

(assert (=> b!526066 m!506771))

(declare-fun m!506773 () Bool)

(assert (=> b!526055 m!506773))

(declare-fun m!506775 () Bool)

(assert (=> b!526060 m!506775))

(declare-fun m!506777 () Bool)

(assert (=> b!526060 m!506777))

(assert (=> b!526060 m!506751))

(declare-fun m!506779 () Bool)

(assert (=> b!526062 m!506779))

(assert (=> b!526063 m!506751))

(assert (=> b!526063 m!506751))

(declare-fun m!506781 () Bool)

(assert (=> b!526063 m!506781))

(declare-fun m!506783 () Bool)

(assert (=> b!526056 m!506783))

(check-sat (not b!526055) (not b!526057) (not b!526056) (not b!526059) (not b!526062) (not b!526067) (not b!526060) (not start!47774) (not b!526066) (not b!526063) (not b!526058))
(check-sat)
