; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36428 () Bool)

(assert start!36428)

(declare-fun res!203461 () Bool)

(declare-fun e!223032 () Bool)

(assert (=> start!36428 (=> (not res!203461) (not e!223032))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20708 0))(
  ( (array!20709 (arr!9833 (Array (_ BitVec 32) (_ BitVec 64))) (size!10185 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20708)

(assert (=> start!36428 (= res!203461 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10185 a!4289))))))

(assert (=> start!36428 e!223032))

(assert (=> start!36428 true))

(declare-fun array_inv!7275 (array!20708) Bool)

(assert (=> start!36428 (array_inv!7275 a!4289)))

(declare-fun b!364301 () Bool)

(declare-fun res!203462 () Bool)

(assert (=> b!364301 (=> (not res!203462) (not e!223032))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364301 (= res!203462 (validKeyInArray!0 k0!2974))))

(declare-fun b!364300 () Bool)

(declare-fun res!203463 () Bool)

(assert (=> b!364300 (=> (not res!203463) (not e!223032))))

(assert (=> b!364300 (= res!203463 (not (validKeyInArray!0 (select (arr!9833 a!4289) i!1472))))))

(declare-fun b!364302 () Bool)

(declare-fun res!203464 () Bool)

(assert (=> b!364302 (=> (not res!203464) (not e!223032))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364302 (= res!203464 (and (bvslt (size!10185 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10185 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364303 () Bool)

(assert (=> b!364303 (= e!223032 false)))

(declare-fun lt!168456 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20708 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364303 (= lt!168456 (arrayCountValidKeys!0 (array!20709 (store (arr!9833 a!4289) i!1472 k0!2974) (size!10185 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168457 () (_ BitVec 32))

(assert (=> b!364303 (= lt!168457 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36428 res!203461) b!364300))

(assert (= (and b!364300 res!203463) b!364301))

(assert (= (and b!364301 res!203462) b!364302))

(assert (= (and b!364302 res!203464) b!364303))

(declare-fun m!361801 () Bool)

(assert (=> start!36428 m!361801))

(declare-fun m!361803 () Bool)

(assert (=> b!364301 m!361803))

(declare-fun m!361805 () Bool)

(assert (=> b!364300 m!361805))

(assert (=> b!364300 m!361805))

(declare-fun m!361807 () Bool)

(assert (=> b!364300 m!361807))

(declare-fun m!361809 () Bool)

(assert (=> b!364303 m!361809))

(declare-fun m!361811 () Bool)

(assert (=> b!364303 m!361811))

(declare-fun m!361813 () Bool)

(assert (=> b!364303 m!361813))

(check-sat (not b!364301) (not b!364300) (not start!36428) (not b!364303))
