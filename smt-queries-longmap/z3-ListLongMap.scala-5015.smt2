; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68580 () Bool)

(assert start!68580)

(declare-fun b!797928 () Bool)

(declare-fun res!542587 () Bool)

(declare-fun e!442617 () Bool)

(assert (=> b!797928 (=> (not res!542587) (not e!442617))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797928 (= res!542587 (validKeyInArray!0 k0!2044))))

(declare-fun b!797929 () Bool)

(declare-fun res!542588 () Bool)

(assert (=> b!797929 (=> (not res!542588) (not e!442617))))

(declare-datatypes ((array!43387 0))(
  ( (array!43388 (arr!20774 (Array (_ BitVec 32) (_ BitVec 64))) (size!21195 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43387)

(declare-fun arrayContainsKey!0 (array!43387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797929 (= res!542588 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797930 () Bool)

(declare-fun res!542595 () Bool)

(assert (=> b!797930 (=> (not res!542595) (not e!442617))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797930 (= res!542595 (and (= (size!21195 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21195 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21195 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797931 () Bool)

(declare-fun e!442616 () Bool)

(declare-fun e!442614 () Bool)

(assert (=> b!797931 (= e!442616 e!442614)))

(declare-fun res!542594 () Bool)

(assert (=> b!797931 (=> (not res!542594) (not e!442614))))

(declare-datatypes ((SeekEntryResult!8362 0))(
  ( (MissingZero!8362 (index!35816 (_ BitVec 32))) (Found!8362 (index!35817 (_ BitVec 32))) (Intermediate!8362 (undefined!9174 Bool) (index!35818 (_ BitVec 32)) (x!66715 (_ BitVec 32))) (Undefined!8362) (MissingVacant!8362 (index!35819 (_ BitVec 32))) )
))
(declare-fun lt!356010 () SeekEntryResult!8362)

(declare-fun lt!356015 () SeekEntryResult!8362)

(assert (=> b!797931 (= res!542594 (= lt!356010 lt!356015))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356009 () array!43387)

(declare-fun lt!356011 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43387 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!797931 (= lt!356015 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356011 lt!356009 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43387 (_ BitVec 32)) SeekEntryResult!8362)

(assert (=> b!797931 (= lt!356010 (seekEntryOrOpen!0 lt!356011 lt!356009 mask!3266))))

(assert (=> b!797931 (= lt!356011 (select (store (arr!20774 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797931 (= lt!356009 (array!43388 (store (arr!20774 a!3170) i!1163 k0!2044) (size!21195 a!3170)))))

(declare-fun b!797932 () Bool)

(declare-fun res!542590 () Bool)

(assert (=> b!797932 (=> (not res!542590) (not e!442616))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797932 (= res!542590 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21195 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20774 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21195 a!3170)) (= (select (arr!20774 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797933 () Bool)

(declare-fun res!542598 () Bool)

(assert (=> b!797933 (=> (not res!542598) (not e!442616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43387 (_ BitVec 32)) Bool)

(assert (=> b!797933 (= res!542598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797934 () Bool)

(declare-fun res!542597 () Bool)

(assert (=> b!797934 (=> (not res!542597) (not e!442617))))

(assert (=> b!797934 (= res!542597 (validKeyInArray!0 (select (arr!20774 a!3170) j!153)))))

(declare-fun res!542593 () Bool)

(assert (=> start!68580 (=> (not res!542593) (not e!442617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68580 (= res!542593 (validMask!0 mask!3266))))

(assert (=> start!68580 e!442617))

(assert (=> start!68580 true))

(declare-fun array_inv!16657 (array!43387) Bool)

(assert (=> start!68580 (array_inv!16657 a!3170)))

(declare-fun lt!356008 () SeekEntryResult!8362)

(declare-fun b!797935 () Bool)

(declare-fun e!442618 () Bool)

(assert (=> b!797935 (= e!442618 (not (or (not (= lt!356015 lt!356008)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(assert (=> b!797935 (= lt!356015 (Found!8362 index!1236))))

(declare-fun b!797936 () Bool)

(declare-fun e!442613 () Bool)

(assert (=> b!797936 (= e!442613 e!442618)))

(declare-fun res!542596 () Bool)

(assert (=> b!797936 (=> (not res!542596) (not e!442618))))

(declare-fun lt!356013 () SeekEntryResult!8362)

(assert (=> b!797936 (= res!542596 (and (= lt!356013 lt!356008) (= (select (arr!20774 a!3170) index!1236) (select (arr!20774 a!3170) j!153))))))

(assert (=> b!797936 (= lt!356008 (Found!8362 j!153))))

(declare-fun b!797937 () Bool)

(assert (=> b!797937 (= e!442617 e!442616)))

(declare-fun res!542591 () Bool)

(assert (=> b!797937 (=> (not res!542591) (not e!442616))))

(declare-fun lt!356012 () SeekEntryResult!8362)

(assert (=> b!797937 (= res!542591 (or (= lt!356012 (MissingZero!8362 i!1163)) (= lt!356012 (MissingVacant!8362 i!1163))))))

(assert (=> b!797937 (= lt!356012 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797938 () Bool)

(assert (=> b!797938 (= e!442614 e!442613)))

(declare-fun res!542589 () Bool)

(assert (=> b!797938 (=> (not res!542589) (not e!442613))))

(declare-fun lt!356014 () SeekEntryResult!8362)

(assert (=> b!797938 (= res!542589 (= lt!356014 lt!356013))))

(assert (=> b!797938 (= lt!356013 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20774 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797938 (= lt!356014 (seekEntryOrOpen!0 (select (arr!20774 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797939 () Bool)

(declare-fun res!542592 () Bool)

(assert (=> b!797939 (=> (not res!542592) (not e!442616))))

(declare-datatypes ((List!14776 0))(
  ( (Nil!14773) (Cons!14772 (h!15901 (_ BitVec 64)) (t!21082 List!14776)) )
))
(declare-fun arrayNoDuplicates!0 (array!43387 (_ BitVec 32) List!14776) Bool)

(assert (=> b!797939 (= res!542592 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14773))))

(assert (= (and start!68580 res!542593) b!797930))

(assert (= (and b!797930 res!542595) b!797934))

(assert (= (and b!797934 res!542597) b!797928))

(assert (= (and b!797928 res!542587) b!797929))

(assert (= (and b!797929 res!542588) b!797937))

(assert (= (and b!797937 res!542591) b!797933))

(assert (= (and b!797933 res!542598) b!797939))

(assert (= (and b!797939 res!542592) b!797932))

(assert (= (and b!797932 res!542590) b!797931))

(assert (= (and b!797931 res!542594) b!797938))

(assert (= (and b!797938 res!542589) b!797936))

(assert (= (and b!797936 res!542596) b!797935))

(declare-fun m!738325 () Bool)

(assert (=> start!68580 m!738325))

(declare-fun m!738327 () Bool)

(assert (=> start!68580 m!738327))

(declare-fun m!738329 () Bool)

(assert (=> b!797931 m!738329))

(declare-fun m!738331 () Bool)

(assert (=> b!797931 m!738331))

(declare-fun m!738333 () Bool)

(assert (=> b!797931 m!738333))

(declare-fun m!738335 () Bool)

(assert (=> b!797931 m!738335))

(declare-fun m!738337 () Bool)

(assert (=> b!797937 m!738337))

(declare-fun m!738339 () Bool)

(assert (=> b!797939 m!738339))

(declare-fun m!738341 () Bool)

(assert (=> b!797938 m!738341))

(assert (=> b!797938 m!738341))

(declare-fun m!738343 () Bool)

(assert (=> b!797938 m!738343))

(assert (=> b!797938 m!738341))

(declare-fun m!738345 () Bool)

(assert (=> b!797938 m!738345))

(declare-fun m!738347 () Bool)

(assert (=> b!797928 m!738347))

(declare-fun m!738349 () Bool)

(assert (=> b!797932 m!738349))

(declare-fun m!738351 () Bool)

(assert (=> b!797932 m!738351))

(assert (=> b!797934 m!738341))

(assert (=> b!797934 m!738341))

(declare-fun m!738353 () Bool)

(assert (=> b!797934 m!738353))

(declare-fun m!738355 () Bool)

(assert (=> b!797929 m!738355))

(declare-fun m!738357 () Bool)

(assert (=> b!797933 m!738357))

(declare-fun m!738359 () Bool)

(assert (=> b!797936 m!738359))

(assert (=> b!797936 m!738341))

(check-sat (not b!797937) (not b!797934) (not b!797929) (not b!797938) (not start!68580) (not b!797928) (not b!797933) (not b!797931) (not b!797939))
(check-sat)
