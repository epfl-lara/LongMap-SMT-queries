; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45668 () Bool)

(assert start!45668)

(declare-fun b!504156 () Bool)

(declare-fun e!295200 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229544 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4015 0))(
  ( (MissingZero!4015 (index!18248 (_ BitVec 32))) (Found!4015 (index!18249 (_ BitVec 32))) (Intermediate!4015 (undefined!4827 Bool) (index!18250 (_ BitVec 32)) (x!47413 (_ BitVec 32))) (Undefined!4015) (MissingVacant!4015 (index!18251 (_ BitVec 32))) )
))
(declare-fun lt!229547 () SeekEntryResult!4015)

(declare-datatypes ((array!32425 0))(
  ( (array!32426 (arr!15592 (Array (_ BitVec 32) (_ BitVec 64))) (size!15956 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32425)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32425 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!504156 (= e!295200 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229544 (index!18250 lt!229547) (select (arr!15592 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176))))))

(declare-fun b!504157 () Bool)

(declare-fun res!305420 () Bool)

(declare-fun e!295202 () Bool)

(assert (=> b!504157 (=> (not res!305420) (not e!295202))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504157 (= res!305420 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504158 () Bool)

(declare-fun e!295197 () Bool)

(declare-fun e!295203 () Bool)

(assert (=> b!504158 (= e!295197 (not e!295203))))

(declare-fun res!305425 () Bool)

(assert (=> b!504158 (=> res!305425 e!295203)))

(declare-fun lt!229548 () array!32425)

(declare-fun lt!229545 () (_ BitVec 32))

(declare-fun lt!229543 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32425 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!504158 (= res!305425 (= lt!229547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229545 lt!229543 lt!229548 mask!3524)))))

(assert (=> b!504158 (= lt!229547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229544 (select (arr!15592 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504158 (= lt!229545 (toIndex!0 lt!229543 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504158 (= lt!229543 (select (store (arr!15592 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504158 (= lt!229544 (toIndex!0 (select (arr!15592 a!3235) j!176) mask!3524))))

(assert (=> b!504158 (= lt!229548 (array!32426 (store (arr!15592 a!3235) i!1204 k0!2280) (size!15956 a!3235)))))

(declare-fun e!295195 () Bool)

(assert (=> b!504158 e!295195))

(declare-fun res!305426 () Bool)

(assert (=> b!504158 (=> (not res!305426) (not e!295195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32425 (_ BitVec 32)) Bool)

(assert (=> b!504158 (= res!305426 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15295 0))(
  ( (Unit!15296) )
))
(declare-fun lt!229542 () Unit!15295)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15295)

(assert (=> b!504158 (= lt!229542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32425 (_ BitVec 32)) SeekEntryResult!4015)

(assert (=> b!504159 (= e!295195 (= (seekEntryOrOpen!0 (select (arr!15592 a!3235) j!176) a!3235 mask!3524) (Found!4015 j!176)))))

(declare-fun b!504160 () Bool)

(declare-fun e!295199 () Bool)

(assert (=> b!504160 (= e!295199 false)))

(declare-fun b!504161 () Bool)

(declare-fun res!305430 () Bool)

(assert (=> b!504161 (=> (not res!305430) (not e!295202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504161 (= res!305430 (validKeyInArray!0 k0!2280))))

(declare-fun b!504162 () Bool)

(declare-fun res!305427 () Bool)

(assert (=> b!504162 (=> (not res!305427) (not e!295197))))

(declare-datatypes ((List!9657 0))(
  ( (Nil!9654) (Cons!9653 (h!10530 (_ BitVec 64)) (t!15877 List!9657)) )
))
(declare-fun arrayNoDuplicates!0 (array!32425 (_ BitVec 32) List!9657) Bool)

(assert (=> b!504162 (= res!305427 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9654))))

(declare-fun b!504163 () Bool)

(declare-fun e!295198 () Unit!15295)

(declare-fun Unit!15297 () Unit!15295)

(assert (=> b!504163 (= e!295198 Unit!15297)))

(declare-fun lt!229546 () Unit!15295)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15295)

(assert (=> b!504163 (= lt!229546 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229544 #b00000000000000000000000000000000 (index!18250 lt!229547) (x!47413 lt!229547) mask!3524))))

(declare-fun res!305421 () Bool)

(assert (=> b!504163 (= res!305421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229544 lt!229543 lt!229548 mask!3524) (Intermediate!4015 false (index!18250 lt!229547) (x!47413 lt!229547))))))

(assert (=> b!504163 (=> (not res!305421) (not e!295199))))

(assert (=> b!504163 e!295199))

(declare-fun b!504164 () Bool)

(declare-fun res!305422 () Bool)

(assert (=> b!504164 (=> res!305422 e!295203)))

(get-info :version)

(assert (=> b!504164 (= res!305422 (or (undefined!4827 lt!229547) (not ((_ is Intermediate!4015) lt!229547))))))

(declare-fun b!504165 () Bool)

(declare-fun res!305417 () Bool)

(assert (=> b!504165 (=> (not res!305417) (not e!295197))))

(assert (=> b!504165 (= res!305417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504166 () Bool)

(declare-fun Unit!15298 () Unit!15295)

(assert (=> b!504166 (= e!295198 Unit!15298)))

(declare-fun b!504167 () Bool)

(declare-fun res!305419 () Bool)

(assert (=> b!504167 (=> (not res!305419) (not e!295202))))

(assert (=> b!504167 (= res!305419 (validKeyInArray!0 (select (arr!15592 a!3235) j!176)))))

(declare-fun b!504168 () Bool)

(declare-fun res!305423 () Bool)

(declare-fun e!295196 () Bool)

(assert (=> b!504168 (=> res!305423 e!295196)))

(assert (=> b!504168 (= res!305423 e!295200)))

(declare-fun res!305429 () Bool)

(assert (=> b!504168 (=> (not res!305429) (not e!295200))))

(assert (=> b!504168 (= res!305429 (bvsgt #b00000000000000000000000000000000 (x!47413 lt!229547)))))

(declare-fun res!305418 () Bool)

(assert (=> start!45668 (=> (not res!305418) (not e!295202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45668 (= res!305418 (validMask!0 mask!3524))))

(assert (=> start!45668 e!295202))

(assert (=> start!45668 true))

(declare-fun array_inv!11451 (array!32425) Bool)

(assert (=> start!45668 (array_inv!11451 a!3235)))

(declare-fun b!504169 () Bool)

(assert (=> b!504169 (= e!295203 e!295196)))

(declare-fun res!305428 () Bool)

(assert (=> b!504169 (=> res!305428 e!295196)))

(assert (=> b!504169 (= res!305428 (or (bvsgt (x!47413 lt!229547) #b01111111111111111111111111111110) (bvslt lt!229544 #b00000000000000000000000000000000) (bvsge lt!229544 (size!15956 a!3235)) (bvslt (index!18250 lt!229547) #b00000000000000000000000000000000) (bvsge (index!18250 lt!229547) (size!15956 a!3235)) (not (= lt!229547 (Intermediate!4015 false (index!18250 lt!229547) (x!47413 lt!229547))))))))

(assert (=> b!504169 (= (index!18250 lt!229547) i!1204)))

(declare-fun lt!229539 () Unit!15295)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15295)

(assert (=> b!504169 (= lt!229539 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229544 #b00000000000000000000000000000000 (index!18250 lt!229547) (x!47413 lt!229547) mask!3524))))

(assert (=> b!504169 (and (or (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229549 () Unit!15295)

(assert (=> b!504169 (= lt!229549 e!295198)))

(declare-fun c!59648 () Bool)

(assert (=> b!504169 (= c!59648 (= (select (arr!15592 a!3235) (index!18250 lt!229547)) (select (arr!15592 a!3235) j!176)))))

(assert (=> b!504169 (and (bvslt (x!47413 lt!229547) #b01111111111111111111111111111110) (or (= (select (arr!15592 a!3235) (index!18250 lt!229547)) (select (arr!15592 a!3235) j!176)) (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15592 a!3235) (index!18250 lt!229547)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504170 () Bool)

(declare-fun res!305424 () Bool)

(assert (=> b!504170 (=> (not res!305424) (not e!295202))))

(assert (=> b!504170 (= res!305424 (and (= (size!15956 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15956 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15956 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504171 () Bool)

(assert (=> b!504171 (= e!295202 e!295197)))

(declare-fun res!305431 () Bool)

(assert (=> b!504171 (=> (not res!305431) (not e!295197))))

(declare-fun lt!229541 () SeekEntryResult!4015)

(assert (=> b!504171 (= res!305431 (or (= lt!229541 (MissingZero!4015 i!1204)) (= lt!229541 (MissingVacant!4015 i!1204))))))

(assert (=> b!504171 (= lt!229541 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504172 () Bool)

(assert (=> b!504172 (= e!295196 true)))

(declare-fun lt!229540 () SeekEntryResult!4015)

(assert (=> b!504172 (= lt!229540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229544 lt!229543 lt!229548 mask!3524))))

(assert (= (and start!45668 res!305418) b!504170))

(assert (= (and b!504170 res!305424) b!504167))

(assert (= (and b!504167 res!305419) b!504161))

(assert (= (and b!504161 res!305430) b!504157))

(assert (= (and b!504157 res!305420) b!504171))

(assert (= (and b!504171 res!305431) b!504165))

(assert (= (and b!504165 res!305417) b!504162))

(assert (= (and b!504162 res!305427) b!504158))

(assert (= (and b!504158 res!305426) b!504159))

(assert (= (and b!504158 (not res!305425)) b!504164))

(assert (= (and b!504164 (not res!305422)) b!504169))

(assert (= (and b!504169 c!59648) b!504163))

(assert (= (and b!504169 (not c!59648)) b!504166))

(assert (= (and b!504163 res!305421) b!504160))

(assert (= (and b!504169 (not res!305428)) b!504168))

(assert (= (and b!504168 res!305429) b!504156))

(assert (= (and b!504168 (not res!305423)) b!504172))

(declare-fun m!485161 () Bool)

(assert (=> b!504169 m!485161))

(declare-fun m!485163 () Bool)

(assert (=> b!504169 m!485163))

(declare-fun m!485165 () Bool)

(assert (=> b!504169 m!485165))

(declare-fun m!485167 () Bool)

(assert (=> b!504171 m!485167))

(assert (=> b!504156 m!485165))

(assert (=> b!504156 m!485165))

(declare-fun m!485169 () Bool)

(assert (=> b!504156 m!485169))

(declare-fun m!485171 () Bool)

(assert (=> start!45668 m!485171))

(declare-fun m!485173 () Bool)

(assert (=> start!45668 m!485173))

(declare-fun m!485175 () Bool)

(assert (=> b!504161 m!485175))

(declare-fun m!485177 () Bool)

(assert (=> b!504162 m!485177))

(declare-fun m!485179 () Bool)

(assert (=> b!504165 m!485179))

(declare-fun m!485181 () Bool)

(assert (=> b!504157 m!485181))

(declare-fun m!485183 () Bool)

(assert (=> b!504158 m!485183))

(declare-fun m!485185 () Bool)

(assert (=> b!504158 m!485185))

(declare-fun m!485187 () Bool)

(assert (=> b!504158 m!485187))

(declare-fun m!485189 () Bool)

(assert (=> b!504158 m!485189))

(assert (=> b!504158 m!485165))

(declare-fun m!485191 () Bool)

(assert (=> b!504158 m!485191))

(assert (=> b!504158 m!485165))

(declare-fun m!485193 () Bool)

(assert (=> b!504158 m!485193))

(assert (=> b!504158 m!485165))

(declare-fun m!485195 () Bool)

(assert (=> b!504158 m!485195))

(declare-fun m!485197 () Bool)

(assert (=> b!504158 m!485197))

(assert (=> b!504159 m!485165))

(assert (=> b!504159 m!485165))

(declare-fun m!485199 () Bool)

(assert (=> b!504159 m!485199))

(declare-fun m!485201 () Bool)

(assert (=> b!504163 m!485201))

(declare-fun m!485203 () Bool)

(assert (=> b!504163 m!485203))

(assert (=> b!504172 m!485203))

(assert (=> b!504167 m!485165))

(assert (=> b!504167 m!485165))

(declare-fun m!485205 () Bool)

(assert (=> b!504167 m!485205))

(check-sat (not b!504162) (not b!504171) (not start!45668) (not b!504157) (not b!504169) (not b!504167) (not b!504172) (not b!504158) (not b!504165) (not b!504159) (not b!504161) (not b!504156) (not b!504163))
(check-sat)
