; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110480 () Bool)

(assert start!110480)

(declare-fun mapNonEmpty!54196 () Bool)

(declare-fun mapRes!54196 () Bool)

(declare-fun tp!103276 () Bool)

(declare-fun e!745724 () Bool)

(assert (=> mapNonEmpty!54196 (= mapRes!54196 (and tp!103276 e!745724))))

(declare-datatypes ((V!51829 0))(
  ( (V!51830 (val!17597 Int)) )
))
(declare-datatypes ((ValueCell!16624 0))(
  ( (ValueCellFull!16624 (v!20224 V!51829)) (EmptyCell!16624) )
))
(declare-fun mapRest!54196 () (Array (_ BitVec 32) ValueCell!16624))

(declare-fun mapKey!54196 () (_ BitVec 32))

(declare-datatypes ((array!87098 0))(
  ( (array!87099 (arr!42029 (Array (_ BitVec 32) ValueCell!16624)) (size!42579 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87098)

(declare-fun mapValue!54196 () ValueCell!16624)

(assert (=> mapNonEmpty!54196 (= (arr!42029 _values!1354) (store mapRest!54196 mapKey!54196 mapValue!54196))))

(declare-fun b!1306930 () Bool)

(declare-fun tp_is_empty!35045 () Bool)

(assert (=> b!1306930 (= e!745724 tp_is_empty!35045)))

(declare-fun b!1306931 () Bool)

(declare-fun e!745723 () Bool)

(declare-fun e!745727 () Bool)

(assert (=> b!1306931 (= e!745723 (and e!745727 mapRes!54196))))

(declare-fun condMapEmpty!54196 () Bool)

(declare-fun mapDefault!54196 () ValueCell!16624)

