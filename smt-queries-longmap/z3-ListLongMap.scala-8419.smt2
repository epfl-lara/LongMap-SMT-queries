; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102452 () Bool)

(assert start!102452)

(declare-fun b!1232342 () Bool)

(declare-fun res!820728 () Bool)

(declare-fun e!698964 () Bool)

(assert (=> b!1232342 (=> (not res!820728) (not e!698964))))

(declare-datatypes ((List!27128 0))(
  ( (Nil!27125) (Cons!27124 (h!28333 (_ BitVec 64)) (t!40591 List!27128)) )
))
(declare-fun acc!823 () List!27128)

(declare-fun contains!7190 (List!27128 (_ BitVec 64)) Bool)

(assert (=> b!1232342 (= res!820728 (not (contains!7190 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232343 () Bool)

(assert (=> b!1232343 (= e!698964 (not true))))

(declare-fun e!698962 () Bool)

(assert (=> b!1232343 e!698962))

(declare-fun res!820726 () Bool)

(assert (=> b!1232343 (=> (not res!820726) (not e!698962))))

(declare-datatypes ((array!79483 0))(
  ( (array!79484 (arr!38355 (Array (_ BitVec 32) (_ BitVec 64))) (size!38891 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79483)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79483 (_ BitVec 32) List!27128) Bool)

(assert (=> b!1232343 (= res!820726 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27125))))

(declare-datatypes ((Unit!40816 0))(
  ( (Unit!40817) )
))
(declare-fun lt!559508 () Unit!40816)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79483 List!27128 List!27128 (_ BitVec 32)) Unit!40816)

(assert (=> b!1232343 (= lt!559508 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27125 from!3184))))

(assert (=> b!1232343 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27124 (select (arr!38355 a!3806) from!3184) acc!823))))

(declare-fun res!820729 () Bool)

(assert (=> start!102452 (=> (not res!820729) (not e!698964))))

(assert (=> start!102452 (= res!820729 (bvslt (size!38891 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102452 e!698964))

(declare-fun array_inv!29203 (array!79483) Bool)

(assert (=> start!102452 (array_inv!29203 a!3806)))

(assert (=> start!102452 true))

(declare-fun b!1232344 () Bool)

(assert (=> b!1232344 (= e!698962 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27124 (select (arr!38355 a!3806) from!3184) Nil!27125)))))

(declare-fun b!1232345 () Bool)

(declare-fun res!820721 () Bool)

(assert (=> b!1232345 (=> (not res!820721) (not e!698964))))

(assert (=> b!1232345 (= res!820721 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38891 a!3806)) (bvslt from!3184 (size!38891 a!3806))))))

(declare-fun b!1232346 () Bool)

(declare-fun res!820722 () Bool)

(assert (=> b!1232346 (=> (not res!820722) (not e!698964))))

(assert (=> b!1232346 (= res!820722 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232347 () Bool)

(declare-fun res!820723 () Bool)

(assert (=> b!1232347 (=> (not res!820723) (not e!698964))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232347 (= res!820723 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232348 () Bool)

(declare-fun res!820727 () Bool)

(assert (=> b!1232348 (=> (not res!820727) (not e!698964))))

(assert (=> b!1232348 (= res!820727 (validKeyInArray!0 (select (arr!38355 a!3806) from!3184)))))

(declare-fun b!1232349 () Bool)

(declare-fun res!820720 () Bool)

(assert (=> b!1232349 (=> (not res!820720) (not e!698964))))

(declare-fun arrayContainsKey!0 (array!79483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232349 (= res!820720 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232350 () Bool)

(declare-fun res!820725 () Bool)

(assert (=> b!1232350 (=> (not res!820725) (not e!698964))))

(declare-fun noDuplicate!1787 (List!27128) Bool)

(assert (=> b!1232350 (= res!820725 (noDuplicate!1787 acc!823))))

(declare-fun b!1232351 () Bool)

(declare-fun res!820724 () Bool)

(assert (=> b!1232351 (=> (not res!820724) (not e!698964))))

(assert (=> b!1232351 (= res!820724 (not (contains!7190 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102452 res!820729) b!1232347))

(assert (= (and b!1232347 res!820723) b!1232345))

(assert (= (and b!1232345 res!820721) b!1232350))

(assert (= (and b!1232350 res!820725) b!1232342))

(assert (= (and b!1232342 res!820728) b!1232351))

(assert (= (and b!1232351 res!820724) b!1232349))

(assert (= (and b!1232349 res!820720) b!1232346))

(assert (= (and b!1232346 res!820722) b!1232348))

(assert (= (and b!1232348 res!820727) b!1232343))

(assert (= (and b!1232343 res!820726) b!1232344))

(declare-fun m!1136343 () Bool)

(assert (=> b!1232351 m!1136343))

(declare-fun m!1136345 () Bool)

(assert (=> b!1232344 m!1136345))

(declare-fun m!1136347 () Bool)

(assert (=> b!1232344 m!1136347))

(declare-fun m!1136349 () Bool)

(assert (=> start!102452 m!1136349))

(declare-fun m!1136351 () Bool)

(assert (=> b!1232346 m!1136351))

(declare-fun m!1136353 () Bool)

(assert (=> b!1232350 m!1136353))

(declare-fun m!1136355 () Bool)

(assert (=> b!1232349 m!1136355))

(declare-fun m!1136357 () Bool)

(assert (=> b!1232347 m!1136357))

(declare-fun m!1136359 () Bool)

(assert (=> b!1232342 m!1136359))

(declare-fun m!1136361 () Bool)

(assert (=> b!1232343 m!1136361))

(declare-fun m!1136363 () Bool)

(assert (=> b!1232343 m!1136363))

(assert (=> b!1232343 m!1136345))

(declare-fun m!1136365 () Bool)

(assert (=> b!1232343 m!1136365))

(assert (=> b!1232348 m!1136345))

(assert (=> b!1232348 m!1136345))

(declare-fun m!1136367 () Bool)

(assert (=> b!1232348 m!1136367))

(check-sat (not b!1232348) (not b!1232344) (not b!1232346) (not start!102452) (not b!1232347) (not b!1232343) (not b!1232342) (not b!1232351) (not b!1232350) (not b!1232349))
