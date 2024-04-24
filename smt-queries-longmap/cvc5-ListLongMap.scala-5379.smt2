; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72042 () Bool)

(assert start!72042)

(declare-fun b!836151 () Bool)

(declare-fun res!568473 () Bool)

(declare-fun e!466551 () Bool)

(assert (=> b!836151 (=> (not res!568473) (not e!466551))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836151 (= res!568473 (validKeyInArray!0 k!2968))))

(declare-fun b!836153 () Bool)

(declare-fun res!568474 () Bool)

(assert (=> b!836153 (=> (not res!568474) (not e!466551))))

(declare-datatypes ((array!46789 0))(
  ( (array!46790 (arr!22424 (Array (_ BitVec 32) (_ BitVec 64))) (size!22844 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46789)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46789 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836153 (= res!568474 (= (arrayCountValidKeys!0 (array!46790 (store (arr!22424 a!4227) i!1466 k!2968) (size!22844 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun b!836154 () Bool)

(declare-fun res!568471 () Bool)

(assert (=> b!836154 (=> (not res!568471) (not e!466551))))

(assert (=> b!836154 (= res!568471 (not (validKeyInArray!0 (select (arr!22424 a!4227) i!1466))))))

(declare-fun b!836155 () Bool)

(declare-fun res!568475 () Bool)

(assert (=> b!836155 (=> (not res!568475) (not e!466551))))

(assert (=> b!836155 (= res!568475 (and (bvslt (size!22844 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22844 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836152 () Bool)

(assert (=> b!836152 (= e!466551 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22844 a!4227))))))

(declare-fun res!568476 () Bool)

(assert (=> start!72042 (=> (not res!568476) (not e!466551))))

(assert (=> start!72042 (= res!568476 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22844 a!4227))))))

(assert (=> start!72042 e!466551))

(assert (=> start!72042 true))

(declare-fun array_inv!17910 (array!46789) Bool)

(assert (=> start!72042 (array_inv!17910 a!4227)))

(declare-fun b!836156 () Bool)

(declare-fun res!568472 () Bool)

(assert (=> b!836156 (=> (not res!568472) (not e!466551))))

(assert (=> b!836156 (= res!568472 (not (= to!390 (size!22844 a!4227))))))

(declare-fun b!836157 () Bool)

(declare-fun res!568470 () Bool)

(assert (=> b!836157 (=> (not res!568470) (not e!466551))))

(assert (=> b!836157 (= res!568470 (validKeyInArray!0 (select (arr!22424 a!4227) to!390)))))

(assert (= (and start!72042 res!568476) b!836154))

(assert (= (and b!836154 res!568471) b!836151))

(assert (= (and b!836151 res!568473) b!836155))

(assert (= (and b!836155 res!568475) b!836153))

(assert (= (and b!836153 res!568474) b!836156))

(assert (= (and b!836156 res!568472) b!836157))

(assert (= (and b!836157 res!568470) b!836152))

(declare-fun m!781699 () Bool)

(assert (=> b!836151 m!781699))

(declare-fun m!781701 () Bool)

(assert (=> b!836153 m!781701))

(declare-fun m!781703 () Bool)

(assert (=> b!836153 m!781703))

(declare-fun m!781705 () Bool)

(assert (=> b!836153 m!781705))

(declare-fun m!781707 () Bool)

(assert (=> b!836157 m!781707))

(assert (=> b!836157 m!781707))

(declare-fun m!781709 () Bool)

(assert (=> b!836157 m!781709))

(declare-fun m!781711 () Bool)

(assert (=> start!72042 m!781711))

(declare-fun m!781713 () Bool)

(assert (=> b!836154 m!781713))

(assert (=> b!836154 m!781713))

(declare-fun m!781715 () Bool)

(assert (=> b!836154 m!781715))

(push 1)

(assert (not b!836154))

(assert (not start!72042))

(assert (not b!836157))

(assert (not b!836153))

(assert (not b!836151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

