; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20514 () Bool)

(assert start!20514)

(declare-fun b_free!5173 () Bool)

(declare-fun b_next!5173 () Bool)

(assert (=> start!20514 (= b_free!5173 (not b_next!5173))))

(declare-fun tp!18550 () Bool)

(declare-fun b_and!11919 () Bool)

(assert (=> start!20514 (= tp!18550 b_and!11919)))

(declare-fun b!203751 () Bool)

(declare-fun e!133365 () Bool)

(declare-fun tp_is_empty!5029 () Bool)

(assert (=> b!203751 (= e!133365 tp_is_empty!5029)))

(declare-fun b!203752 () Bool)

(declare-fun res!97991 () Bool)

(declare-fun e!133367 () Bool)

(assert (=> b!203752 (=> (not res!97991) (not e!133367))))

(declare-datatypes ((array!9281 0))(
  ( (array!9282 (arr!4391 (Array (_ BitVec 32) (_ BitVec 64))) (size!4716 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9281)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9281 (_ BitVec 32)) Bool)

(assert (=> b!203752 (= res!97991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203753 () Bool)

(declare-fun e!133370 () Bool)

(assert (=> b!203753 (= e!133370 true)))

(declare-datatypes ((V!6353 0))(
  ( (V!6354 (val!2559 Int)) )
))
(declare-datatypes ((tuple2!3882 0))(
  ( (tuple2!3883 (_1!1952 (_ BitVec 64)) (_2!1952 V!6353)) )
))
(declare-datatypes ((List!2783 0))(
  ( (Nil!2780) (Cons!2779 (h!3421 tuple2!3882) (t!7714 List!2783)) )
))
(declare-datatypes ((ListLongMap!2795 0))(
  ( (ListLongMap!2796 (toList!1413 List!2783)) )
))
(declare-fun lt!102933 () ListLongMap!2795)

(declare-fun lt!102937 () ListLongMap!2795)

(declare-fun lt!102928 () tuple2!3882)

(declare-fun +!440 (ListLongMap!2795 tuple2!3882) ListLongMap!2795)

(assert (=> b!203753 (= lt!102933 (+!440 lt!102937 lt!102928))))

(declare-fun lt!102934 () ListLongMap!2795)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6353)

(declare-datatypes ((Unit!6174 0))(
  ( (Unit!6175) )
))
(declare-fun lt!102929 () Unit!6174)

(declare-fun v!520 () V!6353)

(declare-fun addCommutativeForDiffKeys!151 (ListLongMap!2795 (_ BitVec 64) V!6353 (_ BitVec 64) V!6353) Unit!6174)

(assert (=> b!203753 (= lt!102929 (addCommutativeForDiffKeys!151 lt!102934 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203754 () Bool)

(declare-fun res!97994 () Bool)

(assert (=> b!203754 (=> (not res!97994) (not e!133367))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203754 (= res!97994 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4716 _keys!825))))))

(declare-fun b!203755 () Bool)

(declare-fun res!97992 () Bool)

(assert (=> b!203755 (=> (not res!97992) (not e!133367))))

(assert (=> b!203755 (= res!97992 (= (select (arr!4391 _keys!825) i!601) k!843))))

(declare-fun b!203756 () Bool)

(declare-fun e!133368 () Bool)

(declare-fun e!133364 () Bool)

(declare-fun mapRes!8612 () Bool)

(assert (=> b!203756 (= e!133368 (and e!133364 mapRes!8612))))

(declare-fun condMapEmpty!8612 () Bool)

(declare-datatypes ((ValueCell!2171 0))(
  ( (ValueCellFull!2171 (v!4529 V!6353)) (EmptyCell!2171) )
))
(declare-datatypes ((array!9283 0))(
  ( (array!9284 (arr!4392 (Array (_ BitVec 32) ValueCell!2171)) (size!4717 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9283)

(declare-fun mapDefault!8612 () ValueCell!2171)

