; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49654 () Bool)

(assert start!49654)

(declare-fun b!546010 () Bool)

(declare-fun e!315601 () Bool)

(declare-fun e!315604 () Bool)

(assert (=> b!546010 (= e!315601 e!315604)))

(declare-fun res!339840 () Bool)

(assert (=> b!546010 (=> (not res!339840) (not e!315604))))

(declare-datatypes ((SeekEntryResult!4948 0))(
  ( (MissingZero!4948 (index!22016 (_ BitVec 32))) (Found!4948 (index!22017 (_ BitVec 32))) (Intermediate!4948 (undefined!5760 Bool) (index!22018 (_ BitVec 32)) (x!51095 (_ BitVec 32))) (Undefined!4948) (MissingVacant!4948 (index!22019 (_ BitVec 32))) )
))
(declare-fun lt!249125 () SeekEntryResult!4948)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546010 (= res!339840 (or (= lt!249125 (MissingZero!4948 i!1153)) (= lt!249125 (MissingVacant!4948 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34415 0))(
  ( (array!34416 (arr!16534 (Array (_ BitVec 32) (_ BitVec 64))) (size!16898 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34415)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34415 (_ BitVec 32)) SeekEntryResult!4948)

(assert (=> b!546010 (= lt!249125 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!546011 () Bool)

(declare-fun res!339838 () Bool)

(assert (=> b!546011 (=> (not res!339838) (not e!315601))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!546011 (= res!339838 (and (= (size!16898 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16898 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16898 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546012 () Bool)

(declare-fun e!315605 () Bool)

(assert (=> b!546012 (= e!315605 (not true))))

(declare-fun lt!249130 () SeekEntryResult!4948)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!249124 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34415 (_ BitVec 32)) SeekEntryResult!4948)

(assert (=> b!546012 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249124 (select (store (arr!16534 a!3154) i!1153 k0!1998) j!147) (array!34416 (store (arr!16534 a!3154) i!1153 k0!1998) (size!16898 a!3154)) mask!3216) lt!249130)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16905 0))(
  ( (Unit!16906) )
))
(declare-fun lt!249128 () Unit!16905)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16905)

(assert (=> b!546012 (= lt!249128 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249124 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!546013 () Bool)

(declare-fun res!339836 () Bool)

(assert (=> b!546013 (=> (not res!339836) (not e!315604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34415 (_ BitVec 32)) Bool)

(assert (=> b!546013 (= res!339836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!546014 () Bool)

(declare-fun res!339839 () Bool)

(assert (=> b!546014 (=> (not res!339839) (not e!315601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546014 (= res!339839 (validKeyInArray!0 k0!1998))))

(declare-fun b!546015 () Bool)

(declare-fun e!315602 () Bool)

(assert (=> b!546015 (= e!315602 e!315605)))

(declare-fun res!339833 () Bool)

(assert (=> b!546015 (=> (not res!339833) (not e!315605))))

(declare-fun lt!249129 () SeekEntryResult!4948)

(declare-fun lt!249126 () SeekEntryResult!4948)

(assert (=> b!546015 (= res!339833 (and (= lt!249126 lt!249130) (= lt!249129 lt!249126)))))

(assert (=> b!546015 (= lt!249126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249124 (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546016 () Bool)

(declare-fun res!339834 () Bool)

(assert (=> b!546016 (=> (not res!339834) (not e!315604))))

(declare-datatypes ((List!10560 0))(
  ( (Nil!10557) (Cons!10556 (h!11523 (_ BitVec 64)) (t!16780 List!10560)) )
))
(declare-fun arrayNoDuplicates!0 (array!34415 (_ BitVec 32) List!10560) Bool)

(assert (=> b!546016 (= res!339834 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10557))))

(declare-fun b!546017 () Bool)

(declare-fun e!315606 () Bool)

(assert (=> b!546017 (= e!315606 e!315602)))

(declare-fun res!339835 () Bool)

(assert (=> b!546017 (=> (not res!339835) (not e!315602))))

(assert (=> b!546017 (= res!339835 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249124 #b00000000000000000000000000000000) (bvslt lt!249124 (size!16898 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546017 (= lt!249124 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!546018 () Bool)

(declare-fun e!315603 () Bool)

(assert (=> b!546018 (= e!315603 e!315606)))

(declare-fun res!339841 () Bool)

(assert (=> b!546018 (=> (not res!339841) (not e!315606))))

(declare-fun lt!249127 () SeekEntryResult!4948)

(assert (=> b!546018 (= res!339841 (and (= lt!249129 lt!249127) (not (= (select (arr!16534 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16534 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16534 a!3154) index!1177) (select (arr!16534 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546018 (= lt!249129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16534 a!3154) j!147) mask!3216) (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546019 () Bool)

(assert (=> b!546019 (= e!315604 e!315603)))

(declare-fun res!339843 () Bool)

(assert (=> b!546019 (=> (not res!339843) (not e!315603))))

(assert (=> b!546019 (= res!339843 (= lt!249127 lt!249130))))

(assert (=> b!546019 (= lt!249130 (Intermediate!4948 false resIndex!32 resX!32))))

(assert (=> b!546019 (= lt!249127 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546020 () Bool)

(declare-fun res!339837 () Bool)

(assert (=> b!546020 (=> (not res!339837) (not e!315601))))

(declare-fun arrayContainsKey!0 (array!34415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546020 (= res!339837 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546021 () Bool)

(declare-fun res!339832 () Bool)

(assert (=> b!546021 (=> (not res!339832) (not e!315604))))

(assert (=> b!546021 (= res!339832 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16898 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16898 a!3154)) (= (select (arr!16534 a!3154) resIndex!32) (select (arr!16534 a!3154) j!147))))))

(declare-fun b!546022 () Bool)

(declare-fun res!339844 () Bool)

(assert (=> b!546022 (=> (not res!339844) (not e!315601))))

(assert (=> b!546022 (= res!339844 (validKeyInArray!0 (select (arr!16534 a!3154) j!147)))))

(declare-fun res!339842 () Bool)

(assert (=> start!49654 (=> (not res!339842) (not e!315601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49654 (= res!339842 (validMask!0 mask!3216))))

(assert (=> start!49654 e!315601))

(assert (=> start!49654 true))

(declare-fun array_inv!12393 (array!34415) Bool)

(assert (=> start!49654 (array_inv!12393 a!3154)))

(assert (= (and start!49654 res!339842) b!546011))

(assert (= (and b!546011 res!339838) b!546022))

(assert (= (and b!546022 res!339844) b!546014))

(assert (= (and b!546014 res!339839) b!546020))

(assert (= (and b!546020 res!339837) b!546010))

(assert (= (and b!546010 res!339840) b!546013))

(assert (= (and b!546013 res!339836) b!546016))

(assert (= (and b!546016 res!339834) b!546021))

(assert (= (and b!546021 res!339832) b!546019))

(assert (= (and b!546019 res!339843) b!546018))

(assert (= (and b!546018 res!339841) b!546017))

(assert (= (and b!546017 res!339835) b!546015))

(assert (= (and b!546015 res!339833) b!546012))

(declare-fun m!523699 () Bool)

(assert (=> b!546022 m!523699))

(assert (=> b!546022 m!523699))

(declare-fun m!523701 () Bool)

(assert (=> b!546022 m!523701))

(declare-fun m!523703 () Bool)

(assert (=> b!546018 m!523703))

(assert (=> b!546018 m!523699))

(assert (=> b!546018 m!523699))

(declare-fun m!523705 () Bool)

(assert (=> b!546018 m!523705))

(assert (=> b!546018 m!523705))

(assert (=> b!546018 m!523699))

(declare-fun m!523707 () Bool)

(assert (=> b!546018 m!523707))

(declare-fun m!523709 () Bool)

(assert (=> b!546021 m!523709))

(assert (=> b!546021 m!523699))

(declare-fun m!523711 () Bool)

(assert (=> b!546017 m!523711))

(assert (=> b!546019 m!523699))

(assert (=> b!546019 m!523699))

(declare-fun m!523713 () Bool)

(assert (=> b!546019 m!523713))

(assert (=> b!546015 m!523699))

(assert (=> b!546015 m!523699))

(declare-fun m!523715 () Bool)

(assert (=> b!546015 m!523715))

(declare-fun m!523717 () Bool)

(assert (=> b!546020 m!523717))

(declare-fun m!523719 () Bool)

(assert (=> b!546014 m!523719))

(declare-fun m!523721 () Bool)

(assert (=> b!546016 m!523721))

(declare-fun m!523723 () Bool)

(assert (=> b!546012 m!523723))

(declare-fun m!523725 () Bool)

(assert (=> b!546012 m!523725))

(assert (=> b!546012 m!523725))

(declare-fun m!523727 () Bool)

(assert (=> b!546012 m!523727))

(declare-fun m!523729 () Bool)

(assert (=> b!546012 m!523729))

(declare-fun m!523731 () Bool)

(assert (=> start!49654 m!523731))

(declare-fun m!523733 () Bool)

(assert (=> start!49654 m!523733))

(declare-fun m!523735 () Bool)

(assert (=> b!546013 m!523735))

(declare-fun m!523737 () Bool)

(assert (=> b!546010 m!523737))

(check-sat (not b!546015) (not b!546013) (not b!546022) (not b!546018) (not b!546019) (not b!546012) (not b!546017) (not start!49654) (not b!546016) (not b!546020) (not b!546014) (not b!546010))
(check-sat)
