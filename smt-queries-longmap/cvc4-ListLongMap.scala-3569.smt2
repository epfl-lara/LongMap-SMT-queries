; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49096 () Bool)

(assert start!49096)

(declare-fun b!540776 () Bool)

(declare-fun res!335664 () Bool)

(declare-fun e!313265 () Bool)

(assert (=> b!540776 (=> (not res!335664) (not e!313265))))

(declare-datatypes ((array!34206 0))(
  ( (array!34207 (arr!16439 (Array (_ BitVec 32) (_ BitVec 64))) (size!16803 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34206)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540776 (= res!335664 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540777 () Bool)

(declare-fun e!313264 () Bool)

(assert (=> b!540777 (= e!313264 false)))

(declare-datatypes ((SeekEntryResult!4897 0))(
  ( (MissingZero!4897 (index!21812 (_ BitVec 32))) (Found!4897 (index!21813 (_ BitVec 32))) (Intermediate!4897 (undefined!5709 Bool) (index!21814 (_ BitVec 32)) (x!50724 (_ BitVec 32))) (Undefined!4897) (MissingVacant!4897 (index!21815 (_ BitVec 32))) )
))
(declare-fun lt!247488 () SeekEntryResult!4897)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34206 (_ BitVec 32)) SeekEntryResult!4897)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540777 (= lt!247488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16439 a!3154) j!147) mask!3216) (select (arr!16439 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540778 () Bool)

(assert (=> b!540778 (= e!313265 e!313264)))

(declare-fun res!335672 () Bool)

(assert (=> b!540778 (=> (not res!335672) (not e!313264))))

(declare-fun lt!247489 () SeekEntryResult!4897)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540778 (= res!335672 (or (= lt!247489 (MissingZero!4897 i!1153)) (= lt!247489 (MissingVacant!4897 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34206 (_ BitVec 32)) SeekEntryResult!4897)

(assert (=> b!540778 (= lt!247489 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540779 () Bool)

(declare-fun res!335665 () Bool)

(assert (=> b!540779 (=> (not res!335665) (not e!313264))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540779 (= res!335665 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16439 a!3154) j!147) a!3154 mask!3216) (Intermediate!4897 false resIndex!32 resX!32)))))

(declare-fun b!540780 () Bool)

(declare-fun res!335668 () Bool)

(assert (=> b!540780 (=> (not res!335668) (not e!313264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34206 (_ BitVec 32)) Bool)

(assert (=> b!540780 (= res!335668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540781 () Bool)

(declare-fun res!335667 () Bool)

(assert (=> b!540781 (=> (not res!335667) (not e!313265))))

(assert (=> b!540781 (= res!335667 (and (= (size!16803 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16803 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16803 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335666 () Bool)

(assert (=> start!49096 (=> (not res!335666) (not e!313265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49096 (= res!335666 (validMask!0 mask!3216))))

(assert (=> start!49096 e!313265))

(assert (=> start!49096 true))

(declare-fun array_inv!12235 (array!34206) Bool)

(assert (=> start!49096 (array_inv!12235 a!3154)))

(declare-fun b!540782 () Bool)

(declare-fun res!335671 () Bool)

(assert (=> b!540782 (=> (not res!335671) (not e!313265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540782 (= res!335671 (validKeyInArray!0 (select (arr!16439 a!3154) j!147)))))

(declare-fun b!540783 () Bool)

(declare-fun res!335669 () Bool)

(assert (=> b!540783 (=> (not res!335669) (not e!313264))))

(assert (=> b!540783 (= res!335669 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16803 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16803 a!3154)) (= (select (arr!16439 a!3154) resIndex!32) (select (arr!16439 a!3154) j!147))))))

(declare-fun b!540784 () Bool)

(declare-fun res!335670 () Bool)

(assert (=> b!540784 (=> (not res!335670) (not e!313264))))

(declare-datatypes ((List!10558 0))(
  ( (Nil!10555) (Cons!10554 (h!11503 (_ BitVec 64)) (t!16786 List!10558)) )
))
(declare-fun arrayNoDuplicates!0 (array!34206 (_ BitVec 32) List!10558) Bool)

(assert (=> b!540784 (= res!335670 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10555))))

(declare-fun b!540785 () Bool)

(declare-fun res!335663 () Bool)

(assert (=> b!540785 (=> (not res!335663) (not e!313265))))

(assert (=> b!540785 (= res!335663 (validKeyInArray!0 k!1998))))

(assert (= (and start!49096 res!335666) b!540781))

(assert (= (and b!540781 res!335667) b!540782))

(assert (= (and b!540782 res!335671) b!540785))

(assert (= (and b!540785 res!335663) b!540776))

(assert (= (and b!540776 res!335664) b!540778))

(assert (= (and b!540778 res!335672) b!540780))

(assert (= (and b!540780 res!335668) b!540784))

(assert (= (and b!540784 res!335670) b!540783))

(assert (= (and b!540783 res!335669) b!540779))

(assert (= (and b!540779 res!335665) b!540777))

(declare-fun m!519439 () Bool)

(assert (=> b!540783 m!519439))

(declare-fun m!519441 () Bool)

(assert (=> b!540783 m!519441))

(declare-fun m!519443 () Bool)

(assert (=> start!49096 m!519443))

(declare-fun m!519445 () Bool)

(assert (=> start!49096 m!519445))

(assert (=> b!540779 m!519441))

(assert (=> b!540779 m!519441))

(declare-fun m!519447 () Bool)

(assert (=> b!540779 m!519447))

(declare-fun m!519449 () Bool)

(assert (=> b!540780 m!519449))

(declare-fun m!519451 () Bool)

(assert (=> b!540785 m!519451))

(declare-fun m!519453 () Bool)

(assert (=> b!540776 m!519453))

(declare-fun m!519455 () Bool)

(assert (=> b!540778 m!519455))

(declare-fun m!519457 () Bool)

(assert (=> b!540784 m!519457))

(assert (=> b!540782 m!519441))

(assert (=> b!540782 m!519441))

(declare-fun m!519459 () Bool)

(assert (=> b!540782 m!519459))

(assert (=> b!540777 m!519441))

(assert (=> b!540777 m!519441))

(declare-fun m!519461 () Bool)

(assert (=> b!540777 m!519461))

(assert (=> b!540777 m!519461))

(assert (=> b!540777 m!519441))

(declare-fun m!519463 () Bool)

(assert (=> b!540777 m!519463))

(push 1)

(assert (not b!540776))

(assert (not b!540782))

(assert (not b!540779))

(assert (not b!540777))

(assert (not b!540780))

(assert (not b!540778))

(assert (not b!540784))

(assert (not start!49096))

