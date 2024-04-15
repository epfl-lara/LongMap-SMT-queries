; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48882 () Bool)

(assert start!48882)

(declare-fun b!538639 () Bool)

(declare-fun res!333991 () Bool)

(declare-fun e!312305 () Bool)

(assert (=> b!538639 (=> (not res!333991) (not e!312305))))

(declare-datatypes ((array!34104 0))(
  ( (array!34105 (arr!16391 (Array (_ BitVec 32) (_ BitVec 64))) (size!16756 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34104)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538639 (= res!333991 (and (= (size!16756 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16756 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16756 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538641 () Bool)

(declare-fun res!333987 () Bool)

(assert (=> b!538641 (=> (not res!333987) (not e!312305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538641 (= res!333987 (validKeyInArray!0 (select (arr!16391 a!3154) j!147)))))

(declare-fun b!538642 () Bool)

(declare-fun e!312304 () Bool)

(assert (=> b!538642 (= e!312305 e!312304)))

(declare-fun res!333992 () Bool)

(assert (=> b!538642 (=> (not res!333992) (not e!312304))))

(declare-datatypes ((SeekEntryResult!4846 0))(
  ( (MissingZero!4846 (index!21608 (_ BitVec 32))) (Found!4846 (index!21609 (_ BitVec 32))) (Intermediate!4846 (undefined!5658 Bool) (index!21610 (_ BitVec 32)) (x!50536 (_ BitVec 32))) (Undefined!4846) (MissingVacant!4846 (index!21611 (_ BitVec 32))) )
))
(declare-fun lt!246781 () SeekEntryResult!4846)

(assert (=> b!538642 (= res!333992 (or (= lt!246781 (MissingZero!4846 i!1153)) (= lt!246781 (MissingVacant!4846 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34104 (_ BitVec 32)) SeekEntryResult!4846)

(assert (=> b!538642 (= lt!246781 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538643 () Bool)

(declare-fun res!333990 () Bool)

(assert (=> b!538643 (=> (not res!333990) (not e!312305))))

(declare-fun arrayContainsKey!0 (array!34104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538643 (= res!333990 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538644 () Bool)

(assert (=> b!538644 (= e!312304 false)))

(declare-fun lt!246780 () Bool)

(declare-datatypes ((List!10549 0))(
  ( (Nil!10546) (Cons!10545 (h!11488 (_ BitVec 64)) (t!16768 List!10549)) )
))
(declare-fun arrayNoDuplicates!0 (array!34104 (_ BitVec 32) List!10549) Bool)

(assert (=> b!538644 (= lt!246780 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10546))))

(declare-fun b!538645 () Bool)

(declare-fun res!333989 () Bool)

(assert (=> b!538645 (=> (not res!333989) (not e!312305))))

(assert (=> b!538645 (= res!333989 (validKeyInArray!0 k0!1998))))

(declare-fun res!333986 () Bool)

(assert (=> start!48882 (=> (not res!333986) (not e!312305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48882 (= res!333986 (validMask!0 mask!3216))))

(assert (=> start!48882 e!312305))

(assert (=> start!48882 true))

(declare-fun array_inv!12274 (array!34104) Bool)

(assert (=> start!48882 (array_inv!12274 a!3154)))

(declare-fun b!538640 () Bool)

(declare-fun res!333988 () Bool)

(assert (=> b!538640 (=> (not res!333988) (not e!312304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34104 (_ BitVec 32)) Bool)

(assert (=> b!538640 (= res!333988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48882 res!333986) b!538639))

(assert (= (and b!538639 res!333991) b!538641))

(assert (= (and b!538641 res!333987) b!538645))

(assert (= (and b!538645 res!333989) b!538643))

(assert (= (and b!538643 res!333990) b!538642))

(assert (= (and b!538642 res!333992) b!538640))

(assert (= (and b!538640 res!333988) b!538644))

(declare-fun m!517279 () Bool)

(assert (=> b!538643 m!517279))

(declare-fun m!517281 () Bool)

(assert (=> start!48882 m!517281))

(declare-fun m!517283 () Bool)

(assert (=> start!48882 m!517283))

(declare-fun m!517285 () Bool)

(assert (=> b!538644 m!517285))

(declare-fun m!517287 () Bool)

(assert (=> b!538642 m!517287))

(declare-fun m!517289 () Bool)

(assert (=> b!538645 m!517289))

(declare-fun m!517291 () Bool)

(assert (=> b!538640 m!517291))

(declare-fun m!517293 () Bool)

(assert (=> b!538641 m!517293))

(assert (=> b!538641 m!517293))

(declare-fun m!517295 () Bool)

(assert (=> b!538641 m!517295))

(check-sat (not b!538645) (not b!538642) (not b!538640) (not b!538641) (not b!538643) (not b!538644) (not start!48882))
(check-sat)
