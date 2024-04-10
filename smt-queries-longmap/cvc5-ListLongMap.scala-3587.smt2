; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49308 () Bool)

(assert start!49308)

(declare-fun b!543042 () Bool)

(declare-fun e!314167 () Bool)

(declare-fun e!314166 () Bool)

(assert (=> b!543042 (= e!314167 e!314166)))

(declare-fun res!337604 () Bool)

(assert (=> b!543042 (=> (not res!337604) (not e!314166))))

(declare-datatypes ((SeekEntryResult!4949 0))(
  ( (MissingZero!4949 (index!22020 (_ BitVec 32))) (Found!4949 (index!22021 (_ BitVec 32))) (Intermediate!4949 (undefined!5761 Bool) (index!22022 (_ BitVec 32)) (x!50932 (_ BitVec 32))) (Undefined!4949) (MissingVacant!4949 (index!22023 (_ BitVec 32))) )
))
(declare-fun lt!248072 () SeekEntryResult!4949)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543042 (= res!337604 (or (= lt!248072 (MissingZero!4949 i!1153)) (= lt!248072 (MissingVacant!4949 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34316 0))(
  ( (array!34317 (arr!16491 (Array (_ BitVec 32) (_ BitVec 64))) (size!16855 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34316)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34316 (_ BitVec 32)) SeekEntryResult!4949)

(assert (=> b!543042 (= lt!248072 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543043 () Bool)

(declare-fun e!314169 () Bool)

(assert (=> b!543043 (= e!314166 e!314169)))

(declare-fun res!337601 () Bool)

(assert (=> b!543043 (=> (not res!337601) (not e!314169))))

(declare-fun lt!248073 () SeekEntryResult!4949)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543043 (= res!337601 (= lt!248073 (Intermediate!4949 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34316 (_ BitVec 32)) SeekEntryResult!4949)

(assert (=> b!543043 (= lt!248073 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16491 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543044 () Bool)

(declare-fun res!337603 () Bool)

(assert (=> b!543044 (=> (not res!337603) (not e!314167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543044 (= res!337603 (validKeyInArray!0 (select (arr!16491 a!3154) j!147)))))

(declare-fun b!543045 () Bool)

(declare-fun res!337599 () Bool)

(assert (=> b!543045 (=> (not res!337599) (not e!314169))))

(assert (=> b!543045 (= res!337599 (and (not (= (select (arr!16491 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16491 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16491 a!3154) index!1177) (select (arr!16491 a!3154) j!147)))))))

(declare-fun b!543046 () Bool)

(declare-fun res!337602 () Bool)

(assert (=> b!543046 (=> (not res!337602) (not e!314167))))

(assert (=> b!543046 (= res!337602 (and (= (size!16855 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16855 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16855 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543047 () Bool)

(declare-fun res!337597 () Bool)

(assert (=> b!543047 (=> (not res!337597) (not e!314167))))

(assert (=> b!543047 (= res!337597 (validKeyInArray!0 k!1998))))

(declare-fun b!543048 () Bool)

(declare-fun res!337598 () Bool)

(assert (=> b!543048 (=> (not res!337598) (not e!314166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34316 (_ BitVec 32)) Bool)

(assert (=> b!543048 (= res!337598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543049 () Bool)

(declare-fun res!337595 () Bool)

(assert (=> b!543049 (=> (not res!337595) (not e!314166))))

(declare-datatypes ((List!10610 0))(
  ( (Nil!10607) (Cons!10606 (h!11561 (_ BitVec 64)) (t!16838 List!10610)) )
))
(declare-fun arrayNoDuplicates!0 (array!34316 (_ BitVec 32) List!10610) Bool)

(assert (=> b!543049 (= res!337595 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10607))))

(declare-fun b!543050 () Bool)

(declare-fun res!337593 () Bool)

(assert (=> b!543050 (=> (not res!337593) (not e!314169))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543050 (= res!337593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16491 a!3154) j!147) mask!3216) (select (arr!16491 a!3154) j!147) a!3154 mask!3216) lt!248073))))

(declare-fun b!543051 () Bool)

(assert (=> b!543051 (= e!314169 false)))

(declare-fun lt!248074 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543051 (= lt!248074 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543052 () Bool)

(declare-fun res!337600 () Bool)

(assert (=> b!543052 (=> (not res!337600) (not e!314167))))

(declare-fun arrayContainsKey!0 (array!34316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543052 (= res!337600 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543053 () Bool)

(declare-fun res!337594 () Bool)

(assert (=> b!543053 (=> (not res!337594) (not e!314166))))

(assert (=> b!543053 (= res!337594 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16855 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16855 a!3154)) (= (select (arr!16491 a!3154) resIndex!32) (select (arr!16491 a!3154) j!147))))))

(declare-fun res!337596 () Bool)

(assert (=> start!49308 (=> (not res!337596) (not e!314167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49308 (= res!337596 (validMask!0 mask!3216))))

(assert (=> start!49308 e!314167))

(assert (=> start!49308 true))

(declare-fun array_inv!12287 (array!34316) Bool)

(assert (=> start!49308 (array_inv!12287 a!3154)))

(assert (= (and start!49308 res!337596) b!543046))

(assert (= (and b!543046 res!337602) b!543044))

(assert (= (and b!543044 res!337603) b!543047))

(assert (= (and b!543047 res!337597) b!543052))

(assert (= (and b!543052 res!337600) b!543042))

(assert (= (and b!543042 res!337604) b!543048))

(assert (= (and b!543048 res!337598) b!543049))

(assert (= (and b!543049 res!337595) b!543053))

(assert (= (and b!543053 res!337594) b!543043))

(assert (= (and b!543043 res!337601) b!543050))

(assert (= (and b!543050 res!337593) b!543045))

(assert (= (and b!543045 res!337599) b!543051))

(declare-fun m!521199 () Bool)

(assert (=> b!543048 m!521199))

(declare-fun m!521201 () Bool)

(assert (=> b!543045 m!521201))

(declare-fun m!521203 () Bool)

(assert (=> b!543045 m!521203))

(declare-fun m!521205 () Bool)

(assert (=> b!543049 m!521205))

(declare-fun m!521207 () Bool)

(assert (=> start!49308 m!521207))

(declare-fun m!521209 () Bool)

(assert (=> start!49308 m!521209))

(declare-fun m!521211 () Bool)

(assert (=> b!543053 m!521211))

(assert (=> b!543053 m!521203))

(declare-fun m!521213 () Bool)

(assert (=> b!543051 m!521213))

(assert (=> b!543050 m!521203))

(assert (=> b!543050 m!521203))

(declare-fun m!521215 () Bool)

(assert (=> b!543050 m!521215))

(assert (=> b!543050 m!521215))

(assert (=> b!543050 m!521203))

(declare-fun m!521217 () Bool)

(assert (=> b!543050 m!521217))

(assert (=> b!543043 m!521203))

(assert (=> b!543043 m!521203))

(declare-fun m!521219 () Bool)

(assert (=> b!543043 m!521219))

(declare-fun m!521221 () Bool)

(assert (=> b!543047 m!521221))

(declare-fun m!521223 () Bool)

(assert (=> b!543042 m!521223))

(assert (=> b!543044 m!521203))

(assert (=> b!543044 m!521203))

(declare-fun m!521225 () Bool)

(assert (=> b!543044 m!521225))

(declare-fun m!521227 () Bool)

(assert (=> b!543052 m!521227))

(push 1)

