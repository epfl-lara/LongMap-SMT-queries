; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74296 () Bool)

(assert start!74296)

(declare-fun b_free!15059 () Bool)

(declare-fun b_next!15059 () Bool)

(assert (=> start!74296 (= b_free!15059 (not b_next!15059))))

(declare-fun tp!52852 () Bool)

(declare-fun b_and!24835 () Bool)

(assert (=> start!74296 (= tp!52852 b_and!24835)))

(declare-fun mapNonEmpty!27563 () Bool)

(declare-fun mapRes!27563 () Bool)

(declare-fun tp!52851 () Bool)

(declare-fun e!486738 () Bool)

(assert (=> mapNonEmpty!27563 (= mapRes!27563 (and tp!52851 e!486738))))

(declare-fun mapKey!27563 () (_ BitVec 32))

(declare-datatypes ((V!28117 0))(
  ( (V!28118 (val!8699 Int)) )
))
(declare-datatypes ((ValueCell!8212 0))(
  ( (ValueCellFull!8212 (v!11128 V!28117)) (EmptyCell!8212) )
))
(declare-fun mapRest!27563 () (Array (_ BitVec 32) ValueCell!8212))

(declare-fun mapValue!27563 () ValueCell!8212)

(declare-datatypes ((array!50734 0))(
  ( (array!50735 (arr!24395 (Array (_ BitVec 32) ValueCell!8212)) (size!24835 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50734)

(assert (=> mapNonEmpty!27563 (= (arr!24395 _values!688) (store mapRest!27563 mapKey!27563 mapValue!27563))))

(declare-fun b!874148 () Bool)

(declare-fun tp_is_empty!17303 () Bool)

(assert (=> b!874148 (= e!486738 tp_is_empty!17303)))

(declare-fun b!874149 () Bool)

(declare-fun res!594035 () Bool)

(declare-fun e!486740 () Bool)

(assert (=> b!874149 (=> (not res!594035) (not e!486740))))

(declare-datatypes ((array!50736 0))(
  ( (array!50737 (arr!24396 (Array (_ BitVec 32) (_ BitVec 64))) (size!24836 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50736)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50736 (_ BitVec 32)) Bool)

(assert (=> b!874149 (= res!594035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874150 () Bool)

(declare-fun e!486736 () Bool)

(declare-fun e!486739 () Bool)

(assert (=> b!874150 (= e!486736 (and e!486739 mapRes!27563))))

(declare-fun condMapEmpty!27563 () Bool)

(declare-fun mapDefault!27563 () ValueCell!8212)

