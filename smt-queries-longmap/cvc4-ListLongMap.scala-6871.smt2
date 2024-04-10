; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86484 () Bool)

(assert start!86484)

(declare-fun b!1001565 () Bool)

(declare-fun e!564353 () Bool)

(declare-fun e!564354 () Bool)

(assert (=> b!1001565 (= e!564353 e!564354)))

(declare-fun res!671047 () Bool)

(assert (=> b!1001565 (=> (not res!671047) (not e!564354))))

(declare-datatypes ((SeekEntryResult!9400 0))(
  ( (MissingZero!9400 (index!39971 (_ BitVec 32))) (Found!9400 (index!39972 (_ BitVec 32))) (Intermediate!9400 (undefined!10212 Bool) (index!39973 (_ BitVec 32)) (x!87388 (_ BitVec 32))) (Undefined!9400) (MissingVacant!9400 (index!39974 (_ BitVec 32))) )
))
(declare-fun lt!442745 () SeekEntryResult!9400)

(declare-fun lt!442740 () SeekEntryResult!9400)

(assert (=> b!1001565 (= res!671047 (= lt!442745 lt!442740))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001565 (= lt!442740 (Intermediate!9400 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((array!63285 0))(
  ( (array!63286 (arr!30468 (Array (_ BitVec 32) (_ BitVec 64))) (size!30970 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63285 (_ BitVec 32)) SeekEntryResult!9400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001565 (= lt!442745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30468 a!3219) j!170) mask!3464) (select (arr!30468 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001566 () Bool)

(declare-fun e!564349 () Bool)

(declare-fun e!564350 () Bool)

(assert (=> b!1001566 (= e!564349 e!564350)))

(declare-fun res!671049 () Bool)

(assert (=> b!1001566 (=> (not res!671049) (not e!564350))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442743 () (_ BitVec 32))

(assert (=> b!1001566 (= res!671049 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442743 #b00000000000000000000000000000000) (bvslt lt!442743 (size!30970 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001566 (= lt!442743 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001567 () Bool)

(assert (=> b!1001567 (= e!564350 false)))

(declare-fun lt!442739 () array!63285)

(declare-fun lt!442741 () (_ BitVec 64))

(declare-fun lt!442744 () SeekEntryResult!9400)

(assert (=> b!1001567 (= lt!442744 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442743 lt!442741 lt!442739 mask!3464))))

(declare-fun b!1001568 () Bool)

(declare-fun e!564355 () Bool)

(assert (=> b!1001568 (= e!564355 e!564349)))

(declare-fun res!671050 () Bool)

(assert (=> b!1001568 (=> (not res!671050) (not e!564349))))

(assert (=> b!1001568 (= res!671050 (not (= lt!442745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442741 mask!3464) lt!442741 lt!442739 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001568 (= lt!442741 (select (store (arr!30468 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001568 (= lt!442739 (array!63286 (store (arr!30468 a!3219) i!1194 k!2224) (size!30970 a!3219)))))

(declare-fun b!1001569 () Bool)

(declare-fun res!671053 () Bool)

(declare-fun e!564351 () Bool)

(assert (=> b!1001569 (=> (not res!671053) (not e!564351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001569 (= res!671053 (validKeyInArray!0 k!2224))))

(declare-fun b!1001570 () Bool)

(assert (=> b!1001570 (= e!564351 e!564353)))

(declare-fun res!671051 () Bool)

(assert (=> b!1001570 (=> (not res!671051) (not e!564353))))

(declare-fun lt!442738 () SeekEntryResult!9400)

(assert (=> b!1001570 (= res!671051 (or (= lt!442738 (MissingVacant!9400 i!1194)) (= lt!442738 (MissingZero!9400 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63285 (_ BitVec 32)) SeekEntryResult!9400)

(assert (=> b!1001570 (= lt!442738 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!671043 () Bool)

(assert (=> start!86484 (=> (not res!671043) (not e!564351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86484 (= res!671043 (validMask!0 mask!3464))))

(assert (=> start!86484 e!564351))

(declare-fun array_inv!23592 (array!63285) Bool)

(assert (=> start!86484 (array_inv!23592 a!3219)))

(assert (=> start!86484 true))

(declare-fun b!1001571 () Bool)

(declare-fun res!671058 () Bool)

(assert (=> b!1001571 (=> (not res!671058) (not e!564350))))

(assert (=> b!1001571 (= res!671058 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442743 (select (arr!30468 a!3219) j!170) a!3219 mask!3464) lt!442740))))

(declare-fun b!1001572 () Bool)

(declare-fun res!671057 () Bool)

(assert (=> b!1001572 (=> (not res!671057) (not e!564351))))

(assert (=> b!1001572 (= res!671057 (and (= (size!30970 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30970 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30970 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001573 () Bool)

(declare-fun res!671056 () Bool)

(assert (=> b!1001573 (=> (not res!671056) (not e!564349))))

(assert (=> b!1001573 (= res!671056 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001574 () Bool)

(declare-fun res!671055 () Bool)

(assert (=> b!1001574 (=> (not res!671055) (not e!564353))))

(assert (=> b!1001574 (= res!671055 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30970 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30970 a!3219))))))

(declare-fun b!1001575 () Bool)

(declare-fun res!671046 () Bool)

(assert (=> b!1001575 (=> (not res!671046) (not e!564351))))

(assert (=> b!1001575 (= res!671046 (validKeyInArray!0 (select (arr!30468 a!3219) j!170)))))

(declare-fun b!1001576 () Bool)

(declare-fun res!671044 () Bool)

(assert (=> b!1001576 (=> (not res!671044) (not e!564351))))

(declare-fun arrayContainsKey!0 (array!63285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001576 (= res!671044 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001577 () Bool)

(declare-fun res!671045 () Bool)

(assert (=> b!1001577 (=> (not res!671045) (not e!564353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63285 (_ BitVec 32)) Bool)

(assert (=> b!1001577 (= res!671045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001578 () Bool)

(declare-fun res!671054 () Bool)

(assert (=> b!1001578 (=> (not res!671054) (not e!564349))))

(declare-fun lt!442742 () SeekEntryResult!9400)

(assert (=> b!1001578 (= res!671054 (not (= lt!442742 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442741 lt!442739 mask!3464))))))

(declare-fun b!1001579 () Bool)

(assert (=> b!1001579 (= e!564354 e!564355)))

(declare-fun res!671052 () Bool)

(assert (=> b!1001579 (=> (not res!671052) (not e!564355))))

(assert (=> b!1001579 (= res!671052 (= lt!442742 lt!442740))))

(assert (=> b!1001579 (= lt!442742 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30468 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001580 () Bool)

(declare-fun res!671048 () Bool)

(assert (=> b!1001580 (=> (not res!671048) (not e!564353))))

(declare-datatypes ((List!21144 0))(
  ( (Nil!21141) (Cons!21140 (h!22317 (_ BitVec 64)) (t!30145 List!21144)) )
))
(declare-fun arrayNoDuplicates!0 (array!63285 (_ BitVec 32) List!21144) Bool)

(assert (=> b!1001580 (= res!671048 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21141))))

(assert (= (and start!86484 res!671043) b!1001572))

(assert (= (and b!1001572 res!671057) b!1001575))

(assert (= (and b!1001575 res!671046) b!1001569))

(assert (= (and b!1001569 res!671053) b!1001576))

(assert (= (and b!1001576 res!671044) b!1001570))

(assert (= (and b!1001570 res!671051) b!1001577))

(assert (= (and b!1001577 res!671045) b!1001580))

(assert (= (and b!1001580 res!671048) b!1001574))

(assert (= (and b!1001574 res!671055) b!1001565))

(assert (= (and b!1001565 res!671047) b!1001579))

(assert (= (and b!1001579 res!671052) b!1001568))

(assert (= (and b!1001568 res!671050) b!1001578))

(assert (= (and b!1001578 res!671054) b!1001573))

(assert (= (and b!1001573 res!671056) b!1001566))

(assert (= (and b!1001566 res!671049) b!1001571))

(assert (= (and b!1001571 res!671058) b!1001567))

(declare-fun m!927589 () Bool)

(assert (=> b!1001580 m!927589))

(declare-fun m!927591 () Bool)

(assert (=> b!1001570 m!927591))

(declare-fun m!927593 () Bool)

(assert (=> b!1001571 m!927593))

(assert (=> b!1001571 m!927593))

(declare-fun m!927595 () Bool)

(assert (=> b!1001571 m!927595))

(declare-fun m!927597 () Bool)

(assert (=> b!1001577 m!927597))

(declare-fun m!927599 () Bool)

(assert (=> start!86484 m!927599))

(declare-fun m!927601 () Bool)

(assert (=> start!86484 m!927601))

(declare-fun m!927603 () Bool)

(assert (=> b!1001568 m!927603))

(assert (=> b!1001568 m!927603))

(declare-fun m!927605 () Bool)

(assert (=> b!1001568 m!927605))

(declare-fun m!927607 () Bool)

(assert (=> b!1001568 m!927607))

(declare-fun m!927609 () Bool)

(assert (=> b!1001568 m!927609))

(assert (=> b!1001575 m!927593))

(assert (=> b!1001575 m!927593))

(declare-fun m!927611 () Bool)

(assert (=> b!1001575 m!927611))

(assert (=> b!1001565 m!927593))

(assert (=> b!1001565 m!927593))

(declare-fun m!927613 () Bool)

(assert (=> b!1001565 m!927613))

(assert (=> b!1001565 m!927613))

(assert (=> b!1001565 m!927593))

(declare-fun m!927615 () Bool)

(assert (=> b!1001565 m!927615))

(declare-fun m!927617 () Bool)

(assert (=> b!1001578 m!927617))

(assert (=> b!1001579 m!927593))

(assert (=> b!1001579 m!927593))

(declare-fun m!927619 () Bool)

(assert (=> b!1001579 m!927619))

(declare-fun m!927621 () Bool)

(assert (=> b!1001576 m!927621))

(declare-fun m!927623 () Bool)

(assert (=> b!1001567 m!927623))

(declare-fun m!927625 () Bool)

(assert (=> b!1001566 m!927625))

(declare-fun m!927627 () Bool)

(assert (=> b!1001569 m!927627))

(push 1)

(assert (not b!1001566))

(assert (not b!1001568))

(assert (not b!1001577))

