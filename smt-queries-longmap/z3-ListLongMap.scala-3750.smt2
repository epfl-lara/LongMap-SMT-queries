; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51496 () Bool)

(assert start!51496)

(declare-fun e!324621 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35361 0))(
  ( (array!35362 (arr!16981 (Array (_ BitVec 32) (_ BitVec 64))) (size!17345 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35361)

(declare-fun b!563285 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5430 0))(
  ( (MissingZero!5430 (index!23947 (_ BitVec 32))) (Found!5430 (index!23948 (_ BitVec 32))) (Intermediate!5430 (undefined!6242 Bool) (index!23949 (_ BitVec 32)) (x!52837 (_ BitVec 32))) (Undefined!5430) (MissingVacant!5430 (index!23950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35361 (_ BitVec 32)) SeekEntryResult!5430)

(assert (=> b!563285 (= e!324621 (= (seekEntryOrOpen!0 (select (arr!16981 a!3118) j!142) a!3118 mask!3119) (Found!5430 j!142)))))

(declare-fun b!563286 () Bool)

(declare-fun res!354443 () Bool)

(declare-fun e!324624 () Bool)

(assert (=> b!563286 (=> (not res!354443) (not e!324624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563286 (= res!354443 (validKeyInArray!0 (select (arr!16981 a!3118) j!142)))))

(declare-fun b!563287 () Bool)

(declare-fun res!354440 () Bool)

(declare-fun e!324622 () Bool)

(assert (=> b!563287 (=> (not res!354440) (not e!324622))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35361 (_ BitVec 32)) SeekEntryResult!5430)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563287 (= res!354440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16981 a!3118) j!142) mask!3119) (select (arr!16981 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16981 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16981 a!3118) i!1132 k0!1914) j!142) (array!35362 (store (arr!16981 a!3118) i!1132 k0!1914) (size!17345 a!3118)) mask!3119)))))

(declare-fun b!563288 () Bool)

(declare-fun res!354438 () Bool)

(assert (=> b!563288 (=> (not res!354438) (not e!324622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35361 (_ BitVec 32)) Bool)

(assert (=> b!563288 (= res!354438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563289 () Bool)

(declare-fun res!354439 () Bool)

(assert (=> b!563289 (=> (not res!354439) (not e!324624))))

(assert (=> b!563289 (= res!354439 (and (= (size!17345 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17345 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17345 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563290 () Bool)

(declare-fun res!354444 () Bool)

(assert (=> b!563290 (=> (not res!354444) (not e!324624))))

(assert (=> b!563290 (= res!354444 (validKeyInArray!0 k0!1914))))

(declare-fun b!563291 () Bool)

(assert (=> b!563291 (= e!324624 e!324622)))

(declare-fun res!354442 () Bool)

(assert (=> b!563291 (=> (not res!354442) (not e!324622))))

(declare-fun lt!257166 () SeekEntryResult!5430)

(assert (=> b!563291 (= res!354442 (or (= lt!257166 (MissingZero!5430 i!1132)) (= lt!257166 (MissingVacant!5430 i!1132))))))

(assert (=> b!563291 (= lt!257166 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!354445 () Bool)

(assert (=> start!51496 (=> (not res!354445) (not e!324624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51496 (= res!354445 (validMask!0 mask!3119))))

(assert (=> start!51496 e!324624))

(assert (=> start!51496 true))

(declare-fun array_inv!12777 (array!35361) Bool)

(assert (=> start!51496 (array_inv!12777 a!3118)))

(declare-fun b!563292 () Bool)

(declare-fun res!354446 () Bool)

(assert (=> b!563292 (=> (not res!354446) (not e!324622))))

(declare-datatypes ((List!11061 0))(
  ( (Nil!11058) (Cons!11057 (h!12060 (_ BitVec 64)) (t!17289 List!11061)) )
))
(declare-fun arrayNoDuplicates!0 (array!35361 (_ BitVec 32) List!11061) Bool)

(assert (=> b!563292 (= res!354446 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11058))))

(declare-fun b!563293 () Bool)

(declare-fun res!354441 () Bool)

(assert (=> b!563293 (=> (not res!354441) (not e!324624))))

(declare-fun arrayContainsKey!0 (array!35361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563293 (= res!354441 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563294 () Bool)

(assert (=> b!563294 (= e!324622 (not true))))

(assert (=> b!563294 e!324621))

(declare-fun res!354437 () Bool)

(assert (=> b!563294 (=> (not res!354437) (not e!324621))))

(assert (=> b!563294 (= res!354437 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17634 0))(
  ( (Unit!17635) )
))
(declare-fun lt!257167 () Unit!17634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17634)

(assert (=> b!563294 (= lt!257167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51496 res!354445) b!563289))

(assert (= (and b!563289 res!354439) b!563286))

(assert (= (and b!563286 res!354443) b!563290))

(assert (= (and b!563290 res!354444) b!563293))

(assert (= (and b!563293 res!354441) b!563291))

(assert (= (and b!563291 res!354442) b!563288))

(assert (= (and b!563288 res!354438) b!563292))

(assert (= (and b!563292 res!354446) b!563287))

(assert (= (and b!563287 res!354440) b!563294))

(assert (= (and b!563294 res!354437) b!563285))

(declare-fun m!541599 () Bool)

(assert (=> b!563285 m!541599))

(assert (=> b!563285 m!541599))

(declare-fun m!541601 () Bool)

(assert (=> b!563285 m!541601))

(declare-fun m!541603 () Bool)

(assert (=> b!563288 m!541603))

(assert (=> b!563287 m!541599))

(declare-fun m!541605 () Bool)

(assert (=> b!563287 m!541605))

(assert (=> b!563287 m!541599))

(declare-fun m!541607 () Bool)

(assert (=> b!563287 m!541607))

(declare-fun m!541609 () Bool)

(assert (=> b!563287 m!541609))

(assert (=> b!563287 m!541607))

(declare-fun m!541611 () Bool)

(assert (=> b!563287 m!541611))

(assert (=> b!563287 m!541605))

(assert (=> b!563287 m!541599))

(declare-fun m!541613 () Bool)

(assert (=> b!563287 m!541613))

(declare-fun m!541615 () Bool)

(assert (=> b!563287 m!541615))

(assert (=> b!563287 m!541607))

(assert (=> b!563287 m!541609))

(declare-fun m!541617 () Bool)

(assert (=> b!563292 m!541617))

(declare-fun m!541619 () Bool)

(assert (=> start!51496 m!541619))

(declare-fun m!541621 () Bool)

(assert (=> start!51496 m!541621))

(assert (=> b!563286 m!541599))

(assert (=> b!563286 m!541599))

(declare-fun m!541623 () Bool)

(assert (=> b!563286 m!541623))

(declare-fun m!541625 () Bool)

(assert (=> b!563293 m!541625))

(declare-fun m!541627 () Bool)

(assert (=> b!563290 m!541627))

(declare-fun m!541629 () Bool)

(assert (=> b!563294 m!541629))

(declare-fun m!541631 () Bool)

(assert (=> b!563294 m!541631))

(declare-fun m!541633 () Bool)

(assert (=> b!563291 m!541633))

(check-sat (not b!563292) (not b!563287) (not b!563285) (not b!563286) (not b!563291) (not b!563290) (not start!51496) (not b!563288) (not b!563293) (not b!563294))
(check-sat)
