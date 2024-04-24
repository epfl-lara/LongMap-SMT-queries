; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51390 () Bool)

(assert start!51390)

(declare-fun b!560599 () Bool)

(declare-fun e!323009 () Bool)

(declare-fun e!323014 () Bool)

(assert (=> b!560599 (= e!323009 e!323014)))

(declare-fun res!351654 () Bool)

(assert (=> b!560599 (=> (not res!351654) (not e!323014))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35202 0))(
  ( (array!35203 (arr!16900 (Array (_ BitVec 32) (_ BitVec 64))) (size!17264 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35202)

(declare-datatypes ((SeekEntryResult!5305 0))(
  ( (MissingZero!5305 (index!23447 (_ BitVec 32))) (Found!5305 (index!23448 (_ BitVec 32))) (Intermediate!5305 (undefined!6117 Bool) (index!23449 (_ BitVec 32)) (x!52515 (_ BitVec 32))) (Undefined!5305) (MissingVacant!5305 (index!23450 (_ BitVec 32))) )
))
(declare-fun lt!254900 () SeekEntryResult!5305)

(declare-fun lt!254906 () SeekEntryResult!5305)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35202 (_ BitVec 32)) SeekEntryResult!5305)

(assert (=> b!560599 (= res!351654 (= lt!254906 (seekKeyOrZeroReturnVacant!0 (x!52515 lt!254900) (index!23449 lt!254900) (index!23449 lt!254900) (select (arr!16900 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560600 () Bool)

(declare-fun res!351658 () Bool)

(declare-fun e!323016 () Bool)

(assert (=> b!560600 (=> (not res!351658) (not e!323016))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560600 (= res!351658 (validKeyInArray!0 k0!1914))))

(declare-fun lt!254904 () array!35202)

(declare-fun b!560601 () Bool)

(declare-fun lt!254902 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35202 (_ BitVec 32)) SeekEntryResult!5305)

(assert (=> b!560601 (= e!323014 (= (seekEntryOrOpen!0 lt!254902 lt!254904 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52515 lt!254900) (index!23449 lt!254900) (index!23449 lt!254900) lt!254902 lt!254904 mask!3119)))))

(declare-fun b!560602 () Bool)

(declare-fun res!351646 () Bool)

(assert (=> b!560602 (=> (not res!351646) (not e!323016))))

(declare-fun arrayContainsKey!0 (array!35202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560602 (= res!351646 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560603 () Bool)

(declare-fun res!351657 () Bool)

(declare-fun e!323011 () Bool)

(assert (=> b!560603 (=> (not res!351657) (not e!323011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35202 (_ BitVec 32)) Bool)

(assert (=> b!560603 (= res!351657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560604 () Bool)

(declare-fun res!351655 () Bool)

(assert (=> b!560604 (=> (not res!351655) (not e!323016))))

(assert (=> b!560604 (= res!351655 (validKeyInArray!0 (select (arr!16900 a!3118) j!142)))))

(declare-fun b!560605 () Bool)

(declare-fun e!323012 () Bool)

(assert (=> b!560605 (= e!323011 e!323012)))

(declare-fun res!351652 () Bool)

(assert (=> b!560605 (=> (not res!351652) (not e!323012))))

(declare-fun lt!254901 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35202 (_ BitVec 32)) SeekEntryResult!5305)

(assert (=> b!560605 (= res!351652 (= lt!254900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254901 lt!254902 lt!254904 mask!3119)))))

(declare-fun lt!254907 () (_ BitVec 32))

(assert (=> b!560605 (= lt!254900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254907 (select (arr!16900 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560605 (= lt!254901 (toIndex!0 lt!254902 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560605 (= lt!254902 (select (store (arr!16900 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560605 (= lt!254907 (toIndex!0 (select (arr!16900 a!3118) j!142) mask!3119))))

(assert (=> b!560605 (= lt!254904 (array!35203 (store (arr!16900 a!3118) i!1132 k0!1914) (size!17264 a!3118)))))

(declare-fun b!560606 () Bool)

(declare-fun e!323015 () Bool)

(declare-fun e!323013 () Bool)

(assert (=> b!560606 (= e!323015 e!323013)))

(declare-fun res!351650 () Bool)

(assert (=> b!560606 (=> res!351650 e!323013)))

(get-info :version)

(assert (=> b!560606 (= res!351650 (or (undefined!6117 lt!254900) (not ((_ is Intermediate!5305) lt!254900))))))

(declare-fun b!560607 () Bool)

(declare-fun res!351653 () Bool)

(assert (=> b!560607 (=> (not res!351653) (not e!323011))))

(declare-datatypes ((List!10887 0))(
  ( (Nil!10884) (Cons!10883 (h!11889 (_ BitVec 64)) (t!17107 List!10887)) )
))
(declare-fun arrayNoDuplicates!0 (array!35202 (_ BitVec 32) List!10887) Bool)

(assert (=> b!560607 (= res!351653 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10884))))

(declare-fun b!560609 () Bool)

(assert (=> b!560609 (= e!323012 (not true))))

(assert (=> b!560609 e!323015))

(declare-fun res!351656 () Bool)

(assert (=> b!560609 (=> (not res!351656) (not e!323015))))

(assert (=> b!560609 (= res!351656 (= lt!254906 (Found!5305 j!142)))))

(assert (=> b!560609 (= lt!254906 (seekEntryOrOpen!0 (select (arr!16900 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560609 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17455 0))(
  ( (Unit!17456) )
))
(declare-fun lt!254903 () Unit!17455)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17455)

(assert (=> b!560609 (= lt!254903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560610 () Bool)

(assert (=> b!560610 (= e!323013 e!323009)))

(declare-fun res!351651 () Bool)

(assert (=> b!560610 (=> res!351651 e!323009)))

(declare-fun lt!254905 () (_ BitVec 64))

(assert (=> b!560610 (= res!351651 (or (= lt!254905 (select (arr!16900 a!3118) j!142)) (= lt!254905 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560610 (= lt!254905 (select (arr!16900 a!3118) (index!23449 lt!254900)))))

(declare-fun b!560611 () Bool)

(declare-fun res!351647 () Bool)

(assert (=> b!560611 (=> (not res!351647) (not e!323016))))

(assert (=> b!560611 (= res!351647 (and (= (size!17264 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17264 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17264 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560608 () Bool)

(assert (=> b!560608 (= e!323016 e!323011)))

(declare-fun res!351648 () Bool)

(assert (=> b!560608 (=> (not res!351648) (not e!323011))))

(declare-fun lt!254908 () SeekEntryResult!5305)

(assert (=> b!560608 (= res!351648 (or (= lt!254908 (MissingZero!5305 i!1132)) (= lt!254908 (MissingVacant!5305 i!1132))))))

(assert (=> b!560608 (= lt!254908 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!351649 () Bool)

(assert (=> start!51390 (=> (not res!351649) (not e!323016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51390 (= res!351649 (validMask!0 mask!3119))))

(assert (=> start!51390 e!323016))

(assert (=> start!51390 true))

(declare-fun array_inv!12759 (array!35202) Bool)

(assert (=> start!51390 (array_inv!12759 a!3118)))

(assert (= (and start!51390 res!351649) b!560611))

(assert (= (and b!560611 res!351647) b!560604))

(assert (= (and b!560604 res!351655) b!560600))

(assert (= (and b!560600 res!351658) b!560602))

(assert (= (and b!560602 res!351646) b!560608))

(assert (= (and b!560608 res!351648) b!560603))

(assert (= (and b!560603 res!351657) b!560607))

(assert (= (and b!560607 res!351653) b!560605))

(assert (= (and b!560605 res!351652) b!560609))

(assert (= (and b!560609 res!351656) b!560606))

(assert (= (and b!560606 (not res!351650)) b!560610))

(assert (= (and b!560610 (not res!351651)) b!560599))

(assert (= (and b!560599 res!351654) b!560601))

(declare-fun m!538499 () Bool)

(assert (=> b!560601 m!538499))

(declare-fun m!538501 () Bool)

(assert (=> b!560601 m!538501))

(declare-fun m!538503 () Bool)

(assert (=> b!560608 m!538503))

(declare-fun m!538505 () Bool)

(assert (=> start!51390 m!538505))

(declare-fun m!538507 () Bool)

(assert (=> start!51390 m!538507))

(declare-fun m!538509 () Bool)

(assert (=> b!560602 m!538509))

(declare-fun m!538511 () Bool)

(assert (=> b!560603 m!538511))

(declare-fun m!538513 () Bool)

(assert (=> b!560607 m!538513))

(declare-fun m!538515 () Bool)

(assert (=> b!560609 m!538515))

(assert (=> b!560609 m!538515))

(declare-fun m!538517 () Bool)

(assert (=> b!560609 m!538517))

(declare-fun m!538519 () Bool)

(assert (=> b!560609 m!538519))

(declare-fun m!538521 () Bool)

(assert (=> b!560609 m!538521))

(assert (=> b!560605 m!538515))

(declare-fun m!538523 () Bool)

(assert (=> b!560605 m!538523))

(assert (=> b!560605 m!538515))

(declare-fun m!538525 () Bool)

(assert (=> b!560605 m!538525))

(declare-fun m!538527 () Bool)

(assert (=> b!560605 m!538527))

(declare-fun m!538529 () Bool)

(assert (=> b!560605 m!538529))

(declare-fun m!538531 () Bool)

(assert (=> b!560605 m!538531))

(assert (=> b!560605 m!538515))

(declare-fun m!538533 () Bool)

(assert (=> b!560605 m!538533))

(assert (=> b!560599 m!538515))

(assert (=> b!560599 m!538515))

(declare-fun m!538535 () Bool)

(assert (=> b!560599 m!538535))

(assert (=> b!560610 m!538515))

(declare-fun m!538537 () Bool)

(assert (=> b!560610 m!538537))

(declare-fun m!538539 () Bool)

(assert (=> b!560600 m!538539))

(assert (=> b!560604 m!538515))

(assert (=> b!560604 m!538515))

(declare-fun m!538541 () Bool)

(assert (=> b!560604 m!538541))

(check-sat (not b!560599) (not b!560601) (not b!560600) (not b!560602) (not b!560607) (not b!560608) (not start!51390) (not b!560609) (not b!560605) (not b!560603) (not b!560604))
(check-sat)
