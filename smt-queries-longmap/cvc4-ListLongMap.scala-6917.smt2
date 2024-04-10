; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86922 () Bool)

(assert start!86922)

(declare-fun res!677036 () Bool)

(declare-fun e!567285 () Bool)

(assert (=> start!86922 (=> (not res!677036) (not e!567285))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86922 (= res!677036 (validMask!0 mask!3464))))

(assert (=> start!86922 e!567285))

(declare-datatypes ((array!63570 0))(
  ( (array!63571 (arr!30606 (Array (_ BitVec 32) (_ BitVec 64))) (size!31108 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63570)

(declare-fun array_inv!23730 (array!63570) Bool)

(assert (=> start!86922 (array_inv!23730 a!3219)))

(assert (=> start!86922 true))

(declare-fun b!1008137 () Bool)

(declare-fun res!677031 () Bool)

(assert (=> b!1008137 (=> (not res!677031) (not e!567285))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008137 (= res!677031 (and (= (size!31108 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31108 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31108 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008138 () Bool)

(declare-fun e!567286 () Bool)

(assert (=> b!1008138 (= e!567286 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445553 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008138 (= lt!445553 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008139 () Bool)

(declare-fun res!677037 () Bool)

(assert (=> b!1008139 (=> (not res!677037) (not e!567285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008139 (= res!677037 (validKeyInArray!0 (select (arr!30606 a!3219) j!170)))))

(declare-fun b!1008140 () Bool)

(declare-fun res!677042 () Bool)

(assert (=> b!1008140 (=> (not res!677042) (not e!567286))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008140 (= res!677042 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008141 () Bool)

(declare-fun e!567287 () Bool)

(assert (=> b!1008141 (= e!567287 e!567286)))

(declare-fun res!677040 () Bool)

(assert (=> b!1008141 (=> (not res!677040) (not e!567286))))

(declare-datatypes ((SeekEntryResult!9538 0))(
  ( (MissingZero!9538 (index!40523 (_ BitVec 32))) (Found!9538 (index!40524 (_ BitVec 32))) (Intermediate!9538 (undefined!10350 Bool) (index!40525 (_ BitVec 32)) (x!87912 (_ BitVec 32))) (Undefined!9538) (MissingVacant!9538 (index!40526 (_ BitVec 32))) )
))
(declare-fun lt!445552 () SeekEntryResult!9538)

(declare-fun lt!445548 () array!63570)

(declare-fun lt!445550 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63570 (_ BitVec 32)) SeekEntryResult!9538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008141 (= res!677040 (not (= lt!445552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445550 mask!3464) lt!445550 lt!445548 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1008141 (= lt!445550 (select (store (arr!30606 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008141 (= lt!445548 (array!63571 (store (arr!30606 a!3219) i!1194 k!2224) (size!31108 a!3219)))))

(declare-fun b!1008142 () Bool)

(declare-fun res!677043 () Bool)

(declare-fun e!567288 () Bool)

(assert (=> b!1008142 (=> (not res!677043) (not e!567288))))

(declare-datatypes ((List!21282 0))(
  ( (Nil!21279) (Cons!21278 (h!22464 (_ BitVec 64)) (t!30283 List!21282)) )
))
(declare-fun arrayNoDuplicates!0 (array!63570 (_ BitVec 32) List!21282) Bool)

(assert (=> b!1008142 (= res!677043 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21279))))

(declare-fun b!1008143 () Bool)

(declare-fun res!677038 () Bool)

(assert (=> b!1008143 (=> (not res!677038) (not e!567285))))

(assert (=> b!1008143 (= res!677038 (validKeyInArray!0 k!2224))))

(declare-fun b!1008144 () Bool)

(declare-fun e!567284 () Bool)

(assert (=> b!1008144 (= e!567284 e!567287)))

(declare-fun res!677034 () Bool)

(assert (=> b!1008144 (=> (not res!677034) (not e!567287))))

(declare-fun lt!445551 () SeekEntryResult!9538)

(declare-fun lt!445547 () SeekEntryResult!9538)

(assert (=> b!1008144 (= res!677034 (= lt!445551 lt!445547))))

(assert (=> b!1008144 (= lt!445551 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30606 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008145 () Bool)

(declare-fun res!677032 () Bool)

(assert (=> b!1008145 (=> (not res!677032) (not e!567288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63570 (_ BitVec 32)) Bool)

(assert (=> b!1008145 (= res!677032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008146 () Bool)

(assert (=> b!1008146 (= e!567288 e!567284)))

(declare-fun res!677033 () Bool)

(assert (=> b!1008146 (=> (not res!677033) (not e!567284))))

(assert (=> b!1008146 (= res!677033 (= lt!445552 lt!445547))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008146 (= lt!445547 (Intermediate!9538 false resIndex!38 resX!38))))

(assert (=> b!1008146 (= lt!445552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30606 a!3219) j!170) mask!3464) (select (arr!30606 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008147 () Bool)

(declare-fun res!677041 () Bool)

(assert (=> b!1008147 (=> (not res!677041) (not e!567288))))

(assert (=> b!1008147 (= res!677041 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31108 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31108 a!3219))))))

(declare-fun b!1008148 () Bool)

(declare-fun res!677039 () Bool)

(assert (=> b!1008148 (=> (not res!677039) (not e!567285))))

(declare-fun arrayContainsKey!0 (array!63570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008148 (= res!677039 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008149 () Bool)

(declare-fun res!677035 () Bool)

(assert (=> b!1008149 (=> (not res!677035) (not e!567286))))

(assert (=> b!1008149 (= res!677035 (not (= lt!445551 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445550 lt!445548 mask!3464))))))

(declare-fun b!1008150 () Bool)

(assert (=> b!1008150 (= e!567285 e!567288)))

(declare-fun res!677030 () Bool)

(assert (=> b!1008150 (=> (not res!677030) (not e!567288))))

(declare-fun lt!445549 () SeekEntryResult!9538)

(assert (=> b!1008150 (= res!677030 (or (= lt!445549 (MissingVacant!9538 i!1194)) (= lt!445549 (MissingZero!9538 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63570 (_ BitVec 32)) SeekEntryResult!9538)

(assert (=> b!1008150 (= lt!445549 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86922 res!677036) b!1008137))

(assert (= (and b!1008137 res!677031) b!1008139))

(assert (= (and b!1008139 res!677037) b!1008143))

(assert (= (and b!1008143 res!677038) b!1008148))

(assert (= (and b!1008148 res!677039) b!1008150))

(assert (= (and b!1008150 res!677030) b!1008145))

(assert (= (and b!1008145 res!677032) b!1008142))

(assert (= (and b!1008142 res!677043) b!1008147))

(assert (= (and b!1008147 res!677041) b!1008146))

(assert (= (and b!1008146 res!677033) b!1008144))

(assert (= (and b!1008144 res!677034) b!1008141))

(assert (= (and b!1008141 res!677040) b!1008149))

(assert (= (and b!1008149 res!677035) b!1008140))

(assert (= (and b!1008140 res!677042) b!1008138))

(declare-fun m!932927 () Bool)

(assert (=> b!1008143 m!932927))

(declare-fun m!932929 () Bool)

(assert (=> b!1008139 m!932929))

(assert (=> b!1008139 m!932929))

(declare-fun m!932931 () Bool)

(assert (=> b!1008139 m!932931))

(assert (=> b!1008146 m!932929))

(assert (=> b!1008146 m!932929))

(declare-fun m!932933 () Bool)

(assert (=> b!1008146 m!932933))

(assert (=> b!1008146 m!932933))

(assert (=> b!1008146 m!932929))

(declare-fun m!932935 () Bool)

(assert (=> b!1008146 m!932935))

(declare-fun m!932937 () Bool)

(assert (=> b!1008150 m!932937))

(declare-fun m!932939 () Bool)

(assert (=> b!1008142 m!932939))

(declare-fun m!932941 () Bool)

(assert (=> b!1008141 m!932941))

(assert (=> b!1008141 m!932941))

(declare-fun m!932943 () Bool)

(assert (=> b!1008141 m!932943))

(declare-fun m!932945 () Bool)

(assert (=> b!1008141 m!932945))

(declare-fun m!932947 () Bool)

(assert (=> b!1008141 m!932947))

(declare-fun m!932949 () Bool)

(assert (=> b!1008145 m!932949))

(declare-fun m!932951 () Bool)

(assert (=> b!1008138 m!932951))

(declare-fun m!932953 () Bool)

(assert (=> start!86922 m!932953))

(declare-fun m!932955 () Bool)

(assert (=> start!86922 m!932955))

(assert (=> b!1008144 m!932929))

(assert (=> b!1008144 m!932929))

(declare-fun m!932957 () Bool)

(assert (=> b!1008144 m!932957))

(declare-fun m!932959 () Bool)

(assert (=> b!1008148 m!932959))

(declare-fun m!932961 () Bool)

(assert (=> b!1008149 m!932961))

(push 1)

