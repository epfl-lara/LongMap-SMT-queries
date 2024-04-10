; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68862 () Bool)

(assert start!68862)

(declare-fun b!802931 () Bool)

(declare-fun res!547455 () Bool)

(declare-fun e!444946 () Bool)

(assert (=> b!802931 (=> (not res!547455) (not e!444946))))

(declare-datatypes ((array!43652 0))(
  ( (array!43653 (arr!20906 (Array (_ BitVec 32) (_ BitVec 64))) (size!21327 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43652)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43652 (_ BitVec 32)) Bool)

(assert (=> b!802931 (= res!547455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802932 () Bool)

(declare-fun res!547453 () Bool)

(declare-fun e!444947 () Bool)

(assert (=> b!802932 (=> (not res!547453) (not e!444947))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802932 (= res!547453 (validKeyInArray!0 k!2044))))

(declare-fun b!802933 () Bool)

(declare-fun res!547451 () Bool)

(assert (=> b!802933 (=> (not res!547451) (not e!444946))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802933 (= res!547451 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21327 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20906 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21327 a!3170)) (= (select (arr!20906 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802934 () Bool)

(declare-fun res!547456 () Bool)

(assert (=> b!802934 (=> (not res!547456) (not e!444947))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802934 (= res!547456 (and (= (size!21327 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21327 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21327 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802935 () Bool)

(declare-fun res!547452 () Bool)

(assert (=> b!802935 (=> (not res!547452) (not e!444947))))

(assert (=> b!802935 (= res!547452 (validKeyInArray!0 (select (arr!20906 a!3170) j!153)))))

(declare-fun b!802936 () Bool)

(assert (=> b!802936 (= e!444947 e!444946)))

(declare-fun res!547454 () Bool)

(assert (=> b!802936 (=> (not res!547454) (not e!444946))))

(declare-datatypes ((SeekEntryResult!8497 0))(
  ( (MissingZero!8497 (index!36356 (_ BitVec 32))) (Found!8497 (index!36357 (_ BitVec 32))) (Intermediate!8497 (undefined!9309 Bool) (index!36358 (_ BitVec 32)) (x!67199 (_ BitVec 32))) (Undefined!8497) (MissingVacant!8497 (index!36359 (_ BitVec 32))) )
))
(declare-fun lt!359210 () SeekEntryResult!8497)

(assert (=> b!802936 (= res!547454 (or (= lt!359210 (MissingZero!8497 i!1163)) (= lt!359210 (MissingVacant!8497 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43652 (_ BitVec 32)) SeekEntryResult!8497)

(assert (=> b!802936 (= lt!359210 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802937 () Bool)

(declare-fun res!547450 () Bool)

(assert (=> b!802937 (=> (not res!547450) (not e!444947))))

(declare-fun arrayContainsKey!0 (array!43652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802937 (= res!547450 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!547458 () Bool)

(assert (=> start!68862 (=> (not res!547458) (not e!444947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68862 (= res!547458 (validMask!0 mask!3266))))

(assert (=> start!68862 e!444947))

(assert (=> start!68862 true))

(declare-fun array_inv!16702 (array!43652) Bool)

(assert (=> start!68862 (array_inv!16702 a!3170)))

(declare-fun b!802938 () Bool)

(declare-fun res!547460 () Bool)

(assert (=> b!802938 (=> (not res!547460) (not e!444946))))

(declare-datatypes ((List!14869 0))(
  ( (Nil!14866) (Cons!14865 (h!15994 (_ BitVec 64)) (t!21184 List!14869)) )
))
(declare-fun arrayNoDuplicates!0 (array!43652 (_ BitVec 32) List!14869) Bool)

(assert (=> b!802938 (= res!547460 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14866))))

(declare-fun b!802939 () Bool)

(declare-fun e!444950 () Bool)

(declare-fun e!444948 () Bool)

(assert (=> b!802939 (= e!444950 e!444948)))

(declare-fun res!547457 () Bool)

(assert (=> b!802939 (=> (not res!547457) (not e!444948))))

(declare-fun lt!359206 () SeekEntryResult!8497)

(declare-fun lt!359208 () SeekEntryResult!8497)

(assert (=> b!802939 (= res!547457 (and (= lt!359208 lt!359206) (= lt!359206 (Found!8497 j!153)) (not (= (select (arr!20906 a!3170) index!1236) (select (arr!20906 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43652 (_ BitVec 32)) SeekEntryResult!8497)

(assert (=> b!802939 (= lt!359206 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802939 (= lt!359208 (seekEntryOrOpen!0 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802940 () Bool)

(assert (=> b!802940 (= e!444948 (not true))))

(declare-fun lt!359207 () array!43652)

(declare-fun lt!359205 () (_ BitVec 64))

(declare-fun lt!359204 () (_ BitVec 32))

(assert (=> b!802940 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359204 vacantAfter!23 lt!359205 lt!359207 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359204 vacantBefore!23 (select (arr!20906 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27534 0))(
  ( (Unit!27535) )
))
(declare-fun lt!359209 () Unit!27534)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43652 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27534)

(assert (=> b!802940 (= lt!359209 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359204 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802940 (= lt!359204 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802941 () Bool)

(assert (=> b!802941 (= e!444946 e!444950)))

(declare-fun res!547459 () Bool)

(assert (=> b!802941 (=> (not res!547459) (not e!444950))))

(assert (=> b!802941 (= res!547459 (= (seekEntryOrOpen!0 lt!359205 lt!359207 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359205 lt!359207 mask!3266)))))

(assert (=> b!802941 (= lt!359205 (select (store (arr!20906 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802941 (= lt!359207 (array!43653 (store (arr!20906 a!3170) i!1163 k!2044) (size!21327 a!3170)))))

(assert (= (and start!68862 res!547458) b!802934))

(assert (= (and b!802934 res!547456) b!802935))

(assert (= (and b!802935 res!547452) b!802932))

(assert (= (and b!802932 res!547453) b!802937))

(assert (= (and b!802937 res!547450) b!802936))

(assert (= (and b!802936 res!547454) b!802931))

(assert (= (and b!802931 res!547455) b!802938))

(assert (= (and b!802938 res!547460) b!802933))

(assert (= (and b!802933 res!547451) b!802941))

(assert (= (and b!802941 res!547459) b!802939))

(assert (= (and b!802939 res!547457) b!802940))

(declare-fun m!744525 () Bool)

(assert (=> b!802937 m!744525))

(declare-fun m!744527 () Bool)

(assert (=> b!802941 m!744527))

(declare-fun m!744529 () Bool)

(assert (=> b!802941 m!744529))

(declare-fun m!744531 () Bool)

(assert (=> b!802941 m!744531))

(declare-fun m!744533 () Bool)

(assert (=> b!802941 m!744533))

(declare-fun m!744535 () Bool)

(assert (=> b!802938 m!744535))

(declare-fun m!744537 () Bool)

(assert (=> start!68862 m!744537))

(declare-fun m!744539 () Bool)

(assert (=> start!68862 m!744539))

(declare-fun m!744541 () Bool)

(assert (=> b!802939 m!744541))

(declare-fun m!744543 () Bool)

(assert (=> b!802939 m!744543))

(assert (=> b!802939 m!744543))

(declare-fun m!744545 () Bool)

(assert (=> b!802939 m!744545))

(assert (=> b!802939 m!744543))

(declare-fun m!744547 () Bool)

(assert (=> b!802939 m!744547))

(declare-fun m!744549 () Bool)

(assert (=> b!802936 m!744549))

(assert (=> b!802935 m!744543))

(assert (=> b!802935 m!744543))

(declare-fun m!744551 () Bool)

(assert (=> b!802935 m!744551))

(declare-fun m!744553 () Bool)

(assert (=> b!802932 m!744553))

(declare-fun m!744555 () Bool)

(assert (=> b!802933 m!744555))

(declare-fun m!744557 () Bool)

(assert (=> b!802933 m!744557))

(declare-fun m!744559 () Bool)

(assert (=> b!802931 m!744559))

(declare-fun m!744561 () Bool)

(assert (=> b!802940 m!744561))

(declare-fun m!744563 () Bool)

(assert (=> b!802940 m!744563))

(declare-fun m!744565 () Bool)

(assert (=> b!802940 m!744565))

(assert (=> b!802940 m!744543))

(declare-fun m!744567 () Bool)

(assert (=> b!802940 m!744567))

(assert (=> b!802940 m!744543))

(push 1)

(assert (not b!802940))

(assert (not b!802941))

(assert (not b!802932))

(assert (not b!802935))

(assert (not b!802938))

(assert 