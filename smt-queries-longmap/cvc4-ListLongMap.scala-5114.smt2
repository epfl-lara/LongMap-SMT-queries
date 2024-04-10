; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69402 () Bool)

(assert start!69402)

(declare-fun b!809213 () Bool)

(declare-fun e!447946 () Bool)

(declare-fun e!447947 () Bool)

(assert (=> b!809213 (= e!447946 e!447947)))

(declare-fun res!552947 () Bool)

(assert (=> b!809213 (=> (not res!552947) (not e!447947))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362623 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!44000 0))(
  ( (array!44001 (arr!21074 (Array (_ BitVec 32) (_ BitVec 64))) (size!21495 (_ BitVec 32))) )
))
(declare-fun lt!362622 () array!44000)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8665 0))(
  ( (MissingZero!8665 (index!37028 (_ BitVec 32))) (Found!8665 (index!37029 (_ BitVec 32))) (Intermediate!8665 (undefined!9477 Bool) (index!37030 (_ BitVec 32)) (x!67833 (_ BitVec 32))) (Undefined!8665) (MissingVacant!8665 (index!37031 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44000 (_ BitVec 32)) SeekEntryResult!8665)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44000 (_ BitVec 32)) SeekEntryResult!8665)

(assert (=> b!809213 (= res!552947 (= (seekEntryOrOpen!0 lt!362623 lt!362622 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362623 lt!362622 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun a!3170 () array!44000)

(assert (=> b!809213 (= lt!362623 (select (store (arr!21074 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809213 (= lt!362622 (array!44001 (store (arr!21074 a!3170) i!1163 k!2044) (size!21495 a!3170)))))

(declare-fun b!809214 () Bool)

(declare-fun res!552945 () Bool)

(declare-fun e!447945 () Bool)

(assert (=> b!809214 (=> (not res!552945) (not e!447945))))

(declare-fun arrayContainsKey!0 (array!44000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809214 (= res!552945 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!552948 () Bool)

(assert (=> start!69402 (=> (not res!552948) (not e!447945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69402 (= res!552948 (validMask!0 mask!3266))))

(assert (=> start!69402 e!447945))

(assert (=> start!69402 true))

(declare-fun array_inv!16870 (array!44000) Bool)

(assert (=> start!69402 (array_inv!16870 a!3170)))

(declare-fun b!809215 () Bool)

(declare-fun res!552941 () Bool)

(assert (=> b!809215 (=> (not res!552941) (not e!447945))))

(assert (=> b!809215 (= res!552941 (and (= (size!21495 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21495 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21495 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809216 () Bool)

(declare-fun res!552949 () Bool)

(assert (=> b!809216 (=> (not res!552949) (not e!447945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809216 (= res!552949 (validKeyInArray!0 (select (arr!21074 a!3170) j!153)))))

(declare-fun b!809217 () Bool)

(declare-fun res!552940 () Bool)

(assert (=> b!809217 (=> (not res!552940) (not e!447946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44000 (_ BitVec 32)) Bool)

(assert (=> b!809217 (= res!552940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809218 () Bool)

(declare-fun res!552944 () Bool)

(assert (=> b!809218 (=> (not res!552944) (not e!447946))))

(declare-datatypes ((List!15037 0))(
  ( (Nil!15034) (Cons!15033 (h!16162 (_ BitVec 64)) (t!21352 List!15037)) )
))
(declare-fun arrayNoDuplicates!0 (array!44000 (_ BitVec 32) List!15037) Bool)

(assert (=> b!809218 (= res!552944 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15034))))

(declare-fun b!809219 () Bool)

(declare-fun e!447943 () Bool)

(assert (=> b!809219 (= e!447943 false)))

(declare-fun lt!362625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809219 (= lt!362625 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809220 () Bool)

(assert (=> b!809220 (= e!447945 e!447946)))

(declare-fun res!552942 () Bool)

(assert (=> b!809220 (=> (not res!552942) (not e!447946))))

(declare-fun lt!362624 () SeekEntryResult!8665)

(assert (=> b!809220 (= res!552942 (or (= lt!362624 (MissingZero!8665 i!1163)) (= lt!362624 (MissingVacant!8665 i!1163))))))

(assert (=> b!809220 (= lt!362624 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809221 () Bool)

(declare-fun res!552946 () Bool)

(assert (=> b!809221 (=> (not res!552946) (not e!447946))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809221 (= res!552946 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21495 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21074 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21495 a!3170)) (= (select (arr!21074 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809222 () Bool)

(declare-fun res!552950 () Bool)

(assert (=> b!809222 (=> (not res!552950) (not e!447945))))

(assert (=> b!809222 (= res!552950 (validKeyInArray!0 k!2044))))

(declare-fun b!809223 () Bool)

(assert (=> b!809223 (= e!447947 e!447943)))

(declare-fun res!552943 () Bool)

(assert (=> b!809223 (=> (not res!552943) (not e!447943))))

(declare-fun lt!362626 () SeekEntryResult!8665)

(declare-fun lt!362627 () SeekEntryResult!8665)

(assert (=> b!809223 (= res!552943 (and (= lt!362626 lt!362627) (= lt!362627 (Found!8665 j!153)) (not (= (select (arr!21074 a!3170) index!1236) (select (arr!21074 a!3170) j!153)))))))

(assert (=> b!809223 (= lt!362627 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21074 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809223 (= lt!362626 (seekEntryOrOpen!0 (select (arr!21074 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69402 res!552948) b!809215))

(assert (= (and b!809215 res!552941) b!809216))

(assert (= (and b!809216 res!552949) b!809222))

(assert (= (and b!809222 res!552950) b!809214))

(assert (= (and b!809214 res!552945) b!809220))

(assert (= (and b!809220 res!552942) b!809217))

(assert (= (and b!809217 res!552940) b!809218))

(assert (= (and b!809218 res!552944) b!809221))

(assert (= (and b!809221 res!552946) b!809213))

(assert (= (and b!809213 res!552947) b!809223))

(assert (= (and b!809223 res!552943) b!809219))

(declare-fun m!751371 () Bool)

(assert (=> b!809217 m!751371))

(declare-fun m!751373 () Bool)

(assert (=> b!809220 m!751373))

(declare-fun m!751375 () Bool)

(assert (=> b!809222 m!751375))

(declare-fun m!751377 () Bool)

(assert (=> b!809219 m!751377))

(declare-fun m!751379 () Bool)

(assert (=> b!809216 m!751379))

(assert (=> b!809216 m!751379))

(declare-fun m!751381 () Bool)

(assert (=> b!809216 m!751381))

(declare-fun m!751383 () Bool)

(assert (=> b!809221 m!751383))

(declare-fun m!751385 () Bool)

(assert (=> b!809221 m!751385))

(declare-fun m!751387 () Bool)

(assert (=> b!809214 m!751387))

(declare-fun m!751389 () Bool)

(assert (=> b!809218 m!751389))

(declare-fun m!751391 () Bool)

(assert (=> b!809213 m!751391))

(declare-fun m!751393 () Bool)

(assert (=> b!809213 m!751393))

(declare-fun m!751395 () Bool)

(assert (=> b!809213 m!751395))

(declare-fun m!751397 () Bool)

(assert (=> b!809213 m!751397))

(declare-fun m!751399 () Bool)

(assert (=> start!69402 m!751399))

(declare-fun m!751401 () Bool)

(assert (=> start!69402 m!751401))

(declare-fun m!751403 () Bool)

(assert (=> b!809223 m!751403))

(assert (=> b!809223 m!751379))

(assert (=> b!809223 m!751379))

(declare-fun m!751405 () Bool)

(assert (=> b!809223 m!751405))

(assert (=> b!809223 m!751379))

(declare-fun m!751407 () Bool)

(assert (=> b!809223 m!751407))

(push 1)

(assert (not start!69402))

(assert (not b!809214))

(assert (not b!809217))

(assert (not b!809218))

(assert (not b!809213))

