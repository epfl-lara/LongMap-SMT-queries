; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32714 () Bool)

(assert start!32714)

(declare-fun b!327011 () Bool)

(declare-fun res!180050 () Bool)

(declare-fun e!201198 () Bool)

(assert (=> b!327011 (=> (not res!180050) (not e!201198))))

(declare-datatypes ((array!16751 0))(
  ( (array!16752 (arr!7930 (Array (_ BitVec 32) (_ BitVec 64))) (size!8282 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16751)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16751 (_ BitVec 32)) Bool)

(assert (=> b!327011 (= res!180050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327012 () Bool)

(declare-fun e!201197 () Bool)

(assert (=> b!327012 (= e!201198 e!201197)))

(declare-fun res!180049 () Bool)

(assert (=> b!327012 (=> (not res!180049) (not e!201197))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3061 0))(
  ( (MissingZero!3061 (index!14420 (_ BitVec 32))) (Found!3061 (index!14421 (_ BitVec 32))) (Intermediate!3061 (undefined!3873 Bool) (index!14422 (_ BitVec 32)) (x!32659 (_ BitVec 32))) (Undefined!3061) (MissingVacant!3061 (index!14423 (_ BitVec 32))) )
))
(declare-fun lt!157439 () SeekEntryResult!3061)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16751 (_ BitVec 32)) SeekEntryResult!3061)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327012 (= res!180049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157439))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327012 (= lt!157439 (Intermediate!3061 false resIndex!58 resX!58))))

(declare-fun b!327013 () Bool)

(declare-fun res!180044 () Bool)

(assert (=> b!327013 (=> (not res!180044) (not e!201197))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327013 (= res!180044 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157439))))

(declare-fun b!327014 () Bool)

(declare-fun res!180046 () Bool)

(assert (=> b!327014 (=> (not res!180046) (not e!201198))))

(declare-fun arrayContainsKey!0 (array!16751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327014 (= res!180046 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327015 () Bool)

(assert (=> b!327015 (= e!201197 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-datatypes ((Unit!10156 0))(
  ( (Unit!10157) )
))
(declare-fun lt!157440 () Unit!10156)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16751 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10156)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327015 (= lt!157440 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!180048 () Bool)

(assert (=> start!32714 (=> (not res!180048) (not e!201198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32714 (= res!180048 (validMask!0 mask!3777))))

(assert (=> start!32714 e!201198))

(declare-fun array_inv!5893 (array!16751) Bool)

(assert (=> start!32714 (array_inv!5893 a!3305)))

(assert (=> start!32714 true))

(declare-fun b!327016 () Bool)

(declare-fun res!180051 () Bool)

(assert (=> b!327016 (=> (not res!180051) (not e!201198))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16751 (_ BitVec 32)) SeekEntryResult!3061)

(assert (=> b!327016 (= res!180051 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3061 i!1250)))))

(declare-fun b!327017 () Bool)

(declare-fun res!180045 () Bool)

(assert (=> b!327017 (=> (not res!180045) (not e!201198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327017 (= res!180045 (validKeyInArray!0 k!2497))))

(declare-fun b!327018 () Bool)

(declare-fun res!180047 () Bool)

(assert (=> b!327018 (=> (not res!180047) (not e!201197))))

(assert (=> b!327018 (= res!180047 (and (= (select (arr!7930 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8282 a!3305))))))

(declare-fun b!327019 () Bool)

(declare-fun res!180042 () Bool)

(assert (=> b!327019 (=> (not res!180042) (not e!201198))))

(assert (=> b!327019 (= res!180042 (and (= (size!8282 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8282 a!3305))))))

(declare-fun b!327020 () Bool)

(declare-fun res!180043 () Bool)

(assert (=> b!327020 (=> (not res!180043) (not e!201197))))

(assert (=> b!327020 (= res!180043 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7930 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32714 res!180048) b!327019))

(assert (= (and b!327019 res!180042) b!327017))

(assert (= (and b!327017 res!180045) b!327014))

(assert (= (and b!327014 res!180046) b!327016))

(assert (= (and b!327016 res!180051) b!327011))

(assert (= (and b!327011 res!180050) b!327012))

(assert (= (and b!327012 res!180049) b!327018))

(assert (= (and b!327018 res!180047) b!327013))

(assert (= (and b!327013 res!180044) b!327020))

(assert (= (and b!327020 res!180043) b!327015))

(declare-fun m!333483 () Bool)

(assert (=> b!327014 m!333483))

(declare-fun m!333485 () Bool)

(assert (=> b!327013 m!333485))

(declare-fun m!333487 () Bool)

(assert (=> start!32714 m!333487))

(declare-fun m!333489 () Bool)

(assert (=> start!32714 m!333489))

(declare-fun m!333491 () Bool)

(assert (=> b!327017 m!333491))

(declare-fun m!333493 () Bool)

(assert (=> b!327015 m!333493))

(assert (=> b!327015 m!333493))

(declare-fun m!333495 () Bool)

(assert (=> b!327015 m!333495))

(declare-fun m!333497 () Bool)

(assert (=> b!327018 m!333497))

(declare-fun m!333499 () Bool)

(assert (=> b!327011 m!333499))

(declare-fun m!333501 () Bool)

(assert (=> b!327020 m!333501))

(declare-fun m!333503 () Bool)

(assert (=> b!327016 m!333503))

(declare-fun m!333505 () Bool)

(assert (=> b!327012 m!333505))

(assert (=> b!327012 m!333505))

(declare-fun m!333507 () Bool)

(assert (=> b!327012 m!333507))

(push 1)

(assert (not b!327017))

(assert (not b!327015))

(assert (not b!327013))

(assert (not b!327014))

(assert (not b!327016))

(assert (not b!327011))

(assert (not b!327012))

(assert (not start!32714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

