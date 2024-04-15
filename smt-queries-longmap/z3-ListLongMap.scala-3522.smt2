; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48690 () Bool)

(assert start!48690)

(declare-fun b!534986 () Bool)

(declare-fun res!330338 () Bool)

(declare-fun e!310806 () Bool)

(assert (=> b!534986 (=> (not res!330338) (not e!310806))))

(declare-datatypes ((array!33912 0))(
  ( (array!33913 (arr!16295 (Array (_ BitVec 32) (_ BitVec 64))) (size!16660 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33912)

(declare-datatypes ((List!10453 0))(
  ( (Nil!10450) (Cons!10449 (h!11392 (_ BitVec 64)) (t!16672 List!10453)) )
))
(declare-fun arrayNoDuplicates!0 (array!33912 (_ BitVec 32) List!10453) Bool)

(assert (=> b!534986 (= res!330338 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10450))))

(declare-fun e!310805 () Bool)

(declare-fun b!534987 () Bool)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534987 (= e!310805 (not (validKeyInArray!0 (select (store (arr!16295 a!3154) i!1153 k0!1998) j!147))))))

(declare-fun b!534988 () Bool)

(declare-fun res!330333 () Bool)

(declare-fun e!310804 () Bool)

(assert (=> b!534988 (=> (not res!330333) (not e!310804))))

(declare-fun arrayContainsKey!0 (array!33912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534988 (= res!330333 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534989 () Bool)

(declare-fun res!330335 () Bool)

(assert (=> b!534989 (=> (not res!330335) (not e!310804))))

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!534989 (= res!330335 (and (= (size!16660 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16660 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16660 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534990 () Bool)

(declare-fun res!330339 () Bool)

(assert (=> b!534990 (=> (not res!330339) (not e!310805))))

(declare-datatypes ((SeekEntryResult!4750 0))(
  ( (MissingZero!4750 (index!21224 (_ BitVec 32))) (Found!4750 (index!21225 (_ BitVec 32))) (Intermediate!4750 (undefined!5562 Bool) (index!21226 (_ BitVec 32)) (x!50184 (_ BitVec 32))) (Undefined!4750) (MissingVacant!4750 (index!21227 (_ BitVec 32))) )
))
(declare-fun lt!245557 () SeekEntryResult!4750)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33912 (_ BitVec 32)) SeekEntryResult!4750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534990 (= res!330339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16295 a!3154) j!147) mask!3216) (select (arr!16295 a!3154) j!147) a!3154 mask!3216) lt!245557))))

(declare-fun b!534991 () Bool)

(declare-fun res!330342 () Bool)

(assert (=> b!534991 (=> (not res!330342) (not e!310805))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!534991 (= res!330342 (and (not (= (select (arr!16295 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16295 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16295 a!3154) index!1177) (select (arr!16295 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!534992 () Bool)

(assert (=> b!534992 (= e!310804 e!310806)))

(declare-fun res!330337 () Bool)

(assert (=> b!534992 (=> (not res!330337) (not e!310806))))

(declare-fun lt!245556 () SeekEntryResult!4750)

(assert (=> b!534992 (= res!330337 (or (= lt!245556 (MissingZero!4750 i!1153)) (= lt!245556 (MissingVacant!4750 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33912 (_ BitVec 32)) SeekEntryResult!4750)

(assert (=> b!534992 (= lt!245556 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534993 () Bool)

(assert (=> b!534993 (= e!310806 e!310805)))

(declare-fun res!330343 () Bool)

(assert (=> b!534993 (=> (not res!330343) (not e!310805))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534993 (= res!330343 (= lt!245557 (Intermediate!4750 false resIndex!32 resX!32)))))

(assert (=> b!534993 (= lt!245557 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16295 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534995 () Bool)

(declare-fun res!330334 () Bool)

(assert (=> b!534995 (=> (not res!330334) (not e!310806))))

(assert (=> b!534995 (= res!330334 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16660 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16660 a!3154)) (= (select (arr!16295 a!3154) resIndex!32) (select (arr!16295 a!3154) j!147))))))

(declare-fun b!534996 () Bool)

(declare-fun res!330341 () Bool)

(assert (=> b!534996 (=> (not res!330341) (not e!310806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33912 (_ BitVec 32)) Bool)

(assert (=> b!534996 (= res!330341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534997 () Bool)

(declare-fun res!330344 () Bool)

(assert (=> b!534997 (=> (not res!330344) (not e!310804))))

(assert (=> b!534997 (= res!330344 (validKeyInArray!0 k0!1998))))

(declare-fun res!330340 () Bool)

(assert (=> start!48690 (=> (not res!330340) (not e!310804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48690 (= res!330340 (validMask!0 mask!3216))))

(assert (=> start!48690 e!310804))

(assert (=> start!48690 true))

(declare-fun array_inv!12178 (array!33912) Bool)

(assert (=> start!48690 (array_inv!12178 a!3154)))

(declare-fun b!534994 () Bool)

(declare-fun res!330336 () Bool)

(assert (=> b!534994 (=> (not res!330336) (not e!310804))))

(assert (=> b!534994 (= res!330336 (validKeyInArray!0 (select (arr!16295 a!3154) j!147)))))

(assert (= (and start!48690 res!330340) b!534989))

(assert (= (and b!534989 res!330335) b!534994))

(assert (= (and b!534994 res!330336) b!534997))

(assert (= (and b!534997 res!330344) b!534988))

(assert (= (and b!534988 res!330333) b!534992))

(assert (= (and b!534992 res!330337) b!534996))

(assert (= (and b!534996 res!330341) b!534986))

(assert (= (and b!534986 res!330338) b!534995))

(assert (= (and b!534995 res!330334) b!534993))

(assert (= (and b!534993 res!330343) b!534990))

(assert (= (and b!534990 res!330339) b!534991))

(assert (= (and b!534991 res!330342) b!534987))

(declare-fun m!514105 () Bool)

(assert (=> b!534997 m!514105))

(declare-fun m!514107 () Bool)

(assert (=> b!534996 m!514107))

(declare-fun m!514109 () Bool)

(assert (=> start!48690 m!514109))

(declare-fun m!514111 () Bool)

(assert (=> start!48690 m!514111))

(declare-fun m!514113 () Bool)

(assert (=> b!534993 m!514113))

(assert (=> b!534993 m!514113))

(declare-fun m!514115 () Bool)

(assert (=> b!534993 m!514115))

(declare-fun m!514117 () Bool)

(assert (=> b!534991 m!514117))

(assert (=> b!534991 m!514113))

(declare-fun m!514119 () Bool)

(assert (=> b!534987 m!514119))

(declare-fun m!514121 () Bool)

(assert (=> b!534987 m!514121))

(assert (=> b!534987 m!514121))

(declare-fun m!514123 () Bool)

(assert (=> b!534987 m!514123))

(assert (=> b!534994 m!514113))

(assert (=> b!534994 m!514113))

(declare-fun m!514125 () Bool)

(assert (=> b!534994 m!514125))

(declare-fun m!514127 () Bool)

(assert (=> b!534995 m!514127))

(assert (=> b!534995 m!514113))

(declare-fun m!514129 () Bool)

(assert (=> b!534992 m!514129))

(declare-fun m!514131 () Bool)

(assert (=> b!534988 m!514131))

(assert (=> b!534990 m!514113))

(assert (=> b!534990 m!514113))

(declare-fun m!514133 () Bool)

(assert (=> b!534990 m!514133))

(assert (=> b!534990 m!514133))

(assert (=> b!534990 m!514113))

(declare-fun m!514135 () Bool)

(assert (=> b!534990 m!514135))

(declare-fun m!514137 () Bool)

(assert (=> b!534986 m!514137))

(check-sat (not b!534986) (not b!534994) (not b!534993) (not start!48690) (not b!534996) (not b!534990) (not b!534997) (not b!534987) (not b!534988) (not b!534992))
(check-sat)
