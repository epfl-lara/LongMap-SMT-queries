; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135082 () Bool)

(assert start!135082)

(declare-fun res!1074532 () Bool)

(declare-fun e!876950 () Bool)

(assert (=> start!135082 (=> (not res!1074532) (not e!876950))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135082 (= res!1074532 (validMask!0 mask!889))))

(assert (=> start!135082 e!876950))

(assert (=> start!135082 true))

(declare-datatypes ((array!105044 0))(
  ( (array!105045 (arr!50684 (Array (_ BitVec 32) (_ BitVec 64))) (size!51234 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105044)

(declare-fun array_inv!39411 (array!105044) Bool)

(assert (=> start!135082 (array_inv!39411 _keys!600)))

(declare-fun b!1572670 () Bool)

(declare-fun res!1074534 () Bool)

(assert (=> b!1572670 (=> (not res!1074534) (not e!876950))))

(assert (=> b!1572670 (= res!1074534 (= (size!51234 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572671 () Bool)

(declare-fun res!1074533 () Bool)

(assert (=> b!1572671 (=> (not res!1074533) (not e!876950))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572671 (= res!1074533 (validKeyInArray!0 k0!754))))

(declare-fun b!1572672 () Bool)

(assert (=> b!1572672 (= e!876950 false)))

(declare-datatypes ((SeekEntryResult!13597 0))(
  ( (MissingZero!13597 (index!56786 (_ BitVec 32))) (Found!13597 (index!56787 (_ BitVec 32))) (Intermediate!13597 (undefined!14409 Bool) (index!56788 (_ BitVec 32)) (x!141567 (_ BitVec 32))) (Undefined!13597) (MissingVacant!13597 (index!56789 (_ BitVec 32))) )
))
(declare-fun lt!674080 () SeekEntryResult!13597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105044 (_ BitVec 32)) SeekEntryResult!13597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572672 (= lt!674080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135082 res!1074532) b!1572670))

(assert (= (and b!1572670 res!1074534) b!1572671))

(assert (= (and b!1572671 res!1074533) b!1572672))

(declare-fun m!1446341 () Bool)

(assert (=> start!135082 m!1446341))

(declare-fun m!1446343 () Bool)

(assert (=> start!135082 m!1446343))

(declare-fun m!1446345 () Bool)

(assert (=> b!1572671 m!1446345))

(declare-fun m!1446347 () Bool)

(assert (=> b!1572672 m!1446347))

(assert (=> b!1572672 m!1446347))

(declare-fun m!1446349 () Bool)

(assert (=> b!1572672 m!1446349))

(check-sat (not b!1572672) (not start!135082) (not b!1572671))
(check-sat)
