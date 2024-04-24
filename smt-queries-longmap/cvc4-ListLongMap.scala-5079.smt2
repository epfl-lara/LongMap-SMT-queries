; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69154 () Bool)

(assert start!69154)

(declare-fun b!805621 () Bool)

(declare-fun e!446339 () Bool)

(assert (=> b!805621 (= e!446339 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43776 0))(
  ( (array!43777 (arr!20963 (Array (_ BitVec 32) (_ BitVec 64))) (size!21383 (_ BitVec 32))) )
))
(declare-fun lt!360631 () array!43776)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360630 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8510 0))(
  ( (MissingZero!8510 (index!36408 (_ BitVec 32))) (Found!8510 (index!36409 (_ BitVec 32))) (Intermediate!8510 (undefined!9322 Bool) (index!36410 (_ BitVec 32)) (x!67394 (_ BitVec 32))) (Undefined!8510) (MissingVacant!8510 (index!36411 (_ BitVec 32))) )
))
(declare-fun lt!360628 () SeekEntryResult!8510)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43776 (_ BitVec 32)) SeekEntryResult!8510)

(assert (=> b!805621 (= lt!360628 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360630 lt!360631 mask!3266))))

(declare-fun lt!360629 () SeekEntryResult!8510)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43776 (_ BitVec 32)) SeekEntryResult!8510)

(assert (=> b!805621 (= lt!360629 (seekEntryOrOpen!0 lt!360630 lt!360631 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43776)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805621 (= lt!360630 (select (store (arr!20963 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805621 (= lt!360631 (array!43777 (store (arr!20963 a!3170) i!1163 k!2044) (size!21383 a!3170)))))

(declare-fun b!805622 () Bool)

(declare-fun res!549598 () Bool)

(declare-fun e!446341 () Bool)

(assert (=> b!805622 (=> (not res!549598) (not e!446341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805622 (= res!549598 (validKeyInArray!0 (select (arr!20963 a!3170) j!153)))))

(declare-fun res!549596 () Bool)

(assert (=> start!69154 (=> (not res!549596) (not e!446341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69154 (= res!549596 (validMask!0 mask!3266))))

(assert (=> start!69154 e!446341))

(assert (=> start!69154 true))

(declare-fun array_inv!16822 (array!43776) Bool)

(assert (=> start!69154 (array_inv!16822 a!3170)))

(declare-fun b!805623 () Bool)

(declare-fun res!549599 () Bool)

(assert (=> b!805623 (=> (not res!549599) (not e!446339))))

(declare-datatypes ((List!14833 0))(
  ( (Nil!14830) (Cons!14829 (h!15964 (_ BitVec 64)) (t!21140 List!14833)) )
))
(declare-fun arrayNoDuplicates!0 (array!43776 (_ BitVec 32) List!14833) Bool)

(assert (=> b!805623 (= res!549599 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14830))))

(declare-fun b!805624 () Bool)

(declare-fun res!549592 () Bool)

(assert (=> b!805624 (=> (not res!549592) (not e!446339))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805624 (= res!549592 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21383 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20963 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21383 a!3170)) (= (select (arr!20963 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805625 () Bool)

(declare-fun res!549595 () Bool)

(assert (=> b!805625 (=> (not res!549595) (not e!446341))))

(assert (=> b!805625 (= res!549595 (and (= (size!21383 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21383 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21383 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805626 () Bool)

(declare-fun res!549600 () Bool)

(assert (=> b!805626 (=> (not res!549600) (not e!446341))))

(declare-fun arrayContainsKey!0 (array!43776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805626 (= res!549600 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805627 () Bool)

(declare-fun res!549593 () Bool)

(assert (=> b!805627 (=> (not res!549593) (not e!446341))))

(assert (=> b!805627 (= res!549593 (validKeyInArray!0 k!2044))))

(declare-fun b!805628 () Bool)

(assert (=> b!805628 (= e!446341 e!446339)))

(declare-fun res!549594 () Bool)

(assert (=> b!805628 (=> (not res!549594) (not e!446339))))

(declare-fun lt!360632 () SeekEntryResult!8510)

(assert (=> b!805628 (= res!549594 (or (= lt!360632 (MissingZero!8510 i!1163)) (= lt!360632 (MissingVacant!8510 i!1163))))))

(assert (=> b!805628 (= lt!360632 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805629 () Bool)

(declare-fun res!549597 () Bool)

(assert (=> b!805629 (=> (not res!549597) (not e!446339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43776 (_ BitVec 32)) Bool)

(assert (=> b!805629 (= res!549597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69154 res!549596) b!805625))

(assert (= (and b!805625 res!549595) b!805622))

(assert (= (and b!805622 res!549598) b!805627))

(assert (= (and b!805627 res!549593) b!805626))

(assert (= (and b!805626 res!549600) b!805628))

(assert (= (and b!805628 res!549594) b!805629))

(assert (= (and b!805629 res!549597) b!805623))

(assert (= (and b!805623 res!549599) b!805624))

(assert (= (and b!805624 res!549592) b!805621))

(declare-fun m!747847 () Bool)

(assert (=> b!805624 m!747847))

(declare-fun m!747849 () Bool)

(assert (=> b!805624 m!747849))

(declare-fun m!747851 () Bool)

(assert (=> b!805628 m!747851))

(declare-fun m!747853 () Bool)

(assert (=> b!805627 m!747853))

(declare-fun m!747855 () Bool)

(assert (=> b!805626 m!747855))

(declare-fun m!747857 () Bool)

(assert (=> b!805622 m!747857))

(assert (=> b!805622 m!747857))

(declare-fun m!747859 () Bool)

(assert (=> b!805622 m!747859))

(declare-fun m!747861 () Bool)

(assert (=> start!69154 m!747861))

(declare-fun m!747863 () Bool)

(assert (=> start!69154 m!747863))

(declare-fun m!747865 () Bool)

(assert (=> b!805621 m!747865))

(declare-fun m!747867 () Bool)

(assert (=> b!805621 m!747867))

(declare-fun m!747869 () Bool)

(assert (=> b!805621 m!747869))

(declare-fun m!747871 () Bool)

(assert (=> b!805621 m!747871))

(declare-fun m!747873 () Bool)

(assert (=> b!805623 m!747873))

(declare-fun m!747875 () Bool)

(assert (=> b!805629 m!747875))

(push 1)

(assert (not b!805621))

(assert (not start!69154))

(assert (not b!805629))

(assert (not b!805622))

(assert (not b!805628))

(assert (not b!805626))

(assert (not b!805623))

(assert (not b!805627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

