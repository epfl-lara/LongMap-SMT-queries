; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68484 () Bool)

(assert start!68484)

(declare-fun b!796261 () Bool)

(declare-fun res!540924 () Bool)

(declare-fun e!441814 () Bool)

(assert (=> b!796261 (=> (not res!540924) (not e!441814))))

(declare-datatypes ((array!43291 0))(
  ( (array!43292 (arr!20726 (Array (_ BitVec 32) (_ BitVec 64))) (size!21147 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43291)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796261 (= res!540924 (validKeyInArray!0 (select (arr!20726 a!3170) j!153)))))

(declare-fun res!540928 () Bool)

(assert (=> start!68484 (=> (not res!540928) (not e!441814))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68484 (= res!540928 (validMask!0 mask!3266))))

(assert (=> start!68484 e!441814))

(assert (=> start!68484 true))

(declare-fun array_inv!16609 (array!43291) Bool)

(assert (=> start!68484 (array_inv!16609 a!3170)))

(declare-fun b!796262 () Bool)

(declare-fun res!540925 () Bool)

(assert (=> b!796262 (=> (not res!540925) (not e!441814))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796262 (= res!540925 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796263 () Bool)

(declare-fun e!441813 () Bool)

(assert (=> b!796263 (= e!441814 e!441813)))

(declare-fun res!540922 () Bool)

(assert (=> b!796263 (=> (not res!540922) (not e!441813))))

(declare-datatypes ((SeekEntryResult!8314 0))(
  ( (MissingZero!8314 (index!35624 (_ BitVec 32))) (Found!8314 (index!35625 (_ BitVec 32))) (Intermediate!8314 (undefined!9126 Bool) (index!35626 (_ BitVec 32)) (x!66539 (_ BitVec 32))) (Undefined!8314) (MissingVacant!8314 (index!35627 (_ BitVec 32))) )
))
(declare-fun lt!354936 () SeekEntryResult!8314)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796263 (= res!540922 (or (= lt!354936 (MissingZero!8314 i!1163)) (= lt!354936 (MissingVacant!8314 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43291 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!796263 (= lt!354936 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796264 () Bool)

(declare-fun res!540927 () Bool)

(assert (=> b!796264 (=> (not res!540927) (not e!441813))))

(declare-datatypes ((List!14728 0))(
  ( (Nil!14725) (Cons!14724 (h!15853 (_ BitVec 64)) (t!21034 List!14728)) )
))
(declare-fun arrayNoDuplicates!0 (array!43291 (_ BitVec 32) List!14728) Bool)

(assert (=> b!796264 (= res!540927 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14725))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun b!796265 () Bool)

(declare-fun e!441810 () Bool)

(assert (=> b!796265 (= e!441810 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!354939 () SeekEntryResult!8314)

(assert (=> b!796265 (= lt!354939 (Found!8314 index!1236))))

(declare-fun b!796266 () Bool)

(declare-fun res!540921 () Bool)

(assert (=> b!796266 (=> (not res!540921) (not e!441814))))

(assert (=> b!796266 (= res!540921 (and (= (size!21147 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21147 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21147 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796267 () Bool)

(declare-fun e!441811 () Bool)

(assert (=> b!796267 (= e!441813 e!441811)))

(declare-fun res!540926 () Bool)

(assert (=> b!796267 (=> (not res!540926) (not e!441811))))

(declare-fun lt!354937 () SeekEntryResult!8314)

(assert (=> b!796267 (= res!540926 (= lt!354937 lt!354939))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354935 () (_ BitVec 64))

(declare-fun lt!354940 () array!43291)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43291 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!796267 (= lt!354939 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354935 lt!354940 mask!3266))))

(assert (=> b!796267 (= lt!354937 (seekEntryOrOpen!0 lt!354935 lt!354940 mask!3266))))

(assert (=> b!796267 (= lt!354935 (select (store (arr!20726 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796267 (= lt!354940 (array!43292 (store (arr!20726 a!3170) i!1163 k0!2044) (size!21147 a!3170)))))

(declare-fun b!796268 () Bool)

(declare-fun res!540923 () Bool)

(assert (=> b!796268 (=> (not res!540923) (not e!441814))))

(assert (=> b!796268 (= res!540923 (validKeyInArray!0 k0!2044))))

(declare-fun b!796269 () Bool)

(assert (=> b!796269 (= e!441811 e!441810)))

(declare-fun res!540930 () Bool)

(assert (=> b!796269 (=> (not res!540930) (not e!441810))))

(declare-fun lt!354938 () SeekEntryResult!8314)

(declare-fun lt!354941 () SeekEntryResult!8314)

(assert (=> b!796269 (= res!540930 (and (= lt!354938 lt!354941) (= lt!354941 (Found!8314 j!153)) (= (select (arr!20726 a!3170) index!1236) (select (arr!20726 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796269 (= lt!354941 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20726 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796269 (= lt!354938 (seekEntryOrOpen!0 (select (arr!20726 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796270 () Bool)

(declare-fun res!540929 () Bool)

(assert (=> b!796270 (=> (not res!540929) (not e!441813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43291 (_ BitVec 32)) Bool)

(assert (=> b!796270 (= res!540929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796271 () Bool)

(declare-fun res!540920 () Bool)

(assert (=> b!796271 (=> (not res!540920) (not e!441813))))

(assert (=> b!796271 (= res!540920 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21147 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20726 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21147 a!3170)) (= (select (arr!20726 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68484 res!540928) b!796266))

(assert (= (and b!796266 res!540921) b!796261))

(assert (= (and b!796261 res!540924) b!796268))

(assert (= (and b!796268 res!540923) b!796262))

(assert (= (and b!796262 res!540925) b!796263))

(assert (= (and b!796263 res!540922) b!796270))

(assert (= (and b!796270 res!540929) b!796264))

(assert (= (and b!796264 res!540927) b!796271))

(assert (= (and b!796271 res!540920) b!796267))

(assert (= (and b!796267 res!540926) b!796269))

(assert (= (and b!796269 res!540930) b!796265))

(declare-fun m!736561 () Bool)

(assert (=> b!796268 m!736561))

(declare-fun m!736563 () Bool)

(assert (=> b!796261 m!736563))

(assert (=> b!796261 m!736563))

(declare-fun m!736565 () Bool)

(assert (=> b!796261 m!736565))

(declare-fun m!736567 () Bool)

(assert (=> b!796262 m!736567))

(declare-fun m!736569 () Bool)

(assert (=> b!796264 m!736569))

(declare-fun m!736571 () Bool)

(assert (=> b!796263 m!736571))

(declare-fun m!736573 () Bool)

(assert (=> b!796267 m!736573))

(declare-fun m!736575 () Bool)

(assert (=> b!796267 m!736575))

(declare-fun m!736577 () Bool)

(assert (=> b!796267 m!736577))

(declare-fun m!736579 () Bool)

(assert (=> b!796267 m!736579))

(declare-fun m!736581 () Bool)

(assert (=> b!796270 m!736581))

(declare-fun m!736583 () Bool)

(assert (=> start!68484 m!736583))

(declare-fun m!736585 () Bool)

(assert (=> start!68484 m!736585))

(declare-fun m!736587 () Bool)

(assert (=> b!796269 m!736587))

(assert (=> b!796269 m!736563))

(assert (=> b!796269 m!736563))

(declare-fun m!736589 () Bool)

(assert (=> b!796269 m!736589))

(assert (=> b!796269 m!736563))

(declare-fun m!736591 () Bool)

(assert (=> b!796269 m!736591))

(declare-fun m!736593 () Bool)

(assert (=> b!796271 m!736593))

(declare-fun m!736595 () Bool)

(assert (=> b!796271 m!736595))

(check-sat (not b!796269) (not start!68484) (not b!796267) (not b!796261) (not b!796262) (not b!796264) (not b!796263) (not b!796268) (not b!796270))
(check-sat)
