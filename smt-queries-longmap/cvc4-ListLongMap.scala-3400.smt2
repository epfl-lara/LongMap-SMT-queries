; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46996 () Bool)

(assert start!46996)

(declare-fun b!518200 () Bool)

(declare-fun res!317216 () Bool)

(declare-fun e!302367 () Bool)

(assert (=> b!518200 (=> (not res!317216) (not e!302367))))

(declare-datatypes ((array!33137 0))(
  ( (array!33138 (arr!15932 (Array (_ BitVec 32) (_ BitVec 64))) (size!16296 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33137)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518200 (= res!317216 (validKeyInArray!0 (select (arr!15932 a!3235) j!176)))))

(declare-fun b!518201 () Bool)

(declare-fun res!317221 () Bool)

(assert (=> b!518201 (=> (not res!317221) (not e!302367))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518201 (= res!317221 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518202 () Bool)

(declare-fun res!317220 () Bool)

(declare-fun e!302363 () Bool)

(assert (=> b!518202 (=> res!317220 e!302363)))

(declare-datatypes ((SeekEntryResult!4399 0))(
  ( (MissingZero!4399 (index!19784 (_ BitVec 32))) (Found!4399 (index!19785 (_ BitVec 32))) (Intermediate!4399 (undefined!5211 Bool) (index!19786 (_ BitVec 32)) (x!48748 (_ BitVec 32))) (Undefined!4399) (MissingVacant!4399 (index!19787 (_ BitVec 32))) )
))
(declare-fun lt!237208 () SeekEntryResult!4399)

(assert (=> b!518202 (= res!317220 (or (undefined!5211 lt!237208) (not (is-Intermediate!4399 lt!237208))))))

(declare-fun b!518204 () Bool)

(declare-fun e!302364 () Bool)

(assert (=> b!518204 (= e!302367 e!302364)))

(declare-fun res!317225 () Bool)

(assert (=> b!518204 (=> (not res!317225) (not e!302364))))

(declare-fun lt!237209 () SeekEntryResult!4399)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518204 (= res!317225 (or (= lt!237209 (MissingZero!4399 i!1204)) (= lt!237209 (MissingVacant!4399 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33137 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!518204 (= lt!237209 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518205 () Bool)

(declare-fun res!317224 () Bool)

(assert (=> b!518205 (=> (not res!317224) (not e!302367))))

(assert (=> b!518205 (= res!317224 (validKeyInArray!0 k!2280))))

(declare-fun b!518206 () Bool)

(assert (=> b!518206 (= e!302364 (not e!302363))))

(declare-fun res!317217 () Bool)

(assert (=> b!518206 (=> res!317217 e!302363)))

(declare-fun lt!237211 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33137 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!518206 (= res!317217 (= lt!237208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237211 (select (store (arr!15932 a!3235) i!1204 k!2280) j!176) (array!33138 (store (arr!15932 a!3235) i!1204 k!2280) (size!16296 a!3235)) mask!3524)))))

(declare-fun lt!237210 () (_ BitVec 32))

(assert (=> b!518206 (= lt!237208 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237210 (select (arr!15932 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518206 (= lt!237211 (toIndex!0 (select (store (arr!15932 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!518206 (= lt!237210 (toIndex!0 (select (arr!15932 a!3235) j!176) mask!3524))))

(declare-fun e!302365 () Bool)

(assert (=> b!518206 e!302365))

(declare-fun res!317223 () Bool)

(assert (=> b!518206 (=> (not res!317223) (not e!302365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33137 (_ BitVec 32)) Bool)

(assert (=> b!518206 (= res!317223 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16056 0))(
  ( (Unit!16057) )
))
(declare-fun lt!237207 () Unit!16056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16056)

(assert (=> b!518206 (= lt!237207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518207 () Bool)

(declare-fun res!317215 () Bool)

(assert (=> b!518207 (=> (not res!317215) (not e!302367))))

(assert (=> b!518207 (= res!317215 (and (= (size!16296 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16296 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16296 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518208 () Bool)

(declare-fun res!317218 () Bool)

(assert (=> b!518208 (=> (not res!317218) (not e!302364))))

(declare-datatypes ((List!10090 0))(
  ( (Nil!10087) (Cons!10086 (h!10993 (_ BitVec 64)) (t!16318 List!10090)) )
))
(declare-fun arrayNoDuplicates!0 (array!33137 (_ BitVec 32) List!10090) Bool)

(assert (=> b!518208 (= res!317218 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10087))))

(declare-fun b!518203 () Bool)

(declare-fun res!317222 () Bool)

(assert (=> b!518203 (=> (not res!317222) (not e!302364))))

(assert (=> b!518203 (= res!317222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!317219 () Bool)

(assert (=> start!46996 (=> (not res!317219) (not e!302367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46996 (= res!317219 (validMask!0 mask!3524))))

(assert (=> start!46996 e!302367))

(assert (=> start!46996 true))

(declare-fun array_inv!11728 (array!33137) Bool)

(assert (=> start!46996 (array_inv!11728 a!3235)))

(declare-fun b!518209 () Bool)

(assert (=> b!518209 (= e!302363 true)))

(assert (=> b!518209 (and (bvslt (x!48748 lt!237208) #b01111111111111111111111111111110) (or (= (select (arr!15932 a!3235) (index!19786 lt!237208)) (select (arr!15932 a!3235) j!176)) (= (select (arr!15932 a!3235) (index!19786 lt!237208)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15932 a!3235) (index!19786 lt!237208)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518210 () Bool)

(assert (=> b!518210 (= e!302365 (= (seekEntryOrOpen!0 (select (arr!15932 a!3235) j!176) a!3235 mask!3524) (Found!4399 j!176)))))

(assert (= (and start!46996 res!317219) b!518207))

(assert (= (and b!518207 res!317215) b!518200))

(assert (= (and b!518200 res!317216) b!518205))

(assert (= (and b!518205 res!317224) b!518201))

(assert (= (and b!518201 res!317221) b!518204))

(assert (= (and b!518204 res!317225) b!518203))

(assert (= (and b!518203 res!317222) b!518208))

(assert (= (and b!518208 res!317218) b!518206))

(assert (= (and b!518206 res!317223) b!518210))

(assert (= (and b!518206 (not res!317217)) b!518202))

(assert (= (and b!518202 (not res!317220)) b!518209))

(declare-fun m!499561 () Bool)

(assert (=> b!518208 m!499561))

(declare-fun m!499563 () Bool)

(assert (=> b!518209 m!499563))

(declare-fun m!499565 () Bool)

(assert (=> b!518209 m!499565))

(declare-fun m!499567 () Bool)

(assert (=> start!46996 m!499567))

(declare-fun m!499569 () Bool)

(assert (=> start!46996 m!499569))

(declare-fun m!499571 () Bool)

(assert (=> b!518201 m!499571))

(declare-fun m!499573 () Bool)

(assert (=> b!518205 m!499573))

(declare-fun m!499575 () Bool)

(assert (=> b!518204 m!499575))

(declare-fun m!499577 () Bool)

(assert (=> b!518206 m!499577))

(declare-fun m!499579 () Bool)

(assert (=> b!518206 m!499579))

(declare-fun m!499581 () Bool)

(assert (=> b!518206 m!499581))

(declare-fun m!499583 () Bool)

(assert (=> b!518206 m!499583))

(assert (=> b!518206 m!499565))

(declare-fun m!499585 () Bool)

(assert (=> b!518206 m!499585))

(assert (=> b!518206 m!499565))

(declare-fun m!499587 () Bool)

(assert (=> b!518206 m!499587))

(assert (=> b!518206 m!499579))

(declare-fun m!499589 () Bool)

(assert (=> b!518206 m!499589))

(assert (=> b!518206 m!499565))

(declare-fun m!499591 () Bool)

(assert (=> b!518206 m!499591))

(assert (=> b!518206 m!499579))

(assert (=> b!518200 m!499565))

(assert (=> b!518200 m!499565))

(declare-fun m!499593 () Bool)

(assert (=> b!518200 m!499593))

(assert (=> b!518210 m!499565))

(assert (=> b!518210 m!499565))

(declare-fun m!499595 () Bool)

(assert (=> b!518210 m!499595))

(declare-fun m!499597 () Bool)

(assert (=> b!518203 m!499597))

(push 1)

