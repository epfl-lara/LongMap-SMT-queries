; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68784 () Bool)

(assert start!68784)

(declare-fun b!801697 () Bool)

(declare-fun res!546359 () Bool)

(declare-fun e!444332 () Bool)

(assert (=> b!801697 (=> (not res!546359) (not e!444332))))

(declare-datatypes ((array!43591 0))(
  ( (array!43592 (arr!20876 (Array (_ BitVec 32) (_ BitVec 64))) (size!21297 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43591)

(declare-datatypes ((List!14878 0))(
  ( (Nil!14875) (Cons!14874 (h!16003 (_ BitVec 64)) (t!21184 List!14878)) )
))
(declare-fun arrayNoDuplicates!0 (array!43591 (_ BitVec 32) List!14878) Bool)

(assert (=> b!801697 (= res!546359 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14875))))

(declare-fun b!801698 () Bool)

(declare-fun res!546366 () Bool)

(assert (=> b!801698 (=> (not res!546366) (not e!444332))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801698 (= res!546366 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21297 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20876 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21297 a!3170)) (= (select (arr!20876 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801699 () Bool)

(declare-fun res!546358 () Bool)

(assert (=> b!801699 (=> (not res!546358) (not e!444332))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43591 (_ BitVec 32)) Bool)

(assert (=> b!801699 (= res!546358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801700 () Bool)

(declare-fun e!444334 () Bool)

(assert (=> b!801700 (= e!444334 e!444332)))

(declare-fun res!546361 () Bool)

(assert (=> b!801700 (=> (not res!546361) (not e!444332))))

(declare-datatypes ((SeekEntryResult!8464 0))(
  ( (MissingZero!8464 (index!36224 (_ BitVec 32))) (Found!8464 (index!36225 (_ BitVec 32))) (Intermediate!8464 (undefined!9276 Bool) (index!36226 (_ BitVec 32)) (x!67089 (_ BitVec 32))) (Undefined!8464) (MissingVacant!8464 (index!36227 (_ BitVec 32))) )
))
(declare-fun lt!358304 () SeekEntryResult!8464)

(assert (=> b!801700 (= res!546361 (or (= lt!358304 (MissingZero!8464 i!1163)) (= lt!358304 (MissingVacant!8464 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43591 (_ BitVec 32)) SeekEntryResult!8464)

(assert (=> b!801700 (= lt!358304 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801701 () Bool)

(declare-fun e!444331 () Bool)

(assert (=> b!801701 (= e!444331 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!358301 () (_ BitVec 32))

(declare-fun lt!358305 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358307 () array!43591)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43591 (_ BitVec 32)) SeekEntryResult!8464)

(assert (=> b!801701 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358301 vacantAfter!23 lt!358305 lt!358307 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358301 vacantBefore!23 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27442 0))(
  ( (Unit!27443) )
))
(declare-fun lt!358302 () Unit!27442)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43591 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27442)

(assert (=> b!801701 (= lt!358302 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358301 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801701 (= lt!358301 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801702 () Bool)

(declare-fun res!546362 () Bool)

(assert (=> b!801702 (=> (not res!546362) (not e!444334))))

(assert (=> b!801702 (= res!546362 (and (= (size!21297 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21297 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21297 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801703 () Bool)

(declare-fun e!444330 () Bool)

(assert (=> b!801703 (= e!444332 e!444330)))

(declare-fun res!546360 () Bool)

(assert (=> b!801703 (=> (not res!546360) (not e!444330))))

(assert (=> b!801703 (= res!546360 (= (seekEntryOrOpen!0 lt!358305 lt!358307 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358305 lt!358307 mask!3266)))))

(assert (=> b!801703 (= lt!358305 (select (store (arr!20876 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801703 (= lt!358307 (array!43592 (store (arr!20876 a!3170) i!1163 k0!2044) (size!21297 a!3170)))))

(declare-fun b!801704 () Bool)

(declare-fun res!546356 () Bool)

(assert (=> b!801704 (=> (not res!546356) (not e!444334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801704 (= res!546356 (validKeyInArray!0 k0!2044))))

(declare-fun b!801705 () Bool)

(declare-fun res!546364 () Bool)

(assert (=> b!801705 (=> (not res!546364) (not e!444334))))

(declare-fun arrayContainsKey!0 (array!43591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801705 (= res!546364 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801706 () Bool)

(assert (=> b!801706 (= e!444330 e!444331)))

(declare-fun res!546365 () Bool)

(assert (=> b!801706 (=> (not res!546365) (not e!444331))))

(declare-fun lt!358306 () SeekEntryResult!8464)

(declare-fun lt!358303 () SeekEntryResult!8464)

(assert (=> b!801706 (= res!546365 (and (= lt!358306 lt!358303) (= lt!358303 (Found!8464 j!153)) (not (= (select (arr!20876 a!3170) index!1236) (select (arr!20876 a!3170) j!153)))))))

(assert (=> b!801706 (= lt!358303 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801706 (= lt!358306 (seekEntryOrOpen!0 (select (arr!20876 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!546363 () Bool)

(assert (=> start!68784 (=> (not res!546363) (not e!444334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68784 (= res!546363 (validMask!0 mask!3266))))

(assert (=> start!68784 e!444334))

(assert (=> start!68784 true))

(declare-fun array_inv!16759 (array!43591) Bool)

(assert (=> start!68784 (array_inv!16759 a!3170)))

(declare-fun b!801707 () Bool)

(declare-fun res!546357 () Bool)

(assert (=> b!801707 (=> (not res!546357) (not e!444334))))

(assert (=> b!801707 (= res!546357 (validKeyInArray!0 (select (arr!20876 a!3170) j!153)))))

(assert (= (and start!68784 res!546363) b!801702))

(assert (= (and b!801702 res!546362) b!801707))

(assert (= (and b!801707 res!546357) b!801704))

(assert (= (and b!801704 res!546356) b!801705))

(assert (= (and b!801705 res!546364) b!801700))

(assert (= (and b!801700 res!546361) b!801699))

(assert (= (and b!801699 res!546358) b!801697))

(assert (= (and b!801697 res!546359) b!801698))

(assert (= (and b!801698 res!546366) b!801703))

(assert (= (and b!801703 res!546360) b!801706))

(assert (= (and b!801706 res!546365) b!801701))

(declare-fun m!742489 () Bool)

(assert (=> b!801704 m!742489))

(declare-fun m!742491 () Bool)

(assert (=> b!801706 m!742491))

(declare-fun m!742493 () Bool)

(assert (=> b!801706 m!742493))

(assert (=> b!801706 m!742493))

(declare-fun m!742495 () Bool)

(assert (=> b!801706 m!742495))

(assert (=> b!801706 m!742493))

(declare-fun m!742497 () Bool)

(assert (=> b!801706 m!742497))

(declare-fun m!742499 () Bool)

(assert (=> b!801700 m!742499))

(declare-fun m!742501 () Bool)

(assert (=> b!801697 m!742501))

(declare-fun m!742503 () Bool)

(assert (=> b!801703 m!742503))

(declare-fun m!742505 () Bool)

(assert (=> b!801703 m!742505))

(declare-fun m!742507 () Bool)

(assert (=> b!801703 m!742507))

(declare-fun m!742509 () Bool)

(assert (=> b!801703 m!742509))

(assert (=> b!801701 m!742493))

(assert (=> b!801701 m!742493))

(declare-fun m!742511 () Bool)

(assert (=> b!801701 m!742511))

(declare-fun m!742513 () Bool)

(assert (=> b!801701 m!742513))

(declare-fun m!742515 () Bool)

(assert (=> b!801701 m!742515))

(declare-fun m!742517 () Bool)

(assert (=> b!801701 m!742517))

(declare-fun m!742519 () Bool)

(assert (=> b!801698 m!742519))

(declare-fun m!742521 () Bool)

(assert (=> b!801698 m!742521))

(assert (=> b!801707 m!742493))

(assert (=> b!801707 m!742493))

(declare-fun m!742523 () Bool)

(assert (=> b!801707 m!742523))

(declare-fun m!742525 () Bool)

(assert (=> b!801705 m!742525))

(declare-fun m!742527 () Bool)

(assert (=> start!68784 m!742527))

(declare-fun m!742529 () Bool)

(assert (=> start!68784 m!742529))

(declare-fun m!742531 () Bool)

(assert (=> b!801699 m!742531))

(check-sat (not b!801700) (not b!801704) (not b!801706) (not b!801703) (not b!801699) (not b!801707) (not b!801705) (not b!801697) (not b!801701) (not start!68784))
(check-sat)
