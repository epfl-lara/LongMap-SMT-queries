; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36212 () Bool)

(assert start!36212)

(declare-fun res!202241 () Bool)

(declare-fun e!222275 () Bool)

(assert (=> start!36212 (=> (not res!202241) (not e!222275))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20528 0))(
  ( (array!20529 (arr!9746 (Array (_ BitVec 32) (_ BitVec 64))) (size!10098 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20528)

(assert (=> start!36212 (= res!202241 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10098 a!4337))))))

(assert (=> start!36212 e!222275))

(assert (=> start!36212 true))

(declare-fun array_inv!7188 (array!20528) Bool)

(assert (=> start!36212 (array_inv!7188 a!4337)))

(declare-fun b!362952 () Bool)

(declare-fun res!202242 () Bool)

(assert (=> b!362952 (=> (not res!202242) (not e!222275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362952 (= res!202242 (not (validKeyInArray!0 (select (arr!9746 a!4337) i!1478))))))

(declare-fun b!362953 () Bool)

(declare-fun res!202243 () Bool)

(assert (=> b!362953 (=> (not res!202243) (not e!222275))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362953 (= res!202243 (validKeyInArray!0 k0!2980))))

(declare-fun b!362954 () Bool)

(assert (=> b!362954 (= e!222275 (and (bvslt (size!10098 a!4337) #b01111111111111111111111111111111) (bvsgt i!1478 (size!10098 a!4337))))))

(assert (= (and start!36212 res!202241) b!362952))

(assert (= (and b!362952 res!202242) b!362953))

(assert (= (and b!362953 res!202243) b!362954))

(declare-fun m!359821 () Bool)

(assert (=> start!36212 m!359821))

(declare-fun m!359823 () Bool)

(assert (=> b!362952 m!359823))

(assert (=> b!362952 m!359823))

(declare-fun m!359825 () Bool)

(assert (=> b!362952 m!359825))

(declare-fun m!359827 () Bool)

(assert (=> b!362953 m!359827))

(check-sat (not b!362952) (not b!362953) (not start!36212))
(check-sat)
