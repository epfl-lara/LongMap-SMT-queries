; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51360 () Bool)

(assert start!51360)

(declare-fun res!351872 () Bool)

(declare-fun e!323074 () Bool)

(assert (=> start!51360 (=> (not res!351872) (not e!323074))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51360 (= res!351872 (validMask!0 mask!3119))))

(assert (=> start!51360 e!323074))

(assert (=> start!51360 true))

(declare-datatypes ((array!35225 0))(
  ( (array!35226 (arr!16913 (Array (_ BitVec 32) (_ BitVec 64))) (size!17277 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35225)

(declare-fun array_inv!12709 (array!35225) Bool)

(assert (=> start!51360 (array_inv!12709 a!3118)))

(declare-fun b!560711 () Bool)

(declare-fun e!323076 () Bool)

(declare-fun e!323075 () Bool)

(assert (=> b!560711 (= e!323076 e!323075)))

(declare-fun res!351863 () Bool)

(assert (=> b!560711 (=> (not res!351863) (not e!323075))))

(declare-datatypes ((SeekEntryResult!5362 0))(
  ( (MissingZero!5362 (index!23675 (_ BitVec 32))) (Found!5362 (index!23676 (_ BitVec 32))) (Intermediate!5362 (undefined!6174 Bool) (index!23677 (_ BitVec 32)) (x!52585 (_ BitVec 32))) (Undefined!5362) (MissingVacant!5362 (index!23678 (_ BitVec 32))) )
))
(declare-fun lt!255012 () SeekEntryResult!5362)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255009 () SeekEntryResult!5362)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35225 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560711 (= res!351863 (= lt!255012 (seekKeyOrZeroReturnVacant!0 (x!52585 lt!255009) (index!23677 lt!255009) (index!23677 lt!255009) (select (arr!16913 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun lt!255010 () array!35225)

(declare-fun b!560712 () Bool)

(declare-fun lt!255006 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35225 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560712 (= e!323075 (= (seekEntryOrOpen!0 lt!255006 lt!255010 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52585 lt!255009) (index!23677 lt!255009) (index!23677 lt!255009) lt!255006 lt!255010 mask!3119)))))

(declare-fun b!560713 () Bool)

(declare-fun res!351875 () Bool)

(assert (=> b!560713 (=> (not res!351875) (not e!323074))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560713 (= res!351875 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560714 () Bool)

(declare-fun res!351869 () Bool)

(assert (=> b!560714 (=> (not res!351869) (not e!323074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560714 (= res!351869 (validKeyInArray!0 k!1914))))

(declare-fun b!560715 () Bool)

(declare-fun res!351865 () Bool)

(assert (=> b!560715 (=> (not res!351865) (not e!323074))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560715 (= res!351865 (and (= (size!17277 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17277 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17277 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560716 () Bool)

(declare-fun e!323079 () Bool)

(assert (=> b!560716 (= e!323079 e!323076)))

(declare-fun res!351874 () Bool)

(assert (=> b!560716 (=> res!351874 e!323076)))

(declare-fun lt!255007 () (_ BitVec 64))

(assert (=> b!560716 (= res!351874 (or (= lt!255007 (select (arr!16913 a!3118) j!142)) (= lt!255007 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560716 (= lt!255007 (select (arr!16913 a!3118) (index!23677 lt!255009)))))

(declare-fun b!560717 () Bool)

(declare-fun e!323073 () Bool)

(assert (=> b!560717 (= e!323073 (not true))))

(declare-fun e!323072 () Bool)

(assert (=> b!560717 e!323072))

(declare-fun res!351868 () Bool)

(assert (=> b!560717 (=> (not res!351868) (not e!323072))))

(assert (=> b!560717 (= res!351868 (= lt!255012 (Found!5362 j!142)))))

(assert (=> b!560717 (= lt!255012 (seekEntryOrOpen!0 (select (arr!16913 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35225 (_ BitVec 32)) Bool)

(assert (=> b!560717 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17498 0))(
  ( (Unit!17499) )
))
(declare-fun lt!255008 () Unit!17498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17498)

(assert (=> b!560717 (= lt!255008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560718 () Bool)

(declare-fun e!323077 () Bool)

(assert (=> b!560718 (= e!323074 e!323077)))

(declare-fun res!351870 () Bool)

(assert (=> b!560718 (=> (not res!351870) (not e!323077))))

(declare-fun lt!255005 () SeekEntryResult!5362)

(assert (=> b!560718 (= res!351870 (or (= lt!255005 (MissingZero!5362 i!1132)) (= lt!255005 (MissingVacant!5362 i!1132))))))

(assert (=> b!560718 (= lt!255005 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560719 () Bool)

(declare-fun res!351873 () Bool)

(assert (=> b!560719 (=> (not res!351873) (not e!323077))))

(assert (=> b!560719 (= res!351873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560720 () Bool)

(declare-fun res!351864 () Bool)

(assert (=> b!560720 (=> (not res!351864) (not e!323077))))

(declare-datatypes ((List!10993 0))(
  ( (Nil!10990) (Cons!10989 (h!11992 (_ BitVec 64)) (t!17221 List!10993)) )
))
(declare-fun arrayNoDuplicates!0 (array!35225 (_ BitVec 32) List!10993) Bool)

(assert (=> b!560720 (= res!351864 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10990))))

(declare-fun b!560721 () Bool)

(assert (=> b!560721 (= e!323072 e!323079)))

(declare-fun res!351867 () Bool)

(assert (=> b!560721 (=> res!351867 e!323079)))

(assert (=> b!560721 (= res!351867 (or (undefined!6174 lt!255009) (not (is-Intermediate!5362 lt!255009))))))

(declare-fun b!560722 () Bool)

(assert (=> b!560722 (= e!323077 e!323073)))

(declare-fun res!351866 () Bool)

(assert (=> b!560722 (=> (not res!351866) (not e!323073))))

(declare-fun lt!255011 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35225 (_ BitVec 32)) SeekEntryResult!5362)

(assert (=> b!560722 (= res!351866 (= lt!255009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255011 lt!255006 lt!255010 mask!3119)))))

(declare-fun lt!255013 () (_ BitVec 32))

(assert (=> b!560722 (= lt!255009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255013 (select (arr!16913 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560722 (= lt!255011 (toIndex!0 lt!255006 mask!3119))))

(assert (=> b!560722 (= lt!255006 (select (store (arr!16913 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560722 (= lt!255013 (toIndex!0 (select (arr!16913 a!3118) j!142) mask!3119))))

(assert (=> b!560722 (= lt!255010 (array!35226 (store (arr!16913 a!3118) i!1132 k!1914) (size!17277 a!3118)))))

(declare-fun b!560723 () Bool)

(declare-fun res!351871 () Bool)

(assert (=> b!560723 (=> (not res!351871) (not e!323074))))

(assert (=> b!560723 (= res!351871 (validKeyInArray!0 (select (arr!16913 a!3118) j!142)))))

(assert (= (and start!51360 res!351872) b!560715))

(assert (= (and b!560715 res!351865) b!560723))

(assert (= (and b!560723 res!351871) b!560714))

(assert (= (and b!560714 res!351869) b!560713))

(assert (= (and b!560713 res!351875) b!560718))

(assert (= (and b!560718 res!351870) b!560719))

(assert (= (and b!560719 res!351873) b!560720))

(assert (= (and b!560720 res!351864) b!560722))

(assert (= (and b!560722 res!351866) b!560717))

(assert (= (and b!560717 res!351868) b!560721))

(assert (= (and b!560721 (not res!351867)) b!560716))

(assert (= (and b!560716 (not res!351874)) b!560711))

(assert (= (and b!560711 res!351863) b!560712))

(declare-fun m!538513 () Bool)

(assert (=> b!560713 m!538513))

(declare-fun m!538515 () Bool)

(assert (=> b!560723 m!538515))

(assert (=> b!560723 m!538515))

(declare-fun m!538517 () Bool)

(assert (=> b!560723 m!538517))

(declare-fun m!538519 () Bool)

(assert (=> b!560718 m!538519))

(declare-fun m!538521 () Bool)

(assert (=> b!560712 m!538521))

(declare-fun m!538523 () Bool)

(assert (=> b!560712 m!538523))

(declare-fun m!538525 () Bool)

(assert (=> b!560720 m!538525))

(assert (=> b!560711 m!538515))

(assert (=> b!560711 m!538515))

(declare-fun m!538527 () Bool)

(assert (=> b!560711 m!538527))

(assert (=> b!560717 m!538515))

(assert (=> b!560717 m!538515))

(declare-fun m!538529 () Bool)

(assert (=> b!560717 m!538529))

(declare-fun m!538531 () Bool)

(assert (=> b!560717 m!538531))

(declare-fun m!538533 () Bool)

(assert (=> b!560717 m!538533))

(assert (=> b!560716 m!538515))

(declare-fun m!538535 () Bool)

(assert (=> b!560716 m!538535))

(declare-fun m!538537 () Bool)

(assert (=> start!51360 m!538537))

(declare-fun m!538539 () Bool)

(assert (=> start!51360 m!538539))

(assert (=> b!560722 m!538515))

(declare-fun m!538541 () Bool)

(assert (=> b!560722 m!538541))

(assert (=> b!560722 m!538515))

(declare-fun m!538543 () Bool)

(assert (=> b!560722 m!538543))

(declare-fun m!538545 () Bool)

(assert (=> b!560722 m!538545))

(declare-fun m!538547 () Bool)

(assert (=> b!560722 m!538547))

(declare-fun m!538549 () Bool)

(assert (=> b!560722 m!538549))

(assert (=> b!560722 m!538515))

(declare-fun m!538551 () Bool)

(assert (=> b!560722 m!538551))

(declare-fun m!538553 () Bool)

(assert (=> b!560719 m!538553))

(declare-fun m!538555 () Bool)

(assert (=> b!560714 m!538555))

(push 1)

