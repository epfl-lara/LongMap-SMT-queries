; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48616 () Bool)

(assert start!48616)

(declare-fun b!533936 () Bool)

(declare-fun res!329149 () Bool)

(declare-fun e!310561 () Bool)

(assert (=> b!533936 (=> (not res!329149) (not e!310561))))

(declare-datatypes ((array!33828 0))(
  ( (array!33829 (arr!16253 (Array (_ BitVec 32) (_ BitVec 64))) (size!16617 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33828)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533936 (= res!329149 (validKeyInArray!0 (select (arr!16253 a!3154) j!147)))))

(declare-fun b!533937 () Bool)

(declare-fun e!310563 () Bool)

(assert (=> b!533937 (= e!310563 false)))

(declare-datatypes ((SeekEntryResult!4711 0))(
  ( (MissingZero!4711 (index!21068 (_ BitVec 32))) (Found!4711 (index!21069 (_ BitVec 32))) (Intermediate!4711 (undefined!5523 Bool) (index!21070 (_ BitVec 32)) (x!50030 (_ BitVec 32))) (Undefined!4711) (MissingVacant!4711 (index!21071 (_ BitVec 32))) )
))
(declare-fun lt!245533 () SeekEntryResult!4711)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33828 (_ BitVec 32)) SeekEntryResult!4711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533937 (= lt!245533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16253 a!3154) j!147) mask!3216) (select (arr!16253 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533938 () Bool)

(declare-fun res!329144 () Bool)

(assert (=> b!533938 (=> (not res!329144) (not e!310563))))

(declare-datatypes ((List!10372 0))(
  ( (Nil!10369) (Cons!10368 (h!11311 (_ BitVec 64)) (t!16600 List!10372)) )
))
(declare-fun arrayNoDuplicates!0 (array!33828 (_ BitVec 32) List!10372) Bool)

(assert (=> b!533938 (= res!329144 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10369))))

(declare-fun b!533940 () Bool)

(declare-fun res!329146 () Bool)

(assert (=> b!533940 (=> (not res!329146) (not e!310563))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533940 (= res!329146 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16617 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16617 a!3154)) (= (select (arr!16253 a!3154) resIndex!32) (select (arr!16253 a!3154) j!147))))))

(declare-fun b!533941 () Bool)

(declare-fun res!329145 () Bool)

(assert (=> b!533941 (=> (not res!329145) (not e!310561))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533941 (= res!329145 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533939 () Bool)

(declare-fun res!329143 () Bool)

(assert (=> b!533939 (=> (not res!329143) (not e!310563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33828 (_ BitVec 32)) Bool)

(assert (=> b!533939 (= res!329143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329141 () Bool)

(assert (=> start!48616 (=> (not res!329141) (not e!310561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48616 (= res!329141 (validMask!0 mask!3216))))

(assert (=> start!48616 e!310561))

(assert (=> start!48616 true))

(declare-fun array_inv!12049 (array!33828) Bool)

(assert (=> start!48616 (array_inv!12049 a!3154)))

(declare-fun b!533942 () Bool)

(declare-fun res!329147 () Bool)

(assert (=> b!533942 (=> (not res!329147) (not e!310561))))

(assert (=> b!533942 (= res!329147 (validKeyInArray!0 k!1998))))

(declare-fun b!533943 () Bool)

(assert (=> b!533943 (= e!310561 e!310563)))

(declare-fun res!329148 () Bool)

(assert (=> b!533943 (=> (not res!329148) (not e!310563))))

(declare-fun lt!245532 () SeekEntryResult!4711)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533943 (= res!329148 (or (= lt!245532 (MissingZero!4711 i!1153)) (= lt!245532 (MissingVacant!4711 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33828 (_ BitVec 32)) SeekEntryResult!4711)

(assert (=> b!533943 (= lt!245532 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533944 () Bool)

(declare-fun res!329150 () Bool)

(assert (=> b!533944 (=> (not res!329150) (not e!310563))))

(assert (=> b!533944 (= res!329150 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16253 a!3154) j!147) a!3154 mask!3216) (Intermediate!4711 false resIndex!32 resX!32)))))

(declare-fun b!533945 () Bool)

(declare-fun res!329142 () Bool)

(assert (=> b!533945 (=> (not res!329142) (not e!310561))))

(assert (=> b!533945 (= res!329142 (and (= (size!16617 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16617 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16617 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48616 res!329141) b!533945))

(assert (= (and b!533945 res!329142) b!533936))

(assert (= (and b!533936 res!329149) b!533942))

(assert (= (and b!533942 res!329147) b!533941))

(assert (= (and b!533941 res!329145) b!533943))

(assert (= (and b!533943 res!329148) b!533939))

(assert (= (and b!533939 res!329143) b!533938))

(assert (= (and b!533938 res!329144) b!533940))

(assert (= (and b!533940 res!329146) b!533944))

(assert (= (and b!533944 res!329150) b!533937))

(declare-fun m!513721 () Bool)

(assert (=> b!533944 m!513721))

(assert (=> b!533944 m!513721))

(declare-fun m!513723 () Bool)

(assert (=> b!533944 m!513723))

(declare-fun m!513725 () Bool)

(assert (=> b!533941 m!513725))

(declare-fun m!513727 () Bool)

(assert (=> b!533943 m!513727))

(assert (=> b!533936 m!513721))

(assert (=> b!533936 m!513721))

(declare-fun m!513729 () Bool)

(assert (=> b!533936 m!513729))

(declare-fun m!513731 () Bool)

(assert (=> b!533940 m!513731))

(assert (=> b!533940 m!513721))

(assert (=> b!533937 m!513721))

(assert (=> b!533937 m!513721))

(declare-fun m!513733 () Bool)

(assert (=> b!533937 m!513733))

(assert (=> b!533937 m!513733))

(assert (=> b!533937 m!513721))

(declare-fun m!513735 () Bool)

(assert (=> b!533937 m!513735))

(declare-fun m!513737 () Bool)

(assert (=> b!533939 m!513737))

(declare-fun m!513739 () Bool)

(assert (=> b!533938 m!513739))

(declare-fun m!513741 () Bool)

(assert (=> b!533942 m!513741))

(declare-fun m!513743 () Bool)

(assert (=> start!48616 m!513743))

(declare-fun m!513745 () Bool)

(assert (=> start!48616 m!513745))

(push 1)

(assert (not start!48616))

(assert (not b!533937))

(assert (not b!533944))

(assert (not b!533936))

(assert (not b!533939))

(assert (not b!533941))

(assert (not b!533938))

