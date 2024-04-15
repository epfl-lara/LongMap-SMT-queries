; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51476 () Bool)

(assert start!51476)

(declare-fun b!562873 () Bool)

(declare-fun e!324373 () Bool)

(declare-fun lt!256826 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562873 (= e!324373 (validKeyInArray!0 lt!256826))))

(declare-fun b!562874 () Bool)

(declare-fun e!324371 () Bool)

(declare-fun e!324372 () Bool)

(assert (=> b!562874 (= e!324371 (not e!324372))))

(declare-fun res!354176 () Bool)

(assert (=> b!562874 (=> res!354176 e!324372)))

(declare-datatypes ((SeekEntryResult!5422 0))(
  ( (MissingZero!5422 (index!23915 (_ BitVec 32))) (Found!5422 (index!23916 (_ BitVec 32))) (Intermediate!5422 (undefined!6234 Bool) (index!23917 (_ BitVec 32)) (x!52816 (_ BitVec 32))) (Undefined!5422) (MissingVacant!5422 (index!23918 (_ BitVec 32))) )
))
(declare-fun lt!256833 () SeekEntryResult!5422)

(get-info :version)

(assert (=> b!562874 (= res!354176 (or (undefined!6234 lt!256833) (not ((_ is Intermediate!5422) lt!256833))))))

(declare-fun lt!256837 () SeekEntryResult!5422)

(declare-fun lt!256830 () SeekEntryResult!5422)

(assert (=> b!562874 (= lt!256837 lt!256830)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562874 (= lt!256830 (Found!5422 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35350 0))(
  ( (array!35351 (arr!16976 (Array (_ BitVec 32) (_ BitVec 64))) (size!17341 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35350)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35350 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!562874 (= lt!256837 (seekEntryOrOpen!0 (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35350 (_ BitVec 32)) Bool)

(assert (=> b!562874 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17604 0))(
  ( (Unit!17605) )
))
(declare-fun lt!256836 () Unit!17604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17604)

(assert (=> b!562874 (= lt!256836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562875 () Bool)

(declare-fun res!354172 () Bool)

(declare-fun e!324375 () Bool)

(assert (=> b!562875 (=> (not res!354172) (not e!324375))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562875 (= res!354172 (and (= (size!17341 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17341 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17341 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562876 () Bool)

(declare-fun e!324378 () Bool)

(assert (=> b!562876 (= e!324372 e!324378)))

(declare-fun res!354170 () Bool)

(assert (=> b!562876 (=> res!354170 e!324378)))

(declare-fun lt!256831 () (_ BitVec 64))

(assert (=> b!562876 (= res!354170 (or (= lt!256831 (select (arr!16976 a!3118) j!142)) (= lt!256831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562876 (= lt!256831 (select (arr!16976 a!3118) (index!23917 lt!256833)))))

(declare-fun res!354169 () Bool)

(assert (=> start!51476 (=> (not res!354169) (not e!324375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51476 (= res!354169 (validMask!0 mask!3119))))

(assert (=> start!51476 e!324375))

(assert (=> start!51476 true))

(declare-fun array_inv!12859 (array!35350) Bool)

(assert (=> start!51476 (array_inv!12859 a!3118)))

(declare-fun b!562877 () Bool)

(declare-fun e!324377 () Bool)

(assert (=> b!562877 (= e!324375 e!324377)))

(declare-fun res!354179 () Bool)

(assert (=> b!562877 (=> (not res!354179) (not e!324377))))

(declare-fun lt!256832 () SeekEntryResult!5422)

(assert (=> b!562877 (= res!354179 (or (= lt!256832 (MissingZero!5422 i!1132)) (= lt!256832 (MissingVacant!5422 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!562877 (= lt!256832 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562878 () Bool)

(declare-fun res!354168 () Bool)

(assert (=> b!562878 (=> (not res!354168) (not e!324377))))

(declare-datatypes ((List!11095 0))(
  ( (Nil!11092) (Cons!11091 (h!12094 (_ BitVec 64)) (t!17314 List!11095)) )
))
(declare-fun arrayNoDuplicates!0 (array!35350 (_ BitVec 32) List!11095) Bool)

(assert (=> b!562878 (= res!354168 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11092))))

(declare-fun b!562879 () Bool)

(declare-fun res!354171 () Bool)

(assert (=> b!562879 (=> (not res!354171) (not e!324375))))

(assert (=> b!562879 (= res!354171 (validKeyInArray!0 (select (arr!16976 a!3118) j!142)))))

(declare-fun b!562880 () Bool)

(declare-fun e!324376 () Bool)

(assert (=> b!562880 (= e!324378 e!324376)))

(declare-fun res!354177 () Bool)

(assert (=> b!562880 (=> res!354177 e!324376)))

(declare-fun lt!256824 () SeekEntryResult!5422)

(assert (=> b!562880 (= res!354177 (or (bvslt (index!23917 lt!256833) #b00000000000000000000000000000000) (bvsge (index!23917 lt!256833) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52816 lt!256833) #b01111111111111111111111111111110) (bvslt (x!52816 lt!256833) #b00000000000000000000000000000000) (not (= lt!256831 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16976 a!3118) i!1132 k0!1914) (index!23917 lt!256833)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256824 lt!256830))))))

(declare-fun lt!256825 () SeekEntryResult!5422)

(declare-fun lt!256827 () SeekEntryResult!5422)

(assert (=> b!562880 (= lt!256825 lt!256827)))

(declare-fun lt!256835 () array!35350)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35350 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!562880 (= lt!256827 (seekKeyOrZeroReturnVacant!0 (x!52816 lt!256833) (index!23917 lt!256833) (index!23917 lt!256833) lt!256826 lt!256835 mask!3119))))

(assert (=> b!562880 (= lt!256825 (seekEntryOrOpen!0 lt!256826 lt!256835 mask!3119))))

(assert (=> b!562880 (= lt!256837 lt!256824)))

(assert (=> b!562880 (= lt!256824 (seekKeyOrZeroReturnVacant!0 (x!52816 lt!256833) (index!23917 lt!256833) (index!23917 lt!256833) (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562881 () Bool)

(assert (=> b!562881 (= e!324377 e!324371)))

(declare-fun res!354167 () Bool)

(assert (=> b!562881 (=> (not res!354167) (not e!324371))))

(declare-fun lt!256834 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35350 (_ BitVec 32)) SeekEntryResult!5422)

(assert (=> b!562881 (= res!354167 (= lt!256833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256834 lt!256826 lt!256835 mask!3119)))))

(declare-fun lt!256828 () (_ BitVec 32))

(assert (=> b!562881 (= lt!256833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256828 (select (arr!16976 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562881 (= lt!256834 (toIndex!0 lt!256826 mask!3119))))

(assert (=> b!562881 (= lt!256826 (select (store (arr!16976 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562881 (= lt!256828 (toIndex!0 (select (arr!16976 a!3118) j!142) mask!3119))))

(assert (=> b!562881 (= lt!256835 (array!35351 (store (arr!16976 a!3118) i!1132 k0!1914) (size!17341 a!3118)))))

(declare-fun b!562882 () Bool)

(declare-fun res!354174 () Bool)

(assert (=> b!562882 (=> (not res!354174) (not e!324375))))

(declare-fun arrayContainsKey!0 (array!35350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562882 (= res!354174 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562883 () Bool)

(declare-fun res!354178 () Bool)

(assert (=> b!562883 (=> (not res!354178) (not e!324377))))

(assert (=> b!562883 (= res!354178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562884 () Bool)

(declare-fun res!354173 () Bool)

(assert (=> b!562884 (=> (not res!354173) (not e!324375))))

(assert (=> b!562884 (= res!354173 (validKeyInArray!0 k0!1914))))

(declare-fun b!562885 () Bool)

(assert (=> b!562885 (= e!324376 e!324373)))

(declare-fun res!354175 () Bool)

(assert (=> b!562885 (=> res!354175 e!324373)))

(assert (=> b!562885 (= res!354175 (bvslt mask!3119 #b00000000000000000000000000000000))))

(assert (=> b!562885 (= lt!256824 lt!256827)))

(declare-fun lt!256829 () Unit!17604)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35350 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17604)

(assert (=> b!562885 (= lt!256829 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52816 lt!256833) (index!23917 lt!256833) (index!23917 lt!256833) mask!3119))))

(assert (= (and start!51476 res!354169) b!562875))

(assert (= (and b!562875 res!354172) b!562879))

(assert (= (and b!562879 res!354171) b!562884))

(assert (= (and b!562884 res!354173) b!562882))

(assert (= (and b!562882 res!354174) b!562877))

(assert (= (and b!562877 res!354179) b!562883))

(assert (= (and b!562883 res!354178) b!562878))

(assert (= (and b!562878 res!354168) b!562881))

(assert (= (and b!562881 res!354167) b!562874))

(assert (= (and b!562874 (not res!354176)) b!562876))

(assert (= (and b!562876 (not res!354170)) b!562880))

(assert (= (and b!562880 (not res!354177)) b!562885))

(assert (= (and b!562885 (not res!354175)) b!562873))

(declare-fun m!540641 () Bool)

(assert (=> b!562882 m!540641))

(declare-fun m!540643 () Bool)

(assert (=> b!562873 m!540643))

(declare-fun m!540645 () Bool)

(assert (=> b!562881 m!540645))

(declare-fun m!540647 () Bool)

(assert (=> b!562881 m!540647))

(assert (=> b!562881 m!540645))

(declare-fun m!540649 () Bool)

(assert (=> b!562881 m!540649))

(declare-fun m!540651 () Bool)

(assert (=> b!562881 m!540651))

(declare-fun m!540653 () Bool)

(assert (=> b!562881 m!540653))

(assert (=> b!562881 m!540645))

(declare-fun m!540655 () Bool)

(assert (=> b!562881 m!540655))

(declare-fun m!540657 () Bool)

(assert (=> b!562881 m!540657))

(assert (=> b!562879 m!540645))

(assert (=> b!562879 m!540645))

(declare-fun m!540659 () Bool)

(assert (=> b!562879 m!540659))

(declare-fun m!540661 () Bool)

(assert (=> start!51476 m!540661))

(declare-fun m!540663 () Bool)

(assert (=> start!51476 m!540663))

(declare-fun m!540665 () Bool)

(assert (=> b!562883 m!540665))

(declare-fun m!540667 () Bool)

(assert (=> b!562877 m!540667))

(declare-fun m!540669 () Bool)

(assert (=> b!562885 m!540669))

(declare-fun m!540671 () Bool)

(assert (=> b!562878 m!540671))

(assert (=> b!562876 m!540645))

(declare-fun m!540673 () Bool)

(assert (=> b!562876 m!540673))

(assert (=> b!562874 m!540645))

(assert (=> b!562874 m!540645))

(declare-fun m!540675 () Bool)

(assert (=> b!562874 m!540675))

(declare-fun m!540677 () Bool)

(assert (=> b!562874 m!540677))

(declare-fun m!540679 () Bool)

(assert (=> b!562874 m!540679))

(declare-fun m!540681 () Bool)

(assert (=> b!562884 m!540681))

(assert (=> b!562880 m!540645))

(declare-fun m!540683 () Bool)

(assert (=> b!562880 m!540683))

(assert (=> b!562880 m!540645))

(declare-fun m!540685 () Bool)

(assert (=> b!562880 m!540685))

(declare-fun m!540687 () Bool)

(assert (=> b!562880 m!540687))

(declare-fun m!540689 () Bool)

(assert (=> b!562880 m!540689))

(assert (=> b!562880 m!540653))

(check-sat (not b!562880) (not b!562878) (not b!562873) (not b!562883) (not b!562882) (not start!51476) (not b!562885) (not b!562877) (not b!562874) (not b!562881) (not b!562884) (not b!562879))
(check-sat)
