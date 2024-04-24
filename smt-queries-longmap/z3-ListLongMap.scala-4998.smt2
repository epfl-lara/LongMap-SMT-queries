; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68622 () Bool)

(assert start!68622)

(declare-fun b!797063 () Bool)

(declare-fun e!442342 () Bool)

(assert (=> b!797063 (= e!442342 (not true))))

(declare-datatypes ((SeekEntryResult!8266 0))(
  ( (MissingZero!8266 (index!35432 (_ BitVec 32))) (Found!8266 (index!35433 (_ BitVec 32))) (Intermediate!8266 (undefined!9078 Bool) (index!35434 (_ BitVec 32)) (x!66499 (_ BitVec 32))) (Undefined!8266) (MissingVacant!8266 (index!35435 (_ BitVec 32))) )
))
(declare-fun lt!355390 () SeekEntryResult!8266)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797063 (= lt!355390 (Found!8266 index!1236))))

(declare-fun b!797064 () Bool)

(declare-fun res!541209 () Bool)

(declare-fun e!442344 () Bool)

(assert (=> b!797064 (=> (not res!541209) (not e!442344))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43286 0))(
  ( (array!43287 (arr!20719 (Array (_ BitVec 32) (_ BitVec 64))) (size!21139 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43286)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797064 (= res!541209 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21139 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20719 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21139 a!3170)) (= (select (arr!20719 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797065 () Bool)

(declare-fun res!541216 () Bool)

(assert (=> b!797065 (=> (not res!541216) (not e!442344))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43286 (_ BitVec 32)) Bool)

(assert (=> b!797065 (= res!541216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797066 () Bool)

(declare-fun res!541210 () Bool)

(declare-fun e!442343 () Bool)

(assert (=> b!797066 (=> (not res!541210) (not e!442343))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797066 (= res!541210 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797067 () Bool)

(declare-fun e!442341 () Bool)

(assert (=> b!797067 (= e!442344 e!442341)))

(declare-fun res!541215 () Bool)

(assert (=> b!797067 (=> (not res!541215) (not e!442341))))

(declare-fun lt!355389 () SeekEntryResult!8266)

(assert (=> b!797067 (= res!541215 (= lt!355389 lt!355390))))

(declare-fun lt!355384 () array!43286)

(declare-fun lt!355385 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43286 (_ BitVec 32)) SeekEntryResult!8266)

(assert (=> b!797067 (= lt!355390 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355385 lt!355384 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43286 (_ BitVec 32)) SeekEntryResult!8266)

(assert (=> b!797067 (= lt!355389 (seekEntryOrOpen!0 lt!355385 lt!355384 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797067 (= lt!355385 (select (store (arr!20719 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797067 (= lt!355384 (array!43287 (store (arr!20719 a!3170) i!1163 k0!2044) (size!21139 a!3170)))))

(declare-fun b!797068 () Bool)

(declare-fun res!541214 () Bool)

(assert (=> b!797068 (=> (not res!541214) (not e!442344))))

(declare-datatypes ((List!14589 0))(
  ( (Nil!14586) (Cons!14585 (h!15720 (_ BitVec 64)) (t!20896 List!14589)) )
))
(declare-fun arrayNoDuplicates!0 (array!43286 (_ BitVec 32) List!14589) Bool)

(assert (=> b!797068 (= res!541214 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14586))))

(declare-fun res!541218 () Bool)

(assert (=> start!68622 (=> (not res!541218) (not e!442343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68622 (= res!541218 (validMask!0 mask!3266))))

(assert (=> start!68622 e!442343))

(assert (=> start!68622 true))

(declare-fun array_inv!16578 (array!43286) Bool)

(assert (=> start!68622 (array_inv!16578 a!3170)))

(declare-fun b!797069 () Bool)

(declare-fun res!541212 () Bool)

(assert (=> b!797069 (=> (not res!541212) (not e!442343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797069 (= res!541212 (validKeyInArray!0 k0!2044))))

(declare-fun b!797070 () Bool)

(assert (=> b!797070 (= e!442343 e!442344)))

(declare-fun res!541213 () Bool)

(assert (=> b!797070 (=> (not res!541213) (not e!442344))))

(declare-fun lt!355388 () SeekEntryResult!8266)

(assert (=> b!797070 (= res!541213 (or (= lt!355388 (MissingZero!8266 i!1163)) (= lt!355388 (MissingVacant!8266 i!1163))))))

(assert (=> b!797070 (= lt!355388 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797071 () Bool)

(declare-fun res!541211 () Bool)

(assert (=> b!797071 (=> (not res!541211) (not e!442343))))

(assert (=> b!797071 (= res!541211 (validKeyInArray!0 (select (arr!20719 a!3170) j!153)))))

(declare-fun b!797072 () Bool)

(assert (=> b!797072 (= e!442341 e!442342)))

(declare-fun res!541217 () Bool)

(assert (=> b!797072 (=> (not res!541217) (not e!442342))))

(declare-fun lt!355386 () SeekEntryResult!8266)

(declare-fun lt!355387 () SeekEntryResult!8266)

(assert (=> b!797072 (= res!541217 (and (= lt!355387 lt!355386) (= lt!355386 (Found!8266 j!153)) (= (select (arr!20719 a!3170) index!1236) (select (arr!20719 a!3170) j!153))))))

(assert (=> b!797072 (= lt!355386 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20719 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797072 (= lt!355387 (seekEntryOrOpen!0 (select (arr!20719 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797073 () Bool)

(declare-fun res!541208 () Bool)

(assert (=> b!797073 (=> (not res!541208) (not e!442343))))

(assert (=> b!797073 (= res!541208 (and (= (size!21139 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21139 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21139 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68622 res!541218) b!797073))

(assert (= (and b!797073 res!541208) b!797071))

(assert (= (and b!797071 res!541211) b!797069))

(assert (= (and b!797069 res!541212) b!797066))

(assert (= (and b!797066 res!541210) b!797070))

(assert (= (and b!797070 res!541213) b!797065))

(assert (= (and b!797065 res!541216) b!797068))

(assert (= (and b!797068 res!541214) b!797064))

(assert (= (and b!797064 res!541209) b!797067))

(assert (= (and b!797067 res!541215) b!797072))

(assert (= (and b!797072 res!541217) b!797063))

(declare-fun m!738275 () Bool)

(assert (=> b!797066 m!738275))

(declare-fun m!738277 () Bool)

(assert (=> b!797069 m!738277))

(declare-fun m!738279 () Bool)

(assert (=> b!797064 m!738279))

(declare-fun m!738281 () Bool)

(assert (=> b!797064 m!738281))

(declare-fun m!738283 () Bool)

(assert (=> b!797067 m!738283))

(declare-fun m!738285 () Bool)

(assert (=> b!797067 m!738285))

(declare-fun m!738287 () Bool)

(assert (=> b!797067 m!738287))

(declare-fun m!738289 () Bool)

(assert (=> b!797067 m!738289))

(declare-fun m!738291 () Bool)

(assert (=> b!797070 m!738291))

(declare-fun m!738293 () Bool)

(assert (=> b!797072 m!738293))

(declare-fun m!738295 () Bool)

(assert (=> b!797072 m!738295))

(assert (=> b!797072 m!738295))

(declare-fun m!738297 () Bool)

(assert (=> b!797072 m!738297))

(assert (=> b!797072 m!738295))

(declare-fun m!738299 () Bool)

(assert (=> b!797072 m!738299))

(assert (=> b!797071 m!738295))

(assert (=> b!797071 m!738295))

(declare-fun m!738301 () Bool)

(assert (=> b!797071 m!738301))

(declare-fun m!738303 () Bool)

(assert (=> start!68622 m!738303))

(declare-fun m!738305 () Bool)

(assert (=> start!68622 m!738305))

(declare-fun m!738307 () Bool)

(assert (=> b!797065 m!738307))

(declare-fun m!738309 () Bool)

(assert (=> b!797068 m!738309))

(check-sat (not b!797067) (not start!68622) (not b!797068) (not b!797072) (not b!797066) (not b!797071) (not b!797065) (not b!797069) (not b!797070))
(check-sat)
