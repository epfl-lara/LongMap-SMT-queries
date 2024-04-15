; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48672 () Bool)

(assert start!48672)

(declare-fun b!534694 () Bool)

(declare-fun res!330050 () Bool)

(declare-fun e!310702 () Bool)

(assert (=> b!534694 (=> (not res!330050) (not e!310702))))

(declare-datatypes ((array!33894 0))(
  ( (array!33895 (arr!16286 (Array (_ BitVec 32) (_ BitVec 64))) (size!16651 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33894)

(declare-datatypes ((List!10444 0))(
  ( (Nil!10441) (Cons!10440 (h!11383 (_ BitVec 64)) (t!16663 List!10444)) )
))
(declare-fun arrayNoDuplicates!0 (array!33894 (_ BitVec 32) List!10444) Bool)

(assert (=> b!534694 (= res!330050 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10441))))

(declare-fun b!534695 () Bool)

(declare-fun res!330044 () Bool)

(declare-fun e!310703 () Bool)

(assert (=> b!534695 (=> (not res!330044) (not e!310703))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534695 (= res!330044 (and (= (size!16651 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16651 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16651 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534696 () Bool)

(declare-fun res!330047 () Bool)

(assert (=> b!534696 (=> (not res!330047) (not e!310703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534696 (= res!330047 (validKeyInArray!0 (select (arr!16286 a!3154) j!147)))))

(declare-fun b!534697 () Bool)

(declare-fun res!330048 () Bool)

(assert (=> b!534697 (=> (not res!330048) (not e!310702))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4741 0))(
  ( (MissingZero!4741 (index!21188 (_ BitVec 32))) (Found!4741 (index!21189 (_ BitVec 32))) (Intermediate!4741 (undefined!5553 Bool) (index!21190 (_ BitVec 32)) (x!50151 (_ BitVec 32))) (Undefined!4741) (MissingVacant!4741 (index!21191 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33894 (_ BitVec 32)) SeekEntryResult!4741)

(assert (=> b!534697 (= res!330048 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16286 a!3154) j!147) a!3154 mask!3216) (Intermediate!4741 false resIndex!32 resX!32)))))

(declare-fun b!534698 () Bool)

(declare-fun res!330049 () Bool)

(assert (=> b!534698 (=> (not res!330049) (not e!310702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33894 (_ BitVec 32)) Bool)

(assert (=> b!534698 (= res!330049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534699 () Bool)

(assert (=> b!534699 (= e!310702 false)))

(declare-fun lt!245503 () SeekEntryResult!4741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534699 (= lt!245503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16286 a!3154) j!147) mask!3216) (select (arr!16286 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534700 () Bool)

(declare-fun res!330046 () Bool)

(assert (=> b!534700 (=> (not res!330046) (not e!310702))))

(assert (=> b!534700 (= res!330046 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16651 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16651 a!3154)) (= (select (arr!16286 a!3154) resIndex!32) (select (arr!16286 a!3154) j!147))))))

(declare-fun res!330045 () Bool)

(assert (=> start!48672 (=> (not res!330045) (not e!310703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48672 (= res!330045 (validMask!0 mask!3216))))

(assert (=> start!48672 e!310703))

(assert (=> start!48672 true))

(declare-fun array_inv!12169 (array!33894) Bool)

(assert (=> start!48672 (array_inv!12169 a!3154)))

(declare-fun b!534701 () Bool)

(declare-fun res!330041 () Bool)

(assert (=> b!534701 (=> (not res!330041) (not e!310703))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534701 (= res!330041 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534702 () Bool)

(assert (=> b!534702 (= e!310703 e!310702)))

(declare-fun res!330043 () Bool)

(assert (=> b!534702 (=> (not res!330043) (not e!310702))))

(declare-fun lt!245502 () SeekEntryResult!4741)

(assert (=> b!534702 (= res!330043 (or (= lt!245502 (MissingZero!4741 i!1153)) (= lt!245502 (MissingVacant!4741 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33894 (_ BitVec 32)) SeekEntryResult!4741)

(assert (=> b!534702 (= lt!245502 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534703 () Bool)

(declare-fun res!330042 () Bool)

(assert (=> b!534703 (=> (not res!330042) (not e!310703))))

(assert (=> b!534703 (= res!330042 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48672 res!330045) b!534695))

(assert (= (and b!534695 res!330044) b!534696))

(assert (= (and b!534696 res!330047) b!534703))

(assert (= (and b!534703 res!330042) b!534701))

(assert (= (and b!534701 res!330041) b!534702))

(assert (= (and b!534702 res!330043) b!534698))

(assert (= (and b!534698 res!330049) b!534694))

(assert (= (and b!534694 res!330050) b!534700))

(assert (= (and b!534700 res!330046) b!534697))

(assert (= (and b!534697 res!330048) b!534699))

(declare-fun m!513859 () Bool)

(assert (=> b!534701 m!513859))

(declare-fun m!513861 () Bool)

(assert (=> b!534703 m!513861))

(declare-fun m!513863 () Bool)

(assert (=> b!534702 m!513863))

(declare-fun m!513865 () Bool)

(assert (=> start!48672 m!513865))

(declare-fun m!513867 () Bool)

(assert (=> start!48672 m!513867))

(declare-fun m!513869 () Bool)

(assert (=> b!534698 m!513869))

(declare-fun m!513871 () Bool)

(assert (=> b!534694 m!513871))

(declare-fun m!513873 () Bool)

(assert (=> b!534699 m!513873))

(assert (=> b!534699 m!513873))

(declare-fun m!513875 () Bool)

(assert (=> b!534699 m!513875))

(assert (=> b!534699 m!513875))

(assert (=> b!534699 m!513873))

(declare-fun m!513877 () Bool)

(assert (=> b!534699 m!513877))

(declare-fun m!513879 () Bool)

(assert (=> b!534700 m!513879))

(assert (=> b!534700 m!513873))

(assert (=> b!534696 m!513873))

(assert (=> b!534696 m!513873))

(declare-fun m!513881 () Bool)

(assert (=> b!534696 m!513881))

(assert (=> b!534697 m!513873))

(assert (=> b!534697 m!513873))

(declare-fun m!513883 () Bool)

(assert (=> b!534697 m!513883))

(check-sat (not b!534702) (not b!534698) (not start!48672) (not b!534697) (not b!534694) (not b!534703) (not b!534701) (not b!534699) (not b!534696))
(check-sat)
