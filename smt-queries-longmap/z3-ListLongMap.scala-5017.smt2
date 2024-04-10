; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68614 () Bool)

(assert start!68614)

(declare-fun res!542940 () Bool)

(declare-fun e!442882 () Bool)

(assert (=> start!68614 (=> (not res!542940) (not e!442882))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68614 (= res!542940 (validMask!0 mask!3266))))

(assert (=> start!68614 e!442882))

(assert (=> start!68614 true))

(declare-datatypes ((array!43404 0))(
  ( (array!43405 (arr!20782 (Array (_ BitVec 32) (_ BitVec 64))) (size!21203 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43404)

(declare-fun array_inv!16578 (array!43404) Bool)

(assert (=> start!68614 (array_inv!16578 a!3170)))

(declare-fun b!798416 () Bool)

(declare-fun e!442881 () Bool)

(assert (=> b!798416 (= e!442882 e!442881)))

(declare-fun res!542942 () Bool)

(assert (=> b!798416 (=> (not res!542942) (not e!442881))))

(declare-datatypes ((SeekEntryResult!8373 0))(
  ( (MissingZero!8373 (index!35860 (_ BitVec 32))) (Found!8373 (index!35861 (_ BitVec 32))) (Intermediate!8373 (undefined!9185 Bool) (index!35862 (_ BitVec 32)) (x!66747 (_ BitVec 32))) (Undefined!8373) (MissingVacant!8373 (index!35863 (_ BitVec 32))) )
))
(declare-fun lt!356407 () SeekEntryResult!8373)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798416 (= res!542942 (or (= lt!356407 (MissingZero!8373 i!1163)) (= lt!356407 (MissingVacant!8373 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43404 (_ BitVec 32)) SeekEntryResult!8373)

(assert (=> b!798416 (= lt!356407 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798417 () Bool)

(declare-fun res!542943 () Bool)

(assert (=> b!798417 (=> (not res!542943) (not e!442882))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798417 (= res!542943 (and (= (size!21203 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21203 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21203 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798418 () Bool)

(declare-fun res!542936 () Bool)

(assert (=> b!798418 (=> (not res!542936) (not e!442882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798418 (= res!542936 (validKeyInArray!0 (select (arr!20782 a!3170) j!153)))))

(declare-fun b!798419 () Bool)

(declare-fun e!442883 () Bool)

(assert (=> b!798419 (= e!442883 (not true))))

(declare-fun lt!356406 () SeekEntryResult!8373)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798419 (= lt!356406 (Found!8373 index!1236))))

(declare-fun b!798420 () Bool)

(declare-fun e!442879 () Bool)

(assert (=> b!798420 (= e!442881 e!442879)))

(declare-fun res!542935 () Bool)

(assert (=> b!798420 (=> (not res!542935) (not e!442879))))

(declare-fun lt!356402 () SeekEntryResult!8373)

(assert (=> b!798420 (= res!542935 (= lt!356402 lt!356406))))

(declare-fun lt!356405 () (_ BitVec 64))

(declare-fun lt!356403 () array!43404)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43404 (_ BitVec 32)) SeekEntryResult!8373)

(assert (=> b!798420 (= lt!356406 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356405 lt!356403 mask!3266))))

(assert (=> b!798420 (= lt!356402 (seekEntryOrOpen!0 lt!356405 lt!356403 mask!3266))))

(assert (=> b!798420 (= lt!356405 (select (store (arr!20782 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798420 (= lt!356403 (array!43405 (store (arr!20782 a!3170) i!1163 k0!2044) (size!21203 a!3170)))))

(declare-fun b!798421 () Bool)

(declare-fun res!542944 () Bool)

(assert (=> b!798421 (=> (not res!542944) (not e!442882))))

(assert (=> b!798421 (= res!542944 (validKeyInArray!0 k0!2044))))

(declare-fun b!798422 () Bool)

(declare-fun res!542941 () Bool)

(assert (=> b!798422 (=> (not res!542941) (not e!442882))))

(declare-fun arrayContainsKey!0 (array!43404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798422 (= res!542941 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798423 () Bool)

(declare-fun res!542939 () Bool)

(assert (=> b!798423 (=> (not res!542939) (not e!442881))))

(declare-datatypes ((List!14745 0))(
  ( (Nil!14742) (Cons!14741 (h!15870 (_ BitVec 64)) (t!21060 List!14745)) )
))
(declare-fun arrayNoDuplicates!0 (array!43404 (_ BitVec 32) List!14745) Bool)

(assert (=> b!798423 (= res!542939 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14742))))

(declare-fun b!798424 () Bool)

(declare-fun res!542945 () Bool)

(assert (=> b!798424 (=> (not res!542945) (not e!442881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43404 (_ BitVec 32)) Bool)

(assert (=> b!798424 (= res!542945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798425 () Bool)

(declare-fun res!542938 () Bool)

(assert (=> b!798425 (=> (not res!542938) (not e!442881))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798425 (= res!542938 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21203 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20782 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21203 a!3170)) (= (select (arr!20782 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798426 () Bool)

(assert (=> b!798426 (= e!442879 e!442883)))

(declare-fun res!542937 () Bool)

(assert (=> b!798426 (=> (not res!542937) (not e!442883))))

(declare-fun lt!356408 () SeekEntryResult!8373)

(declare-fun lt!356404 () SeekEntryResult!8373)

(assert (=> b!798426 (= res!542937 (and (= lt!356408 lt!356404) (= lt!356404 (Found!8373 j!153)) (= (select (arr!20782 a!3170) index!1236) (select (arr!20782 a!3170) j!153))))))

(assert (=> b!798426 (= lt!356404 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20782 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798426 (= lt!356408 (seekEntryOrOpen!0 (select (arr!20782 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68614 res!542940) b!798417))

(assert (= (and b!798417 res!542943) b!798418))

(assert (= (and b!798418 res!542936) b!798421))

(assert (= (and b!798421 res!542944) b!798422))

(assert (= (and b!798422 res!542941) b!798416))

(assert (= (and b!798416 res!542942) b!798424))

(assert (= (and b!798424 res!542945) b!798423))

(assert (= (and b!798423 res!542939) b!798425))

(assert (= (and b!798425 res!542938) b!798420))

(assert (= (and b!798420 res!542935) b!798426))

(assert (= (and b!798426 res!542937) b!798419))

(declare-fun m!739319 () Bool)

(assert (=> b!798418 m!739319))

(assert (=> b!798418 m!739319))

(declare-fun m!739321 () Bool)

(assert (=> b!798418 m!739321))

(declare-fun m!739323 () Bool)

(assert (=> b!798420 m!739323))

(declare-fun m!739325 () Bool)

(assert (=> b!798420 m!739325))

(declare-fun m!739327 () Bool)

(assert (=> b!798420 m!739327))

(declare-fun m!739329 () Bool)

(assert (=> b!798420 m!739329))

(declare-fun m!739331 () Bool)

(assert (=> b!798421 m!739331))

(declare-fun m!739333 () Bool)

(assert (=> start!68614 m!739333))

(declare-fun m!739335 () Bool)

(assert (=> start!68614 m!739335))

(declare-fun m!739337 () Bool)

(assert (=> b!798423 m!739337))

(declare-fun m!739339 () Bool)

(assert (=> b!798425 m!739339))

(declare-fun m!739341 () Bool)

(assert (=> b!798425 m!739341))

(declare-fun m!739343 () Bool)

(assert (=> b!798422 m!739343))

(declare-fun m!739345 () Bool)

(assert (=> b!798424 m!739345))

(declare-fun m!739347 () Bool)

(assert (=> b!798416 m!739347))

(declare-fun m!739349 () Bool)

(assert (=> b!798426 m!739349))

(assert (=> b!798426 m!739319))

(assert (=> b!798426 m!739319))

(declare-fun m!739351 () Bool)

(assert (=> b!798426 m!739351))

(assert (=> b!798426 m!739319))

(declare-fun m!739353 () Bool)

(assert (=> b!798426 m!739353))

(check-sat (not b!798416) (not b!798423) (not b!798424) (not b!798420) (not b!798422) (not b!798418) (not b!798426) (not b!798421) (not start!68614))
(check-sat)
