; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32994 () Bool)

(assert start!32994)

(declare-fun b!328466 () Bool)

(declare-fun res!180938 () Bool)

(declare-fun e!201881 () Bool)

(assert (=> b!328466 (=> (not res!180938) (not e!201881))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328466 (= res!180938 (validKeyInArray!0 k!2497))))

(declare-fun b!328467 () Bool)

(declare-fun res!180939 () Bool)

(assert (=> b!328467 (=> (not res!180939) (not e!201881))))

(declare-datatypes ((array!16804 0))(
  ( (array!16805 (arr!7949 (Array (_ BitVec 32) (_ BitVec 64))) (size!8302 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16804)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3079 0))(
  ( (MissingZero!3079 (index!14492 (_ BitVec 32))) (Found!3079 (index!14493 (_ BitVec 32))) (Intermediate!3079 (undefined!3891 Bool) (index!14494 (_ BitVec 32)) (x!32769 (_ BitVec 32))) (Undefined!3079) (MissingVacant!3079 (index!14495 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16804 (_ BitVec 32)) SeekEntryResult!3079)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328467 (= res!180939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3079 false resIndex!58 resX!58)))))

(declare-fun b!328468 () Bool)

(declare-fun res!180942 () Bool)

(assert (=> b!328468 (=> (not res!180942) (not e!201881))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328468 (= res!180942 (and (= (size!8302 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8302 a!3305))))))

(declare-fun b!328469 () Bool)

(declare-fun res!180945 () Bool)

(assert (=> b!328469 (=> (not res!180945) (not e!201881))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16804 (_ BitVec 32)) SeekEntryResult!3079)

(assert (=> b!328469 (= res!180945 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3079 i!1250)))))

(declare-fun b!328470 () Bool)

(declare-fun res!180944 () Bool)

(assert (=> b!328470 (=> (not res!180944) (not e!201881))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328470 (= res!180944 (and (= (select (arr!7949 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8302 a!3305))))))

(declare-fun res!180940 () Bool)

(assert (=> start!32994 (=> (not res!180940) (not e!201881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32994 (= res!180940 (validMask!0 mask!3777))))

(assert (=> start!32994 e!201881))

(declare-fun array_inv!5921 (array!16804) Bool)

(assert (=> start!32994 (array_inv!5921 a!3305)))

(assert (=> start!32994 true))

(declare-fun b!328471 () Bool)

(assert (=> b!328471 (= e!201881 false)))

(declare-fun lt!157784 () SeekEntryResult!3079)

(assert (=> b!328471 (= lt!157784 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!328472 () Bool)

(declare-fun res!180941 () Bool)

(assert (=> b!328472 (=> (not res!180941) (not e!201881))))

(declare-fun arrayContainsKey!0 (array!16804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328472 (= res!180941 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328473 () Bool)

(declare-fun res!180943 () Bool)

(assert (=> b!328473 (=> (not res!180943) (not e!201881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16804 (_ BitVec 32)) Bool)

(assert (=> b!328473 (= res!180943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32994 res!180940) b!328468))

(assert (= (and b!328468 res!180942) b!328466))

(assert (= (and b!328466 res!180938) b!328472))

(assert (= (and b!328472 res!180941) b!328469))

(assert (= (and b!328469 res!180945) b!328473))

(assert (= (and b!328473 res!180943) b!328467))

(assert (= (and b!328467 res!180939) b!328470))

(assert (= (and b!328470 res!180944) b!328471))

(declare-fun m!333875 () Bool)

(assert (=> b!328470 m!333875))

(declare-fun m!333877 () Bool)

(assert (=> start!32994 m!333877))

(declare-fun m!333879 () Bool)

(assert (=> start!32994 m!333879))

(declare-fun m!333881 () Bool)

(assert (=> b!328469 m!333881))

(declare-fun m!333883 () Bool)

(assert (=> b!328466 m!333883))

(declare-fun m!333885 () Bool)

(assert (=> b!328473 m!333885))

(declare-fun m!333887 () Bool)

(assert (=> b!328471 m!333887))

(declare-fun m!333889 () Bool)

(assert (=> b!328467 m!333889))

(assert (=> b!328467 m!333889))

(declare-fun m!333891 () Bool)

(assert (=> b!328467 m!333891))

(declare-fun m!333893 () Bool)

(assert (=> b!328472 m!333893))

(push 1)

(assert (not b!328471))

(assert (not b!328467))

(assert (not b!328466))

(assert (not b!328469))

(assert (not start!32994))

(assert (not b!328473))

(assert (not b!328472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

