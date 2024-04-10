; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68270 () Bool)

(assert start!68270)

(declare-fun res!537625 () Bool)

(declare-fun e!440629 () Bool)

(assert (=> start!68270 (=> (not res!537625) (not e!440629))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68270 (= res!537625 (validMask!0 mask!3266))))

(assert (=> start!68270 e!440629))

(assert (=> start!68270 true))

(declare-datatypes ((array!43060 0))(
  ( (array!43061 (arr!20610 (Array (_ BitVec 32) (_ BitVec 64))) (size!21031 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43060)

(declare-fun array_inv!16406 (array!43060) Bool)

(assert (=> start!68270 (array_inv!16406 a!3170)))

(declare-fun b!793101 () Bool)

(declare-fun res!537622 () Bool)

(assert (=> b!793101 (=> (not res!537622) (not e!440629))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793101 (= res!537622 (validKeyInArray!0 k!2044))))

(declare-fun b!793102 () Bool)

(declare-fun res!537620 () Bool)

(assert (=> b!793102 (=> (not res!537620) (not e!440629))))

(declare-fun arrayContainsKey!0 (array!43060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793102 (= res!537620 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793103 () Bool)

(declare-fun e!440628 () Bool)

(assert (=> b!793103 (= e!440629 e!440628)))

(declare-fun res!537621 () Bool)

(assert (=> b!793103 (=> (not res!537621) (not e!440628))))

(declare-datatypes ((SeekEntryResult!8201 0))(
  ( (MissingZero!8201 (index!35172 (_ BitVec 32))) (Found!8201 (index!35173 (_ BitVec 32))) (Intermediate!8201 (undefined!9013 Bool) (index!35174 (_ BitVec 32)) (x!66119 (_ BitVec 32))) (Undefined!8201) (MissingVacant!8201 (index!35175 (_ BitVec 32))) )
))
(declare-fun lt!353644 () SeekEntryResult!8201)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793103 (= res!537621 (or (= lt!353644 (MissingZero!8201 i!1163)) (= lt!353644 (MissingVacant!8201 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43060 (_ BitVec 32)) SeekEntryResult!8201)

(assert (=> b!793103 (= lt!353644 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793104 () Bool)

(declare-fun res!537626 () Bool)

(assert (=> b!793104 (=> (not res!537626) (not e!440628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43060 (_ BitVec 32)) Bool)

(assert (=> b!793104 (= res!537626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793105 () Bool)

(declare-fun res!537623 () Bool)

(assert (=> b!793105 (=> (not res!537623) (not e!440629))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793105 (= res!537623 (and (= (size!21031 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21031 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21031 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793106 () Bool)

(assert (=> b!793106 (= e!440628 false)))

(declare-fun lt!353645 () Bool)

(declare-datatypes ((List!14573 0))(
  ( (Nil!14570) (Cons!14569 (h!15698 (_ BitVec 64)) (t!20888 List!14573)) )
))
(declare-fun arrayNoDuplicates!0 (array!43060 (_ BitVec 32) List!14573) Bool)

(assert (=> b!793106 (= lt!353645 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14570))))

(declare-fun b!793107 () Bool)

(declare-fun res!537624 () Bool)

(assert (=> b!793107 (=> (not res!537624) (not e!440629))))

(assert (=> b!793107 (= res!537624 (validKeyInArray!0 (select (arr!20610 a!3170) j!153)))))

(assert (= (and start!68270 res!537625) b!793105))

(assert (= (and b!793105 res!537623) b!793107))

(assert (= (and b!793107 res!537624) b!793101))

(assert (= (and b!793101 res!537622) b!793102))

(assert (= (and b!793102 res!537620) b!793103))

(assert (= (and b!793103 res!537621) b!793104))

(assert (= (and b!793104 res!537626) b!793106))

(declare-fun m!733595 () Bool)

(assert (=> start!68270 m!733595))

(declare-fun m!733597 () Bool)

(assert (=> start!68270 m!733597))

(declare-fun m!733599 () Bool)

(assert (=> b!793101 m!733599))

(declare-fun m!733601 () Bool)

(assert (=> b!793103 m!733601))

(declare-fun m!733603 () Bool)

(assert (=> b!793104 m!733603))

(declare-fun m!733605 () Bool)

(assert (=> b!793107 m!733605))

(assert (=> b!793107 m!733605))

(declare-fun m!733607 () Bool)

(assert (=> b!793107 m!733607))

(declare-fun m!733609 () Bool)

(assert (=> b!793102 m!733609))

(declare-fun m!733611 () Bool)

(assert (=> b!793106 m!733611))

(push 1)

