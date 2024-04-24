; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46190 () Bool)

(assert start!46190)

(declare-fun b!511430 () Bool)

(declare-fun res!312147 () Bool)

(declare-fun e!298845 () Bool)

(assert (=> b!511430 (=> (not res!312147) (not e!298845))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32845 0))(
  ( (array!32846 (arr!15799 (Array (_ BitVec 32) (_ BitVec 64))) (size!16163 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32845)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511430 (= res!312147 (and (= (size!16163 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16163 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16163 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511431 () Bool)

(declare-fun res!312154 () Bool)

(assert (=> b!511431 (=> (not res!312154) (not e!298845))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511431 (= res!312154 (validKeyInArray!0 k0!2280))))

(declare-fun b!511432 () Bool)

(declare-fun res!312148 () Bool)

(assert (=> b!511432 (=> (not res!312148) (not e!298845))))

(declare-fun arrayContainsKey!0 (array!32845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511432 (= res!312148 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511433 () Bool)

(declare-fun res!312145 () Bool)

(declare-fun e!298846 () Bool)

(assert (=> b!511433 (=> (not res!312145) (not e!298846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32845 (_ BitVec 32)) Bool)

(assert (=> b!511433 (= res!312145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511434 () Bool)

(declare-fun res!312150 () Bool)

(declare-fun e!298847 () Bool)

(assert (=> b!511434 (=> res!312150 e!298847)))

(declare-datatypes ((SeekEntryResult!4222 0))(
  ( (MissingZero!4222 (index!19076 (_ BitVec 32))) (Found!4222 (index!19077 (_ BitVec 32))) (Intermediate!4222 (undefined!5034 Bool) (index!19078 (_ BitVec 32)) (x!48178 (_ BitVec 32))) (Undefined!4222) (MissingVacant!4222 (index!19079 (_ BitVec 32))) )
))
(declare-fun lt!234025 () SeekEntryResult!4222)

(get-info :version)

(assert (=> b!511434 (= res!312150 (or (not ((_ is Intermediate!4222) lt!234025)) (not (undefined!5034 lt!234025))))))

(declare-fun b!511429 () Bool)

(assert (=> b!511429 (= e!298847 true)))

(declare-fun lt!234023 () SeekEntryResult!4222)

(assert (=> b!511429 (= lt!234023 Undefined!4222)))

(declare-fun res!312153 () Bool)

(assert (=> start!46190 (=> (not res!312153) (not e!298845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46190 (= res!312153 (validMask!0 mask!3524))))

(assert (=> start!46190 e!298845))

(assert (=> start!46190 true))

(declare-fun array_inv!11658 (array!32845) Bool)

(assert (=> start!46190 (array_inv!11658 a!3235)))

(declare-fun b!511435 () Bool)

(assert (=> b!511435 (= e!298845 e!298846)))

(declare-fun res!312151 () Bool)

(assert (=> b!511435 (=> (not res!312151) (not e!298846))))

(declare-fun lt!234024 () SeekEntryResult!4222)

(assert (=> b!511435 (= res!312151 (or (= lt!234024 (MissingZero!4222 i!1204)) (= lt!234024 (MissingVacant!4222 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32845 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!511435 (= lt!234024 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511436 () Bool)

(assert (=> b!511436 (= e!298846 (not e!298847))))

(declare-fun res!312149 () Bool)

(assert (=> b!511436 (=> res!312149 e!298847)))

(declare-fun lt!234026 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32845 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!511436 (= res!312149 (= lt!234025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234026 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) (array!32846 (store (arr!15799 a!3235) i!1204 k0!2280) (size!16163 a!3235)) mask!3524)))))

(declare-fun lt!234027 () (_ BitVec 32))

(assert (=> b!511436 (= lt!234025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234027 (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511436 (= lt!234026 (toIndex!0 (select (store (arr!15799 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511436 (= lt!234027 (toIndex!0 (select (arr!15799 a!3235) j!176) mask!3524))))

(assert (=> b!511436 (= lt!234023 (Found!4222 j!176))))

(assert (=> b!511436 (= lt!234023 (seekEntryOrOpen!0 (select (arr!15799 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511436 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15763 0))(
  ( (Unit!15764) )
))
(declare-fun lt!234028 () Unit!15763)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15763)

(assert (=> b!511436 (= lt!234028 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511437 () Bool)

(declare-fun res!312152 () Bool)

(assert (=> b!511437 (=> (not res!312152) (not e!298846))))

(declare-datatypes ((List!9864 0))(
  ( (Nil!9861) (Cons!9860 (h!10740 (_ BitVec 64)) (t!16084 List!9864)) )
))
(declare-fun arrayNoDuplicates!0 (array!32845 (_ BitVec 32) List!9864) Bool)

(assert (=> b!511437 (= res!312152 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9861))))

(declare-fun b!511438 () Bool)

(declare-fun res!312146 () Bool)

(assert (=> b!511438 (=> (not res!312146) (not e!298845))))

(assert (=> b!511438 (= res!312146 (validKeyInArray!0 (select (arr!15799 a!3235) j!176)))))

(assert (= (and start!46190 res!312153) b!511430))

(assert (= (and b!511430 res!312147) b!511438))

(assert (= (and b!511438 res!312146) b!511431))

(assert (= (and b!511431 res!312154) b!511432))

(assert (= (and b!511432 res!312148) b!511435))

(assert (= (and b!511435 res!312151) b!511433))

(assert (= (and b!511433 res!312145) b!511437))

(assert (= (and b!511437 res!312152) b!511436))

(assert (= (and b!511436 (not res!312149)) b!511434))

(assert (= (and b!511434 (not res!312150)) b!511429))

(declare-fun m!493141 () Bool)

(assert (=> b!511435 m!493141))

(declare-fun m!493143 () Bool)

(assert (=> b!511436 m!493143))

(declare-fun m!493145 () Bool)

(assert (=> b!511436 m!493145))

(declare-fun m!493147 () Bool)

(assert (=> b!511436 m!493147))

(declare-fun m!493149 () Bool)

(assert (=> b!511436 m!493149))

(assert (=> b!511436 m!493145))

(declare-fun m!493151 () Bool)

(assert (=> b!511436 m!493151))

(declare-fun m!493153 () Bool)

(assert (=> b!511436 m!493153))

(assert (=> b!511436 m!493151))

(declare-fun m!493155 () Bool)

(assert (=> b!511436 m!493155))

(assert (=> b!511436 m!493151))

(declare-fun m!493157 () Bool)

(assert (=> b!511436 m!493157))

(assert (=> b!511436 m!493151))

(declare-fun m!493159 () Bool)

(assert (=> b!511436 m!493159))

(assert (=> b!511436 m!493145))

(declare-fun m!493161 () Bool)

(assert (=> b!511436 m!493161))

(declare-fun m!493163 () Bool)

(assert (=> start!46190 m!493163))

(declare-fun m!493165 () Bool)

(assert (=> start!46190 m!493165))

(declare-fun m!493167 () Bool)

(assert (=> b!511432 m!493167))

(assert (=> b!511438 m!493151))

(assert (=> b!511438 m!493151))

(declare-fun m!493169 () Bool)

(assert (=> b!511438 m!493169))

(declare-fun m!493171 () Bool)

(assert (=> b!511437 m!493171))

(declare-fun m!493173 () Bool)

(assert (=> b!511431 m!493173))

(declare-fun m!493175 () Bool)

(assert (=> b!511433 m!493175))

(check-sat (not b!511437) (not b!511432) (not b!511436) (not b!511433) (not b!511431) (not start!46190) (not b!511438) (not b!511435))
(check-sat)
