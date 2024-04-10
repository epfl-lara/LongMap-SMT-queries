; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32500 () Bool)

(assert start!32500)

(declare-fun b!324953 () Bool)

(declare-fun e!200432 () Bool)

(declare-fun e!200434 () Bool)

(assert (=> b!324953 (= e!200432 e!200434)))

(declare-fun res!178293 () Bool)

(assert (=> b!324953 (=> (not res!178293) (not e!200434))))

(declare-datatypes ((array!16639 0))(
  ( (array!16640 (arr!7877 (Array (_ BitVec 32) (_ BitVec 64))) (size!8229 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16639)

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3008 0))(
  ( (MissingZero!3008 (index!14208 (_ BitVec 32))) (Found!3008 (index!14209 (_ BitVec 32))) (Intermediate!3008 (undefined!3820 Bool) (index!14210 (_ BitVec 32)) (x!32452 (_ BitVec 32))) (Undefined!3008) (MissingVacant!3008 (index!14211 (_ BitVec 32))) )
))
(declare-fun lt!156905 () SeekEntryResult!3008)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16639 (_ BitVec 32)) SeekEntryResult!3008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324953 (= res!178293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156905))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324953 (= lt!156905 (Intermediate!3008 false resIndex!58 resX!58))))

(declare-fun b!324954 () Bool)

(declare-fun res!178292 () Bool)

(assert (=> b!324954 (=> (not res!178292) (not e!200432))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16639 (_ BitVec 32)) SeekEntryResult!3008)

(assert (=> b!324954 (= res!178292 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3008 i!1250)))))

(declare-fun b!324955 () Bool)

(declare-fun res!178285 () Bool)

(assert (=> b!324955 (=> (not res!178285) (not e!200434))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!324955 (= res!178285 (and (= (select (arr!7877 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8229 a!3305))))))

(declare-fun res!178291 () Bool)

(assert (=> start!32500 (=> (not res!178291) (not e!200432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32500 (= res!178291 (validMask!0 mask!3777))))

(assert (=> start!32500 e!200432))

(declare-fun array_inv!5840 (array!16639) Bool)

(assert (=> start!32500 (array_inv!5840 a!3305)))

(assert (=> start!32500 true))

(declare-fun b!324956 () Bool)

(declare-fun res!178289 () Bool)

(assert (=> b!324956 (=> (not res!178289) (not e!200432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16639 (_ BitVec 32)) Bool)

(assert (=> b!324956 (= res!178289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324957 () Bool)

(declare-fun res!178286 () Bool)

(assert (=> b!324957 (=> (not res!178286) (not e!200432))))

(assert (=> b!324957 (= res!178286 (and (= (size!8229 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8229 a!3305))))))

(declare-fun b!324958 () Bool)

(declare-fun res!178288 () Bool)

(assert (=> b!324958 (=> (not res!178288) (not e!200434))))

(assert (=> b!324958 (= res!178288 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7877 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324959 () Bool)

(declare-fun res!178290 () Bool)

(assert (=> b!324959 (=> (not res!178290) (not e!200432))))

(declare-fun arrayContainsKey!0 (array!16639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324959 (= res!178290 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324960 () Bool)

(assert (=> b!324960 (= e!200434 false)))

(declare-fun lt!156906 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324960 (= lt!156906 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324961 () Bool)

(declare-fun res!178284 () Bool)

(assert (=> b!324961 (=> (not res!178284) (not e!200434))))

(assert (=> b!324961 (= res!178284 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156905))))

(declare-fun b!324962 () Bool)

(declare-fun res!178287 () Bool)

(assert (=> b!324962 (=> (not res!178287) (not e!200432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324962 (= res!178287 (validKeyInArray!0 k!2497))))

(assert (= (and start!32500 res!178291) b!324957))

(assert (= (and b!324957 res!178286) b!324962))

(assert (= (and b!324962 res!178287) b!324959))

(assert (= (and b!324959 res!178290) b!324954))

(assert (= (and b!324954 res!178292) b!324956))

(assert (= (and b!324956 res!178289) b!324953))

(assert (= (and b!324953 res!178293) b!324955))

(assert (= (and b!324955 res!178285) b!324961))

(assert (= (and b!324961 res!178284) b!324958))

(assert (= (and b!324958 res!178288) b!324960))

(declare-fun m!331895 () Bool)

(assert (=> b!324958 m!331895))

(declare-fun m!331897 () Bool)

(assert (=> b!324962 m!331897))

(declare-fun m!331899 () Bool)

(assert (=> b!324960 m!331899))

(declare-fun m!331901 () Bool)

(assert (=> b!324961 m!331901))

(declare-fun m!331903 () Bool)

(assert (=> b!324953 m!331903))

(assert (=> b!324953 m!331903))

(declare-fun m!331905 () Bool)

(assert (=> b!324953 m!331905))

(declare-fun m!331907 () Bool)

(assert (=> start!32500 m!331907))

(declare-fun m!331909 () Bool)

(assert (=> start!32500 m!331909))

(declare-fun m!331911 () Bool)

(assert (=> b!324956 m!331911))

(declare-fun m!331913 () Bool)

(assert (=> b!324959 m!331913))

(declare-fun m!331915 () Bool)

(assert (=> b!324954 m!331915))

(declare-fun m!331917 () Bool)

(assert (=> b!324955 m!331917))

(push 1)

(assert (not start!32500))

(assert (not b!324960))

(assert (not b!324956))

(assert (not b!324953))

(assert (not b!324954))

(assert (not b!324962))

(assert (not b!324959))

(assert (not b!324961))

(check-sat)

