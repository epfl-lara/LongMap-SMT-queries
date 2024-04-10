; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68258 () Bool)

(assert start!68258)

(declare-fun res!537490 () Bool)

(declare-fun e!440574 () Bool)

(assert (=> start!68258 (=> (not res!537490) (not e!440574))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68258 (= res!537490 (validMask!0 mask!3266))))

(assert (=> start!68258 e!440574))

(assert (=> start!68258 true))

(declare-datatypes ((array!43048 0))(
  ( (array!43049 (arr!20604 (Array (_ BitVec 32) (_ BitVec 64))) (size!21025 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43048)

(declare-fun array_inv!16400 (array!43048) Bool)

(assert (=> start!68258 (array_inv!16400 a!3170)))

(declare-fun b!792966 () Bool)

(declare-fun res!537485 () Bool)

(assert (=> b!792966 (=> (not res!537485) (not e!440574))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792966 (= res!537485 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792967 () Bool)

(declare-fun res!537489 () Bool)

(assert (=> b!792967 (=> (not res!537489) (not e!440574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792967 (= res!537489 (validKeyInArray!0 k!2044))))

(declare-fun b!792968 () Bool)

(declare-fun res!537488 () Bool)

(assert (=> b!792968 (=> (not res!537488) (not e!440574))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792968 (= res!537488 (and (= (size!21025 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21025 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21025 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792969 () Bool)

(declare-fun e!440575 () Bool)

(assert (=> b!792969 (= e!440575 false)))

(declare-fun lt!353618 () Bool)

(declare-datatypes ((List!14567 0))(
  ( (Nil!14564) (Cons!14563 (h!15692 (_ BitVec 64)) (t!20882 List!14567)) )
))
(declare-fun arrayNoDuplicates!0 (array!43048 (_ BitVec 32) List!14567) Bool)

(assert (=> b!792969 (= lt!353618 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14564))))

(declare-fun b!792970 () Bool)

(declare-fun res!537486 () Bool)

(assert (=> b!792970 (=> (not res!537486) (not e!440574))))

(assert (=> b!792970 (= res!537486 (validKeyInArray!0 (select (arr!20604 a!3170) j!153)))))

(declare-fun b!792971 () Bool)

(declare-fun res!537491 () Bool)

(assert (=> b!792971 (=> (not res!537491) (not e!440575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43048 (_ BitVec 32)) Bool)

(assert (=> b!792971 (= res!537491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792972 () Bool)

(assert (=> b!792972 (= e!440574 e!440575)))

(declare-fun res!537487 () Bool)

(assert (=> b!792972 (=> (not res!537487) (not e!440575))))

(declare-datatypes ((SeekEntryResult!8195 0))(
  ( (MissingZero!8195 (index!35148 (_ BitVec 32))) (Found!8195 (index!35149 (_ BitVec 32))) (Intermediate!8195 (undefined!9007 Bool) (index!35150 (_ BitVec 32)) (x!66097 (_ BitVec 32))) (Undefined!8195) (MissingVacant!8195 (index!35151 (_ BitVec 32))) )
))
(declare-fun lt!353617 () SeekEntryResult!8195)

(assert (=> b!792972 (= res!537487 (or (= lt!353617 (MissingZero!8195 i!1163)) (= lt!353617 (MissingVacant!8195 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43048 (_ BitVec 32)) SeekEntryResult!8195)

(assert (=> b!792972 (= lt!353617 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68258 res!537490) b!792968))

(assert (= (and b!792968 res!537488) b!792970))

(assert (= (and b!792970 res!537486) b!792967))

(assert (= (and b!792967 res!537489) b!792966))

(assert (= (and b!792966 res!537485) b!792972))

(assert (= (and b!792972 res!537487) b!792971))

(assert (= (and b!792971 res!537491) b!792969))

(declare-fun m!733475 () Bool)

(assert (=> b!792970 m!733475))

(assert (=> b!792970 m!733475))

(declare-fun m!733477 () Bool)

(assert (=> b!792970 m!733477))

(declare-fun m!733479 () Bool)

(assert (=> b!792967 m!733479))

(declare-fun m!733481 () Bool)

(assert (=> b!792966 m!733481))

(declare-fun m!733483 () Bool)

(assert (=> start!68258 m!733483))

(declare-fun m!733485 () Bool)

(assert (=> start!68258 m!733485))

(declare-fun m!733487 () Bool)

(assert (=> b!792971 m!733487))

(declare-fun m!733489 () Bool)

(assert (=> b!792969 m!733489))

(declare-fun m!733491 () Bool)

(assert (=> b!792972 m!733491))

(push 1)

(assert (not b!792967))

(assert (not b!792972))

(assert (not b!792970))

(assert (not b!792969))

(assert (not b!792971))

(assert (not b!792966))

(assert (not start!68258))

(check-sat)

(pop 1)

