; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86924 () Bool)

(assert start!86924)

(declare-fun res!677081 () Bool)

(declare-fun e!567303 () Bool)

(assert (=> start!86924 (=> (not res!677081) (not e!567303))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86924 (= res!677081 (validMask!0 mask!3464))))

(assert (=> start!86924 e!567303))

(declare-datatypes ((array!63572 0))(
  ( (array!63573 (arr!30607 (Array (_ BitVec 32) (_ BitVec 64))) (size!31109 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63572)

(declare-fun array_inv!23731 (array!63572) Bool)

(assert (=> start!86924 (array_inv!23731 a!3219)))

(assert (=> start!86924 true))

(declare-fun b!1008179 () Bool)

(declare-fun e!567307 () Bool)

(assert (=> b!1008179 (= e!567307 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445568 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008179 (= lt!445568 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008180 () Bool)

(declare-fun res!677073 () Bool)

(assert (=> b!1008180 (=> (not res!677073) (not e!567303))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008180 (= res!677073 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008181 () Bool)

(declare-fun res!677077 () Bool)

(assert (=> b!1008181 (=> (not res!677077) (not e!567307))))

(declare-fun lt!445574 () array!63572)

(declare-fun lt!445570 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9539 0))(
  ( (MissingZero!9539 (index!40527 (_ BitVec 32))) (Found!9539 (index!40528 (_ BitVec 32))) (Intermediate!9539 (undefined!10351 Bool) (index!40529 (_ BitVec 32)) (x!87921 (_ BitVec 32))) (Undefined!9539) (MissingVacant!9539 (index!40530 (_ BitVec 32))) )
))
(declare-fun lt!445569 () SeekEntryResult!9539)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63572 (_ BitVec 32)) SeekEntryResult!9539)

(assert (=> b!1008181 (= res!677077 (not (= lt!445569 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445570 lt!445574 mask!3464))))))

(declare-fun b!1008182 () Bool)

(declare-fun e!567304 () Bool)

(assert (=> b!1008182 (= e!567303 e!567304)))

(declare-fun res!677079 () Bool)

(assert (=> b!1008182 (=> (not res!677079) (not e!567304))))

(declare-fun lt!445572 () SeekEntryResult!9539)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008182 (= res!677079 (or (= lt!445572 (MissingVacant!9539 i!1194)) (= lt!445572 (MissingZero!9539 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63572 (_ BitVec 32)) SeekEntryResult!9539)

(assert (=> b!1008182 (= lt!445572 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008183 () Bool)

(declare-fun res!677083 () Bool)

(assert (=> b!1008183 (=> (not res!677083) (not e!567307))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008183 (= res!677083 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008184 () Bool)

(declare-fun e!567305 () Bool)

(declare-fun e!567302 () Bool)

(assert (=> b!1008184 (= e!567305 e!567302)))

(declare-fun res!677074 () Bool)

(assert (=> b!1008184 (=> (not res!677074) (not e!567302))))

(declare-fun lt!445573 () SeekEntryResult!9539)

(assert (=> b!1008184 (= res!677074 (= lt!445569 lt!445573))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008184 (= lt!445569 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30607 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008185 () Bool)

(declare-fun res!677080 () Bool)

(assert (=> b!1008185 (=> (not res!677080) (not e!567303))))

(assert (=> b!1008185 (= res!677080 (and (= (size!31109 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31109 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31109 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008186 () Bool)

(declare-fun res!677084 () Bool)

(assert (=> b!1008186 (=> (not res!677084) (not e!567303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008186 (= res!677084 (validKeyInArray!0 (select (arr!30607 a!3219) j!170)))))

(declare-fun b!1008187 () Bool)

(declare-fun res!677076 () Bool)

(assert (=> b!1008187 (=> (not res!677076) (not e!567304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63572 (_ BitVec 32)) Bool)

(assert (=> b!1008187 (= res!677076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008188 () Bool)

(assert (=> b!1008188 (= e!567302 e!567307)))

(declare-fun res!677085 () Bool)

(assert (=> b!1008188 (=> (not res!677085) (not e!567307))))

(declare-fun lt!445571 () SeekEntryResult!9539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008188 (= res!677085 (not (= lt!445571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445570 mask!3464) lt!445570 lt!445574 mask!3464))))))

(assert (=> b!1008188 (= lt!445570 (select (store (arr!30607 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008188 (= lt!445574 (array!63573 (store (arr!30607 a!3219) i!1194 k!2224) (size!31109 a!3219)))))

(declare-fun b!1008189 () Bool)

(declare-fun res!677078 () Bool)

(assert (=> b!1008189 (=> (not res!677078) (not e!567303))))

(assert (=> b!1008189 (= res!677078 (validKeyInArray!0 k!2224))))

(declare-fun b!1008190 () Bool)

(assert (=> b!1008190 (= e!567304 e!567305)))

(declare-fun res!677082 () Bool)

(assert (=> b!1008190 (=> (not res!677082) (not e!567305))))

(assert (=> b!1008190 (= res!677082 (= lt!445571 lt!445573))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008190 (= lt!445573 (Intermediate!9539 false resIndex!38 resX!38))))

(assert (=> b!1008190 (= lt!445571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30607 a!3219) j!170) mask!3464) (select (arr!30607 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008191 () Bool)

(declare-fun res!677075 () Bool)

(assert (=> b!1008191 (=> (not res!677075) (not e!567304))))

(declare-datatypes ((List!21283 0))(
  ( (Nil!21280) (Cons!21279 (h!22465 (_ BitVec 64)) (t!30284 List!21283)) )
))
(declare-fun arrayNoDuplicates!0 (array!63572 (_ BitVec 32) List!21283) Bool)

(assert (=> b!1008191 (= res!677075 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21280))))

(declare-fun b!1008192 () Bool)

(declare-fun res!677072 () Bool)

(assert (=> b!1008192 (=> (not res!677072) (not e!567304))))

(assert (=> b!1008192 (= res!677072 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31109 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31109 a!3219))))))

(assert (= (and start!86924 res!677081) b!1008185))

(assert (= (and b!1008185 res!677080) b!1008186))

(assert (= (and b!1008186 res!677084) b!1008189))

(assert (= (and b!1008189 res!677078) b!1008180))

(assert (= (and b!1008180 res!677073) b!1008182))

(assert (= (and b!1008182 res!677079) b!1008187))

(assert (= (and b!1008187 res!677076) b!1008191))

(assert (= (and b!1008191 res!677075) b!1008192))

(assert (= (and b!1008192 res!677072) b!1008190))

(assert (= (and b!1008190 res!677082) b!1008184))

(assert (= (and b!1008184 res!677074) b!1008188))

(assert (= (and b!1008188 res!677085) b!1008181))

(assert (= (and b!1008181 res!677077) b!1008183))

(assert (= (and b!1008183 res!677083) b!1008179))

(declare-fun m!932963 () Bool)

(assert (=> b!1008181 m!932963))

(declare-fun m!932965 () Bool)

(assert (=> start!86924 m!932965))

(declare-fun m!932967 () Bool)

(assert (=> start!86924 m!932967))

(declare-fun m!932969 () Bool)

(assert (=> b!1008191 m!932969))

(declare-fun m!932971 () Bool)

(assert (=> b!1008182 m!932971))

(declare-fun m!932973 () Bool)

(assert (=> b!1008187 m!932973))

(declare-fun m!932975 () Bool)

(assert (=> b!1008184 m!932975))

(assert (=> b!1008184 m!932975))

(declare-fun m!932977 () Bool)

(assert (=> b!1008184 m!932977))

(assert (=> b!1008186 m!932975))

(assert (=> b!1008186 m!932975))

(declare-fun m!932979 () Bool)

(assert (=> b!1008186 m!932979))

(declare-fun m!932981 () Bool)

(assert (=> b!1008180 m!932981))

(declare-fun m!932983 () Bool)

(assert (=> b!1008189 m!932983))

(assert (=> b!1008190 m!932975))

(assert (=> b!1008190 m!932975))

(declare-fun m!932985 () Bool)

(assert (=> b!1008190 m!932985))

(assert (=> b!1008190 m!932985))

(assert (=> b!1008190 m!932975))

(declare-fun m!932987 () Bool)

(assert (=> b!1008190 m!932987))

(declare-fun m!932989 () Bool)

(assert (=> b!1008179 m!932989))

(declare-fun m!932991 () Bool)

(assert (=> b!1008188 m!932991))

(assert (=> b!1008188 m!932991))

(declare-fun m!932993 () Bool)

(assert (=> b!1008188 m!932993))

(declare-fun m!932995 () Bool)

(assert (=> b!1008188 m!932995))

(declare-fun m!932997 () Bool)

(assert (=> b!1008188 m!932997))

(push 1)

(assert (not b!1008180))

(assert (not b!1008189))

(assert (not start!86924))

(assert (not b!1008190))

(assert (not b!1008181))

