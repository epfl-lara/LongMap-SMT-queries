; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47366 () Bool)

(assert start!47366)

(declare-fun b!520803 () Bool)

(declare-fun res!318739 () Bool)

(declare-fun e!303888 () Bool)

(assert (=> b!520803 (=> res!318739 e!303888)))

(declare-datatypes ((SeekEntryResult!4375 0))(
  ( (MissingZero!4375 (index!19703 (_ BitVec 32))) (Found!4375 (index!19704 (_ BitVec 32))) (Intermediate!4375 (undefined!5187 Bool) (index!19705 (_ BitVec 32)) (x!48838 (_ BitVec 32))) (Undefined!4375) (MissingVacant!4375 (index!19706 (_ BitVec 32))) )
))
(declare-fun lt!238603 () SeekEntryResult!4375)

(get-info :version)

(assert (=> b!520803 (= res!318739 (or (undefined!5187 lt!238603) (not ((_ is Intermediate!4375) lt!238603))))))

(declare-fun b!520804 () Bool)

(declare-fun res!318743 () Bool)

(declare-fun e!303893 () Bool)

(assert (=> b!520804 (=> (not res!318743) (not e!303893))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520804 (= res!318743 (validKeyInArray!0 k0!2280))))

(declare-fun b!520805 () Bool)

(declare-fun e!303890 () Bool)

(assert (=> b!520805 (= e!303893 e!303890)))

(declare-fun res!318738 () Bool)

(assert (=> b!520805 (=> (not res!318738) (not e!303890))))

(declare-fun lt!238607 () SeekEntryResult!4375)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520805 (= res!318738 (or (= lt!238607 (MissingZero!4375 i!1204)) (= lt!238607 (MissingVacant!4375 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33193 0))(
  ( (array!33194 (arr!15952 (Array (_ BitVec 32) (_ BitVec 64))) (size!16316 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33193)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33193 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!520805 (= lt!238607 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520807 () Bool)

(declare-fun res!318748 () Bool)

(assert (=> b!520807 (=> (not res!318748) (not e!303893))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520807 (= res!318748 (and (= (size!16316 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16316 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16316 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520808 () Bool)

(declare-fun res!318744 () Bool)

(assert (=> b!520808 (=> (not res!318744) (not e!303890))))

(declare-datatypes ((List!10017 0))(
  ( (Nil!10014) (Cons!10013 (h!10935 (_ BitVec 64)) (t!16237 List!10017)) )
))
(declare-fun arrayNoDuplicates!0 (array!33193 (_ BitVec 32) List!10017) Bool)

(assert (=> b!520808 (= res!318744 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10014))))

(declare-fun b!520809 () Bool)

(assert (=> b!520809 (= e!303888 true)))

(assert (=> b!520809 (and (or (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16111 0))(
  ( (Unit!16112) )
))
(declare-fun lt!238605 () Unit!16111)

(declare-fun e!303894 () Unit!16111)

(assert (=> b!520809 (= lt!238605 e!303894)))

(declare-fun c!61334 () Bool)

(assert (=> b!520809 (= c!61334 (= (select (arr!15952 a!3235) (index!19705 lt!238603)) (select (arr!15952 a!3235) j!176)))))

(assert (=> b!520809 (and (bvslt (x!48838 lt!238603) #b01111111111111111111111111111110) (or (= (select (arr!15952 a!3235) (index!19705 lt!238603)) (select (arr!15952 a!3235) j!176)) (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15952 a!3235) (index!19705 lt!238603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520810 () Bool)

(declare-fun e!303892 () Bool)

(assert (=> b!520810 (= e!303892 false)))

(declare-fun b!520811 () Bool)

(declare-fun res!318746 () Bool)

(assert (=> b!520811 (=> (not res!318746) (not e!303893))))

(declare-fun arrayContainsKey!0 (array!33193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520811 (= res!318746 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520812 () Bool)

(declare-fun Unit!16113 () Unit!16111)

(assert (=> b!520812 (= e!303894 Unit!16113)))

(declare-fun e!303891 () Bool)

(declare-fun b!520813 () Bool)

(assert (=> b!520813 (= e!303891 (= (seekEntryOrOpen!0 (select (arr!15952 a!3235) j!176) a!3235 mask!3524) (Found!4375 j!176)))))

(declare-fun b!520814 () Bool)

(declare-fun res!318747 () Bool)

(assert (=> b!520814 (=> (not res!318747) (not e!303890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33193 (_ BitVec 32)) Bool)

(assert (=> b!520814 (= res!318747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520806 () Bool)

(declare-fun res!318741 () Bool)

(assert (=> b!520806 (=> (not res!318741) (not e!303893))))

(assert (=> b!520806 (= res!318741 (validKeyInArray!0 (select (arr!15952 a!3235) j!176)))))

(declare-fun res!318740 () Bool)

(assert (=> start!47366 (=> (not res!318740) (not e!303893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47366 (= res!318740 (validMask!0 mask!3524))))

(assert (=> start!47366 e!303893))

(assert (=> start!47366 true))

(declare-fun array_inv!11811 (array!33193) Bool)

(assert (=> start!47366 (array_inv!11811 a!3235)))

(declare-fun b!520815 () Bool)

(declare-fun Unit!16114 () Unit!16111)

(assert (=> b!520815 (= e!303894 Unit!16114)))

(declare-fun lt!238609 () (_ BitVec 32))

(declare-fun lt!238604 () Unit!16111)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16111)

(assert (=> b!520815 (= lt!238604 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238609 #b00000000000000000000000000000000 (index!19705 lt!238603) (x!48838 lt!238603) mask!3524))))

(declare-fun lt!238601 () array!33193)

(declare-fun res!318742 () Bool)

(declare-fun lt!238608 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33193 (_ BitVec 32)) SeekEntryResult!4375)

(assert (=> b!520815 (= res!318742 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238609 lt!238608 lt!238601 mask!3524) (Intermediate!4375 false (index!19705 lt!238603) (x!48838 lt!238603))))))

(assert (=> b!520815 (=> (not res!318742) (not e!303892))))

(assert (=> b!520815 e!303892))

(declare-fun b!520816 () Bool)

(assert (=> b!520816 (= e!303890 (not e!303888))))

(declare-fun res!318745 () Bool)

(assert (=> b!520816 (=> res!318745 e!303888)))

(declare-fun lt!238606 () (_ BitVec 32))

(assert (=> b!520816 (= res!318745 (= lt!238603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238606 lt!238608 lt!238601 mask!3524)))))

(assert (=> b!520816 (= lt!238603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238609 (select (arr!15952 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520816 (= lt!238606 (toIndex!0 lt!238608 mask!3524))))

(assert (=> b!520816 (= lt!238608 (select (store (arr!15952 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520816 (= lt!238609 (toIndex!0 (select (arr!15952 a!3235) j!176) mask!3524))))

(assert (=> b!520816 (= lt!238601 (array!33194 (store (arr!15952 a!3235) i!1204 k0!2280) (size!16316 a!3235)))))

(assert (=> b!520816 e!303891))

(declare-fun res!318737 () Bool)

(assert (=> b!520816 (=> (not res!318737) (not e!303891))))

(assert (=> b!520816 (= res!318737 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238602 () Unit!16111)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16111)

(assert (=> b!520816 (= lt!238602 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47366 res!318740) b!520807))

(assert (= (and b!520807 res!318748) b!520806))

(assert (= (and b!520806 res!318741) b!520804))

(assert (= (and b!520804 res!318743) b!520811))

(assert (= (and b!520811 res!318746) b!520805))

(assert (= (and b!520805 res!318738) b!520814))

(assert (= (and b!520814 res!318747) b!520808))

(assert (= (and b!520808 res!318744) b!520816))

(assert (= (and b!520816 res!318737) b!520813))

(assert (= (and b!520816 (not res!318745)) b!520803))

(assert (= (and b!520803 (not res!318739)) b!520809))

(assert (= (and b!520809 c!61334) b!520815))

(assert (= (and b!520809 (not c!61334)) b!520812))

(assert (= (and b!520815 res!318742) b!520810))

(declare-fun m!501961 () Bool)

(assert (=> b!520811 m!501961))

(declare-fun m!501963 () Bool)

(assert (=> b!520809 m!501963))

(declare-fun m!501965 () Bool)

(assert (=> b!520809 m!501965))

(declare-fun m!501967 () Bool)

(assert (=> b!520805 m!501967))

(declare-fun m!501969 () Bool)

(assert (=> b!520804 m!501969))

(declare-fun m!501971 () Bool)

(assert (=> b!520814 m!501971))

(assert (=> b!520813 m!501965))

(assert (=> b!520813 m!501965))

(declare-fun m!501973 () Bool)

(assert (=> b!520813 m!501973))

(assert (=> b!520806 m!501965))

(assert (=> b!520806 m!501965))

(declare-fun m!501975 () Bool)

(assert (=> b!520806 m!501975))

(assert (=> b!520816 m!501965))

(declare-fun m!501977 () Bool)

(assert (=> b!520816 m!501977))

(declare-fun m!501979 () Bool)

(assert (=> b!520816 m!501979))

(declare-fun m!501981 () Bool)

(assert (=> b!520816 m!501981))

(declare-fun m!501983 () Bool)

(assert (=> b!520816 m!501983))

(assert (=> b!520816 m!501965))

(declare-fun m!501985 () Bool)

(assert (=> b!520816 m!501985))

(declare-fun m!501987 () Bool)

(assert (=> b!520816 m!501987))

(declare-fun m!501989 () Bool)

(assert (=> b!520816 m!501989))

(declare-fun m!501991 () Bool)

(assert (=> b!520816 m!501991))

(assert (=> b!520816 m!501965))

(declare-fun m!501993 () Bool)

(assert (=> b!520815 m!501993))

(declare-fun m!501995 () Bool)

(assert (=> b!520815 m!501995))

(declare-fun m!501997 () Bool)

(assert (=> start!47366 m!501997))

(declare-fun m!501999 () Bool)

(assert (=> start!47366 m!501999))

(declare-fun m!502001 () Bool)

(assert (=> b!520808 m!502001))

(check-sat (not b!520816) (not b!520813) (not start!47366) (not b!520808) (not b!520815) (not b!520804) (not b!520814) (not b!520805) (not b!520806) (not b!520811))
(check-sat)
