; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31586 () Bool)

(assert start!31586)

(declare-fun b!316024 () Bool)

(declare-fun res!171202 () Bool)

(declare-fun e!196608 () Bool)

(assert (=> b!316024 (=> (not res!171202) (not e!196608))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316024 (= res!171202 (validKeyInArray!0 k!2441))))

(declare-fun res!171204 () Bool)

(assert (=> start!31586 (=> (not res!171204) (not e!196608))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31586 (= res!171204 (validMask!0 mask!3709))))

(assert (=> start!31586 e!196608))

(declare-datatypes ((array!16110 0))(
  ( (array!16111 (arr!7625 (Array (_ BitVec 32) (_ BitVec 64))) (size!7977 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16110)

(declare-fun array_inv!5588 (array!16110) Bool)

(assert (=> start!31586 (array_inv!5588 a!3293)))

(assert (=> start!31586 true))

(declare-fun b!316025 () Bool)

(declare-fun res!171207 () Bool)

(assert (=> b!316025 (=> (not res!171207) (not e!196608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16110 (_ BitVec 32)) Bool)

(assert (=> b!316025 (= res!171207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316026 () Bool)

(declare-datatypes ((Unit!9752 0))(
  ( (Unit!9753) )
))
(declare-fun e!196611 () Unit!9752)

(declare-fun Unit!9754 () Unit!9752)

(assert (=> b!316026 (= e!196611 Unit!9754)))

(declare-fun b!316027 () Bool)

(assert (=> b!316027 false))

(declare-fun e!196612 () Unit!9752)

(declare-fun Unit!9755 () Unit!9752)

(assert (=> b!316027 (= e!196612 Unit!9755)))

(declare-fun b!316028 () Bool)

(assert (=> b!316028 (= e!196611 e!196612)))

(declare-fun c!50031 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316028 (= c!50031 (or (= (select (arr!7625 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7625 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316029 () Bool)

(assert (=> b!316029 false))

(declare-datatypes ((SeekEntryResult!2765 0))(
  ( (MissingZero!2765 (index!13236 (_ BitVec 32))) (Found!2765 (index!13237 (_ BitVec 32))) (Intermediate!2765 (undefined!3577 Bool) (index!13238 (_ BitVec 32)) (x!31483 (_ BitVec 32))) (Undefined!2765) (MissingVacant!2765 (index!13239 (_ BitVec 32))) )
))
(declare-fun lt!154430 () SeekEntryResult!2765)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16110 (_ BitVec 32)) SeekEntryResult!2765)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316029 (= lt!154430 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9756 () Unit!9752)

(assert (=> b!316029 (= e!196612 Unit!9756)))

(declare-fun b!316030 () Bool)

(declare-fun res!171203 () Bool)

(assert (=> b!316030 (=> (not res!171203) (not e!196608))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16110 (_ BitVec 32)) SeekEntryResult!2765)

(assert (=> b!316030 (= res!171203 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2765 i!1240)))))

(declare-fun b!316031 () Bool)

(declare-fun res!171205 () Bool)

(declare-fun e!196610 () Bool)

(assert (=> b!316031 (=> (not res!171205) (not e!196610))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!316031 (= res!171205 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7625 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!316032 () Bool)

(declare-fun res!171198 () Bool)

(assert (=> b!316032 (=> (not res!171198) (not e!196610))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316032 (= res!171198 (and (= (select (arr!7625 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7977 a!3293))))))

(declare-fun b!316033 () Bool)

(assert (=> b!316033 (= e!196610 (not true))))

(assert (=> b!316033 (= index!1781 resIndex!52)))

(declare-fun lt!154429 () Unit!9752)

(assert (=> b!316033 (= lt!154429 e!196611)))

(declare-fun c!50030 () Bool)

(assert (=> b!316033 (= c!50030 (not (= resIndex!52 index!1781)))))

(declare-fun b!316034 () Bool)

(declare-fun res!171206 () Bool)

(assert (=> b!316034 (=> (not res!171206) (not e!196610))))

(declare-fun lt!154431 () SeekEntryResult!2765)

(assert (=> b!316034 (= res!171206 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154431))))

(declare-fun b!316035 () Bool)

(assert (=> b!316035 (= e!196608 e!196610)))

(declare-fun res!171199 () Bool)

(assert (=> b!316035 (=> (not res!171199) (not e!196610))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316035 (= res!171199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154431))))

(assert (=> b!316035 (= lt!154431 (Intermediate!2765 false resIndex!52 resX!52))))

(declare-fun b!316036 () Bool)

(declare-fun res!171201 () Bool)

(assert (=> b!316036 (=> (not res!171201) (not e!196608))))

(assert (=> b!316036 (= res!171201 (and (= (size!7977 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7977 a!3293))))))

(declare-fun b!316037 () Bool)

(declare-fun res!171200 () Bool)

(assert (=> b!316037 (=> (not res!171200) (not e!196608))))

(declare-fun arrayContainsKey!0 (array!16110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316037 (= res!171200 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31586 res!171204) b!316036))

(assert (= (and b!316036 res!171201) b!316024))

(assert (= (and b!316024 res!171202) b!316037))

(assert (= (and b!316037 res!171200) b!316030))

(assert (= (and b!316030 res!171203) b!316025))

(assert (= (and b!316025 res!171207) b!316035))

(assert (= (and b!316035 res!171199) b!316032))

(assert (= (and b!316032 res!171198) b!316034))

(assert (= (and b!316034 res!171206) b!316031))

(assert (= (and b!316031 res!171205) b!316033))

(assert (= (and b!316033 c!50030) b!316028))

(assert (= (and b!316033 (not c!50030)) b!316026))

(assert (= (and b!316028 c!50031) b!316027))

(assert (= (and b!316028 (not c!50031)) b!316029))

(declare-fun m!325067 () Bool)

(assert (=> b!316031 m!325067))

(declare-fun m!325069 () Bool)

(assert (=> start!31586 m!325069))

(declare-fun m!325071 () Bool)

(assert (=> start!31586 m!325071))

(assert (=> b!316028 m!325067))

(declare-fun m!325073 () Bool)

(assert (=> b!316025 m!325073))

(declare-fun m!325075 () Bool)

(assert (=> b!316032 m!325075))

(declare-fun m!325077 () Bool)

(assert (=> b!316030 m!325077))

(declare-fun m!325079 () Bool)

(assert (=> b!316029 m!325079))

(assert (=> b!316029 m!325079))

(declare-fun m!325081 () Bool)

(assert (=> b!316029 m!325081))

(declare-fun m!325083 () Bool)

(assert (=> b!316035 m!325083))

(assert (=> b!316035 m!325083))

(declare-fun m!325085 () Bool)

(assert (=> b!316035 m!325085))

(declare-fun m!325087 () Bool)

(assert (=> b!316037 m!325087))

(declare-fun m!325089 () Bool)

(assert (=> b!316024 m!325089))

(declare-fun m!325091 () Bool)

(assert (=> b!316034 m!325091))

(push 1)

