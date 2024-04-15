; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32512 () Bool)

(assert start!32512)

(declare-fun b!325068 () Bool)

(declare-fun res!178552 () Bool)

(declare-fun e!200375 () Bool)

(assert (=> b!325068 (=> (not res!178552) (not e!200375))))

(declare-datatypes ((array!16655 0))(
  ( (array!16656 (arr!7885 (Array (_ BitVec 32) (_ BitVec 64))) (size!8238 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16655)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3015 0))(
  ( (MissingZero!3015 (index!14236 (_ BitVec 32))) (Found!3015 (index!14237 (_ BitVec 32))) (Intermediate!3015 (undefined!3827 Bool) (index!14238 (_ BitVec 32)) (x!32486 (_ BitVec 32))) (Undefined!3015) (MissingVacant!3015 (index!14239 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16655 (_ BitVec 32)) SeekEntryResult!3015)

(assert (=> b!325068 (= res!178552 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3015 i!1250)))))

(declare-fun b!325069 () Bool)

(declare-fun res!178551 () Bool)

(declare-fun e!200374 () Bool)

(assert (=> b!325069 (=> (not res!178551) (not e!200374))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325069 (= res!178551 (and (= (select (arr!7885 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8238 a!3305))))))

(declare-fun b!325070 () Bool)

(declare-fun res!178546 () Bool)

(assert (=> b!325070 (=> (not res!178546) (not e!200375))))

(declare-fun arrayContainsKey!0 (array!16655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325070 (= res!178546 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325071 () Bool)

(declare-fun res!178545 () Bool)

(assert (=> b!325071 (=> (not res!178545) (not e!200375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16655 (_ BitVec 32)) Bool)

(assert (=> b!325071 (= res!178545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325072 () Bool)

(declare-fun res!178548 () Bool)

(assert (=> b!325072 (=> (not res!178548) (not e!200375))))

(assert (=> b!325072 (= res!178548 (and (= (size!8238 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8238 a!3305))))))

(declare-fun b!325073 () Bool)

(declare-fun res!178553 () Bool)

(assert (=> b!325073 (=> (not res!178553) (not e!200374))))

(declare-fun lt!156748 () SeekEntryResult!3015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16655 (_ BitVec 32)) SeekEntryResult!3015)

(assert (=> b!325073 (= res!178553 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156748))))

(declare-fun res!178554 () Bool)

(assert (=> start!32512 (=> (not res!178554) (not e!200375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32512 (= res!178554 (validMask!0 mask!3777))))

(assert (=> start!32512 e!200375))

(declare-fun array_inv!5857 (array!16655) Bool)

(assert (=> start!32512 (array_inv!5857 a!3305)))

(assert (=> start!32512 true))

(declare-fun b!325074 () Bool)

(declare-fun res!178547 () Bool)

(assert (=> b!325074 (=> (not res!178547) (not e!200375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325074 (= res!178547 (validKeyInArray!0 k!2497))))

(declare-fun b!325075 () Bool)

(declare-fun res!178549 () Bool)

(assert (=> b!325075 (=> (not res!178549) (not e!200374))))

(assert (=> b!325075 (= res!178549 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7885 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325076 () Bool)

(assert (=> b!325076 (= e!200375 e!200374)))

(declare-fun res!178550 () Bool)

(assert (=> b!325076 (=> (not res!178550) (not e!200374))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325076 (= res!178550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156748))))

(assert (=> b!325076 (= lt!156748 (Intermediate!3015 false resIndex!58 resX!58))))

(declare-fun b!325077 () Bool)

(assert (=> b!325077 (= e!200374 (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(declare-fun lt!156749 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325077 (= lt!156749 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32512 res!178554) b!325072))

(assert (= (and b!325072 res!178548) b!325074))

(assert (= (and b!325074 res!178547) b!325070))

(assert (= (and b!325070 res!178546) b!325068))

(assert (= (and b!325068 res!178552) b!325071))

(assert (= (and b!325071 res!178545) b!325076))

(assert (= (and b!325076 res!178550) b!325069))

(assert (= (and b!325069 res!178551) b!325073))

(assert (= (and b!325073 res!178553) b!325075))

(assert (= (and b!325075 res!178549) b!325077))

(declare-fun m!331477 () Bool)

(assert (=> b!325075 m!331477))

(declare-fun m!331479 () Bool)

(assert (=> b!325076 m!331479))

(assert (=> b!325076 m!331479))

(declare-fun m!331481 () Bool)

(assert (=> b!325076 m!331481))

(declare-fun m!331483 () Bool)

(assert (=> b!325070 m!331483))

(declare-fun m!331485 () Bool)

(assert (=> b!325069 m!331485))

(declare-fun m!331487 () Bool)

(assert (=> b!325074 m!331487))

(declare-fun m!331489 () Bool)

(assert (=> b!325077 m!331489))

(declare-fun m!331491 () Bool)

(assert (=> b!325071 m!331491))

(declare-fun m!331493 () Bool)

(assert (=> b!325068 m!331493))

(declare-fun m!331495 () Bool)

(assert (=> start!32512 m!331495))

(declare-fun m!331497 () Bool)

(assert (=> start!32512 m!331497))

(declare-fun m!331499 () Bool)

(assert (=> b!325073 m!331499))

(push 1)

(assert (not b!325074))

(assert (not start!32512))

(assert (not b!325076))

(assert (not b!325071))

(assert (not b!325070))

(assert (not b!325077))

(assert (not b!325073))

(assert (not b!325068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

