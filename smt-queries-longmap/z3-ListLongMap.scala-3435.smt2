; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47732 () Bool)

(assert start!47732)

(declare-fun b!525172 () Bool)

(declare-fun e!306227 () Bool)

(declare-fun e!306230 () Bool)

(assert (=> b!525172 (= e!306227 e!306230)))

(declare-fun res!321985 () Bool)

(assert (=> b!525172 (=> (not res!321985) (not e!306230))))

(declare-datatypes ((SeekEntryResult!4503 0))(
  ( (MissingZero!4503 (index!20224 (_ BitVec 32))) (Found!4503 (index!20225 (_ BitVec 32))) (Intermediate!4503 (undefined!5315 Bool) (index!20226 (_ BitVec 32)) (x!49204 (_ BitVec 32))) (Undefined!4503) (MissingVacant!4503 (index!20227 (_ BitVec 32))) )
))
(declare-fun lt!241204 () SeekEntryResult!4503)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525172 (= res!321985 (or (= lt!241204 (MissingZero!4503 i!1204)) (= lt!241204 (MissingVacant!4503 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!33369 0))(
  ( (array!33370 (arr!16036 (Array (_ BitVec 32) (_ BitVec 64))) (size!16400 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33369)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33369 (_ BitVec 32)) SeekEntryResult!4503)

(assert (=> b!525172 (= lt!241204 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!321986 () Bool)

(assert (=> start!47732 (=> (not res!321986) (not e!306227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47732 (= res!321986 (validMask!0 mask!3524))))

(assert (=> start!47732 e!306227))

(assert (=> start!47732 true))

(declare-fun array_inv!11832 (array!33369) Bool)

(assert (=> start!47732 (array_inv!11832 a!3235)))

(declare-fun b!525173 () Bool)

(declare-fun res!321975 () Bool)

(assert (=> b!525173 (=> (not res!321975) (not e!306227))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525173 (= res!321975 (validKeyInArray!0 (select (arr!16036 a!3235) j!176)))))

(declare-fun b!525174 () Bool)

(declare-fun res!321982 () Bool)

(assert (=> b!525174 (=> (not res!321982) (not e!306227))))

(assert (=> b!525174 (= res!321982 (validKeyInArray!0 k0!2280))))

(declare-fun e!306228 () Bool)

(declare-fun b!525175 () Bool)

(assert (=> b!525175 (= e!306228 (= (seekEntryOrOpen!0 (select (arr!16036 a!3235) j!176) a!3235 mask!3524) (Found!4503 j!176)))))

(declare-fun b!525176 () Bool)

(declare-fun e!306225 () Bool)

(assert (=> b!525176 (= e!306225 true)))

(declare-fun lt!241208 () SeekEntryResult!4503)

(assert (=> b!525176 (= (index!20226 lt!241208) i!1204)))

(declare-fun lt!241212 () (_ BitVec 32))

(declare-datatypes ((Unit!16464 0))(
  ( (Unit!16465) )
))
(declare-fun lt!241209 () Unit!16464)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16464)

(assert (=> b!525176 (= lt!241209 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241212 #b00000000000000000000000000000000 (index!20226 lt!241208) (x!49204 lt!241208) mask!3524))))

(assert (=> b!525176 (and (or (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241213 () Unit!16464)

(declare-fun e!306226 () Unit!16464)

(assert (=> b!525176 (= lt!241213 e!306226)))

(declare-fun c!61904 () Bool)

(assert (=> b!525176 (= c!61904 (= (select (arr!16036 a!3235) (index!20226 lt!241208)) (select (arr!16036 a!3235) j!176)))))

(assert (=> b!525176 (and (bvslt (x!49204 lt!241208) #b01111111111111111111111111111110) (or (= (select (arr!16036 a!3235) (index!20226 lt!241208)) (select (arr!16036 a!3235) j!176)) (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16036 a!3235) (index!20226 lt!241208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525177 () Bool)

(declare-fun Unit!16466 () Unit!16464)

(assert (=> b!525177 (= e!306226 Unit!16466)))

(declare-fun b!525178 () Bool)

(declare-fun res!321979 () Bool)

(assert (=> b!525178 (=> res!321979 e!306225)))

(get-info :version)

(assert (=> b!525178 (= res!321979 (or (undefined!5315 lt!241208) (not ((_ is Intermediate!4503) lt!241208))))))

(declare-fun b!525179 () Bool)

(declare-fun res!321976 () Bool)

(assert (=> b!525179 (=> (not res!321976) (not e!306227))))

(declare-fun arrayContainsKey!0 (array!33369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525179 (= res!321976 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525180 () Bool)

(declare-fun res!321980 () Bool)

(assert (=> b!525180 (=> (not res!321980) (not e!306230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33369 (_ BitVec 32)) Bool)

(assert (=> b!525180 (= res!321980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525181 () Bool)

(assert (=> b!525181 (= e!306230 (not e!306225))))

(declare-fun res!321977 () Bool)

(assert (=> b!525181 (=> res!321977 e!306225)))

(declare-fun lt!241206 () (_ BitVec 32))

(declare-fun lt!241207 () (_ BitVec 64))

(declare-fun lt!241211 () array!33369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33369 (_ BitVec 32)) SeekEntryResult!4503)

(assert (=> b!525181 (= res!321977 (= lt!241208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241206 lt!241207 lt!241211 mask!3524)))))

(assert (=> b!525181 (= lt!241208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241212 (select (arr!16036 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525181 (= lt!241206 (toIndex!0 lt!241207 mask!3524))))

(assert (=> b!525181 (= lt!241207 (select (store (arr!16036 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525181 (= lt!241212 (toIndex!0 (select (arr!16036 a!3235) j!176) mask!3524))))

(assert (=> b!525181 (= lt!241211 (array!33370 (store (arr!16036 a!3235) i!1204 k0!2280) (size!16400 a!3235)))))

(assert (=> b!525181 e!306228))

(declare-fun res!321984 () Bool)

(assert (=> b!525181 (=> (not res!321984) (not e!306228))))

(assert (=> b!525181 (= res!321984 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241205 () Unit!16464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16464)

(assert (=> b!525181 (= lt!241205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525182 () Bool)

(declare-fun Unit!16467 () Unit!16464)

(assert (=> b!525182 (= e!306226 Unit!16467)))

(declare-fun lt!241210 () Unit!16464)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16464)

(assert (=> b!525182 (= lt!241210 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241212 #b00000000000000000000000000000000 (index!20226 lt!241208) (x!49204 lt!241208) mask!3524))))

(declare-fun res!321981 () Bool)

(assert (=> b!525182 (= res!321981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241212 lt!241207 lt!241211 mask!3524) (Intermediate!4503 false (index!20226 lt!241208) (x!49204 lt!241208))))))

(declare-fun e!306229 () Bool)

(assert (=> b!525182 (=> (not res!321981) (not e!306229))))

(assert (=> b!525182 e!306229))

(declare-fun b!525183 () Bool)

(declare-fun res!321983 () Bool)

(assert (=> b!525183 (=> (not res!321983) (not e!306227))))

(assert (=> b!525183 (= res!321983 (and (= (size!16400 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16400 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16400 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525184 () Bool)

(assert (=> b!525184 (= e!306229 false)))

(declare-fun b!525185 () Bool)

(declare-fun res!321978 () Bool)

(assert (=> b!525185 (=> (not res!321978) (not e!306230))))

(declare-datatypes ((List!10194 0))(
  ( (Nil!10191) (Cons!10190 (h!11121 (_ BitVec 64)) (t!16422 List!10194)) )
))
(declare-fun arrayNoDuplicates!0 (array!33369 (_ BitVec 32) List!10194) Bool)

(assert (=> b!525185 (= res!321978 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10191))))

(assert (= (and start!47732 res!321986) b!525183))

(assert (= (and b!525183 res!321983) b!525173))

(assert (= (and b!525173 res!321975) b!525174))

(assert (= (and b!525174 res!321982) b!525179))

(assert (= (and b!525179 res!321976) b!525172))

(assert (= (and b!525172 res!321985) b!525180))

(assert (= (and b!525180 res!321980) b!525185))

(assert (= (and b!525185 res!321978) b!525181))

(assert (= (and b!525181 res!321984) b!525175))

(assert (= (and b!525181 (not res!321977)) b!525178))

(assert (= (and b!525178 (not res!321979)) b!525176))

(assert (= (and b!525176 c!61904) b!525182))

(assert (= (and b!525176 (not c!61904)) b!525177))

(assert (= (and b!525182 res!321981) b!525184))

(declare-fun m!505817 () Bool)

(assert (=> b!525182 m!505817))

(declare-fun m!505819 () Bool)

(assert (=> b!525182 m!505819))

(declare-fun m!505821 () Bool)

(assert (=> b!525176 m!505821))

(declare-fun m!505823 () Bool)

(assert (=> b!525176 m!505823))

(declare-fun m!505825 () Bool)

(assert (=> b!525176 m!505825))

(declare-fun m!505827 () Bool)

(assert (=> b!525185 m!505827))

(declare-fun m!505829 () Bool)

(assert (=> start!47732 m!505829))

(declare-fun m!505831 () Bool)

(assert (=> start!47732 m!505831))

(declare-fun m!505833 () Bool)

(assert (=> b!525181 m!505833))

(declare-fun m!505835 () Bool)

(assert (=> b!525181 m!505835))

(declare-fun m!505837 () Bool)

(assert (=> b!525181 m!505837))

(assert (=> b!525181 m!505825))

(declare-fun m!505839 () Bool)

(assert (=> b!525181 m!505839))

(declare-fun m!505841 () Bool)

(assert (=> b!525181 m!505841))

(assert (=> b!525181 m!505825))

(declare-fun m!505843 () Bool)

(assert (=> b!525181 m!505843))

(declare-fun m!505845 () Bool)

(assert (=> b!525181 m!505845))

(assert (=> b!525181 m!505825))

(declare-fun m!505847 () Bool)

(assert (=> b!525181 m!505847))

(assert (=> b!525173 m!505825))

(assert (=> b!525173 m!505825))

(declare-fun m!505849 () Bool)

(assert (=> b!525173 m!505849))

(assert (=> b!525175 m!505825))

(assert (=> b!525175 m!505825))

(declare-fun m!505851 () Bool)

(assert (=> b!525175 m!505851))

(declare-fun m!505853 () Bool)

(assert (=> b!525179 m!505853))

(declare-fun m!505855 () Bool)

(assert (=> b!525172 m!505855))

(declare-fun m!505857 () Bool)

(assert (=> b!525174 m!505857))

(declare-fun m!505859 () Bool)

(assert (=> b!525180 m!505859))

(check-sat (not start!47732) (not b!525172) (not b!525179) (not b!525175) (not b!525180) (not b!525181) (not b!525182) (not b!525174) (not b!525173) (not b!525185) (not b!525176))
(check-sat)
