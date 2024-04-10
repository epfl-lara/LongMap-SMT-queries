; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28308 () Bool)

(assert start!28308)

(declare-fun b!290068 () Bool)

(declare-fun res!151551 () Bool)

(declare-fun e!183577 () Bool)

(assert (=> b!290068 (=> (not res!151551) (not e!183577))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290068 (= res!151551 (validKeyInArray!0 k!2524))))

(declare-fun b!290069 () Bool)

(declare-fun res!151549 () Bool)

(declare-fun e!183576 () Bool)

(assert (=> b!290069 (=> (not res!151549) (not e!183576))))

(declare-datatypes ((array!14622 0))(
  ( (array!14623 (arr!6938 (Array (_ BitVec 32) (_ BitVec 64))) (size!7290 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14622)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14622 (_ BitVec 32)) Bool)

(assert (=> b!290069 (= res!151549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290070 () Bool)

(declare-fun res!151548 () Bool)

(assert (=> b!290070 (=> (not res!151548) (not e!183577))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290070 (= res!151548 (and (= (size!7290 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7290 a!3312))))))

(declare-fun b!290071 () Bool)

(assert (=> b!290071 (= e!183577 e!183576)))

(declare-fun res!151550 () Bool)

(assert (=> b!290071 (=> (not res!151550) (not e!183576))))

(declare-datatypes ((SeekEntryResult!2087 0))(
  ( (MissingZero!2087 (index!10518 (_ BitVec 32))) (Found!2087 (index!10519 (_ BitVec 32))) (Intermediate!2087 (undefined!2899 Bool) (index!10520 (_ BitVec 32)) (x!28716 (_ BitVec 32))) (Undefined!2087) (MissingVacant!2087 (index!10521 (_ BitVec 32))) )
))
(declare-fun lt!143245 () SeekEntryResult!2087)

(assert (=> b!290071 (= res!151550 (or (= lt!143245 (MissingZero!2087 i!1256)) (= lt!143245 (MissingVacant!2087 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14622 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!290071 (= lt!143245 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290072 () Bool)

(declare-fun res!151547 () Bool)

(assert (=> b!290072 (=> (not res!151547) (not e!183577))))

(declare-fun arrayContainsKey!0 (array!14622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290072 (= res!151547 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151546 () Bool)

(assert (=> start!28308 (=> (not res!151546) (not e!183577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28308 (= res!151546 (validMask!0 mask!3809))))

(assert (=> start!28308 e!183577))

(assert (=> start!28308 true))

(declare-fun array_inv!4901 (array!14622) Bool)

(assert (=> start!28308 (array_inv!4901 a!3312)))

(declare-fun b!290067 () Bool)

(assert (=> b!290067 (= e!183576 false)))

(declare-fun lt!143243 () (_ BitVec 32))

(declare-fun lt!143244 () SeekEntryResult!2087)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14622 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!290067 (= lt!143244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143243 k!2524 (array!14623 (store (arr!6938 a!3312) i!1256 k!2524) (size!7290 a!3312)) mask!3809))))

(declare-fun lt!143242 () SeekEntryResult!2087)

(assert (=> b!290067 (= lt!143242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143243 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290067 (= lt!143243 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28308 res!151546) b!290070))

(assert (= (and b!290070 res!151548) b!290068))

(assert (= (and b!290068 res!151551) b!290072))

(assert (= (and b!290072 res!151547) b!290071))

(assert (= (and b!290071 res!151550) b!290069))

(assert (= (and b!290069 res!151549) b!290067))

(declare-fun m!304167 () Bool)

(assert (=> b!290071 m!304167))

(declare-fun m!304169 () Bool)

(assert (=> b!290068 m!304169))

(declare-fun m!304171 () Bool)

(assert (=> start!28308 m!304171))

(declare-fun m!304173 () Bool)

(assert (=> start!28308 m!304173))

(declare-fun m!304175 () Bool)

(assert (=> b!290072 m!304175))

(declare-fun m!304177 () Bool)

(assert (=> b!290067 m!304177))

(declare-fun m!304179 () Bool)

(assert (=> b!290067 m!304179))

(declare-fun m!304181 () Bool)

(assert (=> b!290067 m!304181))

(declare-fun m!304183 () Bool)

(assert (=> b!290067 m!304183))

(declare-fun m!304185 () Bool)

(assert (=> b!290069 m!304185))

(push 1)

