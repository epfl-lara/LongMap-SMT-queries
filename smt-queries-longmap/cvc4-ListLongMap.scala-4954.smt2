; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68238 () Bool)

(assert start!68238)

(declare-fun b!792729 () Bool)

(declare-fun res!537250 () Bool)

(declare-fun e!440485 () Bool)

(assert (=> b!792729 (=> (not res!537250) (not e!440485))))

(declare-datatypes ((array!43028 0))(
  ( (array!43029 (arr!20594 (Array (_ BitVec 32) (_ BitVec 64))) (size!21015 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43028)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43028 (_ BitVec 32)) Bool)

(assert (=> b!792729 (= res!537250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537253 () Bool)

(declare-fun e!440484 () Bool)

(assert (=> start!68238 (=> (not res!537253) (not e!440484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68238 (= res!537253 (validMask!0 mask!3266))))

(assert (=> start!68238 e!440484))

(assert (=> start!68238 true))

(declare-fun array_inv!16390 (array!43028) Bool)

(assert (=> start!68238 (array_inv!16390 a!3170)))

(declare-fun b!792730 () Bool)

(declare-fun res!537248 () Bool)

(assert (=> b!792730 (=> (not res!537248) (not e!440484))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792730 (= res!537248 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792731 () Bool)

(assert (=> b!792731 (= e!440485 false)))

(declare-fun lt!353575 () Bool)

(declare-datatypes ((List!14557 0))(
  ( (Nil!14554) (Cons!14553 (h!15682 (_ BitVec 64)) (t!20872 List!14557)) )
))
(declare-fun arrayNoDuplicates!0 (array!43028 (_ BitVec 32) List!14557) Bool)

(assert (=> b!792731 (= lt!353575 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14554))))

(declare-fun b!792732 () Bool)

(declare-fun res!537251 () Bool)

(assert (=> b!792732 (=> (not res!537251) (not e!440484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792732 (= res!537251 (validKeyInArray!0 k!2044))))

(declare-fun b!792733 () Bool)

(declare-fun res!537254 () Bool)

(assert (=> b!792733 (=> (not res!537254) (not e!440484))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792733 (= res!537254 (and (= (size!21015 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21015 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21015 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792734 () Bool)

(declare-fun res!537249 () Bool)

(assert (=> b!792734 (=> (not res!537249) (not e!440484))))

(assert (=> b!792734 (= res!537249 (validKeyInArray!0 (select (arr!20594 a!3170) j!153)))))

(declare-fun b!792735 () Bool)

(assert (=> b!792735 (= e!440484 e!440485)))

(declare-fun res!537252 () Bool)

(assert (=> b!792735 (=> (not res!537252) (not e!440485))))

(declare-datatypes ((SeekEntryResult!8185 0))(
  ( (MissingZero!8185 (index!35108 (_ BitVec 32))) (Found!8185 (index!35109 (_ BitVec 32))) (Intermediate!8185 (undefined!8997 Bool) (index!35110 (_ BitVec 32)) (x!66055 (_ BitVec 32))) (Undefined!8185) (MissingVacant!8185 (index!35111 (_ BitVec 32))) )
))
(declare-fun lt!353576 () SeekEntryResult!8185)

(assert (=> b!792735 (= res!537252 (or (= lt!353576 (MissingZero!8185 i!1163)) (= lt!353576 (MissingVacant!8185 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43028 (_ BitVec 32)) SeekEntryResult!8185)

(assert (=> b!792735 (= lt!353576 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68238 res!537253) b!792733))

(assert (= (and b!792733 res!537254) b!792734))

(assert (= (and b!792734 res!537249) b!792732))

(assert (= (and b!792732 res!537251) b!792730))

(assert (= (and b!792730 res!537248) b!792735))

(assert (= (and b!792735 res!537252) b!792729))

(assert (= (and b!792729 res!537250) b!792731))

(declare-fun m!733253 () Bool)

(assert (=> b!792729 m!733253))

(declare-fun m!733255 () Bool)

(assert (=> b!792732 m!733255))

(declare-fun m!733257 () Bool)

(assert (=> start!68238 m!733257))

(declare-fun m!733259 () Bool)

(assert (=> start!68238 m!733259))

(declare-fun m!733261 () Bool)

(assert (=> b!792735 m!733261))

(declare-fun m!733263 () Bool)

(assert (=> b!792730 m!733263))

(declare-fun m!733265 () Bool)

(assert (=> b!792731 m!733265))

(declare-fun m!733267 () Bool)

(assert (=> b!792734 m!733267))

(assert (=> b!792734 m!733267))

(declare-fun m!733269 () Bool)

(assert (=> b!792734 m!733269))

(push 1)

