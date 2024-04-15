; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32654 () Bool)

(assert start!32654)

(declare-fun b!326046 () Bool)

(declare-fun res!179230 () Bool)

(declare-fun e!200815 () Bool)

(assert (=> b!326046 (=> (not res!179230) (not e!200815))))

(declare-datatypes ((array!16695 0))(
  ( (array!16696 (arr!7902 (Array (_ BitVec 32) (_ BitVec 64))) (size!8255 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16695)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(assert (=> b!326046 (= res!179230 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7902 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326047 () Bool)

(declare-fun res!179229 () Bool)

(declare-fun e!200816 () Bool)

(assert (=> b!326047 (=> (not res!179229) (not e!200816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326047 (= res!179229 (validKeyInArray!0 k0!2497))))

(declare-fun b!326048 () Bool)

(declare-fun res!179226 () Bool)

(assert (=> b!326048 (=> (not res!179226) (not e!200816))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16695 (_ BitVec 32)) Bool)

(assert (=> b!326048 (= res!179226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326049 () Bool)

(declare-fun res!179232 () Bool)

(assert (=> b!326049 (=> (not res!179232) (not e!200815))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326049 (= res!179232 (and (= (select (arr!7902 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8255 a!3305))))))

(declare-fun b!326050 () Bool)

(assert (=> b!326050 (= e!200816 e!200815)))

(declare-fun res!179223 () Bool)

(assert (=> b!326050 (=> (not res!179223) (not e!200815))))

(declare-datatypes ((SeekEntryResult!3032 0))(
  ( (MissingZero!3032 (index!14304 (_ BitVec 32))) (Found!3032 (index!14305 (_ BitVec 32))) (Intermediate!3032 (undefined!3844 Bool) (index!14306 (_ BitVec 32)) (x!32569 (_ BitVec 32))) (Undefined!3032) (MissingVacant!3032 (index!14307 (_ BitVec 32))) )
))
(declare-fun lt!157067 () SeekEntryResult!3032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16695 (_ BitVec 32)) SeekEntryResult!3032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326050 (= res!179223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157067))))

(assert (=> b!326050 (= lt!157067 (Intermediate!3032 false resIndex!58 resX!58))))

(declare-fun res!179224 () Bool)

(assert (=> start!32654 (=> (not res!179224) (not e!200816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32654 (= res!179224 (validMask!0 mask!3777))))

(assert (=> start!32654 e!200816))

(declare-fun array_inv!5874 (array!16695) Bool)

(assert (=> start!32654 (array_inv!5874 a!3305)))

(assert (=> start!32654 true))

(declare-fun b!326051 () Bool)

(declare-fun res!179228 () Bool)

(assert (=> b!326051 (=> (not res!179228) (not e!200815))))

(assert (=> b!326051 (= res!179228 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157067))))

(declare-fun b!326052 () Bool)

(declare-fun res!179231 () Bool)

(assert (=> b!326052 (=> (not res!179231) (not e!200816))))

(declare-fun arrayContainsKey!0 (array!16695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326052 (= res!179231 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326053 () Bool)

(assert (=> b!326053 (= e!200815 false)))

(declare-datatypes ((Unit!10076 0))(
  ( (Unit!10077) )
))
(declare-fun lt!157066 () Unit!10076)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16695 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10076)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326053 (= lt!157066 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326054 () Bool)

(declare-fun res!179227 () Bool)

(assert (=> b!326054 (=> (not res!179227) (not e!200816))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16695 (_ BitVec 32)) SeekEntryResult!3032)

(assert (=> b!326054 (= res!179227 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3032 i!1250)))))

(declare-fun b!326055 () Bool)

(declare-fun res!179225 () Bool)

(assert (=> b!326055 (=> (not res!179225) (not e!200816))))

(assert (=> b!326055 (= res!179225 (and (= (size!8255 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8255 a!3305))))))

(assert (= (and start!32654 res!179224) b!326055))

(assert (= (and b!326055 res!179225) b!326047))

(assert (= (and b!326047 res!179229) b!326052))

(assert (= (and b!326052 res!179231) b!326054))

(assert (= (and b!326054 res!179227) b!326048))

(assert (= (and b!326048 res!179226) b!326050))

(assert (= (and b!326050 res!179223) b!326049))

(assert (= (and b!326049 res!179232) b!326051))

(assert (= (and b!326051 res!179228) b!326046))

(assert (= (and b!326046 res!179230) b!326053))

(declare-fun m!332155 () Bool)

(assert (=> start!32654 m!332155))

(declare-fun m!332157 () Bool)

(assert (=> start!32654 m!332157))

(declare-fun m!332159 () Bool)

(assert (=> b!326050 m!332159))

(assert (=> b!326050 m!332159))

(declare-fun m!332161 () Bool)

(assert (=> b!326050 m!332161))

(declare-fun m!332163 () Bool)

(assert (=> b!326049 m!332163))

(declare-fun m!332165 () Bool)

(assert (=> b!326052 m!332165))

(declare-fun m!332167 () Bool)

(assert (=> b!326053 m!332167))

(assert (=> b!326053 m!332167))

(declare-fun m!332169 () Bool)

(assert (=> b!326053 m!332169))

(declare-fun m!332171 () Bool)

(assert (=> b!326047 m!332171))

(declare-fun m!332173 () Bool)

(assert (=> b!326054 m!332173))

(declare-fun m!332175 () Bool)

(assert (=> b!326048 m!332175))

(declare-fun m!332177 () Bool)

(assert (=> b!326051 m!332177))

(declare-fun m!332179 () Bool)

(assert (=> b!326046 m!332179))

(check-sat (not b!326050) (not start!32654) (not b!326047) (not b!326052) (not b!326054) (not b!326048) (not b!326053) (not b!326051))
(check-sat)
