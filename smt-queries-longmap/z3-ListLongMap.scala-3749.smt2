; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51534 () Bool)

(assert start!51534)

(declare-fun b!563344 () Bool)

(declare-fun res!354401 () Bool)

(declare-fun e!324675 () Bool)

(assert (=> b!563344 (=> (not res!354401) (not e!324675))))

(declare-datatypes ((array!35346 0))(
  ( (array!35347 (arr!16972 (Array (_ BitVec 32) (_ BitVec 64))) (size!17336 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35346)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35346 (_ BitVec 32)) Bool)

(assert (=> b!563344 (= res!354401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563345 () Bool)

(declare-fun res!354402 () Bool)

(assert (=> b!563345 (=> (not res!354402) (not e!324675))))

(declare-datatypes ((List!10959 0))(
  ( (Nil!10956) (Cons!10955 (h!11961 (_ BitVec 64)) (t!17179 List!10959)) )
))
(declare-fun arrayNoDuplicates!0 (array!35346 (_ BitVec 32) List!10959) Bool)

(assert (=> b!563345 (= res!354402 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10956))))

(declare-fun b!563346 () Bool)

(declare-fun e!324677 () Bool)

(declare-fun e!324681 () Bool)

(assert (=> b!563346 (= e!324677 (not e!324681))))

(declare-fun res!354394 () Bool)

(assert (=> b!563346 (=> res!354394 e!324681)))

(declare-datatypes ((SeekEntryResult!5377 0))(
  ( (MissingZero!5377 (index!23735 (_ BitVec 32))) (Found!5377 (index!23736 (_ BitVec 32))) (Intermediate!5377 (undefined!6189 Bool) (index!23737 (_ BitVec 32)) (x!52779 (_ BitVec 32))) (Undefined!5377) (MissingVacant!5377 (index!23738 (_ BitVec 32))) )
))
(declare-fun lt!257180 () SeekEntryResult!5377)

(get-info :version)

(assert (=> b!563346 (= res!354394 (or (undefined!6189 lt!257180) (not ((_ is Intermediate!5377) lt!257180))))))

(declare-fun lt!257179 () SeekEntryResult!5377)

(declare-fun lt!257169 () SeekEntryResult!5377)

(assert (=> b!563346 (= lt!257179 lt!257169)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563346 (= lt!257169 (Found!5377 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35346 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!563346 (= lt!257179 (seekEntryOrOpen!0 (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!563346 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17599 0))(
  ( (Unit!17600) )
))
(declare-fun lt!257175 () Unit!17599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17599)

(assert (=> b!563346 (= lt!257175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563347 () Bool)

(declare-fun e!324679 () Bool)

(assert (=> b!563347 (= e!324679 e!324675)))

(declare-fun res!354398 () Bool)

(assert (=> b!563347 (=> (not res!354398) (not e!324675))))

(declare-fun lt!257171 () SeekEntryResult!5377)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563347 (= res!354398 (or (= lt!257171 (MissingZero!5377 i!1132)) (= lt!257171 (MissingVacant!5377 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!563347 (= lt!257171 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!354400 () Bool)

(assert (=> start!51534 (=> (not res!354400) (not e!324679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51534 (= res!354400 (validMask!0 mask!3119))))

(assert (=> start!51534 e!324679))

(assert (=> start!51534 true))

(declare-fun array_inv!12831 (array!35346) Bool)

(assert (=> start!51534 (array_inv!12831 a!3118)))

(declare-fun b!563348 () Bool)

(declare-fun e!324676 () Bool)

(declare-fun lt!257176 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563348 (= e!324676 (validKeyInArray!0 lt!257176))))

(declare-fun b!563349 () Bool)

(declare-fun res!354396 () Bool)

(assert (=> b!563349 (=> (not res!354396) (not e!324679))))

(declare-fun arrayContainsKey!0 (array!35346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563349 (= res!354396 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563350 () Bool)

(declare-fun e!324678 () Bool)

(assert (=> b!563350 (= e!324681 e!324678)))

(declare-fun res!354391 () Bool)

(assert (=> b!563350 (=> res!354391 e!324678)))

(declare-fun lt!257170 () (_ BitVec 64))

(assert (=> b!563350 (= res!354391 (or (= lt!257170 (select (arr!16972 a!3118) j!142)) (= lt!257170 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563350 (= lt!257170 (select (arr!16972 a!3118) (index!23737 lt!257180)))))

(declare-fun b!563351 () Bool)

(declare-fun res!354395 () Bool)

(assert (=> b!563351 (=> (not res!354395) (not e!324679))))

(assert (=> b!563351 (= res!354395 (validKeyInArray!0 k0!1914))))

(declare-fun b!563352 () Bool)

(declare-fun res!354392 () Bool)

(assert (=> b!563352 (=> (not res!354392) (not e!324679))))

(assert (=> b!563352 (= res!354392 (and (= (size!17336 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17336 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17336 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563353 () Bool)

(assert (=> b!563353 (= e!324675 e!324677)))

(declare-fun res!354403 () Bool)

(assert (=> b!563353 (=> (not res!354403) (not e!324677))))

(declare-fun lt!257182 () array!35346)

(declare-fun lt!257174 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35346 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!563353 (= res!354403 (= lt!257180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257174 lt!257176 lt!257182 mask!3119)))))

(declare-fun lt!257173 () (_ BitVec 32))

(assert (=> b!563353 (= lt!257180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257173 (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563353 (= lt!257174 (toIndex!0 lt!257176 mask!3119))))

(assert (=> b!563353 (= lt!257176 (select (store (arr!16972 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563353 (= lt!257173 (toIndex!0 (select (arr!16972 a!3118) j!142) mask!3119))))

(assert (=> b!563353 (= lt!257182 (array!35347 (store (arr!16972 a!3118) i!1132 k0!1914) (size!17336 a!3118)))))

(declare-fun b!563354 () Bool)

(declare-fun e!324680 () Bool)

(assert (=> b!563354 (= e!324680 e!324676)))

(declare-fun res!354397 () Bool)

(assert (=> b!563354 (=> res!354397 e!324676)))

(assert (=> b!563354 (= res!354397 (bvslt mask!3119 #b00000000000000000000000000000000))))

(declare-fun lt!257178 () SeekEntryResult!5377)

(declare-fun lt!257172 () SeekEntryResult!5377)

(assert (=> b!563354 (= lt!257178 lt!257172)))

(declare-fun lt!257177 () Unit!17599)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35346 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17599)

(assert (=> b!563354 (= lt!257177 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52779 lt!257180) (index!23737 lt!257180) (index!23737 lt!257180) mask!3119))))

(declare-fun b!563355 () Bool)

(assert (=> b!563355 (= e!324678 e!324680)))

(declare-fun res!354399 () Bool)

(assert (=> b!563355 (=> res!354399 e!324680)))

(assert (=> b!563355 (= res!354399 (or (bvslt (index!23737 lt!257180) #b00000000000000000000000000000000) (bvsge (index!23737 lt!257180) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52779 lt!257180) #b01111111111111111111111111111110) (bvslt (x!52779 lt!257180) #b00000000000000000000000000000000) (not (= lt!257170 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16972 a!3118) i!1132 k0!1914) (index!23737 lt!257180)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!257178 lt!257169))))))

(declare-fun lt!257181 () SeekEntryResult!5377)

(assert (=> b!563355 (= lt!257181 lt!257172)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35346 (_ BitVec 32)) SeekEntryResult!5377)

(assert (=> b!563355 (= lt!257172 (seekKeyOrZeroReturnVacant!0 (x!52779 lt!257180) (index!23737 lt!257180) (index!23737 lt!257180) lt!257176 lt!257182 mask!3119))))

(assert (=> b!563355 (= lt!257181 (seekEntryOrOpen!0 lt!257176 lt!257182 mask!3119))))

(assert (=> b!563355 (= lt!257179 lt!257178)))

(assert (=> b!563355 (= lt!257178 (seekKeyOrZeroReturnVacant!0 (x!52779 lt!257180) (index!23737 lt!257180) (index!23737 lt!257180) (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!563356 () Bool)

(declare-fun res!354393 () Bool)

(assert (=> b!563356 (=> (not res!354393) (not e!324679))))

(assert (=> b!563356 (= res!354393 (validKeyInArray!0 (select (arr!16972 a!3118) j!142)))))

(assert (= (and start!51534 res!354400) b!563352))

(assert (= (and b!563352 res!354392) b!563356))

(assert (= (and b!563356 res!354393) b!563351))

(assert (= (and b!563351 res!354395) b!563349))

(assert (= (and b!563349 res!354396) b!563347))

(assert (= (and b!563347 res!354398) b!563344))

(assert (= (and b!563344 res!354401) b!563345))

(assert (= (and b!563345 res!354402) b!563353))

(assert (= (and b!563353 res!354403) b!563346))

(assert (= (and b!563346 (not res!354394)) b!563350))

(assert (= (and b!563350 (not res!354391)) b!563355))

(assert (= (and b!563355 (not res!354399)) b!563354))

(assert (= (and b!563354 (not res!354397)) b!563348))

(declare-fun m!541751 () Bool)

(assert (=> b!563351 m!541751))

(declare-fun m!541753 () Bool)

(assert (=> b!563346 m!541753))

(assert (=> b!563346 m!541753))

(declare-fun m!541755 () Bool)

(assert (=> b!563346 m!541755))

(declare-fun m!541757 () Bool)

(assert (=> b!563346 m!541757))

(declare-fun m!541759 () Bool)

(assert (=> b!563346 m!541759))

(assert (=> b!563355 m!541753))

(assert (=> b!563355 m!541753))

(declare-fun m!541761 () Bool)

(assert (=> b!563355 m!541761))

(declare-fun m!541763 () Bool)

(assert (=> b!563355 m!541763))

(declare-fun m!541765 () Bool)

(assert (=> b!563355 m!541765))

(declare-fun m!541767 () Bool)

(assert (=> b!563355 m!541767))

(declare-fun m!541769 () Bool)

(assert (=> b!563355 m!541769))

(declare-fun m!541771 () Bool)

(assert (=> b!563348 m!541771))

(declare-fun m!541773 () Bool)

(assert (=> start!51534 m!541773))

(declare-fun m!541775 () Bool)

(assert (=> start!51534 m!541775))

(declare-fun m!541777 () Bool)

(assert (=> b!563349 m!541777))

(assert (=> b!563353 m!541753))

(declare-fun m!541779 () Bool)

(assert (=> b!563353 m!541779))

(assert (=> b!563353 m!541753))

(declare-fun m!541781 () Bool)

(assert (=> b!563353 m!541781))

(declare-fun m!541783 () Bool)

(assert (=> b!563353 m!541783))

(declare-fun m!541785 () Bool)

(assert (=> b!563353 m!541785))

(assert (=> b!563353 m!541753))

(declare-fun m!541787 () Bool)

(assert (=> b!563353 m!541787))

(assert (=> b!563353 m!541769))

(assert (=> b!563356 m!541753))

(assert (=> b!563356 m!541753))

(declare-fun m!541789 () Bool)

(assert (=> b!563356 m!541789))

(declare-fun m!541791 () Bool)

(assert (=> b!563345 m!541791))

(declare-fun m!541793 () Bool)

(assert (=> b!563354 m!541793))

(declare-fun m!541795 () Bool)

(assert (=> b!563344 m!541795))

(declare-fun m!541797 () Bool)

(assert (=> b!563347 m!541797))

(assert (=> b!563350 m!541753))

(declare-fun m!541799 () Bool)

(assert (=> b!563350 m!541799))

(check-sat (not b!563356) (not b!563344) (not b!563345) (not b!563346) (not b!563348) (not b!563355) (not b!563351) (not b!563354) (not b!563353) (not start!51534) (not b!563349) (not b!563347))
(check-sat)
