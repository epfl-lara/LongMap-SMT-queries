; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135316 () Bool)

(assert start!135316)

(declare-fun b!1573605 () Bool)

(declare-fun res!1075051 () Bool)

(declare-fun e!877521 () Bool)

(assert (=> b!1573605 (=> (not res!1075051) (not e!877521))))

(declare-datatypes ((array!105127 0))(
  ( (array!105128 (arr!50718 (Array (_ BitVec 32) (_ BitVec 64))) (size!51268 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105127)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573605 (= res!1075051 (= (size!51268 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573606 () Bool)

(declare-fun res!1075050 () Bool)

(assert (=> b!1573606 (=> (not res!1075050) (not e!877521))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573606 (= res!1075050 (validKeyInArray!0 k!754))))

(declare-fun res!1075052 () Bool)

(assert (=> start!135316 (=> (not res!1075052) (not e!877521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135316 (= res!1075052 (validMask!0 mask!889))))

(assert (=> start!135316 e!877521))

(assert (=> start!135316 true))

(declare-fun array_inv!39445 (array!105127) Bool)

(assert (=> start!135316 (array_inv!39445 _keys!600)))

(declare-fun b!1573608 () Bool)

(declare-fun e!877523 () Bool)

(declare-datatypes ((SeekEntryResult!13631 0))(
  ( (MissingZero!13631 (index!56922 (_ BitVec 32))) (Found!13631 (index!56923 (_ BitVec 32))) (Intermediate!13631 (undefined!14443 Bool) (index!56924 (_ BitVec 32)) (x!141728 (_ BitVec 32))) (Undefined!13631) (MissingVacant!13631 (index!56925 (_ BitVec 32))) )
))
(declare-fun lt!674495 () SeekEntryResult!13631)

(assert (=> b!1573608 (= e!877523 (and (not (is-MissingVacant!13631 lt!674495)) (is-Found!13631 lt!674495) (or (bvslt (index!56923 lt!674495) #b00000000000000000000000000000000) (bvsge (index!56923 lt!674495) (size!51268 _keys!600)))))))

(declare-fun err!146 () SeekEntryResult!13631)

(assert (=> b!1573608 (= lt!674495 err!146)))

(assert (=> b!1573608 true))

(declare-fun b!1573607 () Bool)

(assert (=> b!1573607 (= e!877521 e!877523)))

(declare-fun res!1075053 () Bool)

(assert (=> b!1573607 (=> (not res!1075053) (not e!877523))))

(declare-fun lt!674496 () Bool)

(declare-fun lt!674497 () SeekEntryResult!13631)

(assert (=> b!1573607 (= res!1075053 (and (or lt!674496 (not (undefined!14443 lt!674497))) (or lt!674496 (undefined!14443 lt!674497))))))

(assert (=> b!1573607 (= lt!674496 (not (is-Intermediate!13631 lt!674497)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105127 (_ BitVec 32)) SeekEntryResult!13631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573607 (= lt!674497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135316 res!1075052) b!1573605))

(assert (= (and b!1573605 res!1075051) b!1573606))

(assert (= (and b!1573606 res!1075050) b!1573607))

(assert (= (and b!1573607 res!1075053) b!1573608))

(declare-fun m!1446957 () Bool)

(assert (=> b!1573606 m!1446957))

(declare-fun m!1446959 () Bool)

(assert (=> start!135316 m!1446959))

(declare-fun m!1446961 () Bool)

(assert (=> start!135316 m!1446961))

(declare-fun m!1446963 () Bool)

(assert (=> b!1573607 m!1446963))

(assert (=> b!1573607 m!1446963))

(declare-fun m!1446965 () Bool)

(assert (=> b!1573607 m!1446965))

(push 1)

(assert (not b!1573607))

(assert (not start!135316))

(assert (not b!1573606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573681 () Bool)

