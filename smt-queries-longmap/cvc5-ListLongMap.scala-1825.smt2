; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32994 () Bool)

(assert start!32994)

(declare-fun b!328688 () Bool)

(declare-fun res!181068 () Bool)

(declare-fun e!202022 () Bool)

(assert (=> b!328688 (=> (not res!181068) (not e!202022))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328688 (= res!181068 (validKeyInArray!0 k!2497))))

(declare-fun b!328689 () Bool)

(declare-fun res!181065 () Bool)

(assert (=> b!328689 (=> (not res!181065) (not e!202022))))

(declare-datatypes ((array!16813 0))(
  ( (array!16814 (arr!7953 (Array (_ BitVec 32) (_ BitVec 64))) (size!8305 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16813)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3049 0))(
  ( (MissingZero!3049 (index!14372 (_ BitVec 32))) (Found!3049 (index!14373 (_ BitVec 32))) (Intermediate!3049 (undefined!3861 Bool) (index!14374 (_ BitVec 32)) (x!32741 (_ BitVec 32))) (Undefined!3049) (MissingVacant!3049 (index!14375 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16813 (_ BitVec 32)) SeekEntryResult!3049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328689 (= res!181065 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3049 false resIndex!58 resX!58)))))

(declare-fun b!328690 () Bool)

(declare-fun res!181069 () Bool)

(assert (=> b!328690 (=> (not res!181069) (not e!202022))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16813 (_ BitVec 32)) SeekEntryResult!3049)

(assert (=> b!328690 (= res!181069 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3049 i!1250)))))

(declare-fun b!328691 () Bool)

(declare-fun res!181071 () Bool)

(assert (=> b!328691 (=> (not res!181071) (not e!202022))))

(assert (=> b!328691 (= res!181071 (and (= (size!8305 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8305 a!3305))))))

(declare-fun b!328692 () Bool)

(declare-fun res!181070 () Bool)

(assert (=> b!328692 (=> (not res!181070) (not e!202022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16813 (_ BitVec 32)) Bool)

(assert (=> b!328692 (= res!181070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328693 () Bool)

(declare-fun res!181066 () Bool)

(assert (=> b!328693 (=> (not res!181066) (not e!202022))))

(declare-fun arrayContainsKey!0 (array!16813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328693 (= res!181066 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328694 () Bool)

(assert (=> b!328694 (= e!202022 false)))

(declare-fun lt!158037 () SeekEntryResult!3049)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!328694 (= lt!158037 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328695 () Bool)

(declare-fun res!181064 () Bool)

(assert (=> b!328695 (=> (not res!181064) (not e!202022))))

(assert (=> b!328695 (= res!181064 (and (= (select (arr!7953 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8305 a!3305))))))

(declare-fun res!181067 () Bool)

(assert (=> start!32994 (=> (not res!181067) (not e!202022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32994 (= res!181067 (validMask!0 mask!3777))))

(assert (=> start!32994 e!202022))

(declare-fun array_inv!5903 (array!16813) Bool)

(assert (=> start!32994 (array_inv!5903 a!3305)))

(assert (=> start!32994 true))

(assert (= (and start!32994 res!181067) b!328691))

(assert (= (and b!328691 res!181071) b!328688))

(assert (= (and b!328688 res!181068) b!328693))

(assert (= (and b!328693 res!181066) b!328690))

(assert (= (and b!328690 res!181069) b!328692))

(assert (= (and b!328692 res!181070) b!328689))

(assert (= (and b!328689 res!181065) b!328695))

(assert (= (and b!328695 res!181064) b!328694))

(declare-fun m!334805 () Bool)

(assert (=> b!328695 m!334805))

(declare-fun m!334807 () Bool)

(assert (=> b!328693 m!334807))

(declare-fun m!334809 () Bool)

(assert (=> b!328688 m!334809))

(declare-fun m!334811 () Bool)

(assert (=> b!328690 m!334811))

(declare-fun m!334813 () Bool)

(assert (=> b!328692 m!334813))

(declare-fun m!334815 () Bool)

(assert (=> start!32994 m!334815))

(declare-fun m!334817 () Bool)

(assert (=> start!32994 m!334817))

(declare-fun m!334819 () Bool)

(assert (=> b!328694 m!334819))

(declare-fun m!334821 () Bool)

(assert (=> b!328689 m!334821))

(assert (=> b!328689 m!334821))

(declare-fun m!334823 () Bool)

(assert (=> b!328689 m!334823))

(push 1)

(assert (not start!32994))

(assert (not b!328688))

(assert (not b!328690))

(assert (not b!328694))

(assert (not b!328692))

(assert (not b!328689))

(assert (not b!328693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

