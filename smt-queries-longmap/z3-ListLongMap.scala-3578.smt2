; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49246 () Bool)

(assert start!49246)

(declare-fun b!541996 () Bool)

(declare-fun e!313795 () Bool)

(declare-fun e!313797 () Bool)

(assert (=> b!541996 (= e!313795 e!313797)))

(declare-fun res!336623 () Bool)

(assert (=> b!541996 (=> (not res!336623) (not e!313797))))

(declare-datatypes ((SeekEntryResult!4873 0))(
  ( (MissingZero!4873 (index!21716 (_ BitVec 32))) (Found!4873 (index!21717 (_ BitVec 32))) (Intermediate!4873 (undefined!5685 Bool) (index!21718 (_ BitVec 32)) (x!50781 (_ BitVec 32))) (Undefined!4873) (MissingVacant!4873 (index!21719 (_ BitVec 32))) )
))
(declare-fun lt!247843 () SeekEntryResult!4873)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541996 (= res!336623 (or (= lt!247843 (MissingZero!4873 i!1153)) (= lt!247843 (MissingVacant!4873 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34253 0))(
  ( (array!34254 (arr!16459 (Array (_ BitVec 32) (_ BitVec 64))) (size!16823 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34253)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34253 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!541996 (= lt!247843 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541997 () Bool)

(declare-fun res!336627 () Bool)

(assert (=> b!541997 (=> (not res!336627) (not e!313797))))

(declare-datatypes ((List!10485 0))(
  ( (Nil!10482) (Cons!10481 (h!11436 (_ BitVec 64)) (t!16705 List!10485)) )
))
(declare-fun arrayNoDuplicates!0 (array!34253 (_ BitVec 32) List!10485) Bool)

(assert (=> b!541997 (= res!336627 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10482))))

(declare-fun b!541998 () Bool)

(declare-fun res!336625 () Bool)

(assert (=> b!541998 (=> (not res!336625) (not e!313797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34253 (_ BitVec 32)) Bool)

(assert (=> b!541998 (= res!336625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!336622 () Bool)

(assert (=> start!49246 (=> (not res!336622) (not e!313795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49246 (= res!336622 (validMask!0 mask!3216))))

(assert (=> start!49246 e!313795))

(assert (=> start!49246 true))

(declare-fun array_inv!12318 (array!34253) Bool)

(assert (=> start!49246 (array_inv!12318 a!3154)))

(declare-fun b!541999 () Bool)

(declare-fun res!336624 () Bool)

(assert (=> b!541999 (=> (not res!336624) (not e!313795))))

(declare-fun arrayContainsKey!0 (array!34253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541999 (= res!336624 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542000 () Bool)

(declare-fun res!336619 () Bool)

(assert (=> b!542000 (=> (not res!336619) (not e!313795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542000 (= res!336619 (validKeyInArray!0 k0!1998))))

(declare-fun b!542001 () Bool)

(declare-fun res!336621 () Bool)

(assert (=> b!542001 (=> (not res!336621) (not e!313797))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34253 (_ BitVec 32)) SeekEntryResult!4873)

(assert (=> b!542001 (= res!336621 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16459 a!3154) j!147) a!3154 mask!3216) (Intermediate!4873 false resIndex!32 resX!32)))))

(declare-fun b!542002 () Bool)

(assert (=> b!542002 (= e!313797 false)))

(declare-fun lt!247842 () SeekEntryResult!4873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542002 (= lt!247842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16459 a!3154) j!147) mask!3216) (select (arr!16459 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542003 () Bool)

(declare-fun res!336626 () Bool)

(assert (=> b!542003 (=> (not res!336626) (not e!313795))))

(assert (=> b!542003 (= res!336626 (validKeyInArray!0 (select (arr!16459 a!3154) j!147)))))

(declare-fun b!542004 () Bool)

(declare-fun res!336620 () Bool)

(assert (=> b!542004 (=> (not res!336620) (not e!313797))))

(assert (=> b!542004 (= res!336620 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16823 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16823 a!3154)) (= (select (arr!16459 a!3154) resIndex!32) (select (arr!16459 a!3154) j!147))))))

(declare-fun b!542005 () Bool)

(declare-fun res!336628 () Bool)

(assert (=> b!542005 (=> (not res!336628) (not e!313795))))

(assert (=> b!542005 (= res!336628 (and (= (size!16823 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16823 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16823 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49246 res!336622) b!542005))

(assert (= (and b!542005 res!336628) b!542003))

(assert (= (and b!542003 res!336626) b!542000))

(assert (= (and b!542000 res!336619) b!541999))

(assert (= (and b!541999 res!336624) b!541996))

(assert (= (and b!541996 res!336623) b!541998))

(assert (= (and b!541998 res!336625) b!541997))

(assert (= (and b!541997 res!336627) b!542004))

(assert (= (and b!542004 res!336620) b!542001))

(assert (= (and b!542001 res!336621) b!542002))

(declare-fun m!520555 () Bool)

(assert (=> b!542001 m!520555))

(assert (=> b!542001 m!520555))

(declare-fun m!520557 () Bool)

(assert (=> b!542001 m!520557))

(declare-fun m!520559 () Bool)

(assert (=> start!49246 m!520559))

(declare-fun m!520561 () Bool)

(assert (=> start!49246 m!520561))

(declare-fun m!520563 () Bool)

(assert (=> b!542000 m!520563))

(declare-fun m!520565 () Bool)

(assert (=> b!541999 m!520565))

(declare-fun m!520567 () Bool)

(assert (=> b!541998 m!520567))

(declare-fun m!520569 () Bool)

(assert (=> b!541997 m!520569))

(assert (=> b!542003 m!520555))

(assert (=> b!542003 m!520555))

(declare-fun m!520571 () Bool)

(assert (=> b!542003 m!520571))

(assert (=> b!542002 m!520555))

(assert (=> b!542002 m!520555))

(declare-fun m!520573 () Bool)

(assert (=> b!542002 m!520573))

(assert (=> b!542002 m!520573))

(assert (=> b!542002 m!520555))

(declare-fun m!520575 () Bool)

(assert (=> b!542002 m!520575))

(declare-fun m!520577 () Bool)

(assert (=> b!542004 m!520577))

(assert (=> b!542004 m!520555))

(declare-fun m!520579 () Bool)

(assert (=> b!541996 m!520579))

(check-sat (not b!541998) (not start!49246) (not b!542000) (not b!542003) (not b!542001) (not b!541997) (not b!541996) (not b!542002) (not b!541999))
(check-sat)
