; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50886 () Bool)

(assert start!50886)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!556579 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!320674 () Bool)

(declare-datatypes ((array!35058 0))(
  ( (array!35059 (arr!16837 (Array (_ BitVec 32) (_ BitVec 64))) (size!17201 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35058)

(declare-datatypes ((SeekEntryResult!5242 0))(
  ( (MissingZero!5242 (index!23195 (_ BitVec 32))) (Found!5242 (index!23196 (_ BitVec 32))) (Intermediate!5242 (undefined!6054 Bool) (index!23197 (_ BitVec 32)) (x!52239 (_ BitVec 32))) (Undefined!5242) (MissingVacant!5242 (index!23198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35058 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!556579 (= e!320674 (= (seekEntryOrOpen!0 (select (arr!16837 a!3118) j!142) a!3118 mask!3119) (Found!5242 j!142)))))

(declare-fun b!556580 () Bool)

(declare-fun res!348892 () Bool)

(declare-fun e!320673 () Bool)

(assert (=> b!556580 (=> (not res!348892) (not e!320673))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556580 (= res!348892 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556582 () Bool)

(declare-fun res!348889 () Bool)

(declare-fun e!320675 () Bool)

(assert (=> b!556582 (=> (not res!348889) (not e!320675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35058 (_ BitVec 32)) Bool)

(assert (=> b!556582 (= res!348889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556583 () Bool)

(declare-fun e!320672 () Bool)

(assert (=> b!556583 (= e!320675 e!320672)))

(declare-fun res!348895 () Bool)

(assert (=> b!556583 (=> (not res!348895) (not e!320672))))

(declare-fun lt!252969 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!252968 () SeekEntryResult!5242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35058 (_ BitVec 32)) SeekEntryResult!5242)

(assert (=> b!556583 (= res!348895 (= lt!252968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252969 (select (store (arr!16837 a!3118) i!1132 k0!1914) j!142) (array!35059 (store (arr!16837 a!3118) i!1132 k0!1914) (size!17201 a!3118)) mask!3119)))))

(declare-fun lt!252970 () (_ BitVec 32))

(assert (=> b!556583 (= lt!252968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252970 (select (arr!16837 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556583 (= lt!252969 (toIndex!0 (select (store (arr!16837 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556583 (= lt!252970 (toIndex!0 (select (arr!16837 a!3118) j!142) mask!3119))))

(declare-fun b!556584 () Bool)

(declare-fun res!348887 () Bool)

(assert (=> b!556584 (=> (not res!348887) (not e!320673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556584 (= res!348887 (validKeyInArray!0 k0!1914))))

(declare-fun b!556585 () Bool)

(declare-fun res!348890 () Bool)

(assert (=> b!556585 (=> (not res!348890) (not e!320675))))

(declare-datatypes ((List!10824 0))(
  ( (Nil!10821) (Cons!10820 (h!11808 (_ BitVec 64)) (t!17044 List!10824)) )
))
(declare-fun arrayNoDuplicates!0 (array!35058 (_ BitVec 32) List!10824) Bool)

(assert (=> b!556585 (= res!348890 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10821))))

(declare-fun b!556586 () Bool)

(get-info :version)

(assert (=> b!556586 (= e!320672 (not (or (not ((_ is Intermediate!5242) lt!252968)) (undefined!6054 lt!252968) (= (select (arr!16837 a!3118) (index!23197 lt!252968)) (select (arr!16837 a!3118) j!142)) (= (select (arr!16837 a!3118) (index!23197 lt!252968)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!556586 e!320674))

(declare-fun res!348894 () Bool)

(assert (=> b!556586 (=> (not res!348894) (not e!320674))))

(assert (=> b!556586 (= res!348894 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17329 0))(
  ( (Unit!17330) )
))
(declare-fun lt!252967 () Unit!17329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17329)

(assert (=> b!556586 (= lt!252967 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556581 () Bool)

(declare-fun res!348886 () Bool)

(assert (=> b!556581 (=> (not res!348886) (not e!320673))))

(assert (=> b!556581 (= res!348886 (and (= (size!17201 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17201 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17201 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348893 () Bool)

(assert (=> start!50886 (=> (not res!348893) (not e!320673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50886 (= res!348893 (validMask!0 mask!3119))))

(assert (=> start!50886 e!320673))

(assert (=> start!50886 true))

(declare-fun array_inv!12696 (array!35058) Bool)

(assert (=> start!50886 (array_inv!12696 a!3118)))

(declare-fun b!556587 () Bool)

(declare-fun res!348891 () Bool)

(assert (=> b!556587 (=> (not res!348891) (not e!320673))))

(assert (=> b!556587 (= res!348891 (validKeyInArray!0 (select (arr!16837 a!3118) j!142)))))

(declare-fun b!556588 () Bool)

(assert (=> b!556588 (= e!320673 e!320675)))

(declare-fun res!348888 () Bool)

(assert (=> b!556588 (=> (not res!348888) (not e!320675))))

(declare-fun lt!252966 () SeekEntryResult!5242)

(assert (=> b!556588 (= res!348888 (or (= lt!252966 (MissingZero!5242 i!1132)) (= lt!252966 (MissingVacant!5242 i!1132))))))

(assert (=> b!556588 (= lt!252966 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50886 res!348893) b!556581))

(assert (= (and b!556581 res!348886) b!556587))

(assert (= (and b!556587 res!348891) b!556584))

(assert (= (and b!556584 res!348887) b!556580))

(assert (= (and b!556580 res!348892) b!556588))

(assert (= (and b!556588 res!348888) b!556582))

(assert (= (and b!556582 res!348889) b!556585))

(assert (= (and b!556585 res!348890) b!556583))

(assert (= (and b!556583 res!348895) b!556586))

(assert (= (and b!556586 res!348894) b!556579))

(declare-fun m!534695 () Bool)

(assert (=> b!556586 m!534695))

(declare-fun m!534697 () Bool)

(assert (=> b!556586 m!534697))

(declare-fun m!534699 () Bool)

(assert (=> b!556586 m!534699))

(declare-fun m!534701 () Bool)

(assert (=> b!556586 m!534701))

(declare-fun m!534703 () Bool)

(assert (=> b!556582 m!534703))

(declare-fun m!534705 () Bool)

(assert (=> b!556588 m!534705))

(assert (=> b!556579 m!534697))

(assert (=> b!556579 m!534697))

(declare-fun m!534707 () Bool)

(assert (=> b!556579 m!534707))

(assert (=> b!556583 m!534697))

(declare-fun m!534709 () Bool)

(assert (=> b!556583 m!534709))

(assert (=> b!556583 m!534697))

(declare-fun m!534711 () Bool)

(assert (=> b!556583 m!534711))

(assert (=> b!556583 m!534697))

(declare-fun m!534713 () Bool)

(assert (=> b!556583 m!534713))

(assert (=> b!556583 m!534713))

(declare-fun m!534715 () Bool)

(assert (=> b!556583 m!534715))

(declare-fun m!534717 () Bool)

(assert (=> b!556583 m!534717))

(assert (=> b!556583 m!534713))

(declare-fun m!534719 () Bool)

(assert (=> b!556583 m!534719))

(declare-fun m!534721 () Bool)

(assert (=> b!556585 m!534721))

(declare-fun m!534723 () Bool)

(assert (=> b!556580 m!534723))

(declare-fun m!534725 () Bool)

(assert (=> start!50886 m!534725))

(declare-fun m!534727 () Bool)

(assert (=> start!50886 m!534727))

(assert (=> b!556587 m!534697))

(assert (=> b!556587 m!534697))

(declare-fun m!534729 () Bool)

(assert (=> b!556587 m!534729))

(declare-fun m!534731 () Bool)

(assert (=> b!556584 m!534731))

(check-sat (not b!556585) (not start!50886) (not b!556580) (not b!556584) (not b!556586) (not b!556579) (not b!556588) (not b!556582) (not b!556583) (not b!556587))
(check-sat)
