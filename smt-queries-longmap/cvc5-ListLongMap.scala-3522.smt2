; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48702 () Bool)

(assert start!48702)

(declare-fun b!535257 () Bool)

(declare-fun res!330473 () Bool)

(declare-fun e!310978 () Bool)

(assert (=> b!535257 (=> (not res!330473) (not e!310978))))

(declare-datatypes ((array!33914 0))(
  ( (array!33915 (arr!16296 (Array (_ BitVec 32) (_ BitVec 64))) (size!16660 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33914)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33914 (_ BitVec 32)) Bool)

(assert (=> b!535257 (= res!330473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!330465 () Bool)

(declare-fun e!310979 () Bool)

(assert (=> start!48702 (=> (not res!330465) (not e!310979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48702 (= res!330465 (validMask!0 mask!3216))))

(assert (=> start!48702 e!310979))

(assert (=> start!48702 true))

(declare-fun array_inv!12092 (array!33914) Bool)

(assert (=> start!48702 (array_inv!12092 a!3154)))

(declare-fun b!535258 () Bool)

(declare-fun res!330471 () Bool)

(assert (=> b!535258 (=> (not res!330471) (not e!310979))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535258 (= res!330471 (and (= (size!16660 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16660 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16660 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535259 () Bool)

(declare-fun res!330472 () Bool)

(declare-fun e!310980 () Bool)

(assert (=> b!535259 (=> (not res!330472) (not e!310980))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535259 (= res!330472 (and (not (= (select (arr!16296 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16296 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16296 a!3154) index!1177) (select (arr!16296 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsle x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535260 () Bool)

(declare-fun res!330467 () Bool)

(assert (=> b!535260 (=> (not res!330467) (not e!310980))))

(declare-datatypes ((SeekEntryResult!4754 0))(
  ( (MissingZero!4754 (index!21240 (_ BitVec 32))) (Found!4754 (index!21241 (_ BitVec 32))) (Intermediate!4754 (undefined!5566 Bool) (index!21242 (_ BitVec 32)) (x!50193 (_ BitVec 32))) (Undefined!4754) (MissingVacant!4754 (index!21243 (_ BitVec 32))) )
))
(declare-fun lt!245790 () SeekEntryResult!4754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33914 (_ BitVec 32)) SeekEntryResult!4754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535260 (= res!330467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16296 a!3154) j!147) mask!3216) (select (arr!16296 a!3154) j!147) a!3154 mask!3216) lt!245790))))

(declare-fun b!535261 () Bool)

(declare-fun res!330463 () Bool)

(assert (=> b!535261 (=> (not res!330463) (not e!310979))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535261 (= res!330463 (validKeyInArray!0 k!1998))))

(declare-fun b!535262 () Bool)

(assert (=> b!535262 (= e!310978 e!310980)))

(declare-fun res!330466 () Bool)

(assert (=> b!535262 (=> (not res!330466) (not e!310980))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535262 (= res!330466 (= lt!245790 (Intermediate!4754 false resIndex!32 resX!32)))))

(assert (=> b!535262 (= lt!245790 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16296 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535263 () Bool)

(assert (=> b!535263 (= e!310979 e!310978)))

(declare-fun res!330470 () Bool)

(assert (=> b!535263 (=> (not res!330470) (not e!310978))))

(declare-fun lt!245791 () SeekEntryResult!4754)

(assert (=> b!535263 (= res!330470 (or (= lt!245791 (MissingZero!4754 i!1153)) (= lt!245791 (MissingVacant!4754 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33914 (_ BitVec 32)) SeekEntryResult!4754)

(assert (=> b!535263 (= lt!245791 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535264 () Bool)

(declare-fun res!330469 () Bool)

(assert (=> b!535264 (=> (not res!330469) (not e!310978))))

(assert (=> b!535264 (= res!330469 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16660 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16660 a!3154)) (= (select (arr!16296 a!3154) resIndex!32) (select (arr!16296 a!3154) j!147))))))

(declare-fun b!535265 () Bool)

(declare-fun res!330462 () Bool)

(assert (=> b!535265 (=> (not res!330462) (not e!310978))))

(declare-datatypes ((List!10415 0))(
  ( (Nil!10412) (Cons!10411 (h!11354 (_ BitVec 64)) (t!16643 List!10415)) )
))
(declare-fun arrayNoDuplicates!0 (array!33914 (_ BitVec 32) List!10415) Bool)

(assert (=> b!535265 (= res!330462 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10412))))

(declare-fun b!535266 () Bool)

(assert (=> b!535266 (= e!310980 (not (validKeyInArray!0 (select (store (arr!16296 a!3154) i!1153 k!1998) j!147))))))

(declare-fun b!535267 () Bool)

(declare-fun res!330464 () Bool)

(assert (=> b!535267 (=> (not res!330464) (not e!310979))))

(declare-fun arrayContainsKey!0 (array!33914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535267 (= res!330464 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535268 () Bool)

(declare-fun res!330468 () Bool)

(assert (=> b!535268 (=> (not res!330468) (not e!310979))))

(assert (=> b!535268 (= res!330468 (validKeyInArray!0 (select (arr!16296 a!3154) j!147)))))

(assert (= (and start!48702 res!330465) b!535258))

(assert (= (and b!535258 res!330471) b!535268))

(assert (= (and b!535268 res!330468) b!535261))

(assert (= (and b!535261 res!330463) b!535267))

(assert (= (and b!535267 res!330464) b!535263))

(assert (= (and b!535263 res!330470) b!535257))

(assert (= (and b!535257 res!330473) b!535265))

(assert (= (and b!535265 res!330462) b!535264))

(assert (= (and b!535264 res!330469) b!535262))

(assert (= (and b!535262 res!330466) b!535260))

(assert (= (and b!535260 res!330467) b!535259))

(assert (= (and b!535259 res!330472) b!535266))

(declare-fun m!514857 () Bool)

(assert (=> b!535260 m!514857))

(assert (=> b!535260 m!514857))

(declare-fun m!514859 () Bool)

(assert (=> b!535260 m!514859))

(assert (=> b!535260 m!514859))

(assert (=> b!535260 m!514857))

(declare-fun m!514861 () Bool)

(assert (=> b!535260 m!514861))

(assert (=> b!535268 m!514857))

(assert (=> b!535268 m!514857))

(declare-fun m!514863 () Bool)

(assert (=> b!535268 m!514863))

(declare-fun m!514865 () Bool)

(assert (=> b!535263 m!514865))

(declare-fun m!514867 () Bool)

(assert (=> start!48702 m!514867))

(declare-fun m!514869 () Bool)

(assert (=> start!48702 m!514869))

(declare-fun m!514871 () Bool)

(assert (=> b!535267 m!514871))

(declare-fun m!514873 () Bool)

(assert (=> b!535257 m!514873))

(declare-fun m!514875 () Bool)

(assert (=> b!535265 m!514875))

(declare-fun m!514877 () Bool)

(assert (=> b!535266 m!514877))

(declare-fun m!514879 () Bool)

(assert (=> b!535266 m!514879))

(assert (=> b!535266 m!514879))

(declare-fun m!514881 () Bool)

(assert (=> b!535266 m!514881))

(declare-fun m!514883 () Bool)

(assert (=> b!535264 m!514883))

(assert (=> b!535264 m!514857))

(assert (=> b!535262 m!514857))

(assert (=> b!535262 m!514857))

(declare-fun m!514885 () Bool)

(assert (=> b!535262 m!514885))

(declare-fun m!514887 () Bool)

(assert (=> b!535259 m!514887))

(assert (=> b!535259 m!514857))

(declare-fun m!514889 () Bool)

(assert (=> b!535261 m!514889))

(push 1)

