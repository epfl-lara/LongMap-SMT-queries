; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51364 () Bool)

(assert start!51364)

(declare-fun b!560789 () Bool)

(declare-fun e!323126 () Bool)

(declare-fun e!323122 () Bool)

(assert (=> b!560789 (= e!323126 e!323122)))

(declare-fun res!351947 () Bool)

(assert (=> b!560789 (=> res!351947 e!323122)))

(declare-datatypes ((SeekEntryResult!5364 0))(
  ( (MissingZero!5364 (index!23683 (_ BitVec 32))) (Found!5364 (index!23684 (_ BitVec 32))) (Intermediate!5364 (undefined!6176 Bool) (index!23685 (_ BitVec 32)) (x!52595 (_ BitVec 32))) (Undefined!5364) (MissingVacant!5364 (index!23686 (_ BitVec 32))) )
))
(declare-fun lt!255062 () SeekEntryResult!5364)

(get-info :version)

(assert (=> b!560789 (= res!351947 (or (undefined!6176 lt!255062) (not ((_ is Intermediate!5364) lt!255062))))))

(declare-fun b!560790 () Bool)

(declare-fun res!351942 () Bool)

(declare-fun e!323123 () Bool)

(assert (=> b!560790 (=> (not res!351942) (not e!323123))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35229 0))(
  ( (array!35230 (arr!16915 (Array (_ BitVec 32) (_ BitVec 64))) (size!17279 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35229)

(assert (=> b!560790 (= res!351942 (and (= (size!17279 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17279 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17279 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560791 () Bool)

(declare-fun e!323125 () Bool)

(assert (=> b!560791 (= e!323122 e!323125)))

(declare-fun res!351952 () Bool)

(assert (=> b!560791 (=> res!351952 e!323125)))

(declare-fun lt!255064 () (_ BitVec 64))

(assert (=> b!560791 (= res!351952 (or (= lt!255064 (select (arr!16915 a!3118) j!142)) (= lt!255064 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560791 (= lt!255064 (select (arr!16915 a!3118) (index!23685 lt!255062)))))

(declare-fun b!560792 () Bool)

(declare-fun e!323124 () Bool)

(declare-fun e!323120 () Bool)

(assert (=> b!560792 (= e!323124 e!323120)))

(declare-fun res!351945 () Bool)

(assert (=> b!560792 (=> (not res!351945) (not e!323120))))

(declare-fun lt!255067 () array!35229)

(declare-fun lt!255061 () (_ BitVec 32))

(declare-fun lt!255065 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35229 (_ BitVec 32)) SeekEntryResult!5364)

(assert (=> b!560792 (= res!351945 (= lt!255062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255061 lt!255065 lt!255067 mask!3119)))))

(declare-fun lt!255066 () (_ BitVec 32))

(assert (=> b!560792 (= lt!255062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255066 (select (arr!16915 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560792 (= lt!255061 (toIndex!0 lt!255065 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!560792 (= lt!255065 (select (store (arr!16915 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560792 (= lt!255066 (toIndex!0 (select (arr!16915 a!3118) j!142) mask!3119))))

(assert (=> b!560792 (= lt!255067 (array!35230 (store (arr!16915 a!3118) i!1132 k0!1914) (size!17279 a!3118)))))

(declare-fun e!323121 () Bool)

(declare-fun b!560793 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35229 (_ BitVec 32)) SeekEntryResult!5364)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35229 (_ BitVec 32)) SeekEntryResult!5364)

(assert (=> b!560793 (= e!323121 (= (seekEntryOrOpen!0 lt!255065 lt!255067 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52595 lt!255062) (index!23685 lt!255062) (index!23685 lt!255062) lt!255065 lt!255067 mask!3119)))))

(declare-fun b!560794 () Bool)

(declare-fun res!351949 () Bool)

(assert (=> b!560794 (=> (not res!351949) (not e!323123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560794 (= res!351949 (validKeyInArray!0 (select (arr!16915 a!3118) j!142)))))

(declare-fun b!560795 () Bool)

(declare-fun res!351943 () Bool)

(assert (=> b!560795 (=> (not res!351943) (not e!323123))))

(assert (=> b!560795 (= res!351943 (validKeyInArray!0 k0!1914))))

(declare-fun res!351946 () Bool)

(assert (=> start!51364 (=> (not res!351946) (not e!323123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51364 (= res!351946 (validMask!0 mask!3119))))

(assert (=> start!51364 e!323123))

(assert (=> start!51364 true))

(declare-fun array_inv!12711 (array!35229) Bool)

(assert (=> start!51364 (array_inv!12711 a!3118)))

(declare-fun b!560796 () Bool)

(declare-fun res!351948 () Bool)

(assert (=> b!560796 (=> (not res!351948) (not e!323124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35229 (_ BitVec 32)) Bool)

(assert (=> b!560796 (= res!351948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560797 () Bool)

(assert (=> b!560797 (= e!323120 (not true))))

(assert (=> b!560797 e!323126))

(declare-fun res!351953 () Bool)

(assert (=> b!560797 (=> (not res!351953) (not e!323126))))

(declare-fun lt!255059 () SeekEntryResult!5364)

(assert (=> b!560797 (= res!351953 (= lt!255059 (Found!5364 j!142)))))

(assert (=> b!560797 (= lt!255059 (seekEntryOrOpen!0 (select (arr!16915 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560797 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17502 0))(
  ( (Unit!17503) )
))
(declare-fun lt!255060 () Unit!17502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17502)

(assert (=> b!560797 (= lt!255060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560798 () Bool)

(declare-fun res!351944 () Bool)

(assert (=> b!560798 (=> (not res!351944) (not e!323123))))

(declare-fun arrayContainsKey!0 (array!35229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560798 (= res!351944 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560799 () Bool)

(assert (=> b!560799 (= e!323125 e!323121)))

(declare-fun res!351950 () Bool)

(assert (=> b!560799 (=> (not res!351950) (not e!323121))))

(assert (=> b!560799 (= res!351950 (= lt!255059 (seekKeyOrZeroReturnVacant!0 (x!52595 lt!255062) (index!23685 lt!255062) (index!23685 lt!255062) (select (arr!16915 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560800 () Bool)

(assert (=> b!560800 (= e!323123 e!323124)))

(declare-fun res!351951 () Bool)

(assert (=> b!560800 (=> (not res!351951) (not e!323124))))

(declare-fun lt!255063 () SeekEntryResult!5364)

(assert (=> b!560800 (= res!351951 (or (= lt!255063 (MissingZero!5364 i!1132)) (= lt!255063 (MissingVacant!5364 i!1132))))))

(assert (=> b!560800 (= lt!255063 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560801 () Bool)

(declare-fun res!351941 () Bool)

(assert (=> b!560801 (=> (not res!351941) (not e!323124))))

(declare-datatypes ((List!10995 0))(
  ( (Nil!10992) (Cons!10991 (h!11994 (_ BitVec 64)) (t!17223 List!10995)) )
))
(declare-fun arrayNoDuplicates!0 (array!35229 (_ BitVec 32) List!10995) Bool)

(assert (=> b!560801 (= res!351941 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10992))))

(assert (= (and start!51364 res!351946) b!560790))

(assert (= (and b!560790 res!351942) b!560794))

(assert (= (and b!560794 res!351949) b!560795))

(assert (= (and b!560795 res!351943) b!560798))

(assert (= (and b!560798 res!351944) b!560800))

(assert (= (and b!560800 res!351951) b!560796))

(assert (= (and b!560796 res!351948) b!560801))

(assert (= (and b!560801 res!351941) b!560792))

(assert (= (and b!560792 res!351945) b!560797))

(assert (= (and b!560797 res!351953) b!560789))

(assert (= (and b!560789 (not res!351947)) b!560791))

(assert (= (and b!560791 (not res!351952)) b!560799))

(assert (= (and b!560799 res!351950) b!560793))

(declare-fun m!538601 () Bool)

(assert (=> b!560791 m!538601))

(declare-fun m!538603 () Bool)

(assert (=> b!560791 m!538603))

(assert (=> b!560792 m!538601))

(declare-fun m!538605 () Bool)

(assert (=> b!560792 m!538605))

(assert (=> b!560792 m!538601))

(declare-fun m!538607 () Bool)

(assert (=> b!560792 m!538607))

(assert (=> b!560792 m!538601))

(declare-fun m!538609 () Bool)

(assert (=> b!560792 m!538609))

(declare-fun m!538611 () Bool)

(assert (=> b!560792 m!538611))

(declare-fun m!538613 () Bool)

(assert (=> b!560792 m!538613))

(declare-fun m!538615 () Bool)

(assert (=> b!560792 m!538615))

(declare-fun m!538617 () Bool)

(assert (=> b!560796 m!538617))

(assert (=> b!560799 m!538601))

(assert (=> b!560799 m!538601))

(declare-fun m!538619 () Bool)

(assert (=> b!560799 m!538619))

(declare-fun m!538621 () Bool)

(assert (=> b!560801 m!538621))

(assert (=> b!560794 m!538601))

(assert (=> b!560794 m!538601))

(declare-fun m!538623 () Bool)

(assert (=> b!560794 m!538623))

(declare-fun m!538625 () Bool)

(assert (=> start!51364 m!538625))

(declare-fun m!538627 () Bool)

(assert (=> start!51364 m!538627))

(assert (=> b!560797 m!538601))

(assert (=> b!560797 m!538601))

(declare-fun m!538629 () Bool)

(assert (=> b!560797 m!538629))

(declare-fun m!538631 () Bool)

(assert (=> b!560797 m!538631))

(declare-fun m!538633 () Bool)

(assert (=> b!560797 m!538633))

(declare-fun m!538635 () Bool)

(assert (=> b!560800 m!538635))

(declare-fun m!538637 () Bool)

(assert (=> b!560793 m!538637))

(declare-fun m!538639 () Bool)

(assert (=> b!560793 m!538639))

(declare-fun m!538641 () Bool)

(assert (=> b!560798 m!538641))

(declare-fun m!538643 () Bool)

(assert (=> b!560795 m!538643))

(check-sat (not start!51364) (not b!560797) (not b!560793) (not b!560799) (not b!560798) (not b!560801) (not b!560796) (not b!560794) (not b!560792) (not b!560800) (not b!560795))
(check-sat)
