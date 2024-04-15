; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51494 () Bool)

(assert start!51494)

(declare-fun res!354463 () Bool)

(declare-fun e!324517 () Bool)

(assert (=> start!51494 (=> (not res!354463) (not e!324517))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51494 (= res!354463 (validMask!0 mask!3119))))

(assert (=> start!51494 e!324517))

(assert (=> start!51494 true))

(declare-datatypes ((array!35368 0))(
  ( (array!35369 (arr!16985 (Array (_ BitVec 32) (_ BitVec 64))) (size!17350 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35368)

(declare-fun array_inv!12868 (array!35368) Bool)

(assert (=> start!51494 (array_inv!12868 a!3118)))

(declare-fun b!563164 () Bool)

(declare-fun e!324518 () Bool)

(assert (=> b!563164 (= e!324517 e!324518)))

(declare-fun res!354467 () Bool)

(assert (=> b!563164 (=> (not res!354467) (not e!324518))))

(declare-datatypes ((SeekEntryResult!5431 0))(
  ( (MissingZero!5431 (index!23951 (_ BitVec 32))) (Found!5431 (index!23952 (_ BitVec 32))) (Intermediate!5431 (undefined!6243 Bool) (index!23953 (_ BitVec 32)) (x!52849 (_ BitVec 32))) (Undefined!5431) (MissingVacant!5431 (index!23954 (_ BitVec 32))) )
))
(declare-fun lt!256998 () SeekEntryResult!5431)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563164 (= res!354467 (or (= lt!256998 (MissingZero!5431 i!1132)) (= lt!256998 (MissingVacant!5431 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35368 (_ BitVec 32)) SeekEntryResult!5431)

(assert (=> b!563164 (= lt!256998 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!324519 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!563165 () Bool)

(assert (=> b!563165 (= e!324519 (= (seekEntryOrOpen!0 (select (arr!16985 a!3118) j!142) a!3118 mask!3119) (Found!5431 j!142)))))

(declare-fun b!563166 () Bool)

(declare-fun res!354459 () Bool)

(assert (=> b!563166 (=> (not res!354459) (not e!324517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563166 (= res!354459 (validKeyInArray!0 k0!1914))))

(declare-fun b!563167 () Bool)

(assert (=> b!563167 (= e!324518 (not true))))

(assert (=> b!563167 e!324519))

(declare-fun res!354460 () Bool)

(assert (=> b!563167 (=> (not res!354460) (not e!324519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35368 (_ BitVec 32)) Bool)

(assert (=> b!563167 (= res!354460 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17622 0))(
  ( (Unit!17623) )
))
(declare-fun lt!256999 () Unit!17622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17622)

(assert (=> b!563167 (= lt!256999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563168 () Bool)

(declare-fun res!354465 () Bool)

(assert (=> b!563168 (=> (not res!354465) (not e!324517))))

(declare-fun arrayContainsKey!0 (array!35368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563168 (= res!354465 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563169 () Bool)

(declare-fun res!354466 () Bool)

(assert (=> b!563169 (=> (not res!354466) (not e!324517))))

(assert (=> b!563169 (= res!354466 (validKeyInArray!0 (select (arr!16985 a!3118) j!142)))))

(declare-fun b!563170 () Bool)

(declare-fun res!354458 () Bool)

(assert (=> b!563170 (=> (not res!354458) (not e!324518))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35368 (_ BitVec 32)) SeekEntryResult!5431)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563170 (= res!354458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16985 a!3118) j!142) mask!3119) (select (arr!16985 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16985 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16985 a!3118) i!1132 k0!1914) j!142) (array!35369 (store (arr!16985 a!3118) i!1132 k0!1914) (size!17350 a!3118)) mask!3119)))))

(declare-fun b!563171 () Bool)

(declare-fun res!354461 () Bool)

(assert (=> b!563171 (=> (not res!354461) (not e!324517))))

(assert (=> b!563171 (= res!354461 (and (= (size!17350 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17350 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17350 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563172 () Bool)

(declare-fun res!354464 () Bool)

(assert (=> b!563172 (=> (not res!354464) (not e!324518))))

(assert (=> b!563172 (= res!354464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563173 () Bool)

(declare-fun res!354462 () Bool)

(assert (=> b!563173 (=> (not res!354462) (not e!324518))))

(declare-datatypes ((List!11104 0))(
  ( (Nil!11101) (Cons!11100 (h!12103 (_ BitVec 64)) (t!17323 List!11104)) )
))
(declare-fun arrayNoDuplicates!0 (array!35368 (_ BitVec 32) List!11104) Bool)

(assert (=> b!563173 (= res!354462 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11101))))

(assert (= (and start!51494 res!354463) b!563171))

(assert (= (and b!563171 res!354461) b!563169))

(assert (= (and b!563169 res!354466) b!563166))

(assert (= (and b!563166 res!354459) b!563168))

(assert (= (and b!563168 res!354465) b!563164))

(assert (= (and b!563164 res!354467) b!563172))

(assert (= (and b!563172 res!354464) b!563173))

(assert (= (and b!563173 res!354462) b!563170))

(assert (= (and b!563170 res!354458) b!563167))

(assert (= (and b!563167 res!354460) b!563165))

(declare-fun m!541007 () Bool)

(assert (=> b!563166 m!541007))

(declare-fun m!541009 () Bool)

(assert (=> b!563170 m!541009))

(declare-fun m!541011 () Bool)

(assert (=> b!563170 m!541011))

(assert (=> b!563170 m!541009))

(declare-fun m!541013 () Bool)

(assert (=> b!563170 m!541013))

(declare-fun m!541015 () Bool)

(assert (=> b!563170 m!541015))

(assert (=> b!563170 m!541013))

(declare-fun m!541017 () Bool)

(assert (=> b!563170 m!541017))

(assert (=> b!563170 m!541011))

(assert (=> b!563170 m!541009))

(declare-fun m!541019 () Bool)

(assert (=> b!563170 m!541019))

(declare-fun m!541021 () Bool)

(assert (=> b!563170 m!541021))

(assert (=> b!563170 m!541013))

(assert (=> b!563170 m!541015))

(declare-fun m!541023 () Bool)

(assert (=> b!563173 m!541023))

(assert (=> b!563169 m!541009))

(assert (=> b!563169 m!541009))

(declare-fun m!541025 () Bool)

(assert (=> b!563169 m!541025))

(declare-fun m!541027 () Bool)

(assert (=> b!563172 m!541027))

(declare-fun m!541029 () Bool)

(assert (=> b!563168 m!541029))

(assert (=> b!563165 m!541009))

(assert (=> b!563165 m!541009))

(declare-fun m!541031 () Bool)

(assert (=> b!563165 m!541031))

(declare-fun m!541033 () Bool)

(assert (=> b!563164 m!541033))

(declare-fun m!541035 () Bool)

(assert (=> start!51494 m!541035))

(declare-fun m!541037 () Bool)

(assert (=> start!51494 m!541037))

(declare-fun m!541039 () Bool)

(assert (=> b!563167 m!541039))

(declare-fun m!541041 () Bool)

(assert (=> b!563167 m!541041))

(check-sat (not b!563173) (not start!51494) (not b!563170) (not b!563172) (not b!563168) (not b!563165) (not b!563169) (not b!563167) (not b!563164) (not b!563166))
(check-sat)
