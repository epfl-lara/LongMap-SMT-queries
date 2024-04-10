; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74310 () Bool)

(assert start!74310)

(declare-fun b_free!15073 () Bool)

(declare-fun b_next!15073 () Bool)

(assert (=> start!74310 (= b_free!15073 (not b_next!15073))))

(declare-fun tp!52893 () Bool)

(declare-fun b_and!24849 () Bool)

(assert (=> start!74310 (= tp!52893 b_and!24849)))

(declare-fun mapNonEmpty!27584 () Bool)

(declare-fun mapRes!27584 () Bool)

(declare-fun tp!52894 () Bool)

(declare-fun e!486844 () Bool)

(assert (=> mapNonEmpty!27584 (= mapRes!27584 (and tp!52894 e!486844))))

(declare-fun mapKey!27584 () (_ BitVec 32))

(declare-datatypes ((V!28137 0))(
  ( (V!28138 (val!8706 Int)) )
))
(declare-datatypes ((ValueCell!8219 0))(
  ( (ValueCellFull!8219 (v!11135 V!28137)) (EmptyCell!8219) )
))
(declare-fun mapValue!27584 () ValueCell!8219)

(declare-datatypes ((array!50762 0))(
  ( (array!50763 (arr!24409 (Array (_ BitVec 32) ValueCell!8219)) (size!24849 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50762)

(declare-fun mapRest!27584 () (Array (_ BitVec 32) ValueCell!8219))

(assert (=> mapNonEmpty!27584 (= (arr!24409 _values!688) (store mapRest!27584 mapKey!27584 mapValue!27584))))

(declare-fun b!874379 () Bool)

(declare-fun e!486843 () Bool)

(declare-fun tp_is_empty!17317 () Bool)

(assert (=> b!874379 (= e!486843 tp_is_empty!17317)))

(declare-fun b!874380 () Bool)

(assert (=> b!874380 (= e!486844 tp_is_empty!17317)))

(declare-fun b!874381 () Bool)

(declare-fun res!594210 () Bool)

(declare-fun e!486842 () Bool)

(assert (=> b!874381 (=> (not res!594210) (not e!486842))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50764 0))(
  ( (array!50765 (arr!24410 (Array (_ BitVec 32) (_ BitVec 64))) (size!24850 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50764)

(assert (=> b!874381 (= res!594210 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24850 _keys!868))))))

(declare-fun b!874382 () Bool)

(declare-fun res!594203 () Bool)

(assert (=> b!874382 (=> (not res!594203) (not e!486842))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50764 (_ BitVec 32)) Bool)

(assert (=> b!874382 (= res!594203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874383 () Bool)

(declare-fun e!486841 () Bool)

(assert (=> b!874383 (= e!486841 (and e!486843 mapRes!27584))))

(declare-fun condMapEmpty!27584 () Bool)

(declare-fun mapDefault!27584 () ValueCell!8219)

