; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45420 () Bool)

(assert start!45420)

(declare-fun b!499412 () Bool)

(declare-fun res!301485 () Bool)

(declare-fun e!292626 () Bool)

(assert (=> b!499412 (=> (not res!301485) (not e!292626))))

(declare-datatypes ((array!32255 0))(
  ( (array!32256 (arr!15509 (Array (_ BitVec 32) (_ BitVec 64))) (size!15874 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32255)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32255 (_ BitVec 32)) Bool)

(assert (=> b!499412 (= res!301485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499413 () Bool)

(declare-fun res!301486 () Bool)

(assert (=> b!499413 (=> (not res!301486) (not e!292626))))

(declare-datatypes ((List!9706 0))(
  ( (Nil!9703) (Cons!9702 (h!10576 (_ BitVec 64)) (t!15925 List!9706)) )
))
(declare-fun arrayNoDuplicates!0 (array!32255 (_ BitVec 32) List!9706) Bool)

(assert (=> b!499413 (= res!301486 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9703))))

(declare-fun b!499414 () Bool)

(declare-datatypes ((Unit!14962 0))(
  ( (Unit!14963) )
))
(declare-fun e!292630 () Unit!14962)

(declare-fun Unit!14964 () Unit!14962)

(assert (=> b!499414 (= e!292630 Unit!14964)))

(declare-fun b!499415 () Bool)

(declare-fun Unit!14965 () Unit!14962)

(assert (=> b!499415 (= e!292630 Unit!14965)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226375 () Unit!14962)

(declare-fun lt!226380 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3973 0))(
  ( (MissingZero!3973 (index!18074 (_ BitVec 32))) (Found!3973 (index!18075 (_ BitVec 32))) (Intermediate!3973 (undefined!4785 Bool) (index!18076 (_ BitVec 32)) (x!47125 (_ BitVec 32))) (Undefined!3973) (MissingVacant!3973 (index!18077 (_ BitVec 32))) )
))
(declare-fun lt!226382 () SeekEntryResult!3973)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32255 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14962)

(assert (=> b!499415 (= lt!226375 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226380 #b00000000000000000000000000000000 (index!18076 lt!226382) (x!47125 lt!226382) mask!3524))))

(declare-fun lt!226383 () array!32255)

(declare-fun res!301496 () Bool)

(declare-fun lt!226377 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32255 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!499415 (= res!301496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226380 lt!226377 lt!226383 mask!3524) (Intermediate!3973 false (index!18076 lt!226382) (x!47125 lt!226382))))))

(declare-fun e!292627 () Bool)

(assert (=> b!499415 (=> (not res!301496) (not e!292627))))

(assert (=> b!499415 e!292627))

(declare-fun b!499416 () Bool)

(declare-fun e!292631 () Bool)

(assert (=> b!499416 (= e!292626 (not e!292631))))

(declare-fun res!301492 () Bool)

(assert (=> b!499416 (=> res!301492 e!292631)))

(declare-fun lt!226376 () (_ BitVec 32))

(assert (=> b!499416 (= res!301492 (= lt!226382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226376 lt!226377 lt!226383 mask!3524)))))

(assert (=> b!499416 (= lt!226382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226380 (select (arr!15509 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499416 (= lt!226376 (toIndex!0 lt!226377 mask!3524))))

(assert (=> b!499416 (= lt!226377 (select (store (arr!15509 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499416 (= lt!226380 (toIndex!0 (select (arr!15509 a!3235) j!176) mask!3524))))

(assert (=> b!499416 (= lt!226383 (array!32256 (store (arr!15509 a!3235) i!1204 k0!2280) (size!15874 a!3235)))))

(declare-fun e!292632 () Bool)

(assert (=> b!499416 e!292632))

(declare-fun res!301487 () Bool)

(assert (=> b!499416 (=> (not res!301487) (not e!292632))))

(assert (=> b!499416 (= res!301487 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226381 () Unit!14962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14962)

(assert (=> b!499416 (= lt!226381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499417 () Bool)

(declare-fun res!301491 () Bool)

(declare-fun e!292629 () Bool)

(assert (=> b!499417 (=> (not res!301491) (not e!292629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499417 (= res!301491 (validKeyInArray!0 k0!2280))))

(declare-fun b!499418 () Bool)

(declare-fun res!301489 () Bool)

(assert (=> b!499418 (=> res!301489 e!292631)))

(get-info :version)

(assert (=> b!499418 (= res!301489 (or (undefined!4785 lt!226382) (not ((_ is Intermediate!3973) lt!226382))))))

(declare-fun b!499419 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32255 (_ BitVec 32)) SeekEntryResult!3973)

(assert (=> b!499419 (= e!292632 (= (seekEntryOrOpen!0 (select (arr!15509 a!3235) j!176) a!3235 mask!3524) (Found!3973 j!176)))))

(declare-fun res!301494 () Bool)

(assert (=> start!45420 (=> (not res!301494) (not e!292629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45420 (= res!301494 (validMask!0 mask!3524))))

(assert (=> start!45420 e!292629))

(assert (=> start!45420 true))

(declare-fun array_inv!11392 (array!32255) Bool)

(assert (=> start!45420 (array_inv!11392 a!3235)))

(declare-fun b!499420 () Bool)

(declare-fun res!301493 () Bool)

(assert (=> b!499420 (=> (not res!301493) (not e!292629))))

(declare-fun arrayContainsKey!0 (array!32255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499420 (= res!301493 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499421 () Bool)

(declare-fun e!292625 () Bool)

(assert (=> b!499421 (= e!292625 true)))

(declare-fun lt!226379 () SeekEntryResult!3973)

(assert (=> b!499421 (= lt!226379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226380 lt!226377 lt!226383 mask!3524))))

(declare-fun b!499422 () Bool)

(assert (=> b!499422 (= e!292631 e!292625)))

(declare-fun res!301484 () Bool)

(assert (=> b!499422 (=> res!301484 e!292625)))

(assert (=> b!499422 (= res!301484 (or (bvsgt #b00000000000000000000000000000000 (x!47125 lt!226382)) (bvsgt (x!47125 lt!226382) #b01111111111111111111111111111110) (bvslt lt!226380 #b00000000000000000000000000000000) (bvsge lt!226380 (size!15874 a!3235)) (bvslt (index!18076 lt!226382) #b00000000000000000000000000000000) (bvsge (index!18076 lt!226382) (size!15874 a!3235)) (not (= lt!226382 (Intermediate!3973 false (index!18076 lt!226382) (x!47125 lt!226382))))))))

(assert (=> b!499422 (and (or (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226378 () Unit!14962)

(assert (=> b!499422 (= lt!226378 e!292630)))

(declare-fun c!59241 () Bool)

(assert (=> b!499422 (= c!59241 (= (select (arr!15509 a!3235) (index!18076 lt!226382)) (select (arr!15509 a!3235) j!176)))))

(assert (=> b!499422 (and (bvslt (x!47125 lt!226382) #b01111111111111111111111111111110) (or (= (select (arr!15509 a!3235) (index!18076 lt!226382)) (select (arr!15509 a!3235) j!176)) (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15509 a!3235) (index!18076 lt!226382)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499423 () Bool)

(assert (=> b!499423 (= e!292627 false)))

(declare-fun b!499424 () Bool)

(declare-fun res!301488 () Bool)

(assert (=> b!499424 (=> (not res!301488) (not e!292629))))

(assert (=> b!499424 (= res!301488 (validKeyInArray!0 (select (arr!15509 a!3235) j!176)))))

(declare-fun b!499425 () Bool)

(declare-fun res!301495 () Bool)

(assert (=> b!499425 (=> (not res!301495) (not e!292629))))

(assert (=> b!499425 (= res!301495 (and (= (size!15874 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15874 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15874 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499426 () Bool)

(assert (=> b!499426 (= e!292629 e!292626)))

(declare-fun res!301490 () Bool)

(assert (=> b!499426 (=> (not res!301490) (not e!292626))))

(declare-fun lt!226384 () SeekEntryResult!3973)

(assert (=> b!499426 (= res!301490 (or (= lt!226384 (MissingZero!3973 i!1204)) (= lt!226384 (MissingVacant!3973 i!1204))))))

(assert (=> b!499426 (= lt!226384 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45420 res!301494) b!499425))

(assert (= (and b!499425 res!301495) b!499424))

(assert (= (and b!499424 res!301488) b!499417))

(assert (= (and b!499417 res!301491) b!499420))

(assert (= (and b!499420 res!301493) b!499426))

(assert (= (and b!499426 res!301490) b!499412))

(assert (= (and b!499412 res!301485) b!499413))

(assert (= (and b!499413 res!301486) b!499416))

(assert (= (and b!499416 res!301487) b!499419))

(assert (= (and b!499416 (not res!301492)) b!499418))

(assert (= (and b!499418 (not res!301489)) b!499422))

(assert (= (and b!499422 c!59241) b!499415))

(assert (= (and b!499422 (not c!59241)) b!499414))

(assert (= (and b!499415 res!301496) b!499423))

(assert (= (and b!499422 (not res!301484)) b!499421))

(declare-fun m!480115 () Bool)

(assert (=> b!499416 m!480115))

(declare-fun m!480117 () Bool)

(assert (=> b!499416 m!480117))

(declare-fun m!480119 () Bool)

(assert (=> b!499416 m!480119))

(declare-fun m!480121 () Bool)

(assert (=> b!499416 m!480121))

(declare-fun m!480123 () Bool)

(assert (=> b!499416 m!480123))

(declare-fun m!480125 () Bool)

(assert (=> b!499416 m!480125))

(declare-fun m!480127 () Bool)

(assert (=> b!499416 m!480127))

(assert (=> b!499416 m!480125))

(declare-fun m!480129 () Bool)

(assert (=> b!499416 m!480129))

(assert (=> b!499416 m!480125))

(declare-fun m!480131 () Bool)

(assert (=> b!499416 m!480131))

(declare-fun m!480133 () Bool)

(assert (=> b!499421 m!480133))

(declare-fun m!480135 () Bool)

(assert (=> b!499413 m!480135))

(declare-fun m!480137 () Bool)

(assert (=> b!499420 m!480137))

(declare-fun m!480139 () Bool)

(assert (=> b!499412 m!480139))

(declare-fun m!480141 () Bool)

(assert (=> b!499422 m!480141))

(assert (=> b!499422 m!480125))

(declare-fun m!480143 () Bool)

(assert (=> b!499417 m!480143))

(declare-fun m!480145 () Bool)

(assert (=> b!499415 m!480145))

(assert (=> b!499415 m!480133))

(declare-fun m!480147 () Bool)

(assert (=> start!45420 m!480147))

(declare-fun m!480149 () Bool)

(assert (=> start!45420 m!480149))

(assert (=> b!499424 m!480125))

(assert (=> b!499424 m!480125))

(declare-fun m!480151 () Bool)

(assert (=> b!499424 m!480151))

(declare-fun m!480153 () Bool)

(assert (=> b!499426 m!480153))

(assert (=> b!499419 m!480125))

(assert (=> b!499419 m!480125))

(declare-fun m!480155 () Bool)

(assert (=> b!499419 m!480155))

(check-sat (not b!499424) (not b!499417) (not b!499415) (not b!499416) (not start!45420) (not b!499412) (not b!499420) (not b!499426) (not b!499419) (not b!499421) (not b!499413))
(check-sat)
