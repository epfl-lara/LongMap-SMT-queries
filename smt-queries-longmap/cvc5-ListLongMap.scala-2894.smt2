; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41506 () Bool)

(assert start!41506)

(declare-fun b_free!11173 () Bool)

(declare-fun b_next!11173 () Bool)

(assert (=> start!41506 (= b_free!11173 (not b_next!11173))))

(declare-fun tp!39516 () Bool)

(declare-fun b_and!19513 () Bool)

(assert (=> start!41506 (= tp!39516 b_and!19513)))

(declare-fun mapNonEmpty!20578 () Bool)

(declare-fun mapRes!20578 () Bool)

(declare-fun tp!39517 () Bool)

(declare-fun e!270747 () Bool)

(assert (=> mapNonEmpty!20578 (= mapRes!20578 (and tp!39517 e!270747))))

(declare-datatypes ((V!17907 0))(
  ( (V!17908 (val!6345 Int)) )
))
(declare-datatypes ((ValueCell!5957 0))(
  ( (ValueCellFull!5957 (v!8632 V!17907)) (EmptyCell!5957) )
))
(declare-fun mapValue!20578 () ValueCell!5957)

(declare-datatypes ((array!28995 0))(
  ( (array!28996 (arr!13929 (Array (_ BitVec 32) ValueCell!5957)) (size!14281 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28995)

(declare-fun mapKey!20578 () (_ BitVec 32))

(declare-fun mapRest!20578 () (Array (_ BitVec 32) ValueCell!5957))

(assert (=> mapNonEmpty!20578 (= (arr!13929 _values!833) (store mapRest!20578 mapKey!20578 mapValue!20578))))

(declare-fun b!463663 () Bool)

(declare-fun res!277229 () Bool)

(declare-fun e!270743 () Bool)

(assert (=> b!463663 (=> (not res!277229) (not e!270743))))

(declare-datatypes ((array!28997 0))(
  ( (array!28998 (arr!13930 (Array (_ BitVec 32) (_ BitVec 64))) (size!14282 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28997)

(declare-datatypes ((List!8405 0))(
  ( (Nil!8402) (Cons!8401 (h!9257 (_ BitVec 64)) (t!14351 List!8405)) )
))
(declare-fun arrayNoDuplicates!0 (array!28997 (_ BitVec 32) List!8405) Bool)

(assert (=> b!463663 (= res!277229 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8402))))

(declare-fun b!463664 () Bool)

(declare-fun e!270745 () Bool)

(declare-fun e!270744 () Bool)

(assert (=> b!463664 (= e!270745 (and e!270744 mapRes!20578))))

(declare-fun condMapEmpty!20578 () Bool)

(declare-fun mapDefault!20578 () ValueCell!5957)

