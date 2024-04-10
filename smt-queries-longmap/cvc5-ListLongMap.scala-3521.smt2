; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48696 () Bool)

(assert start!48696)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33908 0))(
  ( (array!33909 (arr!16293 (Array (_ BitVec 32) (_ BitVec 64))) (size!16657 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33908)

(declare-fun e!310942 () Bool)

(declare-fun b!535156 () Bool)

(assert (=> b!535156 (= e!310942 (and (not (= (select (arr!16293 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16293 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16293 a!3154) index!1177) (select (arr!16293 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535157 () Bool)

(declare-fun res!330370 () Bool)

(declare-fun e!310943 () Bool)

(assert (=> b!535157 (=> (not res!330370) (not e!310943))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535157 (= res!330370 (validKeyInArray!0 k!1998))))

(declare-fun b!535158 () Bool)

(declare-fun res!330371 () Bool)

(assert (=> b!535158 (=> (not res!330371) (not e!310942))))

(declare-datatypes ((SeekEntryResult!4751 0))(
  ( (MissingZero!4751 (index!21228 (_ BitVec 32))) (Found!4751 (index!21229 (_ BitVec 32))) (Intermediate!4751 (undefined!5563 Bool) (index!21230 (_ BitVec 32)) (x!50182 (_ BitVec 32))) (Undefined!4751) (MissingVacant!4751 (index!21231 (_ BitVec 32))) )
))
(declare-fun lt!245772 () SeekEntryResult!4751)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33908 (_ BitVec 32)) SeekEntryResult!4751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535158 (= res!330371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16293 a!3154) j!147) mask!3216) (select (arr!16293 a!3154) j!147) a!3154 mask!3216) lt!245772))))

(declare-fun b!535159 () Bool)

(declare-fun e!310944 () Bool)

(assert (=> b!535159 (= e!310943 e!310944)))

(declare-fun res!330363 () Bool)

(assert (=> b!535159 (=> (not res!330363) (not e!310944))))

(declare-fun lt!245773 () SeekEntryResult!4751)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535159 (= res!330363 (or (= lt!245773 (MissingZero!4751 i!1153)) (= lt!245773 (MissingVacant!4751 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33908 (_ BitVec 32)) SeekEntryResult!4751)

(assert (=> b!535159 (= lt!245773 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535160 () Bool)

(declare-fun res!330369 () Bool)

(assert (=> b!535160 (=> (not res!330369) (not e!310944))))

(declare-datatypes ((List!10412 0))(
  ( (Nil!10409) (Cons!10408 (h!11351 (_ BitVec 64)) (t!16640 List!10412)) )
))
(declare-fun arrayNoDuplicates!0 (array!33908 (_ BitVec 32) List!10412) Bool)

(assert (=> b!535160 (= res!330369 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10409))))

(declare-fun b!535161 () Bool)

(declare-fun res!330368 () Bool)

(assert (=> b!535161 (=> (not res!330368) (not e!310943))))

(assert (=> b!535161 (= res!330368 (and (= (size!16657 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16657 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16657 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535162 () Bool)

(declare-fun res!330361 () Bool)

(assert (=> b!535162 (=> (not res!330361) (not e!310943))))

(declare-fun arrayContainsKey!0 (array!33908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535162 (= res!330361 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!330362 () Bool)

(assert (=> start!48696 (=> (not res!330362) (not e!310943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48696 (= res!330362 (validMask!0 mask!3216))))

(assert (=> start!48696 e!310943))

(assert (=> start!48696 true))

(declare-fun array_inv!12089 (array!33908) Bool)

(assert (=> start!48696 (array_inv!12089 a!3154)))

(declare-fun b!535163 () Bool)

(declare-fun res!330367 () Bool)

(assert (=> b!535163 (=> (not res!330367) (not e!310943))))

(assert (=> b!535163 (= res!330367 (validKeyInArray!0 (select (arr!16293 a!3154) j!147)))))

(declare-fun b!535164 () Bool)

(declare-fun res!330365 () Bool)

(assert (=> b!535164 (=> (not res!330365) (not e!310944))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535164 (= res!330365 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16657 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16657 a!3154)) (= (select (arr!16293 a!3154) resIndex!32) (select (arr!16293 a!3154) j!147))))))

(declare-fun b!535165 () Bool)

(assert (=> b!535165 (= e!310944 e!310942)))

(declare-fun res!330366 () Bool)

(assert (=> b!535165 (=> (not res!330366) (not e!310942))))

(assert (=> b!535165 (= res!330366 (= lt!245772 (Intermediate!4751 false resIndex!32 resX!32)))))

(assert (=> b!535165 (= lt!245772 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16293 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535166 () Bool)

(declare-fun res!330364 () Bool)

(assert (=> b!535166 (=> (not res!330364) (not e!310944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33908 (_ BitVec 32)) Bool)

(assert (=> b!535166 (= res!330364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48696 res!330362) b!535161))

(assert (= (and b!535161 res!330368) b!535163))

(assert (= (and b!535163 res!330367) b!535157))

(assert (= (and b!535157 res!330370) b!535162))

(assert (= (and b!535162 res!330361) b!535159))

(assert (= (and b!535159 res!330363) b!535166))

(assert (= (and b!535166 res!330364) b!535160))

(assert (= (and b!535160 res!330369) b!535164))

(assert (= (and b!535164 res!330365) b!535165))

(assert (= (and b!535165 res!330366) b!535158))

(assert (= (and b!535158 res!330371) b!535156))

(declare-fun m!514773 () Bool)

(assert (=> start!48696 m!514773))

(declare-fun m!514775 () Bool)

(assert (=> start!48696 m!514775))

(declare-fun m!514777 () Bool)

(assert (=> b!535156 m!514777))

(declare-fun m!514779 () Bool)

(assert (=> b!535156 m!514779))

(declare-fun m!514781 () Bool)

(assert (=> b!535164 m!514781))

(assert (=> b!535164 m!514779))

(declare-fun m!514783 () Bool)

(assert (=> b!535157 m!514783))

(assert (=> b!535165 m!514779))

(assert (=> b!535165 m!514779))

(declare-fun m!514785 () Bool)

(assert (=> b!535165 m!514785))

(declare-fun m!514787 () Bool)

(assert (=> b!535166 m!514787))

(declare-fun m!514789 () Bool)

(assert (=> b!535160 m!514789))

(assert (=> b!535158 m!514779))

(assert (=> b!535158 m!514779))

(declare-fun m!514791 () Bool)

(assert (=> b!535158 m!514791))

(assert (=> b!535158 m!514791))

(assert (=> b!535158 m!514779))

(declare-fun m!514793 () Bool)

(assert (=> b!535158 m!514793))

(assert (=> b!535163 m!514779))

(assert (=> b!535163 m!514779))

(declare-fun m!514795 () Bool)

(assert (=> b!535163 m!514795))

(declare-fun m!514797 () Bool)

(assert (=> b!535159 m!514797))

(declare-fun m!514799 () Bool)

(assert (=> b!535162 m!514799))

(push 1)

