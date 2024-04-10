; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32470 () Bool)

(assert start!32470)

(declare-fun b!324503 () Bool)

(declare-fun e!200297 () Bool)

(declare-fun e!200299 () Bool)

(assert (=> b!324503 (= e!200297 e!200299)))

(declare-fun res!177840 () Bool)

(assert (=> b!324503 (=> (not res!177840) (not e!200299))))

(declare-datatypes ((array!16609 0))(
  ( (array!16610 (arr!7862 (Array (_ BitVec 32) (_ BitVec 64))) (size!8214 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16609)

(declare-datatypes ((SeekEntryResult!2993 0))(
  ( (MissingZero!2993 (index!14148 (_ BitVec 32))) (Found!2993 (index!14149 (_ BitVec 32))) (Intermediate!2993 (undefined!3805 Bool) (index!14150 (_ BitVec 32)) (x!32397 (_ BitVec 32))) (Undefined!2993) (MissingVacant!2993 (index!14151 (_ BitVec 32))) )
))
(declare-fun lt!156816 () SeekEntryResult!2993)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16609 (_ BitVec 32)) SeekEntryResult!2993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324503 (= res!177840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156816))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324503 (= lt!156816 (Intermediate!2993 false resIndex!58 resX!58))))

(declare-fun b!324504 () Bool)

(declare-fun res!177839 () Bool)

(assert (=> b!324504 (=> (not res!177839) (not e!200297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16609 (_ BitVec 32)) Bool)

(assert (=> b!324504 (= res!177839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324505 () Bool)

(declare-fun res!177843 () Bool)

(assert (=> b!324505 (=> (not res!177843) (not e!200297))))

(declare-fun arrayContainsKey!0 (array!16609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324505 (= res!177843 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324506 () Bool)

(declare-fun res!177835 () Bool)

(assert (=> b!324506 (=> (not res!177835) (not e!200299))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324506 (= res!177835 (and (= (select (arr!7862 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8214 a!3305))))))

(declare-fun res!177834 () Bool)

(assert (=> start!32470 (=> (not res!177834) (not e!200297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32470 (= res!177834 (validMask!0 mask!3777))))

(assert (=> start!32470 e!200297))

(declare-fun array_inv!5825 (array!16609) Bool)

(assert (=> start!32470 (array_inv!5825 a!3305)))

(assert (=> start!32470 true))

(declare-fun b!324507 () Bool)

(declare-fun res!177837 () Bool)

(assert (=> b!324507 (=> (not res!177837) (not e!200297))))

(assert (=> b!324507 (= res!177837 (and (= (size!8214 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8214 a!3305))))))

(declare-fun b!324508 () Bool)

(declare-fun res!177836 () Bool)

(assert (=> b!324508 (=> (not res!177836) (not e!200299))))

(assert (=> b!324508 (= res!177836 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156816))))

(declare-fun b!324509 () Bool)

(assert (=> b!324509 (= e!200299 false)))

(declare-fun lt!156815 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324509 (= lt!156815 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324510 () Bool)

(declare-fun res!177841 () Bool)

(assert (=> b!324510 (=> (not res!177841) (not e!200297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324510 (= res!177841 (validKeyInArray!0 k!2497))))

(declare-fun b!324511 () Bool)

(declare-fun res!177838 () Bool)

(assert (=> b!324511 (=> (not res!177838) (not e!200297))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16609 (_ BitVec 32)) SeekEntryResult!2993)

(assert (=> b!324511 (= res!177838 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2993 i!1250)))))

(declare-fun b!324512 () Bool)

(declare-fun res!177842 () Bool)

(assert (=> b!324512 (=> (not res!177842) (not e!200299))))

(assert (=> b!324512 (= res!177842 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7862 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32470 res!177834) b!324507))

(assert (= (and b!324507 res!177837) b!324510))

(assert (= (and b!324510 res!177841) b!324505))

(assert (= (and b!324505 res!177843) b!324511))

(assert (= (and b!324511 res!177838) b!324504))

(assert (= (and b!324504 res!177839) b!324503))

(assert (= (and b!324503 res!177840) b!324506))

(assert (= (and b!324506 res!177835) b!324508))

(assert (= (and b!324508 res!177836) b!324512))

(assert (= (and b!324512 res!177842) b!324509))

(declare-fun m!331535 () Bool)

(assert (=> b!324512 m!331535))

(declare-fun m!331537 () Bool)

(assert (=> b!324511 m!331537))

(declare-fun m!331539 () Bool)

(assert (=> b!324503 m!331539))

(assert (=> b!324503 m!331539))

(declare-fun m!331541 () Bool)

(assert (=> b!324503 m!331541))

(declare-fun m!331543 () Bool)

(assert (=> start!32470 m!331543))

(declare-fun m!331545 () Bool)

(assert (=> start!32470 m!331545))

(declare-fun m!331547 () Bool)

(assert (=> b!324508 m!331547))

(declare-fun m!331549 () Bool)

(assert (=> b!324505 m!331549))

(declare-fun m!331551 () Bool)

(assert (=> b!324506 m!331551))

(declare-fun m!331553 () Bool)

(assert (=> b!324510 m!331553))

(declare-fun m!331555 () Bool)

(assert (=> b!324504 m!331555))

(declare-fun m!331557 () Bool)

(assert (=> b!324509 m!331557))

(push 1)

