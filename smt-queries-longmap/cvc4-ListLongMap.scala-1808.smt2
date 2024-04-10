; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32660 () Bool)

(assert start!32660)

(declare-fun res!179235 () Bool)

(declare-fun e!200954 () Bool)

(assert (=> start!32660 (=> (not res!179235) (not e!200954))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32660 (= res!179235 (validMask!0 mask!3777))))

(assert (=> start!32660 e!200954))

(declare-datatypes ((array!16697 0))(
  ( (array!16698 (arr!7903 (Array (_ BitVec 32) (_ BitVec 64))) (size!8255 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16697)

(declare-fun array_inv!5866 (array!16697) Bool)

(assert (=> start!32660 (array_inv!5866 a!3305)))

(assert (=> start!32660 true))

(declare-fun b!326201 () Bool)

(declare-fun res!179237 () Bool)

(assert (=> b!326201 (=> (not res!179237) (not e!200954))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326201 (= res!179237 (validKeyInArray!0 k!2497))))

(declare-fun b!326202 () Bool)

(declare-fun res!179240 () Bool)

(declare-fun e!200956 () Bool)

(assert (=> b!326202 (=> (not res!179240) (not e!200956))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326202 (= res!179240 (and (= (select (arr!7903 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8255 a!3305))))))

(declare-fun b!326203 () Bool)

(declare-fun res!179232 () Bool)

(assert (=> b!326203 (=> (not res!179232) (not e!200956))))

(assert (=> b!326203 (= res!179232 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7903 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326204 () Bool)

(declare-fun res!179238 () Bool)

(assert (=> b!326204 (=> (not res!179238) (not e!200954))))

(declare-fun arrayContainsKey!0 (array!16697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326204 (= res!179238 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326205 () Bool)

(assert (=> b!326205 (= e!200954 e!200956)))

(declare-fun res!179233 () Bool)

(assert (=> b!326205 (=> (not res!179233) (not e!200956))))

(declare-datatypes ((SeekEntryResult!3034 0))(
  ( (MissingZero!3034 (index!14312 (_ BitVec 32))) (Found!3034 (index!14313 (_ BitVec 32))) (Intermediate!3034 (undefined!3846 Bool) (index!14314 (_ BitVec 32)) (x!32560 (_ BitVec 32))) (Undefined!3034) (MissingVacant!3034 (index!14315 (_ BitVec 32))) )
))
(declare-fun lt!157277 () SeekEntryResult!3034)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16697 (_ BitVec 32)) SeekEntryResult!3034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326205 (= res!179233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157277))))

(assert (=> b!326205 (= lt!157277 (Intermediate!3034 false resIndex!58 resX!58))))

(declare-fun b!326206 () Bool)

(declare-fun res!179236 () Bool)

(assert (=> b!326206 (=> (not res!179236) (not e!200954))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16697 (_ BitVec 32)) SeekEntryResult!3034)

(assert (=> b!326206 (= res!179236 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3034 i!1250)))))

(declare-fun b!326207 () Bool)

(declare-fun res!179241 () Bool)

(assert (=> b!326207 (=> (not res!179241) (not e!200954))))

(assert (=> b!326207 (= res!179241 (and (= (size!8255 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8255 a!3305))))))

(declare-fun b!326208 () Bool)

(assert (=> b!326208 (= e!200956 false)))

(declare-datatypes ((Unit!10102 0))(
  ( (Unit!10103) )
))
(declare-fun lt!157278 () Unit!10102)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10102)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326208 (= lt!157278 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326209 () Bool)

(declare-fun res!179239 () Bool)

(assert (=> b!326209 (=> (not res!179239) (not e!200956))))

(assert (=> b!326209 (= res!179239 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157277))))

(declare-fun b!326210 () Bool)

(declare-fun res!179234 () Bool)

(assert (=> b!326210 (=> (not res!179234) (not e!200954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16697 (_ BitVec 32)) Bool)

(assert (=> b!326210 (= res!179234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32660 res!179235) b!326207))

(assert (= (and b!326207 res!179241) b!326201))

(assert (= (and b!326201 res!179237) b!326204))

(assert (= (and b!326204 res!179238) b!326206))

(assert (= (and b!326206 res!179236) b!326210))

(assert (= (and b!326210 res!179234) b!326205))

(assert (= (and b!326205 res!179233) b!326202))

(assert (= (and b!326202 res!179240) b!326209))

(assert (= (and b!326209 res!179239) b!326203))

(assert (= (and b!326203 res!179232) b!326208))

(declare-fun m!332781 () Bool)

(assert (=> b!326204 m!332781))

(declare-fun m!332783 () Bool)

(assert (=> b!326203 m!332783))

(declare-fun m!332785 () Bool)

(assert (=> b!326205 m!332785))

(assert (=> b!326205 m!332785))

(declare-fun m!332787 () Bool)

(assert (=> b!326205 m!332787))

(declare-fun m!332789 () Bool)

(assert (=> start!32660 m!332789))

(declare-fun m!332791 () Bool)

(assert (=> start!32660 m!332791))

(declare-fun m!332793 () Bool)

(assert (=> b!326210 m!332793))

(declare-fun m!332795 () Bool)

(assert (=> b!326208 m!332795))

(assert (=> b!326208 m!332795))

(declare-fun m!332797 () Bool)

(assert (=> b!326208 m!332797))

(declare-fun m!332799 () Bool)

(assert (=> b!326209 m!332799))

(declare-fun m!332801 () Bool)

(assert (=> b!326201 m!332801))

(declare-fun m!332803 () Bool)

(assert (=> b!326202 m!332803))

(declare-fun m!332805 () Bool)

(assert (=> b!326206 m!332805))

(push 1)

(assert (not b!326208))

(assert (not b!326206))

(assert (not b!326209))

(assert (not b!326205))

(assert (not b!326210))

(assert (not b!326204))

(assert (not b!326201))

(assert (not start!32660))

(check-sat)

