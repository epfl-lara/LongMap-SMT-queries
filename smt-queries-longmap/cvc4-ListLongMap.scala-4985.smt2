; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68424 () Bool)

(assert start!68424)

(declare-fun b!795255 () Bool)

(declare-fun res!539782 () Bool)

(declare-fun e!441429 () Bool)

(assert (=> b!795255 (=> (not res!539782) (not e!441429))))

(declare-datatypes ((array!43214 0))(
  ( (array!43215 (arr!20687 (Array (_ BitVec 32) (_ BitVec 64))) (size!21108 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43214)

(declare-datatypes ((List!14650 0))(
  ( (Nil!14647) (Cons!14646 (h!15775 (_ BitVec 64)) (t!20965 List!14650)) )
))
(declare-fun arrayNoDuplicates!0 (array!43214 (_ BitVec 32) List!14650) Bool)

(assert (=> b!795255 (= res!539782 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14647))))

(declare-fun res!539781 () Bool)

(declare-fun e!441428 () Bool)

(assert (=> start!68424 (=> (not res!539781) (not e!441428))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68424 (= res!539781 (validMask!0 mask!3266))))

(assert (=> start!68424 e!441428))

(assert (=> start!68424 true))

(declare-fun array_inv!16483 (array!43214) Bool)

(assert (=> start!68424 (array_inv!16483 a!3170)))

(declare-fun b!795256 () Bool)

(declare-fun res!539777 () Bool)

(assert (=> b!795256 (=> (not res!539777) (not e!441429))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795256 (= res!539777 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21108 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20687 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21108 a!3170)) (= (select (arr!20687 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795257 () Bool)

(declare-fun res!539779 () Bool)

(assert (=> b!795257 (=> (not res!539779) (not e!441428))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795257 (= res!539779 (and (= (size!21108 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21108 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21108 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795258 () Bool)

(declare-fun res!539774 () Bool)

(assert (=> b!795258 (=> (not res!539774) (not e!441428))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795258 (= res!539774 (validKeyInArray!0 k!2044))))

(declare-fun b!795259 () Bool)

(declare-fun res!539778 () Bool)

(assert (=> b!795259 (=> (not res!539778) (not e!441428))))

(declare-fun arrayContainsKey!0 (array!43214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795259 (= res!539778 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795260 () Bool)

(assert (=> b!795260 (= e!441428 e!441429)))

(declare-fun res!539776 () Bool)

(assert (=> b!795260 (=> (not res!539776) (not e!441429))))

(declare-datatypes ((SeekEntryResult!8278 0))(
  ( (MissingZero!8278 (index!35480 (_ BitVec 32))) (Found!8278 (index!35481 (_ BitVec 32))) (Intermediate!8278 (undefined!9090 Bool) (index!35482 (_ BitVec 32)) (x!66396 (_ BitVec 32))) (Undefined!8278) (MissingVacant!8278 (index!35483 (_ BitVec 32))) )
))
(declare-fun lt!354485 () SeekEntryResult!8278)

(assert (=> b!795260 (= res!539776 (or (= lt!354485 (MissingZero!8278 i!1163)) (= lt!354485 (MissingVacant!8278 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43214 (_ BitVec 32)) SeekEntryResult!8278)

(assert (=> b!795260 (= lt!354485 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795261 () Bool)

(declare-fun res!539775 () Bool)

(assert (=> b!795261 (=> (not res!539775) (not e!441429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43214 (_ BitVec 32)) Bool)

(assert (=> b!795261 (= res!539775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795262 () Bool)

(declare-fun res!539780 () Bool)

(assert (=> b!795262 (=> (not res!539780) (not e!441428))))

(assert (=> b!795262 (= res!539780 (validKeyInArray!0 (select (arr!20687 a!3170) j!153)))))

(declare-fun b!795263 () Bool)

(declare-fun e!441430 () Bool)

(assert (=> b!795263 (= e!441430 false)))

(declare-fun lt!354483 () SeekEntryResult!8278)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43214 (_ BitVec 32)) SeekEntryResult!8278)

(assert (=> b!795263 (= lt!354483 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20687 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354484 () SeekEntryResult!8278)

(assert (=> b!795263 (= lt!354484 (seekEntryOrOpen!0 (select (arr!20687 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795264 () Bool)

(assert (=> b!795264 (= e!441429 e!441430)))

(declare-fun res!539783 () Bool)

(assert (=> b!795264 (=> (not res!539783) (not e!441430))))

(declare-fun lt!354482 () (_ BitVec 64))

(declare-fun lt!354481 () array!43214)

(assert (=> b!795264 (= res!539783 (= (seekEntryOrOpen!0 lt!354482 lt!354481 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354482 lt!354481 mask!3266)))))

(assert (=> b!795264 (= lt!354482 (select (store (arr!20687 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795264 (= lt!354481 (array!43215 (store (arr!20687 a!3170) i!1163 k!2044) (size!21108 a!3170)))))

(assert (= (and start!68424 res!539781) b!795257))

(assert (= (and b!795257 res!539779) b!795262))

(assert (= (and b!795262 res!539780) b!795258))

(assert (= (and b!795258 res!539774) b!795259))

(assert (= (and b!795259 res!539778) b!795260))

(assert (= (and b!795260 res!539776) b!795261))

(assert (= (and b!795261 res!539775) b!795255))

(assert (= (and b!795255 res!539782) b!795256))

(assert (= (and b!795256 res!539777) b!795264))

(assert (= (and b!795264 res!539783) b!795263))

(declare-fun m!735865 () Bool)

(assert (=> b!795262 m!735865))

(assert (=> b!795262 m!735865))

(declare-fun m!735867 () Bool)

(assert (=> b!795262 m!735867))

(declare-fun m!735869 () Bool)

(assert (=> b!795256 m!735869))

(declare-fun m!735871 () Bool)

(assert (=> b!795256 m!735871))

(declare-fun m!735873 () Bool)

(assert (=> b!795259 m!735873))

(declare-fun m!735875 () Bool)

(assert (=> b!795255 m!735875))

(declare-fun m!735877 () Bool)

(assert (=> start!68424 m!735877))

(declare-fun m!735879 () Bool)

(assert (=> start!68424 m!735879))

(declare-fun m!735881 () Bool)

(assert (=> b!795260 m!735881))

(declare-fun m!735883 () Bool)

(assert (=> b!795264 m!735883))

(declare-fun m!735885 () Bool)

(assert (=> b!795264 m!735885))

(declare-fun m!735887 () Bool)

(assert (=> b!795264 m!735887))

(declare-fun m!735889 () Bool)

(assert (=> b!795264 m!735889))

(declare-fun m!735891 () Bool)

(assert (=> b!795261 m!735891))

(assert (=> b!795263 m!735865))

(assert (=> b!795263 m!735865))

(declare-fun m!735893 () Bool)

(assert (=> b!795263 m!735893))

(assert (=> b!795263 m!735865))

(declare-fun m!735895 () Bool)

(assert (=> b!795263 m!735895))

(declare-fun m!735897 () Bool)

(assert (=> b!795258 m!735897))

(push 1)

(assert (not start!68424))

(assert (not b!795259))

(assert (not b!795255))

