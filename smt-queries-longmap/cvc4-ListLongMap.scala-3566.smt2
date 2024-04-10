; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49024 () Bool)

(assert start!49024)

(declare-fun b!540236 () Bool)

(declare-fun res!335285 () Bool)

(declare-fun e!313008 () Bool)

(assert (=> b!540236 (=> (not res!335285) (not e!313008))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540236 (= res!335285 (validKeyInArray!0 k!1998))))

(declare-fun res!335289 () Bool)

(assert (=> start!49024 (=> (not res!335289) (not e!313008))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49024 (= res!335289 (validMask!0 mask!3216))))

(assert (=> start!49024 e!313008))

(assert (=> start!49024 true))

(declare-datatypes ((array!34185 0))(
  ( (array!34186 (arr!16430 (Array (_ BitVec 32) (_ BitVec 64))) (size!16794 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34185)

(declare-fun array_inv!12226 (array!34185) Bool)

(assert (=> start!49024 (array_inv!12226 a!3154)))

(declare-fun b!540237 () Bool)

(declare-fun e!313007 () Bool)

(assert (=> b!540237 (= e!313007 false)))

(declare-datatypes ((SeekEntryResult!4888 0))(
  ( (MissingZero!4888 (index!21776 (_ BitVec 32))) (Found!4888 (index!21777 (_ BitVec 32))) (Intermediate!4888 (undefined!5700 Bool) (index!21778 (_ BitVec 32)) (x!50685 (_ BitVec 32))) (Undefined!4888) (MissingVacant!4888 (index!21779 (_ BitVec 32))) )
))
(declare-fun lt!247338 () SeekEntryResult!4888)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34185 (_ BitVec 32)) SeekEntryResult!4888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540237 (= lt!247338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16430 a!3154) j!147) mask!3216) (select (arr!16430 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540238 () Bool)

(declare-fun res!335284 () Bool)

(assert (=> b!540238 (=> (not res!335284) (not e!313008))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540238 (= res!335284 (and (= (size!16794 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16794 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16794 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540239 () Bool)

(declare-fun res!335287 () Bool)

(assert (=> b!540239 (=> (not res!335287) (not e!313007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34185 (_ BitVec 32)) Bool)

(assert (=> b!540239 (= res!335287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540240 () Bool)

(declare-fun res!335282 () Bool)

(assert (=> b!540240 (=> (not res!335282) (not e!313007))))

(declare-datatypes ((List!10549 0))(
  ( (Nil!10546) (Cons!10545 (h!11491 (_ BitVec 64)) (t!16777 List!10549)) )
))
(declare-fun arrayNoDuplicates!0 (array!34185 (_ BitVec 32) List!10549) Bool)

(assert (=> b!540240 (= res!335282 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10546))))

(declare-fun b!540241 () Bool)

(declare-fun res!335291 () Bool)

(assert (=> b!540241 (=> (not res!335291) (not e!313007))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540241 (= res!335291 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16794 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16794 a!3154)) (= (select (arr!16430 a!3154) resIndex!32) (select (arr!16430 a!3154) j!147))))))

(declare-fun b!540242 () Bool)

(declare-fun res!335283 () Bool)

(assert (=> b!540242 (=> (not res!335283) (not e!313008))))

(declare-fun arrayContainsKey!0 (array!34185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540242 (= res!335283 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540243 () Bool)

(declare-fun res!335290 () Bool)

(assert (=> b!540243 (=> (not res!335290) (not e!313007))))

(assert (=> b!540243 (= res!335290 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16430 a!3154) j!147) a!3154 mask!3216) (Intermediate!4888 false resIndex!32 resX!32)))))

(declare-fun b!540244 () Bool)

(declare-fun res!335288 () Bool)

(assert (=> b!540244 (=> (not res!335288) (not e!313008))))

(assert (=> b!540244 (= res!335288 (validKeyInArray!0 (select (arr!16430 a!3154) j!147)))))

(declare-fun b!540245 () Bool)

(assert (=> b!540245 (= e!313008 e!313007)))

(declare-fun res!335286 () Bool)

(assert (=> b!540245 (=> (not res!335286) (not e!313007))))

(declare-fun lt!247339 () SeekEntryResult!4888)

(assert (=> b!540245 (= res!335286 (or (= lt!247339 (MissingZero!4888 i!1153)) (= lt!247339 (MissingVacant!4888 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34185 (_ BitVec 32)) SeekEntryResult!4888)

(assert (=> b!540245 (= lt!247339 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49024 res!335289) b!540238))

(assert (= (and b!540238 res!335284) b!540244))

(assert (= (and b!540244 res!335288) b!540236))

(assert (= (and b!540236 res!335285) b!540242))

(assert (= (and b!540242 res!335283) b!540245))

(assert (= (and b!540245 res!335286) b!540239))

(assert (= (and b!540239 res!335287) b!540240))

(assert (= (and b!540240 res!335282) b!540241))

(assert (= (and b!540241 res!335291) b!540243))

(assert (= (and b!540243 res!335290) b!540237))

(declare-fun m!519061 () Bool)

(assert (=> b!540236 m!519061))

(declare-fun m!519063 () Bool)

(assert (=> b!540241 m!519063))

(declare-fun m!519065 () Bool)

(assert (=> b!540241 m!519065))

(declare-fun m!519067 () Bool)

(assert (=> b!540242 m!519067))

(declare-fun m!519069 () Bool)

(assert (=> b!540240 m!519069))

(assert (=> b!540244 m!519065))

(assert (=> b!540244 m!519065))

(declare-fun m!519071 () Bool)

(assert (=> b!540244 m!519071))

(declare-fun m!519073 () Bool)

(assert (=> b!540239 m!519073))

(assert (=> b!540243 m!519065))

(assert (=> b!540243 m!519065))

(declare-fun m!519075 () Bool)

(assert (=> b!540243 m!519075))

(declare-fun m!519077 () Bool)

(assert (=> start!49024 m!519077))

(declare-fun m!519079 () Bool)

(assert (=> start!49024 m!519079))

(declare-fun m!519081 () Bool)

(assert (=> b!540245 m!519081))

(assert (=> b!540237 m!519065))

(assert (=> b!540237 m!519065))

(declare-fun m!519083 () Bool)

(assert (=> b!540237 m!519083))

(assert (=> b!540237 m!519083))

(assert (=> b!540237 m!519065))

(declare-fun m!519085 () Bool)

(assert (=> b!540237 m!519085))

(push 1)

(assert (not b!540244))

(assert (not b!540243))

(assert (not start!49024))

(assert (not b!540240))

(assert (not b!540245))

(assert (not b!540242))

(assert (not b!540237))

(assert (not b!540236))

