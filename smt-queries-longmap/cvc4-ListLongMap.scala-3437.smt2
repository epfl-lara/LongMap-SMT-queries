; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47746 () Bool)

(assert start!47746)

(declare-fun b!525466 () Bool)

(declare-datatypes ((Unit!16492 0))(
  ( (Unit!16493) )
))
(declare-fun e!306376 () Unit!16492)

(declare-fun Unit!16494 () Unit!16492)

(assert (=> b!525466 (= e!306376 Unit!16494)))

(declare-fun b!525467 () Bool)

(declare-fun res!322230 () Bool)

(declare-fun e!306378 () Bool)

(assert (=> b!525467 (=> (not res!322230) (not e!306378))))

(declare-datatypes ((array!33383 0))(
  ( (array!33384 (arr!16043 (Array (_ BitVec 32) (_ BitVec 64))) (size!16407 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33383)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33383 (_ BitVec 32)) Bool)

(assert (=> b!525467 (= res!322230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525468 () Bool)

(declare-fun e!306377 () Bool)

(assert (=> b!525468 (= e!306378 (not e!306377))))

(declare-fun res!322238 () Bool)

(assert (=> b!525468 (=> res!322238 e!306377)))

(declare-fun lt!241415 () array!33383)

(declare-datatypes ((SeekEntryResult!4510 0))(
  ( (MissingZero!4510 (index!20252 (_ BitVec 32))) (Found!4510 (index!20253 (_ BitVec 32))) (Intermediate!4510 (undefined!5322 Bool) (index!20254 (_ BitVec 32)) (x!49227 (_ BitVec 32))) (Undefined!4510) (MissingVacant!4510 (index!20255 (_ BitVec 32))) )
))
(declare-fun lt!241416 () SeekEntryResult!4510)

(declare-fun lt!241423 () (_ BitVec 32))

(declare-fun lt!241417 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33383 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!525468 (= res!322238 (= lt!241416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241423 lt!241417 lt!241415 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241419 () (_ BitVec 32))

(assert (=> b!525468 (= lt!241416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241419 (select (arr!16043 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525468 (= lt!241423 (toIndex!0 lt!241417 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525468 (= lt!241417 (select (store (arr!16043 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!525468 (= lt!241419 (toIndex!0 (select (arr!16043 a!3235) j!176) mask!3524))))

(assert (=> b!525468 (= lt!241415 (array!33384 (store (arr!16043 a!3235) i!1204 k!2280) (size!16407 a!3235)))))

(declare-fun e!306375 () Bool)

(assert (=> b!525468 e!306375))

(declare-fun res!322229 () Bool)

(assert (=> b!525468 (=> (not res!322229) (not e!306375))))

(assert (=> b!525468 (= res!322229 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241420 () Unit!16492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16492)

(assert (=> b!525468 (= lt!241420 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!322234 () Bool)

(declare-fun e!306374 () Bool)

(assert (=> start!47746 (=> (not res!322234) (not e!306374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47746 (= res!322234 (validMask!0 mask!3524))))

(assert (=> start!47746 e!306374))

(assert (=> start!47746 true))

(declare-fun array_inv!11839 (array!33383) Bool)

(assert (=> start!47746 (array_inv!11839 a!3235)))

(declare-fun b!525469 () Bool)

(assert (=> b!525469 (= e!306374 e!306378)))

(declare-fun res!322231 () Bool)

(assert (=> b!525469 (=> (not res!322231) (not e!306378))))

(declare-fun lt!241421 () SeekEntryResult!4510)

(assert (=> b!525469 (= res!322231 (or (= lt!241421 (MissingZero!4510 i!1204)) (= lt!241421 (MissingVacant!4510 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33383 (_ BitVec 32)) SeekEntryResult!4510)

(assert (=> b!525469 (= lt!241421 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!525470 () Bool)

(declare-fun e!306372 () Bool)

(assert (=> b!525470 (= e!306372 false)))

(declare-fun b!525471 () Bool)

(assert (=> b!525471 (= e!306377 true)))

(assert (=> b!525471 (= (index!20254 lt!241416) i!1204)))

(declare-fun lt!241422 () Unit!16492)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16492)

(assert (=> b!525471 (= lt!241422 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241419 #b00000000000000000000000000000000 (index!20254 lt!241416) (x!49227 lt!241416) mask!3524))))

(assert (=> b!525471 (and (or (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241418 () Unit!16492)

(assert (=> b!525471 (= lt!241418 e!306376)))

(declare-fun c!61925 () Bool)

(assert (=> b!525471 (= c!61925 (= (select (arr!16043 a!3235) (index!20254 lt!241416)) (select (arr!16043 a!3235) j!176)))))

(assert (=> b!525471 (and (bvslt (x!49227 lt!241416) #b01111111111111111111111111111110) (or (= (select (arr!16043 a!3235) (index!20254 lt!241416)) (select (arr!16043 a!3235) j!176)) (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16043 a!3235) (index!20254 lt!241416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525472 () Bool)

(declare-fun res!322235 () Bool)

(assert (=> b!525472 (=> res!322235 e!306377)))

(assert (=> b!525472 (= res!322235 (or (undefined!5322 lt!241416) (not (is-Intermediate!4510 lt!241416))))))

(declare-fun b!525473 () Bool)

(declare-fun res!322237 () Bool)

(assert (=> b!525473 (=> (not res!322237) (not e!306374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525473 (= res!322237 (validKeyInArray!0 k!2280))))

(declare-fun b!525474 () Bool)

(declare-fun res!322228 () Bool)

(assert (=> b!525474 (=> (not res!322228) (not e!306374))))

(assert (=> b!525474 (= res!322228 (and (= (size!16407 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16407 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16407 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525475 () Bool)

(declare-fun res!322236 () Bool)

(assert (=> b!525475 (=> (not res!322236) (not e!306374))))

(declare-fun arrayContainsKey!0 (array!33383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525475 (= res!322236 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525476 () Bool)

(declare-fun res!322233 () Bool)

(assert (=> b!525476 (=> (not res!322233) (not e!306378))))

(declare-datatypes ((List!10201 0))(
  ( (Nil!10198) (Cons!10197 (h!11128 (_ BitVec 64)) (t!16429 List!10201)) )
))
(declare-fun arrayNoDuplicates!0 (array!33383 (_ BitVec 32) List!10201) Bool)

(assert (=> b!525476 (= res!322233 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10198))))

(declare-fun b!525477 () Bool)

(assert (=> b!525477 (= e!306375 (= (seekEntryOrOpen!0 (select (arr!16043 a!3235) j!176) a!3235 mask!3524) (Found!4510 j!176)))))

(declare-fun b!525478 () Bool)

(declare-fun Unit!16495 () Unit!16492)

(assert (=> b!525478 (= e!306376 Unit!16495)))

(declare-fun lt!241414 () Unit!16492)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16492)

(assert (=> b!525478 (= lt!241414 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241419 #b00000000000000000000000000000000 (index!20254 lt!241416) (x!49227 lt!241416) mask!3524))))

(declare-fun res!322232 () Bool)

(assert (=> b!525478 (= res!322232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241419 lt!241417 lt!241415 mask!3524) (Intermediate!4510 false (index!20254 lt!241416) (x!49227 lt!241416))))))

(assert (=> b!525478 (=> (not res!322232) (not e!306372))))

(assert (=> b!525478 e!306372))

(declare-fun b!525479 () Bool)

(declare-fun res!322227 () Bool)

(assert (=> b!525479 (=> (not res!322227) (not e!306374))))

(assert (=> b!525479 (= res!322227 (validKeyInArray!0 (select (arr!16043 a!3235) j!176)))))

(assert (= (and start!47746 res!322234) b!525474))

(assert (= (and b!525474 res!322228) b!525479))

(assert (= (and b!525479 res!322227) b!525473))

(assert (= (and b!525473 res!322237) b!525475))

(assert (= (and b!525475 res!322236) b!525469))

(assert (= (and b!525469 res!322231) b!525467))

(assert (= (and b!525467 res!322230) b!525476))

(assert (= (and b!525476 res!322233) b!525468))

(assert (= (and b!525468 res!322229) b!525477))

(assert (= (and b!525468 (not res!322238)) b!525472))

(assert (= (and b!525472 (not res!322235)) b!525471))

(assert (= (and b!525471 c!61925) b!525478))

(assert (= (and b!525471 (not c!61925)) b!525466))

(assert (= (and b!525478 res!322232) b!525470))

(declare-fun m!506125 () Bool)

(assert (=> b!525471 m!506125))

(declare-fun m!506127 () Bool)

(assert (=> b!525471 m!506127))

(declare-fun m!506129 () Bool)

(assert (=> b!525471 m!506129))

(declare-fun m!506131 () Bool)

(assert (=> b!525469 m!506131))

(declare-fun m!506133 () Bool)

(assert (=> b!525468 m!506133))

(declare-fun m!506135 () Bool)

(assert (=> b!525468 m!506135))

(declare-fun m!506137 () Bool)

(assert (=> b!525468 m!506137))

(assert (=> b!525468 m!506129))

(declare-fun m!506139 () Bool)

(assert (=> b!525468 m!506139))

(assert (=> b!525468 m!506129))

(declare-fun m!506141 () Bool)

(assert (=> b!525468 m!506141))

(declare-fun m!506143 () Bool)

(assert (=> b!525468 m!506143))

(declare-fun m!506145 () Bool)

(assert (=> b!525468 m!506145))

(declare-fun m!506147 () Bool)

(assert (=> b!525468 m!506147))

(assert (=> b!525468 m!506129))

(declare-fun m!506149 () Bool)

(assert (=> b!525467 m!506149))

(declare-fun m!506151 () Bool)

(assert (=> b!525478 m!506151))

(declare-fun m!506153 () Bool)

(assert (=> b!525478 m!506153))

(declare-fun m!506155 () Bool)

(assert (=> b!525475 m!506155))

(assert (=> b!525479 m!506129))

(assert (=> b!525479 m!506129))

(declare-fun m!506157 () Bool)

(assert (=> b!525479 m!506157))

(declare-fun m!506159 () Bool)

(assert (=> b!525473 m!506159))

(declare-fun m!506161 () Bool)

(assert (=> b!525476 m!506161))

(declare-fun m!506163 () Bool)

(assert (=> start!47746 m!506163))

(declare-fun m!506165 () Bool)

(assert (=> start!47746 m!506165))

(assert (=> b!525477 m!506129))

(assert (=> b!525477 m!506129))

(declare-fun m!506167 () Bool)

(assert (=> b!525477 m!506167))

(push 1)

