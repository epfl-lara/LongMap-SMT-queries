; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78022 () Bool)

(assert start!78022)

(declare-fun b_free!16549 () Bool)

(declare-fun b_next!16549 () Bool)

(assert (=> start!78022 (= b_free!16549 (not b_next!16549))))

(declare-fun tp!57917 () Bool)

(declare-fun b_and!27121 () Bool)

(assert (=> start!78022 (= tp!57917 b_and!27121)))

(declare-fun b!910780 () Bool)

(declare-fun res!614556 () Bool)

(declare-fun e!510704 () Bool)

(assert (=> b!910780 (=> (not res!614556) (not e!510704))))

(declare-datatypes ((array!53946 0))(
  ( (array!53947 (arr!25929 (Array (_ BitVec 32) (_ BitVec 64))) (size!26388 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53946)

(declare-datatypes ((List!18213 0))(
  ( (Nil!18210) (Cons!18209 (h!19355 (_ BitVec 64)) (t!25798 List!18213)) )
))
(declare-fun arrayNoDuplicates!0 (array!53946 (_ BitVec 32) List!18213) Bool)

(assert (=> b!910780 (= res!614556 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18210))))

(declare-fun b!910781 () Bool)

(declare-fun res!614559 () Bool)

(assert (=> b!910781 (=> (not res!614559) (not e!510704))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53946 (_ BitVec 32)) Bool)

(assert (=> b!910781 (= res!614559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910782 () Bool)

(declare-fun res!614557 () Bool)

(assert (=> b!910782 (=> (not res!614557) (not e!510704))))

(declare-datatypes ((V!30255 0))(
  ( (V!30256 (val!9534 Int)) )
))
(declare-datatypes ((ValueCell!9002 0))(
  ( (ValueCellFull!9002 (v!12043 V!30255)) (EmptyCell!9002) )
))
(declare-datatypes ((array!53948 0))(
  ( (array!53949 (arr!25930 (Array (_ BitVec 32) ValueCell!9002)) (size!26389 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53948)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910782 (= res!614557 (and (= (size!26389 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26388 _keys!1386) (size!26389 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910783 () Bool)

(assert (=> b!910783 (= e!510704 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30255)

(declare-fun lt!410306 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30255)

(declare-datatypes ((tuple2!12422 0))(
  ( (tuple2!12423 (_1!6222 (_ BitVec 64)) (_2!6222 V!30255)) )
))
(declare-datatypes ((List!18214 0))(
  ( (Nil!18211) (Cons!18210 (h!19356 tuple2!12422) (t!25799 List!18214)) )
))
(declare-datatypes ((ListLongMap!11119 0))(
  ( (ListLongMap!11120 (toList!5575 List!18214)) )
))
(declare-fun contains!4619 (ListLongMap!11119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2837 (array!53946 array!53948 (_ BitVec 32) (_ BitVec 32) V!30255 V!30255 (_ BitVec 32) Int) ListLongMap!11119)

(assert (=> b!910783 (= lt!410306 (contains!4619 (getCurrentListMap!2837 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910779 () Bool)

(declare-fun e!510701 () Bool)

(declare-fun tp_is_empty!18967 () Bool)

(assert (=> b!910779 (= e!510701 tp_is_empty!18967)))

(declare-fun res!614558 () Bool)

(assert (=> start!78022 (=> (not res!614558) (not e!510704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78022 (= res!614558 (validMask!0 mask!1756))))

(assert (=> start!78022 e!510704))

(declare-fun e!510705 () Bool)

(declare-fun array_inv!20272 (array!53948) Bool)

(assert (=> start!78022 (and (array_inv!20272 _values!1152) e!510705)))

(assert (=> start!78022 tp!57917))

(assert (=> start!78022 true))

(assert (=> start!78022 tp_is_empty!18967))

(declare-fun array_inv!20273 (array!53946) Bool)

(assert (=> start!78022 (array_inv!20273 _keys!1386)))

(declare-fun mapNonEmpty!30172 () Bool)

(declare-fun mapRes!30172 () Bool)

(declare-fun tp!57918 () Bool)

(assert (=> mapNonEmpty!30172 (= mapRes!30172 (and tp!57918 e!510701))))

(declare-fun mapKey!30172 () (_ BitVec 32))

(declare-fun mapRest!30172 () (Array (_ BitVec 32) ValueCell!9002))

(declare-fun mapValue!30172 () ValueCell!9002)

(assert (=> mapNonEmpty!30172 (= (arr!25930 _values!1152) (store mapRest!30172 mapKey!30172 mapValue!30172))))

(declare-fun b!910784 () Bool)

(declare-fun e!510703 () Bool)

(assert (=> b!910784 (= e!510703 tp_is_empty!18967)))

(declare-fun b!910785 () Bool)

(assert (=> b!910785 (= e!510705 (and e!510703 mapRes!30172))))

(declare-fun condMapEmpty!30172 () Bool)

(declare-fun mapDefault!30172 () ValueCell!9002)

