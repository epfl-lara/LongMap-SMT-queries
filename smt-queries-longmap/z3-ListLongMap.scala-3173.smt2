; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44654 () Bool)

(assert start!44654)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!288096 () Bool)

(declare-datatypes ((array!31714 0))(
  ( (array!31715 (arr!15244 (Array (_ BitVec 32) (_ BitVec 64))) (size!15608 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31714)

(declare-fun b!489995 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3667 0))(
  ( (MissingZero!3667 (index!16847 (_ BitVec 32))) (Found!3667 (index!16848 (_ BitVec 32))) (Intermediate!3667 (undefined!4479 Bool) (index!16849 (_ BitVec 32)) (x!46098 (_ BitVec 32))) (Undefined!3667) (MissingVacant!3667 (index!16850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31714 (_ BitVec 32)) SeekEntryResult!3667)

(assert (=> b!489995 (= e!288096 (= (seekEntryOrOpen!0 (select (arr!15244 a!3235) j!176) a!3235 mask!3524) (Found!3667 j!176)))))

(declare-fun b!489996 () Bool)

(declare-fun e!288098 () Bool)

(assert (=> b!489996 (= e!288098 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!221250 () (_ BitVec 32))

(declare-fun lt!221254 () SeekEntryResult!3667)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31714 (_ BitVec 32)) SeekEntryResult!3667)

(assert (=> b!489996 (= lt!221254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221250 (select (store (arr!15244 a!3235) i!1204 k0!2280) j!176) (array!31715 (store (arr!15244 a!3235) i!1204 k0!2280) (size!15608 a!3235)) mask!3524))))

(declare-fun lt!221251 () SeekEntryResult!3667)

(declare-fun lt!221253 () (_ BitVec 32))

(assert (=> b!489996 (= lt!221251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221253 (select (arr!15244 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489996 (= lt!221250 (toIndex!0 (select (store (arr!15244 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489996 (= lt!221253 (toIndex!0 (select (arr!15244 a!3235) j!176) mask!3524))))

(assert (=> b!489996 e!288096))

(declare-fun res!292985 () Bool)

(assert (=> b!489996 (=> (not res!292985) (not e!288096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31714 (_ BitVec 32)) Bool)

(assert (=> b!489996 (= res!292985 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14341 0))(
  ( (Unit!14342) )
))
(declare-fun lt!221249 () Unit!14341)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14341)

(assert (=> b!489996 (= lt!221249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489997 () Bool)

(declare-fun res!292991 () Bool)

(declare-fun e!288097 () Bool)

(assert (=> b!489997 (=> (not res!292991) (not e!288097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489997 (= res!292991 (validKeyInArray!0 k0!2280))))

(declare-fun b!489999 () Bool)

(declare-fun res!292993 () Bool)

(assert (=> b!489999 (=> (not res!292993) (not e!288098))))

(assert (=> b!489999 (= res!292993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490000 () Bool)

(declare-fun res!292992 () Bool)

(assert (=> b!490000 (=> (not res!292992) (not e!288098))))

(declare-datatypes ((List!9309 0))(
  ( (Nil!9306) (Cons!9305 (h!10167 (_ BitVec 64)) (t!15529 List!9309)) )
))
(declare-fun arrayNoDuplicates!0 (array!31714 (_ BitVec 32) List!9309) Bool)

(assert (=> b!490000 (= res!292992 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9306))))

(declare-fun b!490001 () Bool)

(declare-fun res!292989 () Bool)

(assert (=> b!490001 (=> (not res!292989) (not e!288097))))

(assert (=> b!490001 (= res!292989 (and (= (size!15608 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15608 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15608 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490002 () Bool)

(declare-fun res!292990 () Bool)

(assert (=> b!490002 (=> (not res!292990) (not e!288097))))

(assert (=> b!490002 (= res!292990 (validKeyInArray!0 (select (arr!15244 a!3235) j!176)))))

(declare-fun b!490003 () Bool)

(assert (=> b!490003 (= e!288097 e!288098)))

(declare-fun res!292988 () Bool)

(assert (=> b!490003 (=> (not res!292988) (not e!288098))))

(declare-fun lt!221252 () SeekEntryResult!3667)

(assert (=> b!490003 (= res!292988 (or (= lt!221252 (MissingZero!3667 i!1204)) (= lt!221252 (MissingVacant!3667 i!1204))))))

(assert (=> b!490003 (= lt!221252 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292986 () Bool)

(assert (=> start!44654 (=> (not res!292986) (not e!288097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44654 (= res!292986 (validMask!0 mask!3524))))

(assert (=> start!44654 e!288097))

(assert (=> start!44654 true))

(declare-fun array_inv!11103 (array!31714) Bool)

(assert (=> start!44654 (array_inv!11103 a!3235)))

(declare-fun b!489998 () Bool)

(declare-fun res!292987 () Bool)

(assert (=> b!489998 (=> (not res!292987) (not e!288097))))

(declare-fun arrayContainsKey!0 (array!31714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489998 (= res!292987 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44654 res!292986) b!490001))

(assert (= (and b!490001 res!292989) b!490002))

(assert (= (and b!490002 res!292990) b!489997))

(assert (= (and b!489997 res!292991) b!489998))

(assert (= (and b!489998 res!292987) b!490003))

(assert (= (and b!490003 res!292988) b!489999))

(assert (= (and b!489999 res!292993) b!490000))

(assert (= (and b!490000 res!292992) b!489996))

(assert (= (and b!489996 res!292985) b!489995))

(declare-fun m!470221 () Bool)

(assert (=> b!489995 m!470221))

(assert (=> b!489995 m!470221))

(declare-fun m!470223 () Bool)

(assert (=> b!489995 m!470223))

(declare-fun m!470225 () Bool)

(assert (=> b!489997 m!470225))

(declare-fun m!470227 () Bool)

(assert (=> b!490000 m!470227))

(declare-fun m!470229 () Bool)

(assert (=> b!489999 m!470229))

(declare-fun m!470231 () Bool)

(assert (=> start!44654 m!470231))

(declare-fun m!470233 () Bool)

(assert (=> start!44654 m!470233))

(declare-fun m!470235 () Bool)

(assert (=> b!489996 m!470235))

(declare-fun m!470237 () Bool)

(assert (=> b!489996 m!470237))

(declare-fun m!470239 () Bool)

(assert (=> b!489996 m!470239))

(assert (=> b!489996 m!470239))

(declare-fun m!470241 () Bool)

(assert (=> b!489996 m!470241))

(assert (=> b!489996 m!470221))

(declare-fun m!470243 () Bool)

(assert (=> b!489996 m!470243))

(assert (=> b!489996 m!470221))

(declare-fun m!470245 () Bool)

(assert (=> b!489996 m!470245))

(assert (=> b!489996 m!470221))

(declare-fun m!470247 () Bool)

(assert (=> b!489996 m!470247))

(assert (=> b!489996 m!470239))

(declare-fun m!470249 () Bool)

(assert (=> b!489996 m!470249))

(assert (=> b!490002 m!470221))

(assert (=> b!490002 m!470221))

(declare-fun m!470251 () Bool)

(assert (=> b!490002 m!470251))

(declare-fun m!470253 () Bool)

(assert (=> b!489998 m!470253))

(declare-fun m!470255 () Bool)

(assert (=> b!490003 m!470255))

(check-sat (not b!489996) (not b!490002) (not b!489999) (not b!489998) (not b!490000) (not b!489995) (not b!489997) (not b!490003) (not start!44654))
(check-sat)
