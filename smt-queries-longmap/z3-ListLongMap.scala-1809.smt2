; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32648 () Bool)

(assert start!32648)

(declare-fun b!325956 () Bool)

(declare-fun res!179139 () Bool)

(declare-fun e!200787 () Bool)

(assert (=> b!325956 (=> (not res!179139) (not e!200787))))

(declare-datatypes ((array!16689 0))(
  ( (array!16690 (arr!7899 (Array (_ BitVec 32) (_ BitVec 64))) (size!8252 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16689)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325956 (= res!179139 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179141 () Bool)

(assert (=> start!32648 (=> (not res!179141) (not e!200787))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32648 (= res!179141 (validMask!0 mask!3777))))

(assert (=> start!32648 e!200787))

(declare-fun array_inv!5871 (array!16689) Bool)

(assert (=> start!32648 (array_inv!5871 a!3305)))

(assert (=> start!32648 true))

(declare-fun b!325957 () Bool)

(declare-fun res!179137 () Bool)

(declare-fun e!200788 () Bool)

(assert (=> b!325957 (=> (not res!179137) (not e!200788))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3029 0))(
  ( (MissingZero!3029 (index!14292 (_ BitVec 32))) (Found!3029 (index!14293 (_ BitVec 32))) (Intermediate!3029 (undefined!3841 Bool) (index!14294 (_ BitVec 32)) (x!32558 (_ BitVec 32))) (Undefined!3029) (MissingVacant!3029 (index!14295 (_ BitVec 32))) )
))
(declare-fun lt!157048 () SeekEntryResult!3029)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16689 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!325957 (= res!179137 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157048))))

(declare-fun b!325958 () Bool)

(declare-fun res!179136 () Bool)

(assert (=> b!325958 (=> (not res!179136) (not e!200788))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325958 (= res!179136 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7899 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325959 () Bool)

(declare-fun res!179135 () Bool)

(assert (=> b!325959 (=> (not res!179135) (not e!200788))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325959 (= res!179135 (and (= (select (arr!7899 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8252 a!3305))))))

(declare-fun b!325960 () Bool)

(declare-fun res!179134 () Bool)

(assert (=> b!325960 (=> (not res!179134) (not e!200787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16689 (_ BitVec 32)) Bool)

(assert (=> b!325960 (= res!179134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325961 () Bool)

(declare-fun res!179140 () Bool)

(assert (=> b!325961 (=> (not res!179140) (not e!200787))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16689 (_ BitVec 32)) SeekEntryResult!3029)

(assert (=> b!325961 (= res!179140 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3029 i!1250)))))

(declare-fun b!325962 () Bool)

(assert (=> b!325962 (= e!200787 e!200788)))

(declare-fun res!179133 () Bool)

(assert (=> b!325962 (=> (not res!179133) (not e!200788))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325962 (= res!179133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157048))))

(assert (=> b!325962 (= lt!157048 (Intermediate!3029 false resIndex!58 resX!58))))

(declare-fun b!325963 () Bool)

(assert (=> b!325963 (= e!200788 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10070 0))(
  ( (Unit!10071) )
))
(declare-fun lt!157049 () Unit!10070)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10070)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325963 (= lt!157049 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!325964 () Bool)

(declare-fun res!179142 () Bool)

(assert (=> b!325964 (=> (not res!179142) (not e!200787))))

(assert (=> b!325964 (= res!179142 (and (= (size!8252 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8252 a!3305))))))

(declare-fun b!325965 () Bool)

(declare-fun res!179138 () Bool)

(assert (=> b!325965 (=> (not res!179138) (not e!200787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325965 (= res!179138 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32648 res!179141) b!325964))

(assert (= (and b!325964 res!179142) b!325965))

(assert (= (and b!325965 res!179138) b!325956))

(assert (= (and b!325956 res!179139) b!325961))

(assert (= (and b!325961 res!179140) b!325960))

(assert (= (and b!325960 res!179134) b!325962))

(assert (= (and b!325962 res!179133) b!325959))

(assert (= (and b!325959 res!179135) b!325957))

(assert (= (and b!325957 res!179137) b!325958))

(assert (= (and b!325958 res!179136) b!325963))

(declare-fun m!332077 () Bool)

(assert (=> b!325965 m!332077))

(declare-fun m!332079 () Bool)

(assert (=> b!325958 m!332079))

(declare-fun m!332081 () Bool)

(assert (=> b!325963 m!332081))

(assert (=> b!325963 m!332081))

(declare-fun m!332083 () Bool)

(assert (=> b!325963 m!332083))

(declare-fun m!332085 () Bool)

(assert (=> b!325961 m!332085))

(declare-fun m!332087 () Bool)

(assert (=> b!325962 m!332087))

(assert (=> b!325962 m!332087))

(declare-fun m!332089 () Bool)

(assert (=> b!325962 m!332089))

(declare-fun m!332091 () Bool)

(assert (=> b!325960 m!332091))

(declare-fun m!332093 () Bool)

(assert (=> b!325959 m!332093))

(declare-fun m!332095 () Bool)

(assert (=> b!325956 m!332095))

(declare-fun m!332097 () Bool)

(assert (=> b!325957 m!332097))

(declare-fun m!332099 () Bool)

(assert (=> start!32648 m!332099))

(declare-fun m!332101 () Bool)

(assert (=> start!32648 m!332101))

(check-sat (not b!325965) (not b!325963) (not b!325960) (not b!325961) (not b!325962) (not b!325957) (not start!32648) (not b!325956))
(check-sat)
