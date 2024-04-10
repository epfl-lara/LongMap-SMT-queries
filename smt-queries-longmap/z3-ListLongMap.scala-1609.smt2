; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30328 () Bool)

(assert start!30328)

(declare-fun b!303707 () Bool)

(declare-fun res!161198 () Bool)

(declare-fun e!191045 () Bool)

(assert (=> b!303707 (=> (not res!161198) (not e!191045))))

(declare-datatypes ((array!15434 0))(
  ( (array!15435 (arr!7305 (Array (_ BitVec 32) (_ BitVec 64))) (size!7657 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15434)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303707 (= res!161198 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161202 () Bool)

(assert (=> start!30328 (=> (not res!161202) (not e!191045))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30328 (= res!161202 (validMask!0 mask!3709))))

(assert (=> start!30328 e!191045))

(declare-fun array_inv!5268 (array!15434) Bool)

(assert (=> start!30328 (array_inv!5268 a!3293)))

(assert (=> start!30328 true))

(declare-fun b!303708 () Bool)

(declare-fun res!161197 () Bool)

(assert (=> b!303708 (=> (not res!161197) (not e!191045))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303708 (= res!161197 (and (= (size!7657 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7657 a!3293))))))

(declare-fun b!303709 () Bool)

(declare-fun res!161193 () Bool)

(assert (=> b!303709 (=> (not res!161193) (not e!191045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15434 (_ BitVec 32)) Bool)

(assert (=> b!303709 (= res!161193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303710 () Bool)

(declare-fun e!191046 () Bool)

(assert (=> b!303710 (= e!191046 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!150242 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303710 (= lt!150242 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303711 () Bool)

(declare-fun res!161200 () Bool)

(assert (=> b!303711 (=> (not res!161200) (not e!191045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303711 (= res!161200 (validKeyInArray!0 k0!2441))))

(declare-fun b!303712 () Bool)

(declare-fun res!161196 () Bool)

(assert (=> b!303712 (=> (not res!161196) (not e!191046))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303712 (= res!161196 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7305 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7305 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7305 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303713 () Bool)

(declare-fun res!161195 () Bool)

(assert (=> b!303713 (=> (not res!161195) (not e!191046))))

(declare-datatypes ((SeekEntryResult!2445 0))(
  ( (MissingZero!2445 (index!11956 (_ BitVec 32))) (Found!2445 (index!11957 (_ BitVec 32))) (Intermediate!2445 (undefined!3257 Bool) (index!11958 (_ BitVec 32)) (x!30214 (_ BitVec 32))) (Undefined!2445) (MissingVacant!2445 (index!11959 (_ BitVec 32))) )
))
(declare-fun lt!150243 () SeekEntryResult!2445)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15434 (_ BitVec 32)) SeekEntryResult!2445)

(assert (=> b!303713 (= res!161195 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150243))))

(declare-fun b!303714 () Bool)

(assert (=> b!303714 (= e!191045 e!191046)))

(declare-fun res!161201 () Bool)

(assert (=> b!303714 (=> (not res!161201) (not e!191046))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303714 (= res!161201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150243))))

(assert (=> b!303714 (= lt!150243 (Intermediate!2445 false resIndex!52 resX!52))))

(declare-fun b!303715 () Bool)

(declare-fun res!161199 () Bool)

(assert (=> b!303715 (=> (not res!161199) (not e!191045))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15434 (_ BitVec 32)) SeekEntryResult!2445)

(assert (=> b!303715 (= res!161199 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2445 i!1240)))))

(declare-fun b!303716 () Bool)

(declare-fun res!161194 () Bool)

(assert (=> b!303716 (=> (not res!161194) (not e!191046))))

(assert (=> b!303716 (= res!161194 (and (= (select (arr!7305 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7657 a!3293))))))

(assert (= (and start!30328 res!161202) b!303708))

(assert (= (and b!303708 res!161197) b!303711))

(assert (= (and b!303711 res!161200) b!303707))

(assert (= (and b!303707 res!161198) b!303715))

(assert (= (and b!303715 res!161199) b!303709))

(assert (= (and b!303709 res!161193) b!303714))

(assert (= (and b!303714 res!161201) b!303716))

(assert (= (and b!303716 res!161194) b!303713))

(assert (= (and b!303713 res!161195) b!303712))

(assert (= (and b!303712 res!161196) b!303710))

(declare-fun m!315005 () Bool)

(assert (=> b!303709 m!315005))

(declare-fun m!315007 () Bool)

(assert (=> b!303712 m!315007))

(declare-fun m!315009 () Bool)

(assert (=> b!303710 m!315009))

(declare-fun m!315011 () Bool)

(assert (=> b!303707 m!315011))

(declare-fun m!315013 () Bool)

(assert (=> b!303715 m!315013))

(declare-fun m!315015 () Bool)

(assert (=> start!30328 m!315015))

(declare-fun m!315017 () Bool)

(assert (=> start!30328 m!315017))

(declare-fun m!315019 () Bool)

(assert (=> b!303711 m!315019))

(declare-fun m!315021 () Bool)

(assert (=> b!303713 m!315021))

(declare-fun m!315023 () Bool)

(assert (=> b!303714 m!315023))

(assert (=> b!303714 m!315023))

(declare-fun m!315025 () Bool)

(assert (=> b!303714 m!315025))

(declare-fun m!315027 () Bool)

(assert (=> b!303716 m!315027))

(check-sat (not b!303713) (not b!303710) (not b!303707) (not b!303711) (not b!303714) (not b!303715) (not start!30328) (not b!303709))
(check-sat)
