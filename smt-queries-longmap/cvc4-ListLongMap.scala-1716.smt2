; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31590 () Bool)

(assert start!31590)

(declare-fun b!316108 () Bool)

(assert (=> b!316108 false))

(declare-datatypes ((Unit!9762 0))(
  ( (Unit!9763) )
))
(declare-fun e!196642 () Unit!9762)

(declare-fun Unit!9764 () Unit!9762)

(assert (=> b!316108 (= e!196642 Unit!9764)))

(declare-fun b!316109 () Bool)

(declare-fun e!196641 () Bool)

(assert (=> b!316109 (= e!196641 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!316109 (= index!1781 resIndex!52)))

(declare-fun lt!154449 () Unit!9762)

(declare-fun e!196639 () Unit!9762)

(assert (=> b!316109 (= lt!154449 e!196639)))

(declare-fun c!50043 () Bool)

(assert (=> b!316109 (= c!50043 (not (= resIndex!52 index!1781)))))

(declare-fun b!316110 () Bool)

(declare-fun res!171267 () Bool)

(declare-fun e!196638 () Bool)

(assert (=> b!316110 (=> (not res!171267) (not e!196638))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316110 (= res!171267 (validKeyInArray!0 k!2441))))

(declare-fun b!316111 () Bool)

(declare-fun res!171265 () Bool)

(assert (=> b!316111 (=> (not res!171265) (not e!196641))))

(declare-datatypes ((array!16114 0))(
  ( (array!16115 (arr!7627 (Array (_ BitVec 32) (_ BitVec 64))) (size!7979 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16114)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!316111 (= res!171265 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7627 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!316112 () Bool)

(assert (=> b!316112 (= e!196639 e!196642)))

(declare-fun c!50042 () Bool)

(assert (=> b!316112 (= c!50042 (or (= (select (arr!7627 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7627 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!316113 () Bool)

(declare-fun res!171261 () Bool)

(assert (=> b!316113 (=> (not res!171261) (not e!196638))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2767 0))(
  ( (MissingZero!2767 (index!13244 (_ BitVec 32))) (Found!2767 (index!13245 (_ BitVec 32))) (Intermediate!2767 (undefined!3579 Bool) (index!13246 (_ BitVec 32)) (x!31485 (_ BitVec 32))) (Undefined!2767) (MissingVacant!2767 (index!13247 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16114 (_ BitVec 32)) SeekEntryResult!2767)

(assert (=> b!316113 (= res!171261 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2767 i!1240)))))

(declare-fun res!171264 () Bool)

(assert (=> start!31590 (=> (not res!171264) (not e!196638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31590 (= res!171264 (validMask!0 mask!3709))))

(assert (=> start!31590 e!196638))

(declare-fun array_inv!5590 (array!16114) Bool)

(assert (=> start!31590 (array_inv!5590 a!3293)))

(assert (=> start!31590 true))

(declare-fun b!316114 () Bool)

(declare-fun res!171266 () Bool)

(assert (=> b!316114 (=> (not res!171266) (not e!196641))))

(assert (=> b!316114 (= res!171266 (and (= (select (arr!7627 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7979 a!3293))))))

(declare-fun b!316115 () Bool)

(declare-fun res!171260 () Bool)

(assert (=> b!316115 (=> (not res!171260) (not e!196638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16114 (_ BitVec 32)) Bool)

(assert (=> b!316115 (= res!171260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316116 () Bool)

(assert (=> b!316116 false))

(declare-fun lt!154447 () SeekEntryResult!2767)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16114 (_ BitVec 32)) SeekEntryResult!2767)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316116 (= lt!154447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9765 () Unit!9762)

(assert (=> b!316116 (= e!196642 Unit!9765)))

(declare-fun b!316117 () Bool)

(assert (=> b!316117 (= e!196638 e!196641)))

(declare-fun res!171258 () Bool)

(assert (=> b!316117 (=> (not res!171258) (not e!196641))))

(declare-fun lt!154448 () SeekEntryResult!2767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316117 (= res!171258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154448))))

(assert (=> b!316117 (= lt!154448 (Intermediate!2767 false resIndex!52 resX!52))))

(declare-fun b!316118 () Bool)

(declare-fun res!171262 () Bool)

(assert (=> b!316118 (=> (not res!171262) (not e!196638))))

(assert (=> b!316118 (= res!171262 (and (= (size!7979 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7979 a!3293))))))

(declare-fun b!316119 () Bool)

(declare-fun res!171263 () Bool)

(assert (=> b!316119 (=> (not res!171263) (not e!196641))))

(assert (=> b!316119 (= res!171263 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154448))))

(declare-fun b!316120 () Bool)

(declare-fun Unit!9766 () Unit!9762)

(assert (=> b!316120 (= e!196639 Unit!9766)))

(declare-fun b!316121 () Bool)

(declare-fun res!171259 () Bool)

(assert (=> b!316121 (=> (not res!171259) (not e!196638))))

(declare-fun arrayContainsKey!0 (array!16114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316121 (= res!171259 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31590 res!171264) b!316118))

(assert (= (and b!316118 res!171262) b!316110))

(assert (= (and b!316110 res!171267) b!316121))

(assert (= (and b!316121 res!171259) b!316113))

(assert (= (and b!316113 res!171261) b!316115))

(assert (= (and b!316115 res!171260) b!316117))

(assert (= (and b!316117 res!171258) b!316114))

(assert (= (and b!316114 res!171266) b!316119))

(assert (= (and b!316119 res!171263) b!316111))

(assert (= (and b!316111 res!171265) b!316109))

(assert (= (and b!316109 c!50043) b!316112))

(assert (= (and b!316109 (not c!50043)) b!316120))

(assert (= (and b!316112 c!50042) b!316108))

(assert (= (and b!316112 (not c!50042)) b!316116))

(declare-fun m!325119 () Bool)

(assert (=> b!316117 m!325119))

(assert (=> b!316117 m!325119))

(declare-fun m!325121 () Bool)

(assert (=> b!316117 m!325121))

(declare-fun m!325123 () Bool)

(assert (=> b!316116 m!325123))

(assert (=> b!316116 m!325123))

(declare-fun m!325125 () Bool)

(assert (=> b!316116 m!325125))

(declare-fun m!325127 () Bool)

(assert (=> b!316115 m!325127))

(declare-fun m!325129 () Bool)

(assert (=> b!316110 m!325129))

(declare-fun m!325131 () Bool)

(assert (=> b!316114 m!325131))

(declare-fun m!325133 () Bool)

(assert (=> start!31590 m!325133))

(declare-fun m!325135 () Bool)

(assert (=> start!31590 m!325135))

(declare-fun m!325137 () Bool)

(assert (=> b!316121 m!325137))

(declare-fun m!325139 () Bool)

(assert (=> b!316111 m!325139))

(declare-fun m!325141 () Bool)

(assert (=> b!316113 m!325141))

(assert (=> b!316112 m!325139))

(declare-fun m!325143 () Bool)

(assert (=> b!316119 m!325143))

(push 1)

(assert (not b!316121))

(assert (not b!316115))

(assert (not b!316113))

(assert (not start!31590))

(assert (not b!316116))

(assert (not b!316110))

