; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32462 () Bool)

(assert start!32462)

(declare-fun b!324383 () Bool)

(declare-fun res!177722 () Bool)

(declare-fun e!200263 () Bool)

(assert (=> b!324383 (=> (not res!177722) (not e!200263))))

(declare-datatypes ((array!16601 0))(
  ( (array!16602 (arr!7858 (Array (_ BitVec 32) (_ BitVec 64))) (size!8210 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16601)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324383 (= res!177722 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7858 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324384 () Bool)

(declare-fun res!177719 () Bool)

(declare-fun e!200262 () Bool)

(assert (=> b!324384 (=> (not res!177719) (not e!200262))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2989 0))(
  ( (MissingZero!2989 (index!14132 (_ BitVec 32))) (Found!2989 (index!14133 (_ BitVec 32))) (Intermediate!2989 (undefined!3801 Bool) (index!14134 (_ BitVec 32)) (x!32377 (_ BitVec 32))) (Undefined!2989) (MissingVacant!2989 (index!14135 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16601 (_ BitVec 32)) SeekEntryResult!2989)

(assert (=> b!324384 (= res!177719 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2989 i!1250)))))

(declare-fun b!324385 () Bool)

(declare-fun res!177720 () Bool)

(assert (=> b!324385 (=> (not res!177720) (not e!200262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324385 (= res!177720 (validKeyInArray!0 k!2497))))

(declare-fun b!324386 () Bool)

(assert (=> b!324386 (= e!200263 false)))

(declare-fun lt!156792 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324386 (= lt!156792 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324387 () Bool)

(declare-fun res!177715 () Bool)

(assert (=> b!324387 (=> (not res!177715) (not e!200262))))

(declare-fun arrayContainsKey!0 (array!16601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324387 (= res!177715 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324388 () Bool)

(declare-fun res!177721 () Bool)

(assert (=> b!324388 (=> (not res!177721) (not e!200263))))

(declare-fun lt!156791 () SeekEntryResult!2989)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16601 (_ BitVec 32)) SeekEntryResult!2989)

(assert (=> b!324388 (= res!177721 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156791))))

(declare-fun b!324389 () Bool)

(declare-fun res!177717 () Bool)

(assert (=> b!324389 (=> (not res!177717) (not e!200262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16601 (_ BitVec 32)) Bool)

(assert (=> b!324389 (= res!177717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177714 () Bool)

(assert (=> start!32462 (=> (not res!177714) (not e!200262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32462 (= res!177714 (validMask!0 mask!3777))))

(assert (=> start!32462 e!200262))

(declare-fun array_inv!5821 (array!16601) Bool)

(assert (=> start!32462 (array_inv!5821 a!3305)))

(assert (=> start!32462 true))

(declare-fun b!324390 () Bool)

(declare-fun res!177718 () Bool)

(assert (=> b!324390 (=> (not res!177718) (not e!200262))))

(assert (=> b!324390 (= res!177718 (and (= (size!8210 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8210 a!3305))))))

(declare-fun b!324391 () Bool)

(declare-fun res!177716 () Bool)

(assert (=> b!324391 (=> (not res!177716) (not e!200263))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324391 (= res!177716 (and (= (select (arr!7858 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8210 a!3305))))))

(declare-fun b!324392 () Bool)

(assert (=> b!324392 (= e!200262 e!200263)))

(declare-fun res!177723 () Bool)

(assert (=> b!324392 (=> (not res!177723) (not e!200263))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324392 (= res!177723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156791))))

(assert (=> b!324392 (= lt!156791 (Intermediate!2989 false resIndex!58 resX!58))))

(assert (= (and start!32462 res!177714) b!324390))

(assert (= (and b!324390 res!177718) b!324385))

(assert (= (and b!324385 res!177720) b!324387))

(assert (= (and b!324387 res!177715) b!324384))

(assert (= (and b!324384 res!177719) b!324389))

(assert (= (and b!324389 res!177717) b!324392))

(assert (= (and b!324392 res!177723) b!324391))

(assert (= (and b!324391 res!177716) b!324388))

(assert (= (and b!324388 res!177721) b!324383))

(assert (= (and b!324383 res!177722) b!324386))

(declare-fun m!331439 () Bool)

(assert (=> b!324391 m!331439))

(declare-fun m!331441 () Bool)

(assert (=> b!324388 m!331441))

(declare-fun m!331443 () Bool)

(assert (=> b!324384 m!331443))

(declare-fun m!331445 () Bool)

(assert (=> b!324385 m!331445))

(declare-fun m!331447 () Bool)

(assert (=> b!324392 m!331447))

(assert (=> b!324392 m!331447))

(declare-fun m!331449 () Bool)

(assert (=> b!324392 m!331449))

(declare-fun m!331451 () Bool)

(assert (=> b!324383 m!331451))

(declare-fun m!331453 () Bool)

(assert (=> start!32462 m!331453))

(declare-fun m!331455 () Bool)

(assert (=> start!32462 m!331455))

(declare-fun m!331457 () Bool)

(assert (=> b!324389 m!331457))

(declare-fun m!331459 () Bool)

(assert (=> b!324387 m!331459))

(declare-fun m!331461 () Bool)

(assert (=> b!324386 m!331461))

(push 1)

