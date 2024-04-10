; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51352 () Bool)

(assert start!51352)

(declare-fun b!560555 () Bool)

(declare-fun e!322979 () Bool)

(assert (=> b!560555 (= e!322979 (not true))))

(declare-fun e!322980 () Bool)

(assert (=> b!560555 e!322980))

(declare-fun res!351713 () Bool)

(assert (=> b!560555 (=> (not res!351713) (not e!322980))))

(declare-datatypes ((SeekEntryResult!5358 0))(
  ( (MissingZero!5358 (index!23659 (_ BitVec 32))) (Found!5358 (index!23660 (_ BitVec 32))) (Intermediate!5358 (undefined!6170 Bool) (index!23661 (_ BitVec 32)) (x!52573 (_ BitVec 32))) (Undefined!5358) (MissingVacant!5358 (index!23662 (_ BitVec 32))) )
))
(declare-fun lt!254901 () SeekEntryResult!5358)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560555 (= res!351713 (= lt!254901 (Found!5358 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35217 0))(
  ( (array!35218 (arr!16909 (Array (_ BitVec 32) (_ BitVec 64))) (size!17273 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35217)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35217 (_ BitVec 32)) SeekEntryResult!5358)

(assert (=> b!560555 (= lt!254901 (seekEntryOrOpen!0 (select (arr!16909 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35217 (_ BitVec 32)) Bool)

(assert (=> b!560555 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17490 0))(
  ( (Unit!17491) )
))
(declare-fun lt!254900 () Unit!17490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17490)

(assert (=> b!560555 (= lt!254900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560556 () Bool)

(declare-fun res!351710 () Bool)

(declare-fun e!322978 () Bool)

(assert (=> b!560556 (=> (not res!351710) (not e!322978))))

(assert (=> b!560556 (= res!351710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!351708 () Bool)

(declare-fun e!322982 () Bool)

(assert (=> start!51352 (=> (not res!351708) (not e!322982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51352 (= res!351708 (validMask!0 mask!3119))))

(assert (=> start!51352 e!322982))

(assert (=> start!51352 true))

(declare-fun array_inv!12705 (array!35217) Bool)

(assert (=> start!51352 (array_inv!12705 a!3118)))

(declare-fun b!560557 () Bool)

(declare-fun res!351718 () Bool)

(assert (=> b!560557 (=> (not res!351718) (not e!322978))))

(declare-datatypes ((List!10989 0))(
  ( (Nil!10986) (Cons!10985 (h!11988 (_ BitVec 64)) (t!17217 List!10989)) )
))
(declare-fun arrayNoDuplicates!0 (array!35217 (_ BitVec 32) List!10989) Bool)

(assert (=> b!560557 (= res!351718 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10986))))

(declare-fun b!560558 () Bool)

(declare-fun res!351707 () Bool)

(assert (=> b!560558 (=> (not res!351707) (not e!322982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560558 (= res!351707 (validKeyInArray!0 (select (arr!16909 a!3118) j!142)))))

(declare-fun b!560559 () Bool)

(assert (=> b!560559 (= e!322978 e!322979)))

(declare-fun res!351711 () Bool)

(assert (=> b!560559 (=> (not res!351711) (not e!322979))))

(declare-fun lt!254905 () (_ BitVec 64))

(declare-fun lt!254898 () SeekEntryResult!5358)

(declare-fun lt!254902 () (_ BitVec 32))

(declare-fun lt!254897 () array!35217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35217 (_ BitVec 32)) SeekEntryResult!5358)

(assert (=> b!560559 (= res!351711 (= lt!254898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254902 lt!254905 lt!254897 mask!3119)))))

(declare-fun lt!254904 () (_ BitVec 32))

(assert (=> b!560559 (= lt!254898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254904 (select (arr!16909 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560559 (= lt!254902 (toIndex!0 lt!254905 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560559 (= lt!254905 (select (store (arr!16909 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560559 (= lt!254904 (toIndex!0 (select (arr!16909 a!3118) j!142) mask!3119))))

(assert (=> b!560559 (= lt!254897 (array!35218 (store (arr!16909 a!3118) i!1132 k0!1914) (size!17273 a!3118)))))

(declare-fun b!560560 () Bool)

(declare-fun res!351719 () Bool)

(assert (=> b!560560 (=> (not res!351719) (not e!322982))))

(declare-fun arrayContainsKey!0 (array!35217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560560 (= res!351719 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560561 () Bool)

(declare-fun e!322976 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35217 (_ BitVec 32)) SeekEntryResult!5358)

(assert (=> b!560561 (= e!322976 (= (seekEntryOrOpen!0 lt!254905 lt!254897 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52573 lt!254898) (index!23661 lt!254898) (index!23661 lt!254898) lt!254905 lt!254897 mask!3119)))))

(declare-fun b!560562 () Bool)

(declare-fun res!351712 () Bool)

(assert (=> b!560562 (=> (not res!351712) (not e!322982))))

(assert (=> b!560562 (= res!351712 (and (= (size!17273 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17273 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17273 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560563 () Bool)

(declare-fun res!351715 () Bool)

(assert (=> b!560563 (=> (not res!351715) (not e!322982))))

(assert (=> b!560563 (= res!351715 (validKeyInArray!0 k0!1914))))

(declare-fun b!560564 () Bool)

(declare-fun e!322977 () Bool)

(assert (=> b!560564 (= e!322980 e!322977)))

(declare-fun res!351716 () Bool)

(assert (=> b!560564 (=> res!351716 e!322977)))

(get-info :version)

(assert (=> b!560564 (= res!351716 (or (undefined!6170 lt!254898) (not ((_ is Intermediate!5358) lt!254898))))))

(declare-fun b!560565 () Bool)

(declare-fun e!322983 () Bool)

(assert (=> b!560565 (= e!322977 e!322983)))

(declare-fun res!351717 () Bool)

(assert (=> b!560565 (=> res!351717 e!322983)))

(declare-fun lt!254903 () (_ BitVec 64))

(assert (=> b!560565 (= res!351717 (or (= lt!254903 (select (arr!16909 a!3118) j!142)) (= lt!254903 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560565 (= lt!254903 (select (arr!16909 a!3118) (index!23661 lt!254898)))))

(declare-fun b!560566 () Bool)

(assert (=> b!560566 (= e!322982 e!322978)))

(declare-fun res!351714 () Bool)

(assert (=> b!560566 (=> (not res!351714) (not e!322978))))

(declare-fun lt!254899 () SeekEntryResult!5358)

(assert (=> b!560566 (= res!351714 (or (= lt!254899 (MissingZero!5358 i!1132)) (= lt!254899 (MissingVacant!5358 i!1132))))))

(assert (=> b!560566 (= lt!254899 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560567 () Bool)

(assert (=> b!560567 (= e!322983 e!322976)))

(declare-fun res!351709 () Bool)

(assert (=> b!560567 (=> (not res!351709) (not e!322976))))

(assert (=> b!560567 (= res!351709 (= lt!254901 (seekKeyOrZeroReturnVacant!0 (x!52573 lt!254898) (index!23661 lt!254898) (index!23661 lt!254898) (select (arr!16909 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51352 res!351708) b!560562))

(assert (= (and b!560562 res!351712) b!560558))

(assert (= (and b!560558 res!351707) b!560563))

(assert (= (and b!560563 res!351715) b!560560))

(assert (= (and b!560560 res!351719) b!560566))

(assert (= (and b!560566 res!351714) b!560556))

(assert (= (and b!560556 res!351710) b!560557))

(assert (= (and b!560557 res!351718) b!560559))

(assert (= (and b!560559 res!351711) b!560555))

(assert (= (and b!560555 res!351713) b!560564))

(assert (= (and b!560564 (not res!351716)) b!560565))

(assert (= (and b!560565 (not res!351717)) b!560567))

(assert (= (and b!560567 res!351709) b!560561))

(declare-fun m!538337 () Bool)

(assert (=> b!560559 m!538337))

(declare-fun m!538339 () Bool)

(assert (=> b!560559 m!538339))

(declare-fun m!538341 () Bool)

(assert (=> b!560559 m!538341))

(declare-fun m!538343 () Bool)

(assert (=> b!560559 m!538343))

(assert (=> b!560559 m!538339))

(declare-fun m!538345 () Bool)

(assert (=> b!560559 m!538345))

(assert (=> b!560559 m!538339))

(declare-fun m!538347 () Bool)

(assert (=> b!560559 m!538347))

(declare-fun m!538349 () Bool)

(assert (=> b!560559 m!538349))

(assert (=> b!560555 m!538339))

(assert (=> b!560555 m!538339))

(declare-fun m!538351 () Bool)

(assert (=> b!560555 m!538351))

(declare-fun m!538353 () Bool)

(assert (=> b!560555 m!538353))

(declare-fun m!538355 () Bool)

(assert (=> b!560555 m!538355))

(declare-fun m!538357 () Bool)

(assert (=> b!560566 m!538357))

(assert (=> b!560567 m!538339))

(assert (=> b!560567 m!538339))

(declare-fun m!538359 () Bool)

(assert (=> b!560567 m!538359))

(declare-fun m!538361 () Bool)

(assert (=> b!560560 m!538361))

(declare-fun m!538363 () Bool)

(assert (=> b!560556 m!538363))

(declare-fun m!538365 () Bool)

(assert (=> b!560561 m!538365))

(declare-fun m!538367 () Bool)

(assert (=> b!560561 m!538367))

(assert (=> b!560558 m!538339))

(assert (=> b!560558 m!538339))

(declare-fun m!538369 () Bool)

(assert (=> b!560558 m!538369))

(assert (=> b!560565 m!538339))

(declare-fun m!538371 () Bool)

(assert (=> b!560565 m!538371))

(declare-fun m!538373 () Bool)

(assert (=> b!560563 m!538373))

(declare-fun m!538375 () Bool)

(assert (=> b!560557 m!538375))

(declare-fun m!538377 () Bool)

(assert (=> start!51352 m!538377))

(declare-fun m!538379 () Bool)

(assert (=> start!51352 m!538379))

(check-sat (not b!560566) (not b!560560) (not b!560559) (not b!560567) (not start!51352) (not b!560556) (not b!560563) (not b!560558) (not b!560561) (not b!560557) (not b!560555))
(check-sat)
