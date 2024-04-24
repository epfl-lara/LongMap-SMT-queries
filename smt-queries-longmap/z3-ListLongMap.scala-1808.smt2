; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32642 () Bool)

(assert start!32642)

(declare-fun b!326088 () Bool)

(declare-fun res!179177 () Bool)

(declare-fun e!200904 () Bool)

(assert (=> b!326088 (=> (not res!179177) (not e!200904))))

(declare-datatypes ((array!16692 0))(
  ( (array!16693 (arr!7900 (Array (_ BitVec 32) (_ BitVec 64))) (size!8252 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16692)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326088 (= res!179177 (and (= (size!8252 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8252 a!3305))))))

(declare-fun b!326089 () Bool)

(declare-fun res!179174 () Bool)

(declare-fun e!200903 () Bool)

(assert (=> b!326089 (=> (not res!179174) (not e!200903))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326089 (= res!179174 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7900 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326090 () Bool)

(declare-fun res!179175 () Bool)

(assert (=> b!326090 (=> (not res!179175) (not e!200903))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326090 (= res!179175 (and (= (select (arr!7900 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8252 a!3305))))))

(declare-fun res!179169 () Bool)

(assert (=> start!32642 (=> (not res!179169) (not e!200904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32642 (= res!179169 (validMask!0 mask!3777))))

(assert (=> start!32642 e!200904))

(declare-fun array_inv!5850 (array!16692) Bool)

(assert (=> start!32642 (array_inv!5850 a!3305)))

(assert (=> start!32642 true))

(declare-fun b!326091 () Bool)

(assert (=> b!326091 (= e!200904 e!200903)))

(declare-fun res!179176 () Bool)

(assert (=> b!326091 (=> (not res!179176) (not e!200903))))

(declare-datatypes ((SeekEntryResult!2996 0))(
  ( (MissingZero!2996 (index!14160 (_ BitVec 32))) (Found!2996 (index!14161 (_ BitVec 32))) (Intermediate!2996 (undefined!3808 Bool) (index!14162 (_ BitVec 32)) (x!32519 (_ BitVec 32))) (Undefined!2996) (MissingVacant!2996 (index!14163 (_ BitVec 32))) )
))
(declare-fun lt!157284 () SeekEntryResult!2996)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16692 (_ BitVec 32)) SeekEntryResult!2996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326091 (= res!179176 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157284))))

(assert (=> b!326091 (= lt!157284 (Intermediate!2996 false resIndex!58 resX!58))))

(declare-fun b!326092 () Bool)

(declare-fun res!179171 () Bool)

(assert (=> b!326092 (=> (not res!179171) (not e!200904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16692 (_ BitVec 32)) Bool)

(assert (=> b!326092 (= res!179171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326093 () Bool)

(declare-fun res!179173 () Bool)

(assert (=> b!326093 (=> (not res!179173) (not e!200904))))

(declare-fun arrayContainsKey!0 (array!16692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326093 (= res!179173 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326094 () Bool)

(assert (=> b!326094 (= e!200903 false)))

(declare-datatypes ((Unit!10060 0))(
  ( (Unit!10061) )
))
(declare-fun lt!157283 () Unit!10060)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16692 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10060)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326094 (= lt!157283 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326095 () Bool)

(declare-fun res!179172 () Bool)

(assert (=> b!326095 (=> (not res!179172) (not e!200904))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16692 (_ BitVec 32)) SeekEntryResult!2996)

(assert (=> b!326095 (= res!179172 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2996 i!1250)))))

(declare-fun b!326096 () Bool)

(declare-fun res!179170 () Bool)

(assert (=> b!326096 (=> (not res!179170) (not e!200904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326096 (= res!179170 (validKeyInArray!0 k0!2497))))

(declare-fun b!326097 () Bool)

(declare-fun res!179178 () Bool)

(assert (=> b!326097 (=> (not res!179178) (not e!200903))))

(assert (=> b!326097 (= res!179178 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157284))))

(assert (= (and start!32642 res!179169) b!326088))

(assert (= (and b!326088 res!179177) b!326096))

(assert (= (and b!326096 res!179170) b!326093))

(assert (= (and b!326093 res!179173) b!326095))

(assert (= (and b!326095 res!179172) b!326092))

(assert (= (and b!326092 res!179171) b!326091))

(assert (= (and b!326091 res!179176) b!326090))

(assert (= (and b!326090 res!179175) b!326097))

(assert (= (and b!326097 res!179178) b!326089))

(assert (= (and b!326089 res!179174) b!326094))

(declare-fun m!332923 () Bool)

(assert (=> b!326090 m!332923))

(declare-fun m!332925 () Bool)

(assert (=> b!326094 m!332925))

(assert (=> b!326094 m!332925))

(declare-fun m!332927 () Bool)

(assert (=> b!326094 m!332927))

(declare-fun m!332929 () Bool)

(assert (=> start!32642 m!332929))

(declare-fun m!332931 () Bool)

(assert (=> start!32642 m!332931))

(declare-fun m!332933 () Bool)

(assert (=> b!326097 m!332933))

(declare-fun m!332935 () Bool)

(assert (=> b!326096 m!332935))

(declare-fun m!332937 () Bool)

(assert (=> b!326095 m!332937))

(declare-fun m!332939 () Bool)

(assert (=> b!326089 m!332939))

(declare-fun m!332941 () Bool)

(assert (=> b!326092 m!332941))

(declare-fun m!332943 () Bool)

(assert (=> b!326091 m!332943))

(assert (=> b!326091 m!332943))

(declare-fun m!332945 () Bool)

(assert (=> b!326091 m!332945))

(declare-fun m!332947 () Bool)

(assert (=> b!326093 m!332947))

(check-sat (not b!326093) (not b!326097) (not b!326095) (not b!326091) (not start!32642) (not b!326092) (not b!326094) (not b!326096))
(check-sat)
