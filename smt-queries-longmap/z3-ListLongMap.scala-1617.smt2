; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30414 () Bool)

(assert start!30414)

(declare-fun b!304318 () Bool)

(declare-fun e!191229 () Bool)

(declare-fun e!191231 () Bool)

(assert (=> b!304318 (= e!191229 e!191231)))

(declare-fun res!161811 () Bool)

(assert (=> b!304318 (=> (not res!161811) (not e!191231))))

(declare-datatypes ((SeekEntryResult!2462 0))(
  ( (MissingZero!2462 (index!12024 (_ BitVec 32))) (Found!2462 (index!12025 (_ BitVec 32))) (Intermediate!2462 (undefined!3274 Bool) (index!12026 (_ BitVec 32)) (x!30299 (_ BitVec 32))) (Undefined!2462) (MissingVacant!2462 (index!12027 (_ BitVec 32))) )
))
(declare-fun lt!150251 () SeekEntryResult!2462)

(declare-datatypes ((array!15473 0))(
  ( (array!15474 (arr!7323 (Array (_ BitVec 32) (_ BitVec 64))) (size!7676 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15473)

(declare-fun lt!150250 () SeekEntryResult!2462)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304318 (= res!161811 (and (= lt!150250 lt!150251) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7323 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7323 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7323 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15473 (_ BitVec 32)) SeekEntryResult!2462)

(assert (=> b!304318 (= lt!150250 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!304319 () Bool)

(declare-fun res!161814 () Bool)

(declare-fun e!191230 () Bool)

(assert (=> b!304319 (=> (not res!161814) (not e!191230))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304319 (= res!161814 (and (= (size!7676 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7676 a!3293))))))

(declare-fun b!304320 () Bool)

(assert (=> b!304320 (= e!191231 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304320 (= lt!150250 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304321 () Bool)

(declare-fun res!161815 () Bool)

(assert (=> b!304321 (=> (not res!161815) (not e!191230))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15473 (_ BitVec 32)) SeekEntryResult!2462)

(assert (=> b!304321 (= res!161815 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2462 i!1240)))))

(declare-fun b!304322 () Bool)

(declare-fun res!161817 () Bool)

(assert (=> b!304322 (=> (not res!161817) (not e!191229))))

(assert (=> b!304322 (= res!161817 (and (= (select (arr!7323 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7676 a!3293))))))

(declare-fun res!161813 () Bool)

(assert (=> start!30414 (=> (not res!161813) (not e!191230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30414 (= res!161813 (validMask!0 mask!3709))))

(assert (=> start!30414 e!191230))

(declare-fun array_inv!5295 (array!15473) Bool)

(assert (=> start!30414 (array_inv!5295 a!3293)))

(assert (=> start!30414 true))

(declare-fun b!304323 () Bool)

(assert (=> b!304323 (= e!191230 e!191229)))

(declare-fun res!161816 () Bool)

(assert (=> b!304323 (=> (not res!161816) (not e!191229))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304323 (= res!161816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150251))))

(assert (=> b!304323 (= lt!150251 (Intermediate!2462 false resIndex!52 resX!52))))

(declare-fun b!304324 () Bool)

(declare-fun res!161809 () Bool)

(assert (=> b!304324 (=> (not res!161809) (not e!191230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304324 (= res!161809 (validKeyInArray!0 k0!2441))))

(declare-fun b!304325 () Bool)

(declare-fun res!161810 () Bool)

(assert (=> b!304325 (=> (not res!161810) (not e!191230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15473 (_ BitVec 32)) Bool)

(assert (=> b!304325 (= res!161810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304326 () Bool)

(declare-fun res!161812 () Bool)

(assert (=> b!304326 (=> (not res!161812) (not e!191230))))

(declare-fun arrayContainsKey!0 (array!15473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304326 (= res!161812 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30414 res!161813) b!304319))

(assert (= (and b!304319 res!161814) b!304324))

(assert (= (and b!304324 res!161809) b!304326))

(assert (= (and b!304326 res!161812) b!304321))

(assert (= (and b!304321 res!161815) b!304325))

(assert (= (and b!304325 res!161810) b!304323))

(assert (= (and b!304323 res!161816) b!304322))

(assert (= (and b!304322 res!161817) b!304318))

(assert (= (and b!304318 res!161811) b!304320))

(declare-fun m!314953 () Bool)

(assert (=> b!304323 m!314953))

(assert (=> b!304323 m!314953))

(declare-fun m!314955 () Bool)

(assert (=> b!304323 m!314955))

(declare-fun m!314957 () Bool)

(assert (=> b!304324 m!314957))

(declare-fun m!314959 () Bool)

(assert (=> b!304320 m!314959))

(assert (=> b!304320 m!314959))

(declare-fun m!314961 () Bool)

(assert (=> b!304320 m!314961))

(declare-fun m!314963 () Bool)

(assert (=> b!304326 m!314963))

(declare-fun m!314965 () Bool)

(assert (=> b!304325 m!314965))

(declare-fun m!314967 () Bool)

(assert (=> b!304318 m!314967))

(declare-fun m!314969 () Bool)

(assert (=> b!304318 m!314969))

(declare-fun m!314971 () Bool)

(assert (=> b!304322 m!314971))

(declare-fun m!314973 () Bool)

(assert (=> b!304321 m!314973))

(declare-fun m!314975 () Bool)

(assert (=> start!30414 m!314975))

(declare-fun m!314977 () Bool)

(assert (=> start!30414 m!314977))

(check-sat (not b!304326) (not b!304321) (not b!304320) (not b!304324) (not start!30414) (not b!304325) (not b!304318) (not b!304323))
(check-sat)
