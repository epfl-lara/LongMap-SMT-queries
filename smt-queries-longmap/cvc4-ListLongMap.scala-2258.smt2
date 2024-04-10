; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37014 () Bool)

(assert start!37014)

(declare-fun b_free!8141 () Bool)

(declare-fun b_next!8141 () Bool)

(assert (=> start!37014 (= b_free!8141 (not b_next!8141))))

(declare-fun tp!29138 () Bool)

(declare-fun b_and!15383 () Bool)

(assert (=> start!37014 (= tp!29138 b_and!15383)))

(declare-fun b!371789 () Bool)

(declare-fun res!209060 () Bool)

(declare-fun e!226878 () Bool)

(assert (=> b!371789 (=> (not res!209060) (not e!226878))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371789 (= res!209060 (validKeyInArray!0 k!778))))

(declare-fun b!371790 () Bool)

(declare-fun e!226880 () Bool)

(assert (=> b!371790 (= e!226880 (not true))))

(declare-datatypes ((V!12823 0))(
  ( (V!12824 (val!4439 Int)) )
))
(declare-datatypes ((tuple2!5890 0))(
  ( (tuple2!5891 (_1!2956 (_ BitVec 64)) (_2!2956 V!12823)) )
))
(declare-datatypes ((List!5731 0))(
  ( (Nil!5728) (Cons!5727 (h!6583 tuple2!5890) (t!10881 List!5731)) )
))
(declare-datatypes ((ListLongMap!4803 0))(
  ( (ListLongMap!4804 (toList!2417 List!5731)) )
))
(declare-fun lt!170420 () ListLongMap!4803)

(declare-fun lt!170424 () ListLongMap!4803)

(assert (=> b!371790 (and (= lt!170420 lt!170424) (= lt!170424 lt!170420))))

(declare-fun v!373 () V!12823)

(declare-fun lt!170423 () ListLongMap!4803)

(declare-fun +!763 (ListLongMap!4803 tuple2!5890) ListLongMap!4803)

(assert (=> b!371790 (= lt!170424 (+!763 lt!170423 (tuple2!5891 k!778 v!373)))))

(declare-datatypes ((ValueCell!4051 0))(
  ( (ValueCellFull!4051 (v!6636 V!12823)) (EmptyCell!4051) )
))
(declare-datatypes ((array!21519 0))(
  ( (array!21520 (arr!10228 (Array (_ BitVec 32) ValueCell!4051)) (size!10580 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21519)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11432 0))(
  ( (Unit!11433) )
))
(declare-fun lt!170421 () Unit!11432)

(declare-fun zeroValue!472 () V!12823)

(declare-datatypes ((array!21521 0))(
  ( (array!21522 (arr!10229 (Array (_ BitVec 32) (_ BitVec 64))) (size!10581 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21521)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12823)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 (array!21521 array!21519 (_ BitVec 32) (_ BitVec 32) V!12823 V!12823 (_ BitVec 32) (_ BitVec 64) V!12823 (_ BitVec 32) Int) Unit!11432)

(assert (=> b!371790 (= lt!170421 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!18 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170422 () array!21521)

(declare-fun getCurrentListMapNoExtraKeys!694 (array!21521 array!21519 (_ BitVec 32) (_ BitVec 32) V!12823 V!12823 (_ BitVec 32) Int) ListLongMap!4803)

(assert (=> b!371790 (= lt!170420 (getCurrentListMapNoExtraKeys!694 lt!170422 (array!21520 (store (arr!10228 _values!506) i!548 (ValueCellFull!4051 v!373)) (size!10580 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371790 (= lt!170423 (getCurrentListMapNoExtraKeys!694 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371791 () Bool)

(declare-fun e!226881 () Bool)

(declare-fun tp_is_empty!8789 () Bool)

(assert (=> b!371791 (= e!226881 tp_is_empty!8789)))

(declare-fun b!371792 () Bool)

(declare-fun res!209061 () Bool)

(assert (=> b!371792 (=> (not res!209061) (not e!226878))))

(declare-datatypes ((List!5732 0))(
  ( (Nil!5729) (Cons!5728 (h!6584 (_ BitVec 64)) (t!10882 List!5732)) )
))
(declare-fun arrayNoDuplicates!0 (array!21521 (_ BitVec 32) List!5732) Bool)

(assert (=> b!371792 (= res!209061 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5729))))

(declare-fun b!371793 () Bool)

(declare-fun res!209063 () Bool)

(assert (=> b!371793 (=> (not res!209063) (not e!226878))))

(assert (=> b!371793 (= res!209063 (and (= (size!10580 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10581 _keys!658) (size!10580 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14748 () Bool)

(declare-fun mapRes!14748 () Bool)

(declare-fun tp!29139 () Bool)

(declare-fun e!226879 () Bool)

(assert (=> mapNonEmpty!14748 (= mapRes!14748 (and tp!29139 e!226879))))

(declare-fun mapValue!14748 () ValueCell!4051)

(declare-fun mapKey!14748 () (_ BitVec 32))

(declare-fun mapRest!14748 () (Array (_ BitVec 32) ValueCell!4051))

(assert (=> mapNonEmpty!14748 (= (arr!10228 _values!506) (store mapRest!14748 mapKey!14748 mapValue!14748))))

(declare-fun b!371795 () Bool)

(declare-fun e!226882 () Bool)

(assert (=> b!371795 (= e!226882 (and e!226881 mapRes!14748))))

(declare-fun condMapEmpty!14748 () Bool)

(declare-fun mapDefault!14748 () ValueCell!4051)

