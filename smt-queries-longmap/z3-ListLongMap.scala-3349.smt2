; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46074 () Bool)

(assert start!46074)

(declare-fun b!510188 () Bool)

(declare-fun e!298201 () Bool)

(declare-fun e!298200 () Bool)

(assert (=> b!510188 (= e!298201 (not e!298200))))

(declare-fun res!311178 () Bool)

(assert (=> b!510188 (=> res!311178 e!298200)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32795 0))(
  ( (array!32796 (arr!15776 (Array (_ BitVec 32) (_ BitVec 64))) (size!16141 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32795)

(declare-fun lt!233166 () array!32795)

(declare-fun lt!233167 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4240 0))(
  ( (MissingZero!4240 (index!19148 (_ BitVec 32))) (Found!4240 (index!19149 (_ BitVec 32))) (Intermediate!4240 (undefined!5052 Bool) (index!19150 (_ BitVec 32)) (x!48116 (_ BitVec 32))) (Undefined!4240) (MissingVacant!4240 (index!19151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32795 (_ BitVec 32)) SeekEntryResult!4240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510188 (= res!311178 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15776 a!3235) j!176) mask!3524) (select (arr!15776 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233167 mask!3524) lt!233167 lt!233166 mask!3524))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510188 (= lt!233167 (select (store (arr!15776 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510188 (= lt!233166 (array!32796 (store (arr!15776 a!3235) i!1204 k0!2280) (size!16141 a!3235)))))

(declare-fun lt!233164 () SeekEntryResult!4240)

(assert (=> b!510188 (= lt!233164 (Found!4240 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32795 (_ BitVec 32)) SeekEntryResult!4240)

(assert (=> b!510188 (= lt!233164 (seekEntryOrOpen!0 (select (arr!15776 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32795 (_ BitVec 32)) Bool)

(assert (=> b!510188 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15724 0))(
  ( (Unit!15725) )
))
(declare-fun lt!233163 () Unit!15724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15724)

(assert (=> b!510188 (= lt!233163 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510189 () Bool)

(declare-fun res!311183 () Bool)

(assert (=> b!510189 (=> (not res!311183) (not e!298201))))

(assert (=> b!510189 (= res!311183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510190 () Bool)

(declare-fun e!298203 () Bool)

(assert (=> b!510190 (= e!298203 e!298201)))

(declare-fun res!311179 () Bool)

(assert (=> b!510190 (=> (not res!311179) (not e!298201))))

(declare-fun lt!233162 () SeekEntryResult!4240)

(assert (=> b!510190 (= res!311179 (or (= lt!233162 (MissingZero!4240 i!1204)) (= lt!233162 (MissingVacant!4240 i!1204))))))

(assert (=> b!510190 (= lt!233162 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510191 () Bool)

(assert (=> b!510191 (= e!298200 true)))

(assert (=> b!510191 (= lt!233164 (seekEntryOrOpen!0 lt!233167 lt!233166 mask!3524))))

(declare-fun lt!233165 () Unit!15724)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15724)

(assert (=> b!510191 (= lt!233165 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510192 () Bool)

(declare-fun res!311182 () Bool)

(assert (=> b!510192 (=> (not res!311182) (not e!298203))))

(assert (=> b!510192 (= res!311182 (and (= (size!16141 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16141 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16141 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510193 () Bool)

(declare-fun res!311176 () Bool)

(assert (=> b!510193 (=> (not res!311176) (not e!298203))))

(declare-fun arrayContainsKey!0 (array!32795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510193 (= res!311176 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510194 () Bool)

(declare-fun res!311180 () Bool)

(assert (=> b!510194 (=> (not res!311180) (not e!298201))))

(declare-datatypes ((List!9973 0))(
  ( (Nil!9970) (Cons!9969 (h!10846 (_ BitVec 64)) (t!16192 List!9973)) )
))
(declare-fun arrayNoDuplicates!0 (array!32795 (_ BitVec 32) List!9973) Bool)

(assert (=> b!510194 (= res!311180 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9970))))

(declare-fun b!510195 () Bool)

(declare-fun res!311175 () Bool)

(assert (=> b!510195 (=> (not res!311175) (not e!298203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510195 (= res!311175 (validKeyInArray!0 k0!2280))))

(declare-fun b!510196 () Bool)

(declare-fun res!311181 () Bool)

(assert (=> b!510196 (=> (not res!311181) (not e!298203))))

(assert (=> b!510196 (= res!311181 (validKeyInArray!0 (select (arr!15776 a!3235) j!176)))))

(declare-fun res!311177 () Bool)

(assert (=> start!46074 (=> (not res!311177) (not e!298203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46074 (= res!311177 (validMask!0 mask!3524))))

(assert (=> start!46074 e!298203))

(assert (=> start!46074 true))

(declare-fun array_inv!11659 (array!32795) Bool)

(assert (=> start!46074 (array_inv!11659 a!3235)))

(assert (= (and start!46074 res!311177) b!510192))

(assert (= (and b!510192 res!311182) b!510196))

(assert (= (and b!510196 res!311181) b!510195))

(assert (= (and b!510195 res!311175) b!510193))

(assert (= (and b!510193 res!311176) b!510190))

(assert (= (and b!510190 res!311179) b!510189))

(assert (= (and b!510189 res!311183) b!510194))

(assert (= (and b!510194 res!311180) b!510188))

(assert (= (and b!510188 (not res!311178)) b!510191))

(declare-fun m!490981 () Bool)

(assert (=> b!510189 m!490981))

(declare-fun m!490983 () Bool)

(assert (=> b!510195 m!490983))

(declare-fun m!490985 () Bool)

(assert (=> b!510193 m!490985))

(declare-fun m!490987 () Bool)

(assert (=> b!510196 m!490987))

(assert (=> b!510196 m!490987))

(declare-fun m!490989 () Bool)

(assert (=> b!510196 m!490989))

(declare-fun m!490991 () Bool)

(assert (=> b!510188 m!490991))

(declare-fun m!490993 () Bool)

(assert (=> b!510188 m!490993))

(declare-fun m!490995 () Bool)

(assert (=> b!510188 m!490995))

(declare-fun m!490997 () Bool)

(assert (=> b!510188 m!490997))

(declare-fun m!490999 () Bool)

(assert (=> b!510188 m!490999))

(declare-fun m!491001 () Bool)

(assert (=> b!510188 m!491001))

(assert (=> b!510188 m!490987))

(declare-fun m!491003 () Bool)

(assert (=> b!510188 m!491003))

(assert (=> b!510188 m!490987))

(assert (=> b!510188 m!491001))

(assert (=> b!510188 m!490987))

(declare-fun m!491005 () Bool)

(assert (=> b!510188 m!491005))

(assert (=> b!510188 m!490987))

(declare-fun m!491007 () Bool)

(assert (=> b!510188 m!491007))

(assert (=> b!510188 m!490993))

(declare-fun m!491009 () Bool)

(assert (=> start!46074 m!491009))

(declare-fun m!491011 () Bool)

(assert (=> start!46074 m!491011))

(declare-fun m!491013 () Bool)

(assert (=> b!510191 m!491013))

(declare-fun m!491015 () Bool)

(assert (=> b!510191 m!491015))

(declare-fun m!491017 () Bool)

(assert (=> b!510194 m!491017))

(declare-fun m!491019 () Bool)

(assert (=> b!510190 m!491019))

(check-sat (not b!510189) (not b!510191) (not b!510193) (not b!510188) (not b!510194) (not b!510196) (not start!46074) (not b!510195) (not b!510190))
(check-sat)
