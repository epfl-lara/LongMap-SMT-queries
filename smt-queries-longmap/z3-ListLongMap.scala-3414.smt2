; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47394 () Bool)

(assert start!47394)

(declare-fun b!521223 () Bool)

(declare-fun res!319163 () Bool)

(declare-fun e!304071 () Bool)

(assert (=> b!521223 (=> (not res!319163) (not e!304071))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33230 0))(
  ( (array!33231 (arr!15971 (Array (_ BitVec 32) (_ BitVec 64))) (size!16336 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33230)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521223 (= res!319163 (and (= (size!16336 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16336 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16336 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521224 () Bool)

(declare-fun res!319159 () Bool)

(assert (=> b!521224 (=> (not res!319159) (not e!304071))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521224 (= res!319159 (validKeyInArray!0 k0!2280))))

(declare-fun b!521225 () Bool)

(declare-fun e!304074 () Bool)

(declare-datatypes ((SeekEntryResult!4435 0))(
  ( (MissingZero!4435 (index!19943 (_ BitVec 32))) (Found!4435 (index!19944 (_ BitVec 32))) (Intermediate!4435 (undefined!5247 Bool) (index!19945 (_ BitVec 32)) (x!48936 (_ BitVec 32))) (Undefined!4435) (MissingVacant!4435 (index!19946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33230 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!521225 (= e!304074 (= (seekEntryOrOpen!0 (select (arr!15971 a!3235) j!176) a!3235 mask!3524) (Found!4435 j!176)))))

(declare-fun b!521226 () Bool)

(declare-fun res!319156 () Bool)

(assert (=> b!521226 (=> (not res!319156) (not e!304071))))

(declare-fun arrayContainsKey!0 (array!33230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521226 (= res!319156 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521227 () Bool)

(declare-datatypes ((Unit!16186 0))(
  ( (Unit!16187) )
))
(declare-fun e!304070 () Unit!16186)

(declare-fun Unit!16188 () Unit!16186)

(assert (=> b!521227 (= e!304070 Unit!16188)))

(declare-fun lt!238762 () Unit!16186)

(declare-fun lt!238768 () (_ BitVec 32))

(declare-fun lt!238766 () SeekEntryResult!4435)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16186)

(assert (=> b!521227 (= lt!238762 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238768 #b00000000000000000000000000000000 (index!19945 lt!238766) (x!48936 lt!238766) mask!3524))))

(declare-fun lt!238765 () (_ BitVec 64))

(declare-fun res!319162 () Bool)

(declare-fun lt!238761 () array!33230)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33230 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!521227 (= res!319162 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238768 lt!238765 lt!238761 mask!3524) (Intermediate!4435 false (index!19945 lt!238766) (x!48936 lt!238766))))))

(declare-fun e!304068 () Bool)

(assert (=> b!521227 (=> (not res!319162) (not e!304068))))

(assert (=> b!521227 e!304068))

(declare-fun b!521228 () Bool)

(declare-fun e!304073 () Bool)

(declare-fun e!304072 () Bool)

(assert (=> b!521228 (= e!304073 (not e!304072))))

(declare-fun res!319166 () Bool)

(assert (=> b!521228 (=> res!319166 e!304072)))

(declare-fun lt!238763 () (_ BitVec 32))

(assert (=> b!521228 (= res!319166 (= lt!238766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238763 lt!238765 lt!238761 mask!3524)))))

(assert (=> b!521228 (= lt!238766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238768 (select (arr!15971 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521228 (= lt!238763 (toIndex!0 lt!238765 mask!3524))))

(assert (=> b!521228 (= lt!238765 (select (store (arr!15971 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521228 (= lt!238768 (toIndex!0 (select (arr!15971 a!3235) j!176) mask!3524))))

(assert (=> b!521228 (= lt!238761 (array!33231 (store (arr!15971 a!3235) i!1204 k0!2280) (size!16336 a!3235)))))

(assert (=> b!521228 e!304074))

(declare-fun res!319161 () Bool)

(assert (=> b!521228 (=> (not res!319161) (not e!304074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33230 (_ BitVec 32)) Bool)

(assert (=> b!521228 (= res!319161 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238767 () Unit!16186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16186)

(assert (=> b!521228 (= lt!238767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!319158 () Bool)

(assert (=> start!47394 (=> (not res!319158) (not e!304071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47394 (= res!319158 (validMask!0 mask!3524))))

(assert (=> start!47394 e!304071))

(assert (=> start!47394 true))

(declare-fun array_inv!11854 (array!33230) Bool)

(assert (=> start!47394 (array_inv!11854 a!3235)))

(declare-fun b!521229 () Bool)

(declare-fun Unit!16189 () Unit!16186)

(assert (=> b!521229 (= e!304070 Unit!16189)))

(declare-fun b!521230 () Bool)

(assert (=> b!521230 (= e!304072 true)))

(assert (=> b!521230 (and (or (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238760 () Unit!16186)

(assert (=> b!521230 (= lt!238760 e!304070)))

(declare-fun c!61335 () Bool)

(assert (=> b!521230 (= c!61335 (= (select (arr!15971 a!3235) (index!19945 lt!238766)) (select (arr!15971 a!3235) j!176)))))

(assert (=> b!521230 (and (bvslt (x!48936 lt!238766) #b01111111111111111111111111111110) (or (= (select (arr!15971 a!3235) (index!19945 lt!238766)) (select (arr!15971 a!3235) j!176)) (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15971 a!3235) (index!19945 lt!238766)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521231 () Bool)

(declare-fun res!319165 () Bool)

(assert (=> b!521231 (=> (not res!319165) (not e!304073))))

(assert (=> b!521231 (= res!319165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521232 () Bool)

(declare-fun res!319160 () Bool)

(assert (=> b!521232 (=> res!319160 e!304072)))

(get-info :version)

(assert (=> b!521232 (= res!319160 (or (undefined!5247 lt!238766) (not ((_ is Intermediate!4435) lt!238766))))))

(declare-fun b!521233 () Bool)

(declare-fun res!319157 () Bool)

(assert (=> b!521233 (=> (not res!319157) (not e!304073))))

(declare-datatypes ((List!10168 0))(
  ( (Nil!10165) (Cons!10164 (h!11086 (_ BitVec 64)) (t!16387 List!10168)) )
))
(declare-fun arrayNoDuplicates!0 (array!33230 (_ BitVec 32) List!10168) Bool)

(assert (=> b!521233 (= res!319157 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10165))))

(declare-fun b!521234 () Bool)

(assert (=> b!521234 (= e!304068 false)))

(declare-fun b!521235 () Bool)

(declare-fun res!319164 () Bool)

(assert (=> b!521235 (=> (not res!319164) (not e!304071))))

(assert (=> b!521235 (= res!319164 (validKeyInArray!0 (select (arr!15971 a!3235) j!176)))))

(declare-fun b!521236 () Bool)

(assert (=> b!521236 (= e!304071 e!304073)))

(declare-fun res!319155 () Bool)

(assert (=> b!521236 (=> (not res!319155) (not e!304073))))

(declare-fun lt!238764 () SeekEntryResult!4435)

(assert (=> b!521236 (= res!319155 (or (= lt!238764 (MissingZero!4435 i!1204)) (= lt!238764 (MissingVacant!4435 i!1204))))))

(assert (=> b!521236 (= lt!238764 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47394 res!319158) b!521223))

(assert (= (and b!521223 res!319163) b!521235))

(assert (= (and b!521235 res!319164) b!521224))

(assert (= (and b!521224 res!319159) b!521226))

(assert (= (and b!521226 res!319156) b!521236))

(assert (= (and b!521236 res!319155) b!521231))

(assert (= (and b!521231 res!319165) b!521233))

(assert (= (and b!521233 res!319157) b!521228))

(assert (= (and b!521228 res!319161) b!521225))

(assert (= (and b!521228 (not res!319166)) b!521232))

(assert (= (and b!521232 (not res!319160)) b!521230))

(assert (= (and b!521230 c!61335) b!521227))

(assert (= (and b!521230 (not c!61335)) b!521229))

(assert (= (and b!521227 res!319162) b!521234))

(declare-fun m!501655 () Bool)

(assert (=> b!521224 m!501655))

(declare-fun m!501657 () Bool)

(assert (=> b!521236 m!501657))

(declare-fun m!501659 () Bool)

(assert (=> b!521227 m!501659))

(declare-fun m!501661 () Bool)

(assert (=> b!521227 m!501661))

(declare-fun m!501663 () Bool)

(assert (=> b!521226 m!501663))

(declare-fun m!501665 () Bool)

(assert (=> b!521235 m!501665))

(assert (=> b!521235 m!501665))

(declare-fun m!501667 () Bool)

(assert (=> b!521235 m!501667))

(declare-fun m!501669 () Bool)

(assert (=> b!521231 m!501669))

(declare-fun m!501671 () Bool)

(assert (=> b!521230 m!501671))

(assert (=> b!521230 m!501665))

(assert (=> b!521225 m!501665))

(assert (=> b!521225 m!501665))

(declare-fun m!501673 () Bool)

(assert (=> b!521225 m!501673))

(declare-fun m!501675 () Bool)

(assert (=> b!521228 m!501675))

(declare-fun m!501677 () Bool)

(assert (=> b!521228 m!501677))

(declare-fun m!501679 () Bool)

(assert (=> b!521228 m!501679))

(assert (=> b!521228 m!501665))

(declare-fun m!501681 () Bool)

(assert (=> b!521228 m!501681))

(declare-fun m!501683 () Bool)

(assert (=> b!521228 m!501683))

(assert (=> b!521228 m!501665))

(declare-fun m!501685 () Bool)

(assert (=> b!521228 m!501685))

(assert (=> b!521228 m!501665))

(declare-fun m!501687 () Bool)

(assert (=> b!521228 m!501687))

(declare-fun m!501689 () Bool)

(assert (=> b!521228 m!501689))

(declare-fun m!501691 () Bool)

(assert (=> b!521233 m!501691))

(declare-fun m!501693 () Bool)

(assert (=> start!47394 m!501693))

(declare-fun m!501695 () Bool)

(assert (=> start!47394 m!501695))

(check-sat (not b!521227) (not b!521228) (not b!521235) (not b!521231) (not b!521224) (not b!521225) (not b!521236) (not b!521233) (not b!521226) (not start!47394))
(check-sat)
