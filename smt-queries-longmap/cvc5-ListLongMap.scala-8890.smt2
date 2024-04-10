; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107950 () Bool)

(assert start!107950)

(declare-fun b!1275398 () Bool)

(declare-fun e!728080 () Bool)

(declare-fun tp_is_empty!33253 () Bool)

(assert (=> b!1275398 (= e!728080 tp_is_empty!33253)))

(declare-fun mapNonEmpty!51398 () Bool)

(declare-fun mapRes!51398 () Bool)

(declare-fun tp!98156 () Bool)

(assert (=> mapNonEmpty!51398 (= mapRes!51398 (and tp!98156 e!728080))))

(declare-datatypes ((V!49441 0))(
  ( (V!49442 (val!16701 Int)) )
))
(declare-datatypes ((ValueCell!15728 0))(
  ( (ValueCellFull!15728 (v!19297 V!49441)) (EmptyCell!15728) )
))
(declare-fun mapValue!51398 () ValueCell!15728)

(declare-fun mapRest!51398 () (Array (_ BitVec 32) ValueCell!15728))

(declare-fun mapKey!51398 () (_ BitVec 32))

(declare-datatypes ((array!83614 0))(
  ( (array!83615 (arr!40322 (Array (_ BitVec 32) ValueCell!15728)) (size!40872 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83614)

(assert (=> mapNonEmpty!51398 (= (arr!40322 _values!1187) (store mapRest!51398 mapKey!51398 mapValue!51398))))

(declare-fun b!1275399 () Bool)

(declare-fun e!728079 () Bool)

(declare-fun e!728078 () Bool)

(assert (=> b!1275399 (= e!728079 (and e!728078 mapRes!51398))))

(declare-fun condMapEmpty!51398 () Bool)

(declare-fun mapDefault!51398 () ValueCell!15728)

