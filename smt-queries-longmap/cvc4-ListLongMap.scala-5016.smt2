; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68610 () Bool)

(assert start!68610)

(declare-fun b!798350 () Bool)

(declare-fun e!442851 () Bool)

(declare-fun e!442849 () Bool)

(assert (=> b!798350 (= e!442851 e!442849)))

(declare-fun res!542869 () Bool)

(assert (=> b!798350 (=> (not res!542869) (not e!442849))))

(declare-datatypes ((SeekEntryResult!8371 0))(
  ( (MissingZero!8371 (index!35852 (_ BitVec 32))) (Found!8371 (index!35853 (_ BitVec 32))) (Intermediate!8371 (undefined!9183 Bool) (index!35854 (_ BitVec 32)) (x!66737 (_ BitVec 32))) (Undefined!8371) (MissingVacant!8371 (index!35855 (_ BitVec 32))) )
))
(declare-fun lt!356363 () SeekEntryResult!8371)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798350 (= res!542869 (or (= lt!356363 (MissingZero!8371 i!1163)) (= lt!356363 (MissingVacant!8371 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43400 0))(
  ( (array!43401 (arr!20780 (Array (_ BitVec 32) (_ BitVec 64))) (size!21201 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43400)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43400 (_ BitVec 32)) SeekEntryResult!8371)

(assert (=> b!798350 (= lt!356363 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798351 () Bool)

(declare-fun res!542873 () Bool)

(assert (=> b!798351 (=> (not res!542873) (not e!442851))))

(declare-fun arrayContainsKey!0 (array!43400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798351 (= res!542873 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798352 () Bool)

(declare-fun res!542874 () Bool)

(assert (=> b!798352 (=> (not res!542874) (not e!442851))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798352 (= res!542874 (and (= (size!21201 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21201 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21201 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798353 () Bool)

(declare-fun e!442850 () Bool)

(assert (=> b!798353 (= e!442850 (not true))))

(declare-fun lt!356362 () SeekEntryResult!8371)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798353 (= lt!356362 (Found!8371 index!1236))))

(declare-fun res!542879 () Bool)

(assert (=> start!68610 (=> (not res!542879) (not e!442851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68610 (= res!542879 (validMask!0 mask!3266))))

(assert (=> start!68610 e!442851))

(assert (=> start!68610 true))

(declare-fun array_inv!16576 (array!43400) Bool)

(assert (=> start!68610 (array_inv!16576 a!3170)))

(declare-fun b!798354 () Bool)

(declare-fun e!442852 () Bool)

(assert (=> b!798354 (= e!442852 e!442850)))

(declare-fun res!542872 () Bool)

(assert (=> b!798354 (=> (not res!542872) (not e!442850))))

(declare-fun lt!356365 () SeekEntryResult!8371)

(declare-fun lt!356366 () SeekEntryResult!8371)

(assert (=> b!798354 (= res!542872 (and (= lt!356366 lt!356365) (= lt!356365 (Found!8371 j!153)) (= (select (arr!20780 a!3170) index!1236) (select (arr!20780 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43400 (_ BitVec 32)) SeekEntryResult!8371)

(assert (=> b!798354 (= lt!356365 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20780 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798354 (= lt!356366 (seekEntryOrOpen!0 (select (arr!20780 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798355 () Bool)

(assert (=> b!798355 (= e!442849 e!442852)))

(declare-fun res!542870 () Bool)

(assert (=> b!798355 (=> (not res!542870) (not e!442852))))

(declare-fun lt!356361 () SeekEntryResult!8371)

(assert (=> b!798355 (= res!542870 (= lt!356361 lt!356362))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356364 () array!43400)

(declare-fun lt!356360 () (_ BitVec 64))

(assert (=> b!798355 (= lt!356362 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356360 lt!356364 mask!3266))))

(assert (=> b!798355 (= lt!356361 (seekEntryOrOpen!0 lt!356360 lt!356364 mask!3266))))

(assert (=> b!798355 (= lt!356360 (select (store (arr!20780 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798355 (= lt!356364 (array!43401 (store (arr!20780 a!3170) i!1163 k!2044) (size!21201 a!3170)))))

(declare-fun b!798356 () Bool)

(declare-fun res!542871 () Bool)

(assert (=> b!798356 (=> (not res!542871) (not e!442851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798356 (= res!542871 (validKeyInArray!0 (select (arr!20780 a!3170) j!153)))))

(declare-fun b!798357 () Bool)

(declare-fun res!542877 () Bool)

(assert (=> b!798357 (=> (not res!542877) (not e!442849))))

(assert (=> b!798357 (= res!542877 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21201 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20780 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21201 a!3170)) (= (select (arr!20780 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798358 () Bool)

(declare-fun res!542875 () Bool)

(assert (=> b!798358 (=> (not res!542875) (not e!442849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43400 (_ BitVec 32)) Bool)

(assert (=> b!798358 (= res!542875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798359 () Bool)

(declare-fun res!542878 () Bool)

(assert (=> b!798359 (=> (not res!542878) (not e!442849))))

(declare-datatypes ((List!14743 0))(
  ( (Nil!14740) (Cons!14739 (h!15868 (_ BitVec 64)) (t!21058 List!14743)) )
))
(declare-fun arrayNoDuplicates!0 (array!43400 (_ BitVec 32) List!14743) Bool)

(assert (=> b!798359 (= res!542878 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14740))))

(declare-fun b!798360 () Bool)

(declare-fun res!542876 () Bool)

(assert (=> b!798360 (=> (not res!542876) (not e!442851))))

(assert (=> b!798360 (= res!542876 (validKeyInArray!0 k!2044))))

(assert (= (and start!68610 res!542879) b!798352))

(assert (= (and b!798352 res!542874) b!798356))

(assert (= (and b!798356 res!542871) b!798360))

(assert (= (and b!798360 res!542876) b!798351))

(assert (= (and b!798351 res!542873) b!798350))

(assert (= (and b!798350 res!542869) b!798358))

(assert (= (and b!798358 res!542875) b!798359))

(assert (= (and b!798359 res!542878) b!798357))

(assert (= (and b!798357 res!542877) b!798355))

(assert (= (and b!798355 res!542870) b!798354))

(assert (= (and b!798354 res!542872) b!798353))

(declare-fun m!739247 () Bool)

(assert (=> b!798354 m!739247))

(declare-fun m!739249 () Bool)

(assert (=> b!798354 m!739249))

(assert (=> b!798354 m!739249))

(declare-fun m!739251 () Bool)

(assert (=> b!798354 m!739251))

(assert (=> b!798354 m!739249))

(declare-fun m!739253 () Bool)

(assert (=> b!798354 m!739253))

(declare-fun m!739255 () Bool)

(assert (=> b!798351 m!739255))

(declare-fun m!739257 () Bool)

(assert (=> start!68610 m!739257))

(declare-fun m!739259 () Bool)

(assert (=> start!68610 m!739259))

(declare-fun m!739261 () Bool)

(assert (=> b!798350 m!739261))

(declare-fun m!739263 () Bool)

(assert (=> b!798360 m!739263))

(declare-fun m!739265 () Bool)

(assert (=> b!798357 m!739265))

(declare-fun m!739267 () Bool)

(assert (=> b!798357 m!739267))

(declare-fun m!739269 () Bool)

(assert (=> b!798355 m!739269))

(declare-fun m!739271 () Bool)

(assert (=> b!798355 m!739271))

(declare-fun m!739273 () Bool)

(assert (=> b!798355 m!739273))

(declare-fun m!739275 () Bool)

(assert (=> b!798355 m!739275))

(declare-fun m!739277 () Bool)

(assert (=> b!798358 m!739277))

(assert (=> b!798356 m!739249))

(assert (=> b!798356 m!739249))

(declare-fun m!739279 () Bool)

(assert (=> b!798356 m!739279))

(declare-fun m!739281 () Bool)

(assert (=> b!798359 m!739281))

(push 1)

(assert (not b!798355))

(assert (not b!798354))

