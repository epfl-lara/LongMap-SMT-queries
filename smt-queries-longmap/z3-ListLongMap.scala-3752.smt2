; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51552 () Bool)

(assert start!51552)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!324821 () Bool)

(declare-fun b!563635 () Bool)

(declare-datatypes ((array!35364 0))(
  ( (array!35365 (arr!16981 (Array (_ BitVec 32) (_ BitVec 64))) (size!17345 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35364)

(declare-datatypes ((SeekEntryResult!5386 0))(
  ( (MissingZero!5386 (index!23771 (_ BitVec 32))) (Found!5386 (index!23772 (_ BitVec 32))) (Intermediate!5386 (undefined!6198 Bool) (index!23773 (_ BitVec 32)) (x!52812 (_ BitVec 32))) (Undefined!5386) (MissingVacant!5386 (index!23774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35364 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!563635 (= e!324821 (= (seekEntryOrOpen!0 (select (arr!16981 a!3118) j!142) a!3118 mask!3119) (Found!5386 j!142)))))

(declare-fun b!563636 () Bool)

(declare-fun e!324819 () Bool)

(declare-fun e!324820 () Bool)

(assert (=> b!563636 (= e!324819 e!324820)))

(declare-fun res!354684 () Bool)

(assert (=> b!563636 (=> (not res!354684) (not e!324820))))

(declare-fun lt!257343 () SeekEntryResult!5386)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563636 (= res!354684 (or (= lt!257343 (MissingZero!5386 i!1132)) (= lt!257343 (MissingVacant!5386 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!563636 (= lt!257343 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563637 () Bool)

(declare-fun res!354689 () Bool)

(assert (=> b!563637 (=> (not res!354689) (not e!324820))))

(declare-datatypes ((List!10968 0))(
  ( (Nil!10965) (Cons!10964 (h!11970 (_ BitVec 64)) (t!17188 List!10968)) )
))
(declare-fun arrayNoDuplicates!0 (array!35364 (_ BitVec 32) List!10968) Bool)

(assert (=> b!563637 (= res!354689 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10965))))

(declare-fun b!563638 () Bool)

(declare-fun res!354686 () Bool)

(assert (=> b!563638 (=> (not res!354686) (not e!324820))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35364 (_ BitVec 32)) SeekEntryResult!5386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563638 (= res!354686 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16981 a!3118) j!142) mask!3119) (select (arr!16981 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16981 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16981 a!3118) i!1132 k0!1914) j!142) (array!35365 (store (arr!16981 a!3118) i!1132 k0!1914) (size!17345 a!3118)) mask!3119)))))

(declare-fun b!563639 () Bool)

(declare-fun res!354685 () Bool)

(assert (=> b!563639 (=> (not res!354685) (not e!324819))))

(assert (=> b!563639 (= res!354685 (and (= (size!17345 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17345 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17345 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!354690 () Bool)

(assert (=> start!51552 (=> (not res!354690) (not e!324819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51552 (= res!354690 (validMask!0 mask!3119))))

(assert (=> start!51552 e!324819))

(assert (=> start!51552 true))

(declare-fun array_inv!12840 (array!35364) Bool)

(assert (=> start!51552 (array_inv!12840 a!3118)))

(declare-fun b!563640 () Bool)

(declare-fun res!354682 () Bool)

(assert (=> b!563640 (=> (not res!354682) (not e!324819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563640 (= res!354682 (validKeyInArray!0 k0!1914))))

(declare-fun b!563641 () Bool)

(declare-fun res!354683 () Bool)

(assert (=> b!563641 (=> (not res!354683) (not e!324819))))

(assert (=> b!563641 (= res!354683 (validKeyInArray!0 (select (arr!16981 a!3118) j!142)))))

(declare-fun b!563642 () Bool)

(declare-fun res!354691 () Bool)

(assert (=> b!563642 (=> (not res!354691) (not e!324820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35364 (_ BitVec 32)) Bool)

(assert (=> b!563642 (= res!354691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563643 () Bool)

(declare-fun res!354688 () Bool)

(assert (=> b!563643 (=> (not res!354688) (not e!324819))))

(declare-fun arrayContainsKey!0 (array!35364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563643 (= res!354688 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563644 () Bool)

(assert (=> b!563644 (= e!324820 (not true))))

(assert (=> b!563644 e!324821))

(declare-fun res!354687 () Bool)

(assert (=> b!563644 (=> (not res!354687) (not e!324821))))

(assert (=> b!563644 (= res!354687 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17617 0))(
  ( (Unit!17618) )
))
(declare-fun lt!257344 () Unit!17617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17617)

(assert (=> b!563644 (= lt!257344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51552 res!354690) b!563639))

(assert (= (and b!563639 res!354685) b!563641))

(assert (= (and b!563641 res!354683) b!563640))

(assert (= (and b!563640 res!354682) b!563643))

(assert (= (and b!563643 res!354688) b!563636))

(assert (= (and b!563636 res!354684) b!563642))

(assert (= (and b!563642 res!354691) b!563637))

(assert (= (and b!563637 res!354689) b!563638))

(assert (= (and b!563638 res!354686) b!563644))

(assert (= (and b!563644 res!354687) b!563635))

(declare-fun m!542117 () Bool)

(assert (=> b!563638 m!542117))

(declare-fun m!542119 () Bool)

(assert (=> b!563638 m!542119))

(assert (=> b!563638 m!542117))

(declare-fun m!542121 () Bool)

(assert (=> b!563638 m!542121))

(declare-fun m!542123 () Bool)

(assert (=> b!563638 m!542123))

(assert (=> b!563638 m!542121))

(declare-fun m!542125 () Bool)

(assert (=> b!563638 m!542125))

(assert (=> b!563638 m!542119))

(assert (=> b!563638 m!542117))

(declare-fun m!542127 () Bool)

(assert (=> b!563638 m!542127))

(declare-fun m!542129 () Bool)

(assert (=> b!563638 m!542129))

(assert (=> b!563638 m!542121))

(assert (=> b!563638 m!542123))

(assert (=> b!563635 m!542117))

(assert (=> b!563635 m!542117))

(declare-fun m!542131 () Bool)

(assert (=> b!563635 m!542131))

(declare-fun m!542133 () Bool)

(assert (=> b!563640 m!542133))

(declare-fun m!542135 () Bool)

(assert (=> start!51552 m!542135))

(declare-fun m!542137 () Bool)

(assert (=> start!51552 m!542137))

(assert (=> b!563641 m!542117))

(assert (=> b!563641 m!542117))

(declare-fun m!542139 () Bool)

(assert (=> b!563641 m!542139))

(declare-fun m!542141 () Bool)

(assert (=> b!563637 m!542141))

(declare-fun m!542143 () Bool)

(assert (=> b!563643 m!542143))

(declare-fun m!542145 () Bool)

(assert (=> b!563644 m!542145))

(declare-fun m!542147 () Bool)

(assert (=> b!563644 m!542147))

(declare-fun m!542149 () Bool)

(assert (=> b!563642 m!542149))

(declare-fun m!542151 () Bool)

(assert (=> b!563636 m!542151))

(check-sat (not b!563635) (not b!563640) (not b!563643) (not b!563641) (not b!563637) (not b!563644) (not start!51552) (not b!563642) (not b!563638) (not b!563636))
(check-sat)
