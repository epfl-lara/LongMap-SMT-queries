; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45714 () Bool)

(assert start!45714)

(declare-fun b!505170 () Bool)

(declare-fun res!306377 () Bool)

(declare-fun e!295713 () Bool)

(assert (=> b!505170 (=> res!306377 e!295713)))

(declare-fun e!295711 () Bool)

(assert (=> b!505170 (= res!306377 e!295711)))

(declare-fun res!306376 () Bool)

(assert (=> b!505170 (=> (not res!306376) (not e!295711))))

(declare-datatypes ((SeekEntryResult!4084 0))(
  ( (MissingZero!4084 (index!18524 (_ BitVec 32))) (Found!4084 (index!18525 (_ BitVec 32))) (Intermediate!4084 (undefined!4896 Bool) (index!18526 (_ BitVec 32)) (x!47544 (_ BitVec 32))) (Undefined!4084) (MissingVacant!4084 (index!18527 (_ BitVec 32))) )
))
(declare-fun lt!230132 () SeekEntryResult!4084)

(assert (=> b!505170 (= res!306376 (bvsgt #b00000000000000000000000000000000 (x!47544 lt!230132)))))

(declare-fun b!505171 () Bool)

(declare-fun res!306383 () Bool)

(declare-fun e!295715 () Bool)

(assert (=> b!505171 (=> (not res!306383) (not e!295715))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505171 (= res!306383 (validKeyInArray!0 k0!2280))))

(declare-fun b!505172 () Bool)

(declare-fun res!306387 () Bool)

(assert (=> b!505172 (=> (not res!306387) (not e!295715))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32480 0))(
  ( (array!32481 (arr!15620 (Array (_ BitVec 32) (_ BitVec 64))) (size!15985 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32480)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505172 (= res!306387 (and (= (size!15985 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15985 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15985 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505174 () Bool)

(declare-fun res!306381 () Bool)

(declare-fun e!295709 () Bool)

(assert (=> b!505174 (=> (not res!306381) (not e!295709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32480 (_ BitVec 32)) Bool)

(assert (=> b!505174 (= res!306381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505175 () Bool)

(declare-fun e!295708 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505175 (= e!295708 (= (seekEntryOrOpen!0 (select (arr!15620 a!3235) j!176) a!3235 mask!3524) (Found!4084 j!176)))))

(declare-fun b!505176 () Bool)

(assert (=> b!505176 (= e!295715 e!295709)))

(declare-fun res!306380 () Bool)

(assert (=> b!505176 (=> (not res!306380) (not e!295709))))

(declare-fun lt!230134 () SeekEntryResult!4084)

(assert (=> b!505176 (= res!306380 (or (= lt!230134 (MissingZero!4084 i!1204)) (= lt!230134 (MissingVacant!4084 i!1204))))))

(assert (=> b!505176 (= lt!230134 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505177 () Bool)

(declare-fun res!306389 () Bool)

(assert (=> b!505177 (=> (not res!306389) (not e!295709))))

(declare-datatypes ((List!9817 0))(
  ( (Nil!9814) (Cons!9813 (h!10690 (_ BitVec 64)) (t!16036 List!9817)) )
))
(declare-fun arrayNoDuplicates!0 (array!32480 (_ BitVec 32) List!9817) Bool)

(assert (=> b!505177 (= res!306389 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9814))))

(declare-fun b!505178 () Bool)

(declare-datatypes ((Unit!15406 0))(
  ( (Unit!15407) )
))
(declare-fun e!295716 () Unit!15406)

(declare-fun Unit!15408 () Unit!15406)

(assert (=> b!505178 (= e!295716 Unit!15408)))

(declare-fun lt!230136 () Unit!15406)

(declare-fun lt!230133 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15406)

(assert (=> b!505178 (= lt!230136 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230133 #b00000000000000000000000000000000 (index!18526 lt!230132) (x!47544 lt!230132) mask!3524))))

(declare-fun lt!230125 () array!32480)

(declare-fun res!306379 () Bool)

(declare-fun lt!230130 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505178 (= res!306379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230133 lt!230130 lt!230125 mask!3524) (Intermediate!4084 false (index!18526 lt!230132) (x!47544 lt!230132))))))

(declare-fun e!295710 () Bool)

(assert (=> b!505178 (=> (not res!306379) (not e!295710))))

(assert (=> b!505178 e!295710))

(declare-fun b!505179 () Bool)

(declare-fun e!295712 () Bool)

(assert (=> b!505179 (= e!295709 (not e!295712))))

(declare-fun res!306382 () Bool)

(assert (=> b!505179 (=> res!306382 e!295712)))

(declare-fun lt!230129 () SeekEntryResult!4084)

(get-info :version)

(assert (=> b!505179 (= res!306382 (or (= lt!230132 lt!230129) (undefined!4896 lt!230132) (not ((_ is Intermediate!4084) lt!230132))))))

(declare-fun lt!230128 () (_ BitVec 32))

(assert (=> b!505179 (= lt!230129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230128 lt!230130 lt!230125 mask!3524))))

(assert (=> b!505179 (= lt!230132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230133 (select (arr!15620 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505179 (= lt!230128 (toIndex!0 lt!230130 mask!3524))))

(assert (=> b!505179 (= lt!230130 (select (store (arr!15620 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505179 (= lt!230133 (toIndex!0 (select (arr!15620 a!3235) j!176) mask!3524))))

(assert (=> b!505179 (= lt!230125 (array!32481 (store (arr!15620 a!3235) i!1204 k0!2280) (size!15985 a!3235)))))

(declare-fun lt!230137 () SeekEntryResult!4084)

(assert (=> b!505179 (= lt!230137 (Found!4084 j!176))))

(assert (=> b!505179 e!295708))

(declare-fun res!306386 () Bool)

(assert (=> b!505179 (=> (not res!306386) (not e!295708))))

(assert (=> b!505179 (= res!306386 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230126 () Unit!15406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15406)

(assert (=> b!505179 (= lt!230126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505180 () Bool)

(declare-fun Unit!15409 () Unit!15406)

(assert (=> b!505180 (= e!295716 Unit!15409)))

(declare-fun b!505181 () Bool)

(assert (=> b!505181 (= e!295713 true)))

(assert (=> b!505181 (= (seekEntryOrOpen!0 lt!230130 lt!230125 mask!3524) lt!230137)))

(declare-fun lt!230131 () Unit!15406)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15406)

(assert (=> b!505181 (= lt!230131 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230133 #b00000000000000000000000000000000 (index!18526 lt!230132) (x!47544 lt!230132) mask!3524))))

(declare-fun b!505182 () Bool)

(declare-fun res!306378 () Bool)

(assert (=> b!505182 (=> res!306378 e!295713)))

(assert (=> b!505182 (= res!306378 (not (= lt!230129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230133 lt!230130 lt!230125 mask!3524))))))

(declare-fun b!505183 () Bool)

(declare-fun res!306388 () Bool)

(assert (=> b!505183 (=> (not res!306388) (not e!295715))))

(declare-fun arrayContainsKey!0 (array!32480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505183 (= res!306388 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505184 () Bool)

(assert (=> b!505184 (= e!295710 false)))

(declare-fun res!306384 () Bool)

(assert (=> start!45714 (=> (not res!306384) (not e!295715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45714 (= res!306384 (validMask!0 mask!3524))))

(assert (=> start!45714 e!295715))

(assert (=> start!45714 true))

(declare-fun array_inv!11503 (array!32480) Bool)

(assert (=> start!45714 (array_inv!11503 a!3235)))

(declare-fun b!505173 () Bool)

(declare-fun res!306385 () Bool)

(assert (=> b!505173 (=> (not res!306385) (not e!295715))))

(assert (=> b!505173 (= res!306385 (validKeyInArray!0 (select (arr!15620 a!3235) j!176)))))

(declare-fun b!505185 () Bool)

(assert (=> b!505185 (= e!295712 e!295713)))

(declare-fun res!306375 () Bool)

(assert (=> b!505185 (=> res!306375 e!295713)))

(assert (=> b!505185 (= res!306375 (or (bvsgt (x!47544 lt!230132) #b01111111111111111111111111111110) (bvslt lt!230133 #b00000000000000000000000000000000) (bvsge lt!230133 (size!15985 a!3235)) (bvslt (index!18526 lt!230132) #b00000000000000000000000000000000) (bvsge (index!18526 lt!230132) (size!15985 a!3235)) (not (= lt!230132 (Intermediate!4084 false (index!18526 lt!230132) (x!47544 lt!230132))))))))

(assert (=> b!505185 (= (index!18526 lt!230132) i!1204)))

(declare-fun lt!230127 () Unit!15406)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32480 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15406)

(assert (=> b!505185 (= lt!230127 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230133 #b00000000000000000000000000000000 (index!18526 lt!230132) (x!47544 lt!230132) mask!3524))))

(assert (=> b!505185 (and (or (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230135 () Unit!15406)

(assert (=> b!505185 (= lt!230135 e!295716)))

(declare-fun c!59676 () Bool)

(assert (=> b!505185 (= c!59676 (= (select (arr!15620 a!3235) (index!18526 lt!230132)) (select (arr!15620 a!3235) j!176)))))

(assert (=> b!505185 (and (bvslt (x!47544 lt!230132) #b01111111111111111111111111111110) (or (= (select (arr!15620 a!3235) (index!18526 lt!230132)) (select (arr!15620 a!3235) j!176)) (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15620 a!3235) (index!18526 lt!230132)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505186 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32480 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505186 (= e!295711 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230133 (index!18526 lt!230132) (select (arr!15620 a!3235) j!176) a!3235 mask!3524) lt!230137)))))

(assert (= (and start!45714 res!306384) b!505172))

(assert (= (and b!505172 res!306387) b!505173))

(assert (= (and b!505173 res!306385) b!505171))

(assert (= (and b!505171 res!306383) b!505183))

(assert (= (and b!505183 res!306388) b!505176))

(assert (= (and b!505176 res!306380) b!505174))

(assert (= (and b!505174 res!306381) b!505177))

(assert (= (and b!505177 res!306389) b!505179))

(assert (= (and b!505179 res!306386) b!505175))

(assert (= (and b!505179 (not res!306382)) b!505185))

(assert (= (and b!505185 c!59676) b!505178))

(assert (= (and b!505185 (not c!59676)) b!505180))

(assert (= (and b!505178 res!306379) b!505184))

(assert (= (and b!505185 (not res!306375)) b!505170))

(assert (= (and b!505170 res!306376) b!505186))

(assert (= (and b!505170 (not res!306377)) b!505182))

(assert (= (and b!505182 (not res!306378)) b!505181))

(declare-fun m!485353 () Bool)

(assert (=> b!505177 m!485353))

(declare-fun m!485355 () Bool)

(assert (=> b!505186 m!485355))

(assert (=> b!505186 m!485355))

(declare-fun m!485357 () Bool)

(assert (=> b!505186 m!485357))

(declare-fun m!485359 () Bool)

(assert (=> b!505178 m!485359))

(declare-fun m!485361 () Bool)

(assert (=> b!505178 m!485361))

(declare-fun m!485363 () Bool)

(assert (=> b!505174 m!485363))

(assert (=> b!505182 m!485361))

(declare-fun m!485365 () Bool)

(assert (=> b!505179 m!485365))

(declare-fun m!485367 () Bool)

(assert (=> b!505179 m!485367))

(declare-fun m!485369 () Bool)

(assert (=> b!505179 m!485369))

(assert (=> b!505179 m!485355))

(declare-fun m!485371 () Bool)

(assert (=> b!505179 m!485371))

(assert (=> b!505179 m!485355))

(declare-fun m!485373 () Bool)

(assert (=> b!505179 m!485373))

(assert (=> b!505179 m!485355))

(declare-fun m!485375 () Bool)

(assert (=> b!505179 m!485375))

(declare-fun m!485377 () Bool)

(assert (=> b!505179 m!485377))

(declare-fun m!485379 () Bool)

(assert (=> b!505179 m!485379))

(declare-fun m!485381 () Bool)

(assert (=> b!505183 m!485381))

(declare-fun m!485383 () Bool)

(assert (=> b!505185 m!485383))

(declare-fun m!485385 () Bool)

(assert (=> b!505185 m!485385))

(assert (=> b!505185 m!485355))

(declare-fun m!485387 () Bool)

(assert (=> start!45714 m!485387))

(declare-fun m!485389 () Bool)

(assert (=> start!45714 m!485389))

(declare-fun m!485391 () Bool)

(assert (=> b!505171 m!485391))

(declare-fun m!485393 () Bool)

(assert (=> b!505176 m!485393))

(assert (=> b!505173 m!485355))

(assert (=> b!505173 m!485355))

(declare-fun m!485395 () Bool)

(assert (=> b!505173 m!485395))

(declare-fun m!485397 () Bool)

(assert (=> b!505181 m!485397))

(declare-fun m!485399 () Bool)

(assert (=> b!505181 m!485399))

(assert (=> b!505175 m!485355))

(assert (=> b!505175 m!485355))

(declare-fun m!485401 () Bool)

(assert (=> b!505175 m!485401))

(check-sat (not b!505186) (not b!505175) (not b!505183) (not start!45714) (not b!505174) (not b!505185) (not b!505176) (not b!505182) (not b!505171) (not b!505181) (not b!505179) (not b!505177) (not b!505178) (not b!505173))
(check-sat)
