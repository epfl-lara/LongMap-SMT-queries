; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68262 () Bool)

(assert start!68262)

(declare-fun b!793008 () Bool)

(declare-fun e!440593 () Bool)

(assert (=> b!793008 (= e!440593 false)))

(declare-fun lt!353629 () Bool)

(declare-datatypes ((array!43052 0))(
  ( (array!43053 (arr!20606 (Array (_ BitVec 32) (_ BitVec 64))) (size!21027 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43052)

(declare-datatypes ((List!14569 0))(
  ( (Nil!14566) (Cons!14565 (h!15694 (_ BitVec 64)) (t!20884 List!14569)) )
))
(declare-fun arrayNoDuplicates!0 (array!43052 (_ BitVec 32) List!14569) Bool)

(assert (=> b!793008 (= lt!353629 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14566))))

(declare-fun b!793009 () Bool)

(declare-fun res!537528 () Bool)

(assert (=> b!793009 (=> (not res!537528) (not e!440593))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43052 (_ BitVec 32)) Bool)

(assert (=> b!793009 (= res!537528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793010 () Bool)

(declare-fun res!537529 () Bool)

(declare-fun e!440592 () Bool)

(assert (=> b!793010 (=> (not res!537529) (not e!440592))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793010 (= res!537529 (and (= (size!21027 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21027 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21027 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793011 () Bool)

(declare-fun res!537527 () Bool)

(assert (=> b!793011 (=> (not res!537527) (not e!440592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793011 (= res!537527 (validKeyInArray!0 (select (arr!20606 a!3170) j!153)))))

(declare-fun b!793012 () Bool)

(declare-fun res!537530 () Bool)

(assert (=> b!793012 (=> (not res!537530) (not e!440592))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!793012 (= res!537530 (validKeyInArray!0 k!2044))))

(declare-fun res!537531 () Bool)

(assert (=> start!68262 (=> (not res!537531) (not e!440592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68262 (= res!537531 (validMask!0 mask!3266))))

(assert (=> start!68262 e!440592))

(assert (=> start!68262 true))

(declare-fun array_inv!16402 (array!43052) Bool)

(assert (=> start!68262 (array_inv!16402 a!3170)))

(declare-fun b!793013 () Bool)

(declare-fun res!537532 () Bool)

(assert (=> b!793013 (=> (not res!537532) (not e!440592))))

(declare-fun arrayContainsKey!0 (array!43052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793013 (= res!537532 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793014 () Bool)

(assert (=> b!793014 (= e!440592 e!440593)))

(declare-fun res!537533 () Bool)

(assert (=> b!793014 (=> (not res!537533) (not e!440593))))

(declare-datatypes ((SeekEntryResult!8197 0))(
  ( (MissingZero!8197 (index!35156 (_ BitVec 32))) (Found!8197 (index!35157 (_ BitVec 32))) (Intermediate!8197 (undefined!9009 Bool) (index!35158 (_ BitVec 32)) (x!66099 (_ BitVec 32))) (Undefined!8197) (MissingVacant!8197 (index!35159 (_ BitVec 32))) )
))
(declare-fun lt!353630 () SeekEntryResult!8197)

(assert (=> b!793014 (= res!537533 (or (= lt!353630 (MissingZero!8197 i!1163)) (= lt!353630 (MissingVacant!8197 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43052 (_ BitVec 32)) SeekEntryResult!8197)

(assert (=> b!793014 (= lt!353630 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68262 res!537531) b!793010))

(assert (= (and b!793010 res!537529) b!793011))

(assert (= (and b!793011 res!537527) b!793012))

(assert (= (and b!793012 res!537530) b!793013))

(assert (= (and b!793013 res!537532) b!793014))

(assert (= (and b!793014 res!537533) b!793009))

(assert (= (and b!793009 res!537528) b!793008))

(declare-fun m!733511 () Bool)

(assert (=> start!68262 m!733511))

(declare-fun m!733513 () Bool)

(assert (=> start!68262 m!733513))

(declare-fun m!733515 () Bool)

(assert (=> b!793008 m!733515))

(declare-fun m!733517 () Bool)

(assert (=> b!793013 m!733517))

(declare-fun m!733519 () Bool)

(assert (=> b!793011 m!733519))

(assert (=> b!793011 m!733519))

(declare-fun m!733521 () Bool)

(assert (=> b!793011 m!733521))

(declare-fun m!733523 () Bool)

(assert (=> b!793012 m!733523))

(declare-fun m!733525 () Bool)

(assert (=> b!793009 m!733525))

(declare-fun m!733527 () Bool)

(assert (=> b!793014 m!733527))

(push 1)

(assert (not b!793011))

(assert (not b!793009))

(assert (not b!793008))

(assert (not b!793012))

(assert (not b!793014))

