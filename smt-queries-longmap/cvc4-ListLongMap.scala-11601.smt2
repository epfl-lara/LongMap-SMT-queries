; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135388 () Bool)

(assert start!135388)

(declare-fun res!1075182 () Bool)

(declare-fun e!877666 () Bool)

(assert (=> start!135388 (=> (not res!1075182) (not e!877666))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135388 (= res!1075182 (validMask!0 mask!889))))

(assert (=> start!135388 e!877666))

(assert (=> start!135388 true))

(declare-datatypes ((array!105145 0))(
  ( (array!105146 (arr!50724 (Array (_ BitVec 32) (_ BitVec 64))) (size!51274 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105145)

(declare-fun array_inv!39451 (array!105145) Bool)

(assert (=> start!135388 (array_inv!39451 _keys!600)))

(declare-fun b!1573840 () Bool)

(declare-fun res!1075185 () Bool)

(assert (=> b!1573840 (=> (not res!1075185) (not e!877666))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573840 (= res!1075185 (validKeyInArray!0 k!754))))

(declare-fun b!1573839 () Bool)

(declare-fun res!1075184 () Bool)

(assert (=> b!1573839 (=> (not res!1075184) (not e!877666))))

(assert (=> b!1573839 (= res!1075184 (= (size!51274 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun e!877665 () Bool)

(declare-datatypes ((SeekEntryResult!13637 0))(
  ( (MissingZero!13637 (index!56946 (_ BitVec 32))) (Found!13637 (index!56947 (_ BitVec 32))) (Intermediate!13637 (undefined!14449 Bool) (index!56948 (_ BitVec 32)) (x!141762 (_ BitVec 32))) (Undefined!13637) (MissingVacant!13637 (index!56949 (_ BitVec 32))) )
))
(declare-fun lt!674622 () SeekEntryResult!13637)

(declare-fun b!1573842 () Bool)

(assert (=> b!1573842 (= e!877665 (or (is-MissingVacant!13637 lt!674622) (and (is-Found!13637 lt!674622) (not (= (select (arr!50724 _keys!600) (index!56947 lt!674622)) k!754)))))))

(declare-fun err!170 () SeekEntryResult!13637)

(assert (=> b!1573842 (= lt!674622 err!170)))

(assert (=> b!1573842 true))

(declare-fun b!1573841 () Bool)

(assert (=> b!1573841 (= e!877666 e!877665)))

(declare-fun res!1075183 () Bool)

(assert (=> b!1573841 (=> (not res!1075183) (not e!877665))))

(declare-fun lt!674621 () Bool)

(declare-fun lt!674623 () SeekEntryResult!13637)

(assert (=> b!1573841 (= res!1075183 (and (or lt!674621 (not (undefined!14449 lt!674623))) (or lt!674621 (undefined!14449 lt!674623))))))

(assert (=> b!1573841 (= lt!674621 (not (is-Intermediate!13637 lt!674623)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105145 (_ BitVec 32)) SeekEntryResult!13637)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573841 (= lt!674623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135388 res!1075182) b!1573839))

(assert (= (and b!1573839 res!1075184) b!1573840))

(assert (= (and b!1573840 res!1075185) b!1573841))

(assert (= (and b!1573841 res!1075183) b!1573842))

(declare-fun m!1447069 () Bool)

(assert (=> start!135388 m!1447069))

(declare-fun m!1447071 () Bool)

(assert (=> start!135388 m!1447071))

(declare-fun m!1447073 () Bool)

(assert (=> b!1573840 m!1447073))

(declare-fun m!1447075 () Bool)

(assert (=> b!1573842 m!1447075))

(declare-fun m!1447077 () Bool)

(assert (=> b!1573841 m!1447077))

(assert (=> b!1573841 m!1447077))

(declare-fun m!1447079 () Bool)

(assert (=> b!1573841 m!1447079))

(push 1)

(assert (not b!1573840))

(assert (not b!1573841))

(assert (not start!135388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

