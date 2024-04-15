; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68874 () Bool)

(assert start!68874)

(declare-fun b!803254 () Bool)

(declare-fun res!547920 () Bool)

(declare-fun e!445079 () Bool)

(assert (=> b!803254 (=> (not res!547920) (not e!445079))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43681 0))(
  ( (array!43682 (arr!20921 (Array (_ BitVec 32) (_ BitVec 64))) (size!21342 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43681)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803254 (= res!547920 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21342 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20921 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21342 a!3170)) (= (select (arr!20921 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803255 () Bool)

(declare-fun res!547922 () Bool)

(assert (=> b!803255 (=> (not res!547922) (not e!445079))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43681 (_ BitVec 32)) Bool)

(assert (=> b!803255 (= res!547922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803256 () Bool)

(declare-fun res!547921 () Bool)

(declare-fun e!445078 () Bool)

(assert (=> b!803256 (=> (not res!547921) (not e!445078))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803256 (= res!547921 (validKeyInArray!0 k0!2044))))

(declare-fun b!803257 () Bool)

(assert (=> b!803257 (= e!445078 e!445079)))

(declare-fun res!547923 () Bool)

(assert (=> b!803257 (=> (not res!547923) (not e!445079))))

(declare-datatypes ((SeekEntryResult!8509 0))(
  ( (MissingZero!8509 (index!36404 (_ BitVec 32))) (Found!8509 (index!36405 (_ BitVec 32))) (Intermediate!8509 (undefined!9321 Bool) (index!36406 (_ BitVec 32)) (x!67254 (_ BitVec 32))) (Undefined!8509) (MissingVacant!8509 (index!36407 (_ BitVec 32))) )
))
(declare-fun lt!359410 () SeekEntryResult!8509)

(assert (=> b!803257 (= res!547923 (or (= lt!359410 (MissingZero!8509 i!1163)) (= lt!359410 (MissingVacant!8509 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43681 (_ BitVec 32)) SeekEntryResult!8509)

(assert (=> b!803257 (= lt!359410 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803258 () Bool)

(declare-fun e!445081 () Bool)

(declare-fun e!445080 () Bool)

(assert (=> b!803258 (= e!445081 e!445080)))

(declare-fun res!547919 () Bool)

(assert (=> b!803258 (=> (not res!547919) (not e!445080))))

(declare-fun lt!359409 () SeekEntryResult!8509)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359408 () SeekEntryResult!8509)

(assert (=> b!803258 (= res!547919 (and (= lt!359409 lt!359408) (= lt!359408 (Found!8509 j!153)) (not (= (select (arr!20921 a!3170) index!1236) (select (arr!20921 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43681 (_ BitVec 32)) SeekEntryResult!8509)

(assert (=> b!803258 (= lt!359408 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803258 (= lt!359409 (seekEntryOrOpen!0 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!547914 () Bool)

(assert (=> start!68874 (=> (not res!547914) (not e!445078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68874 (= res!547914 (validMask!0 mask!3266))))

(assert (=> start!68874 e!445078))

(assert (=> start!68874 true))

(declare-fun array_inv!16804 (array!43681) Bool)

(assert (=> start!68874 (array_inv!16804 a!3170)))

(declare-fun b!803259 () Bool)

(declare-fun res!547913 () Bool)

(assert (=> b!803259 (=> (not res!547913) (not e!445078))))

(assert (=> b!803259 (= res!547913 (validKeyInArray!0 (select (arr!20921 a!3170) j!153)))))

(declare-fun b!803260 () Bool)

(assert (=> b!803260 (= e!445079 e!445081)))

(declare-fun res!547916 () Bool)

(assert (=> b!803260 (=> (not res!547916) (not e!445081))))

(declare-fun lt!359411 () (_ BitVec 64))

(declare-fun lt!359412 () array!43681)

(assert (=> b!803260 (= res!547916 (= (seekEntryOrOpen!0 lt!359411 lt!359412 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359411 lt!359412 mask!3266)))))

(assert (=> b!803260 (= lt!359411 (select (store (arr!20921 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803260 (= lt!359412 (array!43682 (store (arr!20921 a!3170) i!1163 k0!2044) (size!21342 a!3170)))))

(declare-fun b!803261 () Bool)

(declare-fun res!547918 () Bool)

(assert (=> b!803261 (=> (not res!547918) (not e!445078))))

(declare-fun arrayContainsKey!0 (array!43681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803261 (= res!547918 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803262 () Bool)

(declare-fun res!547917 () Bool)

(assert (=> b!803262 (=> (not res!547917) (not e!445079))))

(declare-datatypes ((List!14923 0))(
  ( (Nil!14920) (Cons!14919 (h!16048 (_ BitVec 64)) (t!21229 List!14923)) )
))
(declare-fun arrayNoDuplicates!0 (array!43681 (_ BitVec 32) List!14923) Bool)

(assert (=> b!803262 (= res!547917 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14920))))

(declare-fun b!803263 () Bool)

(declare-fun res!547915 () Bool)

(assert (=> b!803263 (=> (not res!547915) (not e!445078))))

(assert (=> b!803263 (= res!547915 (and (= (size!21342 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21342 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21342 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803264 () Bool)

(assert (=> b!803264 (= e!445080 (not true))))

(declare-fun lt!359414 () (_ BitVec 32))

(assert (=> b!803264 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359414 vacantAfter!23 lt!359411 lt!359412 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359414 vacantBefore!23 (select (arr!20921 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27532 0))(
  ( (Unit!27533) )
))
(declare-fun lt!359413 () Unit!27532)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27532)

(assert (=> b!803264 (= lt!359413 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359414 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803264 (= lt!359414 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68874 res!547914) b!803263))

(assert (= (and b!803263 res!547915) b!803259))

(assert (= (and b!803259 res!547913) b!803256))

(assert (= (and b!803256 res!547921) b!803261))

(assert (= (and b!803261 res!547918) b!803257))

(assert (= (and b!803257 res!547923) b!803255))

(assert (= (and b!803255 res!547922) b!803262))

(assert (= (and b!803262 res!547917) b!803254))

(assert (= (and b!803254 res!547920) b!803260))

(assert (= (and b!803260 res!547916) b!803258))

(assert (= (and b!803258 res!547919) b!803264))

(declare-fun m!744505 () Bool)

(assert (=> b!803256 m!744505))

(declare-fun m!744507 () Bool)

(assert (=> b!803259 m!744507))

(assert (=> b!803259 m!744507))

(declare-fun m!744509 () Bool)

(assert (=> b!803259 m!744509))

(declare-fun m!744511 () Bool)

(assert (=> b!803258 m!744511))

(assert (=> b!803258 m!744507))

(assert (=> b!803258 m!744507))

(declare-fun m!744513 () Bool)

(assert (=> b!803258 m!744513))

(assert (=> b!803258 m!744507))

(declare-fun m!744515 () Bool)

(assert (=> b!803258 m!744515))

(declare-fun m!744517 () Bool)

(assert (=> b!803254 m!744517))

(declare-fun m!744519 () Bool)

(assert (=> b!803254 m!744519))

(declare-fun m!744521 () Bool)

(assert (=> b!803255 m!744521))

(declare-fun m!744523 () Bool)

(assert (=> b!803260 m!744523))

(declare-fun m!744525 () Bool)

(assert (=> b!803260 m!744525))

(declare-fun m!744527 () Bool)

(assert (=> b!803260 m!744527))

(declare-fun m!744529 () Bool)

(assert (=> b!803260 m!744529))

(declare-fun m!744531 () Bool)

(assert (=> start!68874 m!744531))

(declare-fun m!744533 () Bool)

(assert (=> start!68874 m!744533))

(declare-fun m!744535 () Bool)

(assert (=> b!803261 m!744535))

(declare-fun m!744537 () Bool)

(assert (=> b!803262 m!744537))

(declare-fun m!744539 () Bool)

(assert (=> b!803257 m!744539))

(assert (=> b!803264 m!744507))

(declare-fun m!744541 () Bool)

(assert (=> b!803264 m!744541))

(declare-fun m!744543 () Bool)

(assert (=> b!803264 m!744543))

(assert (=> b!803264 m!744507))

(declare-fun m!744545 () Bool)

(assert (=> b!803264 m!744545))

(declare-fun m!744547 () Bool)

(assert (=> b!803264 m!744547))

(check-sat (not b!803264) (not b!803260) (not b!803258) (not b!803256) (not b!803255) (not b!803262) (not start!68874) (not b!803259) (not b!803257) (not b!803261))
(check-sat)
