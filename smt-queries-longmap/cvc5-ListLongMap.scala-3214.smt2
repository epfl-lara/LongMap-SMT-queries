; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45030 () Bool)

(assert start!45030)

(declare-fun b!494096 () Bool)

(declare-fun e!290047 () Bool)

(declare-fun e!290049 () Bool)

(assert (=> b!494096 (= e!290047 (not e!290049))))

(declare-fun res!296673 () Bool)

(assert (=> b!494096 (=> res!296673 e!290049)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223570 () (_ BitVec 32))

(declare-datatypes ((array!31975 0))(
  ( (array!31976 (arr!15372 (Array (_ BitVec 32) (_ BitVec 64))) (size!15736 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31975)

(declare-datatypes ((SeekEntryResult!3839 0))(
  ( (MissingZero!3839 (index!17535 (_ BitVec 32))) (Found!3839 (index!17536 (_ BitVec 32))) (Intermediate!3839 (undefined!4651 Bool) (index!17537 (_ BitVec 32)) (x!46613 (_ BitVec 32))) (Undefined!3839) (MissingVacant!3839 (index!17538 (_ BitVec 32))) )
))
(declare-fun lt!223565 () SeekEntryResult!3839)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31975 (_ BitVec 32)) SeekEntryResult!3839)

(assert (=> b!494096 (= res!296673 (= lt!223565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223570 (select (store (arr!15372 a!3235) i!1204 k!2280) j!176) (array!31976 (store (arr!15372 a!3235) i!1204 k!2280) (size!15736 a!3235)) mask!3524)))))

(declare-fun lt!223567 () (_ BitVec 32))

(assert (=> b!494096 (= lt!223565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223567 (select (arr!15372 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494096 (= lt!223570 (toIndex!0 (select (store (arr!15372 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494096 (= lt!223567 (toIndex!0 (select (arr!15372 a!3235) j!176) mask!3524))))

(declare-fun lt!223566 () SeekEntryResult!3839)

(assert (=> b!494096 (= lt!223566 (Found!3839 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31975 (_ BitVec 32)) SeekEntryResult!3839)

(assert (=> b!494096 (= lt!223566 (seekEntryOrOpen!0 (select (arr!15372 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31975 (_ BitVec 32)) Bool)

(assert (=> b!494096 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14624 0))(
  ( (Unit!14625) )
))
(declare-fun lt!223569 () Unit!14624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14624)

(assert (=> b!494096 (= lt!223569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494097 () Bool)

(declare-fun res!296671 () Bool)

(assert (=> b!494097 (=> res!296671 e!290049)))

(assert (=> b!494097 (= res!296671 (or (not (is-Intermediate!3839 lt!223565)) (not (undefined!4651 lt!223565))))))

(declare-fun res!296667 () Bool)

(declare-fun e!290046 () Bool)

(assert (=> start!45030 (=> (not res!296667) (not e!290046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45030 (= res!296667 (validMask!0 mask!3524))))

(assert (=> start!45030 e!290046))

(assert (=> start!45030 true))

(declare-fun array_inv!11168 (array!31975) Bool)

(assert (=> start!45030 (array_inv!11168 a!3235)))

(declare-fun b!494098 () Bool)

(assert (=> b!494098 (= e!290049 true)))

(assert (=> b!494098 (= lt!223566 Undefined!3839)))

(declare-fun b!494099 () Bool)

(assert (=> b!494099 (= e!290046 e!290047)))

(declare-fun res!296666 () Bool)

(assert (=> b!494099 (=> (not res!296666) (not e!290047))))

(declare-fun lt!223568 () SeekEntryResult!3839)

(assert (=> b!494099 (= res!296666 (or (= lt!223568 (MissingZero!3839 i!1204)) (= lt!223568 (MissingVacant!3839 i!1204))))))

(assert (=> b!494099 (= lt!223568 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494100 () Bool)

(declare-fun res!296669 () Bool)

(assert (=> b!494100 (=> (not res!296669) (not e!290046))))

(assert (=> b!494100 (= res!296669 (and (= (size!15736 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15736 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15736 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494101 () Bool)

(declare-fun res!296670 () Bool)

(assert (=> b!494101 (=> (not res!296670) (not e!290046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494101 (= res!296670 (validKeyInArray!0 k!2280))))

(declare-fun b!494102 () Bool)

(declare-fun res!296674 () Bool)

(assert (=> b!494102 (=> (not res!296674) (not e!290046))))

(declare-fun arrayContainsKey!0 (array!31975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494102 (= res!296674 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494103 () Bool)

(declare-fun res!296672 () Bool)

(assert (=> b!494103 (=> (not res!296672) (not e!290047))))

(assert (=> b!494103 (= res!296672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494104 () Bool)

(declare-fun res!296675 () Bool)

(assert (=> b!494104 (=> (not res!296675) (not e!290046))))

(assert (=> b!494104 (= res!296675 (validKeyInArray!0 (select (arr!15372 a!3235) j!176)))))

(declare-fun b!494105 () Bool)

(declare-fun res!296668 () Bool)

(assert (=> b!494105 (=> (not res!296668) (not e!290047))))

(declare-datatypes ((List!9530 0))(
  ( (Nil!9527) (Cons!9526 (h!10394 (_ BitVec 64)) (t!15758 List!9530)) )
))
(declare-fun arrayNoDuplicates!0 (array!31975 (_ BitVec 32) List!9530) Bool)

(assert (=> b!494105 (= res!296668 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9527))))

(assert (= (and start!45030 res!296667) b!494100))

(assert (= (and b!494100 res!296669) b!494104))

(assert (= (and b!494104 res!296675) b!494101))

(assert (= (and b!494101 res!296670) b!494102))

(assert (= (and b!494102 res!296674) b!494099))

(assert (= (and b!494099 res!296666) b!494103))

(assert (= (and b!494103 res!296672) b!494105))

(assert (= (and b!494105 res!296668) b!494096))

(assert (= (and b!494096 (not res!296673)) b!494097))

(assert (= (and b!494097 (not res!296671)) b!494098))

(declare-fun m!475071 () Bool)

(assert (=> b!494103 m!475071))

(declare-fun m!475073 () Bool)

(assert (=> b!494102 m!475073))

(declare-fun m!475075 () Bool)

(assert (=> b!494101 m!475075))

(declare-fun m!475077 () Bool)

(assert (=> b!494099 m!475077))

(declare-fun m!475079 () Bool)

(assert (=> b!494096 m!475079))

(declare-fun m!475081 () Bool)

(assert (=> b!494096 m!475081))

(declare-fun m!475083 () Bool)

(assert (=> b!494096 m!475083))

(declare-fun m!475085 () Bool)

(assert (=> b!494096 m!475085))

(assert (=> b!494096 m!475079))

(declare-fun m!475087 () Bool)

(assert (=> b!494096 m!475087))

(assert (=> b!494096 m!475079))

(declare-fun m!475089 () Bool)

(assert (=> b!494096 m!475089))

(assert (=> b!494096 m!475079))

(declare-fun m!475091 () Bool)

(assert (=> b!494096 m!475091))

(assert (=> b!494096 m!475085))

(declare-fun m!475093 () Bool)

(assert (=> b!494096 m!475093))

(declare-fun m!475095 () Bool)

(assert (=> b!494096 m!475095))

(assert (=> b!494096 m!475085))

(declare-fun m!475097 () Bool)

(assert (=> b!494096 m!475097))

(declare-fun m!475099 () Bool)

(assert (=> start!45030 m!475099))

(declare-fun m!475101 () Bool)

(assert (=> start!45030 m!475101))

(declare-fun m!475103 () Bool)

(assert (=> b!494105 m!475103))

(assert (=> b!494104 m!475079))

(assert (=> b!494104 m!475079))

(declare-fun m!475105 () Bool)

(assert (=> b!494104 m!475105))

(push 1)

