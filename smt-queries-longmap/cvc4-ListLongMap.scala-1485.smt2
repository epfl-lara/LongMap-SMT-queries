; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28300 () Bool)

(assert start!28300)

(declare-fun b!289995 () Bool)

(declare-fun e!183541 () Bool)

(declare-fun e!183540 () Bool)

(assert (=> b!289995 (= e!183541 e!183540)))

(declare-fun res!151475 () Bool)

(assert (=> b!289995 (=> (not res!151475) (not e!183540))))

(declare-datatypes ((SeekEntryResult!2083 0))(
  ( (MissingZero!2083 (index!10502 (_ BitVec 32))) (Found!2083 (index!10503 (_ BitVec 32))) (Intermediate!2083 (undefined!2895 Bool) (index!10504 (_ BitVec 32)) (x!28696 (_ BitVec 32))) (Undefined!2083) (MissingVacant!2083 (index!10505 (_ BitVec 32))) )
))
(declare-fun lt!143194 () SeekEntryResult!2083)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289995 (= res!151475 (or (= lt!143194 (MissingZero!2083 i!1256)) (= lt!143194 (MissingVacant!2083 i!1256))))))

(declare-datatypes ((array!14614 0))(
  ( (array!14615 (arr!6934 (Array (_ BitVec 32) (_ BitVec 64))) (size!7286 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14614)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14614 (_ BitVec 32)) SeekEntryResult!2083)

(assert (=> b!289995 (= lt!143194 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289996 () Bool)

(declare-fun res!151474 () Bool)

(assert (=> b!289996 (=> (not res!151474) (not e!183541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289996 (= res!151474 (validKeyInArray!0 k!2524))))

(declare-fun b!289997 () Bool)

(assert (=> b!289997 (= e!183540 false)))

(declare-fun lt!143197 () (_ BitVec 32))

(declare-fun lt!143196 () SeekEntryResult!2083)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14614 (_ BitVec 32)) SeekEntryResult!2083)

(assert (=> b!289997 (= lt!143196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143197 k!2524 (array!14615 (store (arr!6934 a!3312) i!1256 k!2524) (size!7286 a!3312)) mask!3809))))

(declare-fun lt!143195 () SeekEntryResult!2083)

(assert (=> b!289997 (= lt!143195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143197 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289997 (= lt!143197 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289998 () Bool)

(declare-fun res!151477 () Bool)

(assert (=> b!289998 (=> (not res!151477) (not e!183541))))

(declare-fun arrayContainsKey!0 (array!14614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289998 (= res!151477 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151479 () Bool)

(assert (=> start!28300 (=> (not res!151479) (not e!183541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28300 (= res!151479 (validMask!0 mask!3809))))

(assert (=> start!28300 e!183541))

(assert (=> start!28300 true))

(declare-fun array_inv!4897 (array!14614) Bool)

(assert (=> start!28300 (array_inv!4897 a!3312)))

(declare-fun b!289999 () Bool)

(declare-fun res!151476 () Bool)

(assert (=> b!289999 (=> (not res!151476) (not e!183540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14614 (_ BitVec 32)) Bool)

(assert (=> b!289999 (= res!151476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290000 () Bool)

(declare-fun res!151478 () Bool)

(assert (=> b!290000 (=> (not res!151478) (not e!183541))))

(assert (=> b!290000 (= res!151478 (and (= (size!7286 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7286 a!3312))))))

(assert (= (and start!28300 res!151479) b!290000))

(assert (= (and b!290000 res!151478) b!289996))

(assert (= (and b!289996 res!151474) b!289998))

(assert (= (and b!289998 res!151477) b!289995))

(assert (= (and b!289995 res!151475) b!289999))

(assert (= (and b!289999 res!151476) b!289997))

(declare-fun m!304087 () Bool)

(assert (=> b!289997 m!304087))

(declare-fun m!304089 () Bool)

(assert (=> b!289997 m!304089))

(declare-fun m!304091 () Bool)

(assert (=> b!289997 m!304091))

(declare-fun m!304093 () Bool)

(assert (=> b!289997 m!304093))

(declare-fun m!304095 () Bool)

(assert (=> b!289998 m!304095))

(declare-fun m!304097 () Bool)

(assert (=> start!28300 m!304097))

(declare-fun m!304099 () Bool)

(assert (=> start!28300 m!304099))

(declare-fun m!304101 () Bool)

(assert (=> b!289999 m!304101))

(declare-fun m!304103 () Bool)

(assert (=> b!289996 m!304103))

(declare-fun m!304105 () Bool)

(assert (=> b!289995 m!304105))

(push 1)

(assert (not start!28300))

(assert (not b!289995))

(assert (not b!289999))

(assert (not b!289998))

