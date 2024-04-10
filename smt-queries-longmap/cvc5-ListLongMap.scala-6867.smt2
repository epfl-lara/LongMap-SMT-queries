; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86456 () Bool)

(assert start!86456)

(declare-fun b!1000968 () Bool)

(declare-fun e!564083 () Bool)

(declare-fun e!564084 () Bool)

(assert (=> b!1000968 (= e!564083 e!564084)))

(declare-fun res!670455 () Bool)

(assert (=> b!1000968 (=> (not res!670455) (not e!564084))))

(declare-datatypes ((SeekEntryResult!9386 0))(
  ( (MissingZero!9386 (index!39915 (_ BitVec 32))) (Found!9386 (index!39916 (_ BitVec 32))) (Intermediate!9386 (undefined!10198 Bool) (index!39917 (_ BitVec 32)) (x!87342 (_ BitVec 32))) (Undefined!9386) (MissingVacant!9386 (index!39918 (_ BitVec 32))) )
))
(declare-fun lt!442457 () SeekEntryResult!9386)

(declare-fun lt!442454 () SeekEntryResult!9386)

(assert (=> b!1000968 (= res!670455 (= lt!442457 lt!442454))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000968 (= lt!442454 (Intermediate!9386 false resIndex!38 resX!38))))

(declare-datatypes ((array!63257 0))(
  ( (array!63258 (arr!30454 (Array (_ BitVec 32) (_ BitVec 64))) (size!30956 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63257)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63257 (_ BitVec 32)) SeekEntryResult!9386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000968 (= lt!442457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30454 a!3219) j!170) mask!3464) (select (arr!30454 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000969 () Bool)

(declare-fun res!670451 () Bool)

(declare-fun e!564082 () Bool)

(assert (=> b!1000969 (=> (not res!670451) (not e!564082))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442453 () SeekEntryResult!9386)

(declare-fun lt!442456 () array!63257)

(declare-fun lt!442455 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000969 (= res!670451 (not (= lt!442453 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442455 lt!442456 mask!3464))))))

(declare-fun b!1000970 () Bool)

(declare-fun res!670458 () Bool)

(assert (=> b!1000970 (=> (not res!670458) (not e!564083))))

(assert (=> b!1000970 (= res!670458 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30956 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30956 a!3219))))))

(declare-fun b!1000971 () Bool)

(declare-fun res!670457 () Bool)

(declare-fun e!564085 () Bool)

(assert (=> b!1000971 (=> (not res!670457) (not e!564085))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000971 (= res!670457 (and (= (size!30956 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30956 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30956 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000972 () Bool)

(declare-fun res!670450 () Bool)

(assert (=> b!1000972 (=> (not res!670450) (not e!564085))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000972 (= res!670450 (validKeyInArray!0 k!2224))))

(declare-fun b!1000973 () Bool)

(declare-fun e!564080 () Bool)

(assert (=> b!1000973 (= e!564084 e!564080)))

(declare-fun res!670446 () Bool)

(assert (=> b!1000973 (=> (not res!670446) (not e!564080))))

(assert (=> b!1000973 (= res!670446 (= lt!442453 lt!442454))))

(assert (=> b!1000973 (= lt!442453 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30454 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000974 () Bool)

(assert (=> b!1000974 (= e!564085 e!564083)))

(declare-fun res!670454 () Bool)

(assert (=> b!1000974 (=> (not res!670454) (not e!564083))))

(declare-fun lt!442452 () SeekEntryResult!9386)

(assert (=> b!1000974 (= res!670454 (or (= lt!442452 (MissingVacant!9386 i!1194)) (= lt!442452 (MissingZero!9386 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63257 (_ BitVec 32)) SeekEntryResult!9386)

(assert (=> b!1000974 (= lt!442452 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000975 () Bool)

(declare-fun res!670456 () Bool)

(assert (=> b!1000975 (=> (not res!670456) (not e!564085))))

(declare-fun arrayContainsKey!0 (array!63257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000975 (= res!670456 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!670452 () Bool)

(assert (=> start!86456 (=> (not res!670452) (not e!564085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86456 (= res!670452 (validMask!0 mask!3464))))

(assert (=> start!86456 e!564085))

(declare-fun array_inv!23578 (array!63257) Bool)

(assert (=> start!86456 (array_inv!23578 a!3219)))

(assert (=> start!86456 true))

(declare-fun b!1000976 () Bool)

(declare-fun res!670449 () Bool)

(assert (=> b!1000976 (=> (not res!670449) (not e!564083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63257 (_ BitVec 32)) Bool)

(assert (=> b!1000976 (= res!670449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000977 () Bool)

(assert (=> b!1000977 (= e!564080 e!564082)))

(declare-fun res!670448 () Bool)

(assert (=> b!1000977 (=> (not res!670448) (not e!564082))))

(assert (=> b!1000977 (= res!670448 (not (= lt!442457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442455 mask!3464) lt!442455 lt!442456 mask!3464))))))

(assert (=> b!1000977 (= lt!442455 (select (store (arr!30454 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1000977 (= lt!442456 (array!63258 (store (arr!30454 a!3219) i!1194 k!2224) (size!30956 a!3219)))))

(declare-fun b!1000978 () Bool)

(declare-fun res!670447 () Bool)

(assert (=> b!1000978 (=> (not res!670447) (not e!564085))))

(assert (=> b!1000978 (= res!670447 (validKeyInArray!0 (select (arr!30454 a!3219) j!170)))))

(declare-fun b!1000979 () Bool)

(assert (=> b!1000979 (= e!564082 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!1000980 () Bool)

(declare-fun res!670453 () Bool)

(assert (=> b!1000980 (=> (not res!670453) (not e!564083))))

(declare-datatypes ((List!21130 0))(
  ( (Nil!21127) (Cons!21126 (h!22303 (_ BitVec 64)) (t!30131 List!21130)) )
))
(declare-fun arrayNoDuplicates!0 (array!63257 (_ BitVec 32) List!21130) Bool)

(assert (=> b!1000980 (= res!670453 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21127))))

(assert (= (and start!86456 res!670452) b!1000971))

(assert (= (and b!1000971 res!670457) b!1000978))

(assert (= (and b!1000978 res!670447) b!1000972))

(assert (= (and b!1000972 res!670450) b!1000975))

(assert (= (and b!1000975 res!670456) b!1000974))

(assert (= (and b!1000974 res!670454) b!1000976))

(assert (= (and b!1000976 res!670449) b!1000980))

(assert (= (and b!1000980 res!670453) b!1000970))

(assert (= (and b!1000970 res!670458) b!1000968))

(assert (= (and b!1000968 res!670455) b!1000973))

(assert (= (and b!1000973 res!670446) b!1000977))

(assert (= (and b!1000977 res!670448) b!1000969))

(assert (= (and b!1000969 res!670451) b!1000979))

(declare-fun m!927083 () Bool)

(assert (=> b!1000976 m!927083))

(declare-fun m!927085 () Bool)

(assert (=> b!1000977 m!927085))

(assert (=> b!1000977 m!927085))

(declare-fun m!927087 () Bool)

(assert (=> b!1000977 m!927087))

(declare-fun m!927089 () Bool)

(assert (=> b!1000977 m!927089))

(declare-fun m!927091 () Bool)

(assert (=> b!1000977 m!927091))

(declare-fun m!927093 () Bool)

(assert (=> b!1000968 m!927093))

(assert (=> b!1000968 m!927093))

(declare-fun m!927095 () Bool)

(assert (=> b!1000968 m!927095))

(assert (=> b!1000968 m!927095))

(assert (=> b!1000968 m!927093))

(declare-fun m!927097 () Bool)

(assert (=> b!1000968 m!927097))

(declare-fun m!927099 () Bool)

(assert (=> b!1000975 m!927099))

(declare-fun m!927101 () Bool)

(assert (=> start!86456 m!927101))

(declare-fun m!927103 () Bool)

(assert (=> start!86456 m!927103))

(declare-fun m!927105 () Bool)

(assert (=> b!1000974 m!927105))

(declare-fun m!927107 () Bool)

(assert (=> b!1000969 m!927107))

(assert (=> b!1000973 m!927093))

(assert (=> b!1000973 m!927093))

(declare-fun m!927109 () Bool)

(assert (=> b!1000973 m!927109))

(declare-fun m!927111 () Bool)

(assert (=> b!1000980 m!927111))

(declare-fun m!927113 () Bool)

(assert (=> b!1000972 m!927113))

(assert (=> b!1000978 m!927093))

(assert (=> b!1000978 m!927093))

(declare-fun m!927115 () Bool)

(assert (=> b!1000978 m!927115))

(push 1)

