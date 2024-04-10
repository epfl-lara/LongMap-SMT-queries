; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31504 () Bool)

(assert start!31504)

(declare-fun res!170713 () Bool)

(declare-fun e!196267 () Bool)

(assert (=> start!31504 (=> (not res!170713) (not e!196267))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31504 (= res!170713 (validMask!0 mask!3709))))

(assert (=> start!31504 e!196267))

(declare-datatypes ((array!16079 0))(
  ( (array!16080 (arr!7611 (Array (_ BitVec 32) (_ BitVec 64))) (size!7963 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16079)

(declare-fun array_inv!5574 (array!16079) Bool)

(assert (=> start!31504 (array_inv!5574 a!3293)))

(assert (=> start!31504 true))

(declare-fun b!315258 () Bool)

(declare-fun res!170714 () Bool)

(assert (=> b!315258 (=> (not res!170714) (not e!196267))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315258 (= res!170714 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315259 () Bool)

(declare-fun e!196266 () Bool)

(declare-datatypes ((SeekEntryResult!2751 0))(
  ( (MissingZero!2751 (index!13180 (_ BitVec 32))) (Found!2751 (index!13181 (_ BitVec 32))) (Intermediate!2751 (undefined!3563 Bool) (index!13182 (_ BitVec 32)) (x!31420 (_ BitVec 32))) (Undefined!2751) (MissingVacant!2751 (index!13183 (_ BitVec 32))) )
))
(declare-fun lt!154192 () SeekEntryResult!2751)

(get-info :version)

(assert (=> b!315259 (= e!196266 (not ((_ is Intermediate!2751) lt!154192)))))

(declare-fun lt!154194 () SeekEntryResult!2751)

(assert (=> b!315259 (= lt!154194 lt!154192)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16079 (_ BitVec 32)) SeekEntryResult!2751)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315259 (= lt!154192 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!315260 () Bool)

(declare-fun res!170708 () Bool)

(declare-fun e!196265 () Bool)

(assert (=> b!315260 (=> (not res!170708) (not e!196265))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315260 (= res!170708 (and (= (select (arr!7611 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7963 a!3293))))))

(declare-fun b!315261 () Bool)

(declare-fun res!170710 () Bool)

(assert (=> b!315261 (=> (not res!170710) (not e!196267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315261 (= res!170710 (validKeyInArray!0 k0!2441))))

(declare-fun b!315262 () Bool)

(declare-fun res!170709 () Bool)

(assert (=> b!315262 (=> (not res!170709) (not e!196267))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16079 (_ BitVec 32)) SeekEntryResult!2751)

(assert (=> b!315262 (= res!170709 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2751 i!1240)))))

(declare-fun b!315263 () Bool)

(declare-fun res!170712 () Bool)

(assert (=> b!315263 (=> (not res!170712) (not e!196267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16079 (_ BitVec 32)) Bool)

(assert (=> b!315263 (= res!170712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315264 () Bool)

(assert (=> b!315264 (= e!196267 e!196265)))

(declare-fun res!170707 () Bool)

(assert (=> b!315264 (=> (not res!170707) (not e!196265))))

(declare-fun lt!154193 () SeekEntryResult!2751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315264 (= res!170707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154193))))

(assert (=> b!315264 (= lt!154193 (Intermediate!2751 false resIndex!52 resX!52))))

(declare-fun b!315265 () Bool)

(declare-fun res!170711 () Bool)

(assert (=> b!315265 (=> (not res!170711) (not e!196267))))

(assert (=> b!315265 (= res!170711 (and (= (size!7963 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7963 a!3293))))))

(declare-fun b!315266 () Bool)

(assert (=> b!315266 (= e!196265 e!196266)))

(declare-fun res!170715 () Bool)

(assert (=> b!315266 (=> (not res!170715) (not e!196266))))

(assert (=> b!315266 (= res!170715 (and (= lt!154194 lt!154193) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7611 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7611 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7611 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315266 (= lt!154194 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31504 res!170713) b!315265))

(assert (= (and b!315265 res!170711) b!315261))

(assert (= (and b!315261 res!170710) b!315258))

(assert (= (and b!315258 res!170714) b!315262))

(assert (= (and b!315262 res!170709) b!315263))

(assert (= (and b!315263 res!170712) b!315264))

(assert (= (and b!315264 res!170707) b!315260))

(assert (= (and b!315260 res!170708) b!315266))

(assert (= (and b!315266 res!170715) b!315259))

(declare-fun m!324565 () Bool)

(assert (=> start!31504 m!324565))

(declare-fun m!324567 () Bool)

(assert (=> start!31504 m!324567))

(declare-fun m!324569 () Bool)

(assert (=> b!315259 m!324569))

(assert (=> b!315259 m!324569))

(declare-fun m!324571 () Bool)

(assert (=> b!315259 m!324571))

(declare-fun m!324573 () Bool)

(assert (=> b!315260 m!324573))

(declare-fun m!324575 () Bool)

(assert (=> b!315262 m!324575))

(declare-fun m!324577 () Bool)

(assert (=> b!315266 m!324577))

(declare-fun m!324579 () Bool)

(assert (=> b!315266 m!324579))

(declare-fun m!324581 () Bool)

(assert (=> b!315258 m!324581))

(declare-fun m!324583 () Bool)

(assert (=> b!315263 m!324583))

(declare-fun m!324585 () Bool)

(assert (=> b!315261 m!324585))

(declare-fun m!324587 () Bool)

(assert (=> b!315264 m!324587))

(assert (=> b!315264 m!324587))

(declare-fun m!324589 () Bool)

(assert (=> b!315264 m!324589))

(check-sat (not b!315259) (not b!315262) (not b!315258) (not b!315264) (not start!31504) (not b!315266) (not b!315263) (not b!315261))
(check-sat)
