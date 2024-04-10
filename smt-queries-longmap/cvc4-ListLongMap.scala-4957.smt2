; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68256 () Bool)

(assert start!68256)

(declare-fun b!792943 () Bool)

(declare-fun e!440565 () Bool)

(declare-fun e!440566 () Bool)

(assert (=> b!792943 (= e!440565 e!440566)))

(declare-fun res!537470 () Bool)

(assert (=> b!792943 (=> (not res!537470) (not e!440566))))

(declare-datatypes ((SeekEntryResult!8194 0))(
  ( (MissingZero!8194 (index!35144 (_ BitVec 32))) (Found!8194 (index!35145 (_ BitVec 32))) (Intermediate!8194 (undefined!9006 Bool) (index!35146 (_ BitVec 32)) (x!66088 (_ BitVec 32))) (Undefined!8194) (MissingVacant!8194 (index!35147 (_ BitVec 32))) )
))
(declare-fun lt!353612 () SeekEntryResult!8194)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792943 (= res!537470 (or (= lt!353612 (MissingZero!8194 i!1163)) (= lt!353612 (MissingVacant!8194 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43046 0))(
  ( (array!43047 (arr!20603 (Array (_ BitVec 32) (_ BitVec 64))) (size!21024 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43046)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43046 (_ BitVec 32)) SeekEntryResult!8194)

(assert (=> b!792943 (= lt!353612 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792944 () Bool)

(declare-fun res!537464 () Bool)

(assert (=> b!792944 (=> (not res!537464) (not e!440566))))

(declare-datatypes ((List!14566 0))(
  ( (Nil!14563) (Cons!14562 (h!15691 (_ BitVec 64)) (t!20881 List!14566)) )
))
(declare-fun arrayNoDuplicates!0 (array!43046 (_ BitVec 32) List!14566) Bool)

(assert (=> b!792944 (= res!537464 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14563))))

(declare-fun b!792945 () Bool)

(declare-fun res!537469 () Bool)

(assert (=> b!792945 (=> (not res!537469) (not e!440566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43046 (_ BitVec 32)) Bool)

(assert (=> b!792945 (= res!537469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792946 () Bool)

(declare-fun res!537468 () Bool)

(assert (=> b!792946 (=> (not res!537468) (not e!440565))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792946 (= res!537468 (and (= (size!21024 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21024 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21024 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792947 () Bool)

(declare-fun res!537463 () Bool)

(assert (=> b!792947 (=> (not res!537463) (not e!440565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792947 (= res!537463 (validKeyInArray!0 k!2044))))

(declare-fun b!792948 () Bool)

(declare-fun res!537467 () Bool)

(assert (=> b!792948 (=> (not res!537467) (not e!440565))))

(assert (=> b!792948 (= res!537467 (validKeyInArray!0 (select (arr!20603 a!3170) j!153)))))

(declare-fun b!792949 () Bool)

(declare-fun res!537462 () Bool)

(assert (=> b!792949 (=> (not res!537462) (not e!440565))))

(declare-fun arrayContainsKey!0 (array!43046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792949 (= res!537462 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792950 () Bool)

(declare-fun res!537466 () Bool)

(assert (=> b!792950 (=> (not res!537466) (not e!440566))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792950 (= res!537466 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21024 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20603 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21024 a!3170)) (= (select (arr!20603 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun res!537465 () Bool)

(assert (=> start!68256 (=> (not res!537465) (not e!440565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68256 (= res!537465 (validMask!0 mask!3266))))

(assert (=> start!68256 e!440565))

(assert (=> start!68256 true))

(declare-fun array_inv!16399 (array!43046) Bool)

(assert (=> start!68256 (array_inv!16399 a!3170)))

(declare-fun b!792951 () Bool)

(assert (=> b!792951 (= e!440566 (not (validKeyInArray!0 (select (store (arr!20603 a!3170) i!1163 k!2044) j!153))))))

(assert (= (and start!68256 res!537465) b!792946))

(assert (= (and b!792946 res!537468) b!792948))

(assert (= (and b!792948 res!537467) b!792947))

(assert (= (and b!792947 res!537463) b!792949))

(assert (= (and b!792949 res!537462) b!792943))

(assert (= (and b!792943 res!537470) b!792945))

(assert (= (and b!792945 res!537469) b!792944))

(assert (= (and b!792944 res!537464) b!792950))

(assert (= (and b!792950 res!537466) b!792951))

(declare-fun m!733447 () Bool)

(assert (=> b!792945 m!733447))

(declare-fun m!733449 () Bool)

(assert (=> b!792951 m!733449))

(declare-fun m!733451 () Bool)

(assert (=> b!792951 m!733451))

(assert (=> b!792951 m!733451))

(declare-fun m!733453 () Bool)

(assert (=> b!792951 m!733453))

(declare-fun m!733455 () Bool)

(assert (=> b!792944 m!733455))

(declare-fun m!733457 () Bool)

(assert (=> b!792943 m!733457))

(declare-fun m!733459 () Bool)

(assert (=> b!792947 m!733459))

(declare-fun m!733461 () Bool)

(assert (=> b!792949 m!733461))

(declare-fun m!733463 () Bool)

(assert (=> b!792948 m!733463))

(assert (=> b!792948 m!733463))

(declare-fun m!733465 () Bool)

(assert (=> b!792948 m!733465))

(declare-fun m!733467 () Bool)

(assert (=> b!792950 m!733467))

(declare-fun m!733469 () Bool)

(assert (=> b!792950 m!733469))

(declare-fun m!733471 () Bool)

(assert (=> start!68256 m!733471))

(declare-fun m!733473 () Bool)

(assert (=> start!68256 m!733473))

(push 1)

(assert (not b!792943))

(assert (not b!792948))

(assert (not b!792945))

(assert (not b!792949))

(assert (not b!792951))

