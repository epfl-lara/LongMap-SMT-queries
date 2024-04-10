; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86930 () Bool)

(assert start!86930)

(declare-fun b!1008305 () Bool)

(declare-fun e!567361 () Bool)

(declare-fun e!567358 () Bool)

(assert (=> b!1008305 (= e!567361 e!567358)))

(declare-fun res!677204 () Bool)

(assert (=> b!1008305 (=> (not res!677204) (not e!567358))))

(declare-datatypes ((SeekEntryResult!9542 0))(
  ( (MissingZero!9542 (index!40539 (_ BitVec 32))) (Found!9542 (index!40540 (_ BitVec 32))) (Intermediate!9542 (undefined!10354 Bool) (index!40541 (_ BitVec 32)) (x!87932 (_ BitVec 32))) (Undefined!9542) (MissingVacant!9542 (index!40542 (_ BitVec 32))) )
))
(declare-fun lt!445633 () SeekEntryResult!9542)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008305 (= res!677204 (or (= lt!445633 (MissingVacant!9542 i!1194)) (= lt!445633 (MissingZero!9542 i!1194))))))

(declare-datatypes ((array!63578 0))(
  ( (array!63579 (arr!30610 (Array (_ BitVec 32) (_ BitVec 64))) (size!31112 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63578)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63578 (_ BitVec 32)) SeekEntryResult!9542)

(assert (=> b!1008305 (= lt!445633 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008306 () Bool)

(declare-fun e!567356 () Bool)

(declare-fun e!567357 () Bool)

(assert (=> b!1008306 (= e!567356 e!567357)))

(declare-fun res!677207 () Bool)

(assert (=> b!1008306 (=> (not res!677207) (not e!567357))))

(declare-fun lt!445637 () (_ BitVec 64))

(declare-fun lt!445631 () SeekEntryResult!9542)

(declare-fun lt!445632 () array!63578)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63578 (_ BitVec 32)) SeekEntryResult!9542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008306 (= res!677207 (not (= lt!445631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445637 mask!3464) lt!445637 lt!445632 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008306 (= lt!445637 (select (store (arr!30610 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008306 (= lt!445632 (array!63579 (store (arr!30610 a!3219) i!1194 k!2224) (size!31112 a!3219)))))

(declare-fun b!1008307 () Bool)

(declare-fun res!677208 () Bool)

(assert (=> b!1008307 (=> (not res!677208) (not e!567361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008307 (= res!677208 (validKeyInArray!0 k!2224))))

(declare-fun b!1008308 () Bool)

(declare-fun res!677198 () Bool)

(assert (=> b!1008308 (=> (not res!677198) (not e!567357))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445634 () SeekEntryResult!9542)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1008308 (= res!677198 (not (= lt!445634 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445637 lt!445632 mask!3464))))))

(declare-fun b!1008309 () Bool)

(declare-fun res!677201 () Bool)

(assert (=> b!1008309 (=> (not res!677201) (not e!567358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63578 (_ BitVec 32)) Bool)

(assert (=> b!1008309 (= res!677201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008310 () Bool)

(declare-fun res!677209 () Bool)

(assert (=> b!1008310 (=> (not res!677209) (not e!567357))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008310 (= res!677209 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008311 () Bool)

(declare-fun res!677199 () Bool)

(assert (=> b!1008311 (=> (not res!677199) (not e!567361))))

(assert (=> b!1008311 (= res!677199 (and (= (size!31112 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31112 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31112 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008312 () Bool)

(assert (=> b!1008312 (= e!567357 false)))

(declare-fun lt!445635 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008312 (= lt!445635 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008313 () Bool)

(declare-fun e!567360 () Bool)

(assert (=> b!1008313 (= e!567360 e!567356)))

(declare-fun res!677211 () Bool)

(assert (=> b!1008313 (=> (not res!677211) (not e!567356))))

(declare-fun lt!445636 () SeekEntryResult!9542)

(assert (=> b!1008313 (= res!677211 (= lt!445634 lt!445636))))

(assert (=> b!1008313 (= lt!445634 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30610 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!677203 () Bool)

(assert (=> start!86930 (=> (not res!677203) (not e!567361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86930 (= res!677203 (validMask!0 mask!3464))))

(assert (=> start!86930 e!567361))

(declare-fun array_inv!23734 (array!63578) Bool)

(assert (=> start!86930 (array_inv!23734 a!3219)))

(assert (=> start!86930 true))

(declare-fun b!1008314 () Bool)

(assert (=> b!1008314 (= e!567358 e!567360)))

(declare-fun res!677200 () Bool)

(assert (=> b!1008314 (=> (not res!677200) (not e!567360))))

(assert (=> b!1008314 (= res!677200 (= lt!445631 lt!445636))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008314 (= lt!445636 (Intermediate!9542 false resIndex!38 resX!38))))

(assert (=> b!1008314 (= lt!445631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30610 a!3219) j!170) mask!3464) (select (arr!30610 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008315 () Bool)

(declare-fun res!677206 () Bool)

(assert (=> b!1008315 (=> (not res!677206) (not e!567358))))

(declare-datatypes ((List!21286 0))(
  ( (Nil!21283) (Cons!21282 (h!22468 (_ BitVec 64)) (t!30287 List!21286)) )
))
(declare-fun arrayNoDuplicates!0 (array!63578 (_ BitVec 32) List!21286) Bool)

(assert (=> b!1008315 (= res!677206 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21283))))

(declare-fun b!1008316 () Bool)

(declare-fun res!677205 () Bool)

(assert (=> b!1008316 (=> (not res!677205) (not e!567361))))

(assert (=> b!1008316 (= res!677205 (validKeyInArray!0 (select (arr!30610 a!3219) j!170)))))

(declare-fun b!1008317 () Bool)

(declare-fun res!677202 () Bool)

(assert (=> b!1008317 (=> (not res!677202) (not e!567361))))

(declare-fun arrayContainsKey!0 (array!63578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008317 (= res!677202 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008318 () Bool)

(declare-fun res!677210 () Bool)

(assert (=> b!1008318 (=> (not res!677210) (not e!567358))))

(assert (=> b!1008318 (= res!677210 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31112 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31112 a!3219))))))

(assert (= (and start!86930 res!677203) b!1008311))

(assert (= (and b!1008311 res!677199) b!1008316))

(assert (= (and b!1008316 res!677205) b!1008307))

(assert (= (and b!1008307 res!677208) b!1008317))

(assert (= (and b!1008317 res!677202) b!1008305))

(assert (= (and b!1008305 res!677204) b!1008309))

(assert (= (and b!1008309 res!677201) b!1008315))

(assert (= (and b!1008315 res!677206) b!1008318))

(assert (= (and b!1008318 res!677210) b!1008314))

(assert (= (and b!1008314 res!677200) b!1008313))

(assert (= (and b!1008313 res!677211) b!1008306))

(assert (= (and b!1008306 res!677207) b!1008308))

(assert (= (and b!1008308 res!677198) b!1008310))

(assert (= (and b!1008310 res!677209) b!1008312))

(declare-fun m!933071 () Bool)

(assert (=> b!1008312 m!933071))

(declare-fun m!933073 () Bool)

(assert (=> b!1008315 m!933073))

(declare-fun m!933075 () Bool)

(assert (=> b!1008313 m!933075))

(assert (=> b!1008313 m!933075))

(declare-fun m!933077 () Bool)

(assert (=> b!1008313 m!933077))

(declare-fun m!933079 () Bool)

(assert (=> b!1008309 m!933079))

(declare-fun m!933081 () Bool)

(assert (=> b!1008317 m!933081))

(declare-fun m!933083 () Bool)

(assert (=> b!1008306 m!933083))

(assert (=> b!1008306 m!933083))

(declare-fun m!933085 () Bool)

(assert (=> b!1008306 m!933085))

(declare-fun m!933087 () Bool)

(assert (=> b!1008306 m!933087))

(declare-fun m!933089 () Bool)

(assert (=> b!1008306 m!933089))

(declare-fun m!933091 () Bool)

(assert (=> b!1008305 m!933091))

(assert (=> b!1008314 m!933075))

(assert (=> b!1008314 m!933075))

(declare-fun m!933093 () Bool)

(assert (=> b!1008314 m!933093))

(assert (=> b!1008314 m!933093))

(assert (=> b!1008314 m!933075))

(declare-fun m!933095 () Bool)

(assert (=> b!1008314 m!933095))

(declare-fun m!933097 () Bool)

(assert (=> b!1008307 m!933097))

(declare-fun m!933099 () Bool)

(assert (=> b!1008308 m!933099))

(declare-fun m!933101 () Bool)

(assert (=> start!86930 m!933101))

(declare-fun m!933103 () Bool)

(assert (=> start!86930 m!933103))

(assert (=> b!1008316 m!933075))

(assert (=> b!1008316 m!933075))

(declare-fun m!933105 () Bool)

(assert (=> b!1008316 m!933105))

(push 1)

