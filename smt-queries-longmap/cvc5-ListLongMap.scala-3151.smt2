; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44376 () Bool)

(assert start!44376)

(declare-fun b!487716 () Bool)

(declare-fun res!290992 () Bool)

(declare-fun e!286958 () Bool)

(assert (=> b!487716 (=> (not res!290992) (not e!286958))))

(declare-datatypes ((array!31582 0))(
  ( (array!31583 (arr!15183 (Array (_ BitVec 32) (_ BitVec 64))) (size!15547 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31582)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487716 (= res!290992 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487717 () Bool)

(declare-fun res!290996 () Bool)

(declare-fun e!286959 () Bool)

(assert (=> b!487717 (=> (not res!290996) (not e!286959))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31582 (_ BitVec 32)) Bool)

(assert (=> b!487717 (= res!290996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487718 () Bool)

(declare-fun res!290995 () Bool)

(assert (=> b!487718 (=> (not res!290995) (not e!286959))))

(declare-datatypes ((List!9341 0))(
  ( (Nil!9338) (Cons!9337 (h!10193 (_ BitVec 64)) (t!15569 List!9341)) )
))
(declare-fun arrayNoDuplicates!0 (array!31582 (_ BitVec 32) List!9341) Bool)

(assert (=> b!487718 (= res!290995 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9338))))

(declare-fun b!487719 () Bool)

(declare-fun e!286956 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3650 0))(
  ( (MissingZero!3650 (index!16779 (_ BitVec 32))) (Found!3650 (index!16780 (_ BitVec 32))) (Intermediate!3650 (undefined!4462 Bool) (index!16781 (_ BitVec 32)) (x!45902 (_ BitVec 32))) (Undefined!3650) (MissingVacant!3650 (index!16782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31582 (_ BitVec 32)) SeekEntryResult!3650)

(assert (=> b!487719 (= e!286956 (= (seekEntryOrOpen!0 (select (arr!15183 a!3235) j!176) a!3235 mask!3524) (Found!3650 j!176)))))

(declare-fun b!487720 () Bool)

(declare-fun res!290991 () Bool)

(assert (=> b!487720 (=> (not res!290991) (not e!286958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487720 (= res!290991 (validKeyInArray!0 (select (arr!15183 a!3235) j!176)))))

(declare-fun b!487721 () Bool)

(assert (=> b!487721 (= e!286959 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220133 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487721 (= lt!220133 (toIndex!0 (select (arr!15183 a!3235) j!176) mask!3524))))

(assert (=> b!487721 e!286956))

(declare-fun res!290993 () Bool)

(assert (=> b!487721 (=> (not res!290993) (not e!286956))))

(assert (=> b!487721 (= res!290993 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14246 0))(
  ( (Unit!14247) )
))
(declare-fun lt!220134 () Unit!14246)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14246)

(assert (=> b!487721 (= lt!220134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487722 () Bool)

(declare-fun res!290989 () Bool)

(assert (=> b!487722 (=> (not res!290989) (not e!286958))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487722 (= res!290989 (and (= (size!15547 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15547 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15547 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290990 () Bool)

(assert (=> start!44376 (=> (not res!290990) (not e!286958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44376 (= res!290990 (validMask!0 mask!3524))))

(assert (=> start!44376 e!286958))

(assert (=> start!44376 true))

(declare-fun array_inv!10979 (array!31582) Bool)

(assert (=> start!44376 (array_inv!10979 a!3235)))

(declare-fun b!487723 () Bool)

(assert (=> b!487723 (= e!286958 e!286959)))

(declare-fun res!290994 () Bool)

(assert (=> b!487723 (=> (not res!290994) (not e!286959))))

(declare-fun lt!220135 () SeekEntryResult!3650)

(assert (=> b!487723 (= res!290994 (or (= lt!220135 (MissingZero!3650 i!1204)) (= lt!220135 (MissingVacant!3650 i!1204))))))

(assert (=> b!487723 (= lt!220135 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487724 () Bool)

(declare-fun res!290988 () Bool)

(assert (=> b!487724 (=> (not res!290988) (not e!286958))))

(assert (=> b!487724 (= res!290988 (validKeyInArray!0 k!2280))))

(assert (= (and start!44376 res!290990) b!487722))

(assert (= (and b!487722 res!290989) b!487720))

(assert (= (and b!487720 res!290991) b!487724))

(assert (= (and b!487724 res!290988) b!487716))

(assert (= (and b!487716 res!290992) b!487723))

(assert (= (and b!487723 res!290994) b!487717))

(assert (= (and b!487717 res!290996) b!487718))

(assert (= (and b!487718 res!290995) b!487721))

(assert (= (and b!487721 res!290993) b!487719))

(declare-fun m!467505 () Bool)

(assert (=> b!487721 m!467505))

(assert (=> b!487721 m!467505))

(declare-fun m!467507 () Bool)

(assert (=> b!487721 m!467507))

(declare-fun m!467509 () Bool)

(assert (=> b!487721 m!467509))

(declare-fun m!467511 () Bool)

(assert (=> b!487721 m!467511))

(declare-fun m!467513 () Bool)

(assert (=> b!487724 m!467513))

(declare-fun m!467515 () Bool)

(assert (=> start!44376 m!467515))

(declare-fun m!467517 () Bool)

(assert (=> start!44376 m!467517))

(assert (=> b!487719 m!467505))

(assert (=> b!487719 m!467505))

(declare-fun m!467519 () Bool)

(assert (=> b!487719 m!467519))

(assert (=> b!487720 m!467505))

(assert (=> b!487720 m!467505))

(declare-fun m!467521 () Bool)

(assert (=> b!487720 m!467521))

(declare-fun m!467523 () Bool)

(assert (=> b!487717 m!467523))

(declare-fun m!467525 () Bool)

(assert (=> b!487716 m!467525))

(declare-fun m!467527 () Bool)

(assert (=> b!487718 m!467527))

(declare-fun m!467529 () Bool)

(assert (=> b!487723 m!467529))

(push 1)

