; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51528 () Bool)

(assert start!51528)

(declare-fun b!563765 () Bool)

(declare-fun e!324830 () Bool)

(declare-fun e!324832 () Bool)

(assert (=> b!563765 (= e!324830 e!324832)))

(declare-fun res!354920 () Bool)

(assert (=> b!563765 (=> (not res!354920) (not e!324832))))

(declare-datatypes ((SeekEntryResult!5446 0))(
  ( (MissingZero!5446 (index!24011 (_ BitVec 32))) (Found!5446 (index!24012 (_ BitVec 32))) (Intermediate!5446 (undefined!6258 Bool) (index!24013 (_ BitVec 32)) (x!52893 (_ BitVec 32))) (Undefined!5446) (MissingVacant!5446 (index!24014 (_ BitVec 32))) )
))
(declare-fun lt!257333 () SeekEntryResult!5446)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563765 (= res!354920 (or (= lt!257333 (MissingZero!5446 i!1132)) (= lt!257333 (MissingVacant!5446 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35393 0))(
  ( (array!35394 (arr!16997 (Array (_ BitVec 32) (_ BitVec 64))) (size!17361 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35393)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35393 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!563765 (= lt!257333 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563766 () Bool)

(declare-fun res!354917 () Bool)

(assert (=> b!563766 (=> (not res!354917) (not e!324830))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563766 (= res!354917 (and (= (size!17361 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17361 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17361 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563767 () Bool)

(declare-fun res!354926 () Bool)

(assert (=> b!563767 (=> (not res!354926) (not e!324830))))

(declare-fun arrayContainsKey!0 (array!35393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563767 (= res!354926 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563768 () Bool)

(declare-fun e!324833 () Bool)

(assert (=> b!563768 (= e!324832 e!324833)))

(declare-fun res!354924 () Bool)

(assert (=> b!563768 (=> (not res!354924) (not e!324833))))

(declare-fun lt!257334 () SeekEntryResult!5446)

(declare-fun lt!257332 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35393 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!563768 (= res!354924 (= lt!257334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257332 (select (store (arr!16997 a!3118) i!1132 k!1914) j!142) (array!35394 (store (arr!16997 a!3118) i!1132 k!1914) (size!17361 a!3118)) mask!3119)))))

(declare-fun lt!257335 () (_ BitVec 32))

(assert (=> b!563768 (= lt!257334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257335 (select (arr!16997 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563768 (= lt!257332 (toIndex!0 (select (store (arr!16997 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!563768 (= lt!257335 (toIndex!0 (select (arr!16997 a!3118) j!142) mask!3119))))

(declare-fun b!563769 () Bool)

(declare-fun res!354923 () Bool)

(assert (=> b!563769 (=> (not res!354923) (not e!324832))))

(declare-datatypes ((List!11077 0))(
  ( (Nil!11074) (Cons!11073 (h!12076 (_ BitVec 64)) (t!17305 List!11077)) )
))
(declare-fun arrayNoDuplicates!0 (array!35393 (_ BitVec 32) List!11077) Bool)

(assert (=> b!563769 (= res!354923 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11074))))

(declare-fun b!563770 () Bool)

(declare-fun lt!257330 () Bool)

(assert (=> b!563770 (= e!324833 (not (or (and (not lt!257330) (undefined!6258 lt!257334)) (and (not lt!257330) (not (undefined!6258 lt!257334))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!563770 (= lt!257330 (not (is-Intermediate!5446 lt!257334)))))

(declare-fun e!324834 () Bool)

(assert (=> b!563770 e!324834))

(declare-fun res!354925 () Bool)

(assert (=> b!563770 (=> (not res!354925) (not e!324834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35393 (_ BitVec 32)) Bool)

(assert (=> b!563770 (= res!354925 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17666 0))(
  ( (Unit!17667) )
))
(declare-fun lt!257331 () Unit!17666)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35393 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17666)

(assert (=> b!563770 (= lt!257331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563771 () Bool)

(declare-fun res!354919 () Bool)

(assert (=> b!563771 (=> (not res!354919) (not e!324832))))

(assert (=> b!563771 (= res!354919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563772 () Bool)

(assert (=> b!563772 (= e!324834 (= (seekEntryOrOpen!0 (select (arr!16997 a!3118) j!142) a!3118 mask!3119) (Found!5446 j!142)))))

(declare-fun b!563773 () Bool)

(declare-fun res!354918 () Bool)

(assert (=> b!563773 (=> (not res!354918) (not e!324830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563773 (= res!354918 (validKeyInArray!0 (select (arr!16997 a!3118) j!142)))))

(declare-fun res!354921 () Bool)

(assert (=> start!51528 (=> (not res!354921) (not e!324830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51528 (= res!354921 (validMask!0 mask!3119))))

(assert (=> start!51528 e!324830))

(assert (=> start!51528 true))

(declare-fun array_inv!12793 (array!35393) Bool)

(assert (=> start!51528 (array_inv!12793 a!3118)))

(declare-fun b!563774 () Bool)

(declare-fun res!354922 () Bool)

(assert (=> b!563774 (=> (not res!354922) (not e!324830))))

(assert (=> b!563774 (= res!354922 (validKeyInArray!0 k!1914))))

(assert (= (and start!51528 res!354921) b!563766))

(assert (= (and b!563766 res!354917) b!563773))

(assert (= (and b!563773 res!354918) b!563774))

(assert (= (and b!563774 res!354922) b!563767))

(assert (= (and b!563767 res!354926) b!563765))

(assert (= (and b!563765 res!354920) b!563771))

(assert (= (and b!563771 res!354919) b!563769))

(assert (= (and b!563769 res!354923) b!563768))

(assert (= (and b!563768 res!354924) b!563770))

(assert (= (and b!563770 res!354925) b!563772))

(declare-fun m!542175 () Bool)

(assert (=> b!563770 m!542175))

(declare-fun m!542177 () Bool)

(assert (=> b!563770 m!542177))

(declare-fun m!542179 () Bool)

(assert (=> b!563773 m!542179))

(assert (=> b!563773 m!542179))

(declare-fun m!542181 () Bool)

(assert (=> b!563773 m!542181))

(declare-fun m!542183 () Bool)

(assert (=> start!51528 m!542183))

(declare-fun m!542185 () Bool)

(assert (=> start!51528 m!542185))

(declare-fun m!542187 () Bool)

(assert (=> b!563767 m!542187))

(declare-fun m!542189 () Bool)

(assert (=> b!563769 m!542189))

(declare-fun m!542191 () Bool)

(assert (=> b!563774 m!542191))

(assert (=> b!563768 m!542179))

(declare-fun m!542193 () Bool)

(assert (=> b!563768 m!542193))

(declare-fun m!542195 () Bool)

(assert (=> b!563768 m!542195))

(declare-fun m!542197 () Bool)

(assert (=> b!563768 m!542197))

(assert (=> b!563768 m!542179))

(assert (=> b!563768 m!542195))

(assert (=> b!563768 m!542195))

(declare-fun m!542199 () Bool)

(assert (=> b!563768 m!542199))

(assert (=> b!563768 m!542179))

(declare-fun m!542201 () Bool)

(assert (=> b!563768 m!542201))

(declare-fun m!542203 () Bool)

(assert (=> b!563768 m!542203))

(declare-fun m!542205 () Bool)

(assert (=> b!563765 m!542205))

(declare-fun m!542207 () Bool)

(assert (=> b!563771 m!542207))

(assert (=> b!563772 m!542179))

(assert (=> b!563772 m!542179))

(declare-fun m!542209 () Bool)

(assert (=> b!563772 m!542209))

(push 1)

