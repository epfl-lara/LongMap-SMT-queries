; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35288 () Bool)

(assert start!35288)

(declare-fun mapNonEmpty!13170 () Bool)

(declare-fun mapRes!13170 () Bool)

(declare-fun tp!27066 () Bool)

(declare-fun e!216569 () Bool)

(assert (=> mapNonEmpty!13170 (= mapRes!13170 (and tp!27066 e!216569))))

(declare-datatypes ((V!11355 0))(
  ( (V!11356 (val!3936 Int)) )
))
(declare-datatypes ((ValueCell!3548 0))(
  ( (ValueCellFull!3548 (v!6129 V!11355)) (EmptyCell!3548) )
))
(declare-fun mapValue!13170 () ValueCell!3548)

(declare-fun mapRest!13170 () (Array (_ BitVec 32) ValueCell!3548))

(declare-datatypes ((array!19157 0))(
  ( (array!19158 (arr!9076 (Array (_ BitVec 32) ValueCell!3548)) (size!9428 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19157)

(declare-fun mapKey!13170 () (_ BitVec 32))

(assert (=> mapNonEmpty!13170 (= (arr!9076 _values!1208) (store mapRest!13170 mapKey!13170 mapValue!13170))))

(declare-fun b!353587 () Bool)

(declare-fun e!216568 () Bool)

(declare-fun e!216567 () Bool)

(assert (=> b!353587 (= e!216568 (and e!216567 mapRes!13170))))

(declare-fun condMapEmpty!13170 () Bool)

(declare-fun mapDefault!13170 () ValueCell!3548)

