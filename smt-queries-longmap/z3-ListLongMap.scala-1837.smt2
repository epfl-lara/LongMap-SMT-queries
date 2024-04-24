; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33272 () Bool)

(assert start!33272)

(declare-fun b!330903 () Bool)

(declare-fun res!182358 () Bool)

(declare-fun e!203069 () Bool)

(assert (=> b!330903 (=> (not res!182358) (not e!203069))))

(declare-datatypes ((array!16893 0))(
  ( (array!16894 (arr!7987 (Array (_ BitVec 32) (_ BitVec 64))) (size!8339 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16893)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330903 (= res!182358 (and (= (select (arr!7987 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8339 a!3305))))))

(declare-fun b!330904 () Bool)

(declare-fun res!182363 () Bool)

(assert (=> b!330904 (=> (not res!182363) (not e!203069))))

(declare-datatypes ((SeekEntryResult!3083 0))(
  ( (MissingZero!3083 (index!14508 (_ BitVec 32))) (Found!3083 (index!14509 (_ BitVec 32))) (Intermediate!3083 (undefined!3895 Bool) (index!14510 (_ BitVec 32)) (x!32904 (_ BitVec 32))) (Undefined!3083) (MissingVacant!3083 (index!14511 (_ BitVec 32))) )
))
(declare-fun lt!158703 () SeekEntryResult!3083)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16893 (_ BitVec 32)) SeekEntryResult!3083)

(assert (=> b!330904 (= res!182363 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158703))))

(declare-fun b!330905 () Bool)

(declare-fun res!182362 () Bool)

(declare-fun e!203068 () Bool)

(assert (=> b!330905 (=> (not res!182362) (not e!203068))))

(declare-fun arrayContainsKey!0 (array!16893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330905 (= res!182362 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330906 () Bool)

(assert (=> b!330906 (= e!203069 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1490)) (bvsub #b01111111111111111111111111111110 x!1490)))))

(declare-fun lt!158702 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330906 (= lt!158702 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!330907 () Bool)

(declare-fun res!182360 () Bool)

(assert (=> b!330907 (=> (not res!182360) (not e!203069))))

(assert (=> b!330907 (= res!182360 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7987 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!182355 () Bool)

(assert (=> start!33272 (=> (not res!182355) (not e!203068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33272 (= res!182355 (validMask!0 mask!3777))))

(assert (=> start!33272 e!203068))

(declare-fun array_inv!5937 (array!16893) Bool)

(assert (=> start!33272 (array_inv!5937 a!3305)))

(assert (=> start!33272 true))

(declare-fun b!330908 () Bool)

(declare-fun res!182361 () Bool)

(assert (=> b!330908 (=> (not res!182361) (not e!203068))))

(assert (=> b!330908 (= res!182361 (and (= (size!8339 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8339 a!3305))))))

(declare-fun b!330909 () Bool)

(declare-fun res!182359 () Bool)

(assert (=> b!330909 (=> (not res!182359) (not e!203068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16893 (_ BitVec 32)) Bool)

(assert (=> b!330909 (= res!182359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330910 () Bool)

(declare-fun res!182357 () Bool)

(assert (=> b!330910 (=> (not res!182357) (not e!203068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330910 (= res!182357 (validKeyInArray!0 k0!2497))))

(declare-fun b!330911 () Bool)

(declare-fun res!182356 () Bool)

(assert (=> b!330911 (=> (not res!182356) (not e!203068))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16893 (_ BitVec 32)) SeekEntryResult!3083)

(assert (=> b!330911 (= res!182356 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3083 i!1250)))))

(declare-fun b!330912 () Bool)

(assert (=> b!330912 (= e!203068 e!203069)))

(declare-fun res!182364 () Bool)

(assert (=> b!330912 (=> (not res!182364) (not e!203069))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330912 (= res!182364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158703))))

(assert (=> b!330912 (= lt!158703 (Intermediate!3083 false resIndex!58 resX!58))))

(assert (= (and start!33272 res!182355) b!330908))

(assert (= (and b!330908 res!182361) b!330910))

(assert (= (and b!330910 res!182357) b!330905))

(assert (= (and b!330905 res!182362) b!330911))

(assert (= (and b!330911 res!182356) b!330909))

(assert (= (and b!330909 res!182359) b!330912))

(assert (= (and b!330912 res!182364) b!330903))

(assert (= (and b!330903 res!182358) b!330904))

(assert (= (and b!330904 res!182363) b!330907))

(assert (= (and b!330907 res!182360) b!330906))

(declare-fun m!336199 () Bool)

(assert (=> b!330912 m!336199))

(assert (=> b!330912 m!336199))

(declare-fun m!336201 () Bool)

(assert (=> b!330912 m!336201))

(declare-fun m!336203 () Bool)

(assert (=> b!330905 m!336203))

(declare-fun m!336205 () Bool)

(assert (=> b!330907 m!336205))

(declare-fun m!336207 () Bool)

(assert (=> b!330911 m!336207))

(declare-fun m!336209 () Bool)

(assert (=> start!33272 m!336209))

(declare-fun m!336211 () Bool)

(assert (=> start!33272 m!336211))

(declare-fun m!336213 () Bool)

(assert (=> b!330910 m!336213))

(declare-fun m!336215 () Bool)

(assert (=> b!330909 m!336215))

(declare-fun m!336217 () Bool)

(assert (=> b!330906 m!336217))

(declare-fun m!336219 () Bool)

(assert (=> b!330904 m!336219))

(declare-fun m!336221 () Bool)

(assert (=> b!330903 m!336221))

(check-sat (not b!330911) (not b!330912) (not b!330910) (not start!33272) (not b!330905) (not b!330909) (not b!330906) (not b!330904))
(check-sat)
