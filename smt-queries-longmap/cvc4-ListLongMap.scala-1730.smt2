; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31836 () Bool)

(assert start!31836)

(declare-fun res!172762 () Bool)

(declare-fun e!197737 () Bool)

(assert (=> start!31836 (=> (not res!172762) (not e!197737))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31836 (= res!172762 (validMask!0 mask!3709))))

(assert (=> start!31836 e!197737))

(declare-datatypes ((array!16207 0))(
  ( (array!16208 (arr!7669 (Array (_ BitVec 32) (_ BitVec 64))) (size!8021 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16207)

(declare-fun array_inv!5632 (array!16207) Bool)

(assert (=> start!31836 (array_inv!5632 a!3293)))

(assert (=> start!31836 true))

(declare-fun b!318182 () Bool)

(declare-fun res!172766 () Bool)

(assert (=> b!318182 (=> (not res!172766) (not e!197737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16207 (_ BitVec 32)) Bool)

(assert (=> b!318182 (= res!172766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318183 () Bool)

(declare-fun res!172769 () Bool)

(assert (=> b!318183 (=> (not res!172769) (not e!197737))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318183 (= res!172769 (and (= (size!8021 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8021 a!3293))))))

(declare-fun b!318184 () Bool)

(declare-fun e!197738 () Bool)

(assert (=> b!318184 (= e!197738 (not true))))

(declare-fun e!197740 () Bool)

(assert (=> b!318184 e!197740))

(declare-fun res!172765 () Bool)

(assert (=> b!318184 (=> (not res!172765) (not e!197740))))

(declare-fun lt!155249 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2809 0))(
  ( (MissingZero!2809 (index!13412 (_ BitVec 32))) (Found!2809 (index!13413 (_ BitVec 32))) (Intermediate!2809 (undefined!3621 Bool) (index!13414 (_ BitVec 32)) (x!31666 (_ BitVec 32))) (Undefined!2809) (MissingVacant!2809 (index!13415 (_ BitVec 32))) )
))
(declare-fun lt!155248 () SeekEntryResult!2809)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16207 (_ BitVec 32)) SeekEntryResult!2809)

(assert (=> b!318184 (= res!172765 (= lt!155248 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155249 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318184 (= lt!155249 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318185 () Bool)

(declare-fun res!172764 () Bool)

(assert (=> b!318185 (=> (not res!172764) (not e!197737))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16207 (_ BitVec 32)) SeekEntryResult!2809)

(assert (=> b!318185 (= res!172764 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2809 i!1240)))))

(declare-fun b!318186 () Bool)

(declare-fun e!197739 () Bool)

(assert (=> b!318186 (= e!197737 e!197739)))

(declare-fun res!172761 () Bool)

(assert (=> b!318186 (=> (not res!172761) (not e!197739))))

(declare-fun lt!155250 () SeekEntryResult!2809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318186 (= res!172761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155250))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318186 (= lt!155250 (Intermediate!2809 false resIndex!52 resX!52))))

(declare-fun b!318187 () Bool)

(declare-fun res!172768 () Bool)

(assert (=> b!318187 (=> (not res!172768) (not e!197739))))

(assert (=> b!318187 (= res!172768 (and (= (select (arr!7669 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8021 a!3293))))))

(declare-fun b!318188 () Bool)

(declare-fun lt!155247 () array!16207)

(assert (=> b!318188 (= e!197740 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155247 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155249 k!2441 lt!155247 mask!3709)))))

(assert (=> b!318188 (= lt!155247 (array!16208 (store (arr!7669 a!3293) i!1240 k!2441) (size!8021 a!3293)))))

(declare-fun b!318189 () Bool)

(declare-fun res!172767 () Bool)

(assert (=> b!318189 (=> (not res!172767) (not e!197737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318189 (= res!172767 (validKeyInArray!0 k!2441))))

(declare-fun b!318190 () Bool)

(assert (=> b!318190 (= e!197739 e!197738)))

(declare-fun res!172770 () Bool)

(assert (=> b!318190 (=> (not res!172770) (not e!197738))))

(assert (=> b!318190 (= res!172770 (and (= lt!155248 lt!155250) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7669 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318190 (= lt!155248 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318191 () Bool)

(declare-fun res!172763 () Bool)

(assert (=> b!318191 (=> (not res!172763) (not e!197737))))

(declare-fun arrayContainsKey!0 (array!16207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318191 (= res!172763 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31836 res!172762) b!318183))

(assert (= (and b!318183 res!172769) b!318189))

(assert (= (and b!318189 res!172767) b!318191))

(assert (= (and b!318191 res!172763) b!318185))

(assert (= (and b!318185 res!172764) b!318182))

(assert (= (and b!318182 res!172766) b!318186))

(assert (= (and b!318186 res!172761) b!318187))

(assert (= (and b!318187 res!172768) b!318190))

(assert (= (and b!318190 res!172770) b!318184))

(assert (= (and b!318184 res!172765) b!318188))

(declare-fun m!326865 () Bool)

(assert (=> b!318182 m!326865))

(declare-fun m!326867 () Bool)

(assert (=> b!318187 m!326867))

(declare-fun m!326869 () Bool)

(assert (=> b!318191 m!326869))

(declare-fun m!326871 () Bool)

(assert (=> b!318184 m!326871))

(declare-fun m!326873 () Bool)

(assert (=> b!318184 m!326873))

(declare-fun m!326875 () Bool)

(assert (=> start!31836 m!326875))

(declare-fun m!326877 () Bool)

(assert (=> start!31836 m!326877))

(declare-fun m!326879 () Bool)

(assert (=> b!318186 m!326879))

(assert (=> b!318186 m!326879))

(declare-fun m!326881 () Bool)

(assert (=> b!318186 m!326881))

(declare-fun m!326883 () Bool)

(assert (=> b!318190 m!326883))

(declare-fun m!326885 () Bool)

(assert (=> b!318190 m!326885))

(declare-fun m!326887 () Bool)

(assert (=> b!318188 m!326887))

(declare-fun m!326889 () Bool)

(assert (=> b!318188 m!326889))

(declare-fun m!326891 () Bool)

(assert (=> b!318188 m!326891))

(declare-fun m!326893 () Bool)

(assert (=> b!318185 m!326893))

(declare-fun m!326895 () Bool)

(assert (=> b!318189 m!326895))

(push 1)

(assert (not b!318185))

(assert (not b!318182))

(assert (not start!31836))

(assert (not b!318190))

(assert (not b!318189))

