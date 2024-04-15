; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68468 () Bool)

(assert start!68468)

(declare-fun b!795997 () Bool)

(declare-fun res!540666 () Bool)

(declare-fun e!441693 () Bool)

(assert (=> b!795997 (=> (not res!540666) (not e!441693))))

(declare-datatypes ((array!43275 0))(
  ( (array!43276 (arr!20718 (Array (_ BitVec 32) (_ BitVec 64))) (size!21139 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43275)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795997 (= res!540666 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!540659 () Bool)

(assert (=> start!68468 (=> (not res!540659) (not e!441693))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68468 (= res!540659 (validMask!0 mask!3266))))

(assert (=> start!68468 e!441693))

(assert (=> start!68468 true))

(declare-fun array_inv!16601 (array!43275) Bool)

(assert (=> start!68468 (array_inv!16601 a!3170)))

(declare-fun b!795998 () Bool)

(declare-fun e!441692 () Bool)

(declare-fun e!441694 () Bool)

(assert (=> b!795998 (= e!441692 e!441694)))

(declare-fun res!540663 () Bool)

(assert (=> b!795998 (=> (not res!540663) (not e!441694))))

(declare-datatypes ((SeekEntryResult!8306 0))(
  ( (MissingZero!8306 (index!35592 (_ BitVec 32))) (Found!8306 (index!35593 (_ BitVec 32))) (Intermediate!8306 (undefined!9118 Bool) (index!35594 (_ BitVec 32)) (x!66507 (_ BitVec 32))) (Undefined!8306) (MissingVacant!8306 (index!35595 (_ BitVec 32))) )
))
(declare-fun lt!354773 () SeekEntryResult!8306)

(declare-fun lt!354770 () SeekEntryResult!8306)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795998 (= res!540663 (and (= lt!354773 lt!354770) (= lt!354770 (Found!8306 j!153)) (= (select (arr!20718 a!3170) index!1236) (select (arr!20718 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43275 (_ BitVec 32)) SeekEntryResult!8306)

(assert (=> b!795998 (= lt!354770 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20718 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43275 (_ BitVec 32)) SeekEntryResult!8306)

(assert (=> b!795998 (= lt!354773 (seekEntryOrOpen!0 (select (arr!20718 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795999 () Bool)

(declare-fun res!540656 () Bool)

(declare-fun e!441691 () Bool)

(assert (=> b!795999 (=> (not res!540656) (not e!441691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43275 (_ BitVec 32)) Bool)

(assert (=> b!795999 (= res!540656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796000 () Bool)

(declare-fun res!540660 () Bool)

(assert (=> b!796000 (=> (not res!540660) (not e!441691))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796000 (= res!540660 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21139 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20718 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21139 a!3170)) (= (select (arr!20718 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796001 () Bool)

(declare-fun res!540665 () Bool)

(assert (=> b!796001 (=> (not res!540665) (not e!441693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796001 (= res!540665 (validKeyInArray!0 (select (arr!20718 a!3170) j!153)))))

(declare-fun b!796002 () Bool)

(assert (=> b!796002 (= e!441694 (not true))))

(declare-fun lt!354767 () SeekEntryResult!8306)

(assert (=> b!796002 (= lt!354767 (Found!8306 index!1236))))

(declare-fun b!796003 () Bool)

(declare-fun res!540658 () Bool)

(assert (=> b!796003 (=> (not res!540658) (not e!441691))))

(declare-datatypes ((List!14720 0))(
  ( (Nil!14717) (Cons!14716 (h!15845 (_ BitVec 64)) (t!21026 List!14720)) )
))
(declare-fun arrayNoDuplicates!0 (array!43275 (_ BitVec 32) List!14720) Bool)

(assert (=> b!796003 (= res!540658 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14717))))

(declare-fun b!796004 () Bool)

(declare-fun res!540662 () Bool)

(assert (=> b!796004 (=> (not res!540662) (not e!441693))))

(assert (=> b!796004 (= res!540662 (validKeyInArray!0 k!2044))))

(declare-fun b!796005 () Bool)

(assert (=> b!796005 (= e!441693 e!441691)))

(declare-fun res!540661 () Bool)

(assert (=> b!796005 (=> (not res!540661) (not e!441691))))

(declare-fun lt!354771 () SeekEntryResult!8306)

(assert (=> b!796005 (= res!540661 (or (= lt!354771 (MissingZero!8306 i!1163)) (= lt!354771 (MissingVacant!8306 i!1163))))))

(assert (=> b!796005 (= lt!354771 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796006 () Bool)

(assert (=> b!796006 (= e!441691 e!441692)))

(declare-fun res!540657 () Bool)

(assert (=> b!796006 (=> (not res!540657) (not e!441692))))

(declare-fun lt!354768 () SeekEntryResult!8306)

(assert (=> b!796006 (= res!540657 (= lt!354768 lt!354767))))

(declare-fun lt!354772 () array!43275)

(declare-fun lt!354769 () (_ BitVec 64))

(assert (=> b!796006 (= lt!354767 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354769 lt!354772 mask!3266))))

(assert (=> b!796006 (= lt!354768 (seekEntryOrOpen!0 lt!354769 lt!354772 mask!3266))))

(assert (=> b!796006 (= lt!354769 (select (store (arr!20718 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796006 (= lt!354772 (array!43276 (store (arr!20718 a!3170) i!1163 k!2044) (size!21139 a!3170)))))

(declare-fun b!796007 () Bool)

(declare-fun res!540664 () Bool)

(assert (=> b!796007 (=> (not res!540664) (not e!441693))))

(assert (=> b!796007 (= res!540664 (and (= (size!21139 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21139 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21139 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68468 res!540659) b!796007))

(assert (= (and b!796007 res!540664) b!796001))

(assert (= (and b!796001 res!540665) b!796004))

(assert (= (and b!796004 res!540662) b!795997))

(assert (= (and b!795997 res!540666) b!796005))

(assert (= (and b!796005 res!540661) b!795999))

(assert (= (and b!795999 res!540656) b!796003))

(assert (= (and b!796003 res!540658) b!796000))

(assert (= (and b!796000 res!540660) b!796006))

(assert (= (and b!796006 res!540657) b!795998))

(assert (= (and b!795998 res!540663) b!796002))

(declare-fun m!736273 () Bool)

(assert (=> b!796003 m!736273))

(declare-fun m!736275 () Bool)

(assert (=> b!796004 m!736275))

(declare-fun m!736277 () Bool)

(assert (=> b!796000 m!736277))

(declare-fun m!736279 () Bool)

(assert (=> b!796000 m!736279))

(declare-fun m!736281 () Bool)

(assert (=> b!796005 m!736281))

(declare-fun m!736283 () Bool)

(assert (=> b!796006 m!736283))

(declare-fun m!736285 () Bool)

(assert (=> b!796006 m!736285))

(declare-fun m!736287 () Bool)

(assert (=> b!796006 m!736287))

(declare-fun m!736289 () Bool)

(assert (=> b!796006 m!736289))

(declare-fun m!736291 () Bool)

(assert (=> b!795998 m!736291))

(declare-fun m!736293 () Bool)

(assert (=> b!795998 m!736293))

(assert (=> b!795998 m!736293))

(declare-fun m!736295 () Bool)

(assert (=> b!795998 m!736295))

(assert (=> b!795998 m!736293))

(declare-fun m!736297 () Bool)

(assert (=> b!795998 m!736297))

(declare-fun m!736299 () Bool)

(assert (=> start!68468 m!736299))

(declare-fun m!736301 () Bool)

(assert (=> start!68468 m!736301))

(declare-fun m!736303 () Bool)

(assert (=> b!795999 m!736303))

(assert (=> b!796001 m!736293))

(assert (=> b!796001 m!736293))

(declare-fun m!736305 () Bool)

(assert (=> b!796001 m!736305))

(declare-fun m!736307 () Bool)

(assert (=> b!795997 m!736307))

(push 1)

(assert (not b!795999))

(assert (not b!796001))

(assert (not b!795998))

(assert (not b!796005))

(assert (not b!795997))

(assert (not b!796006))

(assert (not start!68468))

(assert (not b!796004))

(assert (not b!796003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

