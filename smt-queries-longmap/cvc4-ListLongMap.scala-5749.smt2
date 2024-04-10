; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74326 () Bool)

(assert start!74326)

(declare-fun b_free!15089 () Bool)

(declare-fun b_next!15089 () Bool)

(assert (=> start!74326 (= b_free!15089 (not b_next!15089))))

(declare-fun tp!52941 () Bool)

(declare-fun b_and!24865 () Bool)

(assert (=> start!74326 (= tp!52941 b_and!24865)))

(declare-fun b!874643 () Bool)

(declare-fun res!594398 () Bool)

(declare-fun e!486962 () Bool)

(assert (=> b!874643 (=> (not res!594398) (not e!486962))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50794 0))(
  ( (array!50795 (arr!24425 (Array (_ BitVec 32) (_ BitVec 64))) (size!24865 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50794)

(assert (=> b!874643 (= res!594398 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24865 _keys!868))))))

(declare-fun b!874644 () Bool)

(declare-fun e!486961 () Bool)

(declare-fun tp_is_empty!17333 () Bool)

(assert (=> b!874644 (= e!486961 tp_is_empty!17333)))

(declare-fun b!874646 () Bool)

(declare-fun res!594401 () Bool)

(assert (=> b!874646 (=> (not res!594401) (not e!486962))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874646 (= res!594401 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!27608 () Bool)

(declare-fun mapRes!27608 () Bool)

(assert (=> mapIsEmpty!27608 mapRes!27608))

(declare-fun b!874647 () Bool)

(declare-fun res!594395 () Bool)

(assert (=> b!874647 (=> (not res!594395) (not e!486962))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874647 (= res!594395 (validMask!0 mask!1196))))

(declare-fun b!874648 () Bool)

(declare-fun e!486964 () Bool)

(assert (=> b!874648 (= e!486964 tp_is_empty!17333)))

(declare-fun mapNonEmpty!27608 () Bool)

(declare-fun tp!52942 () Bool)

(assert (=> mapNonEmpty!27608 (= mapRes!27608 (and tp!52942 e!486961))))

(declare-datatypes ((V!28157 0))(
  ( (V!28158 (val!8714 Int)) )
))
(declare-datatypes ((ValueCell!8227 0))(
  ( (ValueCellFull!8227 (v!11143 V!28157)) (EmptyCell!8227) )
))
(declare-fun mapRest!27608 () (Array (_ BitVec 32) ValueCell!8227))

(declare-fun mapKey!27608 () (_ BitVec 32))

(declare-fun mapValue!27608 () ValueCell!8227)

(declare-datatypes ((array!50796 0))(
  ( (array!50797 (arr!24426 (Array (_ BitVec 32) ValueCell!8227)) (size!24866 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50796)

(assert (=> mapNonEmpty!27608 (= (arr!24426 _values!688) (store mapRest!27608 mapKey!27608 mapValue!27608))))

(declare-fun b!874649 () Bool)

(declare-fun res!594399 () Bool)

(assert (=> b!874649 (=> (not res!594399) (not e!486962))))

(declare-datatypes ((List!17338 0))(
  ( (Nil!17335) (Cons!17334 (h!18465 (_ BitVec 64)) (t!24379 List!17338)) )
))
(declare-fun arrayNoDuplicates!0 (array!50794 (_ BitVec 32) List!17338) Bool)

(assert (=> b!874649 (= res!594399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17335))))

(declare-fun b!874650 () Bool)

(declare-fun e!486963 () Bool)

(assert (=> b!874650 (= e!486963 (and e!486964 mapRes!27608))))

(declare-fun condMapEmpty!27608 () Bool)

(declare-fun mapDefault!27608 () ValueCell!8227)

