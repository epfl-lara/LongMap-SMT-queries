; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133592 () Bool)

(assert start!133592)

(declare-fun b_free!32009 () Bool)

(declare-fun b_next!32009 () Bool)

(assert (=> start!133592 (= b_free!32009 (not b_next!32009))))

(declare-fun tp!113150 () Bool)

(declare-fun b_and!51529 () Bool)

(assert (=> start!133592 (= tp!113150 b_and!51529)))

(declare-fun mapNonEmpty!59388 () Bool)

(declare-fun mapRes!59388 () Bool)

(declare-fun tp!113151 () Bool)

(declare-fun e!870399 () Bool)

(assert (=> mapNonEmpty!59388 (= mapRes!59388 (and tp!113151 e!870399))))

(declare-datatypes ((V!59773 0))(
  ( (V!59774 (val!19421 Int)) )
))
(declare-datatypes ((ValueCell!18307 0))(
  ( (ValueCellFull!18307 (v!22173 V!59773)) (EmptyCell!18307) )
))
(declare-fun mapValue!59388 () ValueCell!18307)

(declare-fun mapKey!59388 () (_ BitVec 32))

(declare-fun mapRest!59388 () (Array (_ BitVec 32) ValueCell!18307))

(declare-datatypes ((array!104068 0))(
  ( (array!104069 (arr!50226 (Array (_ BitVec 32) ValueCell!18307)) (size!50776 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104068)

(assert (=> mapNonEmpty!59388 (= (arr!50226 _values!487) (store mapRest!59388 mapKey!59388 mapValue!59388))))

(declare-fun res!1067924 () Bool)

(declare-fun e!870402 () Bool)

(assert (=> start!133592 (=> (not res!1067924) (not e!870402))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133592 (= res!1067924 (validMask!0 mask!947))))

(assert (=> start!133592 e!870402))

(assert (=> start!133592 tp!113150))

(declare-fun tp_is_empty!38675 () Bool)

(assert (=> start!133592 tp_is_empty!38675))

(assert (=> start!133592 true))

(declare-datatypes ((array!104070 0))(
  ( (array!104071 (arr!50227 (Array (_ BitVec 32) (_ BitVec 64))) (size!50777 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104070)

(declare-fun array_inv!39039 (array!104070) Bool)

(assert (=> start!133592 (array_inv!39039 _keys!637)))

(declare-fun e!870400 () Bool)

(declare-fun array_inv!39040 (array!104068) Bool)

(assert (=> start!133592 (and (array_inv!39040 _values!487) e!870400)))

(declare-fun b!1561915 () Bool)

(declare-fun e!870401 () Bool)

(assert (=> b!1561915 (= e!870400 (and e!870401 mapRes!59388))))

(declare-fun condMapEmpty!59388 () Bool)

(declare-fun mapDefault!59388 () ValueCell!18307)

