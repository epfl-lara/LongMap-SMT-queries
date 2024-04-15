; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86472 () Bool)

(assert start!86472)

(declare-fun b!1001251 () Bool)

(declare-fun res!670865 () Bool)

(declare-fun e!564179 () Bool)

(assert (=> b!1001251 (=> (not res!670865) (not e!564179))))

(declare-datatypes ((array!63220 0))(
  ( (array!63221 (arr!30435 (Array (_ BitVec 32) (_ BitVec 64))) (size!30939 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63220)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442458 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9392 0))(
  ( (MissingZero!9392 (index!39939 (_ BitVec 32))) (Found!9392 (index!39940 (_ BitVec 32))) (Intermediate!9392 (undefined!10204 Bool) (index!39941 (_ BitVec 32)) (x!87375 (_ BitVec 32))) (Undefined!9392) (MissingVacant!9392 (index!39942 (_ BitVec 32))) )
))
(declare-fun lt!442465 () SeekEntryResult!9392)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63220 (_ BitVec 32)) SeekEntryResult!9392)

(assert (=> b!1001251 (= res!670865 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442458 (select (arr!30435 a!3219) j!170) a!3219 mask!3464) lt!442465))))

(declare-fun b!1001252 () Bool)

(declare-fun res!670864 () Bool)

(declare-fun e!564178 () Bool)

(assert (=> b!1001252 (=> (not res!670864) (not e!564178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63220 (_ BitVec 32)) Bool)

(assert (=> b!1001252 (= res!670864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001253 () Bool)

(declare-fun res!670863 () Bool)

(declare-fun e!564176 () Bool)

(assert (=> b!1001253 (=> (not res!670863) (not e!564176))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001253 (= res!670863 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001254 () Bool)

(declare-fun e!564182 () Bool)

(assert (=> b!1001254 (= e!564178 e!564182)))

(declare-fun res!670867 () Bool)

(assert (=> b!1001254 (=> (not res!670867) (not e!564182))))

(declare-fun lt!442459 () SeekEntryResult!9392)

(assert (=> b!1001254 (= res!670867 (= lt!442459 lt!442465))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001254 (= lt!442465 (Intermediate!9392 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001254 (= lt!442459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30435 a!3219) j!170) mask!3464) (select (arr!30435 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!670854 () Bool)

(declare-fun e!564177 () Bool)

(assert (=> start!86472 (=> (not res!670854) (not e!564177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86472 (= res!670854 (validMask!0 mask!3464))))

(assert (=> start!86472 e!564177))

(declare-fun array_inv!23578 (array!63220) Bool)

(assert (=> start!86472 (array_inv!23578 a!3219)))

(assert (=> start!86472 true))

(declare-fun b!1001255 () Bool)

(assert (=> b!1001255 (= e!564179 false)))

(declare-fun lt!442463 () array!63220)

(declare-fun lt!442464 () SeekEntryResult!9392)

(declare-fun lt!442460 () (_ BitVec 64))

(assert (=> b!1001255 (= lt!442464 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442458 lt!442460 lt!442463 mask!3464))))

(declare-fun b!1001256 () Bool)

(declare-fun res!670862 () Bool)

(assert (=> b!1001256 (=> (not res!670862) (not e!564178))))

(assert (=> b!1001256 (= res!670862 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30939 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30939 a!3219))))))

(declare-fun b!1001257 () Bool)

(declare-fun e!564180 () Bool)

(assert (=> b!1001257 (= e!564180 e!564176)))

(declare-fun res!670858 () Bool)

(assert (=> b!1001257 (=> (not res!670858) (not e!564176))))

(assert (=> b!1001257 (= res!670858 (not (= lt!442459 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442460 mask!3464) lt!442460 lt!442463 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001257 (= lt!442460 (select (store (arr!30435 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001257 (= lt!442463 (array!63221 (store (arr!30435 a!3219) i!1194 k0!2224) (size!30939 a!3219)))))

(declare-fun b!1001258 () Bool)

(declare-fun res!670856 () Bool)

(assert (=> b!1001258 (=> (not res!670856) (not e!564178))))

(declare-datatypes ((List!21177 0))(
  ( (Nil!21174) (Cons!21173 (h!22350 (_ BitVec 64)) (t!30169 List!21177)) )
))
(declare-fun arrayNoDuplicates!0 (array!63220 (_ BitVec 32) List!21177) Bool)

(assert (=> b!1001258 (= res!670856 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21174))))

(declare-fun b!1001259 () Bool)

(declare-fun res!670859 () Bool)

(assert (=> b!1001259 (=> (not res!670859) (not e!564177))))

(assert (=> b!1001259 (= res!670859 (and (= (size!30939 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30939 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30939 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001260 () Bool)

(declare-fun res!670855 () Bool)

(assert (=> b!1001260 (=> (not res!670855) (not e!564177))))

(declare-fun arrayContainsKey!0 (array!63220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001260 (= res!670855 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001261 () Bool)

(assert (=> b!1001261 (= e!564182 e!564180)))

(declare-fun res!670861 () Bool)

(assert (=> b!1001261 (=> (not res!670861) (not e!564180))))

(declare-fun lt!442461 () SeekEntryResult!9392)

(assert (=> b!1001261 (= res!670861 (= lt!442461 lt!442465))))

(assert (=> b!1001261 (= lt!442461 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30435 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001262 () Bool)

(assert (=> b!1001262 (= e!564177 e!564178)))

(declare-fun res!670868 () Bool)

(assert (=> b!1001262 (=> (not res!670868) (not e!564178))))

(declare-fun lt!442462 () SeekEntryResult!9392)

(assert (=> b!1001262 (= res!670868 (or (= lt!442462 (MissingVacant!9392 i!1194)) (= lt!442462 (MissingZero!9392 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63220 (_ BitVec 32)) SeekEntryResult!9392)

(assert (=> b!1001262 (= lt!442462 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001263 () Bool)

(assert (=> b!1001263 (= e!564176 e!564179)))

(declare-fun res!670857 () Bool)

(assert (=> b!1001263 (=> (not res!670857) (not e!564179))))

(assert (=> b!1001263 (= res!670857 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442458 #b00000000000000000000000000000000) (bvslt lt!442458 (size!30939 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001263 (= lt!442458 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001264 () Bool)

(declare-fun res!670853 () Bool)

(assert (=> b!1001264 (=> (not res!670853) (not e!564177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001264 (= res!670853 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001265 () Bool)

(declare-fun res!670866 () Bool)

(assert (=> b!1001265 (=> (not res!670866) (not e!564176))))

(assert (=> b!1001265 (= res!670866 (not (= lt!442461 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442460 lt!442463 mask!3464))))))

(declare-fun b!1001266 () Bool)

(declare-fun res!670860 () Bool)

(assert (=> b!1001266 (=> (not res!670860) (not e!564177))))

(assert (=> b!1001266 (= res!670860 (validKeyInArray!0 (select (arr!30435 a!3219) j!170)))))

(assert (= (and start!86472 res!670854) b!1001259))

(assert (= (and b!1001259 res!670859) b!1001266))

(assert (= (and b!1001266 res!670860) b!1001264))

(assert (= (and b!1001264 res!670853) b!1001260))

(assert (= (and b!1001260 res!670855) b!1001262))

(assert (= (and b!1001262 res!670868) b!1001252))

(assert (= (and b!1001252 res!670864) b!1001258))

(assert (= (and b!1001258 res!670856) b!1001256))

(assert (= (and b!1001256 res!670862) b!1001254))

(assert (= (and b!1001254 res!670867) b!1001261))

(assert (= (and b!1001261 res!670861) b!1001257))

(assert (= (and b!1001257 res!670858) b!1001265))

(assert (= (and b!1001265 res!670866) b!1001253))

(assert (= (and b!1001253 res!670863) b!1001263))

(assert (= (and b!1001263 res!670857) b!1001251))

(assert (= (and b!1001251 res!670865) b!1001255))

(declare-fun m!926779 () Bool)

(assert (=> b!1001258 m!926779))

(declare-fun m!926781 () Bool)

(assert (=> b!1001255 m!926781))

(declare-fun m!926783 () Bool)

(assert (=> b!1001252 m!926783))

(declare-fun m!926785 () Bool)

(assert (=> b!1001257 m!926785))

(assert (=> b!1001257 m!926785))

(declare-fun m!926787 () Bool)

(assert (=> b!1001257 m!926787))

(declare-fun m!926789 () Bool)

(assert (=> b!1001257 m!926789))

(declare-fun m!926791 () Bool)

(assert (=> b!1001257 m!926791))

(declare-fun m!926793 () Bool)

(assert (=> b!1001254 m!926793))

(assert (=> b!1001254 m!926793))

(declare-fun m!926795 () Bool)

(assert (=> b!1001254 m!926795))

(assert (=> b!1001254 m!926795))

(assert (=> b!1001254 m!926793))

(declare-fun m!926797 () Bool)

(assert (=> b!1001254 m!926797))

(declare-fun m!926799 () Bool)

(assert (=> b!1001264 m!926799))

(declare-fun m!926801 () Bool)

(assert (=> b!1001262 m!926801))

(declare-fun m!926803 () Bool)

(assert (=> b!1001260 m!926803))

(declare-fun m!926805 () Bool)

(assert (=> b!1001265 m!926805))

(assert (=> b!1001261 m!926793))

(assert (=> b!1001261 m!926793))

(declare-fun m!926807 () Bool)

(assert (=> b!1001261 m!926807))

(declare-fun m!926809 () Bool)

(assert (=> start!86472 m!926809))

(declare-fun m!926811 () Bool)

(assert (=> start!86472 m!926811))

(declare-fun m!926813 () Bool)

(assert (=> b!1001263 m!926813))

(assert (=> b!1001251 m!926793))

(assert (=> b!1001251 m!926793))

(declare-fun m!926815 () Bool)

(assert (=> b!1001251 m!926815))

(assert (=> b!1001266 m!926793))

(assert (=> b!1001266 m!926793))

(declare-fun m!926817 () Bool)

(assert (=> b!1001266 m!926817))

(check-sat (not b!1001258) (not b!1001254) (not b!1001252) (not b!1001251) (not b!1001263) (not b!1001260) (not b!1001265) (not start!86472) (not b!1001262) (not b!1001261) (not b!1001264) (not b!1001257) (not b!1001266) (not b!1001255))
(check-sat)
