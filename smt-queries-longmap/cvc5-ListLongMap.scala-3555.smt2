; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48900 () Bool)

(assert start!48900)

(declare-fun b!538973 () Bool)

(declare-fun res!334179 () Bool)

(declare-fun e!312507 () Bool)

(assert (=> b!538973 (=> (not res!334179) (not e!312507))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538973 (= res!334179 (validKeyInArray!0 k!1998))))

(declare-fun b!538974 () Bool)

(declare-fun e!312506 () Bool)

(assert (=> b!538974 (= e!312506 false)))

(declare-fun lt!247032 () Bool)

(declare-datatypes ((array!34112 0))(
  ( (array!34113 (arr!16395 (Array (_ BitVec 32) (_ BitVec 64))) (size!16759 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34112)

(declare-datatypes ((List!10514 0))(
  ( (Nil!10511) (Cons!10510 (h!11453 (_ BitVec 64)) (t!16742 List!10514)) )
))
(declare-fun arrayNoDuplicates!0 (array!34112 (_ BitVec 32) List!10514) Bool)

(assert (=> b!538974 (= lt!247032 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10511))))

(declare-fun b!538975 () Bool)

(declare-fun res!334180 () Bool)

(assert (=> b!538975 (=> (not res!334180) (not e!312507))))

(declare-fun arrayContainsKey!0 (array!34112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538975 (= res!334180 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!334182 () Bool)

(assert (=> start!48900 (=> (not res!334182) (not e!312507))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48900 (= res!334182 (validMask!0 mask!3216))))

(assert (=> start!48900 e!312507))

(assert (=> start!48900 true))

(declare-fun array_inv!12191 (array!34112) Bool)

(assert (=> start!48900 (array_inv!12191 a!3154)))

(declare-fun b!538976 () Bool)

(declare-fun res!334178 () Bool)

(assert (=> b!538976 (=> (not res!334178) (not e!312507))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538976 (= res!334178 (validKeyInArray!0 (select (arr!16395 a!3154) j!147)))))

(declare-fun b!538977 () Bool)

(declare-fun res!334181 () Bool)

(assert (=> b!538977 (=> (not res!334181) (not e!312507))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538977 (= res!334181 (and (= (size!16759 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16759 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16759 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538978 () Bool)

(assert (=> b!538978 (= e!312507 e!312506)))

(declare-fun res!334184 () Bool)

(assert (=> b!538978 (=> (not res!334184) (not e!312506))))

(declare-datatypes ((SeekEntryResult!4853 0))(
  ( (MissingZero!4853 (index!21636 (_ BitVec 32))) (Found!4853 (index!21637 (_ BitVec 32))) (Intermediate!4853 (undefined!5665 Bool) (index!21638 (_ BitVec 32)) (x!50556 (_ BitVec 32))) (Undefined!4853) (MissingVacant!4853 (index!21639 (_ BitVec 32))) )
))
(declare-fun lt!247033 () SeekEntryResult!4853)

(assert (=> b!538978 (= res!334184 (or (= lt!247033 (MissingZero!4853 i!1153)) (= lt!247033 (MissingVacant!4853 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34112 (_ BitVec 32)) SeekEntryResult!4853)

(assert (=> b!538978 (= lt!247033 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538979 () Bool)

(declare-fun res!334183 () Bool)

(assert (=> b!538979 (=> (not res!334183) (not e!312506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34112 (_ BitVec 32)) Bool)

(assert (=> b!538979 (= res!334183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48900 res!334182) b!538977))

(assert (= (and b!538977 res!334181) b!538976))

(assert (= (and b!538976 res!334178) b!538973))

(assert (= (and b!538973 res!334179) b!538975))

(assert (= (and b!538975 res!334180) b!538978))

(assert (= (and b!538978 res!334184) b!538979))

(assert (= (and b!538979 res!334183) b!538974))

(declare-fun m!518085 () Bool)

(assert (=> b!538976 m!518085))

(assert (=> b!538976 m!518085))

(declare-fun m!518087 () Bool)

(assert (=> b!538976 m!518087))

(declare-fun m!518089 () Bool)

(assert (=> b!538974 m!518089))

(declare-fun m!518091 () Bool)

(assert (=> start!48900 m!518091))

(declare-fun m!518093 () Bool)

(assert (=> start!48900 m!518093))

(declare-fun m!518095 () Bool)

(assert (=> b!538978 m!518095))

(declare-fun m!518097 () Bool)

(assert (=> b!538973 m!518097))

(declare-fun m!518099 () Bool)

(assert (=> b!538979 m!518099))

(declare-fun m!518101 () Bool)

(assert (=> b!538975 m!518101))

(push 1)

(assert (not start!48900))

(assert (not b!538976))

(assert (not b!538978))

(assert (not b!538974))

(assert (not b!538979))

(assert (not b!538975))

(assert (not b!538973))

(check-sat)

