; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48406 () Bool)

(assert start!48406)

(declare-fun b!531904 () Bool)

(declare-fun res!327401 () Bool)

(declare-fun e!309771 () Bool)

(assert (=> b!531904 (=> (not res!327401) (not e!309771))))

(declare-datatypes ((array!33714 0))(
  ( (array!33715 (arr!16199 (Array (_ BitVec 32) (_ BitVec 64))) (size!16563 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33714)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531904 (= res!327401 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531905 () Bool)

(declare-fun e!309770 () Bool)

(assert (=> b!531905 (= e!309771 e!309770)))

(declare-fun res!327400 () Bool)

(assert (=> b!531905 (=> (not res!327400) (not e!309770))))

(declare-datatypes ((SeekEntryResult!4657 0))(
  ( (MissingZero!4657 (index!20852 (_ BitVec 32))) (Found!4657 (index!20853 (_ BitVec 32))) (Intermediate!4657 (undefined!5469 Bool) (index!20854 (_ BitVec 32)) (x!49823 (_ BitVec 32))) (Undefined!4657) (MissingVacant!4657 (index!20855 (_ BitVec 32))) )
))
(declare-fun lt!245092 () SeekEntryResult!4657)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531905 (= res!327400 (or (= lt!245092 (MissingZero!4657 i!1153)) (= lt!245092 (MissingVacant!4657 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33714 (_ BitVec 32)) SeekEntryResult!4657)

(assert (=> b!531905 (= lt!245092 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531906 () Bool)

(declare-fun res!327395 () Bool)

(assert (=> b!531906 (=> (not res!327395) (not e!309771))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531906 (= res!327395 (validKeyInArray!0 (select (arr!16199 a!3154) j!147)))))

(declare-fun b!531907 () Bool)

(declare-fun res!327398 () Bool)

(assert (=> b!531907 (=> (not res!327398) (not e!309770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33714 (_ BitVec 32)) Bool)

(assert (=> b!531907 (= res!327398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531908 () Bool)

(declare-fun res!327394 () Bool)

(assert (=> b!531908 (=> (not res!327394) (not e!309771))))

(assert (=> b!531908 (= res!327394 (and (= (size!16563 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16563 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16563 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531909 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531909 (= e!309770 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16563 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16563 a!3154)) (= (select (arr!16199 a!3154) resIndex!32) (select (arr!16199 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!531910 () Bool)

(declare-fun res!327399 () Bool)

(assert (=> b!531910 (=> (not res!327399) (not e!309771))))

(assert (=> b!531910 (= res!327399 (validKeyInArray!0 k!1998))))

(declare-fun res!327396 () Bool)

(assert (=> start!48406 (=> (not res!327396) (not e!309771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48406 (= res!327396 (validMask!0 mask!3216))))

(assert (=> start!48406 e!309771))

(assert (=> start!48406 true))

(declare-fun array_inv!11995 (array!33714) Bool)

(assert (=> start!48406 (array_inv!11995 a!3154)))

(declare-fun b!531911 () Bool)

(declare-fun res!327397 () Bool)

(assert (=> b!531911 (=> (not res!327397) (not e!309770))))

(declare-datatypes ((List!10318 0))(
  ( (Nil!10315) (Cons!10314 (h!11254 (_ BitVec 64)) (t!16546 List!10318)) )
))
(declare-fun arrayNoDuplicates!0 (array!33714 (_ BitVec 32) List!10318) Bool)

(assert (=> b!531911 (= res!327397 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10315))))

(assert (= (and start!48406 res!327396) b!531908))

(assert (= (and b!531908 res!327394) b!531906))

(assert (= (and b!531906 res!327395) b!531910))

(assert (= (and b!531910 res!327399) b!531904))

(assert (= (and b!531904 res!327401) b!531905))

(assert (= (and b!531905 res!327400) b!531907))

(assert (= (and b!531907 res!327398) b!531911))

(assert (= (and b!531911 res!327397) b!531909))

(declare-fun m!512239 () Bool)

(assert (=> b!531904 m!512239))

(declare-fun m!512241 () Bool)

(assert (=> b!531910 m!512241))

(declare-fun m!512243 () Bool)

(assert (=> start!48406 m!512243))

(declare-fun m!512245 () Bool)

(assert (=> start!48406 m!512245))

(declare-fun m!512247 () Bool)

(assert (=> b!531906 m!512247))

(assert (=> b!531906 m!512247))

(declare-fun m!512249 () Bool)

(assert (=> b!531906 m!512249))

(declare-fun m!512251 () Bool)

(assert (=> b!531909 m!512251))

(assert (=> b!531909 m!512247))

(declare-fun m!512253 () Bool)

(assert (=> b!531911 m!512253))

(declare-fun m!512255 () Bool)

(assert (=> b!531907 m!512255))

(declare-fun m!512257 () Bool)

(assert (=> b!531905 m!512257))

(push 1)

(assert (not b!531904))

(assert (not start!48406))

(assert (not b!531911))

(assert (not b!531907))

(assert (not b!531910))

(assert (not b!531905))

(assert (not b!531906))

(check-sat)

