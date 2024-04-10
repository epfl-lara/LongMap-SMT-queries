; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68282 () Bool)

(assert start!68282)

(declare-fun b!793236 () Bool)

(declare-fun res!537758 () Bool)

(declare-fun e!440683 () Bool)

(assert (=> b!793236 (=> (not res!537758) (not e!440683))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43072 0))(
  ( (array!43073 (arr!20616 (Array (_ BitVec 32) (_ BitVec 64))) (size!21037 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43072)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793236 (= res!537758 (and (= (size!21037 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21037 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21037 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793237 () Bool)

(declare-fun e!440682 () Bool)

(assert (=> b!793237 (= e!440683 e!440682)))

(declare-fun res!537760 () Bool)

(assert (=> b!793237 (=> (not res!537760) (not e!440682))))

(declare-datatypes ((SeekEntryResult!8207 0))(
  ( (MissingZero!8207 (index!35196 (_ BitVec 32))) (Found!8207 (index!35197 (_ BitVec 32))) (Intermediate!8207 (undefined!9019 Bool) (index!35198 (_ BitVec 32)) (x!66141 (_ BitVec 32))) (Undefined!8207) (MissingVacant!8207 (index!35199 (_ BitVec 32))) )
))
(declare-fun lt!353672 () SeekEntryResult!8207)

(assert (=> b!793237 (= res!537760 (or (= lt!353672 (MissingZero!8207 i!1163)) (= lt!353672 (MissingVacant!8207 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43072 (_ BitVec 32)) SeekEntryResult!8207)

(assert (=> b!793237 (= lt!353672 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793238 () Bool)

(assert (=> b!793238 (= e!440682 false)))

(declare-fun lt!353671 () Bool)

(declare-datatypes ((List!14579 0))(
  ( (Nil!14576) (Cons!14575 (h!15704 (_ BitVec 64)) (t!20894 List!14579)) )
))
(declare-fun arrayNoDuplicates!0 (array!43072 (_ BitVec 32) List!14579) Bool)

(assert (=> b!793238 (= lt!353671 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14576))))

(declare-fun b!793239 () Bool)

(declare-fun res!537755 () Bool)

(assert (=> b!793239 (=> (not res!537755) (not e!440683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793239 (= res!537755 (validKeyInArray!0 k!2044))))

(declare-fun b!793240 () Bool)

(declare-fun res!537761 () Bool)

(assert (=> b!793240 (=> (not res!537761) (not e!440683))))

(assert (=> b!793240 (= res!537761 (validKeyInArray!0 (select (arr!20616 a!3170) j!153)))))

(declare-fun res!537757 () Bool)

(assert (=> start!68282 (=> (not res!537757) (not e!440683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68282 (= res!537757 (validMask!0 mask!3266))))

(assert (=> start!68282 e!440683))

(assert (=> start!68282 true))

(declare-fun array_inv!16412 (array!43072) Bool)

(assert (=> start!68282 (array_inv!16412 a!3170)))

(declare-fun b!793241 () Bool)

(declare-fun res!537756 () Bool)

(assert (=> b!793241 (=> (not res!537756) (not e!440682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43072 (_ BitVec 32)) Bool)

(assert (=> b!793241 (= res!537756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793242 () Bool)

(declare-fun res!537759 () Bool)

(assert (=> b!793242 (=> (not res!537759) (not e!440683))))

(declare-fun arrayContainsKey!0 (array!43072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793242 (= res!537759 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68282 res!537757) b!793236))

(assert (= (and b!793236 res!537758) b!793240))

(assert (= (and b!793240 res!537761) b!793239))

(assert (= (and b!793239 res!537755) b!793242))

(assert (= (and b!793242 res!537759) b!793237))

(assert (= (and b!793237 res!537760) b!793241))

(assert (= (and b!793241 res!537756) b!793238))

(declare-fun m!733715 () Bool)

(assert (=> b!793239 m!733715))

(declare-fun m!733717 () Bool)

(assert (=> b!793237 m!733717))

(declare-fun m!733719 () Bool)

(assert (=> b!793241 m!733719))

(declare-fun m!733721 () Bool)

(assert (=> b!793240 m!733721))

(assert (=> b!793240 m!733721))

(declare-fun m!733723 () Bool)

(assert (=> b!793240 m!733723))

(declare-fun m!733725 () Bool)

(assert (=> b!793238 m!733725))

(declare-fun m!733727 () Bool)

(assert (=> start!68282 m!733727))

(declare-fun m!733729 () Bool)

(assert (=> start!68282 m!733729))

(declare-fun m!733731 () Bool)

(assert (=> b!793242 m!733731))

(push 1)

