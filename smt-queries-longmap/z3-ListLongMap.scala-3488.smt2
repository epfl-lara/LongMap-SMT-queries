; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48388 () Bool)

(assert start!48388)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun b!531723 () Bool)

(declare-fun e!309687 () Bool)

(declare-datatypes ((array!33695 0))(
  ( (array!33696 (arr!16189 (Array (_ BitVec 32) (_ BitVec 64))) (size!16553 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33695)

(assert (=> b!531723 (= e!309687 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16553 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16553 a!3154)) (= (select (arr!16189 a!3154) resIndex!32) (select (arr!16189 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!531724 () Bool)

(declare-fun res!327272 () Bool)

(declare-fun e!309686 () Bool)

(assert (=> b!531724 (=> (not res!327272) (not e!309686))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531724 (= res!327272 (and (= (size!16553 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16553 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16553 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531725 () Bool)

(declare-fun res!327271 () Bool)

(assert (=> b!531725 (=> (not res!327271) (not e!309686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531725 (= res!327271 (validKeyInArray!0 (select (arr!16189 a!3154) j!147)))))

(declare-fun res!327274 () Bool)

(assert (=> start!48388 (=> (not res!327274) (not e!309686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48388 (= res!327274 (validMask!0 mask!3216))))

(assert (=> start!48388 e!309686))

(assert (=> start!48388 true))

(declare-fun array_inv!12048 (array!33695) Bool)

(assert (=> start!48388 (array_inv!12048 a!3154)))

(declare-fun b!531726 () Bool)

(declare-fun res!327269 () Bool)

(assert (=> b!531726 (=> (not res!327269) (not e!309687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33695 (_ BitVec 32)) Bool)

(assert (=> b!531726 (= res!327269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531727 () Bool)

(declare-fun res!327270 () Bool)

(assert (=> b!531727 (=> (not res!327270) (not e!309686))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!531727 (= res!327270 (validKeyInArray!0 k0!1998))))

(declare-fun b!531728 () Bool)

(declare-fun res!327273 () Bool)

(assert (=> b!531728 (=> (not res!327273) (not e!309687))))

(declare-datatypes ((List!10215 0))(
  ( (Nil!10212) (Cons!10211 (h!11151 (_ BitVec 64)) (t!16435 List!10215)) )
))
(declare-fun arrayNoDuplicates!0 (array!33695 (_ BitVec 32) List!10215) Bool)

(assert (=> b!531728 (= res!327273 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10212))))

(declare-fun b!531729 () Bool)

(assert (=> b!531729 (= e!309686 e!309687)))

(declare-fun res!327268 () Bool)

(assert (=> b!531729 (=> (not res!327268) (not e!309687))))

(declare-datatypes ((SeekEntryResult!4603 0))(
  ( (MissingZero!4603 (index!20636 (_ BitVec 32))) (Found!4603 (index!20637 (_ BitVec 32))) (Intermediate!4603 (undefined!5415 Bool) (index!20638 (_ BitVec 32)) (x!49758 (_ BitVec 32))) (Undefined!4603) (MissingVacant!4603 (index!20639 (_ BitVec 32))) )
))
(declare-fun lt!245089 () SeekEntryResult!4603)

(assert (=> b!531729 (= res!327268 (or (= lt!245089 (MissingZero!4603 i!1153)) (= lt!245089 (MissingVacant!4603 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33695 (_ BitVec 32)) SeekEntryResult!4603)

(assert (=> b!531729 (= lt!245089 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531730 () Bool)

(declare-fun res!327267 () Bool)

(assert (=> b!531730 (=> (not res!327267) (not e!309686))))

(declare-fun arrayContainsKey!0 (array!33695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531730 (= res!327267 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48388 res!327274) b!531724))

(assert (= (and b!531724 res!327272) b!531725))

(assert (= (and b!531725 res!327271) b!531727))

(assert (= (and b!531727 res!327270) b!531730))

(assert (= (and b!531730 res!327267) b!531729))

(assert (= (and b!531729 res!327268) b!531726))

(assert (= (and b!531726 res!327269) b!531728))

(assert (= (and b!531728 res!327273) b!531723))

(declare-fun m!512323 () Bool)

(assert (=> b!531730 m!512323))

(declare-fun m!512325 () Bool)

(assert (=> b!531728 m!512325))

(declare-fun m!512327 () Bool)

(assert (=> b!531727 m!512327))

(declare-fun m!512329 () Bool)

(assert (=> b!531729 m!512329))

(declare-fun m!512331 () Bool)

(assert (=> b!531725 m!512331))

(assert (=> b!531725 m!512331))

(declare-fun m!512333 () Bool)

(assert (=> b!531725 m!512333))

(declare-fun m!512335 () Bool)

(assert (=> start!48388 m!512335))

(declare-fun m!512337 () Bool)

(assert (=> start!48388 m!512337))

(declare-fun m!512339 () Bool)

(assert (=> b!531723 m!512339))

(assert (=> b!531723 m!512331))

(declare-fun m!512341 () Bool)

(assert (=> b!531726 m!512341))

(check-sat (not start!48388) (not b!531730) (not b!531725) (not b!531728) (not b!531726) (not b!531727) (not b!531729))
(check-sat)
