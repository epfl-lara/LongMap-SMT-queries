; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49168 () Bool)

(assert start!49168)

(declare-fun res!336150 () Bool)

(declare-fun e!313510 () Bool)

(assert (=> start!49168 (=> (not res!336150) (not e!313510))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49168 (= res!336150 (validMask!0 mask!3216))))

(assert (=> start!49168 e!313510))

(assert (=> start!49168 true))

(declare-datatypes ((array!34226 0))(
  ( (array!34227 (arr!16447 (Array (_ BitVec 32) (_ BitVec 64))) (size!16811 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34226)

(declare-fun array_inv!12306 (array!34226) Bool)

(assert (=> start!49168 (array_inv!12306 a!3154)))

(declare-fun b!541366 () Bool)

(declare-fun res!336149 () Bool)

(declare-fun e!313511 () Bool)

(assert (=> b!541366 (=> (not res!336149) (not e!313511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34226 (_ BitVec 32)) Bool)

(assert (=> b!541366 (= res!336149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541367 () Bool)

(declare-fun res!336153 () Bool)

(assert (=> b!541367 (=> (not res!336153) (not e!313510))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541367 (= res!336153 (validKeyInArray!0 (select (arr!16447 a!3154) j!147)))))

(declare-fun b!541368 () Bool)

(declare-fun res!336155 () Bool)

(assert (=> b!541368 (=> (not res!336155) (not e!313511))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4861 0))(
  ( (MissingZero!4861 (index!21668 (_ BitVec 32))) (Found!4861 (index!21669 (_ BitVec 32))) (Intermediate!4861 (undefined!5673 Bool) (index!21670 (_ BitVec 32)) (x!50731 (_ BitVec 32))) (Undefined!4861) (MissingVacant!4861 (index!21671 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34226 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!541368 (= res!336155 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16447 a!3154) j!147) a!3154 mask!3216) (Intermediate!4861 false resIndex!32 resX!32)))))

(declare-fun b!541369 () Bool)

(assert (=> b!541369 (= e!313510 e!313511)))

(declare-fun res!336157 () Bool)

(assert (=> b!541369 (=> (not res!336157) (not e!313511))))

(declare-fun lt!247674 () SeekEntryResult!4861)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541369 (= res!336157 (or (= lt!247674 (MissingZero!4861 i!1153)) (= lt!247674 (MissingVacant!4861 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34226 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!541369 (= lt!247674 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541370 () Bool)

(declare-fun res!336154 () Bool)

(assert (=> b!541370 (=> (not res!336154) (not e!313511))))

(assert (=> b!541370 (= res!336154 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16811 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16811 a!3154)) (= (select (arr!16447 a!3154) resIndex!32) (select (arr!16447 a!3154) j!147))))))

(declare-fun b!541371 () Bool)

(assert (=> b!541371 (= e!313511 false)))

(declare-fun lt!247675 () SeekEntryResult!4861)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541371 (= lt!247675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16447 a!3154) j!147) mask!3216) (select (arr!16447 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541372 () Bool)

(declare-fun res!336148 () Bool)

(assert (=> b!541372 (=> (not res!336148) (not e!313511))))

(declare-datatypes ((List!10473 0))(
  ( (Nil!10470) (Cons!10469 (h!11421 (_ BitVec 64)) (t!16693 List!10473)) )
))
(declare-fun arrayNoDuplicates!0 (array!34226 (_ BitVec 32) List!10473) Bool)

(assert (=> b!541372 (= res!336148 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10470))))

(declare-fun b!541373 () Bool)

(declare-fun res!336152 () Bool)

(assert (=> b!541373 (=> (not res!336152) (not e!313510))))

(assert (=> b!541373 (= res!336152 (and (= (size!16811 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16811 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16811 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541374 () Bool)

(declare-fun res!336151 () Bool)

(assert (=> b!541374 (=> (not res!336151) (not e!313510))))

(assert (=> b!541374 (= res!336151 (validKeyInArray!0 k0!1998))))

(declare-fun b!541375 () Bool)

(declare-fun res!336156 () Bool)

(assert (=> b!541375 (=> (not res!336156) (not e!313510))))

(declare-fun arrayContainsKey!0 (array!34226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541375 (= res!336156 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49168 res!336150) b!541373))

(assert (= (and b!541373 res!336152) b!541367))

(assert (= (and b!541367 res!336153) b!541374))

(assert (= (and b!541374 res!336151) b!541375))

(assert (= (and b!541375 res!336156) b!541369))

(assert (= (and b!541369 res!336157) b!541366))

(assert (= (and b!541366 res!336149) b!541372))

(assert (= (and b!541372 res!336148) b!541370))

(assert (= (and b!541370 res!336154) b!541368))

(assert (= (and b!541368 res!336155) b!541371))

(declare-fun m!520099 () Bool)

(assert (=> b!541366 m!520099))

(declare-fun m!520101 () Bool)

(assert (=> b!541375 m!520101))

(declare-fun m!520103 () Bool)

(assert (=> b!541368 m!520103))

(assert (=> b!541368 m!520103))

(declare-fun m!520105 () Bool)

(assert (=> b!541368 m!520105))

(declare-fun m!520107 () Bool)

(assert (=> b!541369 m!520107))

(declare-fun m!520109 () Bool)

(assert (=> b!541372 m!520109))

(declare-fun m!520111 () Bool)

(assert (=> b!541370 m!520111))

(assert (=> b!541370 m!520103))

(declare-fun m!520113 () Bool)

(assert (=> start!49168 m!520113))

(declare-fun m!520115 () Bool)

(assert (=> start!49168 m!520115))

(declare-fun m!520117 () Bool)

(assert (=> b!541374 m!520117))

(assert (=> b!541371 m!520103))

(assert (=> b!541371 m!520103))

(declare-fun m!520119 () Bool)

(assert (=> b!541371 m!520119))

(assert (=> b!541371 m!520119))

(assert (=> b!541371 m!520103))

(declare-fun m!520121 () Bool)

(assert (=> b!541371 m!520121))

(assert (=> b!541367 m!520103))

(assert (=> b!541367 m!520103))

(declare-fun m!520123 () Bool)

(assert (=> b!541367 m!520123))

(check-sat (not b!541375) (not b!541366) (not start!49168) (not b!541368) (not b!541369) (not b!541374) (not b!541372) (not b!541367) (not b!541371))
(check-sat)
