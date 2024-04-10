; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51520 () Bool)

(assert start!51520)

(declare-fun b!563645 () Bool)

(declare-fun res!354803 () Bool)

(declare-fun e!324775 () Bool)

(assert (=> b!563645 (=> (not res!354803) (not e!324775))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35385 0))(
  ( (array!35386 (arr!16993 (Array (_ BitVec 32) (_ BitVec 64))) (size!17357 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35385)

(declare-datatypes ((SeekEntryResult!5442 0))(
  ( (MissingZero!5442 (index!23995 (_ BitVec 32))) (Found!5442 (index!23996 (_ BitVec 32))) (Intermediate!5442 (undefined!6254 Bool) (index!23997 (_ BitVec 32)) (x!52881 (_ BitVec 32))) (Undefined!5442) (MissingVacant!5442 (index!23998 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35385 (_ BitVec 32)) SeekEntryResult!5442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563645 (= res!354803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16993 a!3118) j!142) mask!3119) (select (arr!16993 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16993 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16993 a!3118) i!1132 k0!1914) j!142) (array!35386 (store (arr!16993 a!3118) i!1132 k0!1914) (size!17357 a!3118)) mask!3119)))))

(declare-fun b!563646 () Bool)

(declare-fun res!354800 () Bool)

(assert (=> b!563646 (=> (not res!354800) (not e!324775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35385 (_ BitVec 32)) Bool)

(assert (=> b!563646 (= res!354800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563647 () Bool)

(declare-fun res!354798 () Bool)

(assert (=> b!563647 (=> (not res!354798) (not e!324775))))

(declare-datatypes ((List!11073 0))(
  ( (Nil!11070) (Cons!11069 (h!12072 (_ BitVec 64)) (t!17301 List!11073)) )
))
(declare-fun arrayNoDuplicates!0 (array!35385 (_ BitVec 32) List!11073) Bool)

(assert (=> b!563647 (= res!354798 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11070))))

(declare-fun b!563648 () Bool)

(assert (=> b!563648 (= e!324775 (not true))))

(declare-fun e!324777 () Bool)

(assert (=> b!563648 e!324777))

(declare-fun res!354797 () Bool)

(assert (=> b!563648 (=> (not res!354797) (not e!324777))))

(assert (=> b!563648 (= res!354797 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17658 0))(
  ( (Unit!17659) )
))
(declare-fun lt!257274 () Unit!17658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17658)

(assert (=> b!563648 (= lt!257274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563649 () Bool)

(declare-fun res!354806 () Bool)

(declare-fun e!324776 () Bool)

(assert (=> b!563649 (=> (not res!354806) (not e!324776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563649 (= res!354806 (validKeyInArray!0 k0!1914))))

(declare-fun b!563650 () Bool)

(assert (=> b!563650 (= e!324776 e!324775)))

(declare-fun res!354801 () Bool)

(assert (=> b!563650 (=> (not res!354801) (not e!324775))))

(declare-fun lt!257275 () SeekEntryResult!5442)

(assert (=> b!563650 (= res!354801 (or (= lt!257275 (MissingZero!5442 i!1132)) (= lt!257275 (MissingVacant!5442 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35385 (_ BitVec 32)) SeekEntryResult!5442)

(assert (=> b!563650 (= lt!257275 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563651 () Bool)

(declare-fun res!354804 () Bool)

(assert (=> b!563651 (=> (not res!354804) (not e!324776))))

(declare-fun arrayContainsKey!0 (array!35385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563651 (= res!354804 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563652 () Bool)

(assert (=> b!563652 (= e!324777 (= (seekEntryOrOpen!0 (select (arr!16993 a!3118) j!142) a!3118 mask!3119) (Found!5442 j!142)))))

(declare-fun b!563653 () Bool)

(declare-fun res!354805 () Bool)

(assert (=> b!563653 (=> (not res!354805) (not e!324776))))

(assert (=> b!563653 (= res!354805 (validKeyInArray!0 (select (arr!16993 a!3118) j!142)))))

(declare-fun b!563654 () Bool)

(declare-fun res!354802 () Bool)

(assert (=> b!563654 (=> (not res!354802) (not e!324776))))

(assert (=> b!563654 (= res!354802 (and (= (size!17357 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17357 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17357 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!354799 () Bool)

(assert (=> start!51520 (=> (not res!354799) (not e!324776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51520 (= res!354799 (validMask!0 mask!3119))))

(assert (=> start!51520 e!324776))

(assert (=> start!51520 true))

(declare-fun array_inv!12789 (array!35385) Bool)

(assert (=> start!51520 (array_inv!12789 a!3118)))

(assert (= (and start!51520 res!354799) b!563654))

(assert (= (and b!563654 res!354802) b!563653))

(assert (= (and b!563653 res!354805) b!563649))

(assert (= (and b!563649 res!354806) b!563651))

(assert (= (and b!563651 res!354804) b!563650))

(assert (= (and b!563650 res!354801) b!563646))

(assert (= (and b!563646 res!354800) b!563647))

(assert (= (and b!563647 res!354798) b!563645))

(assert (= (and b!563645 res!354803) b!563648))

(assert (= (and b!563648 res!354797) b!563652))

(declare-fun m!542031 () Bool)

(assert (=> b!563647 m!542031))

(declare-fun m!542033 () Bool)

(assert (=> b!563651 m!542033))

(declare-fun m!542035 () Bool)

(assert (=> b!563652 m!542035))

(assert (=> b!563652 m!542035))

(declare-fun m!542037 () Bool)

(assert (=> b!563652 m!542037))

(declare-fun m!542039 () Bool)

(assert (=> b!563646 m!542039))

(declare-fun m!542041 () Bool)

(assert (=> start!51520 m!542041))

(declare-fun m!542043 () Bool)

(assert (=> start!51520 m!542043))

(assert (=> b!563653 m!542035))

(assert (=> b!563653 m!542035))

(declare-fun m!542045 () Bool)

(assert (=> b!563653 m!542045))

(declare-fun m!542047 () Bool)

(assert (=> b!563650 m!542047))

(declare-fun m!542049 () Bool)

(assert (=> b!563649 m!542049))

(declare-fun m!542051 () Bool)

(assert (=> b!563648 m!542051))

(declare-fun m!542053 () Bool)

(assert (=> b!563648 m!542053))

(assert (=> b!563645 m!542035))

(declare-fun m!542055 () Bool)

(assert (=> b!563645 m!542055))

(assert (=> b!563645 m!542035))

(declare-fun m!542057 () Bool)

(assert (=> b!563645 m!542057))

(declare-fun m!542059 () Bool)

(assert (=> b!563645 m!542059))

(assert (=> b!563645 m!542057))

(declare-fun m!542061 () Bool)

(assert (=> b!563645 m!542061))

(assert (=> b!563645 m!542055))

(assert (=> b!563645 m!542035))

(declare-fun m!542063 () Bool)

(assert (=> b!563645 m!542063))

(declare-fun m!542065 () Bool)

(assert (=> b!563645 m!542065))

(assert (=> b!563645 m!542057))

(assert (=> b!563645 m!542059))

(check-sat (not b!563645) (not b!563652) (not b!563648) (not b!563649) (not b!563646) (not b!563653) (not b!563650) (not start!51520) (not b!563651) (not b!563647))
(check-sat)
