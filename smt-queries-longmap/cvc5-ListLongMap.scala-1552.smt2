; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29386 () Bool)

(assert start!29386)

(declare-fun b!297490 () Bool)

(declare-fun e!188000 () Bool)

(declare-fun e!187999 () Bool)

(assert (=> b!297490 (= e!188000 e!187999)))

(declare-fun res!156869 () Bool)

(assert (=> b!297490 (=> (not res!156869) (not e!187999))))

(declare-fun lt!147839 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2282 0))(
  ( (MissingZero!2282 (index!11298 (_ BitVec 32))) (Found!2282 (index!11299 (_ BitVec 32))) (Intermediate!2282 (undefined!3094 Bool) (index!11300 (_ BitVec 32)) (x!29520 (_ BitVec 32))) (Undefined!2282) (MissingVacant!2282 (index!11301 (_ BitVec 32))) )
))
(declare-fun lt!147835 () SeekEntryResult!2282)

(assert (=> b!297490 (= res!156869 (or lt!147839 (= lt!147835 (MissingVacant!2282 i!1256))))))

(assert (=> b!297490 (= lt!147839 (= lt!147835 (MissingZero!2282 i!1256)))))

(declare-datatypes ((array!15054 0))(
  ( (array!15055 (arr!7133 (Array (_ BitVec 32) (_ BitVec 64))) (size!7485 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15054)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15054 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!297490 (= lt!147835 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297491 () Bool)

(assert (=> b!297491 false))

(declare-datatypes ((Unit!9262 0))(
  ( (Unit!9263) )
))
(declare-fun e!187997 () Unit!9262)

(declare-fun Unit!9264 () Unit!9262)

(assert (=> b!297491 (= e!187997 Unit!9264)))

(declare-fun b!297492 () Bool)

(declare-fun res!156870 () Bool)

(assert (=> b!297492 (=> (not res!156870) (not e!188000))))

(assert (=> b!297492 (= res!156870 (and (= (size!7485 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7485 a!3312))))))

(declare-fun b!297493 () Bool)

(declare-fun lt!147834 () SeekEntryResult!2282)

(declare-fun lt!147836 () SeekEntryResult!2282)

(assert (=> b!297493 (and (= lt!147836 lt!147834) (= (select (store (arr!7133 a!3312) i!1256 k!2524) (index!11300 lt!147834)) k!2524))))

(declare-fun lt!147840 () (_ BitVec 32))

(declare-fun lt!147838 () Unit!9262)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15054 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9262)

(assert (=> b!297493 (= lt!147838 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147840 (index!11300 lt!147834) (x!29520 lt!147834) mask!3809))))

(assert (=> b!297493 (and (= (select (arr!7133 a!3312) (index!11300 lt!147834)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11300 lt!147834) i!1256))))

(declare-fun Unit!9265 () Unit!9262)

(assert (=> b!297493 (= e!187997 Unit!9265)))

(declare-fun b!297495 () Bool)

(declare-fun e!188001 () Bool)

(assert (=> b!297495 (= e!187999 e!188001)))

(declare-fun res!156868 () Bool)

(assert (=> b!297495 (=> (not res!156868) (not e!188001))))

(assert (=> b!297495 (= res!156868 lt!147839)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15054 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!297495 (= lt!147836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147840 k!2524 (array!15055 (store (arr!7133 a!3312) i!1256 k!2524) (size!7485 a!3312)) mask!3809))))

(assert (=> b!297495 (= lt!147834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147840 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297495 (= lt!147840 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297496 () Bool)

(declare-fun res!156867 () Bool)

(assert (=> b!297496 (=> (not res!156867) (not e!188000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297496 (= res!156867 (validKeyInArray!0 k!2524))))

(declare-fun b!297497 () Bool)

(declare-fun e!187998 () Unit!9262)

(assert (=> b!297497 (= e!187998 e!187997)))

(declare-fun c!47894 () Bool)

(assert (=> b!297497 (= c!47894 (is-Intermediate!2282 lt!147834))))

(declare-fun b!297498 () Bool)

(declare-fun Unit!9266 () Unit!9262)

(assert (=> b!297498 (= e!187998 Unit!9266)))

(assert (=> b!297498 false))

(declare-fun b!297499 () Bool)

(declare-fun res!156871 () Bool)

(assert (=> b!297499 (=> (not res!156871) (not e!188000))))

(declare-fun arrayContainsKey!0 (array!15054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297499 (= res!156871 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297500 () Bool)

(assert (=> b!297500 (= e!188001 (not (= lt!147836 lt!147834)))))

(declare-fun lt!147837 () Unit!9262)

(assert (=> b!297500 (= lt!147837 e!187998)))

(declare-fun c!47895 () Bool)

(assert (=> b!297500 (= c!47895 (or (and (is-Intermediate!2282 lt!147834) (undefined!3094 lt!147834)) (and (is-Intermediate!2282 lt!147834) (= (select (arr!7133 a!3312) (index!11300 lt!147834)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2282 lt!147834) (= (select (arr!7133 a!3312) (index!11300 lt!147834)) k!2524))))))

(declare-fun b!297494 () Bool)

(declare-fun res!156873 () Bool)

(assert (=> b!297494 (=> (not res!156873) (not e!187999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15054 (_ BitVec 32)) Bool)

(assert (=> b!297494 (= res!156873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156872 () Bool)

(assert (=> start!29386 (=> (not res!156872) (not e!188000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29386 (= res!156872 (validMask!0 mask!3809))))

(assert (=> start!29386 e!188000))

(assert (=> start!29386 true))

(declare-fun array_inv!5096 (array!15054) Bool)

(assert (=> start!29386 (array_inv!5096 a!3312)))

(assert (= (and start!29386 res!156872) b!297492))

(assert (= (and b!297492 res!156870) b!297496))

(assert (= (and b!297496 res!156867) b!297499))

(assert (= (and b!297499 res!156871) b!297490))

(assert (= (and b!297490 res!156869) b!297494))

(assert (= (and b!297494 res!156873) b!297495))

(assert (= (and b!297495 res!156868) b!297500))

(assert (= (and b!297500 c!47895) b!297498))

(assert (= (and b!297500 (not c!47895)) b!297497))

(assert (= (and b!297497 c!47894) b!297493))

(assert (= (and b!297497 (not c!47894)) b!297491))

(declare-fun m!310221 () Bool)

(assert (=> b!297495 m!310221))

(declare-fun m!310223 () Bool)

(assert (=> b!297495 m!310223))

(declare-fun m!310225 () Bool)

(assert (=> b!297495 m!310225))

(declare-fun m!310227 () Bool)

(assert (=> b!297495 m!310227))

(assert (=> b!297493 m!310221))

(declare-fun m!310229 () Bool)

(assert (=> b!297493 m!310229))

(declare-fun m!310231 () Bool)

(assert (=> b!297493 m!310231))

(declare-fun m!310233 () Bool)

(assert (=> b!297493 m!310233))

(declare-fun m!310235 () Bool)

(assert (=> b!297490 m!310235))

(declare-fun m!310237 () Bool)

(assert (=> b!297494 m!310237))

(declare-fun m!310239 () Bool)

(assert (=> start!29386 m!310239))

(declare-fun m!310241 () Bool)

(assert (=> start!29386 m!310241))

(declare-fun m!310243 () Bool)

(assert (=> b!297496 m!310243))

(declare-fun m!310245 () Bool)

(assert (=> b!297499 m!310245))

(assert (=> b!297500 m!310233))

(push 1)

