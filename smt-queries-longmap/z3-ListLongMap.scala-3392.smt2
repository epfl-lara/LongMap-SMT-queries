; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46754 () Bool)

(assert start!46754)

(declare-fun res!316036 () Bool)

(declare-fun e!301379 () Bool)

(assert (=> start!46754 (=> (not res!316036) (not e!301379))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46754 (= res!316036 (validMask!0 mask!3524))))

(assert (=> start!46754 e!301379))

(assert (=> start!46754 true))

(declare-datatypes ((array!33067 0))(
  ( (array!33068 (arr!15901 (Array (_ BitVec 32) (_ BitVec 64))) (size!16265 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33067)

(declare-fun array_inv!11760 (array!33067) Bool)

(assert (=> start!46754 (array_inv!11760 a!3235)))

(declare-fun b!516408 () Bool)

(declare-fun e!301376 () Bool)

(declare-fun e!301378 () Bool)

(assert (=> b!516408 (= e!301376 (not e!301378))))

(declare-fun res!316026 () Bool)

(assert (=> b!516408 (=> res!316026 e!301378)))

(declare-fun lt!236446 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4324 0))(
  ( (MissingZero!4324 (index!19484 (_ BitVec 32))) (Found!4324 (index!19485 (_ BitVec 32))) (Intermediate!4324 (undefined!5136 Bool) (index!19486 (_ BitVec 32)) (x!48588 (_ BitVec 32))) (Undefined!4324) (MissingVacant!4324 (index!19487 (_ BitVec 32))) )
))
(declare-fun lt!236442 () SeekEntryResult!4324)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33067 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!516408 (= res!316026 (= lt!236442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236446 (select (store (arr!15901 a!3235) i!1204 k0!2280) j!176) (array!33068 (store (arr!15901 a!3235) i!1204 k0!2280) (size!16265 a!3235)) mask!3524)))))

(declare-fun lt!236444 () (_ BitVec 32))

(assert (=> b!516408 (= lt!236442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236444 (select (arr!15901 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516408 (= lt!236446 (toIndex!0 (select (store (arr!15901 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516408 (= lt!236444 (toIndex!0 (select (arr!15901 a!3235) j!176) mask!3524))))

(declare-fun e!301377 () Bool)

(assert (=> b!516408 e!301377))

(declare-fun res!316031 () Bool)

(assert (=> b!516408 (=> (not res!316031) (not e!301377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33067 (_ BitVec 32)) Bool)

(assert (=> b!516408 (= res!316031 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15967 0))(
  ( (Unit!15968) )
))
(declare-fun lt!236443 () Unit!15967)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15967)

(assert (=> b!516408 (= lt!236443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516409 () Bool)

(declare-fun res!316030 () Bool)

(assert (=> b!516409 (=> (not res!316030) (not e!301376))))

(assert (=> b!516409 (= res!316030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516410 () Bool)

(declare-fun res!316034 () Bool)

(assert (=> b!516410 (=> (not res!316034) (not e!301379))))

(declare-fun arrayContainsKey!0 (array!33067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516410 (= res!316034 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516411 () Bool)

(assert (=> b!516411 (= e!301379 e!301376)))

(declare-fun res!316032 () Bool)

(assert (=> b!516411 (=> (not res!316032) (not e!301376))))

(declare-fun lt!236445 () SeekEntryResult!4324)

(assert (=> b!516411 (= res!316032 (or (= lt!236445 (MissingZero!4324 i!1204)) (= lt!236445 (MissingVacant!4324 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33067 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!516411 (= lt!236445 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516412 () Bool)

(assert (=> b!516412 (= e!301377 (= (seekEntryOrOpen!0 (select (arr!15901 a!3235) j!176) a!3235 mask!3524) (Found!4324 j!176)))))

(declare-fun b!516413 () Bool)

(declare-fun res!316035 () Bool)

(assert (=> b!516413 (=> (not res!316035) (not e!301379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516413 (= res!316035 (validKeyInArray!0 k0!2280))))

(declare-fun b!516414 () Bool)

(declare-fun res!316027 () Bool)

(assert (=> b!516414 (=> (not res!316027) (not e!301379))))

(assert (=> b!516414 (= res!316027 (validKeyInArray!0 (select (arr!15901 a!3235) j!176)))))

(declare-fun b!516415 () Bool)

(declare-fun res!316033 () Bool)

(assert (=> b!516415 (=> res!316033 e!301378)))

(get-info :version)

(assert (=> b!516415 (= res!316033 (or (undefined!5136 lt!236442) (not ((_ is Intermediate!4324) lt!236442))))))

(declare-fun b!516416 () Bool)

(declare-fun res!316028 () Bool)

(assert (=> b!516416 (=> (not res!316028) (not e!301379))))

(assert (=> b!516416 (= res!316028 (and (= (size!16265 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16265 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16265 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516417 () Bool)

(declare-fun res!316029 () Bool)

(assert (=> b!516417 (=> (not res!316029) (not e!301376))))

(declare-datatypes ((List!9966 0))(
  ( (Nil!9963) (Cons!9962 (h!10860 (_ BitVec 64)) (t!16186 List!9966)) )
))
(declare-fun arrayNoDuplicates!0 (array!33067 (_ BitVec 32) List!9966) Bool)

(assert (=> b!516417 (= res!316029 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9963))))

(declare-fun b!516418 () Bool)

(assert (=> b!516418 (= e!301378 true)))

(assert (=> b!516418 (and (bvslt (x!48588 lt!236442) #b01111111111111111111111111111110) (or (= (select (arr!15901 a!3235) (index!19486 lt!236442)) (select (arr!15901 a!3235) j!176)) (= (select (arr!15901 a!3235) (index!19486 lt!236442)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15901 a!3235) (index!19486 lt!236442)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46754 res!316036) b!516416))

(assert (= (and b!516416 res!316028) b!516414))

(assert (= (and b!516414 res!316027) b!516413))

(assert (= (and b!516413 res!316035) b!516410))

(assert (= (and b!516410 res!316034) b!516411))

(assert (= (and b!516411 res!316032) b!516409))

(assert (= (and b!516409 res!316030) b!516417))

(assert (= (and b!516417 res!316029) b!516408))

(assert (= (and b!516408 res!316031) b!516412))

(assert (= (and b!516408 (not res!316026)) b!516415))

(assert (= (and b!516415 (not res!316033)) b!516418))

(declare-fun m!498145 () Bool)

(assert (=> b!516412 m!498145))

(assert (=> b!516412 m!498145))

(declare-fun m!498147 () Bool)

(assert (=> b!516412 m!498147))

(declare-fun m!498149 () Bool)

(assert (=> b!516418 m!498149))

(assert (=> b!516418 m!498145))

(assert (=> b!516414 m!498145))

(assert (=> b!516414 m!498145))

(declare-fun m!498151 () Bool)

(assert (=> b!516414 m!498151))

(declare-fun m!498153 () Bool)

(assert (=> b!516411 m!498153))

(declare-fun m!498155 () Bool)

(assert (=> b!516408 m!498155))

(declare-fun m!498157 () Bool)

(assert (=> b!516408 m!498157))

(declare-fun m!498159 () Bool)

(assert (=> b!516408 m!498159))

(assert (=> b!516408 m!498145))

(declare-fun m!498161 () Bool)

(assert (=> b!516408 m!498161))

(assert (=> b!516408 m!498145))

(declare-fun m!498163 () Bool)

(assert (=> b!516408 m!498163))

(assert (=> b!516408 m!498159))

(declare-fun m!498165 () Bool)

(assert (=> b!516408 m!498165))

(assert (=> b!516408 m!498159))

(declare-fun m!498167 () Bool)

(assert (=> b!516408 m!498167))

(assert (=> b!516408 m!498145))

(declare-fun m!498169 () Bool)

(assert (=> b!516408 m!498169))

(declare-fun m!498171 () Bool)

(assert (=> b!516417 m!498171))

(declare-fun m!498173 () Bool)

(assert (=> b!516410 m!498173))

(declare-fun m!498175 () Bool)

(assert (=> b!516413 m!498175))

(declare-fun m!498177 () Bool)

(assert (=> start!46754 m!498177))

(declare-fun m!498179 () Bool)

(assert (=> start!46754 m!498179))

(declare-fun m!498181 () Bool)

(assert (=> b!516409 m!498181))

(check-sat (not b!516408) (not b!516409) (not b!516417) (not b!516413) (not b!516411) (not b!516410) (not b!516412) (not start!46754) (not b!516414))
(check-sat)
