; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48622 () Bool)

(assert start!48622)

(declare-fun b!533935 () Bool)

(declare-fun e!310469 () Bool)

(declare-fun e!310468 () Bool)

(assert (=> b!533935 (= e!310469 e!310468)))

(declare-fun res!329283 () Bool)

(assert (=> b!533935 (=> (not res!329283) (not e!310468))))

(declare-datatypes ((SeekEntryResult!4716 0))(
  ( (MissingZero!4716 (index!21088 (_ BitVec 32))) (Found!4716 (index!21089 (_ BitVec 32))) (Intermediate!4716 (undefined!5528 Bool) (index!21090 (_ BitVec 32)) (x!50054 (_ BitVec 32))) (Undefined!4716) (MissingVacant!4716 (index!21091 (_ BitVec 32))) )
))
(declare-fun lt!245352 () SeekEntryResult!4716)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533935 (= res!329283 (or (= lt!245352 (MissingZero!4716 i!1153)) (= lt!245352 (MissingVacant!4716 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33844 0))(
  ( (array!33845 (arr!16261 (Array (_ BitVec 32) (_ BitVec 64))) (size!16626 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33844)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33844 (_ BitVec 32)) SeekEntryResult!4716)

(assert (=> b!533935 (= lt!245352 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!329290 () Bool)

(assert (=> start!48622 (=> (not res!329290) (not e!310469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48622 (= res!329290 (validMask!0 mask!3216))))

(assert (=> start!48622 e!310469))

(assert (=> start!48622 true))

(declare-fun array_inv!12144 (array!33844) Bool)

(assert (=> start!48622 (array_inv!12144 a!3154)))

(declare-fun b!533936 () Bool)

(declare-fun res!329286 () Bool)

(assert (=> b!533936 (=> (not res!329286) (not e!310469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533936 (= res!329286 (validKeyInArray!0 k!1998))))

(declare-fun b!533937 () Bool)

(declare-fun res!329287 () Bool)

(assert (=> b!533937 (=> (not res!329287) (not e!310468))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33844 (_ BitVec 32)) SeekEntryResult!4716)

(assert (=> b!533937 (= res!329287 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16261 a!3154) j!147) a!3154 mask!3216) (Intermediate!4716 false resIndex!32 resX!32)))))

(declare-fun b!533938 () Bool)

(assert (=> b!533938 (= e!310468 false)))

(declare-fun lt!245353 () SeekEntryResult!4716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533938 (= lt!245353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16261 a!3154) j!147) mask!3216) (select (arr!16261 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533939 () Bool)

(declare-fun res!329285 () Bool)

(assert (=> b!533939 (=> (not res!329285) (not e!310468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33844 (_ BitVec 32)) Bool)

(assert (=> b!533939 (= res!329285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533940 () Bool)

(declare-fun res!329291 () Bool)

(assert (=> b!533940 (=> (not res!329291) (not e!310468))))

(declare-datatypes ((List!10419 0))(
  ( (Nil!10416) (Cons!10415 (h!11358 (_ BitVec 64)) (t!16638 List!10419)) )
))
(declare-fun arrayNoDuplicates!0 (array!33844 (_ BitVec 32) List!10419) Bool)

(assert (=> b!533940 (= res!329291 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10416))))

(declare-fun b!533941 () Bool)

(declare-fun res!329284 () Bool)

(assert (=> b!533941 (=> (not res!329284) (not e!310469))))

(declare-fun arrayContainsKey!0 (array!33844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533941 (= res!329284 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533942 () Bool)

(declare-fun res!329289 () Bool)

(assert (=> b!533942 (=> (not res!329289) (not e!310469))))

(assert (=> b!533942 (= res!329289 (and (= (size!16626 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16626 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16626 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533943 () Bool)

(declare-fun res!329288 () Bool)

(assert (=> b!533943 (=> (not res!329288) (not e!310468))))

(assert (=> b!533943 (= res!329288 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16626 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16626 a!3154)) (= (select (arr!16261 a!3154) resIndex!32) (select (arr!16261 a!3154) j!147))))))

(declare-fun b!533944 () Bool)

(declare-fun res!329282 () Bool)

(assert (=> b!533944 (=> (not res!329282) (not e!310469))))

(assert (=> b!533944 (= res!329282 (validKeyInArray!0 (select (arr!16261 a!3154) j!147)))))

(assert (= (and start!48622 res!329290) b!533942))

(assert (= (and b!533942 res!329289) b!533944))

(assert (= (and b!533944 res!329282) b!533936))

(assert (= (and b!533936 res!329286) b!533941))

(assert (= (and b!533941 res!329284) b!533935))

(assert (= (and b!533935 res!329283) b!533939))

(assert (= (and b!533939 res!329285) b!533940))

(assert (= (and b!533940 res!329291) b!533943))

(assert (= (and b!533943 res!329288) b!533937))

(assert (= (and b!533937 res!329287) b!533938))

(declare-fun m!513203 () Bool)

(assert (=> b!533940 m!513203))

(declare-fun m!513205 () Bool)

(assert (=> b!533935 m!513205))

(declare-fun m!513207 () Bool)

(assert (=> b!533937 m!513207))

(assert (=> b!533937 m!513207))

(declare-fun m!513209 () Bool)

(assert (=> b!533937 m!513209))

(declare-fun m!513211 () Bool)

(assert (=> b!533936 m!513211))

(declare-fun m!513213 () Bool)

(assert (=> start!48622 m!513213))

(declare-fun m!513215 () Bool)

(assert (=> start!48622 m!513215))

(declare-fun m!513217 () Bool)

(assert (=> b!533939 m!513217))

(declare-fun m!513219 () Bool)

(assert (=> b!533941 m!513219))

(declare-fun m!513221 () Bool)

(assert (=> b!533943 m!513221))

(assert (=> b!533943 m!513207))

(assert (=> b!533944 m!513207))

(assert (=> b!533944 m!513207))

(declare-fun m!513223 () Bool)

(assert (=> b!533944 m!513223))

(assert (=> b!533938 m!513207))

(assert (=> b!533938 m!513207))

(declare-fun m!513225 () Bool)

(assert (=> b!533938 m!513225))

(assert (=> b!533938 m!513225))

(assert (=> b!533938 m!513207))

(declare-fun m!513227 () Bool)

(assert (=> b!533938 m!513227))

(push 1)

(assert (not b!533938))

(assert (not b!533941))

(assert (not b!533940))

(assert (not b!533944))

(assert (not b!533936))

(assert (not start!48622))

(assert (not b!533939))

(assert (not b!533937))

(assert (not b!533935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

