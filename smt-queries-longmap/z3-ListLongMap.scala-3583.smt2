; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49286 () Bool)

(assert start!49286)

(declare-fun b!542646 () Bool)

(declare-fun res!337206 () Bool)

(declare-fun e!314036 () Bool)

(assert (=> b!542646 (=> (not res!337206) (not e!314036))))

(declare-datatypes ((SeekEntryResult!4938 0))(
  ( (MissingZero!4938 (index!21976 (_ BitVec 32))) (Found!4938 (index!21977 (_ BitVec 32))) (Intermediate!4938 (undefined!5750 Bool) (index!21978 (_ BitVec 32)) (x!50889 (_ BitVec 32))) (Undefined!4938) (MissingVacant!4938 (index!21979 (_ BitVec 32))) )
))
(declare-fun lt!247973 () SeekEntryResult!4938)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34294 0))(
  ( (array!34295 (arr!16480 (Array (_ BitVec 32) (_ BitVec 64))) (size!16844 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34294 (_ BitVec 32)) SeekEntryResult!4938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542646 (= res!337206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16480 a!3154) j!147) mask!3216) (select (arr!16480 a!3154) j!147) a!3154 mask!3216) lt!247973))))

(declare-fun b!542647 () Bool)

(declare-fun res!337207 () Bool)

(declare-fun e!314035 () Bool)

(assert (=> b!542647 (=> (not res!337207) (not e!314035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34294 (_ BitVec 32)) Bool)

(assert (=> b!542647 (= res!337207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542648 () Bool)

(declare-fun res!337197 () Bool)

(declare-fun e!314037 () Bool)

(assert (=> b!542648 (=> (not res!337197) (not e!314037))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542648 (= res!337197 (and (= (size!16844 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16844 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16844 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542649 () Bool)

(assert (=> b!542649 (= e!314037 e!314035)))

(declare-fun res!337205 () Bool)

(assert (=> b!542649 (=> (not res!337205) (not e!314035))))

(declare-fun lt!247975 () SeekEntryResult!4938)

(assert (=> b!542649 (= res!337205 (or (= lt!247975 (MissingZero!4938 i!1153)) (= lt!247975 (MissingVacant!4938 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34294 (_ BitVec 32)) SeekEntryResult!4938)

(assert (=> b!542649 (= lt!247975 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542650 () Bool)

(declare-fun res!337201 () Bool)

(assert (=> b!542650 (=> (not res!337201) (not e!314037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542650 (= res!337201 (validKeyInArray!0 (select (arr!16480 a!3154) j!147)))))

(declare-fun b!542651 () Bool)

(assert (=> b!542651 (= e!314035 e!314036)))

(declare-fun res!337200 () Bool)

(assert (=> b!542651 (=> (not res!337200) (not e!314036))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542651 (= res!337200 (= lt!247973 (Intermediate!4938 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!542651 (= lt!247973 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16480 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542652 () Bool)

(declare-fun res!337198 () Bool)

(assert (=> b!542652 (=> (not res!337198) (not e!314035))))

(declare-datatypes ((List!10599 0))(
  ( (Nil!10596) (Cons!10595 (h!11550 (_ BitVec 64)) (t!16827 List!10599)) )
))
(declare-fun arrayNoDuplicates!0 (array!34294 (_ BitVec 32) List!10599) Bool)

(assert (=> b!542652 (= res!337198 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10596))))

(declare-fun b!542654 () Bool)

(declare-fun res!337199 () Bool)

(assert (=> b!542654 (=> (not res!337199) (not e!314035))))

(assert (=> b!542654 (= res!337199 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16844 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16844 a!3154)) (= (select (arr!16480 a!3154) resIndex!32) (select (arr!16480 a!3154) j!147))))))

(declare-fun b!542655 () Bool)

(declare-fun res!337208 () Bool)

(assert (=> b!542655 (=> (not res!337208) (not e!314037))))

(declare-fun arrayContainsKey!0 (array!34294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542655 (= res!337208 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542656 () Bool)

(declare-fun res!337203 () Bool)

(assert (=> b!542656 (=> (not res!337203) (not e!314037))))

(assert (=> b!542656 (= res!337203 (validKeyInArray!0 k0!1998))))

(declare-fun b!542657 () Bool)

(assert (=> b!542657 (= e!314036 false)))

(declare-fun lt!247974 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542657 (= lt!247974 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542653 () Bool)

(declare-fun res!337204 () Bool)

(assert (=> b!542653 (=> (not res!337204) (not e!314036))))

(assert (=> b!542653 (= res!337204 (and (not (= (select (arr!16480 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16480 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16480 a!3154) index!1177) (select (arr!16480 a!3154) j!147)))))))

(declare-fun res!337202 () Bool)

(assert (=> start!49286 (=> (not res!337202) (not e!314037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49286 (= res!337202 (validMask!0 mask!3216))))

(assert (=> start!49286 e!314037))

(assert (=> start!49286 true))

(declare-fun array_inv!12276 (array!34294) Bool)

(assert (=> start!49286 (array_inv!12276 a!3154)))

(assert (= (and start!49286 res!337202) b!542648))

(assert (= (and b!542648 res!337197) b!542650))

(assert (= (and b!542650 res!337201) b!542656))

(assert (= (and b!542656 res!337203) b!542655))

(assert (= (and b!542655 res!337208) b!542649))

(assert (= (and b!542649 res!337205) b!542647))

(assert (= (and b!542647 res!337207) b!542652))

(assert (= (and b!542652 res!337198) b!542654))

(assert (= (and b!542654 res!337199) b!542651))

(assert (= (and b!542651 res!337200) b!542646))

(assert (= (and b!542646 res!337206) b!542653))

(assert (= (and b!542653 res!337204) b!542657))

(declare-fun m!520869 () Bool)

(assert (=> b!542651 m!520869))

(assert (=> b!542651 m!520869))

(declare-fun m!520871 () Bool)

(assert (=> b!542651 m!520871))

(declare-fun m!520873 () Bool)

(assert (=> b!542649 m!520873))

(declare-fun m!520875 () Bool)

(assert (=> b!542653 m!520875))

(assert (=> b!542653 m!520869))

(assert (=> b!542646 m!520869))

(assert (=> b!542646 m!520869))

(declare-fun m!520877 () Bool)

(assert (=> b!542646 m!520877))

(assert (=> b!542646 m!520877))

(assert (=> b!542646 m!520869))

(declare-fun m!520879 () Bool)

(assert (=> b!542646 m!520879))

(declare-fun m!520881 () Bool)

(assert (=> b!542655 m!520881))

(declare-fun m!520883 () Bool)

(assert (=> start!49286 m!520883))

(declare-fun m!520885 () Bool)

(assert (=> start!49286 m!520885))

(assert (=> b!542650 m!520869))

(assert (=> b!542650 m!520869))

(declare-fun m!520887 () Bool)

(assert (=> b!542650 m!520887))

(declare-fun m!520889 () Bool)

(assert (=> b!542652 m!520889))

(declare-fun m!520891 () Bool)

(assert (=> b!542654 m!520891))

(assert (=> b!542654 m!520869))

(declare-fun m!520893 () Bool)

(assert (=> b!542656 m!520893))

(declare-fun m!520895 () Bool)

(assert (=> b!542657 m!520895))

(declare-fun m!520897 () Bool)

(assert (=> b!542647 m!520897))

(check-sat (not b!542657) (not b!542647) (not start!49286) (not b!542651) (not b!542649) (not b!542652) (not b!542656) (not b!542655) (not b!542650) (not b!542646))
(check-sat)
