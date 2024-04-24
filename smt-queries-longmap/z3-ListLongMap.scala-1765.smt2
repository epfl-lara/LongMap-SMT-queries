; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32222 () Bool)

(assert start!32222)

(declare-fun res!175172 () Bool)

(declare-fun e!199025 () Bool)

(assert (=> start!32222 (=> (not res!175172) (not e!199025))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32222 (= res!175172 (validMask!0 mask!3777))))

(assert (=> start!32222 e!199025))

(declare-datatypes ((array!16425 0))(
  ( (array!16426 (arr!7771 (Array (_ BitVec 32) (_ BitVec 64))) (size!8123 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16425)

(declare-fun array_inv!5721 (array!16425) Bool)

(assert (=> start!32222 (array_inv!5721 a!3305)))

(assert (=> start!32222 true))

(declare-fun b!321001 () Bool)

(declare-fun res!175178 () Bool)

(declare-fun e!199024 () Bool)

(assert (=> b!321001 (=> (not res!175178) (not e!199024))))

(declare-datatypes ((SeekEntryResult!2867 0))(
  ( (MissingZero!2867 (index!13644 (_ BitVec 32))) (Found!2867 (index!13645 (_ BitVec 32))) (Intermediate!2867 (undefined!3679 Bool) (index!13646 (_ BitVec 32)) (x!32019 (_ BitVec 32))) (Undefined!2867) (MissingVacant!2867 (index!13647 (_ BitVec 32))) )
))
(declare-fun lt!156168 () SeekEntryResult!2867)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16425 (_ BitVec 32)) SeekEntryResult!2867)

(assert (=> b!321001 (= res!175178 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156168))))

(declare-fun b!321002 () Bool)

(declare-fun res!175176 () Bool)

(assert (=> b!321002 (=> (not res!175176) (not e!199025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321002 (= res!175176 (validKeyInArray!0 k0!2497))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun b!321003 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321003 (= e!199024 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7771 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7771 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7771 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!321004 () Bool)

(declare-fun res!175174 () Bool)

(assert (=> b!321004 (=> (not res!175174) (not e!199025))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16425 (_ BitVec 32)) SeekEntryResult!2867)

(assert (=> b!321004 (= res!175174 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2867 i!1250)))))

(declare-fun b!321005 () Bool)

(declare-fun res!175179 () Bool)

(assert (=> b!321005 (=> (not res!175179) (not e!199025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16425 (_ BitVec 32)) Bool)

(assert (=> b!321005 (= res!175179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321006 () Bool)

(assert (=> b!321006 (= e!199025 e!199024)))

(declare-fun res!175177 () Bool)

(assert (=> b!321006 (=> (not res!175177) (not e!199024))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321006 (= res!175177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156168))))

(assert (=> b!321006 (= lt!156168 (Intermediate!2867 false resIndex!58 resX!58))))

(declare-fun b!321007 () Bool)

(declare-fun res!175173 () Bool)

(assert (=> b!321007 (=> (not res!175173) (not e!199025))))

(declare-fun arrayContainsKey!0 (array!16425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321007 (= res!175173 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321008 () Bool)

(declare-fun res!175171 () Bool)

(assert (=> b!321008 (=> (not res!175171) (not e!199024))))

(assert (=> b!321008 (= res!175171 (and (= (select (arr!7771 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8123 a!3305))))))

(declare-fun b!321009 () Bool)

(declare-fun res!175175 () Bool)

(assert (=> b!321009 (=> (not res!175175) (not e!199025))))

(assert (=> b!321009 (= res!175175 (and (= (size!8123 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8123 a!3305))))))

(assert (= (and start!32222 res!175172) b!321009))

(assert (= (and b!321009 res!175175) b!321002))

(assert (= (and b!321002 res!175176) b!321007))

(assert (= (and b!321007 res!175173) b!321004))

(assert (= (and b!321004 res!175174) b!321005))

(assert (= (and b!321005 res!175179) b!321006))

(assert (= (and b!321006 res!175177) b!321008))

(assert (= (and b!321008 res!175171) b!321001))

(assert (= (and b!321001 res!175178) b!321003))

(declare-fun m!329443 () Bool)

(assert (=> b!321002 m!329443))

(declare-fun m!329445 () Bool)

(assert (=> b!321001 m!329445))

(declare-fun m!329447 () Bool)

(assert (=> b!321004 m!329447))

(declare-fun m!329449 () Bool)

(assert (=> b!321005 m!329449))

(declare-fun m!329451 () Bool)

(assert (=> b!321006 m!329451))

(assert (=> b!321006 m!329451))

(declare-fun m!329453 () Bool)

(assert (=> b!321006 m!329453))

(declare-fun m!329455 () Bool)

(assert (=> start!32222 m!329455))

(declare-fun m!329457 () Bool)

(assert (=> start!32222 m!329457))

(declare-fun m!329459 () Bool)

(assert (=> b!321008 m!329459))

(declare-fun m!329461 () Bool)

(assert (=> b!321003 m!329461))

(declare-fun m!329463 () Bool)

(assert (=> b!321007 m!329463))

(check-sat (not b!321001) (not b!321002) (not b!321005) (not b!321007) (not start!32222) (not b!321006) (not b!321004))
(check-sat)
