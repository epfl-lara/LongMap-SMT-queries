; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68772 () Bool)

(assert start!68772)

(declare-fun b!801381 () Bool)

(declare-fun res!545903 () Bool)

(declare-fun e!444226 () Bool)

(assert (=> b!801381 (=> (not res!545903) (not e!444226))))

(declare-datatypes ((array!43562 0))(
  ( (array!43563 (arr!20861 (Array (_ BitVec 32) (_ BitVec 64))) (size!21282 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43562)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801381 (= res!545903 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801382 () Bool)

(declare-fun res!545911 () Bool)

(declare-fun e!444230 () Bool)

(assert (=> b!801382 (=> (not res!545911) (not e!444230))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801382 (= res!545911 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21282 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20861 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21282 a!3170)) (= (select (arr!20861 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801383 () Bool)

(declare-fun e!444227 () Bool)

(declare-fun e!444229 () Bool)

(assert (=> b!801383 (= e!444227 e!444229)))

(declare-fun res!545906 () Bool)

(assert (=> b!801383 (=> (not res!545906) (not e!444229))))

(declare-datatypes ((SeekEntryResult!8452 0))(
  ( (MissingZero!8452 (index!36176 (_ BitVec 32))) (Found!8452 (index!36177 (_ BitVec 32))) (Intermediate!8452 (undefined!9264 Bool) (index!36178 (_ BitVec 32)) (x!67034 (_ BitVec 32))) (Undefined!8452) (MissingVacant!8452 (index!36179 (_ BitVec 32))) )
))
(declare-fun lt!358192 () SeekEntryResult!8452)

(declare-fun lt!358186 () SeekEntryResult!8452)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801383 (= res!545906 (and (= lt!358192 lt!358186) (= lt!358186 (Found!8452 j!153)) (not (= (select (arr!20861 a!3170) index!1236) (select (arr!20861 a!3170) j!153)))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43562 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!801383 (= lt!358186 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43562 (_ BitVec 32)) SeekEntryResult!8452)

(assert (=> b!801383 (= lt!358192 (seekEntryOrOpen!0 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545904 () Bool)

(assert (=> start!68772 (=> (not res!545904) (not e!444226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68772 (= res!545904 (validMask!0 mask!3266))))

(assert (=> start!68772 e!444226))

(assert (=> start!68772 true))

(declare-fun array_inv!16657 (array!43562) Bool)

(assert (=> start!68772 (array_inv!16657 a!3170)))

(declare-fun b!801384 () Bool)

(declare-fun res!545909 () Bool)

(assert (=> b!801384 (=> (not res!545909) (not e!444226))))

(assert (=> b!801384 (= res!545909 (and (= (size!21282 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21282 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21282 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801385 () Bool)

(declare-fun res!545910 () Bool)

(assert (=> b!801385 (=> (not res!545910) (not e!444230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43562 (_ BitVec 32)) Bool)

(assert (=> b!801385 (= res!545910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801386 () Bool)

(declare-fun res!545912 () Bool)

(declare-fun e!444225 () Bool)

(assert (=> b!801386 (=> (not res!545912) (not e!444225))))

(declare-fun lt!358191 () array!43562)

(declare-fun lt!358187 () (_ BitVec 64))

(declare-fun lt!358188 () (_ BitVec 32))

(declare-fun lt!358189 () SeekEntryResult!8452)

(assert (=> b!801386 (= res!545912 (= lt!358189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358188 vacantAfter!23 lt!358187 lt!358191 mask!3266)))))

(declare-fun b!801387 () Bool)

(declare-fun res!545907 () Bool)

(assert (=> b!801387 (=> (not res!545907) (not e!444226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801387 (= res!545907 (validKeyInArray!0 k!2044))))

(declare-fun b!801388 () Bool)

(assert (=> b!801388 (= e!444230 e!444227)))

(declare-fun res!545905 () Bool)

(assert (=> b!801388 (=> (not res!545905) (not e!444227))))

(assert (=> b!801388 (= res!545905 (= lt!358189 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358187 lt!358191 mask!3266)))))

(assert (=> b!801388 (= lt!358189 (seekEntryOrOpen!0 lt!358187 lt!358191 mask!3266))))

(assert (=> b!801388 (= lt!358187 (select (store (arr!20861 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801388 (= lt!358191 (array!43563 (store (arr!20861 a!3170) i!1163 k!2044) (size!21282 a!3170)))))

(declare-fun b!801389 () Bool)

(assert (=> b!801389 (= e!444226 e!444230)))

(declare-fun res!545901 () Bool)

(assert (=> b!801389 (=> (not res!545901) (not e!444230))))

(declare-fun lt!358193 () SeekEntryResult!8452)

(assert (=> b!801389 (= res!545901 (or (= lt!358193 (MissingZero!8452 i!1163)) (= lt!358193 (MissingVacant!8452 i!1163))))))

(assert (=> b!801389 (= lt!358193 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801390 () Bool)

(declare-fun res!545902 () Bool)

(assert (=> b!801390 (=> (not res!545902) (not e!444230))))

(declare-datatypes ((List!14824 0))(
  ( (Nil!14821) (Cons!14820 (h!15949 (_ BitVec 64)) (t!21139 List!14824)) )
))
(declare-fun arrayNoDuplicates!0 (array!43562 (_ BitVec 32) List!14824) Bool)

(assert (=> b!801390 (= res!545902 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14821))))

(declare-fun b!801391 () Bool)

(assert (=> b!801391 (= e!444229 e!444225)))

(declare-fun res!545900 () Bool)

(assert (=> b!801391 (=> (not res!545900) (not e!444225))))

(assert (=> b!801391 (= res!545900 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358188 #b00000000000000000000000000000000) (bvslt lt!358188 (size!21282 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801391 (= lt!358188 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801392 () Bool)

(declare-fun res!545908 () Bool)

(assert (=> b!801392 (=> (not res!545908) (not e!444226))))

(assert (=> b!801392 (= res!545908 (validKeyInArray!0 (select (arr!20861 a!3170) j!153)))))

(declare-fun b!801393 () Bool)

(assert (=> b!801393 (= e!444225 false)))

(declare-fun lt!358190 () SeekEntryResult!8452)

(assert (=> b!801393 (= lt!358190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358188 vacantBefore!23 (select (arr!20861 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68772 res!545904) b!801384))

(assert (= (and b!801384 res!545909) b!801392))

(assert (= (and b!801392 res!545908) b!801387))

(assert (= (and b!801387 res!545907) b!801381))

(assert (= (and b!801381 res!545903) b!801389))

(assert (= (and b!801389 res!545901) b!801385))

(assert (= (and b!801385 res!545910) b!801390))

(assert (= (and b!801390 res!545902) b!801382))

(assert (= (and b!801382 res!545911) b!801388))

(assert (= (and b!801388 res!545905) b!801383))

(assert (= (and b!801383 res!545906) b!801391))

(assert (= (and b!801391 res!545900) b!801386))

(assert (= (and b!801386 res!545912) b!801393))

(declare-fun m!742541 () Bool)

(assert (=> b!801391 m!742541))

(declare-fun m!742543 () Bool)

(assert (=> b!801387 m!742543))

(declare-fun m!742545 () Bool)

(assert (=> b!801388 m!742545))

(declare-fun m!742547 () Bool)

(assert (=> b!801388 m!742547))

(declare-fun m!742549 () Bool)

(assert (=> b!801388 m!742549))

(declare-fun m!742551 () Bool)

(assert (=> b!801388 m!742551))

(declare-fun m!742553 () Bool)

(assert (=> b!801383 m!742553))

(declare-fun m!742555 () Bool)

(assert (=> b!801383 m!742555))

(assert (=> b!801383 m!742555))

(declare-fun m!742557 () Bool)

(assert (=> b!801383 m!742557))

(assert (=> b!801383 m!742555))

(declare-fun m!742559 () Bool)

(assert (=> b!801383 m!742559))

(declare-fun m!742561 () Bool)

(assert (=> start!68772 m!742561))

(declare-fun m!742563 () Bool)

(assert (=> start!68772 m!742563))

(assert (=> b!801392 m!742555))

(assert (=> b!801392 m!742555))

(declare-fun m!742565 () Bool)

(assert (=> b!801392 m!742565))

(assert (=> b!801393 m!742555))

(assert (=> b!801393 m!742555))

(declare-fun m!742567 () Bool)

(assert (=> b!801393 m!742567))

(declare-fun m!742569 () Bool)

(assert (=> b!801382 m!742569))

(declare-fun m!742571 () Bool)

(assert (=> b!801382 m!742571))

(declare-fun m!742573 () Bool)

(assert (=> b!801390 m!742573))

(declare-fun m!742575 () Bool)

(assert (=> b!801389 m!742575))

(declare-fun m!742577 () Bool)

(assert (=> b!801386 m!742577))

(declare-fun m!742579 () Bool)

(assert (=> b!801385 m!742579))

(declare-fun m!742581 () Bool)

(assert (=> b!801381 m!742581))

(push 1)

