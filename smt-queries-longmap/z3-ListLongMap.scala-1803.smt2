; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32504 () Bool)

(assert start!32504)

(declare-fun b!325170 () Bool)

(declare-fun e!200481 () Bool)

(assert (=> b!325170 (= e!200481 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156978 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325170 (= lt!156978 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325171 () Bool)

(declare-fun e!200480 () Bool)

(assert (=> b!325171 (= e!200480 e!200481)))

(declare-fun res!178555 () Bool)

(assert (=> b!325171 (=> (not res!178555) (not e!200481))))

(declare-datatypes ((array!16656 0))(
  ( (array!16657 (arr!7885 (Array (_ BitVec 32) (_ BitVec 64))) (size!8237 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16656)

(declare-datatypes ((SeekEntryResult!2981 0))(
  ( (MissingZero!2981 (index!14100 (_ BitVec 32))) (Found!2981 (index!14101 (_ BitVec 32))) (Intermediate!2981 (undefined!3793 Bool) (index!14102 (_ BitVec 32)) (x!32446 (_ BitVec 32))) (Undefined!2981) (MissingVacant!2981 (index!14103 (_ BitVec 32))) )
))
(declare-fun lt!156977 () SeekEntryResult!2981)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16656 (_ BitVec 32)) SeekEntryResult!2981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325171 (= res!178555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156977))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325171 (= lt!156977 (Intermediate!2981 false resIndex!58 resX!58))))

(declare-fun b!325172 () Bool)

(declare-fun res!178552 () Bool)

(assert (=> b!325172 (=> (not res!178552) (not e!200480))))

(declare-fun arrayContainsKey!0 (array!16656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325172 (= res!178552 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178557 () Bool)

(assert (=> start!32504 (=> (not res!178557) (not e!200480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32504 (= res!178557 (validMask!0 mask!3777))))

(assert (=> start!32504 e!200480))

(declare-fun array_inv!5835 (array!16656) Bool)

(assert (=> start!32504 (array_inv!5835 a!3305)))

(assert (=> start!32504 true))

(declare-fun b!325173 () Bool)

(declare-fun res!178556 () Bool)

(assert (=> b!325173 (=> (not res!178556) (not e!200480))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16656 (_ BitVec 32)) SeekEntryResult!2981)

(assert (=> b!325173 (= res!178556 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2981 i!1250)))))

(declare-fun b!325174 () Bool)

(declare-fun res!178559 () Bool)

(assert (=> b!325174 (=> (not res!178559) (not e!200480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16656 (_ BitVec 32)) Bool)

(assert (=> b!325174 (= res!178559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325175 () Bool)

(declare-fun res!178554 () Bool)

(assert (=> b!325175 (=> (not res!178554) (not e!200480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325175 (= res!178554 (validKeyInArray!0 k0!2497))))

(declare-fun b!325176 () Bool)

(declare-fun res!178553 () Bool)

(assert (=> b!325176 (=> (not res!178553) (not e!200481))))

(assert (=> b!325176 (= res!178553 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7885 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325177 () Bool)

(declare-fun res!178551 () Bool)

(assert (=> b!325177 (=> (not res!178551) (not e!200481))))

(assert (=> b!325177 (= res!178551 (and (= (select (arr!7885 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8237 a!3305))))))

(declare-fun b!325178 () Bool)

(declare-fun res!178560 () Bool)

(assert (=> b!325178 (=> (not res!178560) (not e!200481))))

(assert (=> b!325178 (= res!178560 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156977))))

(declare-fun b!325179 () Bool)

(declare-fun res!178558 () Bool)

(assert (=> b!325179 (=> (not res!178558) (not e!200480))))

(assert (=> b!325179 (= res!178558 (and (= (size!8237 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8237 a!3305))))))

(assert (= (and start!32504 res!178557) b!325179))

(assert (= (and b!325179 res!178558) b!325175))

(assert (= (and b!325175 res!178554) b!325172))

(assert (= (and b!325172 res!178552) b!325173))

(assert (= (and b!325173 res!178556) b!325174))

(assert (= (and b!325174 res!178559) b!325171))

(assert (= (and b!325171 res!178555) b!325177))

(assert (= (and b!325177 res!178551) b!325178))

(assert (= (and b!325178 res!178560) b!325176))

(assert (= (and b!325176 res!178553) b!325170))

(declare-fun m!332293 () Bool)

(assert (=> b!325170 m!332293))

(declare-fun m!332295 () Bool)

(assert (=> b!325174 m!332295))

(declare-fun m!332297 () Bool)

(assert (=> b!325176 m!332297))

(declare-fun m!332299 () Bool)

(assert (=> b!325175 m!332299))

(declare-fun m!332301 () Bool)

(assert (=> b!325173 m!332301))

(declare-fun m!332303 () Bool)

(assert (=> start!32504 m!332303))

(declare-fun m!332305 () Bool)

(assert (=> start!32504 m!332305))

(declare-fun m!332307 () Bool)

(assert (=> b!325178 m!332307))

(declare-fun m!332309 () Bool)

(assert (=> b!325171 m!332309))

(assert (=> b!325171 m!332309))

(declare-fun m!332311 () Bool)

(assert (=> b!325171 m!332311))

(declare-fun m!332313 () Bool)

(assert (=> b!325172 m!332313))

(declare-fun m!332315 () Bool)

(assert (=> b!325177 m!332315))

(check-sat (not b!325170) (not b!325178) (not b!325172) (not b!325174) (not b!325175) (not start!32504) (not b!325171) (not b!325173))
(check-sat)
