; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51502 () Bool)

(assert start!51502)

(declare-fun b!563375 () Bool)

(declare-fun res!354528 () Bool)

(declare-fun e!324665 () Bool)

(assert (=> b!563375 (=> (not res!354528) (not e!324665))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563375 (= res!354528 (validKeyInArray!0 k0!1914))))

(declare-fun b!563376 () Bool)

(declare-fun res!354533 () Bool)

(declare-fun e!324662 () Bool)

(assert (=> b!563376 (=> (not res!354533) (not e!324662))))

(declare-datatypes ((array!35367 0))(
  ( (array!35368 (arr!16984 (Array (_ BitVec 32) (_ BitVec 64))) (size!17348 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35367)

(declare-datatypes ((List!11064 0))(
  ( (Nil!11061) (Cons!11060 (h!12063 (_ BitVec 64)) (t!17292 List!11064)) )
))
(declare-fun arrayNoDuplicates!0 (array!35367 (_ BitVec 32) List!11064) Bool)

(assert (=> b!563376 (= res!354533 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11061))))

(declare-fun res!354535 () Bool)

(assert (=> start!51502 (=> (not res!354535) (not e!324665))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51502 (= res!354535 (validMask!0 mask!3119))))

(assert (=> start!51502 e!324665))

(assert (=> start!51502 true))

(declare-fun array_inv!12780 (array!35367) Bool)

(assert (=> start!51502 (array_inv!12780 a!3118)))

(declare-fun b!563377 () Bool)

(declare-fun res!354529 () Bool)

(assert (=> b!563377 (=> (not res!354529) (not e!324665))))

(declare-fun arrayContainsKey!0 (array!35367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563377 (= res!354529 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563378 () Bool)

(declare-fun res!354532 () Bool)

(assert (=> b!563378 (=> (not res!354532) (not e!324662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35367 (_ BitVec 32)) Bool)

(assert (=> b!563378 (= res!354532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563379 () Bool)

(declare-fun res!354534 () Bool)

(assert (=> b!563379 (=> (not res!354534) (not e!324665))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563379 (= res!354534 (and (= (size!17348 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17348 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17348 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!324666 () Bool)

(declare-fun b!563380 () Bool)

(declare-datatypes ((SeekEntryResult!5433 0))(
  ( (MissingZero!5433 (index!23959 (_ BitVec 32))) (Found!5433 (index!23960 (_ BitVec 32))) (Intermediate!5433 (undefined!6245 Bool) (index!23961 (_ BitVec 32)) (x!52848 (_ BitVec 32))) (Undefined!5433) (MissingVacant!5433 (index!23962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35367 (_ BitVec 32)) SeekEntryResult!5433)

(assert (=> b!563380 (= e!324666 (= (seekEntryOrOpen!0 (select (arr!16984 a!3118) j!142) a!3118 mask!3119) (Found!5433 j!142)))))

(declare-fun b!563381 () Bool)

(declare-fun res!354536 () Bool)

(assert (=> b!563381 (=> (not res!354536) (not e!324665))))

(assert (=> b!563381 (= res!354536 (validKeyInArray!0 (select (arr!16984 a!3118) j!142)))))

(declare-fun b!563382 () Bool)

(declare-fun e!324663 () Bool)

(assert (=> b!563382 (= e!324662 e!324663)))

(declare-fun res!354531 () Bool)

(assert (=> b!563382 (=> (not res!354531) (not e!324663))))

(declare-fun lt!257208 () SeekEntryResult!5433)

(declare-fun lt!257206 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35367 (_ BitVec 32)) SeekEntryResult!5433)

(assert (=> b!563382 (= res!354531 (= lt!257208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257206 (select (store (arr!16984 a!3118) i!1132 k0!1914) j!142) (array!35368 (store (arr!16984 a!3118) i!1132 k0!1914) (size!17348 a!3118)) mask!3119)))))

(declare-fun lt!257205 () (_ BitVec 32))

(assert (=> b!563382 (= lt!257208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257205 (select (arr!16984 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563382 (= lt!257206 (toIndex!0 (select (store (arr!16984 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563382 (= lt!257205 (toIndex!0 (select (arr!16984 a!3118) j!142) mask!3119))))

(declare-fun b!563383 () Bool)

(assert (=> b!563383 (= e!324665 e!324662)))

(declare-fun res!354527 () Bool)

(assert (=> b!563383 (=> (not res!354527) (not e!324662))))

(declare-fun lt!257204 () SeekEntryResult!5433)

(assert (=> b!563383 (= res!354527 (or (= lt!257204 (MissingZero!5433 i!1132)) (= lt!257204 (MissingVacant!5433 i!1132))))))

(assert (=> b!563383 (= lt!257204 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun lt!257207 () Bool)

(declare-fun b!563384 () Bool)

(assert (=> b!563384 (= e!324663 (not (or (and (not lt!257207) (undefined!6245 lt!257208)) (and (not lt!257207) (not (undefined!6245 lt!257208))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563384 (= lt!257207 (not ((_ is Intermediate!5433) lt!257208)))))

(assert (=> b!563384 e!324666))

(declare-fun res!354530 () Bool)

(assert (=> b!563384 (=> (not res!354530) (not e!324666))))

(assert (=> b!563384 (= res!354530 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17640 0))(
  ( (Unit!17641) )
))
(declare-fun lt!257209 () Unit!17640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35367 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17640)

(assert (=> b!563384 (= lt!257209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51502 res!354535) b!563379))

(assert (= (and b!563379 res!354534) b!563381))

(assert (= (and b!563381 res!354536) b!563375))

(assert (= (and b!563375 res!354528) b!563377))

(assert (= (and b!563377 res!354529) b!563383))

(assert (= (and b!563383 res!354527) b!563378))

(assert (= (and b!563378 res!354532) b!563376))

(assert (= (and b!563376 res!354533) b!563382))

(assert (= (and b!563382 res!354531) b!563384))

(assert (= (and b!563384 res!354530) b!563380))

(declare-fun m!541707 () Bool)

(assert (=> b!563376 m!541707))

(declare-fun m!541709 () Bool)

(assert (=> start!51502 m!541709))

(declare-fun m!541711 () Bool)

(assert (=> start!51502 m!541711))

(declare-fun m!541713 () Bool)

(assert (=> b!563384 m!541713))

(declare-fun m!541715 () Bool)

(assert (=> b!563384 m!541715))

(declare-fun m!541717 () Bool)

(assert (=> b!563380 m!541717))

(assert (=> b!563380 m!541717))

(declare-fun m!541719 () Bool)

(assert (=> b!563380 m!541719))

(declare-fun m!541721 () Bool)

(assert (=> b!563378 m!541721))

(assert (=> b!563381 m!541717))

(assert (=> b!563381 m!541717))

(declare-fun m!541723 () Bool)

(assert (=> b!563381 m!541723))

(declare-fun m!541725 () Bool)

(assert (=> b!563375 m!541725))

(assert (=> b!563382 m!541717))

(declare-fun m!541727 () Bool)

(assert (=> b!563382 m!541727))

(declare-fun m!541729 () Bool)

(assert (=> b!563382 m!541729))

(declare-fun m!541731 () Bool)

(assert (=> b!563382 m!541731))

(assert (=> b!563382 m!541717))

(assert (=> b!563382 m!541729))

(declare-fun m!541733 () Bool)

(assert (=> b!563382 m!541733))

(assert (=> b!563382 m!541717))

(declare-fun m!541735 () Bool)

(assert (=> b!563382 m!541735))

(assert (=> b!563382 m!541729))

(declare-fun m!541737 () Bool)

(assert (=> b!563382 m!541737))

(declare-fun m!541739 () Bool)

(assert (=> b!563377 m!541739))

(declare-fun m!541741 () Bool)

(assert (=> b!563383 m!541741))

(check-sat (not b!563377) (not b!563378) (not b!563382) (not start!51502) (not b!563375) (not b!563381) (not b!563376) (not b!563380) (not b!563383) (not b!563384))
(check-sat)
