; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68164 () Bool)

(assert start!68164)

(declare-fun b!792323 () Bool)

(declare-fun res!536685 () Bool)

(declare-fun e!440362 () Bool)

(assert (=> b!792323 (=> (not res!536685) (not e!440362))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792323 (= res!536685 (validKeyInArray!0 k!2044))))

(declare-fun b!792324 () Bool)

(declare-fun res!536687 () Bool)

(assert (=> b!792324 (=> (not res!536687) (not e!440362))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42945 0))(
  ( (array!42946 (arr!20553 (Array (_ BitVec 32) (_ BitVec 64))) (size!20973 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42945)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792324 (= res!536687 (and (= (size!20973 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20973 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20973 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536688 () Bool)

(assert (=> start!68164 (=> (not res!536688) (not e!440362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68164 (= res!536688 (validMask!0 mask!3266))))

(assert (=> start!68164 e!440362))

(assert (=> start!68164 true))

(declare-fun array_inv!16412 (array!42945) Bool)

(assert (=> start!68164 (array_inv!16412 a!3170)))

(declare-fun b!792325 () Bool)

(assert (=> b!792325 (= e!440362 false)))

(declare-datatypes ((SeekEntryResult!8100 0))(
  ( (MissingZero!8100 (index!34768 (_ BitVec 32))) (Found!8100 (index!34769 (_ BitVec 32))) (Intermediate!8100 (undefined!8912 Bool) (index!34770 (_ BitVec 32)) (x!65885 (_ BitVec 32))) (Undefined!8100) (MissingVacant!8100 (index!34771 (_ BitVec 32))) )
))
(declare-fun lt!353566 () SeekEntryResult!8100)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42945 (_ BitVec 32)) SeekEntryResult!8100)

(assert (=> b!792325 (= lt!353566 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792326 () Bool)

(declare-fun res!536686 () Bool)

(assert (=> b!792326 (=> (not res!536686) (not e!440362))))

(assert (=> b!792326 (= res!536686 (validKeyInArray!0 (select (arr!20553 a!3170) j!153)))))

(declare-fun b!792327 () Bool)

(declare-fun res!536684 () Bool)

(assert (=> b!792327 (=> (not res!536684) (not e!440362))))

(declare-fun arrayContainsKey!0 (array!42945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792327 (= res!536684 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68164 res!536688) b!792324))

(assert (= (and b!792324 res!536687) b!792326))

(assert (= (and b!792326 res!536686) b!792323))

(assert (= (and b!792323 res!536685) b!792327))

(assert (= (and b!792327 res!536684) b!792325))

(declare-fun m!733467 () Bool)

(assert (=> b!792325 m!733467))

(declare-fun m!733469 () Bool)

(assert (=> b!792326 m!733469))

(assert (=> b!792326 m!733469))

(declare-fun m!733471 () Bool)

(assert (=> b!792326 m!733471))

(declare-fun m!733473 () Bool)

(assert (=> start!68164 m!733473))

(declare-fun m!733475 () Bool)

(assert (=> start!68164 m!733475))

(declare-fun m!733477 () Bool)

(assert (=> b!792327 m!733477))

(declare-fun m!733479 () Bool)

(assert (=> b!792323 m!733479))

(push 1)

(assert (not b!792325))

(assert (not b!792327))

(assert (not start!68164))

(assert (not b!792323))

(assert (not b!792326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

