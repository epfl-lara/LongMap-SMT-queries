; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35544 () Bool)

(assert start!35544)

(declare-fun res!197586 () Bool)

(declare-fun e!218272 () Bool)

(assert (=> start!35544 (=> (not res!197586) (not e!218272))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35544 (= res!197586 (validMask!0 mask!1842))))

(assert (=> start!35544 e!218272))

(assert (=> start!35544 true))

(declare-datatypes ((V!11639 0))(
  ( (V!11640 (val!4043 Int)) )
))
(declare-datatypes ((ValueCell!3655 0))(
  ( (ValueCellFull!3655 (v!6237 V!11639)) (EmptyCell!3655) )
))
(declare-datatypes ((array!19565 0))(
  ( (array!19566 (arr!9276 (Array (_ BitVec 32) ValueCell!3655)) (size!9628 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19565)

(declare-fun e!218274 () Bool)

(declare-fun array_inv!6818 (array!19565) Bool)

(assert (=> start!35544 (and (array_inv!6818 _values!1208) e!218274)))

(declare-datatypes ((array!19567 0))(
  ( (array!19568 (arr!9277 (Array (_ BitVec 32) (_ BitVec 64))) (size!9629 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19567)

(declare-fun array_inv!6819 (array!19567) Bool)

(assert (=> start!35544 (array_inv!6819 _keys!1456)))

(declare-fun b!356168 () Bool)

(declare-fun res!197585 () Bool)

(assert (=> b!356168 (=> (not res!197585) (not e!218272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19567 (_ BitVec 32)) Bool)

(assert (=> b!356168 (= res!197585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13503 () Bool)

(declare-fun mapRes!13503 () Bool)

(declare-fun tp!27480 () Bool)

(declare-fun e!218275 () Bool)

(assert (=> mapNonEmpty!13503 (= mapRes!13503 (and tp!27480 e!218275))))

(declare-fun mapValue!13503 () ValueCell!3655)

(declare-fun mapKey!13503 () (_ BitVec 32))

(declare-fun mapRest!13503 () (Array (_ BitVec 32) ValueCell!3655))

(assert (=> mapNonEmpty!13503 (= (arr!9276 _values!1208) (store mapRest!13503 mapKey!13503 mapValue!13503))))

(declare-fun b!356169 () Bool)

(declare-fun tp_is_empty!7997 () Bool)

(assert (=> b!356169 (= e!218275 tp_is_empty!7997)))

(declare-fun b!356170 () Bool)

(declare-fun e!218276 () Bool)

(assert (=> b!356170 (= e!218274 (and e!218276 mapRes!13503))))

(declare-fun condMapEmpty!13503 () Bool)

(declare-fun mapDefault!13503 () ValueCell!3655)

