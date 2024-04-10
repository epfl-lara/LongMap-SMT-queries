; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68350 () Bool)

(assert start!68350)

(declare-fun res!538664 () Bool)

(declare-fun e!441013 () Bool)

(assert (=> start!68350 (=> (not res!538664) (not e!441013))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68350 (= res!538664 (validMask!0 mask!3266))))

(assert (=> start!68350 e!441013))

(assert (=> start!68350 true))

(declare-datatypes ((array!43140 0))(
  ( (array!43141 (arr!20650 (Array (_ BitVec 32) (_ BitVec 64))) (size!21071 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43140)

(declare-fun array_inv!16446 (array!43140) Bool)

(assert (=> start!68350 (array_inv!16446 a!3170)))

(declare-fun b!794145 () Bool)

(declare-fun e!441011 () Bool)

(declare-fun e!441014 () Bool)

(assert (=> b!794145 (= e!441011 e!441014)))

(declare-fun res!538670 () Bool)

(assert (=> b!794145 (=> (not res!538670) (not e!441014))))

(declare-fun lt!354008 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354007 () array!43140)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8241 0))(
  ( (MissingZero!8241 (index!35332 (_ BitVec 32))) (Found!8241 (index!35333 (_ BitVec 32))) (Intermediate!8241 (undefined!9053 Bool) (index!35334 (_ BitVec 32)) (x!66263 (_ BitVec 32))) (Undefined!8241) (MissingVacant!8241 (index!35335 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43140 (_ BitVec 32)) SeekEntryResult!8241)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43140 (_ BitVec 32)) SeekEntryResult!8241)

(assert (=> b!794145 (= res!538670 (= (seekEntryOrOpen!0 lt!354008 lt!354007 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354008 lt!354007 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794145 (= lt!354008 (select (store (arr!20650 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794145 (= lt!354007 (array!43141 (store (arr!20650 a!3170) i!1163 k0!2044) (size!21071 a!3170)))))

(declare-fun b!794146 () Bool)

(assert (=> b!794146 (= e!441014 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!794147 () Bool)

(assert (=> b!794147 (= e!441013 e!441011)))

(declare-fun res!538665 () Bool)

(assert (=> b!794147 (=> (not res!538665) (not e!441011))))

(declare-fun lt!354006 () SeekEntryResult!8241)

(assert (=> b!794147 (= res!538665 (or (= lt!354006 (MissingZero!8241 i!1163)) (= lt!354006 (MissingVacant!8241 i!1163))))))

(assert (=> b!794147 (= lt!354006 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794148 () Bool)

(declare-fun res!538672 () Bool)

(assert (=> b!794148 (=> (not res!538672) (not e!441011))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794148 (= res!538672 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21071 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20650 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21071 a!3170)) (= (select (arr!20650 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794149 () Bool)

(declare-fun res!538673 () Bool)

(assert (=> b!794149 (=> (not res!538673) (not e!441011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43140 (_ BitVec 32)) Bool)

(assert (=> b!794149 (= res!538673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794150 () Bool)

(declare-fun res!538668 () Bool)

(assert (=> b!794150 (=> (not res!538668) (not e!441013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794150 (= res!538668 (validKeyInArray!0 (select (arr!20650 a!3170) j!153)))))

(declare-fun b!794151 () Bool)

(declare-fun res!538671 () Bool)

(assert (=> b!794151 (=> (not res!538671) (not e!441013))))

(assert (=> b!794151 (= res!538671 (validKeyInArray!0 k0!2044))))

(declare-fun b!794152 () Bool)

(declare-fun res!538666 () Bool)

(assert (=> b!794152 (=> (not res!538666) (not e!441013))))

(declare-fun arrayContainsKey!0 (array!43140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794152 (= res!538666 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794153 () Bool)

(declare-fun res!538667 () Bool)

(assert (=> b!794153 (=> (not res!538667) (not e!441013))))

(assert (=> b!794153 (= res!538667 (and (= (size!21071 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21071 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21071 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794154 () Bool)

(declare-fun res!538669 () Bool)

(assert (=> b!794154 (=> (not res!538669) (not e!441011))))

(declare-datatypes ((List!14613 0))(
  ( (Nil!14610) (Cons!14609 (h!15738 (_ BitVec 64)) (t!20928 List!14613)) )
))
(declare-fun arrayNoDuplicates!0 (array!43140 (_ BitVec 32) List!14613) Bool)

(assert (=> b!794154 (= res!538669 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14610))))

(assert (= (and start!68350 res!538664) b!794153))

(assert (= (and b!794153 res!538667) b!794150))

(assert (= (and b!794150 res!538668) b!794151))

(assert (= (and b!794151 res!538671) b!794152))

(assert (= (and b!794152 res!538666) b!794147))

(assert (= (and b!794147 res!538665) b!794149))

(assert (= (and b!794149 res!538673) b!794154))

(assert (= (and b!794154 res!538669) b!794148))

(assert (= (and b!794148 res!538672) b!794145))

(assert (= (and b!794145 res!538670) b!794146))

(declare-fun m!734663 () Bool)

(assert (=> start!68350 m!734663))

(declare-fun m!734665 () Bool)

(assert (=> start!68350 m!734665))

(declare-fun m!734667 () Bool)

(assert (=> b!794150 m!734667))

(assert (=> b!794150 m!734667))

(declare-fun m!734669 () Bool)

(assert (=> b!794150 m!734669))

(declare-fun m!734671 () Bool)

(assert (=> b!794152 m!734671))

(declare-fun m!734673 () Bool)

(assert (=> b!794147 m!734673))

(declare-fun m!734675 () Bool)

(assert (=> b!794145 m!734675))

(declare-fun m!734677 () Bool)

(assert (=> b!794145 m!734677))

(declare-fun m!734679 () Bool)

(assert (=> b!794145 m!734679))

(declare-fun m!734681 () Bool)

(assert (=> b!794145 m!734681))

(declare-fun m!734683 () Bool)

(assert (=> b!794154 m!734683))

(declare-fun m!734685 () Bool)

(assert (=> b!794148 m!734685))

(declare-fun m!734687 () Bool)

(assert (=> b!794148 m!734687))

(declare-fun m!734689 () Bool)

(assert (=> b!794151 m!734689))

(declare-fun m!734691 () Bool)

(assert (=> b!794149 m!734691))

(check-sat (not start!68350) (not b!794154) (not b!794150) (not b!794149) (not b!794151) (not b!794145) (not b!794147) (not b!794152))
(check-sat)
