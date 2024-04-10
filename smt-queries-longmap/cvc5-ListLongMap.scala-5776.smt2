; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74558 () Bool)

(assert start!74558)

(declare-fun b_free!15247 () Bool)

(declare-fun b_next!15247 () Bool)

(assert (=> start!74558 (= b_free!15247 (not b_next!15247))))

(declare-fun tp!53422 () Bool)

(declare-fun b_and!25123 () Bool)

(assert (=> start!74558 (= tp!53422 b_and!25123)))

(declare-fun mapNonEmpty!27852 () Bool)

(declare-fun mapRes!27852 () Bool)

(declare-fun tp!53423 () Bool)

(declare-fun e!488889 () Bool)

(assert (=> mapNonEmpty!27852 (= mapRes!27852 (and tp!53423 e!488889))))

(declare-datatypes ((V!28369 0))(
  ( (V!28370 (val!8793 Int)) )
))
(declare-datatypes ((ValueCell!8306 0))(
  ( (ValueCellFull!8306 (v!11233 V!28369)) (EmptyCell!8306) )
))
(declare-fun mapRest!27852 () (Array (_ BitVec 32) ValueCell!8306))

(declare-fun mapValue!27852 () ValueCell!8306)

(declare-fun mapKey!27852 () (_ BitVec 32))

(declare-datatypes ((array!51108 0))(
  ( (array!51109 (arr!24580 (Array (_ BitVec 32) ValueCell!8306)) (size!25020 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51108)

(assert (=> mapNonEmpty!27852 (= (arr!24580 _values!688) (store mapRest!27852 mapKey!27852 mapValue!27852))))

(declare-fun b!878411 () Bool)

(declare-fun res!596764 () Bool)

(declare-fun e!488888 () Bool)

(assert (=> b!878411 (=> (not res!596764) (not e!488888))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878411 (= res!596764 (validMask!0 mask!1196))))

(declare-fun b!878412 () Bool)

(declare-fun res!596763 () Bool)

(assert (=> b!878412 (=> (not res!596763) (not e!488888))))

(declare-datatypes ((array!51110 0))(
  ( (array!51111 (arr!24581 (Array (_ BitVec 32) (_ BitVec 64))) (size!25021 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51110)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51110 (_ BitVec 32)) Bool)

(assert (=> b!878412 (= res!596763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878414 () Bool)

(declare-fun e!488890 () Bool)

(declare-fun e!488886 () Bool)

(assert (=> b!878414 (= e!488890 (and e!488886 mapRes!27852))))

(declare-fun condMapEmpty!27852 () Bool)

(declare-fun mapDefault!27852 () ValueCell!8306)

