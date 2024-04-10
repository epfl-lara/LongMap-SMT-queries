; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68246 () Bool)

(assert start!68246)

(declare-fun b!792822 () Bool)

(declare-fun res!537344 () Bool)

(declare-fun e!440522 () Bool)

(assert (=> b!792822 (=> (not res!537344) (not e!440522))))

(declare-datatypes ((array!43036 0))(
  ( (array!43037 (arr!20598 (Array (_ BitVec 32) (_ BitVec 64))) (size!21019 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43036)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792822 (= res!537344 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792823 () Bool)

(declare-fun res!537345 () Bool)

(assert (=> b!792823 (=> (not res!537345) (not e!440522))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792823 (= res!537345 (validKeyInArray!0 (select (arr!20598 a!3170) j!153)))))

(declare-fun b!792824 () Bool)

(declare-fun res!537343 () Bool)

(assert (=> b!792824 (=> (not res!537343) (not e!440522))))

(assert (=> b!792824 (= res!537343 (validKeyInArray!0 k!2044))))

(declare-fun res!537341 () Bool)

(assert (=> start!68246 (=> (not res!537341) (not e!440522))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68246 (= res!537341 (validMask!0 mask!3266))))

(assert (=> start!68246 e!440522))

(assert (=> start!68246 true))

(declare-fun array_inv!16394 (array!43036) Bool)

(assert (=> start!68246 (array_inv!16394 a!3170)))

(declare-fun b!792825 () Bool)

(declare-fun res!537347 () Bool)

(assert (=> b!792825 (=> (not res!537347) (not e!440522))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792825 (= res!537347 (and (= (size!21019 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21019 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21019 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792826 () Bool)

(declare-fun e!440520 () Bool)

(assert (=> b!792826 (= e!440520 false)))

(declare-fun lt!353591 () Bool)

(declare-datatypes ((List!14561 0))(
  ( (Nil!14558) (Cons!14557 (h!15686 (_ BitVec 64)) (t!20876 List!14561)) )
))
(declare-fun arrayNoDuplicates!0 (array!43036 (_ BitVec 32) List!14561) Bool)

(assert (=> b!792826 (= lt!353591 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14558))))

(declare-fun b!792827 () Bool)

(declare-fun res!537346 () Bool)

(assert (=> b!792827 (=> (not res!537346) (not e!440520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43036 (_ BitVec 32)) Bool)

(assert (=> b!792827 (= res!537346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792828 () Bool)

(assert (=> b!792828 (= e!440522 e!440520)))

(declare-fun res!537342 () Bool)

(assert (=> b!792828 (=> (not res!537342) (not e!440520))))

(declare-datatypes ((SeekEntryResult!8189 0))(
  ( (MissingZero!8189 (index!35124 (_ BitVec 32))) (Found!8189 (index!35125 (_ BitVec 32))) (Intermediate!8189 (undefined!9001 Bool) (index!35126 (_ BitVec 32)) (x!66075 (_ BitVec 32))) (Undefined!8189) (MissingVacant!8189 (index!35127 (_ BitVec 32))) )
))
(declare-fun lt!353590 () SeekEntryResult!8189)

(assert (=> b!792828 (= res!537342 (or (= lt!353590 (MissingZero!8189 i!1163)) (= lt!353590 (MissingVacant!8189 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43036 (_ BitVec 32)) SeekEntryResult!8189)

(assert (=> b!792828 (= lt!353590 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68246 res!537341) b!792825))

(assert (= (and b!792825 res!537347) b!792823))

(assert (= (and b!792823 res!537345) b!792824))

(assert (= (and b!792824 res!537343) b!792822))

(assert (= (and b!792822 res!537344) b!792828))

(assert (= (and b!792828 res!537342) b!792827))

(assert (= (and b!792827 res!537346) b!792826))

(declare-fun m!733337 () Bool)

(assert (=> b!792827 m!733337))

(declare-fun m!733339 () Bool)

(assert (=> b!792824 m!733339))

(declare-fun m!733341 () Bool)

(assert (=> b!792826 m!733341))

(declare-fun m!733343 () Bool)

(assert (=> b!792828 m!733343))

(declare-fun m!733345 () Bool)

(assert (=> start!68246 m!733345))

(declare-fun m!733347 () Bool)

(assert (=> start!68246 m!733347))

(declare-fun m!733349 () Bool)

(assert (=> b!792823 m!733349))

(assert (=> b!792823 m!733349))

(declare-fun m!733351 () Bool)

(assert (=> b!792823 m!733351))

(declare-fun m!733353 () Bool)

(assert (=> b!792822 m!733353))

(push 1)

