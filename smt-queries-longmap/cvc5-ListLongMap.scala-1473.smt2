; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28224 () Bool)

(assert start!28224)

(declare-fun b!289045 () Bool)

(declare-fun e!183004 () Bool)

(declare-fun e!183006 () Bool)

(assert (=> b!289045 (= e!183004 e!183006)))

(declare-fun res!150672 () Bool)

(assert (=> b!289045 (=> (not res!150672) (not e!183006))))

(declare-datatypes ((SeekEntryResult!2045 0))(
  ( (MissingZero!2045 (index!10350 (_ BitVec 32))) (Found!2045 (index!10351 (_ BitVec 32))) (Intermediate!2045 (undefined!2857 Bool) (index!10352 (_ BitVec 32)) (x!28562 (_ BitVec 32))) (Undefined!2045) (MissingVacant!2045 (index!10353 (_ BitVec 32))) )
))
(declare-fun lt!142538 () SeekEntryResult!2045)

(declare-fun lt!142540 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289045 (= res!150672 (or lt!142540 (= lt!142538 (MissingVacant!2045 i!1256))))))

(assert (=> b!289045 (= lt!142540 (= lt!142538 (MissingZero!2045 i!1256)))))

(declare-datatypes ((array!14538 0))(
  ( (array!14539 (arr!6896 (Array (_ BitVec 32) (_ BitVec 64))) (size!7248 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14538)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14538 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!289045 (= lt!142538 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289046 () Bool)

(declare-fun res!150674 () Bool)

(assert (=> b!289046 (=> (not res!150674) (not e!183006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14538 (_ BitVec 32)) Bool)

(assert (=> b!289046 (= res!150674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289047 () Bool)

(declare-fun res!150673 () Bool)

(assert (=> b!289047 (=> (not res!150673) (not e!183004))))

(declare-fun arrayContainsKey!0 (array!14538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289047 (= res!150673 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289048 () Bool)

(declare-fun res!150668 () Bool)

(assert (=> b!289048 (=> (not res!150668) (not e!183004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289048 (= res!150668 (validKeyInArray!0 k!2524))))

(declare-fun b!289049 () Bool)

(declare-fun res!150670 () Bool)

(assert (=> b!289049 (=> (not res!150670) (not e!183004))))

(assert (=> b!289049 (= res!150670 (and (= (size!7248 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7248 a!3312))))))

(declare-fun b!289051 () Bool)

(declare-fun e!183007 () Bool)

(declare-fun e!183005 () Bool)

(assert (=> b!289051 (= e!183007 e!183005)))

(declare-fun res!150671 () Bool)

(assert (=> b!289051 (=> (not res!150671) (not e!183005))))

(declare-fun lt!142537 () SeekEntryResult!2045)

(declare-fun lt!142539 () Bool)

(assert (=> b!289051 (= res!150671 (and (or lt!142539 (not (undefined!2857 lt!142537))) (or lt!142539 (not (= (select (arr!6896 a!3312) (index!10352 lt!142537)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142539 (not (= (select (arr!6896 a!3312) (index!10352 lt!142537)) k!2524))) (not lt!142539)))))

(assert (=> b!289051 (= lt!142539 (not (is-Intermediate!2045 lt!142537)))))

(declare-fun b!289052 () Bool)

(assert (=> b!289052 (= e!183005 (not true))))

(assert (=> b!289052 (and (= (select (arr!6896 a!3312) (index!10352 lt!142537)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10352 lt!142537) i!1256))))

(declare-fun res!150669 () Bool)

(assert (=> start!28224 (=> (not res!150669) (not e!183004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28224 (= res!150669 (validMask!0 mask!3809))))

(assert (=> start!28224 e!183004))

(assert (=> start!28224 true))

(declare-fun array_inv!4859 (array!14538) Bool)

(assert (=> start!28224 (array_inv!4859 a!3312)))

(declare-fun b!289050 () Bool)

(assert (=> b!289050 (= e!183006 e!183007)))

(declare-fun res!150675 () Bool)

(assert (=> b!289050 (=> (not res!150675) (not e!183007))))

(assert (=> b!289050 (= res!150675 lt!142540)))

(declare-fun lt!142536 () (_ BitVec 32))

(declare-fun lt!142535 () SeekEntryResult!2045)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14538 (_ BitVec 32)) SeekEntryResult!2045)

(assert (=> b!289050 (= lt!142535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142536 k!2524 (array!14539 (store (arr!6896 a!3312) i!1256 k!2524) (size!7248 a!3312)) mask!3809))))

(assert (=> b!289050 (= lt!142537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142536 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289050 (= lt!142536 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28224 res!150669) b!289049))

(assert (= (and b!289049 res!150670) b!289048))

(assert (= (and b!289048 res!150668) b!289047))

(assert (= (and b!289047 res!150673) b!289045))

(assert (= (and b!289045 res!150672) b!289046))

(assert (= (and b!289046 res!150674) b!289050))

(assert (= (and b!289050 res!150675) b!289051))

(assert (= (and b!289051 res!150671) b!289052))

(declare-fun m!303225 () Bool)

(assert (=> b!289045 m!303225))

(declare-fun m!303227 () Bool)

(assert (=> b!289051 m!303227))

(declare-fun m!303229 () Bool)

(assert (=> b!289047 m!303229))

(assert (=> b!289052 m!303227))

(declare-fun m!303231 () Bool)

(assert (=> start!28224 m!303231))

(declare-fun m!303233 () Bool)

(assert (=> start!28224 m!303233))

(declare-fun m!303235 () Bool)

(assert (=> b!289046 m!303235))

(declare-fun m!303237 () Bool)

(assert (=> b!289048 m!303237))

(declare-fun m!303239 () Bool)

(assert (=> b!289050 m!303239))

(declare-fun m!303241 () Bool)

(assert (=> b!289050 m!303241))

(declare-fun m!303243 () Bool)

(assert (=> b!289050 m!303243))

(declare-fun m!303245 () Bool)

(assert (=> b!289050 m!303245))

(push 1)

