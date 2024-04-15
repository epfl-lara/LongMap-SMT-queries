; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33000 () Bool)

(assert start!33000)

(declare-fun b!328538 () Bool)

(declare-fun res!181017 () Bool)

(declare-fun e!201899 () Bool)

(assert (=> b!328538 (=> (not res!181017) (not e!201899))))

(declare-datatypes ((array!16810 0))(
  ( (array!16811 (arr!7952 (Array (_ BitVec 32) (_ BitVec 64))) (size!8305 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16810)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3082 0))(
  ( (MissingZero!3082 (index!14504 (_ BitVec 32))) (Found!3082 (index!14505 (_ BitVec 32))) (Intermediate!3082 (undefined!3894 Bool) (index!14506 (_ BitVec 32)) (x!32780 (_ BitVec 32))) (Undefined!3082) (MissingVacant!3082 (index!14507 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16810 (_ BitVec 32)) SeekEntryResult!3082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328538 (= res!181017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3082 false resIndex!58 resX!58)))))

(declare-fun b!328539 () Bool)

(declare-fun res!181015 () Bool)

(assert (=> b!328539 (=> (not res!181015) (not e!201899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328539 (= res!181015 (validKeyInArray!0 k!2497))))

(declare-fun res!181016 () Bool)

(assert (=> start!33000 (=> (not res!181016) (not e!201899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33000 (= res!181016 (validMask!0 mask!3777))))

(assert (=> start!33000 e!201899))

(declare-fun array_inv!5924 (array!16810) Bool)

(assert (=> start!33000 (array_inv!5924 a!3305)))

(assert (=> start!33000 true))

(declare-fun b!328540 () Bool)

(declare-fun res!181011 () Bool)

(assert (=> b!328540 (=> (not res!181011) (not e!201899))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328540 (= res!181011 (and (= (select (arr!7952 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8305 a!3305))))))

(declare-fun b!328541 () Bool)

(declare-fun res!181014 () Bool)

(assert (=> b!328541 (=> (not res!181014) (not e!201899))))

(declare-fun arrayContainsKey!0 (array!16810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328541 (= res!181014 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328542 () Bool)

(declare-fun res!181010 () Bool)

(assert (=> b!328542 (=> (not res!181010) (not e!201899))))

(assert (=> b!328542 (= res!181010 (and (= (size!8305 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8305 a!3305))))))

(declare-fun b!328543 () Bool)

(declare-fun res!181013 () Bool)

(assert (=> b!328543 (=> (not res!181013) (not e!201899))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16810 (_ BitVec 32)) SeekEntryResult!3082)

(assert (=> b!328543 (= res!181013 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3082 i!1250)))))

(declare-fun b!328544 () Bool)

(assert (=> b!328544 (= e!201899 false)))

(declare-fun lt!157793 () SeekEntryResult!3082)

(assert (=> b!328544 (= lt!157793 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328545 () Bool)

(declare-fun res!181012 () Bool)

(assert (=> b!328545 (=> (not res!181012) (not e!201899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16810 (_ BitVec 32)) Bool)

(assert (=> b!328545 (= res!181012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!33000 res!181016) b!328542))

(assert (= (and b!328542 res!181010) b!328539))

(assert (= (and b!328539 res!181015) b!328541))

(assert (= (and b!328541 res!181014) b!328543))

(assert (= (and b!328543 res!181013) b!328545))

(assert (= (and b!328545 res!181012) b!328538))

(assert (= (and b!328538 res!181017) b!328540))

(assert (= (and b!328540 res!181011) b!328544))

(declare-fun m!333935 () Bool)

(assert (=> b!328545 m!333935))

(declare-fun m!333937 () Bool)

(assert (=> b!328538 m!333937))

(assert (=> b!328538 m!333937))

(declare-fun m!333939 () Bool)

(assert (=> b!328538 m!333939))

(declare-fun m!333941 () Bool)

(assert (=> b!328543 m!333941))

(declare-fun m!333943 () Bool)

(assert (=> start!33000 m!333943))

(declare-fun m!333945 () Bool)

(assert (=> start!33000 m!333945))

(declare-fun m!333947 () Bool)

(assert (=> b!328544 m!333947))

(declare-fun m!333949 () Bool)

(assert (=> b!328541 m!333949))

(declare-fun m!333951 () Bool)

(assert (=> b!328540 m!333951))

(declare-fun m!333953 () Bool)

(assert (=> b!328539 m!333953))

(push 1)

(assert (not b!328544))

(assert (not b!328545))

(assert (not b!328539))

(assert (not start!33000))

(assert (not b!328541))

(assert (not b!328543))

(assert (not b!328538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

