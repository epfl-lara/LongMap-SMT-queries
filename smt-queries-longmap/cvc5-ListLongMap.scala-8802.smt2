; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107036 () Bool)

(assert start!107036)

(declare-fun b_free!27541 () Bool)

(declare-fun b_next!27541 () Bool)

(assert (=> start!107036 (= b_free!27541 (not b_next!27541))))

(declare-fun tp!96849 () Bool)

(declare-fun b_and!45573 () Bool)

(assert (=> start!107036 (= tp!96849 b_and!45573)))

(declare-fun mapNonEmpty!50668 () Bool)

(declare-fun mapRes!50668 () Bool)

(declare-fun tp!96850 () Bool)

(declare-fun e!723269 () Bool)

(assert (=> mapNonEmpty!50668 (= mapRes!50668 (and tp!96850 e!723269))))

(declare-datatypes ((V!48827 0))(
  ( (V!48828 (val!16437 Int)) )
))
(declare-datatypes ((ValueCell!15509 0))(
  ( (ValueCellFull!15509 (v!19074 V!48827)) (EmptyCell!15509) )
))
(declare-datatypes ((array!82716 0))(
  ( (array!82717 (arr!39895 (Array (_ BitVec 32) ValueCell!15509)) (size!40431 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82716)

(declare-fun mapRest!50668 () (Array (_ BitVec 32) ValueCell!15509))

(declare-fun mapKey!50668 () (_ BitVec 32))

(declare-fun mapValue!50668 () ValueCell!15509)

(assert (=> mapNonEmpty!50668 (= (arr!39895 _values!1134) (store mapRest!50668 mapKey!50668 mapValue!50668))))

(declare-fun b!1269028 () Bool)

(declare-fun tp_is_empty!32725 () Bool)

(assert (=> b!1269028 (= e!723269 tp_is_empty!32725)))

(declare-fun b!1269029 () Bool)

(declare-fun e!723273 () Bool)

(declare-fun e!723270 () Bool)

(assert (=> b!1269029 (= e!723273 (and e!723270 mapRes!50668))))

(declare-fun condMapEmpty!50668 () Bool)

(declare-fun mapDefault!50668 () ValueCell!15509)

