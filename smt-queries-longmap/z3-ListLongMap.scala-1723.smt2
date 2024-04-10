; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31792 () Bool)

(assert start!31792)

(declare-fun b!317522 () Bool)

(declare-fun res!172104 () Bool)

(declare-fun e!197409 () Bool)

(assert (=> b!317522 (=> (not res!172104) (not e!197409))))

(declare-datatypes ((array!16163 0))(
  ( (array!16164 (arr!7647 (Array (_ BitVec 32) (_ BitVec 64))) (size!7999 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16163)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16163 (_ BitVec 32)) Bool)

(assert (=> b!317522 (= res!172104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317523 () Bool)

(declare-fun e!197407 () Bool)

(declare-fun lt!154986 () array!16163)

(declare-fun lt!154983 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2787 0))(
  ( (MissingZero!2787 (index!13324 (_ BitVec 32))) (Found!2787 (index!13325 (_ BitVec 32))) (Intermediate!2787 (undefined!3599 Bool) (index!13326 (_ BitVec 32)) (x!31588 (_ BitVec 32))) (Undefined!2787) (MissingVacant!2787 (index!13327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16163 (_ BitVec 32)) SeekEntryResult!2787)

(assert (=> b!317523 (= e!197407 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154986 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154983 k0!2441 lt!154986 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317523 (= lt!154986 (array!16164 (store (arr!7647 a!3293) i!1240 k0!2441) (size!7999 a!3293)))))

(declare-fun b!317524 () Bool)

(declare-fun res!172107 () Bool)

(assert (=> b!317524 (=> (not res!172107) (not e!197409))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16163 (_ BitVec 32)) SeekEntryResult!2787)

(assert (=> b!317524 (= res!172107 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2787 i!1240)))))

(declare-fun b!317525 () Bool)

(declare-fun res!172102 () Bool)

(assert (=> b!317525 (=> (not res!172102) (not e!197409))))

(declare-fun arrayContainsKey!0 (array!16163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317525 (= res!172102 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317526 () Bool)

(declare-fun res!172103 () Bool)

(declare-fun e!197410 () Bool)

(assert (=> b!317526 (=> (not res!172103) (not e!197410))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317526 (= res!172103 (and (= (select (arr!7647 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7999 a!3293))))))

(declare-fun b!317527 () Bool)

(declare-fun e!197408 () Bool)

(assert (=> b!317527 (= e!197408 (not true))))

(assert (=> b!317527 e!197407))

(declare-fun res!172110 () Bool)

(assert (=> b!317527 (=> (not res!172110) (not e!197407))))

(declare-fun lt!154984 () SeekEntryResult!2787)

(assert (=> b!317527 (= res!172110 (= lt!154984 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154983 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317527 (= lt!154983 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172101 () Bool)

(assert (=> start!31792 (=> (not res!172101) (not e!197409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31792 (= res!172101 (validMask!0 mask!3709))))

(assert (=> start!31792 e!197409))

(declare-fun array_inv!5610 (array!16163) Bool)

(assert (=> start!31792 (array_inv!5610 a!3293)))

(assert (=> start!31792 true))

(declare-fun b!317528 () Bool)

(declare-fun res!172108 () Bool)

(assert (=> b!317528 (=> (not res!172108) (not e!197409))))

(assert (=> b!317528 (= res!172108 (and (= (size!7999 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7999 a!3293))))))

(declare-fun b!317529 () Bool)

(assert (=> b!317529 (= e!197410 e!197408)))

(declare-fun res!172105 () Bool)

(assert (=> b!317529 (=> (not res!172105) (not e!197408))))

(declare-fun lt!154985 () SeekEntryResult!2787)

(assert (=> b!317529 (= res!172105 (and (= lt!154984 lt!154985) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7647 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317529 (= lt!154984 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317530 () Bool)

(assert (=> b!317530 (= e!197409 e!197410)))

(declare-fun res!172109 () Bool)

(assert (=> b!317530 (=> (not res!172109) (not e!197410))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317530 (= res!172109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154985))))

(assert (=> b!317530 (= lt!154985 (Intermediate!2787 false resIndex!52 resX!52))))

(declare-fun b!317531 () Bool)

(declare-fun res!172106 () Bool)

(assert (=> b!317531 (=> (not res!172106) (not e!197409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317531 (= res!172106 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31792 res!172101) b!317528))

(assert (= (and b!317528 res!172108) b!317531))

(assert (= (and b!317531 res!172106) b!317525))

(assert (= (and b!317525 res!172102) b!317524))

(assert (= (and b!317524 res!172107) b!317522))

(assert (= (and b!317522 res!172104) b!317530))

(assert (= (and b!317530 res!172109) b!317526))

(assert (= (and b!317526 res!172103) b!317529))

(assert (= (and b!317529 res!172105) b!317527))

(assert (= (and b!317527 res!172110) b!317523))

(declare-fun m!326161 () Bool)

(assert (=> b!317530 m!326161))

(assert (=> b!317530 m!326161))

(declare-fun m!326163 () Bool)

(assert (=> b!317530 m!326163))

(declare-fun m!326165 () Bool)

(assert (=> b!317529 m!326165))

(declare-fun m!326167 () Bool)

(assert (=> b!317529 m!326167))

(declare-fun m!326169 () Bool)

(assert (=> b!317531 m!326169))

(declare-fun m!326171 () Bool)

(assert (=> b!317523 m!326171))

(declare-fun m!326173 () Bool)

(assert (=> b!317523 m!326173))

(declare-fun m!326175 () Bool)

(assert (=> b!317523 m!326175))

(declare-fun m!326177 () Bool)

(assert (=> b!317525 m!326177))

(declare-fun m!326179 () Bool)

(assert (=> b!317524 m!326179))

(declare-fun m!326181 () Bool)

(assert (=> start!31792 m!326181))

(declare-fun m!326183 () Bool)

(assert (=> start!31792 m!326183))

(declare-fun m!326185 () Bool)

(assert (=> b!317522 m!326185))

(declare-fun m!326187 () Bool)

(assert (=> b!317527 m!326187))

(declare-fun m!326189 () Bool)

(assert (=> b!317527 m!326189))

(declare-fun m!326191 () Bool)

(assert (=> b!317526 m!326191))

(check-sat (not b!317530) (not start!31792) (not b!317522) (not b!317523) (not b!317531) (not b!317529) (not b!317524) (not b!317525) (not b!317527))
(check-sat)
