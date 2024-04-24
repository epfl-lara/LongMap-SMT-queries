; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48682 () Bool)

(assert start!48682)

(declare-fun b!534996 () Bool)

(declare-fun res!330265 () Bool)

(declare-fun e!310866 () Bool)

(assert (=> b!534996 (=> (not res!330265) (not e!310866))))

(declare-datatypes ((array!33893 0))(
  ( (array!33894 (arr!16285 (Array (_ BitVec 32) (_ BitVec 64))) (size!16649 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33893)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534996 (= res!330265 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534997 () Bool)

(declare-fun res!330257 () Bool)

(declare-fun e!310867 () Bool)

(assert (=> b!534997 (=> (not res!330257) (not e!310867))))

(declare-datatypes ((List!10311 0))(
  ( (Nil!10308) (Cons!10307 (h!11250 (_ BitVec 64)) (t!16531 List!10311)) )
))
(declare-fun arrayNoDuplicates!0 (array!33893 (_ BitVec 32) List!10311) Bool)

(assert (=> b!534997 (= res!330257 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10308))))

(declare-fun b!534998 () Bool)

(assert (=> b!534998 (= e!310866 e!310867)))

(declare-fun res!330259 () Bool)

(assert (=> b!534998 (=> (not res!330259) (not e!310867))))

(declare-datatypes ((SeekEntryResult!4699 0))(
  ( (MissingZero!4699 (index!21020 (_ BitVec 32))) (Found!4699 (index!21021 (_ BitVec 32))) (Intermediate!4699 (undefined!5511 Bool) (index!21022 (_ BitVec 32)) (x!50119 (_ BitVec 32))) (Undefined!4699) (MissingVacant!4699 (index!21023 (_ BitVec 32))) )
))
(declare-fun lt!245767 () SeekEntryResult!4699)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534998 (= res!330259 (or (= lt!245767 (MissingZero!4699 i!1153)) (= lt!245767 (MissingVacant!4699 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33893 (_ BitVec 32)) SeekEntryResult!4699)

(assert (=> b!534998 (= lt!245767 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534999 () Bool)

(declare-fun res!330255 () Bool)

(assert (=> b!534999 (=> (not res!330255) (not e!310867))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!534999 (= res!330255 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16649 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16649 a!3154)) (= (select (arr!16285 a!3154) resIndex!32) (select (arr!16285 a!3154) j!147))))))

(declare-fun b!535000 () Bool)

(declare-fun res!330261 () Bool)

(assert (=> b!535000 (=> (not res!330261) (not e!310866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535000 (= res!330261 (validKeyInArray!0 (select (arr!16285 a!3154) j!147)))))

(declare-fun b!535001 () Bool)

(declare-fun res!330258 () Bool)

(assert (=> b!535001 (=> (not res!330258) (not e!310867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33893 (_ BitVec 32)) Bool)

(assert (=> b!535001 (= res!330258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535002 () Bool)

(declare-fun res!330262 () Bool)

(declare-fun e!310868 () Bool)

(assert (=> b!535002 (=> (not res!330262) (not e!310868))))

(declare-fun lt!245766 () SeekEntryResult!4699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33893 (_ BitVec 32)) SeekEntryResult!4699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535002 (= res!330262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16285 a!3154) j!147) mask!3216) (select (arr!16285 a!3154) j!147) a!3154 mask!3216) lt!245766))))

(declare-fun b!535003 () Bool)

(declare-fun res!330256 () Bool)

(assert (=> b!535003 (=> (not res!330256) (not e!310866))))

(assert (=> b!535003 (= res!330256 (and (= (size!16649 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16649 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16649 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535005 () Bool)

(declare-fun res!330260 () Bool)

(assert (=> b!535005 (=> (not res!330260) (not e!310866))))

(assert (=> b!535005 (= res!330260 (validKeyInArray!0 k0!1998))))

(declare-fun b!535006 () Bool)

(assert (=> b!535006 (= e!310867 e!310868)))

(declare-fun res!330263 () Bool)

(assert (=> b!535006 (=> (not res!330263) (not e!310868))))

(assert (=> b!535006 (= res!330263 (= lt!245766 (Intermediate!4699 false resIndex!32 resX!32)))))

(assert (=> b!535006 (= lt!245766 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16285 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535004 () Bool)

(assert (=> b!535004 (= e!310868 (and (not (= (select (arr!16285 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16285 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16285 a!3154) index!1177) (select (arr!16285 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun res!330264 () Bool)

(assert (=> start!48682 (=> (not res!330264) (not e!310866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48682 (= res!330264 (validMask!0 mask!3216))))

(assert (=> start!48682 e!310866))

(assert (=> start!48682 true))

(declare-fun array_inv!12144 (array!33893) Bool)

(assert (=> start!48682 (array_inv!12144 a!3154)))

(assert (= (and start!48682 res!330264) b!535003))

(assert (= (and b!535003 res!330256) b!535000))

(assert (= (and b!535000 res!330261) b!535005))

(assert (= (and b!535005 res!330260) b!534996))

(assert (= (and b!534996 res!330265) b!534998))

(assert (= (and b!534998 res!330259) b!535001))

(assert (= (and b!535001 res!330258) b!534997))

(assert (= (and b!534997 res!330257) b!534999))

(assert (= (and b!534999 res!330255) b!535006))

(assert (= (and b!535006 res!330263) b!535002))

(assert (= (and b!535002 res!330262) b!535004))

(declare-fun m!514873 () Bool)

(assert (=> b!534998 m!514873))

(declare-fun m!514875 () Bool)

(assert (=> start!48682 m!514875))

(declare-fun m!514877 () Bool)

(assert (=> start!48682 m!514877))

(declare-fun m!514879 () Bool)

(assert (=> b!535006 m!514879))

(assert (=> b!535006 m!514879))

(declare-fun m!514881 () Bool)

(assert (=> b!535006 m!514881))

(declare-fun m!514883 () Bool)

(assert (=> b!534996 m!514883))

(declare-fun m!514885 () Bool)

(assert (=> b!535004 m!514885))

(assert (=> b!535004 m!514879))

(declare-fun m!514887 () Bool)

(assert (=> b!534997 m!514887))

(declare-fun m!514889 () Bool)

(assert (=> b!535001 m!514889))

(assert (=> b!535000 m!514879))

(assert (=> b!535000 m!514879))

(declare-fun m!514891 () Bool)

(assert (=> b!535000 m!514891))

(declare-fun m!514893 () Bool)

(assert (=> b!535005 m!514893))

(declare-fun m!514895 () Bool)

(assert (=> b!534999 m!514895))

(assert (=> b!534999 m!514879))

(assert (=> b!535002 m!514879))

(assert (=> b!535002 m!514879))

(declare-fun m!514897 () Bool)

(assert (=> b!535002 m!514897))

(assert (=> b!535002 m!514897))

(assert (=> b!535002 m!514879))

(declare-fun m!514899 () Bool)

(assert (=> b!535002 m!514899))

(check-sat (not b!535002) (not start!48682) (not b!535006) (not b!535000) (not b!534996) (not b!534997) (not b!535001) (not b!534998) (not b!535005))
(check-sat)
