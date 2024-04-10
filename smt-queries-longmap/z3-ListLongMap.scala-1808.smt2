; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32658 () Bool)

(assert start!32658)

(declare-fun b!326171 () Bool)

(declare-fun res!179206 () Bool)

(declare-fun e!200947 () Bool)

(assert (=> b!326171 (=> (not res!179206) (not e!200947))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326171 (= res!179206 (validKeyInArray!0 k0!2497))))

(declare-fun b!326172 () Bool)

(declare-fun res!179207 () Bool)

(assert (=> b!326172 (=> (not res!179207) (not e!200947))))

(declare-datatypes ((array!16695 0))(
  ( (array!16696 (arr!7902 (Array (_ BitVec 32) (_ BitVec 64))) (size!8254 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16695)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16695 (_ BitVec 32)) Bool)

(assert (=> b!326172 (= res!179207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326173 () Bool)

(declare-fun res!179203 () Bool)

(declare-fun e!200945 () Bool)

(assert (=> b!326173 (=> (not res!179203) (not e!200945))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326173 (= res!179203 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7902 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326174 () Bool)

(declare-fun res!179202 () Bool)

(assert (=> b!326174 (=> (not res!179202) (not e!200947))))

(declare-fun arrayContainsKey!0 (array!16695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326174 (= res!179202 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326176 () Bool)

(assert (=> b!326176 (= e!200945 false)))

(declare-datatypes ((Unit!10100 0))(
  ( (Unit!10101) )
))
(declare-fun lt!157272 () Unit!10100)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16695 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10100)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326176 (= lt!157272 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326177 () Bool)

(declare-fun res!179210 () Bool)

(assert (=> b!326177 (=> (not res!179210) (not e!200945))))

(declare-datatypes ((SeekEntryResult!3033 0))(
  ( (MissingZero!3033 (index!14308 (_ BitVec 32))) (Found!3033 (index!14309 (_ BitVec 32))) (Intermediate!3033 (undefined!3845 Bool) (index!14310 (_ BitVec 32)) (x!32559 (_ BitVec 32))) (Undefined!3033) (MissingVacant!3033 (index!14311 (_ BitVec 32))) )
))
(declare-fun lt!157271 () SeekEntryResult!3033)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16695 (_ BitVec 32)) SeekEntryResult!3033)

(assert (=> b!326177 (= res!179210 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157271))))

(declare-fun b!326178 () Bool)

(declare-fun res!179204 () Bool)

(assert (=> b!326178 (=> (not res!179204) (not e!200945))))

(assert (=> b!326178 (= res!179204 (and (= (select (arr!7902 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8254 a!3305))))))

(declare-fun b!326179 () Bool)

(assert (=> b!326179 (= e!200947 e!200945)))

(declare-fun res!179209 () Bool)

(assert (=> b!326179 (=> (not res!179209) (not e!200945))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326179 (= res!179209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157271))))

(assert (=> b!326179 (= lt!157271 (Intermediate!3033 false resIndex!58 resX!58))))

(declare-fun b!326180 () Bool)

(declare-fun res!179205 () Bool)

(assert (=> b!326180 (=> (not res!179205) (not e!200947))))

(assert (=> b!326180 (= res!179205 (and (= (size!8254 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8254 a!3305))))))

(declare-fun res!179208 () Bool)

(assert (=> start!32658 (=> (not res!179208) (not e!200947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32658 (= res!179208 (validMask!0 mask!3777))))

(assert (=> start!32658 e!200947))

(declare-fun array_inv!5865 (array!16695) Bool)

(assert (=> start!32658 (array_inv!5865 a!3305)))

(assert (=> start!32658 true))

(declare-fun b!326175 () Bool)

(declare-fun res!179211 () Bool)

(assert (=> b!326175 (=> (not res!179211) (not e!200947))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16695 (_ BitVec 32)) SeekEntryResult!3033)

(assert (=> b!326175 (= res!179211 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3033 i!1250)))))

(assert (= (and start!32658 res!179208) b!326180))

(assert (= (and b!326180 res!179205) b!326171))

(assert (= (and b!326171 res!179206) b!326174))

(assert (= (and b!326174 res!179202) b!326175))

(assert (= (and b!326175 res!179211) b!326172))

(assert (= (and b!326172 res!179207) b!326179))

(assert (= (and b!326179 res!179209) b!326178))

(assert (= (and b!326178 res!179204) b!326177))

(assert (= (and b!326177 res!179210) b!326173))

(assert (= (and b!326173 res!179203) b!326176))

(declare-fun m!332755 () Bool)

(assert (=> b!326172 m!332755))

(declare-fun m!332757 () Bool)

(assert (=> start!32658 m!332757))

(declare-fun m!332759 () Bool)

(assert (=> start!32658 m!332759))

(declare-fun m!332761 () Bool)

(assert (=> b!326178 m!332761))

(declare-fun m!332763 () Bool)

(assert (=> b!326176 m!332763))

(assert (=> b!326176 m!332763))

(declare-fun m!332765 () Bool)

(assert (=> b!326176 m!332765))

(declare-fun m!332767 () Bool)

(assert (=> b!326174 m!332767))

(declare-fun m!332769 () Bool)

(assert (=> b!326173 m!332769))

(declare-fun m!332771 () Bool)

(assert (=> b!326175 m!332771))

(declare-fun m!332773 () Bool)

(assert (=> b!326179 m!332773))

(assert (=> b!326179 m!332773))

(declare-fun m!332775 () Bool)

(assert (=> b!326179 m!332775))

(declare-fun m!332777 () Bool)

(assert (=> b!326171 m!332777))

(declare-fun m!332779 () Bool)

(assert (=> b!326177 m!332779))

(check-sat (not b!326176) (not b!326179) (not start!32658) (not b!326174) (not b!326172) (not b!326177) (not b!326175) (not b!326171))
(check-sat)
