; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48414 () Bool)

(assert start!48414)

(declare-fun b!531995 () Bool)

(declare-fun res!327494 () Bool)

(declare-fun e!309805 () Bool)

(assert (=> b!531995 (=> (not res!327494) (not e!309805))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531995 (= res!327494 (validKeyInArray!0 k!1998))))

(declare-fun b!531996 () Bool)

(declare-fun e!309807 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!531996 (= e!309807 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!531997 () Bool)

(declare-fun res!327488 () Bool)

(assert (=> b!531997 (=> (not res!327488) (not e!309807))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33722 0))(
  ( (array!33723 (arr!16203 (Array (_ BitVec 32) (_ BitVec 64))) (size!16567 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33722)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4661 0))(
  ( (MissingZero!4661 (index!20868 (_ BitVec 32))) (Found!4661 (index!20869 (_ BitVec 32))) (Intermediate!4661 (undefined!5473 Bool) (index!20870 (_ BitVec 32)) (x!49843 (_ BitVec 32))) (Undefined!4661) (MissingVacant!4661 (index!20871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33722 (_ BitVec 32)) SeekEntryResult!4661)

(assert (=> b!531997 (= res!327488 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16203 a!3154) j!147) a!3154 mask!3216) (Intermediate!4661 false resIndex!32 resX!32)))))

(declare-fun b!531998 () Bool)

(assert (=> b!531998 (= e!309805 e!309807)))

(declare-fun res!327487 () Bool)

(assert (=> b!531998 (=> (not res!327487) (not e!309807))))

(declare-fun lt!245113 () SeekEntryResult!4661)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531998 (= res!327487 (or (= lt!245113 (MissingZero!4661 i!1153)) (= lt!245113 (MissingVacant!4661 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33722 (_ BitVec 32)) SeekEntryResult!4661)

(assert (=> b!531998 (= lt!245113 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531999 () Bool)

(declare-fun res!327485 () Bool)

(assert (=> b!531999 (=> (not res!327485) (not e!309807))))

(assert (=> b!531999 (= res!327485 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16567 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16567 a!3154)) (= (select (arr!16203 a!3154) resIndex!32) (select (arr!16203 a!3154) j!147))))))

(declare-fun b!532000 () Bool)

(declare-fun res!327490 () Bool)

(assert (=> b!532000 (=> (not res!327490) (not e!309805))))

(assert (=> b!532000 (= res!327490 (and (= (size!16567 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16567 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16567 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327492 () Bool)

(assert (=> start!48414 (=> (not res!327492) (not e!309805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48414 (= res!327492 (validMask!0 mask!3216))))

(assert (=> start!48414 e!309805))

(assert (=> start!48414 true))

(declare-fun array_inv!11999 (array!33722) Bool)

(assert (=> start!48414 (array_inv!11999 a!3154)))

(declare-fun b!532001 () Bool)

(declare-fun res!327493 () Bool)

(assert (=> b!532001 (=> (not res!327493) (not e!309805))))

(declare-fun arrayContainsKey!0 (array!33722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532001 (= res!327493 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532002 () Bool)

(declare-fun res!327491 () Bool)

(assert (=> b!532002 (=> (not res!327491) (not e!309807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33722 (_ BitVec 32)) Bool)

(assert (=> b!532002 (= res!327491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532003 () Bool)

(declare-fun res!327486 () Bool)

(assert (=> b!532003 (=> (not res!327486) (not e!309805))))

(assert (=> b!532003 (= res!327486 (validKeyInArray!0 (select (arr!16203 a!3154) j!147)))))

(declare-fun b!532004 () Bool)

(declare-fun res!327489 () Bool)

(assert (=> b!532004 (=> (not res!327489) (not e!309807))))

(declare-datatypes ((List!10322 0))(
  ( (Nil!10319) (Cons!10318 (h!11258 (_ BitVec 64)) (t!16550 List!10322)) )
))
(declare-fun arrayNoDuplicates!0 (array!33722 (_ BitVec 32) List!10322) Bool)

(assert (=> b!532004 (= res!327489 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10319))))

(assert (= (and start!48414 res!327492) b!532000))

(assert (= (and b!532000 res!327490) b!532003))

(assert (= (and b!532003 res!327486) b!531995))

(assert (= (and b!531995 res!327494) b!532001))

(assert (= (and b!532001 res!327493) b!531998))

(assert (= (and b!531998 res!327487) b!532002))

(assert (= (and b!532002 res!327491) b!532004))

(assert (= (and b!532004 res!327489) b!531999))

(assert (= (and b!531999 res!327485) b!531997))

(assert (= (and b!531997 res!327488) b!531996))

(declare-fun m!512313 () Bool)

(assert (=> b!531997 m!512313))

(assert (=> b!531997 m!512313))

(declare-fun m!512315 () Bool)

(assert (=> b!531997 m!512315))

(declare-fun m!512317 () Bool)

(assert (=> b!532002 m!512317))

(declare-fun m!512319 () Bool)

(assert (=> b!532001 m!512319))

(declare-fun m!512321 () Bool)

(assert (=> start!48414 m!512321))

(declare-fun m!512323 () Bool)

(assert (=> start!48414 m!512323))

(assert (=> b!532003 m!512313))

(assert (=> b!532003 m!512313))

(declare-fun m!512325 () Bool)

(assert (=> b!532003 m!512325))

(declare-fun m!512327 () Bool)

(assert (=> b!531999 m!512327))

(assert (=> b!531999 m!512313))

(declare-fun m!512329 () Bool)

(assert (=> b!532004 m!512329))

(declare-fun m!512331 () Bool)

(assert (=> b!531995 m!512331))

(declare-fun m!512333 () Bool)

(assert (=> b!531998 m!512333))

(push 1)

(assert (not b!531995))

(assert (not start!48414))

(assert (not b!532001))

(assert (not b!532004))

(assert (not b!532003))

(assert (not b!532002))

(assert (not b!531997))

(assert (not b!531998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

