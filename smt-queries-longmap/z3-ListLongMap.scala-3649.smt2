; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50332 () Bool)

(assert start!50332)

(declare-fun b!550712 () Bool)

(declare-fun res!343676 () Bool)

(declare-fun e!317891 () Bool)

(assert (=> b!550712 (=> (not res!343676) (not e!317891))))

(declare-datatypes ((array!34728 0))(
  ( (array!34729 (arr!16678 (Array (_ BitVec 32) (_ BitVec 64))) (size!17042 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34728)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34728 (_ BitVec 32)) Bool)

(assert (=> b!550712 (= res!343676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!343675 () Bool)

(declare-fun e!317892 () Bool)

(assert (=> start!50332 (=> (not res!343675) (not e!317892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50332 (= res!343675 (validMask!0 mask!3119))))

(assert (=> start!50332 e!317892))

(assert (=> start!50332 true))

(declare-fun array_inv!12474 (array!34728) Bool)

(assert (=> start!50332 (array_inv!12474 a!3118)))

(declare-fun b!550713 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!317889 () Bool)

(declare-datatypes ((SeekEntryResult!5127 0))(
  ( (MissingZero!5127 (index!22735 (_ BitVec 32))) (Found!5127 (index!22736 (_ BitVec 32))) (Intermediate!5127 (undefined!5939 Bool) (index!22737 (_ BitVec 32)) (x!51663 (_ BitVec 32))) (Undefined!5127) (MissingVacant!5127 (index!22738 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34728 (_ BitVec 32)) SeekEntryResult!5127)

(assert (=> b!550713 (= e!317889 (= (seekEntryOrOpen!0 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) (Found!5127 j!142)))))

(declare-fun b!550714 () Bool)

(declare-fun res!343680 () Bool)

(assert (=> b!550714 (=> (not res!343680) (not e!317892))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550714 (= res!343680 (and (= (size!17042 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17042 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17042 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550715 () Bool)

(declare-fun res!343682 () Bool)

(assert (=> b!550715 (=> (not res!343682) (not e!317891))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34728 (_ BitVec 32)) SeekEntryResult!5127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550715 (= res!343682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16678 a!3118) j!142) mask!3119) (select (arr!16678 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (array!34729 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)) mask!3119)))))

(declare-fun b!550716 () Bool)

(assert (=> b!550716 (= e!317892 e!317891)))

(declare-fun res!343673 () Bool)

(assert (=> b!550716 (=> (not res!343673) (not e!317891))))

(declare-fun lt!250606 () SeekEntryResult!5127)

(assert (=> b!550716 (= res!343673 (or (= lt!250606 (MissingZero!5127 i!1132)) (= lt!250606 (MissingVacant!5127 i!1132))))))

(assert (=> b!550716 (= lt!250606 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550717 () Bool)

(declare-fun res!343679 () Bool)

(assert (=> b!550717 (=> (not res!343679) (not e!317892))))

(declare-fun arrayContainsKey!0 (array!34728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550717 (= res!343679 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550718 () Bool)

(declare-fun res!343678 () Bool)

(assert (=> b!550718 (=> (not res!343678) (not e!317892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550718 (= res!343678 (validKeyInArray!0 (select (arr!16678 a!3118) j!142)))))

(declare-fun b!550719 () Bool)

(assert (=> b!550719 (= e!317891 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550719 e!317889))

(declare-fun res!343677 () Bool)

(assert (=> b!550719 (=> (not res!343677) (not e!317889))))

(assert (=> b!550719 (= res!343677 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17028 0))(
  ( (Unit!17029) )
))
(declare-fun lt!250605 () Unit!17028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17028)

(assert (=> b!550719 (= lt!250605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550720 () Bool)

(declare-fun res!343681 () Bool)

(assert (=> b!550720 (=> (not res!343681) (not e!317891))))

(declare-datatypes ((List!10758 0))(
  ( (Nil!10755) (Cons!10754 (h!11730 (_ BitVec 64)) (t!16986 List!10758)) )
))
(declare-fun arrayNoDuplicates!0 (array!34728 (_ BitVec 32) List!10758) Bool)

(assert (=> b!550720 (= res!343681 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10755))))

(declare-fun b!550721 () Bool)

(declare-fun res!343674 () Bool)

(assert (=> b!550721 (=> (not res!343674) (not e!317892))))

(assert (=> b!550721 (= res!343674 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50332 res!343675) b!550714))

(assert (= (and b!550714 res!343680) b!550718))

(assert (= (and b!550718 res!343678) b!550721))

(assert (= (and b!550721 res!343674) b!550717))

(assert (= (and b!550717 res!343679) b!550716))

(assert (= (and b!550716 res!343673) b!550712))

(assert (= (and b!550712 res!343676) b!550720))

(assert (= (and b!550720 res!343681) b!550715))

(assert (= (and b!550715 res!343682) b!550719))

(assert (= (and b!550719 res!343677) b!550713))

(declare-fun m!527697 () Bool)

(assert (=> b!550716 m!527697))

(declare-fun m!527699 () Bool)

(assert (=> b!550712 m!527699))

(declare-fun m!527701 () Bool)

(assert (=> b!550720 m!527701))

(declare-fun m!527703 () Bool)

(assert (=> start!50332 m!527703))

(declare-fun m!527705 () Bool)

(assert (=> start!50332 m!527705))

(declare-fun m!527707 () Bool)

(assert (=> b!550715 m!527707))

(declare-fun m!527709 () Bool)

(assert (=> b!550715 m!527709))

(assert (=> b!550715 m!527707))

(declare-fun m!527711 () Bool)

(assert (=> b!550715 m!527711))

(declare-fun m!527713 () Bool)

(assert (=> b!550715 m!527713))

(assert (=> b!550715 m!527711))

(declare-fun m!527715 () Bool)

(assert (=> b!550715 m!527715))

(assert (=> b!550715 m!527709))

(assert (=> b!550715 m!527707))

(declare-fun m!527717 () Bool)

(assert (=> b!550715 m!527717))

(declare-fun m!527719 () Bool)

(assert (=> b!550715 m!527719))

(assert (=> b!550715 m!527711))

(assert (=> b!550715 m!527713))

(declare-fun m!527721 () Bool)

(assert (=> b!550717 m!527721))

(assert (=> b!550713 m!527707))

(assert (=> b!550713 m!527707))

(declare-fun m!527723 () Bool)

(assert (=> b!550713 m!527723))

(declare-fun m!527725 () Bool)

(assert (=> b!550719 m!527725))

(declare-fun m!527727 () Bool)

(assert (=> b!550719 m!527727))

(declare-fun m!527729 () Bool)

(assert (=> b!550721 m!527729))

(assert (=> b!550718 m!527707))

(assert (=> b!550718 m!527707))

(declare-fun m!527731 () Bool)

(assert (=> b!550718 m!527731))

(check-sat (not b!550715) (not b!550718) (not b!550713) (not start!50332) (not b!550717) (not b!550721) (not b!550720) (not b!550712) (not b!550719) (not b!550716))
(check-sat)
