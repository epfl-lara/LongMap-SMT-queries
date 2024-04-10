; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31086 () Bool)

(assert start!31086)

(declare-fun b!312827 () Bool)

(declare-fun res!169290 () Bool)

(declare-fun e!195012 () Bool)

(assert (=> b!312827 (=> (not res!169290) (not e!195012))))

(declare-datatypes ((array!15988 0))(
  ( (array!15989 (arr!7576 (Array (_ BitVec 32) (_ BitVec 64))) (size!7928 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15988)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312827 (= res!169290 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312828 () Bool)

(declare-fun e!195013 () Bool)

(declare-fun e!195016 () Bool)

(assert (=> b!312828 (= e!195013 e!195016)))

(declare-fun res!169281 () Bool)

(assert (=> b!312828 (=> (not res!169281) (not e!195016))))

(declare-datatypes ((SeekEntryResult!2716 0))(
  ( (MissingZero!2716 (index!13040 (_ BitVec 32))) (Found!2716 (index!13041 (_ BitVec 32))) (Intermediate!2716 (undefined!3528 Bool) (index!13042 (_ BitVec 32)) (x!31241 (_ BitVec 32))) (Undefined!2716) (MissingVacant!2716 (index!13043 (_ BitVec 32))) )
))
(declare-fun lt!153343 () SeekEntryResult!2716)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!153341 () SeekEntryResult!2716)

(assert (=> b!312828 (= res!169281 (and (= lt!153341 lt!153343) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7576 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15988 (_ BitVec 32)) SeekEntryResult!2716)

(assert (=> b!312828 (= lt!153341 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312829 () Bool)

(declare-fun res!169282 () Bool)

(assert (=> b!312829 (=> (not res!169282) (not e!195012))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15988 (_ BitVec 32)) SeekEntryResult!2716)

(assert (=> b!312829 (= res!169282 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2716 i!1240)))))

(declare-fun b!312830 () Bool)

(declare-fun res!169283 () Bool)

(assert (=> b!312830 (=> (not res!169283) (not e!195013))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312830 (= res!169283 (and (= (select (arr!7576 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7928 a!3293))))))

(declare-fun b!312831 () Bool)

(assert (=> b!312831 (= e!195012 e!195013)))

(declare-fun res!169289 () Bool)

(assert (=> b!312831 (=> (not res!169289) (not e!195013))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312831 (= res!169289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153343))))

(assert (=> b!312831 (= lt!153343 (Intermediate!2716 false resIndex!52 resX!52))))

(declare-fun b!312832 () Bool)

(declare-fun e!195015 () Bool)

(assert (=> b!312832 (= e!195015 true)))

(declare-fun lt!153339 () SeekEntryResult!2716)

(declare-fun lt!153338 () SeekEntryResult!2716)

(assert (=> b!312832 (= lt!153339 lt!153338)))

(declare-datatypes ((Unit!9663 0))(
  ( (Unit!9664) )
))
(declare-fun lt!153342 () Unit!9663)

(declare-fun lt!153340 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15988 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9663)

(assert (=> b!312832 (= lt!153342 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153340 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312834 () Bool)

(declare-fun res!169284 () Bool)

(assert (=> b!312834 (=> (not res!169284) (not e!195012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15988 (_ BitVec 32)) Bool)

(assert (=> b!312834 (= res!169284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312835 () Bool)

(declare-fun res!169287 () Bool)

(assert (=> b!312835 (=> (not res!169287) (not e!195012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312835 (= res!169287 (validKeyInArray!0 k!2441))))

(declare-fun b!312836 () Bool)

(assert (=> b!312836 (= e!195016 (not e!195015))))

(declare-fun res!169285 () Bool)

(assert (=> b!312836 (=> res!169285 e!195015)))

(assert (=> b!312836 (= res!169285 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153340 #b00000000000000000000000000000000) (bvsge lt!153340 (size!7928 a!3293)) (not (= lt!153338 lt!153343))))))

(declare-fun lt!153344 () SeekEntryResult!2716)

(assert (=> b!312836 (= lt!153344 lt!153339)))

(declare-fun lt!153345 () array!15988)

(assert (=> b!312836 (= lt!153339 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153340 k!2441 lt!153345 mask!3709))))

(assert (=> b!312836 (= lt!153344 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153345 mask!3709))))

(assert (=> b!312836 (= lt!153345 (array!15989 (store (arr!7576 a!3293) i!1240 k!2441) (size!7928 a!3293)))))

(assert (=> b!312836 (= lt!153341 lt!153338)))

(assert (=> b!312836 (= lt!153338 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153340 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312836 (= lt!153340 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312833 () Bool)

(declare-fun res!169286 () Bool)

(assert (=> b!312833 (=> (not res!169286) (not e!195012))))

(assert (=> b!312833 (= res!169286 (and (= (size!7928 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7928 a!3293))))))

(declare-fun res!169288 () Bool)

(assert (=> start!31086 (=> (not res!169288) (not e!195012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31086 (= res!169288 (validMask!0 mask!3709))))

(assert (=> start!31086 e!195012))

(declare-fun array_inv!5539 (array!15988) Bool)

(assert (=> start!31086 (array_inv!5539 a!3293)))

(assert (=> start!31086 true))

(assert (= (and start!31086 res!169288) b!312833))

(assert (= (and b!312833 res!169286) b!312835))

(assert (= (and b!312835 res!169287) b!312827))

(assert (= (and b!312827 res!169290) b!312829))

(assert (= (and b!312829 res!169282) b!312834))

(assert (= (and b!312834 res!169284) b!312831))

(assert (= (and b!312831 res!169289) b!312830))

(assert (= (and b!312830 res!169283) b!312828))

(assert (= (and b!312828 res!169281) b!312836))

(assert (= (and b!312836 (not res!169285)) b!312832))

(declare-fun m!322963 () Bool)

(assert (=> b!312834 m!322963))

(declare-fun m!322965 () Bool)

(assert (=> b!312831 m!322965))

(assert (=> b!312831 m!322965))

(declare-fun m!322967 () Bool)

(assert (=> b!312831 m!322967))

(declare-fun m!322969 () Bool)

(assert (=> b!312836 m!322969))

(declare-fun m!322971 () Bool)

(assert (=> b!312836 m!322971))

(declare-fun m!322973 () Bool)

(assert (=> b!312836 m!322973))

(declare-fun m!322975 () Bool)

(assert (=> b!312836 m!322975))

(declare-fun m!322977 () Bool)

(assert (=> b!312836 m!322977))

(declare-fun m!322979 () Bool)

(assert (=> b!312830 m!322979))

(declare-fun m!322981 () Bool)

(assert (=> start!31086 m!322981))

(declare-fun m!322983 () Bool)

(assert (=> start!31086 m!322983))

(declare-fun m!322985 () Bool)

(assert (=> b!312828 m!322985))

(declare-fun m!322987 () Bool)

(assert (=> b!312828 m!322987))

(declare-fun m!322989 () Bool)

(assert (=> b!312835 m!322989))

(declare-fun m!322991 () Bool)

(assert (=> b!312827 m!322991))

(declare-fun m!322993 () Bool)

(assert (=> b!312832 m!322993))

(declare-fun m!322995 () Bool)

(assert (=> b!312829 m!322995))

(push 1)

