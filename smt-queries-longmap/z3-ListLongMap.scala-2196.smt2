; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36536 () Bool)

(assert start!36536)

(declare-fun b!365045 () Bool)

(declare-fun res!204112 () Bool)

(declare-fun e!223449 () Bool)

(assert (=> b!365045 (=> (not res!204112) (not e!223449))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365045 (= res!204112 (validKeyInArray!0 k0!2974))))

(declare-fun res!204110 () Bool)

(assert (=> start!36536 (=> (not res!204110) (not e!223449))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20795 0))(
  ( (array!20796 (arr!9875 (Array (_ BitVec 32) (_ BitVec 64))) (size!10227 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20795)

(assert (=> start!36536 (= res!204110 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10227 a!4289))))))

(assert (=> start!36536 e!223449))

(assert (=> start!36536 true))

(declare-fun array_inv!7317 (array!20795) Bool)

(assert (=> start!36536 (array_inv!7317 a!4289)))

(declare-fun b!365047 () Bool)

(assert (=> b!365047 (= e!223449 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!169131 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365047 (= lt!169131 (arrayCountValidKeys!0 (array!20796 (store (arr!9875 a!4289) i!1472 k0!2974) (size!10227 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!169132 () (_ BitVec 32))

(assert (=> b!365047 (= lt!169132 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!365044 () Bool)

(declare-fun res!204111 () Bool)

(assert (=> b!365044 (=> (not res!204111) (not e!223449))))

(assert (=> b!365044 (= res!204111 (not (validKeyInArray!0 (select (arr!9875 a!4289) i!1472))))))

(declare-fun b!365046 () Bool)

(declare-fun res!204109 () Bool)

(assert (=> b!365046 (=> (not res!204109) (not e!223449))))

(assert (=> b!365046 (= res!204109 (and (bvslt (size!10227 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10227 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36536 res!204110) b!365044))

(assert (= (and b!365044 res!204111) b!365045))

(assert (= (and b!365045 res!204112) b!365046))

(assert (= (and b!365046 res!204109) b!365047))

(declare-fun m!362881 () Bool)

(assert (=> b!365045 m!362881))

(declare-fun m!362883 () Bool)

(assert (=> start!36536 m!362883))

(declare-fun m!362885 () Bool)

(assert (=> b!365047 m!362885))

(declare-fun m!362887 () Bool)

(assert (=> b!365047 m!362887))

(declare-fun m!362889 () Bool)

(assert (=> b!365047 m!362889))

(declare-fun m!362891 () Bool)

(assert (=> b!365044 m!362891))

(assert (=> b!365044 m!362891))

(declare-fun m!362893 () Bool)

(assert (=> b!365044 m!362893))

(check-sat (not start!36536) (not b!365044) (not b!365045) (not b!365047))
