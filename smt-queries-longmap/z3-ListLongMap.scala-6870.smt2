; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86476 () Bool)

(assert start!86476)

(declare-fun b!1001373 () Bool)

(declare-fun e!564269 () Bool)

(declare-fun e!564265 () Bool)

(assert (=> b!1001373 (= e!564269 e!564265)))

(declare-fun res!670855 () Bool)

(assert (=> b!1001373 (=> (not res!670855) (not e!564265))))

(declare-datatypes ((SeekEntryResult!9396 0))(
  ( (MissingZero!9396 (index!39955 (_ BitVec 32))) (Found!9396 (index!39956 (_ BitVec 32))) (Intermediate!9396 (undefined!10208 Bool) (index!39957 (_ BitVec 32)) (x!87376 (_ BitVec 32))) (Undefined!9396) (MissingVacant!9396 (index!39958 (_ BitVec 32))) )
))
(declare-fun lt!442649 () SeekEntryResult!9396)

(declare-fun lt!442647 () SeekEntryResult!9396)

(assert (=> b!1001373 (= res!670855 (= lt!442649 lt!442647))))

(declare-datatypes ((array!63277 0))(
  ( (array!63278 (arr!30464 (Array (_ BitVec 32) (_ BitVec 64))) (size!30966 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63277)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63277 (_ BitVec 32)) SeekEntryResult!9396)

(assert (=> b!1001373 (= lt!442649 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30464 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001374 () Bool)

(declare-fun e!564268 () Bool)

(declare-fun e!564266 () Bool)

(assert (=> b!1001374 (= e!564268 e!564266)))

(declare-fun res!670857 () Bool)

(assert (=> b!1001374 (=> (not res!670857) (not e!564266))))

(declare-fun lt!442646 () SeekEntryResult!9396)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001374 (= res!670857 (or (= lt!442646 (MissingVacant!9396 i!1194)) (= lt!442646 (MissingZero!9396 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63277 (_ BitVec 32)) SeekEntryResult!9396)

(assert (=> b!1001374 (= lt!442646 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001375 () Bool)

(declare-fun res!670863 () Bool)

(declare-fun e!564267 () Bool)

(assert (=> b!1001375 (=> (not res!670863) (not e!564267))))

(declare-fun lt!442645 () array!63277)

(declare-fun lt!442644 () (_ BitVec 64))

(assert (=> b!1001375 (= res!670863 (not (= lt!442649 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442644 lt!442645 mask!3464))))))

(declare-fun b!1001376 () Bool)

(declare-fun res!670865 () Bool)

(assert (=> b!1001376 (=> (not res!670865) (not e!564268))))

(assert (=> b!1001376 (= res!670865 (and (= (size!30966 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30966 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30966 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001377 () Bool)

(declare-fun res!670858 () Bool)

(assert (=> b!1001377 (=> (not res!670858) (not e!564268))))

(declare-fun arrayContainsKey!0 (array!63277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001377 (= res!670858 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!670852 () Bool)

(assert (=> start!86476 (=> (not res!670852) (not e!564268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86476 (= res!670852 (validMask!0 mask!3464))))

(assert (=> start!86476 e!564268))

(declare-fun array_inv!23588 (array!63277) Bool)

(assert (=> start!86476 (array_inv!23588 a!3219)))

(assert (=> start!86476 true))

(declare-fun b!1001378 () Bool)

(declare-fun res!670851 () Bool)

(assert (=> b!1001378 (=> (not res!670851) (not e!564268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001378 (= res!670851 (validKeyInArray!0 (select (arr!30464 a!3219) j!170)))))

(declare-fun b!1001379 () Bool)

(declare-fun res!670854 () Bool)

(assert (=> b!1001379 (=> (not res!670854) (not e!564267))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001379 (= res!670854 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001380 () Bool)

(declare-fun res!670859 () Bool)

(assert (=> b!1001380 (=> (not res!670859) (not e!564266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63277 (_ BitVec 32)) Bool)

(assert (=> b!1001380 (= res!670859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001381 () Bool)

(declare-fun res!670864 () Bool)

(declare-fun e!564270 () Bool)

(assert (=> b!1001381 (=> (not res!670864) (not e!564270))))

(declare-fun lt!442648 () (_ BitVec 32))

(assert (=> b!1001381 (= res!670864 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442648 (select (arr!30464 a!3219) j!170) a!3219 mask!3464) lt!442647))))

(declare-fun b!1001382 () Bool)

(assert (=> b!1001382 (= e!564270 false)))

(declare-fun lt!442643 () SeekEntryResult!9396)

(assert (=> b!1001382 (= lt!442643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442648 lt!442644 lt!442645 mask!3464))))

(declare-fun b!1001383 () Bool)

(declare-fun res!670862 () Bool)

(assert (=> b!1001383 (=> (not res!670862) (not e!564266))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001383 (= res!670862 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30966 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30966 a!3219))))))

(declare-fun b!1001384 () Bool)

(assert (=> b!1001384 (= e!564265 e!564267)))

(declare-fun res!670860 () Bool)

(assert (=> b!1001384 (=> (not res!670860) (not e!564267))))

(declare-fun lt!442642 () SeekEntryResult!9396)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001384 (= res!670860 (not (= lt!442642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442644 mask!3464) lt!442644 lt!442645 mask!3464))))))

(assert (=> b!1001384 (= lt!442644 (select (store (arr!30464 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001384 (= lt!442645 (array!63278 (store (arr!30464 a!3219) i!1194 k0!2224) (size!30966 a!3219)))))

(declare-fun b!1001385 () Bool)

(declare-fun res!670853 () Bool)

(assert (=> b!1001385 (=> (not res!670853) (not e!564268))))

(assert (=> b!1001385 (= res!670853 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001386 () Bool)

(assert (=> b!1001386 (= e!564267 e!564270)))

(declare-fun res!670856 () Bool)

(assert (=> b!1001386 (=> (not res!670856) (not e!564270))))

(assert (=> b!1001386 (= res!670856 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442648 #b00000000000000000000000000000000) (bvslt lt!442648 (size!30966 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001386 (= lt!442648 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001387 () Bool)

(declare-fun res!670866 () Bool)

(assert (=> b!1001387 (=> (not res!670866) (not e!564266))))

(declare-datatypes ((List!21140 0))(
  ( (Nil!21137) (Cons!21136 (h!22313 (_ BitVec 64)) (t!30141 List!21140)) )
))
(declare-fun arrayNoDuplicates!0 (array!63277 (_ BitVec 32) List!21140) Bool)

(assert (=> b!1001387 (= res!670866 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21137))))

(declare-fun b!1001388 () Bool)

(assert (=> b!1001388 (= e!564266 e!564269)))

(declare-fun res!670861 () Bool)

(assert (=> b!1001388 (=> (not res!670861) (not e!564269))))

(assert (=> b!1001388 (= res!670861 (= lt!442642 lt!442647))))

(assert (=> b!1001388 (= lt!442647 (Intermediate!9396 false resIndex!38 resX!38))))

(assert (=> b!1001388 (= lt!442642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30464 a!3219) j!170) mask!3464) (select (arr!30464 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86476 res!670852) b!1001376))

(assert (= (and b!1001376 res!670865) b!1001378))

(assert (= (and b!1001378 res!670851) b!1001385))

(assert (= (and b!1001385 res!670853) b!1001377))

(assert (= (and b!1001377 res!670858) b!1001374))

(assert (= (and b!1001374 res!670857) b!1001380))

(assert (= (and b!1001380 res!670859) b!1001387))

(assert (= (and b!1001387 res!670866) b!1001383))

(assert (= (and b!1001383 res!670862) b!1001388))

(assert (= (and b!1001388 res!670861) b!1001373))

(assert (= (and b!1001373 res!670855) b!1001384))

(assert (= (and b!1001384 res!670860) b!1001375))

(assert (= (and b!1001375 res!670863) b!1001379))

(assert (= (and b!1001379 res!670854) b!1001386))

(assert (= (and b!1001386 res!670856) b!1001381))

(assert (= (and b!1001381 res!670864) b!1001382))

(declare-fun m!927429 () Bool)

(assert (=> b!1001387 m!927429))

(declare-fun m!927431 () Bool)

(assert (=> b!1001375 m!927431))

(declare-fun m!927433 () Bool)

(assert (=> start!86476 m!927433))

(declare-fun m!927435 () Bool)

(assert (=> start!86476 m!927435))

(declare-fun m!927437 () Bool)

(assert (=> b!1001381 m!927437))

(assert (=> b!1001381 m!927437))

(declare-fun m!927439 () Bool)

(assert (=> b!1001381 m!927439))

(declare-fun m!927441 () Bool)

(assert (=> b!1001382 m!927441))

(declare-fun m!927443 () Bool)

(assert (=> b!1001386 m!927443))

(declare-fun m!927445 () Bool)

(assert (=> b!1001374 m!927445))

(assert (=> b!1001388 m!927437))

(assert (=> b!1001388 m!927437))

(declare-fun m!927447 () Bool)

(assert (=> b!1001388 m!927447))

(assert (=> b!1001388 m!927447))

(assert (=> b!1001388 m!927437))

(declare-fun m!927449 () Bool)

(assert (=> b!1001388 m!927449))

(declare-fun m!927451 () Bool)

(assert (=> b!1001384 m!927451))

(assert (=> b!1001384 m!927451))

(declare-fun m!927453 () Bool)

(assert (=> b!1001384 m!927453))

(declare-fun m!927455 () Bool)

(assert (=> b!1001384 m!927455))

(declare-fun m!927457 () Bool)

(assert (=> b!1001384 m!927457))

(declare-fun m!927459 () Bool)

(assert (=> b!1001385 m!927459))

(assert (=> b!1001378 m!927437))

(assert (=> b!1001378 m!927437))

(declare-fun m!927461 () Bool)

(assert (=> b!1001378 m!927461))

(declare-fun m!927463 () Bool)

(assert (=> b!1001377 m!927463))

(declare-fun m!927465 () Bool)

(assert (=> b!1001380 m!927465))

(assert (=> b!1001373 m!927437))

(assert (=> b!1001373 m!927437))

(declare-fun m!927467 () Bool)

(assert (=> b!1001373 m!927467))

(check-sat (not start!86476) (not b!1001377) (not b!1001384) (not b!1001381) (not b!1001375) (not b!1001386) (not b!1001385) (not b!1001378) (not b!1001380) (not b!1001374) (not b!1001388) (not b!1001382) (not b!1001387) (not b!1001373))
(check-sat)
