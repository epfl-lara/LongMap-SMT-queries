; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31718 () Bool)

(assert start!31718)

(declare-fun b!316941 () Bool)

(declare-fun res!171719 () Bool)

(declare-fun e!197097 () Bool)

(assert (=> b!316941 (=> (not res!171719) (not e!197097))))

(declare-datatypes ((array!16140 0))(
  ( (array!16141 (arr!7637 (Array (_ BitVec 32) (_ BitVec 64))) (size!7989 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16140)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16140 (_ BitVec 32)) Bool)

(assert (=> b!316941 (= res!171719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316942 () Bool)

(declare-fun res!171720 () Bool)

(assert (=> b!316942 (=> (not res!171720) (not e!197097))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2777 0))(
  ( (MissingZero!2777 (index!13284 (_ BitVec 32))) (Found!2777 (index!13285 (_ BitVec 32))) (Intermediate!2777 (undefined!3589 Bool) (index!13286 (_ BitVec 32)) (x!31545 (_ BitVec 32))) (Undefined!2777) (MissingVacant!2777 (index!13287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16140 (_ BitVec 32)) SeekEntryResult!2777)

(assert (=> b!316942 (= res!171720 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2777 i!1240)))))

(declare-fun b!316943 () Bool)

(declare-fun e!197095 () Bool)

(assert (=> b!316943 (= e!197095 (not true))))

(declare-fun lt!154754 () SeekEntryResult!2777)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16140 (_ BitVec 32)) SeekEntryResult!2777)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316943 (= lt!154754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!316944 () Bool)

(declare-fun e!197098 () Bool)

(assert (=> b!316944 (= e!197098 e!197095)))

(declare-fun res!171716 () Bool)

(assert (=> b!316944 (=> (not res!171716) (not e!197095))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154755 () SeekEntryResult!2777)

(assert (=> b!316944 (= res!171716 (and (= lt!154754 lt!154755) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7637 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!316944 (= lt!154754 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!316945 () Bool)

(declare-fun res!171723 () Bool)

(assert (=> b!316945 (=> (not res!171723) (not e!197097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316945 (= res!171723 (validKeyInArray!0 k!2441))))

(declare-fun res!171721 () Bool)

(assert (=> start!31718 (=> (not res!171721) (not e!197097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31718 (= res!171721 (validMask!0 mask!3709))))

(assert (=> start!31718 e!197097))

(declare-fun array_inv!5600 (array!16140) Bool)

(assert (=> start!31718 (array_inv!5600 a!3293)))

(assert (=> start!31718 true))

(declare-fun b!316946 () Bool)

(declare-fun res!171715 () Bool)

(assert (=> b!316946 (=> (not res!171715) (not e!197098))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316946 (= res!171715 (and (= (select (arr!7637 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7989 a!3293))))))

(declare-fun b!316947 () Bool)

(declare-fun res!171717 () Bool)

(assert (=> b!316947 (=> (not res!171717) (not e!197097))))

(declare-fun arrayContainsKey!0 (array!16140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316947 (= res!171717 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316948 () Bool)

(declare-fun res!171722 () Bool)

(assert (=> b!316948 (=> (not res!171722) (not e!197097))))

(assert (=> b!316948 (= res!171722 (and (= (size!7989 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7989 a!3293))))))

(declare-fun b!316949 () Bool)

(assert (=> b!316949 (= e!197097 e!197098)))

(declare-fun res!171718 () Bool)

(assert (=> b!316949 (=> (not res!171718) (not e!197098))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316949 (= res!171718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154755))))

(assert (=> b!316949 (= lt!154755 (Intermediate!2777 false resIndex!52 resX!52))))

(assert (= (and start!31718 res!171721) b!316948))

(assert (= (and b!316948 res!171722) b!316945))

(assert (= (and b!316945 res!171723) b!316947))

(assert (= (and b!316947 res!171717) b!316942))

(assert (= (and b!316942 res!171720) b!316941))

(assert (= (and b!316941 res!171719) b!316949))

(assert (= (and b!316949 res!171718) b!316946))

(assert (= (and b!316946 res!171715) b!316944))

(assert (= (and b!316944 res!171716) b!316943))

(declare-fun m!325685 () Bool)

(assert (=> b!316947 m!325685))

(declare-fun m!325687 () Bool)

(assert (=> b!316942 m!325687))

(declare-fun m!325689 () Bool)

(assert (=> b!316945 m!325689))

(declare-fun m!325691 () Bool)

(assert (=> b!316941 m!325691))

(declare-fun m!325693 () Bool)

(assert (=> b!316946 m!325693))

(declare-fun m!325695 () Bool)

(assert (=> b!316944 m!325695))

(declare-fun m!325697 () Bool)

(assert (=> b!316944 m!325697))

(declare-fun m!325699 () Bool)

(assert (=> start!31718 m!325699))

(declare-fun m!325701 () Bool)

(assert (=> start!31718 m!325701))

(declare-fun m!325703 () Bool)

(assert (=> b!316949 m!325703))

(assert (=> b!316949 m!325703))

(declare-fun m!325705 () Bool)

(assert (=> b!316949 m!325705))

(declare-fun m!325707 () Bool)

(assert (=> b!316943 m!325707))

(assert (=> b!316943 m!325707))

(declare-fun m!325709 () Bool)

(assert (=> b!316943 m!325709))

(push 1)

