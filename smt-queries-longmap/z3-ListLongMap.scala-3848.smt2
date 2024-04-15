; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52946 () Bool)

(assert start!52946)

(declare-fun b!576695 () Bool)

(declare-fun res!364870 () Bool)

(declare-fun e!331761 () Bool)

(assert (=> b!576695 (=> (not res!364870) (not e!331761))))

(declare-datatypes ((array!35986 0))(
  ( (array!35987 (arr!17273 (Array (_ BitVec 32) (_ BitVec 64))) (size!17638 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35986)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576695 (= res!364870 (validKeyInArray!0 (select (arr!17273 a!2986) j!136)))))

(declare-fun res!364869 () Bool)

(assert (=> start!52946 (=> (not res!364869) (not e!331761))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52946 (= res!364869 (validMask!0 mask!3053))))

(assert (=> start!52946 e!331761))

(assert (=> start!52946 true))

(declare-fun array_inv!13156 (array!35986) Bool)

(assert (=> start!52946 (array_inv!13156 a!2986)))

(declare-fun b!576696 () Bool)

(declare-fun res!364868 () Bool)

(assert (=> b!576696 (=> (not res!364868) (not e!331761))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!576696 (= res!364868 (validKeyInArray!0 k0!1786))))

(declare-fun b!576694 () Bool)

(declare-fun res!364871 () Bool)

(assert (=> b!576694 (=> (not res!364871) (not e!331761))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576694 (= res!364871 (and (= (size!17638 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17638 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17638 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!576697 () Bool)

(assert (=> b!576697 (= e!331761 (and (bvslt #b00000000000000000000000000000000 (size!17638 a!2986)) (bvsge (size!17638 a!2986) #b01111111111111111111111111111111)))))

(assert (= (and start!52946 res!364869) b!576694))

(assert (= (and b!576694 res!364871) b!576695))

(assert (= (and b!576695 res!364870) b!576696))

(assert (= (and b!576696 res!364868) b!576697))

(declare-fun m!555137 () Bool)

(assert (=> b!576695 m!555137))

(assert (=> b!576695 m!555137))

(declare-fun m!555139 () Bool)

(assert (=> b!576695 m!555139))

(declare-fun m!555141 () Bool)

(assert (=> start!52946 m!555141))

(declare-fun m!555143 () Bool)

(assert (=> start!52946 m!555143))

(declare-fun m!555145 () Bool)

(assert (=> b!576696 m!555145))

(check-sat (not start!52946) (not b!576695) (not b!576696))
(check-sat)
(get-model)

(declare-fun d!85295 () Bool)

(assert (=> d!85295 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!52946 d!85295))

(declare-fun d!85299 () Bool)

(assert (=> d!85299 (= (array_inv!13156 a!2986) (bvsge (size!17638 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!52946 d!85299))

(declare-fun d!85301 () Bool)

(assert (=> d!85301 (= (validKeyInArray!0 (select (arr!17273 a!2986) j!136)) (and (not (= (select (arr!17273 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17273 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576695 d!85301))

(declare-fun d!85303 () Bool)

(assert (=> d!85303 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576696 d!85303))

(check-sat)
