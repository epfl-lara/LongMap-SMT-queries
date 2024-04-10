; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133484 () Bool)

(assert start!133484)

(declare-fun res!1067082 () Bool)

(declare-fun e!869583 () Bool)

(assert (=> start!133484 (=> (not res!1067082) (not e!869583))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133484 (= res!1067082 (validMask!0 mask!947))))

(assert (=> start!133484 e!869583))

(assert (=> start!133484 true))

(declare-datatypes ((V!59629 0))(
  ( (V!59630 (val!19367 Int)) )
))
(declare-datatypes ((ValueCell!18253 0))(
  ( (ValueCellFull!18253 (v!22119 V!59629)) (EmptyCell!18253) )
))
(declare-datatypes ((array!103856 0))(
  ( (array!103857 (arr!50120 (Array (_ BitVec 32) ValueCell!18253)) (size!50670 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103856)

(declare-fun e!869581 () Bool)

(declare-fun array_inv!38961 (array!103856) Bool)

(assert (=> start!133484 (and (array_inv!38961 _values!487) e!869581)))

(declare-datatypes ((array!103858 0))(
  ( (array!103859 (arr!50121 (Array (_ BitVec 32) (_ BitVec 64))) (size!50671 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103858)

(declare-fun array_inv!38962 (array!103858) Bool)

(assert (=> start!133484 (array_inv!38962 _keys!637)))

(declare-fun b!1560522 () Bool)

(declare-fun res!1067080 () Bool)

(assert (=> b!1560522 (=> (not res!1067080) (not e!869583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103858 (_ BitVec 32)) Bool)

(assert (=> b!1560522 (= res!1067080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560523 () Bool)

(declare-fun res!1067081 () Bool)

(assert (=> b!1560523 (=> (not res!1067081) (not e!869583))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560523 (= res!1067081 (and (= (size!50670 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50671 _keys!637) (size!50670 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560524 () Bool)

(declare-fun e!869584 () Bool)

(declare-fun mapRes!59226 () Bool)

(assert (=> b!1560524 (= e!869581 (and e!869584 mapRes!59226))))

(declare-fun condMapEmpty!59226 () Bool)

(declare-fun mapDefault!59226 () ValueCell!18253)

