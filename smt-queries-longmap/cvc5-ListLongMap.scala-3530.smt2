; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48750 () Bool)

(assert start!48750)

(declare-fun b!536105 () Bool)

(declare-fun e!311289 () Bool)

(assert (=> b!536105 (= e!311289 false)))

(declare-fun lt!245993 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33962 0))(
  ( (array!33963 (arr!16320 (Array (_ BitVec 32) (_ BitVec 64))) (size!16684 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33962)

(declare-datatypes ((SeekEntryResult!4778 0))(
  ( (MissingZero!4778 (index!21336 (_ BitVec 32))) (Found!4778 (index!21337 (_ BitVec 32))) (Intermediate!4778 (undefined!5590 Bool) (index!21338 (_ BitVec 32)) (x!50281 (_ BitVec 32))) (Undefined!4778) (MissingVacant!4778 (index!21339 (_ BitVec 32))) )
))
(declare-fun lt!245995 () SeekEntryResult!4778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33962 (_ BitVec 32)) SeekEntryResult!4778)

(assert (=> b!536105 (= lt!245995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245993 (select (arr!16320 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331321 () Bool)

(declare-fun e!311287 () Bool)

(assert (=> start!48750 (=> (not res!331321) (not e!311287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48750 (= res!331321 (validMask!0 mask!3216))))

(assert (=> start!48750 e!311287))

(assert (=> start!48750 true))

(declare-fun array_inv!12116 (array!33962) Bool)

(assert (=> start!48750 (array_inv!12116 a!3154)))

(declare-fun b!536106 () Bool)

(declare-fun e!311285 () Bool)

(declare-fun e!311286 () Bool)

(assert (=> b!536106 (= e!311285 e!311286)))

(declare-fun res!331314 () Bool)

(assert (=> b!536106 (=> (not res!331314) (not e!311286))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun lt!245992 () SeekEntryResult!4778)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536106 (= res!331314 (= lt!245992 (Intermediate!4778 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536106 (= lt!245992 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16320 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536107 () Bool)

(assert (=> b!536107 (= e!311286 e!311289)))

(declare-fun res!331313 () Bool)

(assert (=> b!536107 (=> (not res!331313) (not e!311289))))

(assert (=> b!536107 (= res!331313 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245993 #b00000000000000000000000000000000) (bvslt lt!245993 (size!16684 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536107 (= lt!245993 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536108 () Bool)

(declare-fun res!331322 () Bool)

(assert (=> b!536108 (=> (not res!331322) (not e!311286))))

(assert (=> b!536108 (= res!331322 (and (not (= (select (arr!16320 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16320 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16320 a!3154) index!1177) (select (arr!16320 a!3154) j!147)))))))

(declare-fun b!536109 () Bool)

(assert (=> b!536109 (= e!311287 e!311285)))

(declare-fun res!331320 () Bool)

(assert (=> b!536109 (=> (not res!331320) (not e!311285))))

(declare-fun lt!245994 () SeekEntryResult!4778)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536109 (= res!331320 (or (= lt!245994 (MissingZero!4778 i!1153)) (= lt!245994 (MissingVacant!4778 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33962 (_ BitVec 32)) SeekEntryResult!4778)

(assert (=> b!536109 (= lt!245994 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536110 () Bool)

(declare-fun res!331310 () Bool)

(assert (=> b!536110 (=> (not res!331310) (not e!311287))))

(assert (=> b!536110 (= res!331310 (and (= (size!16684 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16684 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16684 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536111 () Bool)

(declare-fun res!331318 () Bool)

(assert (=> b!536111 (=> (not res!331318) (not e!311287))))

(declare-fun arrayContainsKey!0 (array!33962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536111 (= res!331318 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536112 () Bool)

(declare-fun res!331311 () Bool)

(assert (=> b!536112 (=> (not res!331311) (not e!311285))))

(declare-datatypes ((List!10439 0))(
  ( (Nil!10436) (Cons!10435 (h!11378 (_ BitVec 64)) (t!16667 List!10439)) )
))
(declare-fun arrayNoDuplicates!0 (array!33962 (_ BitVec 32) List!10439) Bool)

(assert (=> b!536112 (= res!331311 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10436))))

(declare-fun b!536113 () Bool)

(declare-fun res!331316 () Bool)

(assert (=> b!536113 (=> (not res!331316) (not e!311285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33962 (_ BitVec 32)) Bool)

(assert (=> b!536113 (= res!331316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536114 () Bool)

(declare-fun res!331312 () Bool)

(assert (=> b!536114 (=> (not res!331312) (not e!311285))))

(assert (=> b!536114 (= res!331312 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16684 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16684 a!3154)) (= (select (arr!16320 a!3154) resIndex!32) (select (arr!16320 a!3154) j!147))))))

(declare-fun b!536115 () Bool)

(declare-fun res!331319 () Bool)

(assert (=> b!536115 (=> (not res!331319) (not e!311287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536115 (= res!331319 (validKeyInArray!0 k!1998))))

(declare-fun b!536116 () Bool)

(declare-fun res!331315 () Bool)

(assert (=> b!536116 (=> (not res!331315) (not e!311287))))

(assert (=> b!536116 (= res!331315 (validKeyInArray!0 (select (arr!16320 a!3154) j!147)))))

(declare-fun b!536117 () Bool)

(declare-fun res!331317 () Bool)

(assert (=> b!536117 (=> (not res!331317) (not e!311286))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536117 (= res!331317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16320 a!3154) j!147) mask!3216) (select (arr!16320 a!3154) j!147) a!3154 mask!3216) lt!245992))))

(assert (= (and start!48750 res!331321) b!536110))

(assert (= (and b!536110 res!331310) b!536116))

(assert (= (and b!536116 res!331315) b!536115))

(assert (= (and b!536115 res!331319) b!536111))

(assert (= (and b!536111 res!331318) b!536109))

(assert (= (and b!536109 res!331320) b!536113))

(assert (= (and b!536113 res!331316) b!536112))

(assert (= (and b!536112 res!331311) b!536114))

(assert (= (and b!536114 res!331312) b!536106))

(assert (= (and b!536106 res!331314) b!536117))

(assert (= (and b!536117 res!331317) b!536108))

(assert (= (and b!536108 res!331322) b!536107))

(assert (= (and b!536107 res!331313) b!536105))

(declare-fun m!515577 () Bool)

(assert (=> b!536112 m!515577))

(declare-fun m!515579 () Bool)

(assert (=> b!536115 m!515579))

(declare-fun m!515581 () Bool)

(assert (=> b!536109 m!515581))

(declare-fun m!515583 () Bool)

(assert (=> b!536108 m!515583))

(declare-fun m!515585 () Bool)

(assert (=> b!536108 m!515585))

(declare-fun m!515587 () Bool)

(assert (=> b!536113 m!515587))

(assert (=> b!536105 m!515585))

(assert (=> b!536105 m!515585))

(declare-fun m!515589 () Bool)

(assert (=> b!536105 m!515589))

(assert (=> b!536116 m!515585))

(assert (=> b!536116 m!515585))

(declare-fun m!515591 () Bool)

(assert (=> b!536116 m!515591))

(declare-fun m!515593 () Bool)

(assert (=> b!536111 m!515593))

(declare-fun m!515595 () Bool)

(assert (=> b!536114 m!515595))

(assert (=> b!536114 m!515585))

(assert (=> b!536117 m!515585))

(assert (=> b!536117 m!515585))

(declare-fun m!515597 () Bool)

(assert (=> b!536117 m!515597))

(assert (=> b!536117 m!515597))

(assert (=> b!536117 m!515585))

(declare-fun m!515599 () Bool)

(assert (=> b!536117 m!515599))

(declare-fun m!515601 () Bool)

(assert (=> start!48750 m!515601))

(declare-fun m!515603 () Bool)

(assert (=> start!48750 m!515603))

(declare-fun m!515605 () Bool)

(assert (=> b!536107 m!515605))

(assert (=> b!536106 m!515585))

(assert (=> b!536106 m!515585))

(declare-fun m!515607 () Bool)

(assert (=> b!536106 m!515607))

(push 1)

