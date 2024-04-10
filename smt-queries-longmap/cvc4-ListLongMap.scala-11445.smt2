; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133472 () Bool)

(assert start!133472)

(declare-fun b!1560415 () Bool)

(declare-fun res!1067026 () Bool)

(declare-fun e!869494 () Bool)

(assert (=> b!1560415 (=> (not res!1067026) (not e!869494))))

(declare-datatypes ((array!103834 0))(
  ( (array!103835 (arr!50109 (Array (_ BitVec 32) (_ BitVec 64))) (size!50659 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103834)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103834 (_ BitVec 32)) Bool)

(assert (=> b!1560415 (= res!1067026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560416 () Bool)

(assert (=> b!1560416 (= e!869494 false)))

(declare-fun lt!670989 () Bool)

(declare-datatypes ((List!36396 0))(
  ( (Nil!36393) (Cons!36392 (h!37838 (_ BitVec 64)) (t!51129 List!36396)) )
))
(declare-fun arrayNoDuplicates!0 (array!103834 (_ BitVec 32) List!36396) Bool)

(assert (=> b!1560416 (= lt!670989 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36393))))

(declare-fun mapNonEmpty!59208 () Bool)

(declare-fun mapRes!59208 () Bool)

(declare-fun tp!112863 () Bool)

(declare-fun e!869493 () Bool)

(assert (=> mapNonEmpty!59208 (= mapRes!59208 (and tp!112863 e!869493))))

(declare-fun mapKey!59208 () (_ BitVec 32))

(declare-datatypes ((V!59613 0))(
  ( (V!59614 (val!19361 Int)) )
))
(declare-datatypes ((ValueCell!18247 0))(
  ( (ValueCellFull!18247 (v!22113 V!59613)) (EmptyCell!18247) )
))
(declare-datatypes ((array!103836 0))(
  ( (array!103837 (arr!50110 (Array (_ BitVec 32) ValueCell!18247)) (size!50660 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103836)

(declare-fun mapRest!59208 () (Array (_ BitVec 32) ValueCell!18247))

(declare-fun mapValue!59208 () ValueCell!18247)

(assert (=> mapNonEmpty!59208 (= (arr!50110 _values!487) (store mapRest!59208 mapKey!59208 mapValue!59208))))

(declare-fun mapIsEmpty!59208 () Bool)

(assert (=> mapIsEmpty!59208 mapRes!59208))

(declare-fun b!1560417 () Bool)

(declare-fun e!869491 () Bool)

(declare-fun e!869492 () Bool)

(assert (=> b!1560417 (= e!869491 (and e!869492 mapRes!59208))))

(declare-fun condMapEmpty!59208 () Bool)

(declare-fun mapDefault!59208 () ValueCell!18247)

