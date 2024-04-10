; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112888 () Bool)

(assert start!112888)

(declare-fun mapNonEmpty!57166 () Bool)

(declare-fun mapRes!57166 () Bool)

(declare-fun tp!108865 () Bool)

(declare-fun e!762256 () Bool)

(assert (=> mapNonEmpty!57166 (= mapRes!57166 (and tp!108865 e!762256))))

(declare-datatypes ((V!54413 0))(
  ( (V!54414 (val!18566 Int)) )
))
(declare-datatypes ((ValueCell!17593 0))(
  ( (ValueCellFull!17593 (v!21213 V!54413)) (EmptyCell!17593) )
))
(declare-fun mapRest!57166 () (Array (_ BitVec 32) ValueCell!17593))

(declare-fun mapValue!57166 () ValueCell!17593)

(declare-fun mapKey!57166 () (_ BitVec 32))

(declare-datatypes ((array!90826 0))(
  ( (array!90827 (arr!43874 (Array (_ BitVec 32) ValueCell!17593)) (size!44424 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90826)

(assert (=> mapNonEmpty!57166 (= (arr!43874 _values!1303) (store mapRest!57166 mapKey!57166 mapValue!57166))))

(declare-fun b!1338637 () Bool)

(declare-fun e!762255 () Bool)

(declare-fun tp_is_empty!36983 () Bool)

(assert (=> b!1338637 (= e!762255 tp_is_empty!36983)))

(declare-fun b!1338638 () Bool)

(declare-fun e!762254 () Bool)

(assert (=> b!1338638 (= e!762254 (and e!762255 mapRes!57166))))

(declare-fun condMapEmpty!57166 () Bool)

(declare-fun mapDefault!57166 () ValueCell!17593)

