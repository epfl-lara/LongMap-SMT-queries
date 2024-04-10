; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32436 () Bool)

(assert start!32436)

(declare-fun b!324028 () Bool)

(declare-fun res!177366 () Bool)

(declare-fun e!200148 () Bool)

(assert (=> b!324028 (=> (not res!177366) (not e!200148))))

(declare-datatypes ((array!16575 0))(
  ( (array!16576 (arr!7845 (Array (_ BitVec 32) (_ BitVec 64))) (size!8197 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16575)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324028 (= res!177366 (and (= (select (arr!7845 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8197 a!3305))))))

(declare-fun b!324029 () Bool)

(declare-fun res!177361 () Bool)

(assert (=> b!324029 (=> (not res!177361) (not e!200148))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2976 0))(
  ( (MissingZero!2976 (index!14080 (_ BitVec 32))) (Found!2976 (index!14081 (_ BitVec 32))) (Intermediate!2976 (undefined!3788 Bool) (index!14082 (_ BitVec 32)) (x!32332 (_ BitVec 32))) (Undefined!2976) (MissingVacant!2976 (index!14083 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16575 (_ BitVec 32)) SeekEntryResult!2976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324029 (= res!177361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2976 false resIndex!58 resX!58)))))

(declare-fun b!324030 () Bool)

(declare-fun res!177365 () Bool)

(assert (=> b!324030 (=> (not res!177365) (not e!200148))))

(assert (=> b!324030 (= res!177365 (and (= (size!8197 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8197 a!3305))))))

(declare-fun b!324031 () Bool)

(declare-fun res!177364 () Bool)

(assert (=> b!324031 (=> (not res!177364) (not e!200148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16575 (_ BitVec 32)) Bool)

(assert (=> b!324031 (= res!177364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177360 () Bool)

(assert (=> start!32436 (=> (not res!177360) (not e!200148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32436 (= res!177360 (validMask!0 mask!3777))))

(assert (=> start!32436 e!200148))

(declare-fun array_inv!5808 (array!16575) Bool)

(assert (=> start!32436 (array_inv!5808 a!3305)))

(assert (=> start!32436 true))

(declare-fun b!324032 () Bool)

(declare-fun res!177359 () Bool)

(assert (=> b!324032 (=> (not res!177359) (not e!200148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324032 (= res!177359 (validKeyInArray!0 k0!2497))))

(declare-fun b!324033 () Bool)

(declare-fun res!177362 () Bool)

(assert (=> b!324033 (=> (not res!177362) (not e!200148))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16575 (_ BitVec 32)) SeekEntryResult!2976)

(assert (=> b!324033 (= res!177362 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2976 i!1250)))))

(declare-fun b!324034 () Bool)

(declare-fun res!177363 () Bool)

(assert (=> b!324034 (=> (not res!177363) (not e!200148))))

(declare-fun arrayContainsKey!0 (array!16575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324034 (= res!177363 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324035 () Bool)

(assert (=> b!324035 (= e!200148 false)))

(declare-fun lt!156744 () SeekEntryResult!2976)

(assert (=> b!324035 (= lt!156744 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(assert (= (and start!32436 res!177360) b!324030))

(assert (= (and b!324030 res!177365) b!324032))

(assert (= (and b!324032 res!177359) b!324034))

(assert (= (and b!324034 res!177363) b!324033))

(assert (= (and b!324033 res!177362) b!324031))

(assert (= (and b!324031 res!177364) b!324029))

(assert (= (and b!324029 res!177361) b!324028))

(assert (= (and b!324028 res!177366) b!324035))

(declare-fun m!331153 () Bool)

(assert (=> b!324029 m!331153))

(assert (=> b!324029 m!331153))

(declare-fun m!331155 () Bool)

(assert (=> b!324029 m!331155))

(declare-fun m!331157 () Bool)

(assert (=> b!324031 m!331157))

(declare-fun m!331159 () Bool)

(assert (=> start!32436 m!331159))

(declare-fun m!331161 () Bool)

(assert (=> start!32436 m!331161))

(declare-fun m!331163 () Bool)

(assert (=> b!324028 m!331163))

(declare-fun m!331165 () Bool)

(assert (=> b!324035 m!331165))

(declare-fun m!331167 () Bool)

(assert (=> b!324034 m!331167))

(declare-fun m!331169 () Bool)

(assert (=> b!324032 m!331169))

(declare-fun m!331171 () Bool)

(assert (=> b!324033 m!331171))

(check-sat (not b!324031) (not b!324032) (not start!32436) (not b!324034) (not b!324029) (not b!324033) (not b!324035))
