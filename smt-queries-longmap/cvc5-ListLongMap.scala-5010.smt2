; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68570 () Bool)

(assert start!68570)

(declare-fun b!797663 () Bool)

(declare-fun e!442523 () Bool)

(declare-fun e!442522 () Bool)

(assert (=> b!797663 (= e!442523 e!442522)))

(declare-fun res!542182 () Bool)

(assert (=> b!797663 (=> (not res!542182) (not e!442522))))

(declare-datatypes ((array!43360 0))(
  ( (array!43361 (arr!20760 (Array (_ BitVec 32) (_ BitVec 64))) (size!21181 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43360)

(declare-datatypes ((SeekEntryResult!8351 0))(
  ( (MissingZero!8351 (index!35772 (_ BitVec 32))) (Found!8351 (index!35773 (_ BitVec 32))) (Intermediate!8351 (undefined!9163 Bool) (index!35774 (_ BitVec 32)) (x!66669 (_ BitVec 32))) (Undefined!8351) (MissingVacant!8351 (index!35775 (_ BitVec 32))) )
))
(declare-fun lt!355916 () SeekEntryResult!8351)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!355919 () SeekEntryResult!8351)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797663 (= res!542182 (and (= lt!355919 lt!355916) (= lt!355916 (Found!8351 j!153)) (= (select (arr!20760 a!3170) index!1236) (select (arr!20760 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43360 (_ BitVec 32)) SeekEntryResult!8351)

(assert (=> b!797663 (= lt!355916 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20760 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43360 (_ BitVec 32)) SeekEntryResult!8351)

(assert (=> b!797663 (= lt!355919 (seekEntryOrOpen!0 (select (arr!20760 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797664 () Bool)

(declare-fun e!442526 () Bool)

(declare-fun e!442524 () Bool)

(assert (=> b!797664 (= e!442526 e!442524)))

(declare-fun res!542187 () Bool)

(assert (=> b!797664 (=> (not res!542187) (not e!442524))))

(declare-fun lt!355913 () SeekEntryResult!8351)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797664 (= res!542187 (or (= lt!355913 (MissingZero!8351 i!1163)) (= lt!355913 (MissingVacant!8351 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!797664 (= lt!355913 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797665 () Bool)

(declare-fun res!542185 () Bool)

(assert (=> b!797665 (=> (not res!542185) (not e!442526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797665 (= res!542185 (validKeyInArray!0 (select (arr!20760 a!3170) j!153)))))

(declare-fun b!797666 () Bool)

(declare-fun res!542186 () Bool)

(assert (=> b!797666 (=> (not res!542186) (not e!442526))))

(declare-fun arrayContainsKey!0 (array!43360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797666 (= res!542186 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797668 () Bool)

(assert (=> b!797668 (= e!442522 (not true))))

(declare-fun lt!355914 () SeekEntryResult!8351)

(assert (=> b!797668 (= lt!355914 (Found!8351 index!1236))))

(declare-fun b!797669 () Bool)

(declare-fun res!542189 () Bool)

(assert (=> b!797669 (=> (not res!542189) (not e!442524))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797669 (= res!542189 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21181 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20760 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21181 a!3170)) (= (select (arr!20760 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797667 () Bool)

(declare-fun res!542184 () Bool)

(assert (=> b!797667 (=> (not res!542184) (not e!442524))))

(declare-datatypes ((List!14723 0))(
  ( (Nil!14720) (Cons!14719 (h!15848 (_ BitVec 64)) (t!21038 List!14723)) )
))
(declare-fun arrayNoDuplicates!0 (array!43360 (_ BitVec 32) List!14723) Bool)

(assert (=> b!797667 (= res!542184 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14720))))

(declare-fun res!542188 () Bool)

(assert (=> start!68570 (=> (not res!542188) (not e!442526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68570 (= res!542188 (validMask!0 mask!3266))))

(assert (=> start!68570 e!442526))

(assert (=> start!68570 true))

(declare-fun array_inv!16556 (array!43360) Bool)

(assert (=> start!68570 (array_inv!16556 a!3170)))

(declare-fun b!797670 () Bool)

(declare-fun res!542190 () Bool)

(assert (=> b!797670 (=> (not res!542190) (not e!442524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43360 (_ BitVec 32)) Bool)

(assert (=> b!797670 (= res!542190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797671 () Bool)

(assert (=> b!797671 (= e!442524 e!442523)))

(declare-fun res!542192 () Bool)

(assert (=> b!797671 (=> (not res!542192) (not e!442523))))

(declare-fun lt!355918 () SeekEntryResult!8351)

(assert (=> b!797671 (= res!542192 (= lt!355918 lt!355914))))

(declare-fun lt!355917 () array!43360)

(declare-fun lt!355915 () (_ BitVec 64))

(assert (=> b!797671 (= lt!355914 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355915 lt!355917 mask!3266))))

(assert (=> b!797671 (= lt!355918 (seekEntryOrOpen!0 lt!355915 lt!355917 mask!3266))))

(assert (=> b!797671 (= lt!355915 (select (store (arr!20760 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797671 (= lt!355917 (array!43361 (store (arr!20760 a!3170) i!1163 k!2044) (size!21181 a!3170)))))

(declare-fun b!797672 () Bool)

(declare-fun res!542191 () Bool)

(assert (=> b!797672 (=> (not res!542191) (not e!442526))))

(assert (=> b!797672 (= res!542191 (and (= (size!21181 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21181 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21181 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797673 () Bool)

(declare-fun res!542183 () Bool)

(assert (=> b!797673 (=> (not res!542183) (not e!442526))))

(assert (=> b!797673 (= res!542183 (validKeyInArray!0 k!2044))))

(assert (= (and start!68570 res!542188) b!797672))

(assert (= (and b!797672 res!542191) b!797665))

(assert (= (and b!797665 res!542185) b!797673))

(assert (= (and b!797673 res!542183) b!797666))

(assert (= (and b!797666 res!542186) b!797664))

(assert (= (and b!797664 res!542187) b!797670))

(assert (= (and b!797670 res!542190) b!797667))

(assert (= (and b!797667 res!542184) b!797669))

(assert (= (and b!797669 res!542189) b!797671))

(assert (= (and b!797671 res!542192) b!797663))

(assert (= (and b!797663 res!542182) b!797668))

(declare-fun m!738527 () Bool)

(assert (=> b!797666 m!738527))

(declare-fun m!738529 () Bool)

(assert (=> b!797663 m!738529))

(declare-fun m!738531 () Bool)

(assert (=> b!797663 m!738531))

(assert (=> b!797663 m!738531))

(declare-fun m!738533 () Bool)

(assert (=> b!797663 m!738533))

(assert (=> b!797663 m!738531))

(declare-fun m!738535 () Bool)

(assert (=> b!797663 m!738535))

(declare-fun m!738537 () Bool)

(assert (=> start!68570 m!738537))

(declare-fun m!738539 () Bool)

(assert (=> start!68570 m!738539))

(declare-fun m!738541 () Bool)

(assert (=> b!797670 m!738541))

(declare-fun m!738543 () Bool)

(assert (=> b!797669 m!738543))

(declare-fun m!738545 () Bool)

(assert (=> b!797669 m!738545))

(declare-fun m!738547 () Bool)

(assert (=> b!797667 m!738547))

(declare-fun m!738549 () Bool)

(assert (=> b!797671 m!738549))

(declare-fun m!738551 () Bool)

(assert (=> b!797671 m!738551))

(declare-fun m!738553 () Bool)

(assert (=> b!797671 m!738553))

(declare-fun m!738555 () Bool)

(assert (=> b!797671 m!738555))

(declare-fun m!738557 () Bool)

(assert (=> b!797664 m!738557))

(assert (=> b!797665 m!738531))

(assert (=> b!797665 m!738531))

(declare-fun m!738559 () Bool)

(assert (=> b!797665 m!738559))

(declare-fun m!738561 () Bool)

(assert (=> b!797673 m!738561))

(push 1)

