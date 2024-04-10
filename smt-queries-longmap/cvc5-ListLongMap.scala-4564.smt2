; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63682 () Bool)

(assert start!63682)

(declare-fun b!716876 () Bool)

(declare-fun res!479663 () Bool)

(declare-fun e!402544 () Bool)

(assert (=> b!716876 (=> (not res!479663) (not e!402544))))

(declare-datatypes ((array!40578 0))(
  ( (array!40579 (arr!19422 (Array (_ BitVec 32) (_ BitVec 64))) (size!19843 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40578)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716876 (= res!479663 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716877 () Bool)

(declare-fun res!479664 () Bool)

(assert (=> b!716877 (=> (not res!479664) (not e!402544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716877 (= res!479664 (validKeyInArray!0 k!2102))))

(declare-fun b!716878 () Bool)

(assert (=> b!716878 (= e!402544 false)))

(declare-datatypes ((SeekEntryResult!7022 0))(
  ( (MissingZero!7022 (index!30456 (_ BitVec 32))) (Found!7022 (index!30457 (_ BitVec 32))) (Intermediate!7022 (undefined!7834 Bool) (index!30458 (_ BitVec 32)) (x!61490 (_ BitVec 32))) (Undefined!7022) (MissingVacant!7022 (index!30459 (_ BitVec 32))) )
))
(declare-fun lt!318968 () SeekEntryResult!7022)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40578 (_ BitVec 32)) SeekEntryResult!7022)

(assert (=> b!716878 (= lt!318968 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!716879 () Bool)

(declare-fun res!479665 () Bool)

(assert (=> b!716879 (=> (not res!479665) (not e!402544))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716879 (= res!479665 (and (= (size!19843 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19843 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19843 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716880 () Bool)

(declare-fun res!479662 () Bool)

(assert (=> b!716880 (=> (not res!479662) (not e!402544))))

(assert (=> b!716880 (= res!479662 (validKeyInArray!0 (select (arr!19422 a!3186) j!159)))))

(declare-fun res!479666 () Bool)

(assert (=> start!63682 (=> (not res!479666) (not e!402544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63682 (= res!479666 (validMask!0 mask!3328))))

(assert (=> start!63682 e!402544))

(declare-fun array_inv!15218 (array!40578) Bool)

(assert (=> start!63682 (array_inv!15218 a!3186)))

(assert (=> start!63682 true))

(assert (= (and start!63682 res!479666) b!716879))

(assert (= (and b!716879 res!479665) b!716880))

(assert (= (and b!716880 res!479662) b!716877))

(assert (= (and b!716877 res!479664) b!716876))

(assert (= (and b!716876 res!479663) b!716878))

(declare-fun m!672859 () Bool)

(assert (=> start!63682 m!672859))

(declare-fun m!672861 () Bool)

(assert (=> start!63682 m!672861))

(declare-fun m!672863 () Bool)

(assert (=> b!716880 m!672863))

(assert (=> b!716880 m!672863))

(declare-fun m!672865 () Bool)

(assert (=> b!716880 m!672865))

(declare-fun m!672867 () Bool)

(assert (=> b!716876 m!672867))

(declare-fun m!672869 () Bool)

(assert (=> b!716878 m!672869))

(declare-fun m!672871 () Bool)

(assert (=> b!716877 m!672871))

(push 1)

(assert (not b!716877))

(assert (not start!63682))

(assert (not b!716876))

(assert (not b!716880))

(assert (not b!716878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

