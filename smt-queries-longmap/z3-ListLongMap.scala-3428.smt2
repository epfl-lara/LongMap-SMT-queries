; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47690 () Bool)

(assert start!47690)

(declare-fun res!321214 () Bool)

(declare-fun e!305775 () Bool)

(assert (=> start!47690 (=> (not res!321214) (not e!305775))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47690 (= res!321214 (validMask!0 mask!3524))))

(assert (=> start!47690 e!305775))

(assert (=> start!47690 true))

(declare-datatypes ((array!33327 0))(
  ( (array!33328 (arr!16015 (Array (_ BitVec 32) (_ BitVec 64))) (size!16379 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33327)

(declare-fun array_inv!11811 (array!33327) Bool)

(assert (=> start!47690 (array_inv!11811 a!3235)))

(declare-fun b!524281 () Bool)

(declare-fun e!305777 () Bool)

(assert (=> b!524281 (= e!305777 false)))

(declare-fun b!524282 () Bool)

(declare-fun res!321213 () Bool)

(declare-fun e!305780 () Bool)

(assert (=> b!524282 (=> res!321213 e!305780)))

(declare-datatypes ((SeekEntryResult!4482 0))(
  ( (MissingZero!4482 (index!20140 (_ BitVec 32))) (Found!4482 (index!20141 (_ BitVec 32))) (Intermediate!4482 (undefined!5294 Bool) (index!20142 (_ BitVec 32)) (x!49127 (_ BitVec 32))) (Undefined!4482) (MissingVacant!4482 (index!20143 (_ BitVec 32))) )
))
(declare-fun lt!240591 () SeekEntryResult!4482)

(get-info :version)

(assert (=> b!524282 (= res!321213 (or (undefined!5294 lt!240591) (not ((_ is Intermediate!4482) lt!240591))))))

(declare-fun b!524283 () Bool)

(declare-datatypes ((Unit!16380 0))(
  ( (Unit!16381) )
))
(declare-fun e!305779 () Unit!16380)

(declare-fun Unit!16382 () Unit!16380)

(assert (=> b!524283 (= e!305779 Unit!16382)))

(declare-fun b!524284 () Bool)

(declare-fun res!321210 () Bool)

(declare-fun e!305778 () Bool)

(assert (=> b!524284 (=> (not res!321210) (not e!305778))))

(declare-datatypes ((List!10173 0))(
  ( (Nil!10170) (Cons!10169 (h!11100 (_ BitVec 64)) (t!16401 List!10173)) )
))
(declare-fun arrayNoDuplicates!0 (array!33327 (_ BitVec 32) List!10173) Bool)

(assert (=> b!524284 (= res!321210 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10170))))

(declare-fun b!524285 () Bool)

(declare-fun lt!240590 () (_ BitVec 32))

(assert (=> b!524285 (= e!305780 (or (bvsgt #b00000000000000000000000000000000 (x!49127 lt!240591)) (bvsgt (x!49127 lt!240591) #b01111111111111111111111111111110) (bvslt lt!240590 #b00000000000000000000000000000000) (bvsge lt!240590 (size!16379 a!3235)) (bvslt (index!20142 lt!240591) #b00000000000000000000000000000000) (bvsge (index!20142 lt!240591) (size!16379 a!3235)) (= lt!240591 (Intermediate!4482 false (index!20142 lt!240591) (x!49127 lt!240591)))))))

(assert (=> b!524285 (and (or (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240592 () Unit!16380)

(assert (=> b!524285 (= lt!240592 e!305779)))

(declare-fun c!61841 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524285 (= c!61841 (= (select (arr!16015 a!3235) (index!20142 lt!240591)) (select (arr!16015 a!3235) j!176)))))

(assert (=> b!524285 (and (bvslt (x!49127 lt!240591) #b01111111111111111111111111111110) (or (= (select (arr!16015 a!3235) (index!20142 lt!240591)) (select (arr!16015 a!3235) j!176)) (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16015 a!3235) (index!20142 lt!240591)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524286 () Bool)

(declare-fun res!321211 () Bool)

(assert (=> b!524286 (=> (not res!321211) (not e!305775))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524286 (= res!321211 (validKeyInArray!0 k0!2280))))

(declare-fun b!524287 () Bool)

(declare-fun res!321216 () Bool)

(assert (=> b!524287 (=> (not res!321216) (not e!305775))))

(declare-fun arrayContainsKey!0 (array!33327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524287 (= res!321216 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524288 () Bool)

(declare-fun res!321221 () Bool)

(assert (=> b!524288 (=> (not res!321221) (not e!305778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33327 (_ BitVec 32)) Bool)

(assert (=> b!524288 (= res!321221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524289 () Bool)

(declare-fun e!305776 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33327 (_ BitVec 32)) SeekEntryResult!4482)

(assert (=> b!524289 (= e!305776 (= (seekEntryOrOpen!0 (select (arr!16015 a!3235) j!176) a!3235 mask!3524) (Found!4482 j!176)))))

(declare-fun b!524290 () Bool)

(assert (=> b!524290 (= e!305775 e!305778)))

(declare-fun res!321218 () Bool)

(assert (=> b!524290 (=> (not res!321218) (not e!305778))))

(declare-fun lt!240589 () SeekEntryResult!4482)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524290 (= res!321218 (or (= lt!240589 (MissingZero!4482 i!1204)) (= lt!240589 (MissingVacant!4482 i!1204))))))

(assert (=> b!524290 (= lt!240589 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524291 () Bool)

(declare-fun res!321215 () Bool)

(assert (=> b!524291 (=> (not res!321215) (not e!305775))))

(assert (=> b!524291 (= res!321215 (validKeyInArray!0 (select (arr!16015 a!3235) j!176)))))

(declare-fun b!524292 () Bool)

(declare-fun Unit!16383 () Unit!16380)

(assert (=> b!524292 (= e!305779 Unit!16383)))

(declare-fun lt!240587 () Unit!16380)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33327 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16380)

(assert (=> b!524292 (= lt!240587 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240590 #b00000000000000000000000000000000 (index!20142 lt!240591) (x!49127 lt!240591) mask!3524))))

(declare-fun lt!240594 () (_ BitVec 64))

(declare-fun res!321217 () Bool)

(declare-fun lt!240595 () array!33327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33327 (_ BitVec 32)) SeekEntryResult!4482)

(assert (=> b!524292 (= res!321217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240590 lt!240594 lt!240595 mask!3524) (Intermediate!4482 false (index!20142 lt!240591) (x!49127 lt!240591))))))

(assert (=> b!524292 (=> (not res!321217) (not e!305777))))

(assert (=> b!524292 e!305777))

(declare-fun b!524293 () Bool)

(declare-fun res!321219 () Bool)

(assert (=> b!524293 (=> (not res!321219) (not e!305775))))

(assert (=> b!524293 (= res!321219 (and (= (size!16379 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16379 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16379 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524294 () Bool)

(assert (=> b!524294 (= e!305778 (not e!305780))))

(declare-fun res!321220 () Bool)

(assert (=> b!524294 (=> res!321220 e!305780)))

(declare-fun lt!240593 () (_ BitVec 32))

(assert (=> b!524294 (= res!321220 (= lt!240591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240593 lt!240594 lt!240595 mask!3524)))))

(assert (=> b!524294 (= lt!240591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240590 (select (arr!16015 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524294 (= lt!240593 (toIndex!0 lt!240594 mask!3524))))

(assert (=> b!524294 (= lt!240594 (select (store (arr!16015 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524294 (= lt!240590 (toIndex!0 (select (arr!16015 a!3235) j!176) mask!3524))))

(assert (=> b!524294 (= lt!240595 (array!33328 (store (arr!16015 a!3235) i!1204 k0!2280) (size!16379 a!3235)))))

(assert (=> b!524294 e!305776))

(declare-fun res!321212 () Bool)

(assert (=> b!524294 (=> (not res!321212) (not e!305776))))

(assert (=> b!524294 (= res!321212 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240588 () Unit!16380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33327 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16380)

(assert (=> b!524294 (= lt!240588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47690 res!321214) b!524293))

(assert (= (and b!524293 res!321219) b!524291))

(assert (= (and b!524291 res!321215) b!524286))

(assert (= (and b!524286 res!321211) b!524287))

(assert (= (and b!524287 res!321216) b!524290))

(assert (= (and b!524290 res!321218) b!524288))

(assert (= (and b!524288 res!321221) b!524284))

(assert (= (and b!524284 res!321210) b!524294))

(assert (= (and b!524294 res!321212) b!524289))

(assert (= (and b!524294 (not res!321220)) b!524282))

(assert (= (and b!524282 (not res!321213)) b!524285))

(assert (= (and b!524285 c!61841) b!524292))

(assert (= (and b!524285 (not c!61841)) b!524283))

(assert (= (and b!524292 res!321217) b!524281))

(declare-fun m!504915 () Bool)

(assert (=> b!524289 m!504915))

(assert (=> b!524289 m!504915))

(declare-fun m!504917 () Bool)

(assert (=> b!524289 m!504917))

(declare-fun m!504919 () Bool)

(assert (=> b!524285 m!504919))

(assert (=> b!524285 m!504915))

(declare-fun m!504921 () Bool)

(assert (=> b!524286 m!504921))

(declare-fun m!504923 () Bool)

(assert (=> b!524294 m!504923))

(declare-fun m!504925 () Bool)

(assert (=> b!524294 m!504925))

(declare-fun m!504927 () Bool)

(assert (=> b!524294 m!504927))

(declare-fun m!504929 () Bool)

(assert (=> b!524294 m!504929))

(declare-fun m!504931 () Bool)

(assert (=> b!524294 m!504931))

(assert (=> b!524294 m!504915))

(declare-fun m!504933 () Bool)

(assert (=> b!524294 m!504933))

(assert (=> b!524294 m!504915))

(declare-fun m!504935 () Bool)

(assert (=> b!524294 m!504935))

(assert (=> b!524294 m!504915))

(declare-fun m!504937 () Bool)

(assert (=> b!524294 m!504937))

(assert (=> b!524291 m!504915))

(assert (=> b!524291 m!504915))

(declare-fun m!504939 () Bool)

(assert (=> b!524291 m!504939))

(declare-fun m!504941 () Bool)

(assert (=> b!524284 m!504941))

(declare-fun m!504943 () Bool)

(assert (=> b!524288 m!504943))

(declare-fun m!504945 () Bool)

(assert (=> b!524292 m!504945))

(declare-fun m!504947 () Bool)

(assert (=> b!524292 m!504947))

(declare-fun m!504949 () Bool)

(assert (=> start!47690 m!504949))

(declare-fun m!504951 () Bool)

(assert (=> start!47690 m!504951))

(declare-fun m!504953 () Bool)

(assert (=> b!524287 m!504953))

(declare-fun m!504955 () Bool)

(assert (=> b!524290 m!504955))

(check-sat (not b!524286) (not b!524292) (not start!47690) (not b!524291) (not b!524284) (not b!524294) (not b!524287) (not b!524290) (not b!524289) (not b!524288))
(check-sat)
