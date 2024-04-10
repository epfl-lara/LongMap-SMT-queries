; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86556 () Bool)

(assert start!86556)

(declare-fun b!1003293 () Bool)

(declare-fun e!565108 () Bool)

(declare-fun e!565106 () Bool)

(assert (=> b!1003293 (= e!565108 e!565106)))

(declare-fun res!672771 () Bool)

(assert (=> b!1003293 (=> (not res!672771) (not e!565106))))

(declare-datatypes ((SeekEntryResult!9436 0))(
  ( (MissingZero!9436 (index!40115 (_ BitVec 32))) (Found!9436 (index!40116 (_ BitVec 32))) (Intermediate!9436 (undefined!10248 Bool) (index!40117 (_ BitVec 32)) (x!87520 (_ BitVec 32))) (Undefined!9436) (MissingVacant!9436 (index!40118 (_ BitVec 32))) )
))
(declare-fun lt!443604 () SeekEntryResult!9436)

(declare-fun lt!443605 () SeekEntryResult!9436)

(assert (=> b!1003293 (= res!672771 (= lt!443604 lt!443605))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003293 (= lt!443605 (Intermediate!9436 false resIndex!38 resX!38))))

(declare-datatypes ((array!63357 0))(
  ( (array!63358 (arr!30504 (Array (_ BitVec 32) (_ BitVec 64))) (size!31006 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63357)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63357 (_ BitVec 32)) SeekEntryResult!9436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003293 (= lt!443604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30504 a!3219) j!170) mask!3464) (select (arr!30504 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003294 () Bool)

(declare-fun res!672773 () Bool)

(declare-fun e!565109 () Bool)

(assert (=> b!1003294 (=> (not res!672773) (not e!565109))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003294 (= res!672773 (and (= (size!31006 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31006 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31006 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003295 () Bool)

(declare-fun res!672776 () Bool)

(declare-fun e!565110 () Bool)

(assert (=> b!1003295 (=> (not res!672776) (not e!565110))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443603 () (_ BitVec 32))

(assert (=> b!1003295 (= res!672776 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443603 (select (arr!30504 a!3219) j!170) a!3219 mask!3464) lt!443605))))

(declare-fun b!1003296 () Bool)

(declare-fun res!672777 () Bool)

(assert (=> b!1003296 (=> (not res!672777) (not e!565108))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1003296 (= res!672777 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31006 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31006 a!3219))))))

(declare-fun b!1003297 () Bool)

(declare-fun res!672775 () Bool)

(assert (=> b!1003297 (=> (not res!672775) (not e!565108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63357 (_ BitVec 32)) Bool)

(assert (=> b!1003297 (= res!672775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003298 () Bool)

(assert (=> b!1003298 (= e!565109 e!565108)))

(declare-fun res!672784 () Bool)

(assert (=> b!1003298 (=> (not res!672784) (not e!565108))))

(declare-fun lt!443602 () SeekEntryResult!9436)

(assert (=> b!1003298 (= res!672784 (or (= lt!443602 (MissingVacant!9436 i!1194)) (= lt!443602 (MissingZero!9436 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63357 (_ BitVec 32)) SeekEntryResult!9436)

(assert (=> b!1003298 (= lt!443602 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003299 () Bool)

(declare-fun e!565111 () Bool)

(assert (=> b!1003299 (= e!565106 e!565111)))

(declare-fun res!672785 () Bool)

(assert (=> b!1003299 (=> (not res!672785) (not e!565111))))

(declare-fun lt!443609 () SeekEntryResult!9436)

(assert (=> b!1003299 (= res!672785 (= lt!443609 lt!443605))))

(assert (=> b!1003299 (= lt!443609 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30504 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!672786 () Bool)

(assert (=> start!86556 (=> (not res!672786) (not e!565109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86556 (= res!672786 (validMask!0 mask!3464))))

(assert (=> start!86556 e!565109))

(declare-fun array_inv!23628 (array!63357) Bool)

(assert (=> start!86556 (array_inv!23628 a!3219)))

(assert (=> start!86556 true))

(declare-fun b!1003300 () Bool)

(assert (=> b!1003300 (= e!565110 false)))

(declare-fun lt!443606 () SeekEntryResult!9436)

(declare-fun lt!443608 () array!63357)

(declare-fun lt!443607 () (_ BitVec 64))

(assert (=> b!1003300 (= lt!443606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443603 lt!443607 lt!443608 mask!3464))))

(declare-fun b!1003301 () Bool)

(declare-fun res!672778 () Bool)

(assert (=> b!1003301 (=> (not res!672778) (not e!565109))))

(declare-fun arrayContainsKey!0 (array!63357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003301 (= res!672778 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003302 () Bool)

(declare-fun res!672782 () Bool)

(assert (=> b!1003302 (=> (not res!672782) (not e!565108))))

(declare-datatypes ((List!21180 0))(
  ( (Nil!21177) (Cons!21176 (h!22353 (_ BitVec 64)) (t!30181 List!21180)) )
))
(declare-fun arrayNoDuplicates!0 (array!63357 (_ BitVec 32) List!21180) Bool)

(assert (=> b!1003302 (= res!672782 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21177))))

(declare-fun b!1003303 () Bool)

(declare-fun e!565107 () Bool)

(assert (=> b!1003303 (= e!565111 e!565107)))

(declare-fun res!672780 () Bool)

(assert (=> b!1003303 (=> (not res!672780) (not e!565107))))

(assert (=> b!1003303 (= res!672780 (not (= lt!443604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443607 mask!3464) lt!443607 lt!443608 mask!3464))))))

(assert (=> b!1003303 (= lt!443607 (select (store (arr!30504 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003303 (= lt!443608 (array!63358 (store (arr!30504 a!3219) i!1194 k!2224) (size!31006 a!3219)))))

(declare-fun b!1003304 () Bool)

(declare-fun res!672774 () Bool)

(assert (=> b!1003304 (=> (not res!672774) (not e!565107))))

(assert (=> b!1003304 (= res!672774 (not (= lt!443609 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443607 lt!443608 mask!3464))))))

(declare-fun b!1003305 () Bool)

(assert (=> b!1003305 (= e!565107 e!565110)))

(declare-fun res!672783 () Bool)

(assert (=> b!1003305 (=> (not res!672783) (not e!565110))))

(assert (=> b!1003305 (= res!672783 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443603 #b00000000000000000000000000000000) (bvslt lt!443603 (size!31006 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003305 (= lt!443603 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003306 () Bool)

(declare-fun res!672779 () Bool)

(assert (=> b!1003306 (=> (not res!672779) (not e!565109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003306 (= res!672779 (validKeyInArray!0 (select (arr!30504 a!3219) j!170)))))

(declare-fun b!1003307 () Bool)

(declare-fun res!672772 () Bool)

(assert (=> b!1003307 (=> (not res!672772) (not e!565109))))

(assert (=> b!1003307 (= res!672772 (validKeyInArray!0 k!2224))))

(declare-fun b!1003308 () Bool)

(declare-fun res!672781 () Bool)

(assert (=> b!1003308 (=> (not res!672781) (not e!565107))))

(assert (=> b!1003308 (= res!672781 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86556 res!672786) b!1003294))

(assert (= (and b!1003294 res!672773) b!1003306))

(assert (= (and b!1003306 res!672779) b!1003307))

(assert (= (and b!1003307 res!672772) b!1003301))

(assert (= (and b!1003301 res!672778) b!1003298))

(assert (= (and b!1003298 res!672784) b!1003297))

(assert (= (and b!1003297 res!672775) b!1003302))

(assert (= (and b!1003302 res!672782) b!1003296))

(assert (= (and b!1003296 res!672777) b!1003293))

(assert (= (and b!1003293 res!672771) b!1003299))

(assert (= (and b!1003299 res!672785) b!1003303))

(assert (= (and b!1003303 res!672780) b!1003304))

(assert (= (and b!1003304 res!672774) b!1003308))

(assert (= (and b!1003308 res!672781) b!1003305))

(assert (= (and b!1003305 res!672783) b!1003295))

(assert (= (and b!1003295 res!672776) b!1003300))

(declare-fun m!929029 () Bool)

(assert (=> b!1003298 m!929029))

(declare-fun m!929031 () Bool)

(assert (=> b!1003295 m!929031))

(assert (=> b!1003295 m!929031))

(declare-fun m!929033 () Bool)

(assert (=> b!1003295 m!929033))

(declare-fun m!929035 () Bool)

(assert (=> b!1003301 m!929035))

(declare-fun m!929037 () Bool)

(assert (=> b!1003303 m!929037))

(assert (=> b!1003303 m!929037))

(declare-fun m!929039 () Bool)

(assert (=> b!1003303 m!929039))

(declare-fun m!929041 () Bool)

(assert (=> b!1003303 m!929041))

(declare-fun m!929043 () Bool)

(assert (=> b!1003303 m!929043))

(assert (=> b!1003306 m!929031))

(assert (=> b!1003306 m!929031))

(declare-fun m!929045 () Bool)

(assert (=> b!1003306 m!929045))

(declare-fun m!929047 () Bool)

(assert (=> b!1003307 m!929047))

(declare-fun m!929049 () Bool)

(assert (=> b!1003300 m!929049))

(assert (=> b!1003293 m!929031))

(assert (=> b!1003293 m!929031))

(declare-fun m!929051 () Bool)

(assert (=> b!1003293 m!929051))

(assert (=> b!1003293 m!929051))

(assert (=> b!1003293 m!929031))

(declare-fun m!929053 () Bool)

(assert (=> b!1003293 m!929053))

(declare-fun m!929055 () Bool)

(assert (=> b!1003305 m!929055))

(assert (=> b!1003299 m!929031))

(assert (=> b!1003299 m!929031))

(declare-fun m!929057 () Bool)

(assert (=> b!1003299 m!929057))

(declare-fun m!929059 () Bool)

(assert (=> b!1003297 m!929059))

(declare-fun m!929061 () Bool)

(assert (=> start!86556 m!929061))

(declare-fun m!929063 () Bool)

(assert (=> start!86556 m!929063))

(declare-fun m!929065 () Bool)

(assert (=> b!1003304 m!929065))

(declare-fun m!929067 () Bool)

(assert (=> b!1003302 m!929067))

(push 1)

(assert (not b!1003307))

