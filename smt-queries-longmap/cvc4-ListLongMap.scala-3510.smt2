; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48634 () Bool)

(assert start!48634)

(declare-fun b!534206 () Bool)

(declare-fun res!329417 () Bool)

(declare-fun e!310643 () Bool)

(assert (=> b!534206 (=> (not res!329417) (not e!310643))))

(declare-datatypes ((array!33846 0))(
  ( (array!33847 (arr!16262 (Array (_ BitVec 32) (_ BitVec 64))) (size!16626 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33846)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33846 (_ BitVec 32)) Bool)

(assert (=> b!534206 (= res!329417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534207 () Bool)

(declare-fun res!329413 () Bool)

(declare-fun e!310642 () Bool)

(assert (=> b!534207 (=> (not res!329413) (not e!310642))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534207 (= res!329413 (validKeyInArray!0 (select (arr!16262 a!3154) j!147)))))

(declare-fun b!534208 () Bool)

(declare-fun res!329414 () Bool)

(assert (=> b!534208 (=> (not res!329414) (not e!310643))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534208 (= res!329414 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16626 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16626 a!3154)) (= (select (arr!16262 a!3154) resIndex!32) (select (arr!16262 a!3154) j!147))))))

(declare-fun b!534209 () Bool)

(declare-fun res!329415 () Bool)

(assert (=> b!534209 (=> (not res!329415) (not e!310642))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!534209 (= res!329415 (validKeyInArray!0 k!1998))))

(declare-fun b!534210 () Bool)

(assert (=> b!534210 (= e!310642 e!310643)))

(declare-fun res!329412 () Bool)

(assert (=> b!534210 (=> (not res!329412) (not e!310643))))

(declare-datatypes ((SeekEntryResult!4720 0))(
  ( (MissingZero!4720 (index!21104 (_ BitVec 32))) (Found!4720 (index!21105 (_ BitVec 32))) (Intermediate!4720 (undefined!5532 Bool) (index!21106 (_ BitVec 32)) (x!50063 (_ BitVec 32))) (Undefined!4720) (MissingVacant!4720 (index!21107 (_ BitVec 32))) )
))
(declare-fun lt!245586 () SeekEntryResult!4720)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534210 (= res!329412 (or (= lt!245586 (MissingZero!4720 i!1153)) (= lt!245586 (MissingVacant!4720 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33846 (_ BitVec 32)) SeekEntryResult!4720)

(assert (=> b!534210 (= lt!245586 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534211 () Bool)

(declare-fun res!329419 () Bool)

(assert (=> b!534211 (=> (not res!329419) (not e!310642))))

(assert (=> b!534211 (= res!329419 (and (= (size!16626 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16626 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16626 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534212 () Bool)

(assert (=> b!534212 (= e!310643 false)))

(declare-fun lt!245587 () SeekEntryResult!4720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33846 (_ BitVec 32)) SeekEntryResult!4720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534212 (= lt!245587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16262 a!3154) j!147) mask!3216) (select (arr!16262 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534213 () Bool)

(declare-fun res!329416 () Bool)

(assert (=> b!534213 (=> (not res!329416) (not e!310642))))

(declare-fun arrayContainsKey!0 (array!33846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534213 (= res!329416 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534215 () Bool)

(declare-fun res!329418 () Bool)

(assert (=> b!534215 (=> (not res!329418) (not e!310643))))

(declare-datatypes ((List!10381 0))(
  ( (Nil!10378) (Cons!10377 (h!11320 (_ BitVec 64)) (t!16609 List!10381)) )
))
(declare-fun arrayNoDuplicates!0 (array!33846 (_ BitVec 32) List!10381) Bool)

(assert (=> b!534215 (= res!329418 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10378))))

(declare-fun b!534214 () Bool)

(declare-fun res!329420 () Bool)

(assert (=> b!534214 (=> (not res!329420) (not e!310643))))

(assert (=> b!534214 (= res!329420 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16262 a!3154) j!147) a!3154 mask!3216) (Intermediate!4720 false resIndex!32 resX!32)))))

(declare-fun res!329411 () Bool)

(assert (=> start!48634 (=> (not res!329411) (not e!310642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48634 (= res!329411 (validMask!0 mask!3216))))

(assert (=> start!48634 e!310642))

(assert (=> start!48634 true))

(declare-fun array_inv!12058 (array!33846) Bool)

(assert (=> start!48634 (array_inv!12058 a!3154)))

(assert (= (and start!48634 res!329411) b!534211))

(assert (= (and b!534211 res!329419) b!534207))

(assert (= (and b!534207 res!329413) b!534209))

(assert (= (and b!534209 res!329415) b!534213))

(assert (= (and b!534213 res!329416) b!534210))

(assert (= (and b!534210 res!329412) b!534206))

(assert (= (and b!534206 res!329417) b!534215))

(assert (= (and b!534215 res!329418) b!534208))

(assert (= (and b!534208 res!329414) b!534214))

(assert (= (and b!534214 res!329420) b!534212))

(declare-fun m!513955 () Bool)

(assert (=> start!48634 m!513955))

(declare-fun m!513957 () Bool)

(assert (=> start!48634 m!513957))

(declare-fun m!513959 () Bool)

(assert (=> b!534208 m!513959))

(declare-fun m!513961 () Bool)

(assert (=> b!534208 m!513961))

(assert (=> b!534207 m!513961))

(assert (=> b!534207 m!513961))

(declare-fun m!513963 () Bool)

(assert (=> b!534207 m!513963))

(assert (=> b!534212 m!513961))

(assert (=> b!534212 m!513961))

(declare-fun m!513965 () Bool)

(assert (=> b!534212 m!513965))

(assert (=> b!534212 m!513965))

(assert (=> b!534212 m!513961))

(declare-fun m!513967 () Bool)

(assert (=> b!534212 m!513967))

(declare-fun m!513969 () Bool)

(assert (=> b!534213 m!513969))

(declare-fun m!513971 () Bool)

(assert (=> b!534215 m!513971))

(assert (=> b!534214 m!513961))

(assert (=> b!534214 m!513961))

(declare-fun m!513973 () Bool)

(assert (=> b!534214 m!513973))

(declare-fun m!513975 () Bool)

(assert (=> b!534210 m!513975))

(declare-fun m!513977 () Bool)

(assert (=> b!534206 m!513977))

(declare-fun m!513979 () Bool)

(assert (=> b!534209 m!513979))

(push 1)

(assert (not b!534210))

(assert (not b!534215))

(assert (not b!534209))

(assert (not start!48634))

(assert (not b!534212))

(assert (not b!534213))

(assert (not b!534207))

(assert (not b!534206))

