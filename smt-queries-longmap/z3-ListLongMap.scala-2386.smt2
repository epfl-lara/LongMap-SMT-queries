; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37780 () Bool)

(assert start!37780)

(declare-fun b_free!8883 () Bool)

(declare-fun b_next!8883 () Bool)

(assert (=> start!37780 (= b_free!8883 (not b_next!8883))))

(declare-fun tp!31400 () Bool)

(declare-fun b_and!16125 () Bool)

(assert (=> start!37780 (= tp!31400 b_and!16125)))

(declare-fun b!387923 () Bool)

(declare-fun res!221747 () Bool)

(declare-fun e!235117 () Bool)

(assert (=> b!387923 (=> (not res!221747) (not e!235117))))

(declare-datatypes ((array!23001 0))(
  ( (array!23002 (arr!10969 (Array (_ BitVec 32) (_ BitVec 64))) (size!11321 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23001)

(declare-datatypes ((List!6334 0))(
  ( (Nil!6331) (Cons!6330 (h!7186 (_ BitVec 64)) (t!11484 List!6334)) )
))
(declare-fun arrayNoDuplicates!0 (array!23001 (_ BitVec 32) List!6334) Bool)

(assert (=> b!387923 (= res!221747 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6331))))

(declare-fun b!387924 () Bool)

(declare-fun e!235116 () Bool)

(declare-fun tp_is_empty!9555 () Bool)

(assert (=> b!387924 (= e!235116 tp_is_empty!9555)))

(declare-fun b!387925 () Bool)

(declare-fun res!221754 () Bool)

(assert (=> b!387925 (=> (not res!221754) (not e!235117))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13845 0))(
  ( (V!13846 (val!4822 Int)) )
))
(declare-datatypes ((ValueCell!4434 0))(
  ( (ValueCellFull!4434 (v!7019 V!13845)) (EmptyCell!4434) )
))
(declare-datatypes ((array!23003 0))(
  ( (array!23004 (arr!10970 (Array (_ BitVec 32) ValueCell!4434)) (size!11322 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23003)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387925 (= res!221754 (and (= (size!11322 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11321 _keys!658) (size!11322 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387926 () Bool)

(declare-fun e!235113 () Bool)

(assert (=> b!387926 (= e!235113 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!182149 () array!23001)

(declare-datatypes ((tuple2!6482 0))(
  ( (tuple2!6483 (_1!3252 (_ BitVec 64)) (_2!3252 V!13845)) )
))
(declare-datatypes ((List!6335 0))(
  ( (Nil!6332) (Cons!6331 (h!7187 tuple2!6482) (t!11485 List!6335)) )
))
(declare-datatypes ((ListLongMap!5395 0))(
  ( (ListLongMap!5396 (toList!2713 List!6335)) )
))
(declare-fun lt!182151 () ListLongMap!5395)

(declare-fun zeroValue!472 () V!13845)

(declare-fun v!373 () V!13845)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13845)

(declare-fun getCurrentListMapNoExtraKeys!942 (array!23001 array!23003 (_ BitVec 32) (_ BitVec 32) V!13845 V!13845 (_ BitVec 32) Int) ListLongMap!5395)

(assert (=> b!387926 (= lt!182151 (getCurrentListMapNoExtraKeys!942 lt!182149 (array!23004 (store (arr!10970 _values!506) i!548 (ValueCellFull!4434 v!373)) (size!11322 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182150 () ListLongMap!5395)

(assert (=> b!387926 (= lt!182150 (getCurrentListMapNoExtraKeys!942 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387927 () Bool)

(declare-fun res!221756 () Bool)

(assert (=> b!387927 (=> (not res!221756) (not e!235117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23001 (_ BitVec 32)) Bool)

(assert (=> b!387927 (= res!221756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387928 () Bool)

(declare-fun res!221753 () Bool)

(assert (=> b!387928 (=> (not res!221753) (not e!235117))))

(assert (=> b!387928 (= res!221753 (or (= (select (arr!10969 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10969 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387929 () Bool)

(declare-fun e!235114 () Bool)

(declare-fun mapRes!15897 () Bool)

(assert (=> b!387929 (= e!235114 (and e!235116 mapRes!15897))))

(declare-fun condMapEmpty!15897 () Bool)

(declare-fun mapDefault!15897 () ValueCell!4434)

(assert (=> b!387929 (= condMapEmpty!15897 (= (arr!10970 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4434)) mapDefault!15897)))))

(declare-fun b!387930 () Bool)

(declare-fun res!221749 () Bool)

(assert (=> b!387930 (=> (not res!221749) (not e!235117))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387930 (= res!221749 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15897 () Bool)

(declare-fun tp!31401 () Bool)

(declare-fun e!235118 () Bool)

(assert (=> mapNonEmpty!15897 (= mapRes!15897 (and tp!31401 e!235118))))

(declare-fun mapKey!15897 () (_ BitVec 32))

(declare-fun mapRest!15897 () (Array (_ BitVec 32) ValueCell!4434))

(declare-fun mapValue!15897 () ValueCell!4434)

(assert (=> mapNonEmpty!15897 (= (arr!10970 _values!506) (store mapRest!15897 mapKey!15897 mapValue!15897))))

(declare-fun b!387931 () Bool)

(assert (=> b!387931 (= e!235118 tp_is_empty!9555)))

(declare-fun res!221751 () Bool)

(assert (=> start!37780 (=> (not res!221751) (not e!235117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37780 (= res!221751 (validMask!0 mask!970))))

(assert (=> start!37780 e!235117))

(declare-fun array_inv!8066 (array!23003) Bool)

(assert (=> start!37780 (and (array_inv!8066 _values!506) e!235114)))

(assert (=> start!37780 tp!31400))

(assert (=> start!37780 true))

(assert (=> start!37780 tp_is_empty!9555))

(declare-fun array_inv!8067 (array!23001) Bool)

(assert (=> start!37780 (array_inv!8067 _keys!658)))

(declare-fun mapIsEmpty!15897 () Bool)

(assert (=> mapIsEmpty!15897 mapRes!15897))

(declare-fun b!387932 () Bool)

(assert (=> b!387932 (= e!235117 e!235113)))

(declare-fun res!221748 () Bool)

(assert (=> b!387932 (=> (not res!221748) (not e!235113))))

(assert (=> b!387932 (= res!221748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182149 mask!970))))

(assert (=> b!387932 (= lt!182149 (array!23002 (store (arr!10969 _keys!658) i!548 k0!778) (size!11321 _keys!658)))))

(declare-fun b!387933 () Bool)

(declare-fun res!221750 () Bool)

(assert (=> b!387933 (=> (not res!221750) (not e!235117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387933 (= res!221750 (validKeyInArray!0 k0!778))))

(declare-fun b!387934 () Bool)

(declare-fun res!221752 () Bool)

(assert (=> b!387934 (=> (not res!221752) (not e!235117))))

(assert (=> b!387934 (= res!221752 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11321 _keys!658))))))

(declare-fun b!387935 () Bool)

(declare-fun res!221755 () Bool)

(assert (=> b!387935 (=> (not res!221755) (not e!235113))))

(assert (=> b!387935 (= res!221755 (arrayNoDuplicates!0 lt!182149 #b00000000000000000000000000000000 Nil!6331))))

(assert (= (and start!37780 res!221751) b!387925))

(assert (= (and b!387925 res!221754) b!387927))

(assert (= (and b!387927 res!221756) b!387923))

(assert (= (and b!387923 res!221747) b!387934))

(assert (= (and b!387934 res!221752) b!387933))

(assert (= (and b!387933 res!221750) b!387928))

(assert (= (and b!387928 res!221753) b!387930))

(assert (= (and b!387930 res!221749) b!387932))

(assert (= (and b!387932 res!221748) b!387935))

(assert (= (and b!387935 res!221755) b!387926))

(assert (= (and b!387929 condMapEmpty!15897) mapIsEmpty!15897))

(assert (= (and b!387929 (not condMapEmpty!15897)) mapNonEmpty!15897))

(get-info :version)

(assert (= (and mapNonEmpty!15897 ((_ is ValueCellFull!4434) mapValue!15897)) b!387931))

(assert (= (and b!387929 ((_ is ValueCellFull!4434) mapDefault!15897)) b!387924))

(assert (= start!37780 b!387929))

(declare-fun m!383925 () Bool)

(assert (=> b!387927 m!383925))

(declare-fun m!383927 () Bool)

(assert (=> b!387930 m!383927))

(declare-fun m!383929 () Bool)

(assert (=> start!37780 m!383929))

(declare-fun m!383931 () Bool)

(assert (=> start!37780 m!383931))

(declare-fun m!383933 () Bool)

(assert (=> start!37780 m!383933))

(declare-fun m!383935 () Bool)

(assert (=> b!387933 m!383935))

(declare-fun m!383937 () Bool)

(assert (=> b!387935 m!383937))

(declare-fun m!383939 () Bool)

(assert (=> mapNonEmpty!15897 m!383939))

(declare-fun m!383941 () Bool)

(assert (=> b!387923 m!383941))

(declare-fun m!383943 () Bool)

(assert (=> b!387932 m!383943))

(declare-fun m!383945 () Bool)

(assert (=> b!387932 m!383945))

(declare-fun m!383947 () Bool)

(assert (=> b!387928 m!383947))

(declare-fun m!383949 () Bool)

(assert (=> b!387926 m!383949))

(declare-fun m!383951 () Bool)

(assert (=> b!387926 m!383951))

(declare-fun m!383953 () Bool)

(assert (=> b!387926 m!383953))

(check-sat (not b!387927) (not b!387932) (not b!387926) (not start!37780) tp_is_empty!9555 (not b!387933) b_and!16125 (not b!387935) (not b!387930) (not b!387923) (not mapNonEmpty!15897) (not b_next!8883))
(check-sat b_and!16125 (not b_next!8883))
