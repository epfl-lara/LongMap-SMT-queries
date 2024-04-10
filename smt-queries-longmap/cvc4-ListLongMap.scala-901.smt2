; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20506 () Bool)

(assert start!20506)

(declare-fun b_free!5165 () Bool)

(declare-fun b_next!5165 () Bool)

(assert (=> start!20506 (= b_free!5165 (not b_next!5165))))

(declare-fun tp!18527 () Bool)

(declare-fun b_and!11911 () Bool)

(assert (=> start!20506 (= tp!18527 b_and!11911)))

(declare-fun mapNonEmpty!8600 () Bool)

(declare-fun mapRes!8600 () Bool)

(declare-fun tp!18526 () Bool)

(declare-fun e!133285 () Bool)

(assert (=> mapNonEmpty!8600 (= mapRes!8600 (and tp!18526 e!133285))))

(declare-datatypes ((V!6341 0))(
  ( (V!6342 (val!2555 Int)) )
))
(declare-datatypes ((ValueCell!2167 0))(
  ( (ValueCellFull!2167 (v!4525 V!6341)) (EmptyCell!2167) )
))
(declare-fun mapRest!8600 () (Array (_ BitVec 32) ValueCell!2167))

(declare-fun mapValue!8600 () ValueCell!2167)

(declare-datatypes ((array!9265 0))(
  ( (array!9266 (arr!4383 (Array (_ BitVec 32) ValueCell!2167)) (size!4708 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9265)

(declare-fun mapKey!8600 () (_ BitVec 32))

(assert (=> mapNonEmpty!8600 (= (arr!4383 _values!649) (store mapRest!8600 mapKey!8600 mapValue!8600))))

(declare-fun b!203607 () Bool)

(declare-fun res!97880 () Bool)

(declare-fun e!133281 () Bool)

(assert (=> b!203607 (=> (not res!97880) (not e!133281))))

(declare-datatypes ((array!9267 0))(
  ( (array!9268 (arr!4384 (Array (_ BitVec 32) (_ BitVec 64))) (size!4709 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9267)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9267 (_ BitVec 32)) Bool)

(assert (=> b!203607 (= res!97880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8600 () Bool)

(assert (=> mapIsEmpty!8600 mapRes!8600))

(declare-fun res!97884 () Bool)

(assert (=> start!20506 (=> (not res!97884) (not e!133281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20506 (= res!97884 (validMask!0 mask!1149))))

(assert (=> start!20506 e!133281))

(declare-fun e!133283 () Bool)

(declare-fun array_inv!2897 (array!9265) Bool)

(assert (=> start!20506 (and (array_inv!2897 _values!649) e!133283)))

(assert (=> start!20506 true))

(declare-fun tp_is_empty!5021 () Bool)

(assert (=> start!20506 tp_is_empty!5021))

(declare-fun array_inv!2898 (array!9267) Bool)

(assert (=> start!20506 (array_inv!2898 _keys!825)))

(assert (=> start!20506 tp!18527))

(declare-fun b!203608 () Bool)

(declare-fun e!133286 () Bool)

(assert (=> b!203608 (= e!133283 (and e!133286 mapRes!8600))))

(declare-fun condMapEmpty!8600 () Bool)

(declare-fun mapDefault!8600 () ValueCell!2167)

