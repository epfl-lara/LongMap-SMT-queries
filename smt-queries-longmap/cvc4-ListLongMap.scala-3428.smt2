; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47692 () Bool)

(assert start!47692)

(declare-fun e!305800 () Bool)

(declare-fun b!524323 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33329 0))(
  ( (array!33330 (arr!16016 (Array (_ BitVec 32) (_ BitVec 64))) (size!16380 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33329)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4483 0))(
  ( (MissingZero!4483 (index!20144 (_ BitVec 32))) (Found!4483 (index!20145 (_ BitVec 32))) (Intermediate!4483 (undefined!5295 Bool) (index!20146 (_ BitVec 32)) (x!49128 (_ BitVec 32))) (Undefined!4483) (MissingVacant!4483 (index!20147 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33329 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!524323 (= e!305800 (= (seekEntryOrOpen!0 (select (arr!16016 a!3235) j!176) a!3235 mask!3524) (Found!4483 j!176)))))

(declare-fun b!524324 () Bool)

(declare-fun res!321248 () Bool)

(declare-fun e!305796 () Bool)

(assert (=> b!524324 (=> (not res!321248) (not e!305796))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524324 (= res!321248 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524325 () Bool)

(declare-fun res!321250 () Bool)

(declare-fun e!305802 () Bool)

(assert (=> b!524325 (=> (not res!321250) (not e!305802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33329 (_ BitVec 32)) Bool)

(assert (=> b!524325 (= res!321250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524326 () Bool)

(assert (=> b!524326 (= e!305796 e!305802)))

(declare-fun res!321255 () Bool)

(assert (=> b!524326 (=> (not res!321255) (not e!305802))))

(declare-fun lt!240619 () SeekEntryResult!4483)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524326 (= res!321255 (or (= lt!240619 (MissingZero!4483 i!1204)) (= lt!240619 (MissingVacant!4483 i!1204))))))

(assert (=> b!524326 (= lt!240619 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!321254 () Bool)

(assert (=> start!47692 (=> (not res!321254) (not e!305796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47692 (= res!321254 (validMask!0 mask!3524))))

(assert (=> start!47692 e!305796))

(assert (=> start!47692 true))

(declare-fun array_inv!11812 (array!33329) Bool)

(assert (=> start!47692 (array_inv!11812 a!3235)))

(declare-fun b!524327 () Bool)

(declare-fun res!321246 () Bool)

(assert (=> b!524327 (=> (not res!321246) (not e!305796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524327 (= res!321246 (validKeyInArray!0 (select (arr!16016 a!3235) j!176)))))

(declare-fun b!524328 () Bool)

(declare-datatypes ((Unit!16384 0))(
  ( (Unit!16385) )
))
(declare-fun e!305801 () Unit!16384)

(declare-fun Unit!16386 () Unit!16384)

(assert (=> b!524328 (= e!305801 Unit!16386)))

(declare-fun lt!240620 () Unit!16384)

(declare-fun lt!240617 () (_ BitVec 32))

(declare-fun lt!240616 () SeekEntryResult!4483)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16384)

(assert (=> b!524328 (= lt!240620 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240617 #b00000000000000000000000000000000 (index!20146 lt!240616) (x!49128 lt!240616) mask!3524))))

(declare-fun res!321256 () Bool)

(declare-fun lt!240622 () array!33329)

(declare-fun lt!240618 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33329 (_ BitVec 32)) SeekEntryResult!4483)

(assert (=> b!524328 (= res!321256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240617 lt!240618 lt!240622 mask!3524) (Intermediate!4483 false (index!20146 lt!240616) (x!49128 lt!240616))))))

(declare-fun e!305798 () Bool)

(assert (=> b!524328 (=> (not res!321256) (not e!305798))))

(assert (=> b!524328 e!305798))

(declare-fun b!524329 () Bool)

(declare-fun e!305797 () Bool)

(assert (=> b!524329 (= e!305802 (not e!305797))))

(declare-fun res!321249 () Bool)

(assert (=> b!524329 (=> res!321249 e!305797)))

(declare-fun lt!240614 () (_ BitVec 32))

(assert (=> b!524329 (= res!321249 (= lt!240616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240614 lt!240618 lt!240622 mask!3524)))))

(assert (=> b!524329 (= lt!240616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240617 (select (arr!16016 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524329 (= lt!240614 (toIndex!0 lt!240618 mask!3524))))

(assert (=> b!524329 (= lt!240618 (select (store (arr!16016 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524329 (= lt!240617 (toIndex!0 (select (arr!16016 a!3235) j!176) mask!3524))))

(assert (=> b!524329 (= lt!240622 (array!33330 (store (arr!16016 a!3235) i!1204 k!2280) (size!16380 a!3235)))))

(assert (=> b!524329 e!305800))

(declare-fun res!321247 () Bool)

(assert (=> b!524329 (=> (not res!321247) (not e!305800))))

(assert (=> b!524329 (= res!321247 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240621 () Unit!16384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16384)

(assert (=> b!524329 (= lt!240621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524330 () Bool)

(declare-fun res!321251 () Bool)

(assert (=> b!524330 (=> (not res!321251) (not e!305796))))

(assert (=> b!524330 (= res!321251 (and (= (size!16380 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16380 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16380 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524331 () Bool)

(declare-fun res!321257 () Bool)

(assert (=> b!524331 (=> (not res!321257) (not e!305802))))

(declare-datatypes ((List!10174 0))(
  ( (Nil!10171) (Cons!10170 (h!11101 (_ BitVec 64)) (t!16402 List!10174)) )
))
(declare-fun arrayNoDuplicates!0 (array!33329 (_ BitVec 32) List!10174) Bool)

(assert (=> b!524331 (= res!321257 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10171))))

(declare-fun b!524332 () Bool)

(declare-fun res!321252 () Bool)

(assert (=> b!524332 (=> (not res!321252) (not e!305796))))

(assert (=> b!524332 (= res!321252 (validKeyInArray!0 k!2280))))

(declare-fun b!524333 () Bool)

(assert (=> b!524333 (= e!305797 (or (bvsgt #b00000000000000000000000000000000 (x!49128 lt!240616)) (bvsgt (x!49128 lt!240616) #b01111111111111111111111111111110) (bvslt lt!240617 #b00000000000000000000000000000000) (bvsge lt!240617 (size!16380 a!3235)) (bvslt (index!20146 lt!240616) #b00000000000000000000000000000000) (bvsge (index!20146 lt!240616) (size!16380 a!3235)) (= lt!240616 (Intermediate!4483 false (index!20146 lt!240616) (x!49128 lt!240616)))))))

(assert (=> b!524333 (and (or (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240615 () Unit!16384)

(assert (=> b!524333 (= lt!240615 e!305801)))

(declare-fun c!61844 () Bool)

(assert (=> b!524333 (= c!61844 (= (select (arr!16016 a!3235) (index!20146 lt!240616)) (select (arr!16016 a!3235) j!176)))))

(assert (=> b!524333 (and (bvslt (x!49128 lt!240616) #b01111111111111111111111111111110) (or (= (select (arr!16016 a!3235) (index!20146 lt!240616)) (select (arr!16016 a!3235) j!176)) (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16016 a!3235) (index!20146 lt!240616)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524334 () Bool)

(assert (=> b!524334 (= e!305798 false)))

(declare-fun b!524335 () Bool)

(declare-fun Unit!16387 () Unit!16384)

(assert (=> b!524335 (= e!305801 Unit!16387)))

(declare-fun b!524336 () Bool)

(declare-fun res!321253 () Bool)

(assert (=> b!524336 (=> res!321253 e!305797)))

(assert (=> b!524336 (= res!321253 (or (undefined!5295 lt!240616) (not (is-Intermediate!4483 lt!240616))))))

(assert (= (and start!47692 res!321254) b!524330))

(assert (= (and b!524330 res!321251) b!524327))

(assert (= (and b!524327 res!321246) b!524332))

(assert (= (and b!524332 res!321252) b!524324))

(assert (= (and b!524324 res!321248) b!524326))

(assert (= (and b!524326 res!321255) b!524325))

(assert (= (and b!524325 res!321250) b!524331))

(assert (= (and b!524331 res!321257) b!524329))

(assert (= (and b!524329 res!321247) b!524323))

(assert (= (and b!524329 (not res!321249)) b!524336))

(assert (= (and b!524336 (not res!321253)) b!524333))

(assert (= (and b!524333 c!61844) b!524328))

(assert (= (and b!524333 (not c!61844)) b!524335))

(assert (= (and b!524328 res!321256) b!524334))

(declare-fun m!504957 () Bool)

(assert (=> b!524325 m!504957))

(declare-fun m!504959 () Bool)

(assert (=> b!524331 m!504959))

(declare-fun m!504961 () Bool)

(assert (=> b!524324 m!504961))

(declare-fun m!504963 () Bool)

(assert (=> b!524328 m!504963))

(declare-fun m!504965 () Bool)

(assert (=> b!524328 m!504965))

(declare-fun m!504967 () Bool)

(assert (=> b!524326 m!504967))

(declare-fun m!504969 () Bool)

(assert (=> b!524327 m!504969))

(assert (=> b!524327 m!504969))

(declare-fun m!504971 () Bool)

(assert (=> b!524327 m!504971))

(assert (=> b!524323 m!504969))

(assert (=> b!524323 m!504969))

(declare-fun m!504973 () Bool)

(assert (=> b!524323 m!504973))

(declare-fun m!504975 () Bool)

(assert (=> b!524333 m!504975))

(assert (=> b!524333 m!504969))

(declare-fun m!504977 () Bool)

(assert (=> start!47692 m!504977))

(declare-fun m!504979 () Bool)

(assert (=> start!47692 m!504979))

(declare-fun m!504981 () Bool)

(assert (=> b!524329 m!504981))

(declare-fun m!504983 () Bool)

(assert (=> b!524329 m!504983))

(declare-fun m!504985 () Bool)

(assert (=> b!524329 m!504985))

(assert (=> b!524329 m!504969))

(declare-fun m!504987 () Bool)

(assert (=> b!524329 m!504987))

(assert (=> b!524329 m!504969))

(declare-fun m!504989 () Bool)

(assert (=> b!524329 m!504989))

(declare-fun m!504991 () Bool)

(assert (=> b!524329 m!504991))

(assert (=> b!524329 m!504969))

(declare-fun m!504993 () Bool)

(assert (=> b!524329 m!504993))

(declare-fun m!504995 () Bool)

(assert (=> b!524329 m!504995))

(declare-fun m!504997 () Bool)

(assert (=> b!524332 m!504997))

(push 1)

