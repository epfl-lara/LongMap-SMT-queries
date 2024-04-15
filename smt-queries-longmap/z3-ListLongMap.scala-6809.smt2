; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85652 () Bool)

(assert start!85652)

(declare-fun b!994159 () Bool)

(declare-fun e!561058 () Bool)

(declare-datatypes ((array!62819 0))(
  ( (array!62820 (arr!30249 (Array (_ BitVec 32) (_ BitVec 64))) (size!30753 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62819)

(assert (=> b!994159 (= e!561058 (bvsge #b00000000000000000000000000000000 (size!30753 a!3219)))))

(declare-fun res!664789 () Bool)

(assert (=> start!85652 (=> (not res!664789) (not e!561058))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85652 (= res!664789 (validMask!0 mask!3464))))

(assert (=> start!85652 e!561058))

(declare-fun array_inv!23392 (array!62819) Bool)

(assert (=> start!85652 (array_inv!23392 a!3219)))

(assert (=> start!85652 true))

(declare-fun b!994156 () Bool)

(declare-fun res!664787 () Bool)

(assert (=> b!994156 (=> (not res!664787) (not e!561058))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!994156 (= res!664787 (and (= (size!30753 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30753 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30753 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!994157 () Bool)

(declare-fun res!664790 () Bool)

(assert (=> b!994157 (=> (not res!664790) (not e!561058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!994157 (= res!664790 (validKeyInArray!0 (select (arr!30249 a!3219) j!170)))))

(declare-fun b!994158 () Bool)

(declare-fun res!664788 () Bool)

(assert (=> b!994158 (=> (not res!664788) (not e!561058))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!994158 (= res!664788 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85652 res!664789) b!994156))

(assert (= (and b!994156 res!664787) b!994157))

(assert (= (and b!994157 res!664790) b!994158))

(assert (= (and b!994158 res!664788) b!994159))

(declare-fun m!921241 () Bool)

(assert (=> start!85652 m!921241))

(declare-fun m!921243 () Bool)

(assert (=> start!85652 m!921243))

(declare-fun m!921245 () Bool)

(assert (=> b!994157 m!921245))

(assert (=> b!994157 m!921245))

(declare-fun m!921247 () Bool)

(assert (=> b!994157 m!921247))

(declare-fun m!921249 () Bool)

(assert (=> b!994158 m!921249))

(check-sat (not start!85652) (not b!994158) (not b!994157))
(check-sat)
