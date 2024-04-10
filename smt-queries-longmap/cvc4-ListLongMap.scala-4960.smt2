; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68274 () Bool)

(assert start!68274)

(declare-fun b!793143 () Bool)

(declare-fun res!537668 () Bool)

(declare-fun e!440647 () Bool)

(assert (=> b!793143 (=> (not res!537668) (not e!440647))))

(declare-datatypes ((array!43064 0))(
  ( (array!43065 (arr!20612 (Array (_ BitVec 32) (_ BitVec 64))) (size!21033 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43064)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793143 (= res!537668 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793144 () Bool)

(declare-fun res!537664 () Bool)

(assert (=> b!793144 (=> (not res!537664) (not e!440647))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793144 (= res!537664 (validKeyInArray!0 (select (arr!20612 a!3170) j!153)))))

(declare-fun res!537663 () Bool)

(assert (=> start!68274 (=> (not res!537663) (not e!440647))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68274 (= res!537663 (validMask!0 mask!3266))))

(assert (=> start!68274 e!440647))

(assert (=> start!68274 true))

(declare-fun array_inv!16408 (array!43064) Bool)

(assert (=> start!68274 (array_inv!16408 a!3170)))

(declare-fun b!793145 () Bool)

(declare-fun e!440646 () Bool)

(assert (=> b!793145 (= e!440646 false)))

(declare-fun lt!353656 () Bool)

(declare-datatypes ((List!14575 0))(
  ( (Nil!14572) (Cons!14571 (h!15700 (_ BitVec 64)) (t!20890 List!14575)) )
))
(declare-fun arrayNoDuplicates!0 (array!43064 (_ BitVec 32) List!14575) Bool)

(assert (=> b!793145 (= lt!353656 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14572))))

(declare-fun b!793146 () Bool)

(assert (=> b!793146 (= e!440647 e!440646)))

(declare-fun res!537665 () Bool)

(assert (=> b!793146 (=> (not res!537665) (not e!440646))))

(declare-datatypes ((SeekEntryResult!8203 0))(
  ( (MissingZero!8203 (index!35180 (_ BitVec 32))) (Found!8203 (index!35181 (_ BitVec 32))) (Intermediate!8203 (undefined!9015 Bool) (index!35182 (_ BitVec 32)) (x!66121 (_ BitVec 32))) (Undefined!8203) (MissingVacant!8203 (index!35183 (_ BitVec 32))) )
))
(declare-fun lt!353657 () SeekEntryResult!8203)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793146 (= res!537665 (or (= lt!353657 (MissingZero!8203 i!1163)) (= lt!353657 (MissingVacant!8203 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43064 (_ BitVec 32)) SeekEntryResult!8203)

(assert (=> b!793146 (= lt!353657 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793147 () Bool)

(declare-fun res!537662 () Bool)

(assert (=> b!793147 (=> (not res!537662) (not e!440646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43064 (_ BitVec 32)) Bool)

(assert (=> b!793147 (= res!537662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793148 () Bool)

(declare-fun res!537666 () Bool)

(assert (=> b!793148 (=> (not res!537666) (not e!440647))))

(assert (=> b!793148 (= res!537666 (and (= (size!21033 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21033 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21033 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793149 () Bool)

(declare-fun res!537667 () Bool)

(assert (=> b!793149 (=> (not res!537667) (not e!440647))))

(assert (=> b!793149 (= res!537667 (validKeyInArray!0 k!2044))))

(assert (= (and start!68274 res!537663) b!793148))

(assert (= (and b!793148 res!537666) b!793144))

(assert (= (and b!793144 res!537664) b!793149))

(assert (= (and b!793149 res!537667) b!793143))

(assert (= (and b!793143 res!537668) b!793146))

(assert (= (and b!793146 res!537665) b!793147))

(assert (= (and b!793147 res!537662) b!793145))

(declare-fun m!733631 () Bool)

(assert (=> b!793143 m!733631))

(declare-fun m!733633 () Bool)

(assert (=> b!793144 m!733633))

(assert (=> b!793144 m!733633))

(declare-fun m!733635 () Bool)

(assert (=> b!793144 m!733635))

(declare-fun m!733637 () Bool)

(assert (=> b!793145 m!733637))

(declare-fun m!733639 () Bool)

(assert (=> start!68274 m!733639))

(declare-fun m!733641 () Bool)

(assert (=> start!68274 m!733641))

(declare-fun m!733643 () Bool)

(assert (=> b!793146 m!733643))

(declare-fun m!733645 () Bool)

(assert (=> b!793147 m!733645))

(declare-fun m!733647 () Bool)

(assert (=> b!793149 m!733647))

(push 1)

(assert (not start!68274))

(assert (not b!793145))

