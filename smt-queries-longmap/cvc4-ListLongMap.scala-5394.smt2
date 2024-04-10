; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71966 () Bool)

(assert start!71966)

(declare-fun b!836208 () Bool)

(declare-fun res!568935 () Bool)

(declare-fun e!466485 () Bool)

(assert (=> b!836208 (=> (not res!568935) (not e!466485))))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46876 0))(
  ( (array!46877 (arr!22472 (Array (_ BitVec 32) (_ BitVec 64))) (size!22893 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46876)

(assert (=> b!836208 (= res!568935 (= to!390 (size!22893 a!4227)))))

(declare-fun b!836209 () Bool)

(declare-fun lt!380389 () array!46876)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46876 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836209 (= e!466485 (not (= (arrayCountValidKeys!0 lt!380389 (bvadd #b00000000000000000000000000000001 i!1466) (size!22893 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22893 a!4227)))))))

(declare-fun b!836210 () Bool)

(declare-fun res!568936 () Bool)

(declare-fun e!466484 () Bool)

(assert (=> b!836210 (=> (not res!568936) (not e!466484))))

(assert (=> b!836210 (= res!568936 (and (bvslt (size!22893 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22893 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568939 () Bool)

(assert (=> start!71966 (=> (not res!568939) (not e!466484))))

(assert (=> start!71966 (= res!568939 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22893 a!4227))))))

(assert (=> start!71966 e!466484))

(assert (=> start!71966 true))

(declare-fun array_inv!17919 (array!46876) Bool)

(assert (=> start!71966 (array_inv!17919 a!4227)))

(declare-fun b!836211 () Bool)

(declare-fun res!568938 () Bool)

(assert (=> b!836211 (=> (not res!568938) (not e!466484))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836211 (= res!568938 (validKeyInArray!0 k!2968))))

(declare-fun b!836212 () Bool)

(assert (=> b!836212 (= e!466484 e!466485)))

(declare-fun res!568937 () Bool)

(assert (=> b!836212 (=> (not res!568937) (not e!466485))))

(assert (=> b!836212 (= res!568937 (= (arrayCountValidKeys!0 lt!380389 (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(assert (=> b!836212 (= lt!380389 (array!46877 (store (arr!22472 a!4227) i!1466 k!2968) (size!22893 a!4227)))))

(declare-fun b!836213 () Bool)

(declare-fun res!568940 () Bool)

(assert (=> b!836213 (=> (not res!568940) (not e!466484))))

(assert (=> b!836213 (= res!568940 (not (validKeyInArray!0 (select (arr!22472 a!4227) i!1466))))))

(assert (= (and start!71966 res!568939) b!836213))

(assert (= (and b!836213 res!568940) b!836211))

(assert (= (and b!836211 res!568938) b!836210))

(assert (= (and b!836210 res!568936) b!836212))

(assert (= (and b!836212 res!568937) b!836208))

(assert (= (and b!836208 res!568935) b!836209))

(declare-fun m!781603 () Bool)

(assert (=> b!836212 m!781603))

(declare-fun m!781605 () Bool)

(assert (=> b!836212 m!781605))

(declare-fun m!781607 () Bool)

(assert (=> b!836212 m!781607))

(declare-fun m!781609 () Bool)

(assert (=> b!836209 m!781609))

(declare-fun m!781611 () Bool)

(assert (=> b!836209 m!781611))

(declare-fun m!781613 () Bool)

(assert (=> b!836213 m!781613))

(assert (=> b!836213 m!781613))

(declare-fun m!781615 () Bool)

(assert (=> b!836213 m!781615))

(declare-fun m!781617 () Bool)

(assert (=> start!71966 m!781617))

(declare-fun m!781619 () Bool)

(assert (=> b!836211 m!781619))

(push 1)

(assert (not start!71966))

(assert (not b!836213))

(assert (not b!836209))

(assert (not b!836211))

(assert (not b!836212))

(check-sat)

(pop 1)

