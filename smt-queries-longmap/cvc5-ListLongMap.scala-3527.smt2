; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48732 () Bool)

(assert start!48732)

(declare-fun b!535754 () Bool)

(declare-fun res!330971 () Bool)

(declare-fun e!311150 () Bool)

(assert (=> b!535754 (=> (not res!330971) (not e!311150))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33944 0))(
  ( (array!33945 (arr!16311 (Array (_ BitVec 32) (_ BitVec 64))) (size!16675 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33944)

(assert (=> b!535754 (= res!330971 (and (not (= (select (arr!16311 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16311 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16311 a!3154) index!1177) (select (arr!16311 a!3154) j!147)))))))

(declare-fun b!535756 () Bool)

(declare-fun res!330961 () Bool)

(assert (=> b!535756 (=> (not res!330961) (not e!311150))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4769 0))(
  ( (MissingZero!4769 (index!21300 (_ BitVec 32))) (Found!4769 (index!21301 (_ BitVec 32))) (Intermediate!4769 (undefined!5581 Bool) (index!21302 (_ BitVec 32)) (x!50248 (_ BitVec 32))) (Undefined!4769) (MissingVacant!4769 (index!21303 (_ BitVec 32))) )
))
(declare-fun lt!245886 () SeekEntryResult!4769)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33944 (_ BitVec 32)) SeekEntryResult!4769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535756 (= res!330961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16311 a!3154) j!147) mask!3216) (select (arr!16311 a!3154) j!147) a!3154 mask!3216) lt!245886))))

(declare-fun b!535757 () Bool)

(declare-fun res!330966 () Bool)

(declare-fun e!311151 () Bool)

(assert (=> b!535757 (=> (not res!330966) (not e!311151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33944 (_ BitVec 32)) Bool)

(assert (=> b!535757 (= res!330966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535758 () Bool)

(declare-fun res!330962 () Bool)

(assert (=> b!535758 (=> (not res!330962) (not e!311151))))

(declare-datatypes ((List!10430 0))(
  ( (Nil!10427) (Cons!10426 (h!11369 (_ BitVec 64)) (t!16658 List!10430)) )
))
(declare-fun arrayNoDuplicates!0 (array!33944 (_ BitVec 32) List!10430) Bool)

(assert (=> b!535758 (= res!330962 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10427))))

(declare-fun b!535759 () Bool)

(declare-fun res!330970 () Bool)

(declare-fun e!311153 () Bool)

(assert (=> b!535759 (=> (not res!330970) (not e!311153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535759 (= res!330970 (validKeyInArray!0 (select (arr!16311 a!3154) j!147)))))

(declare-fun b!535760 () Bool)

(declare-fun e!311154 () Bool)

(assert (=> b!535760 (= e!311150 e!311154)))

(declare-fun res!330967 () Bool)

(assert (=> b!535760 (=> (not res!330967) (not e!311154))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245887 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535760 (= res!330967 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245887 #b00000000000000000000000000000000) (bvslt lt!245887 (size!16675 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535760 (= lt!245887 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535761 () Bool)

(declare-fun res!330968 () Bool)

(assert (=> b!535761 (=> (not res!330968) (not e!311151))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535761 (= res!330968 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16675 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16675 a!3154)) (= (select (arr!16311 a!3154) resIndex!32) (select (arr!16311 a!3154) j!147))))))

(declare-fun b!535762 () Bool)

(declare-fun res!330963 () Bool)

(assert (=> b!535762 (=> (not res!330963) (not e!311153))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535762 (= res!330963 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535763 () Bool)

(declare-fun res!330959 () Bool)

(assert (=> b!535763 (=> (not res!330959) (not e!311153))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535763 (= res!330959 (and (= (size!16675 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16675 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16675 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535764 () Bool)

(assert (=> b!535764 (= e!311154 false)))

(declare-fun lt!245884 () SeekEntryResult!4769)

(assert (=> b!535764 (= lt!245884 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245887 (select (arr!16311 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330960 () Bool)

(assert (=> start!48732 (=> (not res!330960) (not e!311153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48732 (= res!330960 (validMask!0 mask!3216))))

(assert (=> start!48732 e!311153))

(assert (=> start!48732 true))

(declare-fun array_inv!12107 (array!33944) Bool)

(assert (=> start!48732 (array_inv!12107 a!3154)))

(declare-fun b!535755 () Bool)

(declare-fun res!330965 () Bool)

(assert (=> b!535755 (=> (not res!330965) (not e!311153))))

(assert (=> b!535755 (= res!330965 (validKeyInArray!0 k!1998))))

(declare-fun b!535765 () Bool)

(assert (=> b!535765 (= e!311153 e!311151)))

(declare-fun res!330969 () Bool)

(assert (=> b!535765 (=> (not res!330969) (not e!311151))))

(declare-fun lt!245885 () SeekEntryResult!4769)

(assert (=> b!535765 (= res!330969 (or (= lt!245885 (MissingZero!4769 i!1153)) (= lt!245885 (MissingVacant!4769 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33944 (_ BitVec 32)) SeekEntryResult!4769)

(assert (=> b!535765 (= lt!245885 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535766 () Bool)

(assert (=> b!535766 (= e!311151 e!311150)))

(declare-fun res!330964 () Bool)

(assert (=> b!535766 (=> (not res!330964) (not e!311150))))

(assert (=> b!535766 (= res!330964 (= lt!245886 (Intermediate!4769 false resIndex!32 resX!32)))))

(assert (=> b!535766 (= lt!245886 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16311 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48732 res!330960) b!535763))

(assert (= (and b!535763 res!330959) b!535759))

(assert (= (and b!535759 res!330970) b!535755))

(assert (= (and b!535755 res!330965) b!535762))

(assert (= (and b!535762 res!330963) b!535765))

(assert (= (and b!535765 res!330969) b!535757))

(assert (= (and b!535757 res!330966) b!535758))

(assert (= (and b!535758 res!330962) b!535761))

(assert (= (and b!535761 res!330968) b!535766))

(assert (= (and b!535766 res!330964) b!535756))

(assert (= (and b!535756 res!330961) b!535754))

(assert (= (and b!535754 res!330971) b!535760))

(assert (= (and b!535760 res!330967) b!535764))

(declare-fun m!515289 () Bool)

(assert (=> b!535760 m!515289))

(declare-fun m!515291 () Bool)

(assert (=> b!535766 m!515291))

(assert (=> b!535766 m!515291))

(declare-fun m!515293 () Bool)

(assert (=> b!535766 m!515293))

(declare-fun m!515295 () Bool)

(assert (=> b!535758 m!515295))

(assert (=> b!535756 m!515291))

(assert (=> b!535756 m!515291))

(declare-fun m!515297 () Bool)

(assert (=> b!535756 m!515297))

(assert (=> b!535756 m!515297))

(assert (=> b!535756 m!515291))

(declare-fun m!515299 () Bool)

(assert (=> b!535756 m!515299))

(declare-fun m!515301 () Bool)

(assert (=> b!535761 m!515301))

(assert (=> b!535761 m!515291))

(declare-fun m!515303 () Bool)

(assert (=> b!535757 m!515303))

(assert (=> b!535764 m!515291))

(assert (=> b!535764 m!515291))

(declare-fun m!515305 () Bool)

(assert (=> b!535764 m!515305))

(declare-fun m!515307 () Bool)

(assert (=> b!535762 m!515307))

(assert (=> b!535759 m!515291))

(assert (=> b!535759 m!515291))

(declare-fun m!515309 () Bool)

(assert (=> b!535759 m!515309))

(declare-fun m!515311 () Bool)

(assert (=> b!535755 m!515311))

(declare-fun m!515313 () Bool)

(assert (=> b!535754 m!515313))

(assert (=> b!535754 m!515291))

(declare-fun m!515315 () Bool)

(assert (=> start!48732 m!515315))

(declare-fun m!515317 () Bool)

(assert (=> start!48732 m!515317))

(declare-fun m!515319 () Bool)

(assert (=> b!535765 m!515319))

(push 1)

