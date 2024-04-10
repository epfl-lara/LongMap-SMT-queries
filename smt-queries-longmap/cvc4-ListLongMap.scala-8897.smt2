; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108026 () Bool)

(assert start!108026)

(declare-fun mapNonEmpty!51476 () Bool)

(declare-fun mapRes!51476 () Bool)

(declare-fun tp!98234 () Bool)

(declare-fun e!728499 () Bool)

(assert (=> mapNonEmpty!51476 (= mapRes!51476 (and tp!98234 e!728499))))

(declare-datatypes ((V!49501 0))(
  ( (V!49502 (val!16724 Int)) )
))
(declare-datatypes ((ValueCell!15751 0))(
  ( (ValueCellFull!15751 (v!19321 V!49501)) (EmptyCell!15751) )
))
(declare-fun mapRest!51476 () (Array (_ BitVec 32) ValueCell!15751))

(declare-fun mapKey!51476 () (_ BitVec 32))

(declare-fun mapValue!51476 () ValueCell!15751)

(declare-datatypes ((array!83696 0))(
  ( (array!83697 (arr!40360 (Array (_ BitVec 32) ValueCell!15751)) (size!40910 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83696)

(assert (=> mapNonEmpty!51476 (= (arr!40360 _values!1187) (store mapRest!51476 mapKey!51476 mapValue!51476))))

(declare-fun mapIsEmpty!51476 () Bool)

(assert (=> mapIsEmpty!51476 mapRes!51476))

(declare-fun b!1275928 () Bool)

(declare-fun tp_is_empty!33299 () Bool)

(assert (=> b!1275928 (= e!728499 tp_is_empty!33299)))

(declare-fun b!1275929 () Bool)

(declare-fun e!728497 () Bool)

(declare-fun e!728496 () Bool)

(assert (=> b!1275929 (= e!728497 (and e!728496 mapRes!51476))))

(declare-fun condMapEmpty!51476 () Bool)

(declare-fun mapDefault!51476 () ValueCell!15751)

