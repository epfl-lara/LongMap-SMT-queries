; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48686 () Bool)

(assert start!48686)

(declare-fun b!534995 () Bool)

(declare-fun res!330208 () Bool)

(declare-fun e!310887 () Bool)

(assert (=> b!534995 (=> (not res!330208) (not e!310887))))

(declare-datatypes ((array!33898 0))(
  ( (array!33899 (arr!16288 (Array (_ BitVec 32) (_ BitVec 64))) (size!16652 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33898)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33898 (_ BitVec 32)) Bool)

(assert (=> b!534995 (= res!330208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534996 () Bool)

(declare-fun res!330209 () Bool)

(declare-fun e!310885 () Bool)

(assert (=> b!534996 (=> (not res!330209) (not e!310885))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534996 (= res!330209 (and (= (size!16652 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16652 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16652 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534997 () Bool)

(declare-fun res!330201 () Bool)

(assert (=> b!534997 (=> (not res!330201) (not e!310885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534997 (= res!330201 (validKeyInArray!0 (select (arr!16288 a!3154) j!147)))))

(declare-fun b!534998 () Bool)

(declare-fun res!330207 () Bool)

(assert (=> b!534998 (=> (not res!330207) (not e!310887))))

(declare-datatypes ((List!10407 0))(
  ( (Nil!10404) (Cons!10403 (h!11346 (_ BitVec 64)) (t!16635 List!10407)) )
))
(declare-fun arrayNoDuplicates!0 (array!33898 (_ BitVec 32) List!10407) Bool)

(assert (=> b!534998 (= res!330207 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10404))))

(declare-fun b!535000 () Bool)

(declare-fun res!330202 () Bool)

(assert (=> b!535000 (=> (not res!330202) (not e!310887))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4746 0))(
  ( (MissingZero!4746 (index!21208 (_ BitVec 32))) (Found!4746 (index!21209 (_ BitVec 32))) (Intermediate!4746 (undefined!5558 Bool) (index!21210 (_ BitVec 32)) (x!50161 (_ BitVec 32))) (Undefined!4746) (MissingVacant!4746 (index!21211 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33898 (_ BitVec 32)) SeekEntryResult!4746)

(assert (=> b!535000 (= res!330202 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16288 a!3154) j!147) a!3154 mask!3216) (Intermediate!4746 false resIndex!32 resX!32)))))

(declare-fun b!535001 () Bool)

(assert (=> b!535001 (= e!310887 false)))

(declare-fun lt!245742 () SeekEntryResult!4746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535001 (= lt!245742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16288 a!3154) j!147) mask!3216) (select (arr!16288 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535002 () Bool)

(declare-fun res!330206 () Bool)

(assert (=> b!535002 (=> (not res!330206) (not e!310887))))

(assert (=> b!535002 (= res!330206 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16652 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16652 a!3154)) (= (select (arr!16288 a!3154) resIndex!32) (select (arr!16288 a!3154) j!147))))))

(declare-fun b!535003 () Bool)

(declare-fun res!330203 () Bool)

(assert (=> b!535003 (=> (not res!330203) (not e!310885))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!535003 (= res!330203 (validKeyInArray!0 k0!1998))))

(declare-fun b!535004 () Bool)

(declare-fun res!330205 () Bool)

(assert (=> b!535004 (=> (not res!330205) (not e!310885))))

(declare-fun arrayContainsKey!0 (array!33898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535004 (= res!330205 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!330200 () Bool)

(assert (=> start!48686 (=> (not res!330200) (not e!310885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48686 (= res!330200 (validMask!0 mask!3216))))

(assert (=> start!48686 e!310885))

(assert (=> start!48686 true))

(declare-fun array_inv!12084 (array!33898) Bool)

(assert (=> start!48686 (array_inv!12084 a!3154)))

(declare-fun b!534999 () Bool)

(assert (=> b!534999 (= e!310885 e!310887)))

(declare-fun res!330204 () Bool)

(assert (=> b!534999 (=> (not res!330204) (not e!310887))))

(declare-fun lt!245743 () SeekEntryResult!4746)

(assert (=> b!534999 (= res!330204 (or (= lt!245743 (MissingZero!4746 i!1153)) (= lt!245743 (MissingVacant!4746 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33898 (_ BitVec 32)) SeekEntryResult!4746)

(assert (=> b!534999 (= lt!245743 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48686 res!330200) b!534996))

(assert (= (and b!534996 res!330209) b!534997))

(assert (= (and b!534997 res!330201) b!535003))

(assert (= (and b!535003 res!330203) b!535004))

(assert (= (and b!535004 res!330205) b!534999))

(assert (= (and b!534999 res!330204) b!534995))

(assert (= (and b!534995 res!330208) b!534998))

(assert (= (and b!534998 res!330207) b!535002))

(assert (= (and b!535002 res!330206) b!535000))

(assert (= (and b!535000 res!330202) b!535001))

(declare-fun m!514637 () Bool)

(assert (=> b!535004 m!514637))

(declare-fun m!514639 () Bool)

(assert (=> b!534995 m!514639))

(declare-fun m!514641 () Bool)

(assert (=> b!534997 m!514641))

(assert (=> b!534997 m!514641))

(declare-fun m!514643 () Bool)

(assert (=> b!534997 m!514643))

(assert (=> b!535001 m!514641))

(assert (=> b!535001 m!514641))

(declare-fun m!514645 () Bool)

(assert (=> b!535001 m!514645))

(assert (=> b!535001 m!514645))

(assert (=> b!535001 m!514641))

(declare-fun m!514647 () Bool)

(assert (=> b!535001 m!514647))

(declare-fun m!514649 () Bool)

(assert (=> start!48686 m!514649))

(declare-fun m!514651 () Bool)

(assert (=> start!48686 m!514651))

(declare-fun m!514653 () Bool)

(assert (=> b!534998 m!514653))

(declare-fun m!514655 () Bool)

(assert (=> b!534999 m!514655))

(declare-fun m!514657 () Bool)

(assert (=> b!535003 m!514657))

(assert (=> b!535000 m!514641))

(assert (=> b!535000 m!514641))

(declare-fun m!514659 () Bool)

(assert (=> b!535000 m!514659))

(declare-fun m!514661 () Bool)

(assert (=> b!535002 m!514661))

(assert (=> b!535002 m!514641))

(check-sat (not b!534995) (not b!535003) (not start!48686) (not b!535000) (not b!535004) (not b!535001) (not b!534997) (not b!534998) (not b!534999))
(check-sat)
