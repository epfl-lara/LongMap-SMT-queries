; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32442 () Bool)

(assert start!32442)

(declare-fun b!324105 () Bool)

(declare-fun res!177438 () Bool)

(declare-fun e!200171 () Bool)

(assert (=> b!324105 (=> (not res!177438) (not e!200171))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16581 0))(
  ( (array!16582 (arr!7848 (Array (_ BitVec 32) (_ BitVec 64))) (size!8200 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16581)

(declare-datatypes ((SeekEntryResult!2979 0))(
  ( (MissingZero!2979 (index!14092 (_ BitVec 32))) (Found!2979 (index!14093 (_ BitVec 32))) (Intermediate!2979 (undefined!3791 Bool) (index!14094 (_ BitVec 32)) (x!32343 (_ BitVec 32))) (Undefined!2979) (MissingVacant!2979 (index!14095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16581 (_ BitVec 32)) SeekEntryResult!2979)

(assert (=> b!324105 (= res!177438 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2979 i!1250)))))

(declare-fun b!324106 () Bool)

(declare-fun res!177437 () Bool)

(assert (=> b!324106 (=> (not res!177437) (not e!200171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16581 (_ BitVec 32)) Bool)

(assert (=> b!324106 (= res!177437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324107 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun e!200172 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324107 (= e!200172 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7848 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!324108 () Bool)

(declare-fun res!177436 () Bool)

(assert (=> b!324108 (=> (not res!177436) (not e!200171))))

(declare-fun arrayContainsKey!0 (array!16581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324108 (= res!177436 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324109 () Bool)

(assert (=> b!324109 (= e!200171 e!200172)))

(declare-fun res!177440 () Bool)

(assert (=> b!324109 (=> (not res!177440) (not e!200172))))

(declare-fun lt!156753 () SeekEntryResult!2979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16581 (_ BitVec 32)) SeekEntryResult!2979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324109 (= res!177440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156753))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324109 (= lt!156753 (Intermediate!2979 false resIndex!58 resX!58))))

(declare-fun res!177444 () Bool)

(assert (=> start!32442 (=> (not res!177444) (not e!200171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32442 (= res!177444 (validMask!0 mask!3777))))

(assert (=> start!32442 e!200171))

(declare-fun array_inv!5811 (array!16581) Bool)

(assert (=> start!32442 (array_inv!5811 a!3305)))

(assert (=> start!32442 true))

(declare-fun b!324110 () Bool)

(declare-fun res!177441 () Bool)

(assert (=> b!324110 (=> (not res!177441) (not e!200172))))

(assert (=> b!324110 (= res!177441 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156753))))

(declare-fun b!324111 () Bool)

(declare-fun res!177439 () Bool)

(assert (=> b!324111 (=> (not res!177439) (not e!200171))))

(assert (=> b!324111 (= res!177439 (and (= (size!8200 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8200 a!3305))))))

(declare-fun b!324112 () Bool)

(declare-fun res!177442 () Bool)

(assert (=> b!324112 (=> (not res!177442) (not e!200171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324112 (= res!177442 (validKeyInArray!0 k0!2497))))

(declare-fun b!324113 () Bool)

(declare-fun res!177443 () Bool)

(assert (=> b!324113 (=> (not res!177443) (not e!200172))))

(assert (=> b!324113 (= res!177443 (and (= (select (arr!7848 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8200 a!3305))))))

(assert (= (and start!32442 res!177444) b!324111))

(assert (= (and b!324111 res!177439) b!324112))

(assert (= (and b!324112 res!177442) b!324108))

(assert (= (and b!324108 res!177436) b!324105))

(assert (= (and b!324105 res!177438) b!324106))

(assert (= (and b!324106 res!177437) b!324109))

(assert (= (and b!324109 res!177440) b!324113))

(assert (= (and b!324113 res!177443) b!324110))

(assert (= (and b!324110 res!177441) b!324107))

(declare-fun m!331215 () Bool)

(assert (=> b!324109 m!331215))

(assert (=> b!324109 m!331215))

(declare-fun m!331217 () Bool)

(assert (=> b!324109 m!331217))

(declare-fun m!331219 () Bool)

(assert (=> b!324105 m!331219))

(declare-fun m!331221 () Bool)

(assert (=> b!324110 m!331221))

(declare-fun m!331223 () Bool)

(assert (=> b!324106 m!331223))

(declare-fun m!331225 () Bool)

(assert (=> b!324107 m!331225))

(declare-fun m!331227 () Bool)

(assert (=> b!324112 m!331227))

(declare-fun m!331229 () Bool)

(assert (=> b!324113 m!331229))

(declare-fun m!331231 () Bool)

(assert (=> b!324108 m!331231))

(declare-fun m!331233 () Bool)

(assert (=> start!32442 m!331233))

(declare-fun m!331235 () Bool)

(assert (=> start!32442 m!331235))

(check-sat (not start!32442) (not b!324106) (not b!324109) (not b!324105) (not b!324110) (not b!324108) (not b!324112))
(check-sat)
