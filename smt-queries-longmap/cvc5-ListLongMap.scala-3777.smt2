; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51716 () Bool)

(assert start!51716)

(declare-fun b!565733 () Bool)

(declare-fun e!325679 () Bool)

(declare-fun e!325678 () Bool)

(assert (=> b!565733 (= e!325679 e!325678)))

(declare-fun res!356704 () Bool)

(assert (=> b!565733 (=> (not res!356704) (not e!325678))))

(declare-datatypes ((SeekEntryResult!5510 0))(
  ( (MissingZero!5510 (index!24267 (_ BitVec 32))) (Found!5510 (index!24268 (_ BitVec 32))) (Intermediate!5510 (undefined!6322 Bool) (index!24269 (_ BitVec 32)) (x!53139 (_ BitVec 32))) (Undefined!5510) (MissingVacant!5510 (index!24270 (_ BitVec 32))) )
))
(declare-fun lt!257946 () SeekEntryResult!5510)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565733 (= res!356704 (or (= lt!257946 (MissingZero!5510 i!1132)) (= lt!257946 (MissingVacant!5510 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35524 0))(
  ( (array!35525 (arr!17061 (Array (_ BitVec 32) (_ BitVec 64))) (size!17425 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35524)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35524 (_ BitVec 32)) SeekEntryResult!5510)

(assert (=> b!565733 (= lt!257946 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!356708 () Bool)

(assert (=> start!51716 (=> (not res!356708) (not e!325679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51716 (= res!356708 (validMask!0 mask!3119))))

(assert (=> start!51716 e!325679))

(assert (=> start!51716 true))

(declare-fun array_inv!12857 (array!35524) Bool)

(assert (=> start!51716 (array_inv!12857 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!325680 () Bool)

(declare-fun b!565734 () Bool)

(assert (=> b!565734 (= e!325680 (= (seekEntryOrOpen!0 (select (arr!17061 a!3118) j!142) a!3118 mask!3119) (Found!5510 j!142)))))

(declare-fun b!565735 () Bool)

(declare-fun res!356705 () Bool)

(assert (=> b!565735 (=> (not res!356705) (not e!325679))))

(declare-fun arrayContainsKey!0 (array!35524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565735 (= res!356705 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565736 () Bool)

(declare-fun res!356703 () Bool)

(assert (=> b!565736 (=> (not res!356703) (not e!325678))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35524 (_ BitVec 32)) SeekEntryResult!5510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565736 (= res!356703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17061 a!3118) j!142) mask!3119) (select (arr!17061 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17061 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17061 a!3118) i!1132 k!1914) j!142) (array!35525 (store (arr!17061 a!3118) i!1132 k!1914) (size!17425 a!3118)) mask!3119)))))

(declare-fun b!565737 () Bool)

(declare-fun res!356707 () Bool)

(assert (=> b!565737 (=> (not res!356707) (not e!325678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35524 (_ BitVec 32)) Bool)

(assert (=> b!565737 (= res!356707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565738 () Bool)

(declare-fun res!356709 () Bool)

(assert (=> b!565738 (=> (not res!356709) (not e!325679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565738 (= res!356709 (validKeyInArray!0 (select (arr!17061 a!3118) j!142)))))

(declare-fun b!565739 () Bool)

(declare-fun res!356710 () Bool)

(assert (=> b!565739 (=> (not res!356710) (not e!325679))))

(assert (=> b!565739 (= res!356710 (and (= (size!17425 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17425 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17425 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565740 () Bool)

(assert (=> b!565740 (= e!325678 (not true))))

(assert (=> b!565740 e!325680))

(declare-fun res!356702 () Bool)

(assert (=> b!565740 (=> (not res!356702) (not e!325680))))

(assert (=> b!565740 (= res!356702 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17722 0))(
  ( (Unit!17723) )
))
(declare-fun lt!257947 () Unit!17722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17722)

(assert (=> b!565740 (= lt!257947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565741 () Bool)

(declare-fun res!356706 () Bool)

(assert (=> b!565741 (=> (not res!356706) (not e!325679))))

(assert (=> b!565741 (= res!356706 (validKeyInArray!0 k!1914))))

(declare-fun b!565742 () Bool)

(declare-fun res!356711 () Bool)

(assert (=> b!565742 (=> (not res!356711) (not e!325678))))

(declare-datatypes ((List!11141 0))(
  ( (Nil!11138) (Cons!11137 (h!12143 (_ BitVec 64)) (t!17369 List!11141)) )
))
(declare-fun arrayNoDuplicates!0 (array!35524 (_ BitVec 32) List!11141) Bool)

(assert (=> b!565742 (= res!356711 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11138))))

(assert (= (and start!51716 res!356708) b!565739))

(assert (= (and b!565739 res!356710) b!565738))

(assert (= (and b!565738 res!356709) b!565741))

(assert (= (and b!565741 res!356706) b!565735))

(assert (= (and b!565735 res!356705) b!565733))

(assert (= (and b!565733 res!356704) b!565737))

(assert (= (and b!565737 res!356707) b!565742))

(assert (= (and b!565742 res!356711) b!565736))

(assert (= (and b!565736 res!356703) b!565740))

(assert (= (and b!565740 res!356702) b!565734))

(declare-fun m!544251 () Bool)

(assert (=> start!51716 m!544251))

(declare-fun m!544253 () Bool)

(assert (=> start!51716 m!544253))

(declare-fun m!544255 () Bool)

(assert (=> b!565737 m!544255))

(declare-fun m!544257 () Bool)

(assert (=> b!565733 m!544257))

(declare-fun m!544259 () Bool)

(assert (=> b!565738 m!544259))

(assert (=> b!565738 m!544259))

(declare-fun m!544261 () Bool)

(assert (=> b!565738 m!544261))

(assert (=> b!565736 m!544259))

(declare-fun m!544263 () Bool)

(assert (=> b!565736 m!544263))

(assert (=> b!565736 m!544259))

(declare-fun m!544265 () Bool)

(assert (=> b!565736 m!544265))

(declare-fun m!544267 () Bool)

(assert (=> b!565736 m!544267))

(assert (=> b!565736 m!544265))

(declare-fun m!544269 () Bool)

(assert (=> b!565736 m!544269))

(assert (=> b!565736 m!544263))

(assert (=> b!565736 m!544259))

(declare-fun m!544271 () Bool)

(assert (=> b!565736 m!544271))

(declare-fun m!544273 () Bool)

(assert (=> b!565736 m!544273))

(assert (=> b!565736 m!544265))

(assert (=> b!565736 m!544267))

(declare-fun m!544275 () Bool)

(assert (=> b!565735 m!544275))

(declare-fun m!544277 () Bool)

(assert (=> b!565742 m!544277))

(assert (=> b!565734 m!544259))

(assert (=> b!565734 m!544259))

(declare-fun m!544279 () Bool)

(assert (=> b!565734 m!544279))

(declare-fun m!544281 () Bool)

(assert (=> b!565741 m!544281))

(declare-fun m!544283 () Bool)

(assert (=> b!565740 m!544283))

(declare-fun m!544285 () Bool)

(assert (=> b!565740 m!544285))

(push 1)

