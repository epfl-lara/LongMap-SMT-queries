; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45168 () Bool)

(assert start!45168)

(declare-fun b!495595 () Bool)

(declare-fun e!290738 () Bool)

(declare-fun e!290740 () Bool)

(assert (=> b!495595 (= e!290738 (not e!290740))))

(declare-fun res!297991 () Bool)

(assert (=> b!495595 (=> res!297991 e!290740)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3878 0))(
  ( (MissingZero!3878 (index!17691 (_ BitVec 32))) (Found!3878 (index!17692 (_ BitVec 32))) (Intermediate!3878 (undefined!4690 Bool) (index!17693 (_ BitVec 32)) (x!46762 (_ BitVec 32))) (Undefined!3878) (MissingVacant!3878 (index!17694 (_ BitVec 32))) )
))
(declare-fun lt!224359 () SeekEntryResult!3878)

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32056 0))(
  ( (array!32057 (arr!15411 (Array (_ BitVec 32) (_ BitVec 64))) (size!15775 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32056)

(declare-fun lt!224362 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32056 (_ BitVec 32)) SeekEntryResult!3878)

(assert (=> b!495595 (= res!297991 (= lt!224359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224362 (select (store (arr!15411 a!3235) i!1204 k!2280) j!176) (array!32057 (store (arr!15411 a!3235) i!1204 k!2280) (size!15775 a!3235)) mask!3524)))))

(declare-fun lt!224358 () (_ BitVec 32))

(assert (=> b!495595 (= lt!224359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224358 (select (arr!15411 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495595 (= lt!224362 (toIndex!0 (select (store (arr!15411 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!495595 (= lt!224358 (toIndex!0 (select (arr!15411 a!3235) j!176) mask!3524))))

(declare-fun e!290741 () Bool)

(assert (=> b!495595 e!290741))

(declare-fun res!297985 () Bool)

(assert (=> b!495595 (=> (not res!297985) (not e!290741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32056 (_ BitVec 32)) Bool)

(assert (=> b!495595 (= res!297985 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14702 0))(
  ( (Unit!14703) )
))
(declare-fun lt!224360 () Unit!14702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14702)

(assert (=> b!495595 (= lt!224360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495596 () Bool)

(declare-fun res!297987 () Bool)

(declare-fun e!290742 () Bool)

(assert (=> b!495596 (=> (not res!297987) (not e!290742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495596 (= res!297987 (validKeyInArray!0 (select (arr!15411 a!3235) j!176)))))

(declare-fun res!297990 () Bool)

(assert (=> start!45168 (=> (not res!297990) (not e!290742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45168 (= res!297990 (validMask!0 mask!3524))))

(assert (=> start!45168 e!290742))

(assert (=> start!45168 true))

(declare-fun array_inv!11207 (array!32056) Bool)

(assert (=> start!45168 (array_inv!11207 a!3235)))

(declare-fun b!495597 () Bool)

(declare-fun res!297983 () Bool)

(assert (=> b!495597 (=> (not res!297983) (not e!290742))))

(assert (=> b!495597 (= res!297983 (and (= (size!15775 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15775 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15775 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495598 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32056 (_ BitVec 32)) SeekEntryResult!3878)

(assert (=> b!495598 (= e!290741 (= (seekEntryOrOpen!0 (select (arr!15411 a!3235) j!176) a!3235 mask!3524) (Found!3878 j!176)))))

(declare-fun b!495599 () Bool)

(declare-fun res!297989 () Bool)

(assert (=> b!495599 (=> (not res!297989) (not e!290738))))

(assert (=> b!495599 (= res!297989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495600 () Bool)

(assert (=> b!495600 (= e!290742 e!290738)))

(declare-fun res!297988 () Bool)

(assert (=> b!495600 (=> (not res!297988) (not e!290738))))

(declare-fun lt!224361 () SeekEntryResult!3878)

(assert (=> b!495600 (= res!297988 (or (= lt!224361 (MissingZero!3878 i!1204)) (= lt!224361 (MissingVacant!3878 i!1204))))))

(assert (=> b!495600 (= lt!224361 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!495601 () Bool)

(assert (=> b!495601 (= e!290740 true)))

(assert (=> b!495601 (and (bvslt (x!46762 lt!224359) #b01111111111111111111111111111110) (or (= (select (arr!15411 a!3235) (index!17693 lt!224359)) (select (arr!15411 a!3235) j!176)) (= (select (arr!15411 a!3235) (index!17693 lt!224359)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15411 a!3235) (index!17693 lt!224359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495602 () Bool)

(declare-fun res!297986 () Bool)

(assert (=> b!495602 (=> (not res!297986) (not e!290742))))

(declare-fun arrayContainsKey!0 (array!32056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495602 (= res!297986 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495603 () Bool)

(declare-fun res!297984 () Bool)

(assert (=> b!495603 (=> res!297984 e!290740)))

(assert (=> b!495603 (= res!297984 (or (undefined!4690 lt!224359) (not (is-Intermediate!3878 lt!224359))))))

(declare-fun b!495604 () Bool)

(declare-fun res!297992 () Bool)

(assert (=> b!495604 (=> (not res!297992) (not e!290742))))

(assert (=> b!495604 (= res!297992 (validKeyInArray!0 k!2280))))

(declare-fun b!495605 () Bool)

(declare-fun res!297982 () Bool)

(assert (=> b!495605 (=> (not res!297982) (not e!290738))))

(declare-datatypes ((List!9569 0))(
  ( (Nil!9566) (Cons!9565 (h!10436 (_ BitVec 64)) (t!15797 List!9569)) )
))
(declare-fun arrayNoDuplicates!0 (array!32056 (_ BitVec 32) List!9569) Bool)

(assert (=> b!495605 (= res!297982 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9566))))

(assert (= (and start!45168 res!297990) b!495597))

(assert (= (and b!495597 res!297983) b!495596))

(assert (= (and b!495596 res!297987) b!495604))

(assert (= (and b!495604 res!297992) b!495602))

(assert (= (and b!495602 res!297986) b!495600))

(assert (= (and b!495600 res!297988) b!495599))

(assert (= (and b!495599 res!297989) b!495605))

(assert (= (and b!495605 res!297982) b!495595))

(assert (= (and b!495595 res!297985) b!495598))

(assert (= (and b!495595 (not res!297991)) b!495603))

(assert (= (and b!495603 (not res!297984)) b!495601))

(declare-fun m!476703 () Bool)

(assert (=> b!495602 m!476703))

(declare-fun m!476705 () Bool)

(assert (=> b!495599 m!476705))

(declare-fun m!476707 () Bool)

(assert (=> b!495598 m!476707))

(assert (=> b!495598 m!476707))

(declare-fun m!476709 () Bool)

(assert (=> b!495598 m!476709))

(declare-fun m!476711 () Bool)

(assert (=> b!495605 m!476711))

(declare-fun m!476713 () Bool)

(assert (=> start!45168 m!476713))

(declare-fun m!476715 () Bool)

(assert (=> start!45168 m!476715))

(declare-fun m!476717 () Bool)

(assert (=> b!495601 m!476717))

(assert (=> b!495601 m!476707))

(declare-fun m!476719 () Bool)

(assert (=> b!495600 m!476719))

(declare-fun m!476721 () Bool)

(assert (=> b!495604 m!476721))

(assert (=> b!495596 m!476707))

(assert (=> b!495596 m!476707))

(declare-fun m!476723 () Bool)

(assert (=> b!495596 m!476723))

(declare-fun m!476725 () Bool)

(assert (=> b!495595 m!476725))

(declare-fun m!476727 () Bool)

(assert (=> b!495595 m!476727))

(assert (=> b!495595 m!476707))

(declare-fun m!476729 () Bool)

(assert (=> b!495595 m!476729))

(assert (=> b!495595 m!476707))

(declare-fun m!476731 () Bool)

(assert (=> b!495595 m!476731))

(assert (=> b!495595 m!476707))

(declare-fun m!476733 () Bool)

(assert (=> b!495595 m!476733))

(declare-fun m!476735 () Bool)

(assert (=> b!495595 m!476735))

(declare-fun m!476737 () Bool)

(assert (=> b!495595 m!476737))

(assert (=> b!495595 m!476735))

(assert (=> b!495595 m!476735))

(declare-fun m!476739 () Bool)

(assert (=> b!495595 m!476739))

(push 1)

(assert (not b!495602))

(assert (not b!495604))

(assert (not b!495595))

(assert (not b!495596))

(assert (not b!495598))

(assert (not b!495600))

(assert (not b!495599))

(assert (not b!495605))

(assert (not start!45168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

