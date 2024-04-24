; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32426 () Bool)

(assert start!32426)

(declare-fun b!324025 () Bool)

(declare-fun res!177411 () Bool)

(declare-fun e!200128 () Bool)

(assert (=> b!324025 (=> (not res!177411) (not e!200128))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324025 (= res!177411 (validKeyInArray!0 k0!2497))))

(declare-fun res!177413 () Bool)

(assert (=> start!32426 (=> (not res!177413) (not e!200128))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32426 (= res!177413 (validMask!0 mask!3777))))

(assert (=> start!32426 e!200128))

(declare-datatypes ((array!16578 0))(
  ( (array!16579 (arr!7846 (Array (_ BitVec 32) (_ BitVec 64))) (size!8198 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16578)

(declare-fun array_inv!5796 (array!16578) Bool)

(assert (=> start!32426 (array_inv!5796 a!3305)))

(assert (=> start!32426 true))

(declare-fun b!324026 () Bool)

(declare-fun res!177409 () Bool)

(declare-fun e!200129 () Bool)

(assert (=> b!324026 (=> (not res!177409) (not e!200129))))

(declare-datatypes ((SeekEntryResult!2942 0))(
  ( (MissingZero!2942 (index!13944 (_ BitVec 32))) (Found!2942 (index!13945 (_ BitVec 32))) (Intermediate!2942 (undefined!3754 Bool) (index!13946 (_ BitVec 32)) (x!32303 (_ BitVec 32))) (Undefined!2942) (MissingVacant!2942 (index!13947 (_ BitVec 32))) )
))
(declare-fun lt!156768 () SeekEntryResult!2942)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16578 (_ BitVec 32)) SeekEntryResult!2942)

(assert (=> b!324026 (= res!177409 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156768))))

(declare-fun b!324027 () Bool)

(declare-fun res!177406 () Bool)

(assert (=> b!324027 (=> (not res!177406) (not e!200128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16578 (_ BitVec 32)) Bool)

(assert (=> b!324027 (= res!177406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324028 () Bool)

(declare-fun res!177414 () Bool)

(assert (=> b!324028 (=> (not res!177414) (not e!200129))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324028 (= res!177414 (and (= (select (arr!7846 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8198 a!3305))))))

(declare-fun b!324029 () Bool)

(assert (=> b!324029 (= e!200129 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7846 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!324030 () Bool)

(declare-fun res!177407 () Bool)

(assert (=> b!324030 (=> (not res!177407) (not e!200128))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16578 (_ BitVec 32)) SeekEntryResult!2942)

(assert (=> b!324030 (= res!177407 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2942 i!1250)))))

(declare-fun b!324031 () Bool)

(declare-fun res!177410 () Bool)

(assert (=> b!324031 (=> (not res!177410) (not e!200128))))

(declare-fun arrayContainsKey!0 (array!16578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324031 (= res!177410 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324032 () Bool)

(assert (=> b!324032 (= e!200128 e!200129)))

(declare-fun res!177408 () Bool)

(assert (=> b!324032 (=> (not res!177408) (not e!200129))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324032 (= res!177408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156768))))

(assert (=> b!324032 (= lt!156768 (Intermediate!2942 false resIndex!58 resX!58))))

(declare-fun b!324033 () Bool)

(declare-fun res!177412 () Bool)

(assert (=> b!324033 (=> (not res!177412) (not e!200128))))

(assert (=> b!324033 (= res!177412 (and (= (size!8198 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8198 a!3305))))))

(assert (= (and start!32426 res!177413) b!324033))

(assert (= (and b!324033 res!177412) b!324025))

(assert (= (and b!324025 res!177411) b!324031))

(assert (= (and b!324031 res!177410) b!324030))

(assert (= (and b!324030 res!177407) b!324027))

(assert (= (and b!324027 res!177406) b!324032))

(assert (= (and b!324032 res!177408) b!324028))

(assert (= (and b!324028 res!177414) b!324026))

(assert (= (and b!324026 res!177409) b!324029))

(declare-fun m!331375 () Bool)

(assert (=> b!324029 m!331375))

(declare-fun m!331377 () Bool)

(assert (=> b!324032 m!331377))

(assert (=> b!324032 m!331377))

(declare-fun m!331379 () Bool)

(assert (=> b!324032 m!331379))

(declare-fun m!331381 () Bool)

(assert (=> b!324025 m!331381))

(declare-fun m!331383 () Bool)

(assert (=> b!324027 m!331383))

(declare-fun m!331385 () Bool)

(assert (=> b!324031 m!331385))

(declare-fun m!331387 () Bool)

(assert (=> start!32426 m!331387))

(declare-fun m!331389 () Bool)

(assert (=> start!32426 m!331389))

(declare-fun m!331391 () Bool)

(assert (=> b!324028 m!331391))

(declare-fun m!331393 () Bool)

(assert (=> b!324030 m!331393))

(declare-fun m!331395 () Bool)

(assert (=> b!324026 m!331395))

(check-sat (not b!324026) (not b!324031) (not b!324025) (not b!324027) (not b!324030) (not b!324032) (not start!32426))
(check-sat)
