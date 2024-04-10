; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46202 () Bool)

(assert start!46202)

(declare-fun b!511520 () Bool)

(declare-fun res!312188 () Bool)

(declare-fun e!298898 () Bool)

(assert (=> b!511520 (=> (not res!312188) (not e!298898))))

(declare-datatypes ((array!32856 0))(
  ( (array!32857 (arr!15805 (Array (_ BitVec 32) (_ BitVec 64))) (size!16169 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32856)

(declare-datatypes ((List!9963 0))(
  ( (Nil!9960) (Cons!9959 (h!10839 (_ BitVec 64)) (t!16191 List!9963)) )
))
(declare-fun arrayNoDuplicates!0 (array!32856 (_ BitVec 32) List!9963) Bool)

(assert (=> b!511520 (= res!312188 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9960))))

(declare-fun b!511521 () Bool)

(declare-fun res!312183 () Bool)

(declare-fun e!298896 () Bool)

(assert (=> b!511521 (=> (not res!312183) (not e!298896))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511521 (= res!312183 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511522 () Bool)

(declare-fun res!312186 () Bool)

(assert (=> b!511522 (=> (not res!312186) (not e!298896))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511522 (= res!312186 (validKeyInArray!0 (select (arr!15805 a!3235) j!176)))))

(declare-fun b!511523 () Bool)

(declare-fun e!298899 () Bool)

(assert (=> b!511523 (= e!298898 (not e!298899))))

(declare-fun res!312191 () Bool)

(assert (=> b!511523 (=> res!312191 e!298899)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234031 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4272 0))(
  ( (MissingZero!4272 (index!19276 (_ BitVec 32))) (Found!4272 (index!19277 (_ BitVec 32))) (Intermediate!4272 (undefined!5084 Bool) (index!19278 (_ BitVec 32)) (x!48231 (_ BitVec 32))) (Undefined!4272) (MissingVacant!4272 (index!19279 (_ BitVec 32))) )
))
(declare-fun lt!234032 () SeekEntryResult!4272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32856 (_ BitVec 32)) SeekEntryResult!4272)

(assert (=> b!511523 (= res!312191 (= lt!234032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234031 (select (store (arr!15805 a!3235) i!1204 k0!2280) j!176) (array!32857 (store (arr!15805 a!3235) i!1204 k0!2280) (size!16169 a!3235)) mask!3524)))))

(declare-fun lt!234029 () (_ BitVec 32))

(assert (=> b!511523 (= lt!234032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234029 (select (arr!15805 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511523 (= lt!234031 (toIndex!0 (select (store (arr!15805 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511523 (= lt!234029 (toIndex!0 (select (arr!15805 a!3235) j!176) mask!3524))))

(declare-fun lt!234034 () SeekEntryResult!4272)

(assert (=> b!511523 (= lt!234034 (Found!4272 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32856 (_ BitVec 32)) SeekEntryResult!4272)

(assert (=> b!511523 (= lt!234034 (seekEntryOrOpen!0 (select (arr!15805 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32856 (_ BitVec 32)) Bool)

(assert (=> b!511523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15802 0))(
  ( (Unit!15803) )
))
(declare-fun lt!234033 () Unit!15802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15802)

(assert (=> b!511523 (= lt!234033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511524 () Bool)

(declare-fun res!312184 () Bool)

(assert (=> b!511524 (=> (not res!312184) (not e!298896))))

(assert (=> b!511524 (= res!312184 (validKeyInArray!0 k0!2280))))

(declare-fun b!511525 () Bool)

(declare-fun res!312187 () Bool)

(assert (=> b!511525 (=> (not res!312187) (not e!298896))))

(assert (=> b!511525 (= res!312187 (and (= (size!16169 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16169 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16169 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511526 () Bool)

(assert (=> b!511526 (= e!298896 e!298898)))

(declare-fun res!312190 () Bool)

(assert (=> b!511526 (=> (not res!312190) (not e!298898))))

(declare-fun lt!234030 () SeekEntryResult!4272)

(assert (=> b!511526 (= res!312190 (or (= lt!234030 (MissingZero!4272 i!1204)) (= lt!234030 (MissingVacant!4272 i!1204))))))

(assert (=> b!511526 (= lt!234030 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511527 () Bool)

(assert (=> b!511527 (= e!298899 true)))

(assert (=> b!511527 (= lt!234034 Undefined!4272)))

(declare-fun b!511528 () Bool)

(declare-fun res!312182 () Bool)

(assert (=> b!511528 (=> (not res!312182) (not e!298898))))

(assert (=> b!511528 (= res!312182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!312189 () Bool)

(assert (=> start!46202 (=> (not res!312189) (not e!298896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46202 (= res!312189 (validMask!0 mask!3524))))

(assert (=> start!46202 e!298896))

(assert (=> start!46202 true))

(declare-fun array_inv!11601 (array!32856) Bool)

(assert (=> start!46202 (array_inv!11601 a!3235)))

(declare-fun b!511529 () Bool)

(declare-fun res!312185 () Bool)

(assert (=> b!511529 (=> res!312185 e!298899)))

(get-info :version)

(assert (=> b!511529 (= res!312185 (or (not ((_ is Intermediate!4272) lt!234032)) (not (undefined!5084 lt!234032))))))

(assert (= (and start!46202 res!312189) b!511525))

(assert (= (and b!511525 res!312187) b!511522))

(assert (= (and b!511522 res!312186) b!511524))

(assert (= (and b!511524 res!312184) b!511521))

(assert (= (and b!511521 res!312183) b!511526))

(assert (= (and b!511526 res!312190) b!511528))

(assert (= (and b!511528 res!312182) b!511520))

(assert (= (and b!511520 res!312188) b!511523))

(assert (= (and b!511523 (not res!312191)) b!511529))

(assert (= (and b!511529 (not res!312185)) b!511527))

(declare-fun m!492993 () Bool)

(assert (=> b!511524 m!492993))

(declare-fun m!492995 () Bool)

(assert (=> b!511528 m!492995))

(declare-fun m!492997 () Bool)

(assert (=> b!511526 m!492997))

(declare-fun m!492999 () Bool)

(assert (=> b!511521 m!492999))

(declare-fun m!493001 () Bool)

(assert (=> start!46202 m!493001))

(declare-fun m!493003 () Bool)

(assert (=> start!46202 m!493003))

(declare-fun m!493005 () Bool)

(assert (=> b!511520 m!493005))

(declare-fun m!493007 () Bool)

(assert (=> b!511523 m!493007))

(declare-fun m!493009 () Bool)

(assert (=> b!511523 m!493009))

(declare-fun m!493011 () Bool)

(assert (=> b!511523 m!493011))

(declare-fun m!493013 () Bool)

(assert (=> b!511523 m!493013))

(assert (=> b!511523 m!493009))

(declare-fun m!493015 () Bool)

(assert (=> b!511523 m!493015))

(declare-fun m!493017 () Bool)

(assert (=> b!511523 m!493017))

(assert (=> b!511523 m!493015))

(declare-fun m!493019 () Bool)

(assert (=> b!511523 m!493019))

(assert (=> b!511523 m!493015))

(declare-fun m!493021 () Bool)

(assert (=> b!511523 m!493021))

(assert (=> b!511523 m!493009))

(declare-fun m!493023 () Bool)

(assert (=> b!511523 m!493023))

(assert (=> b!511523 m!493015))

(declare-fun m!493025 () Bool)

(assert (=> b!511523 m!493025))

(assert (=> b!511522 m!493015))

(assert (=> b!511522 m!493015))

(declare-fun m!493027 () Bool)

(assert (=> b!511522 m!493027))

(check-sat (not b!511526) (not b!511522) (not b!511520) (not b!511523) (not b!511521) (not b!511528) (not start!46202) (not b!511524))
(check-sat)
