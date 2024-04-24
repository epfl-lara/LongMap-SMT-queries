; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51144 () Bool)

(assert start!51144)

(declare-fun b!558687 () Bool)

(declare-fun res!350450 () Bool)

(declare-fun e!321856 () Bool)

(assert (=> b!558687 (=> (not res!350450) (not e!321856))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35145 0))(
  ( (array!35146 (arr!16876 (Array (_ BitVec 32) (_ BitVec 64))) (size!17240 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35145)

(assert (=> b!558687 (= res!350450 (and (= (size!17240 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17240 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17240 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558688 () Bool)

(declare-fun e!321855 () Bool)

(assert (=> b!558688 (= e!321856 e!321855)))

(declare-fun res!350446 () Bool)

(assert (=> b!558688 (=> (not res!350446) (not e!321855))))

(declare-datatypes ((SeekEntryResult!5281 0))(
  ( (MissingZero!5281 (index!23351 (_ BitVec 32))) (Found!5281 (index!23352 (_ BitVec 32))) (Intermediate!5281 (undefined!6093 Bool) (index!23353 (_ BitVec 32)) (x!52400 (_ BitVec 32))) (Undefined!5281) (MissingVacant!5281 (index!23354 (_ BitVec 32))) )
))
(declare-fun lt!253914 () SeekEntryResult!5281)

(assert (=> b!558688 (= res!350446 (or (= lt!253914 (MissingZero!5281 i!1132)) (= lt!253914 (MissingVacant!5281 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35145 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!558688 (= lt!253914 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558689 () Bool)

(declare-fun e!321854 () Bool)

(assert (=> b!558689 (= e!321855 e!321854)))

(declare-fun res!350447 () Bool)

(assert (=> b!558689 (=> (not res!350447) (not e!321854))))

(declare-fun lt!253918 () (_ BitVec 32))

(declare-fun lt!253917 () SeekEntryResult!5281)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35145 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!558689 (= res!350447 (= lt!253917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253918 (select (store (arr!16876 a!3118) i!1132 k0!1914) j!142) (array!35146 (store (arr!16876 a!3118) i!1132 k0!1914) (size!17240 a!3118)) mask!3119)))))

(declare-fun lt!253913 () (_ BitVec 32))

(assert (=> b!558689 (= lt!253917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253913 (select (arr!16876 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558689 (= lt!253918 (toIndex!0 (select (store (arr!16876 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558689 (= lt!253913 (toIndex!0 (select (arr!16876 a!3118) j!142) mask!3119))))

(declare-fun lt!253915 () SeekEntryResult!5281)

(declare-fun b!558690 () Bool)

(declare-fun e!321857 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35145 (_ BitVec 32)) SeekEntryResult!5281)

(assert (=> b!558690 (= e!321857 (= lt!253915 (seekKeyOrZeroReturnVacant!0 (x!52400 lt!253917) (index!23353 lt!253917) (index!23353 lt!253917) (select (arr!16876 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558691 () Bool)

(declare-fun e!321858 () Bool)

(assert (=> b!558691 (= e!321858 e!321857)))

(declare-fun res!350452 () Bool)

(assert (=> b!558691 (=> res!350452 e!321857)))

(get-info :version)

(assert (=> b!558691 (= res!350452 (or (undefined!6093 lt!253917) (not ((_ is Intermediate!5281) lt!253917)) (= (select (arr!16876 a!3118) (index!23353 lt!253917)) (select (arr!16876 a!3118) j!142)) (= (select (arr!16876 a!3118) (index!23353 lt!253917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558692 () Bool)

(declare-fun res!350445 () Bool)

(assert (=> b!558692 (=> (not res!350445) (not e!321855))))

(declare-datatypes ((List!10863 0))(
  ( (Nil!10860) (Cons!10859 (h!11856 (_ BitVec 64)) (t!17083 List!10863)) )
))
(declare-fun arrayNoDuplicates!0 (array!35145 (_ BitVec 32) List!10863) Bool)

(assert (=> b!558692 (= res!350445 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10860))))

(declare-fun res!350453 () Bool)

(assert (=> start!51144 (=> (not res!350453) (not e!321856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51144 (= res!350453 (validMask!0 mask!3119))))

(assert (=> start!51144 e!321856))

(assert (=> start!51144 true))

(declare-fun array_inv!12735 (array!35145) Bool)

(assert (=> start!51144 (array_inv!12735 a!3118)))

(declare-fun b!558693 () Bool)

(declare-fun res!350449 () Bool)

(assert (=> b!558693 (=> (not res!350449) (not e!321856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558693 (= res!350449 (validKeyInArray!0 k0!1914))))

(declare-fun b!558694 () Bool)

(declare-fun res!350454 () Bool)

(assert (=> b!558694 (=> (not res!350454) (not e!321856))))

(assert (=> b!558694 (= res!350454 (validKeyInArray!0 (select (arr!16876 a!3118) j!142)))))

(declare-fun b!558695 () Bool)

(assert (=> b!558695 (= e!321854 (not true))))

(assert (=> b!558695 e!321858))

(declare-fun res!350455 () Bool)

(assert (=> b!558695 (=> (not res!350455) (not e!321858))))

(assert (=> b!558695 (= res!350455 (= lt!253915 (Found!5281 j!142)))))

(assert (=> b!558695 (= lt!253915 (seekEntryOrOpen!0 (select (arr!16876 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35145 (_ BitVec 32)) Bool)

(assert (=> b!558695 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17407 0))(
  ( (Unit!17408) )
))
(declare-fun lt!253916 () Unit!17407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17407)

(assert (=> b!558695 (= lt!253916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558696 () Bool)

(declare-fun res!350448 () Bool)

(assert (=> b!558696 (=> (not res!350448) (not e!321855))))

(assert (=> b!558696 (= res!350448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558697 () Bool)

(declare-fun res!350451 () Bool)

(assert (=> b!558697 (=> (not res!350451) (not e!321856))))

(declare-fun arrayContainsKey!0 (array!35145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558697 (= res!350451 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51144 res!350453) b!558687))

(assert (= (and b!558687 res!350450) b!558694))

(assert (= (and b!558694 res!350454) b!558693))

(assert (= (and b!558693 res!350449) b!558697))

(assert (= (and b!558697 res!350451) b!558688))

(assert (= (and b!558688 res!350446) b!558696))

(assert (= (and b!558696 res!350448) b!558692))

(assert (= (and b!558692 res!350445) b!558689))

(assert (= (and b!558689 res!350447) b!558695))

(assert (= (and b!558695 res!350455) b!558691))

(assert (= (and b!558691 (not res!350452)) b!558690))

(declare-fun m!536813 () Bool)

(assert (=> b!558697 m!536813))

(declare-fun m!536815 () Bool)

(assert (=> b!558692 m!536815))

(declare-fun m!536817 () Bool)

(assert (=> b!558690 m!536817))

(assert (=> b!558690 m!536817))

(declare-fun m!536819 () Bool)

(assert (=> b!558690 m!536819))

(assert (=> b!558689 m!536817))

(declare-fun m!536821 () Bool)

(assert (=> b!558689 m!536821))

(declare-fun m!536823 () Bool)

(assert (=> b!558689 m!536823))

(declare-fun m!536825 () Bool)

(assert (=> b!558689 m!536825))

(assert (=> b!558689 m!536817))

(assert (=> b!558689 m!536823))

(declare-fun m!536827 () Bool)

(assert (=> b!558689 m!536827))

(assert (=> b!558689 m!536817))

(declare-fun m!536829 () Bool)

(assert (=> b!558689 m!536829))

(assert (=> b!558689 m!536823))

(declare-fun m!536831 () Bool)

(assert (=> b!558689 m!536831))

(declare-fun m!536833 () Bool)

(assert (=> b!558691 m!536833))

(assert (=> b!558691 m!536817))

(declare-fun m!536835 () Bool)

(assert (=> b!558693 m!536835))

(assert (=> b!558695 m!536817))

(assert (=> b!558695 m!536817))

(declare-fun m!536837 () Bool)

(assert (=> b!558695 m!536837))

(declare-fun m!536839 () Bool)

(assert (=> b!558695 m!536839))

(declare-fun m!536841 () Bool)

(assert (=> b!558695 m!536841))

(declare-fun m!536843 () Bool)

(assert (=> b!558688 m!536843))

(declare-fun m!536845 () Bool)

(assert (=> b!558696 m!536845))

(assert (=> b!558694 m!536817))

(assert (=> b!558694 m!536817))

(declare-fun m!536847 () Bool)

(assert (=> b!558694 m!536847))

(declare-fun m!536849 () Bool)

(assert (=> start!51144 m!536849))

(declare-fun m!536851 () Bool)

(assert (=> start!51144 m!536851))

(check-sat (not b!558688) (not b!558697) (not start!51144) (not b!558695) (not b!558693) (not b!558690) (not b!558696) (not b!558694) (not b!558692) (not b!558689))
(check-sat)
