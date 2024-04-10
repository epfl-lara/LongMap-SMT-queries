; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97802 () Bool)

(assert start!97802)

(declare-fun b_free!23503 () Bool)

(declare-fun b_next!23503 () Bool)

(assert (=> start!97802 (= b_free!23503 (not b_next!23503))))

(declare-fun tp!83212 () Bool)

(declare-fun b_and!37789 () Bool)

(assert (=> start!97802 (= tp!83212 b_and!37789)))

(declare-fun mapNonEmpty!43867 () Bool)

(declare-fun mapRes!43867 () Bool)

(declare-fun tp!83213 () Bool)

(declare-fun e!637319 () Bool)

(assert (=> mapNonEmpty!43867 (= mapRes!43867 (and tp!83213 e!637319))))

(declare-datatypes ((V!42505 0))(
  ( (V!42506 (val!14073 Int)) )
))
(declare-datatypes ((ValueCell!13307 0))(
  ( (ValueCellFull!13307 (v!16706 V!42505)) (EmptyCell!13307) )
))
(declare-fun mapRest!43867 () (Array (_ BitVec 32) ValueCell!13307))

(declare-datatypes ((array!72955 0))(
  ( (array!72956 (arr!35130 (Array (_ BitVec 32) ValueCell!13307)) (size!35666 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72955)

(declare-fun mapValue!43867 () ValueCell!13307)

(declare-fun mapKey!43867 () (_ BitVec 32))

(assert (=> mapNonEmpty!43867 (= (arr!35130 _values!996) (store mapRest!43867 mapKey!43867 mapValue!43867))))

(declare-fun b!1118990 () Bool)

(declare-fun e!637318 () Bool)

(declare-fun e!637317 () Bool)

(assert (=> b!1118990 (= e!637318 (and e!637317 mapRes!43867))))

(declare-fun condMapEmpty!43867 () Bool)

(declare-fun mapDefault!43867 () ValueCell!13307)

