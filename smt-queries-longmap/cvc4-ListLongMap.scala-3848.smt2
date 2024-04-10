; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52962 () Bool)

(assert start!52962)

(declare-fun b!576990 () Bool)

(declare-fun res!365023 () Bool)

(declare-fun e!331947 () Bool)

(assert (=> b!576990 (=> (not res!365023) (not e!331947))))

(declare-datatypes ((array!35993 0))(
  ( (array!35994 (arr!17276 (Array (_ BitVec 32) (_ BitVec 64))) (size!17640 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!35993)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576990 (= res!365023 (validKeyInArray!0 (select (arr!17276 a!2986) j!136)))))

(declare-fun b!576992 () Bool)

(assert (=> b!576992 (= e!331947 (and (bvslt #b00000000000000000000000000000000 (size!17640 a!2986)) (bvsge (size!17640 a!2986) #b01111111111111111111111111111111)))))

(declare-fun res!365022 () Bool)

(assert (=> start!52962 (=> (not res!365022) (not e!331947))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52962 (= res!365022 (validMask!0 mask!3053))))

(assert (=> start!52962 e!331947))

(assert (=> start!52962 true))

(declare-fun array_inv!13072 (array!35993) Bool)

(assert (=> start!52962 (array_inv!13072 a!2986)))

(declare-fun b!576991 () Bool)

(declare-fun res!365021 () Bool)

(assert (=> b!576991 (=> (not res!365021) (not e!331947))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!576991 (= res!365021 (validKeyInArray!0 k!1786))))

(declare-fun b!576989 () Bool)

(declare-fun res!365024 () Bool)

(assert (=> b!576989 (=> (not res!365024) (not e!331947))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!576989 (= res!365024 (and (= (size!17640 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17640 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17640 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!52962 res!365022) b!576989))

(assert (= (and b!576989 res!365024) b!576990))

(assert (= (and b!576990 res!365023) b!576991))

(assert (= (and b!576991 res!365021) b!576992))

(declare-fun m!555929 () Bool)

(assert (=> b!576990 m!555929))

(assert (=> b!576990 m!555929))

(declare-fun m!555931 () Bool)

(assert (=> b!576990 m!555931))

(declare-fun m!555933 () Bool)

(assert (=> start!52962 m!555933))

(declare-fun m!555935 () Bool)

(assert (=> start!52962 m!555935))

(declare-fun m!555937 () Bool)

(assert (=> b!576991 m!555937))

(push 1)

(assert (not b!576991))

(assert (not start!52962))

(assert (not b!576990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

