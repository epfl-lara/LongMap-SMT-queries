; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51138 () Bool)

(assert start!51138)

(declare-fun e!321802 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!558588 () Bool)

(declare-datatypes ((SeekEntryResult!5278 0))(
  ( (MissingZero!5278 (index!23339 (_ BitVec 32))) (Found!5278 (index!23340 (_ BitVec 32))) (Intermediate!5278 (undefined!6090 Bool) (index!23341 (_ BitVec 32)) (x!52389 (_ BitVec 32))) (Undefined!5278) (MissingVacant!5278 (index!23342 (_ BitVec 32))) )
))
(declare-fun lt!253859 () SeekEntryResult!5278)

(declare-datatypes ((array!35139 0))(
  ( (array!35140 (arr!16873 (Array (_ BitVec 32) (_ BitVec 64))) (size!17237 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35139)

(get-info :version)

(assert (=> b!558588 (= e!321802 (not (or (undefined!6090 lt!253859) (not ((_ is Intermediate!5278) lt!253859)) (= (select (arr!16873 a!3118) (index!23341 lt!253859)) (select (arr!16873 a!3118) j!142)) (= (select (arr!16873 a!3118) (index!23341 lt!253859)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!321800 () Bool)

(assert (=> b!558588 e!321800))

(declare-fun res!350352 () Bool)

(assert (=> b!558588 (=> (not res!350352) (not e!321800))))

(declare-fun lt!253861 () SeekEntryResult!5278)

(assert (=> b!558588 (= res!350352 (= lt!253861 (Found!5278 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35139 (_ BitVec 32)) SeekEntryResult!5278)

(assert (=> b!558588 (= lt!253861 (seekEntryOrOpen!0 (select (arr!16873 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35139 (_ BitVec 32)) Bool)

(assert (=> b!558588 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17401 0))(
  ( (Unit!17402) )
))
(declare-fun lt!253860 () Unit!17401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17401)

(assert (=> b!558588 (= lt!253860 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558589 () Bool)

(declare-fun res!350347 () Bool)

(declare-fun e!321801 () Bool)

(assert (=> b!558589 (=> (not res!350347) (not e!321801))))

(assert (=> b!558589 (= res!350347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558590 () Bool)

(declare-fun res!350354 () Bool)

(declare-fun e!321803 () Bool)

(assert (=> b!558590 (=> (not res!350354) (not e!321803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558590 (= res!350354 (validKeyInArray!0 (select (arr!16873 a!3118) j!142)))))

(declare-fun b!558591 () Bool)

(declare-fun res!350349 () Bool)

(assert (=> b!558591 (=> (not res!350349) (not e!321803))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558591 (= res!350349 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558592 () Bool)

(declare-fun res!350346 () Bool)

(assert (=> b!558592 (=> (not res!350346) (not e!321803))))

(assert (=> b!558592 (= res!350346 (validKeyInArray!0 k0!1914))))

(declare-fun res!350350 () Bool)

(assert (=> start!51138 (=> (not res!350350) (not e!321803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51138 (= res!350350 (validMask!0 mask!3119))))

(assert (=> start!51138 e!321803))

(assert (=> start!51138 true))

(declare-fun array_inv!12732 (array!35139) Bool)

(assert (=> start!51138 (array_inv!12732 a!3118)))

(declare-fun e!321799 () Bool)

(declare-fun b!558593 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35139 (_ BitVec 32)) SeekEntryResult!5278)

(assert (=> b!558593 (= e!321799 (= lt!253861 (seekKeyOrZeroReturnVacant!0 (x!52389 lt!253859) (index!23341 lt!253859) (index!23341 lt!253859) (select (arr!16873 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558594 () Bool)

(assert (=> b!558594 (= e!321800 e!321799)))

(declare-fun res!350348 () Bool)

(assert (=> b!558594 (=> res!350348 e!321799)))

(assert (=> b!558594 (= res!350348 (or (undefined!6090 lt!253859) (not ((_ is Intermediate!5278) lt!253859)) (= (select (arr!16873 a!3118) (index!23341 lt!253859)) (select (arr!16873 a!3118) j!142)) (= (select (arr!16873 a!3118) (index!23341 lt!253859)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558595 () Bool)

(assert (=> b!558595 (= e!321801 e!321802)))

(declare-fun res!350356 () Bool)

(assert (=> b!558595 (=> (not res!350356) (not e!321802))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!253862 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35139 (_ BitVec 32)) SeekEntryResult!5278)

(assert (=> b!558595 (= res!350356 (= lt!253859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253862 (select (store (arr!16873 a!3118) i!1132 k0!1914) j!142) (array!35140 (store (arr!16873 a!3118) i!1132 k0!1914) (size!17237 a!3118)) mask!3119)))))

(declare-fun lt!253864 () (_ BitVec 32))

(assert (=> b!558595 (= lt!253859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253864 (select (arr!16873 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558595 (= lt!253862 (toIndex!0 (select (store (arr!16873 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558595 (= lt!253864 (toIndex!0 (select (arr!16873 a!3118) j!142) mask!3119))))

(declare-fun b!558596 () Bool)

(declare-fun res!350353 () Bool)

(assert (=> b!558596 (=> (not res!350353) (not e!321801))))

(declare-datatypes ((List!10860 0))(
  ( (Nil!10857) (Cons!10856 (h!11853 (_ BitVec 64)) (t!17080 List!10860)) )
))
(declare-fun arrayNoDuplicates!0 (array!35139 (_ BitVec 32) List!10860) Bool)

(assert (=> b!558596 (= res!350353 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10857))))

(declare-fun b!558597 () Bool)

(declare-fun res!350351 () Bool)

(assert (=> b!558597 (=> (not res!350351) (not e!321803))))

(assert (=> b!558597 (= res!350351 (and (= (size!17237 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17237 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17237 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558598 () Bool)

(assert (=> b!558598 (= e!321803 e!321801)))

(declare-fun res!350355 () Bool)

(assert (=> b!558598 (=> (not res!350355) (not e!321801))))

(declare-fun lt!253863 () SeekEntryResult!5278)

(assert (=> b!558598 (= res!350355 (or (= lt!253863 (MissingZero!5278 i!1132)) (= lt!253863 (MissingVacant!5278 i!1132))))))

(assert (=> b!558598 (= lt!253863 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51138 res!350350) b!558597))

(assert (= (and b!558597 res!350351) b!558590))

(assert (= (and b!558590 res!350354) b!558592))

(assert (= (and b!558592 res!350346) b!558591))

(assert (= (and b!558591 res!350349) b!558598))

(assert (= (and b!558598 res!350355) b!558589))

(assert (= (and b!558589 res!350347) b!558596))

(assert (= (and b!558596 res!350353) b!558595))

(assert (= (and b!558595 res!350356) b!558588))

(assert (= (and b!558588 res!350352) b!558594))

(assert (= (and b!558594 (not res!350348)) b!558593))

(declare-fun m!536693 () Bool)

(assert (=> b!558598 m!536693))

(declare-fun m!536695 () Bool)

(assert (=> b!558596 m!536695))

(declare-fun m!536697 () Bool)

(assert (=> b!558594 m!536697))

(declare-fun m!536699 () Bool)

(assert (=> b!558594 m!536699))

(assert (=> b!558593 m!536699))

(assert (=> b!558593 m!536699))

(declare-fun m!536701 () Bool)

(assert (=> b!558593 m!536701))

(declare-fun m!536703 () Bool)

(assert (=> start!51138 m!536703))

(declare-fun m!536705 () Bool)

(assert (=> start!51138 m!536705))

(declare-fun m!536707 () Bool)

(assert (=> b!558591 m!536707))

(declare-fun m!536709 () Bool)

(assert (=> b!558592 m!536709))

(assert (=> b!558588 m!536699))

(declare-fun m!536711 () Bool)

(assert (=> b!558588 m!536711))

(assert (=> b!558588 m!536697))

(declare-fun m!536713 () Bool)

(assert (=> b!558588 m!536713))

(assert (=> b!558588 m!536699))

(declare-fun m!536715 () Bool)

(assert (=> b!558588 m!536715))

(assert (=> b!558590 m!536699))

(assert (=> b!558590 m!536699))

(declare-fun m!536717 () Bool)

(assert (=> b!558590 m!536717))

(declare-fun m!536719 () Bool)

(assert (=> b!558589 m!536719))

(assert (=> b!558595 m!536699))

(declare-fun m!536721 () Bool)

(assert (=> b!558595 m!536721))

(assert (=> b!558595 m!536699))

(declare-fun m!536723 () Bool)

(assert (=> b!558595 m!536723))

(assert (=> b!558595 m!536723))

(declare-fun m!536725 () Bool)

(assert (=> b!558595 m!536725))

(assert (=> b!558595 m!536699))

(declare-fun m!536727 () Bool)

(assert (=> b!558595 m!536727))

(declare-fun m!536729 () Bool)

(assert (=> b!558595 m!536729))

(assert (=> b!558595 m!536723))

(declare-fun m!536731 () Bool)

(assert (=> b!558595 m!536731))

(check-sat (not b!558595) (not b!558592) (not start!51138) (not b!558593) (not b!558590) (not b!558596) (not b!558588) (not b!558591) (not b!558598) (not b!558589))
(check-sat)
