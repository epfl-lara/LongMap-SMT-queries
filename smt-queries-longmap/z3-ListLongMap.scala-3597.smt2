; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49558 () Bool)

(assert start!49558)

(declare-fun b!545054 () Bool)

(declare-fun res!339054 () Bool)

(declare-fun e!315124 () Bool)

(assert (=> b!545054 (=> (not res!339054) (not e!315124))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34376 0))(
  ( (array!34377 (arr!16516 (Array (_ BitVec 32) (_ BitVec 64))) (size!16880 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34376)

(declare-datatypes ((SeekEntryResult!4930 0))(
  ( (MissingZero!4930 (index!21944 (_ BitVec 32))) (Found!4930 (index!21945 (_ BitVec 32))) (Intermediate!4930 (undefined!5742 Bool) (index!21946 (_ BitVec 32)) (x!51020 (_ BitVec 32))) (Undefined!4930) (MissingVacant!4930 (index!21947 (_ BitVec 32))) )
))
(declare-fun lt!248745 () SeekEntryResult!4930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34376 (_ BitVec 32)) SeekEntryResult!4930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545054 (= res!339054 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16516 a!3154) j!147) mask!3216) (select (arr!16516 a!3154) j!147) a!3154 mask!3216) lt!248745))))

(declare-fun b!545055 () Bool)

(declare-fun e!315126 () Bool)

(declare-fun e!315125 () Bool)

(assert (=> b!545055 (= e!315126 e!315125)))

(declare-fun res!339064 () Bool)

(assert (=> b!545055 (=> (not res!339064) (not e!315125))))

(declare-fun lt!248746 () SeekEntryResult!4930)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545055 (= res!339064 (or (= lt!248746 (MissingZero!4930 i!1153)) (= lt!248746 (MissingVacant!4930 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34376 (_ BitVec 32)) SeekEntryResult!4930)

(assert (=> b!545055 (= lt!248746 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545056 () Bool)

(declare-fun res!339056 () Bool)

(assert (=> b!545056 (=> (not res!339056) (not e!315126))))

(declare-fun arrayContainsKey!0 (array!34376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545056 (= res!339056 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545057 () Bool)

(declare-fun res!339057 () Bool)

(assert (=> b!545057 (=> (not res!339057) (not e!315125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34376 (_ BitVec 32)) Bool)

(assert (=> b!545057 (= res!339057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545058 () Bool)

(declare-fun res!339061 () Bool)

(assert (=> b!545058 (=> (not res!339061) (not e!315125))))

(declare-datatypes ((List!10542 0))(
  ( (Nil!10539) (Cons!10538 (h!11502 (_ BitVec 64)) (t!16762 List!10542)) )
))
(declare-fun arrayNoDuplicates!0 (array!34376 (_ BitVec 32) List!10542) Bool)

(assert (=> b!545058 (= res!339061 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10539))))

(declare-fun res!339060 () Bool)

(assert (=> start!49558 (=> (not res!339060) (not e!315126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49558 (= res!339060 (validMask!0 mask!3216))))

(assert (=> start!49558 e!315126))

(assert (=> start!49558 true))

(declare-fun array_inv!12375 (array!34376) Bool)

(assert (=> start!49558 (array_inv!12375 a!3154)))

(declare-fun b!545059 () Bool)

(declare-fun res!339063 () Bool)

(assert (=> b!545059 (=> (not res!339063) (not e!315126))))

(assert (=> b!545059 (= res!339063 (and (= (size!16880 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16880 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16880 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545060 () Bool)

(declare-fun res!339059 () Bool)

(assert (=> b!545060 (=> (not res!339059) (not e!315126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545060 (= res!339059 (validKeyInArray!0 k0!1998))))

(declare-fun b!545061 () Bool)

(assert (=> b!545061 (= e!315124 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248744 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545061 (= lt!248744 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!545062 () Bool)

(assert (=> b!545062 (= e!315125 e!315124)))

(declare-fun res!339062 () Bool)

(assert (=> b!545062 (=> (not res!339062) (not e!315124))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545062 (= res!339062 (= lt!248745 (Intermediate!4930 false resIndex!32 resX!32)))))

(assert (=> b!545062 (= lt!248745 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16516 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545063 () Bool)

(declare-fun res!339053 () Bool)

(assert (=> b!545063 (=> (not res!339053) (not e!315124))))

(assert (=> b!545063 (= res!339053 (and (not (= (select (arr!16516 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16516 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16516 a!3154) index!1177) (select (arr!16516 a!3154) j!147)))))))

(declare-fun b!545064 () Bool)

(declare-fun res!339058 () Bool)

(assert (=> b!545064 (=> (not res!339058) (not e!315126))))

(assert (=> b!545064 (= res!339058 (validKeyInArray!0 (select (arr!16516 a!3154) j!147)))))

(declare-fun b!545065 () Bool)

(declare-fun res!339055 () Bool)

(assert (=> b!545065 (=> (not res!339055) (not e!315125))))

(assert (=> b!545065 (= res!339055 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16880 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16880 a!3154)) (= (select (arr!16516 a!3154) resIndex!32) (select (arr!16516 a!3154) j!147))))))

(assert (= (and start!49558 res!339060) b!545059))

(assert (= (and b!545059 res!339063) b!545064))

(assert (= (and b!545064 res!339058) b!545060))

(assert (= (and b!545060 res!339059) b!545056))

(assert (= (and b!545056 res!339056) b!545055))

(assert (= (and b!545055 res!339064) b!545057))

(assert (= (and b!545057 res!339057) b!545058))

(assert (= (and b!545058 res!339061) b!545065))

(assert (= (and b!545065 res!339055) b!545062))

(assert (= (and b!545062 res!339062) b!545054))

(assert (= (and b!545054 res!339054) b!545063))

(assert (= (and b!545063 res!339053) b!545061))

(declare-fun m!522943 () Bool)

(assert (=> b!545063 m!522943))

(declare-fun m!522945 () Bool)

(assert (=> b!545063 m!522945))

(declare-fun m!522947 () Bool)

(assert (=> b!545055 m!522947))

(declare-fun m!522949 () Bool)

(assert (=> b!545061 m!522949))

(declare-fun m!522951 () Bool)

(assert (=> b!545060 m!522951))

(declare-fun m!522953 () Bool)

(assert (=> b!545057 m!522953))

(declare-fun m!522955 () Bool)

(assert (=> b!545058 m!522955))

(declare-fun m!522957 () Bool)

(assert (=> b!545056 m!522957))

(assert (=> b!545062 m!522945))

(assert (=> b!545062 m!522945))

(declare-fun m!522959 () Bool)

(assert (=> b!545062 m!522959))

(declare-fun m!522961 () Bool)

(assert (=> b!545065 m!522961))

(assert (=> b!545065 m!522945))

(assert (=> b!545054 m!522945))

(assert (=> b!545054 m!522945))

(declare-fun m!522963 () Bool)

(assert (=> b!545054 m!522963))

(assert (=> b!545054 m!522963))

(assert (=> b!545054 m!522945))

(declare-fun m!522965 () Bool)

(assert (=> b!545054 m!522965))

(declare-fun m!522967 () Bool)

(assert (=> start!49558 m!522967))

(declare-fun m!522969 () Bool)

(assert (=> start!49558 m!522969))

(assert (=> b!545064 m!522945))

(assert (=> b!545064 m!522945))

(declare-fun m!522971 () Bool)

(assert (=> b!545064 m!522971))

(check-sat (not b!545058) (not b!545061) (not b!545064) (not b!545055) (not start!49558) (not b!545060) (not b!545062) (not b!545054) (not b!545057) (not b!545056))
(check-sat)
