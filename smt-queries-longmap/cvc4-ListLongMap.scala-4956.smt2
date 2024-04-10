; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68250 () Bool)

(assert start!68250)

(declare-fun b!792864 () Bool)

(declare-fun res!537384 () Bool)

(declare-fun e!440540 () Bool)

(assert (=> b!792864 (=> (not res!537384) (not e!440540))))

(declare-datatypes ((array!43040 0))(
  ( (array!43041 (arr!20600 (Array (_ BitVec 32) (_ BitVec 64))) (size!21021 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43040)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792864 (= res!537384 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792865 () Bool)

(declare-fun res!537388 () Bool)

(assert (=> b!792865 (=> (not res!537388) (not e!440540))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792865 (= res!537388 (and (= (size!21021 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21021 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21021 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792866 () Bool)

(declare-fun res!537387 () Bool)

(assert (=> b!792866 (=> (not res!537387) (not e!440540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792866 (= res!537387 (validKeyInArray!0 (select (arr!20600 a!3170) j!153)))))

(declare-fun res!537385 () Bool)

(assert (=> start!68250 (=> (not res!537385) (not e!440540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68250 (= res!537385 (validMask!0 mask!3266))))

(assert (=> start!68250 e!440540))

(assert (=> start!68250 true))

(declare-fun array_inv!16396 (array!43040) Bool)

(assert (=> start!68250 (array_inv!16396 a!3170)))

(declare-fun b!792867 () Bool)

(declare-fun e!440539 () Bool)

(assert (=> b!792867 (= e!440539 false)))

(declare-fun lt!353603 () Bool)

(declare-datatypes ((List!14563 0))(
  ( (Nil!14560) (Cons!14559 (h!15688 (_ BitVec 64)) (t!20878 List!14563)) )
))
(declare-fun arrayNoDuplicates!0 (array!43040 (_ BitVec 32) List!14563) Bool)

(assert (=> b!792867 (= lt!353603 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14560))))

(declare-fun b!792868 () Bool)

(declare-fun res!537389 () Bool)

(assert (=> b!792868 (=> (not res!537389) (not e!440539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43040 (_ BitVec 32)) Bool)

(assert (=> b!792868 (= res!537389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792869 () Bool)

(assert (=> b!792869 (= e!440540 e!440539)))

(declare-fun res!537386 () Bool)

(assert (=> b!792869 (=> (not res!537386) (not e!440539))))

(declare-datatypes ((SeekEntryResult!8191 0))(
  ( (MissingZero!8191 (index!35132 (_ BitVec 32))) (Found!8191 (index!35133 (_ BitVec 32))) (Intermediate!8191 (undefined!9003 Bool) (index!35134 (_ BitVec 32)) (x!66077 (_ BitVec 32))) (Undefined!8191) (MissingVacant!8191 (index!35135 (_ BitVec 32))) )
))
(declare-fun lt!353602 () SeekEntryResult!8191)

(assert (=> b!792869 (= res!537386 (or (= lt!353602 (MissingZero!8191 i!1163)) (= lt!353602 (MissingVacant!8191 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43040 (_ BitVec 32)) SeekEntryResult!8191)

(assert (=> b!792869 (= lt!353602 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792870 () Bool)

(declare-fun res!537383 () Bool)

(assert (=> b!792870 (=> (not res!537383) (not e!440540))))

(assert (=> b!792870 (= res!537383 (validKeyInArray!0 k!2044))))

(assert (= (and start!68250 res!537385) b!792865))

(assert (= (and b!792865 res!537388) b!792866))

(assert (= (and b!792866 res!537387) b!792870))

(assert (= (and b!792870 res!537383) b!792864))

(assert (= (and b!792864 res!537384) b!792869))

(assert (= (and b!792869 res!537386) b!792868))

(assert (= (and b!792868 res!537389) b!792867))

(declare-fun m!733373 () Bool)

(assert (=> start!68250 m!733373))

(declare-fun m!733375 () Bool)

(assert (=> start!68250 m!733375))

(declare-fun m!733377 () Bool)

(assert (=> b!792866 m!733377))

(assert (=> b!792866 m!733377))

(declare-fun m!733379 () Bool)

(assert (=> b!792866 m!733379))

(declare-fun m!733381 () Bool)

(assert (=> b!792869 m!733381))

(declare-fun m!733383 () Bool)

(assert (=> b!792870 m!733383))

(declare-fun m!733385 () Bool)

(assert (=> b!792868 m!733385))

(declare-fun m!733387 () Bool)

(assert (=> b!792867 m!733387))

(declare-fun m!733389 () Bool)

(assert (=> b!792864 m!733389))

(push 1)

(assert (not b!792870))

(assert (not b!792864))

(assert (not b!792868))

(assert (not start!68250))

(assert (not b!792869))

