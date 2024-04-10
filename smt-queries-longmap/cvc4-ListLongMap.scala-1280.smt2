; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26242 () Bool)

(assert start!26242)

(declare-fun b!271646 () Bool)

(declare-fun res!135636 () Bool)

(declare-fun e!174604 () Bool)

(assert (=> b!271646 (=> (not res!135636) (not e!174604))))

(declare-datatypes ((array!13339 0))(
  ( (array!13340 (arr!6319 (Array (_ BitVec 32) (_ BitVec 64))) (size!6671 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13339)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271646 (= res!135636 (validKeyInArray!0 (select (arr!6319 a!3325) startIndex!26)))))

(declare-fun b!271647 () Bool)

(declare-fun res!135641 () Bool)

(assert (=> b!271647 (=> (not res!135641) (not e!174604))))

(declare-datatypes ((List!4127 0))(
  ( (Nil!4124) (Cons!4123 (h!4790 (_ BitVec 64)) (t!9209 List!4127)) )
))
(declare-fun contains!1957 (List!4127 (_ BitVec 64)) Bool)

(assert (=> b!271647 (= res!135641 (not (contains!1957 Nil!4124 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271648 () Bool)

(assert (=> b!271648 (= e!174604 false)))

(declare-fun lt!135835 () Bool)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!271648 (= lt!135835 (contains!1957 Nil!4124 k!2581))))

(declare-fun b!271649 () Bool)

(declare-fun res!135639 () Bool)

(declare-fun e!174605 () Bool)

(assert (=> b!271649 (=> (not res!135639) (not e!174605))))

(declare-fun arrayContainsKey!0 (array!13339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271649 (= res!135639 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271650 () Bool)

(declare-fun res!135647 () Bool)

(assert (=> b!271650 (=> (not res!135647) (not e!174604))))

(declare-fun noDuplicate!145 (List!4127) Bool)

(assert (=> b!271650 (= res!135647 (noDuplicate!145 Nil!4124))))

(declare-fun b!271651 () Bool)

(declare-fun res!135644 () Bool)

(assert (=> b!271651 (=> (not res!135644) (not e!174605))))

(assert (=> b!271651 (= res!135644 (validKeyInArray!0 k!2581))))

(declare-fun b!271652 () Bool)

(declare-fun res!135640 () Bool)

(assert (=> b!271652 (=> (not res!135640) (not e!174604))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13339 (_ BitVec 32)) Bool)

(assert (=> b!271652 (= res!135640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271653 () Bool)

(declare-fun res!135642 () Bool)

(assert (=> b!271653 (=> (not res!135642) (not e!174604))))

(assert (=> b!271653 (= res!135642 (not (contains!1957 Nil!4124 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!135645 () Bool)

(assert (=> start!26242 (=> (not res!135645) (not e!174605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26242 (= res!135645 (validMask!0 mask!3868))))

(assert (=> start!26242 e!174605))

(declare-fun array_inv!4282 (array!13339) Bool)

(assert (=> start!26242 (array_inv!4282 a!3325)))

(assert (=> start!26242 true))

(declare-fun b!271654 () Bool)

(declare-fun res!135643 () Bool)

(assert (=> b!271654 (=> (not res!135643) (not e!174605))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271654 (= res!135643 (and (= (size!6671 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6671 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6671 a!3325))))))

(declare-fun b!271655 () Bool)

(declare-fun res!135637 () Bool)

(assert (=> b!271655 (=> (not res!135637) (not e!174605))))

(declare-fun arrayNoDuplicates!0 (array!13339 (_ BitVec 32) List!4127) Bool)

(assert (=> b!271655 (= res!135637 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4124))))

(declare-fun b!271656 () Bool)

(declare-fun res!135638 () Bool)

(assert (=> b!271656 (=> (not res!135638) (not e!174604))))

(assert (=> b!271656 (= res!135638 (not (= startIndex!26 i!1267)))))

(declare-fun b!271657 () Bool)

(declare-fun res!135648 () Bool)

(assert (=> b!271657 (=> (not res!135648) (not e!174604))))

(assert (=> b!271657 (= res!135648 (and (bvslt (size!6671 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6671 a!3325))))))

(declare-fun b!271658 () Bool)

(assert (=> b!271658 (= e!174605 e!174604)))

(declare-fun res!135646 () Bool)

(assert (=> b!271658 (=> (not res!135646) (not e!174604))))

(declare-datatypes ((SeekEntryResult!1477 0))(
  ( (MissingZero!1477 (index!8078 (_ BitVec 32))) (Found!1477 (index!8079 (_ BitVec 32))) (Intermediate!1477 (undefined!2289 Bool) (index!8080 (_ BitVec 32)) (x!26402 (_ BitVec 32))) (Undefined!1477) (MissingVacant!1477 (index!8081 (_ BitVec 32))) )
))
(declare-fun lt!135834 () SeekEntryResult!1477)

(assert (=> b!271658 (= res!135646 (or (= lt!135834 (MissingZero!1477 i!1267)) (= lt!135834 (MissingVacant!1477 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13339 (_ BitVec 32)) SeekEntryResult!1477)

(assert (=> b!271658 (= lt!135834 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26242 res!135645) b!271654))

(assert (= (and b!271654 res!135643) b!271651))

(assert (= (and b!271651 res!135644) b!271655))

(assert (= (and b!271655 res!135637) b!271649))

(assert (= (and b!271649 res!135639) b!271658))

(assert (= (and b!271658 res!135646) b!271652))

(assert (= (and b!271652 res!135640) b!271656))

(assert (= (and b!271656 res!135638) b!271646))

(assert (= (and b!271646 res!135636) b!271657))

(assert (= (and b!271657 res!135648) b!271650))

(assert (= (and b!271650 res!135647) b!271647))

(assert (= (and b!271647 res!135641) b!271653))

(assert (= (and b!271653 res!135642) b!271648))

(declare-fun m!286861 () Bool)

(assert (=> b!271658 m!286861))

(declare-fun m!286863 () Bool)

(assert (=> b!271651 m!286863))

(declare-fun m!286865 () Bool)

(assert (=> b!271652 m!286865))

(declare-fun m!286867 () Bool)

(assert (=> b!271655 m!286867))

(declare-fun m!286869 () Bool)

(assert (=> b!271646 m!286869))

(assert (=> b!271646 m!286869))

(declare-fun m!286871 () Bool)

(assert (=> b!271646 m!286871))

(declare-fun m!286873 () Bool)

(assert (=> b!271653 m!286873))

(declare-fun m!286875 () Bool)

(assert (=> b!271649 m!286875))

(declare-fun m!286877 () Bool)

(assert (=> start!26242 m!286877))

(declare-fun m!286879 () Bool)

(assert (=> start!26242 m!286879))

(declare-fun m!286881 () Bool)

(assert (=> b!271648 m!286881))

(declare-fun m!286883 () Bool)

(assert (=> b!271650 m!286883))

(declare-fun m!286885 () Bool)

(assert (=> b!271647 m!286885))

(push 1)

(assert (not b!271648))

