; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30990 () Bool)

(assert start!30990)

(declare-fun b!311322 () Bool)

(declare-fun e!194222 () Bool)

(assert (=> b!311322 (= e!194222 (not true))))

(declare-fun e!194224 () Bool)

(assert (=> b!311322 e!194224))

(declare-fun res!167931 () Bool)

(assert (=> b!311322 (=> (not res!167931) (not e!194224))))

(declare-datatypes ((array!15896 0))(
  ( (array!15897 (arr!7530 (Array (_ BitVec 32) (_ BitVec 64))) (size!7883 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15896)

(declare-fun lt!152183 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2669 0))(
  ( (MissingZero!2669 (index!12852 (_ BitVec 32))) (Found!2669 (index!12853 (_ BitVec 32))) (Intermediate!2669 (undefined!3481 Bool) (index!12854 (_ BitVec 32)) (x!31085 (_ BitVec 32))) (Undefined!2669) (MissingVacant!2669 (index!12855 (_ BitVec 32))) )
))
(declare-fun lt!152184 () SeekEntryResult!2669)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15896 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!311322 (= res!167931 (= lt!152184 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152183 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311322 (= lt!152183 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311323 () Bool)

(declare-fun res!167923 () Bool)

(declare-fun e!194225 () Bool)

(assert (=> b!311323 (=> (not res!167923) (not e!194225))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15896 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!311323 (= res!167923 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2669 i!1240)))))

(declare-fun res!167924 () Bool)

(assert (=> start!30990 (=> (not res!167924) (not e!194225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30990 (= res!167924 (validMask!0 mask!3709))))

(assert (=> start!30990 e!194225))

(declare-fun array_inv!5502 (array!15896) Bool)

(assert (=> start!30990 (array_inv!5502 a!3293)))

(assert (=> start!30990 true))

(declare-fun b!311324 () Bool)

(declare-fun e!194223 () Bool)

(assert (=> b!311324 (= e!194225 e!194223)))

(declare-fun res!167929 () Bool)

(assert (=> b!311324 (=> (not res!167929) (not e!194223))))

(declare-fun lt!152185 () SeekEntryResult!2669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311324 (= res!167929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152185))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311324 (= lt!152185 (Intermediate!2669 false resIndex!52 resX!52))))

(declare-fun b!311325 () Bool)

(declare-fun res!167925 () Bool)

(assert (=> b!311325 (=> (not res!167925) (not e!194225))))

(declare-fun arrayContainsKey!0 (array!15896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311325 (= res!167925 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311326 () Bool)

(declare-fun res!167930 () Bool)

(assert (=> b!311326 (=> (not res!167930) (not e!194225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15896 (_ BitVec 32)) Bool)

(assert (=> b!311326 (= res!167930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311327 () Bool)

(declare-fun res!167922 () Bool)

(assert (=> b!311327 (=> (not res!167922) (not e!194225))))

(assert (=> b!311327 (= res!167922 (and (= (size!7883 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7883 a!3293))))))

(declare-fun lt!152186 () array!15896)

(declare-fun b!311328 () Bool)

(assert (=> b!311328 (= e!194224 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152186 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152183 k0!2441 lt!152186 mask!3709)))))

(assert (=> b!311328 (= lt!152186 (array!15897 (store (arr!7530 a!3293) i!1240 k0!2441) (size!7883 a!3293)))))

(declare-fun b!311329 () Bool)

(assert (=> b!311329 (= e!194223 e!194222)))

(declare-fun res!167926 () Bool)

(assert (=> b!311329 (=> (not res!167926) (not e!194222))))

(assert (=> b!311329 (= res!167926 (and (= lt!152184 lt!152185) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7530 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311329 (= lt!152184 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311330 () Bool)

(declare-fun res!167928 () Bool)

(assert (=> b!311330 (=> (not res!167928) (not e!194223))))

(assert (=> b!311330 (= res!167928 (and (= (select (arr!7530 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7883 a!3293))))))

(declare-fun b!311331 () Bool)

(declare-fun res!167927 () Bool)

(assert (=> b!311331 (=> (not res!167927) (not e!194225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311331 (= res!167927 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30990 res!167924) b!311327))

(assert (= (and b!311327 res!167922) b!311331))

(assert (= (and b!311331 res!167927) b!311325))

(assert (= (and b!311325 res!167925) b!311323))

(assert (= (and b!311323 res!167923) b!311326))

(assert (= (and b!311326 res!167930) b!311324))

(assert (= (and b!311324 res!167929) b!311330))

(assert (= (and b!311330 res!167928) b!311329))

(assert (= (and b!311329 res!167926) b!311322))

(assert (= (and b!311322 res!167931) b!311328))

(declare-fun m!320851 () Bool)

(assert (=> b!311325 m!320851))

(declare-fun m!320853 () Bool)

(assert (=> b!311322 m!320853))

(declare-fun m!320855 () Bool)

(assert (=> b!311322 m!320855))

(declare-fun m!320857 () Bool)

(assert (=> start!30990 m!320857))

(declare-fun m!320859 () Bool)

(assert (=> start!30990 m!320859))

(declare-fun m!320861 () Bool)

(assert (=> b!311328 m!320861))

(declare-fun m!320863 () Bool)

(assert (=> b!311328 m!320863))

(declare-fun m!320865 () Bool)

(assert (=> b!311328 m!320865))

(declare-fun m!320867 () Bool)

(assert (=> b!311323 m!320867))

(declare-fun m!320869 () Bool)

(assert (=> b!311326 m!320869))

(declare-fun m!320871 () Bool)

(assert (=> b!311329 m!320871))

(declare-fun m!320873 () Bool)

(assert (=> b!311329 m!320873))

(declare-fun m!320875 () Bool)

(assert (=> b!311324 m!320875))

(assert (=> b!311324 m!320875))

(declare-fun m!320877 () Bool)

(assert (=> b!311324 m!320877))

(declare-fun m!320879 () Bool)

(assert (=> b!311331 m!320879))

(declare-fun m!320881 () Bool)

(assert (=> b!311330 m!320881))

(check-sat (not b!311324) (not start!30990) (not b!311328) (not b!311329) (not b!311325) (not b!311322) (not b!311323) (not b!311331) (not b!311326))
(check-sat)
