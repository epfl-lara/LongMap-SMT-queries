; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117286 () Bool)

(assert start!117286)

(declare-fun res!921128 () Bool)

(declare-fun e!781509 () Bool)

(assert (=> start!117286 (=> (not res!921128) (not e!781509))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93787 0))(
  ( (array!93788 (arr!45289 (Array (_ BitVec 32) (_ BitVec 64))) (size!45840 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93787)

(assert (=> start!117286 (= res!921128 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45840 a!4094))))))

(assert (=> start!117286 e!781509))

(assert (=> start!117286 true))

(declare-fun array_inv!34570 (array!93787) Bool)

(assert (=> start!117286 (array_inv!34570 a!4094)))

(declare-fun b!1379382 () Bool)

(declare-fun res!921129 () Bool)

(assert (=> b!1379382 (=> (not res!921129) (not e!781509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379382 (= res!921129 (validKeyInArray!0 (select (arr!45289 a!4094) i!1451)))))

(declare-fun b!1379383 () Bool)

(declare-fun res!921127 () Bool)

(assert (=> b!1379383 (=> (not res!921127) (not e!781509))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1379383 (= res!921127 (not (validKeyInArray!0 k0!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1379384 () Bool)

(assert (=> b!1379384 (= e!781509 (and (bvslt (size!45840 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45840 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117286 res!921128) b!1379382))

(assert (= (and b!1379382 res!921129) b!1379383))

(assert (= (and b!1379383 res!921127) b!1379384))

(declare-fun m!1264153 () Bool)

(assert (=> start!117286 m!1264153))

(declare-fun m!1264155 () Bool)

(assert (=> b!1379382 m!1264155))

(assert (=> b!1379382 m!1264155))

(declare-fun m!1264157 () Bool)

(assert (=> b!1379382 m!1264157))

(declare-fun m!1264159 () Bool)

(assert (=> b!1379383 m!1264159))

(check-sat (not b!1379382) (not start!117286) (not b!1379383))
(check-sat)
