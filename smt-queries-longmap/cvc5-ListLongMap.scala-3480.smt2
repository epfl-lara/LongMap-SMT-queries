; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48222 () Bool)

(assert start!48222)

(declare-fun b!530863 () Bool)

(declare-fun res!326570 () Bool)

(declare-fun e!309230 () Bool)

(assert (=> b!530863 (=> (not res!326570) (not e!309230))))

(declare-datatypes ((array!33647 0))(
  ( (array!33648 (arr!16170 (Array (_ BitVec 32) (_ BitVec 64))) (size!16534 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33647)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530863 (= res!326570 (validKeyInArray!0 (select (arr!16170 a!3154) j!147)))))

(declare-fun b!530864 () Bool)

(declare-fun res!326571 () Bool)

(assert (=> b!530864 (=> (not res!326571) (not e!309230))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530864 (= res!326571 (validKeyInArray!0 k!1998))))

(declare-fun b!530866 () Bool)

(declare-fun res!326573 () Bool)

(assert (=> b!530866 (=> (not res!326573) (not e!309230))))

(declare-fun arrayContainsKey!0 (array!33647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530866 (= res!326573 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530867 () Bool)

(declare-fun res!326569 () Bool)

(assert (=> b!530867 (=> (not res!326569) (not e!309230))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530867 (= res!326569 (and (= (size!16534 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16534 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16534 a!3154)) (not (= i!1153 j!147))))))

(declare-datatypes ((SeekEntryResult!4628 0))(
  ( (MissingZero!4628 (index!20736 (_ BitVec 32))) (Found!4628 (index!20737 (_ BitVec 32))) (Intermediate!4628 (undefined!5440 Bool) (index!20738 (_ BitVec 32)) (x!49722 (_ BitVec 32))) (Undefined!4628) (MissingVacant!4628 (index!20739 (_ BitVec 32))) )
))
(declare-fun lt!244813 () SeekEntryResult!4628)

(declare-fun b!530865 () Bool)

(assert (=> b!530865 (= e!309230 (and (or (= lt!244813 (MissingZero!4628 i!1153)) (= lt!244813 (MissingVacant!4628 i!1153))) (bvsgt #b00000000000000000000000000000000 (size!16534 a!3154))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33647 (_ BitVec 32)) SeekEntryResult!4628)

(assert (=> b!530865 (= lt!244813 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326572 () Bool)

(assert (=> start!48222 (=> (not res!326572) (not e!309230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48222 (= res!326572 (validMask!0 mask!3216))))

(assert (=> start!48222 e!309230))

(assert (=> start!48222 true))

(declare-fun array_inv!11966 (array!33647) Bool)

(assert (=> start!48222 (array_inv!11966 a!3154)))

(assert (= (and start!48222 res!326572) b!530867))

(assert (= (and b!530867 res!326569) b!530863))

(assert (= (and b!530863 res!326570) b!530864))

(assert (= (and b!530864 res!326571) b!530866))

(assert (= (and b!530866 res!326573) b!530865))

(declare-fun m!511407 () Bool)

(assert (=> b!530865 m!511407))

(declare-fun m!511409 () Bool)

(assert (=> b!530866 m!511409))

(declare-fun m!511411 () Bool)

(assert (=> b!530864 m!511411))

(declare-fun m!511413 () Bool)

(assert (=> start!48222 m!511413))

(declare-fun m!511415 () Bool)

(assert (=> start!48222 m!511415))

(declare-fun m!511417 () Bool)

(assert (=> b!530863 m!511417))

(assert (=> b!530863 m!511417))

(declare-fun m!511419 () Bool)

(assert (=> b!530863 m!511419))

(push 1)

(assert (not b!530864))

