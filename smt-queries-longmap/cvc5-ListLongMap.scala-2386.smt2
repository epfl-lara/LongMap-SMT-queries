; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37778 () Bool)

(assert start!37778)

(declare-fun b_free!8881 () Bool)

(declare-fun b_next!8881 () Bool)

(assert (=> start!37778 (= b_free!8881 (not b_next!8881))))

(declare-fun tp!31394 () Bool)

(declare-fun b_and!16123 () Bool)

(assert (=> start!37778 (= tp!31394 b_and!16123)))

(declare-fun b!387884 () Bool)

(declare-fun res!221721 () Bool)

(declare-fun e!235097 () Bool)

(assert (=> b!387884 (=> (not res!221721) (not e!235097))))

(declare-datatypes ((array!22997 0))(
  ( (array!22998 (arr!10967 (Array (_ BitVec 32) (_ BitVec 64))) (size!11319 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22997)

(declare-datatypes ((List!6332 0))(
  ( (Nil!6329) (Cons!6328 (h!7184 (_ BitVec 64)) (t!11482 List!6332)) )
))
(declare-fun arrayNoDuplicates!0 (array!22997 (_ BitVec 32) List!6332) Bool)

(assert (=> b!387884 (= res!221721 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6329))))

(declare-fun b!387885 () Bool)

(declare-fun res!221720 () Bool)

(assert (=> b!387885 (=> (not res!221720) (not e!235097))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387885 (= res!221720 (or (= (select (arr!10967 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10967 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387886 () Bool)

(declare-fun e!235098 () Bool)

(assert (=> b!387886 (= e!235098 false)))

(declare-datatypes ((V!13843 0))(
  ( (V!13844 (val!4821 Int)) )
))
(declare-datatypes ((ValueCell!4433 0))(
  ( (ValueCellFull!4433 (v!7018 V!13843)) (EmptyCell!4433) )
))
(declare-datatypes ((array!22999 0))(
  ( (array!23000 (arr!10968 (Array (_ BitVec 32) ValueCell!4433)) (size!11320 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22999)

(declare-fun lt!182140 () array!22997)

(declare-datatypes ((tuple2!6480 0))(
  ( (tuple2!6481 (_1!3251 (_ BitVec 64)) (_2!3251 V!13843)) )
))
(declare-datatypes ((List!6333 0))(
  ( (Nil!6330) (Cons!6329 (h!7185 tuple2!6480) (t!11483 List!6333)) )
))
(declare-datatypes ((ListLongMap!5393 0))(
  ( (ListLongMap!5394 (toList!2712 List!6333)) )
))
(declare-fun lt!182142 () ListLongMap!5393)

(declare-fun zeroValue!472 () V!13843)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13843)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13843)

(declare-fun getCurrentListMapNoExtraKeys!941 (array!22997 array!22999 (_ BitVec 32) (_ BitVec 32) V!13843 V!13843 (_ BitVec 32) Int) ListLongMap!5393)

(assert (=> b!387886 (= lt!182142 (getCurrentListMapNoExtraKeys!941 lt!182140 (array!23000 (store (arr!10968 _values!506) i!548 (ValueCellFull!4433 v!373)) (size!11320 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182141 () ListLongMap!5393)

(assert (=> b!387886 (= lt!182141 (getCurrentListMapNoExtraKeys!941 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15894 () Bool)

(declare-fun mapRes!15894 () Bool)

(assert (=> mapIsEmpty!15894 mapRes!15894))

(declare-fun res!221718 () Bool)

(assert (=> start!37778 (=> (not res!221718) (not e!235097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37778 (= res!221718 (validMask!0 mask!970))))

(assert (=> start!37778 e!235097))

(declare-fun e!235100 () Bool)

(declare-fun array_inv!8064 (array!22999) Bool)

(assert (=> start!37778 (and (array_inv!8064 _values!506) e!235100)))

(assert (=> start!37778 tp!31394))

(assert (=> start!37778 true))

(declare-fun tp_is_empty!9553 () Bool)

(assert (=> start!37778 tp_is_empty!9553))

(declare-fun array_inv!8065 (array!22997) Bool)

(assert (=> start!37778 (array_inv!8065 _keys!658)))

(declare-fun b!387887 () Bool)

(declare-fun res!221722 () Bool)

(assert (=> b!387887 (=> (not res!221722) (not e!235097))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387887 (= res!221722 (validKeyInArray!0 k!778))))

(declare-fun b!387888 () Bool)

(declare-fun res!221717 () Bool)

(assert (=> b!387888 (=> (not res!221717) (not e!235097))))

(declare-fun arrayContainsKey!0 (array!22997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387888 (= res!221717 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!387889 () Bool)

(declare-fun res!221723 () Bool)

(assert (=> b!387889 (=> (not res!221723) (not e!235097))))

(assert (=> b!387889 (= res!221723 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11319 _keys!658))))))

(declare-fun b!387890 () Bool)

(declare-fun e!235095 () Bool)

(assert (=> b!387890 (= e!235095 tp_is_empty!9553)))

(declare-fun b!387891 () Bool)

(declare-fun res!221719 () Bool)

(assert (=> b!387891 (=> (not res!221719) (not e!235097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22997 (_ BitVec 32)) Bool)

(assert (=> b!387891 (= res!221719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387892 () Bool)

(declare-fun e!235099 () Bool)

(assert (=> b!387892 (= e!235099 tp_is_empty!9553)))

(declare-fun b!387893 () Bool)

(declare-fun res!221726 () Bool)

(assert (=> b!387893 (=> (not res!221726) (not e!235097))))

(assert (=> b!387893 (= res!221726 (and (= (size!11320 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11319 _keys!658) (size!11320 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387894 () Bool)

(assert (=> b!387894 (= e!235097 e!235098)))

(declare-fun res!221725 () Bool)

(assert (=> b!387894 (=> (not res!221725) (not e!235098))))

(assert (=> b!387894 (= res!221725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182140 mask!970))))

(assert (=> b!387894 (= lt!182140 (array!22998 (store (arr!10967 _keys!658) i!548 k!778) (size!11319 _keys!658)))))

(declare-fun b!387895 () Bool)

(declare-fun res!221724 () Bool)

(assert (=> b!387895 (=> (not res!221724) (not e!235098))))

(assert (=> b!387895 (= res!221724 (arrayNoDuplicates!0 lt!182140 #b00000000000000000000000000000000 Nil!6329))))

(declare-fun mapNonEmpty!15894 () Bool)

(declare-fun tp!31395 () Bool)

(assert (=> mapNonEmpty!15894 (= mapRes!15894 (and tp!31395 e!235095))))

(declare-fun mapRest!15894 () (Array (_ BitVec 32) ValueCell!4433))

(declare-fun mapValue!15894 () ValueCell!4433)

(declare-fun mapKey!15894 () (_ BitVec 32))

(assert (=> mapNonEmpty!15894 (= (arr!10968 _values!506) (store mapRest!15894 mapKey!15894 mapValue!15894))))

(declare-fun b!387896 () Bool)

(assert (=> b!387896 (= e!235100 (and e!235099 mapRes!15894))))

(declare-fun condMapEmpty!15894 () Bool)

(declare-fun mapDefault!15894 () ValueCell!4433)

