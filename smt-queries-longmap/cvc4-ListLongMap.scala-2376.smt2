; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37722 () Bool)

(assert start!37722)

(declare-fun b_free!8825 () Bool)

(declare-fun b_next!8825 () Bool)

(assert (=> start!37722 (= b_free!8825 (not b_next!8825))))

(declare-fun tp!31227 () Bool)

(declare-fun b_and!16067 () Bool)

(assert (=> start!37722 (= tp!31227 b_and!16067)))

(declare-fun res!220882 () Bool)

(declare-fun e!234592 () Bool)

(assert (=> start!37722 (=> (not res!220882) (not e!234592))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37722 (= res!220882 (validMask!0 mask!970))))

(assert (=> start!37722 e!234592))

(declare-datatypes ((V!13767 0))(
  ( (V!13768 (val!4793 Int)) )
))
(declare-datatypes ((ValueCell!4405 0))(
  ( (ValueCellFull!4405 (v!6990 V!13767)) (EmptyCell!4405) )
))
(declare-datatypes ((array!22889 0))(
  ( (array!22890 (arr!10913 (Array (_ BitVec 32) ValueCell!4405)) (size!11265 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22889)

(declare-fun e!234594 () Bool)

(declare-fun array_inv!8028 (array!22889) Bool)

(assert (=> start!37722 (and (array_inv!8028 _values!506) e!234594)))

(assert (=> start!37722 tp!31227))

(assert (=> start!37722 true))

(declare-fun tp_is_empty!9497 () Bool)

(assert (=> start!37722 tp_is_empty!9497))

(declare-datatypes ((array!22891 0))(
  ( (array!22892 (arr!10914 (Array (_ BitVec 32) (_ BitVec 64))) (size!11266 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22891)

(declare-fun array_inv!8029 (array!22891) Bool)

(assert (=> start!37722 (array_inv!8029 _keys!658)))

(declare-fun b!386792 () Bool)

(declare-fun res!220886 () Bool)

(assert (=> b!386792 (=> (not res!220886) (not e!234592))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386792 (= res!220886 (or (= (select (arr!10914 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10914 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386793 () Bool)

(declare-fun res!220884 () Bool)

(assert (=> b!386793 (=> (not res!220884) (not e!234592))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386793 (= res!220884 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!386794 () Bool)

(declare-fun res!220877 () Bool)

(declare-fun e!234595 () Bool)

(assert (=> b!386794 (=> (not res!220877) (not e!234595))))

(declare-fun lt!181890 () array!22891)

(declare-datatypes ((List!6293 0))(
  ( (Nil!6290) (Cons!6289 (h!7145 (_ BitVec 64)) (t!11443 List!6293)) )
))
(declare-fun arrayNoDuplicates!0 (array!22891 (_ BitVec 32) List!6293) Bool)

(assert (=> b!386794 (= res!220877 (arrayNoDuplicates!0 lt!181890 #b00000000000000000000000000000000 Nil!6290))))

(declare-fun mapIsEmpty!15810 () Bool)

(declare-fun mapRes!15810 () Bool)

(assert (=> mapIsEmpty!15810 mapRes!15810))

(declare-fun b!386795 () Bool)

(declare-fun res!220879 () Bool)

(assert (=> b!386795 (=> (not res!220879) (not e!234592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22891 (_ BitVec 32)) Bool)

(assert (=> b!386795 (= res!220879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386796 () Bool)

(declare-fun e!234593 () Bool)

(assert (=> b!386796 (= e!234593 tp_is_empty!9497)))

(declare-fun b!386797 () Bool)

(assert (=> b!386797 (= e!234595 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13767)

(declare-fun zeroValue!472 () V!13767)

(declare-datatypes ((tuple2!6444 0))(
  ( (tuple2!6445 (_1!3233 (_ BitVec 64)) (_2!3233 V!13767)) )
))
(declare-datatypes ((List!6294 0))(
  ( (Nil!6291) (Cons!6290 (h!7146 tuple2!6444) (t!11444 List!6294)) )
))
(declare-datatypes ((ListLongMap!5357 0))(
  ( (ListLongMap!5358 (toList!2694 List!6294)) )
))
(declare-fun lt!181888 () ListLongMap!5357)

(declare-fun minValue!472 () V!13767)

(declare-fun getCurrentListMapNoExtraKeys!923 (array!22891 array!22889 (_ BitVec 32) (_ BitVec 32) V!13767 V!13767 (_ BitVec 32) Int) ListLongMap!5357)

(assert (=> b!386797 (= lt!181888 (getCurrentListMapNoExtraKeys!923 lt!181890 (array!22890 (store (arr!10913 _values!506) i!548 (ValueCellFull!4405 v!373)) (size!11265 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181889 () ListLongMap!5357)

(assert (=> b!386797 (= lt!181889 (getCurrentListMapNoExtraKeys!923 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15810 () Bool)

(declare-fun tp!31226 () Bool)

(declare-fun e!234591 () Bool)

(assert (=> mapNonEmpty!15810 (= mapRes!15810 (and tp!31226 e!234591))))

(declare-fun mapValue!15810 () ValueCell!4405)

(declare-fun mapKey!15810 () (_ BitVec 32))

(declare-fun mapRest!15810 () (Array (_ BitVec 32) ValueCell!4405))

(assert (=> mapNonEmpty!15810 (= (arr!10913 _values!506) (store mapRest!15810 mapKey!15810 mapValue!15810))))

(declare-fun b!386798 () Bool)

(assert (=> b!386798 (= e!234591 tp_is_empty!9497)))

(declare-fun b!386799 () Bool)

(declare-fun res!220883 () Bool)

(assert (=> b!386799 (=> (not res!220883) (not e!234592))))

(assert (=> b!386799 (= res!220883 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11266 _keys!658))))))

(declare-fun b!386800 () Bool)

(assert (=> b!386800 (= e!234592 e!234595)))

(declare-fun res!220881 () Bool)

(assert (=> b!386800 (=> (not res!220881) (not e!234595))))

(assert (=> b!386800 (= res!220881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181890 mask!970))))

(assert (=> b!386800 (= lt!181890 (array!22892 (store (arr!10914 _keys!658) i!548 k!778) (size!11266 _keys!658)))))

(declare-fun b!386801 () Bool)

(declare-fun res!220885 () Bool)

(assert (=> b!386801 (=> (not res!220885) (not e!234592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386801 (= res!220885 (validKeyInArray!0 k!778))))

(declare-fun b!386802 () Bool)

(assert (=> b!386802 (= e!234594 (and e!234593 mapRes!15810))))

(declare-fun condMapEmpty!15810 () Bool)

(declare-fun mapDefault!15810 () ValueCell!4405)

