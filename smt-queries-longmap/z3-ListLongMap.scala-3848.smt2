; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52960 () Bool)

(assert start!52960)

(declare-fun b!576977 () Bool)

(declare-fun res!365009 () Bool)

(declare-fun e!331941 () Bool)

(assert (=> b!576977 (=> (not res!365009) (not e!331941))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!35991 0))(
  ( (array!35992 (arr!17275 (Array (_ BitVec 32) (_ BitVec 64))) (size!17639 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35991)

(assert (=> b!576977 (= res!365009 (and (= (size!17639 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17639 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17639 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365011 () Bool)

(assert (=> start!52960 (=> (not res!365011) (not e!331941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52960 (= res!365011 (validMask!0 mask!3053))))

(assert (=> start!52960 e!331941))

(assert (=> start!52960 true))

(declare-fun array_inv!13071 (array!35991) Bool)

(assert (=> start!52960 (array_inv!13071 a!2986)))

(declare-fun b!576978 () Bool)

(declare-fun res!365012 () Bool)

(assert (=> b!576978 (=> (not res!365012) (not e!331941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576978 (= res!365012 (validKeyInArray!0 (select (arr!17275 a!2986) j!136)))))

(declare-fun b!576980 () Bool)

(assert (=> b!576980 (= e!331941 (and (bvslt #b00000000000000000000000000000000 (size!17639 a!2986)) (bvsge (size!17639 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!576979 () Bool)

(declare-fun res!365010 () Bool)

(assert (=> b!576979 (=> (not res!365010) (not e!331941))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!576979 (= res!365010 (validKeyInArray!0 k0!1786))))

(assert (= (and start!52960 res!365011) b!576977))

(assert (= (and b!576977 res!365009) b!576978))

(assert (= (and b!576978 res!365012) b!576979))

(assert (= (and b!576979 res!365010) b!576980))

(declare-fun m!555919 () Bool)

(assert (=> start!52960 m!555919))

(declare-fun m!555921 () Bool)

(assert (=> start!52960 m!555921))

(declare-fun m!555923 () Bool)

(assert (=> b!576978 m!555923))

(assert (=> b!576978 m!555923))

(declare-fun m!555925 () Bool)

(assert (=> b!576978 m!555925))

(declare-fun m!555927 () Bool)

(assert (=> b!576979 m!555927))

(check-sat (not b!576978) (not b!576979) (not start!52960))
(check-sat)
(get-model)

(declare-fun d!85503 () Bool)

(assert (=> d!85503 (= (validKeyInArray!0 (select (arr!17275 a!2986) j!136)) (and (not (= (select (arr!17275 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17275 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576978 d!85503))

(declare-fun d!85505 () Bool)

(assert (=> d!85505 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576979 d!85505))

(declare-fun d!85507 () Bool)

(assert (=> d!85507 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!52960 d!85507))

(declare-fun d!85519 () Bool)

(assert (=> d!85519 (= (array_inv!13071 a!2986) (bvsge (size!17639 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!52960 d!85519))

(check-sat)
