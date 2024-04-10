; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117958 () Bool)

(assert start!117958)

(declare-fun res!923458 () Bool)

(declare-fun e!783286 () Bool)

(assert (=> start!117958 (=> (not res!923458) (not e!783286))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117958 (= res!923458 (validMask!0 mask!3034))))

(assert (=> start!117958 e!783286))

(assert (=> start!117958 true))

(declare-datatypes ((array!94349 0))(
  ( (array!94350 (arr!45557 (Array (_ BitVec 32) (_ BitVec 64))) (size!46107 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94349)

(declare-fun array_inv!34585 (array!94349) Bool)

(assert (=> start!117958 (array_inv!34585 a!2971)))

(declare-fun b!1381833 () Bool)

(assert (=> b!1381833 (= e!783286 false)))

(declare-fun lt!608298 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94349 (_ BitVec 32)) Bool)

(assert (=> b!1381833 (= lt!608298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381831 () Bool)

(declare-fun res!923461 () Bool)

(assert (=> b!1381831 (=> (not res!923461) (not e!783286))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381831 (= res!923461 (validKeyInArray!0 (select (arr!45557 a!2971) i!1094)))))

(declare-fun b!1381832 () Bool)

(declare-fun res!923460 () Bool)

(assert (=> b!1381832 (=> (not res!923460) (not e!783286))))

(declare-datatypes ((List!32091 0))(
  ( (Nil!32088) (Cons!32087 (h!33296 (_ BitVec 64)) (t!46785 List!32091)) )
))
(declare-fun arrayNoDuplicates!0 (array!94349 (_ BitVec 32) List!32091) Bool)

(assert (=> b!1381832 (= res!923460 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32088))))

(declare-fun b!1381830 () Bool)

(declare-fun res!923459 () Bool)

(assert (=> b!1381830 (=> (not res!923459) (not e!783286))))

(assert (=> b!1381830 (= res!923459 (and (= (size!46107 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46107 a!2971))))))

(assert (= (and start!117958 res!923458) b!1381830))

(assert (= (and b!1381830 res!923459) b!1381831))

(assert (= (and b!1381831 res!923461) b!1381832))

(assert (= (and b!1381832 res!923460) b!1381833))

(declare-fun m!1267011 () Bool)

(assert (=> start!117958 m!1267011))

(declare-fun m!1267013 () Bool)

(assert (=> start!117958 m!1267013))

(declare-fun m!1267015 () Bool)

(assert (=> b!1381833 m!1267015))

(declare-fun m!1267017 () Bool)

(assert (=> b!1381831 m!1267017))

(assert (=> b!1381831 m!1267017))

(declare-fun m!1267019 () Bool)

(assert (=> b!1381831 m!1267019))

(declare-fun m!1267021 () Bool)

(assert (=> b!1381832 m!1267021))

(push 1)

(assert (not b!1381833))

(assert (not start!117958))

(assert (not b!1381832))

(assert (not b!1381831))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

