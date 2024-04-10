; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37726 () Bool)

(assert start!37726)

(declare-fun b_free!8829 () Bool)

(declare-fun b_next!8829 () Bool)

(assert (=> start!37726 (= b_free!8829 (not b_next!8829))))

(declare-fun tp!31239 () Bool)

(declare-fun b_and!16071 () Bool)

(assert (=> start!37726 (= tp!31239 b_and!16071)))

(declare-fun b!386870 () Bool)

(declare-fun e!234627 () Bool)

(declare-fun e!234628 () Bool)

(declare-fun mapRes!15816 () Bool)

(assert (=> b!386870 (= e!234627 (and e!234628 mapRes!15816))))

(declare-fun condMapEmpty!15816 () Bool)

(declare-datatypes ((V!13773 0))(
  ( (V!13774 (val!4795 Int)) )
))
(declare-datatypes ((ValueCell!4407 0))(
  ( (ValueCellFull!4407 (v!6992 V!13773)) (EmptyCell!4407) )
))
(declare-datatypes ((array!22895 0))(
  ( (array!22896 (arr!10916 (Array (_ BitVec 32) ValueCell!4407)) (size!11268 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22895)

(declare-fun mapDefault!15816 () ValueCell!4407)

(assert (=> b!386870 (= condMapEmpty!15816 (= (arr!10916 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4407)) mapDefault!15816)))))

(declare-fun mapIsEmpty!15816 () Bool)

(assert (=> mapIsEmpty!15816 mapRes!15816))

(declare-fun b!386871 () Bool)

(declare-fun res!220945 () Bool)

(declare-fun e!234630 () Bool)

(assert (=> b!386871 (=> (not res!220945) (not e!234630))))

(declare-datatypes ((array!22897 0))(
  ( (array!22898 (arr!10917 (Array (_ BitVec 32) (_ BitVec 64))) (size!11269 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22897)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386871 (= res!220945 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386872 () Bool)

(declare-fun e!234632 () Bool)

(assert (=> b!386872 (= e!234632 false)))

(declare-datatypes ((tuple2!6446 0))(
  ( (tuple2!6447 (_1!3234 (_ BitVec 64)) (_2!3234 V!13773)) )
))
(declare-datatypes ((List!6295 0))(
  ( (Nil!6292) (Cons!6291 (h!7147 tuple2!6446) (t!11445 List!6295)) )
))
(declare-datatypes ((ListLongMap!5359 0))(
  ( (ListLongMap!5360 (toList!2695 List!6295)) )
))
(declare-fun lt!181907 () ListLongMap!5359)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13773)

(declare-fun lt!181908 () array!22897)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13773)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13773)

(declare-fun getCurrentListMapNoExtraKeys!924 (array!22897 array!22895 (_ BitVec 32) (_ BitVec 32) V!13773 V!13773 (_ BitVec 32) Int) ListLongMap!5359)

(assert (=> b!386872 (= lt!181907 (getCurrentListMapNoExtraKeys!924 lt!181908 (array!22896 (store (arr!10916 _values!506) i!548 (ValueCellFull!4407 v!373)) (size!11268 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181906 () ListLongMap!5359)

(assert (=> b!386872 (= lt!181906 (getCurrentListMapNoExtraKeys!924 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386873 () Bool)

(declare-fun res!220938 () Bool)

(assert (=> b!386873 (=> (not res!220938) (not e!234630))))

(assert (=> b!386873 (= res!220938 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11269 _keys!658))))))

(declare-fun b!386874 () Bool)

(declare-fun res!220940 () Bool)

(assert (=> b!386874 (=> (not res!220940) (not e!234630))))

(declare-datatypes ((List!6296 0))(
  ( (Nil!6293) (Cons!6292 (h!7148 (_ BitVec 64)) (t!11446 List!6296)) )
))
(declare-fun arrayNoDuplicates!0 (array!22897 (_ BitVec 32) List!6296) Bool)

(assert (=> b!386874 (= res!220940 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6293))))

(declare-fun b!386875 () Bool)

(declare-fun tp_is_empty!9501 () Bool)

(assert (=> b!386875 (= e!234628 tp_is_empty!9501)))

(declare-fun b!386876 () Bool)

(assert (=> b!386876 (= e!234630 e!234632)))

(declare-fun res!220946 () Bool)

(assert (=> b!386876 (=> (not res!220946) (not e!234632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22897 (_ BitVec 32)) Bool)

(assert (=> b!386876 (= res!220946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181908 mask!970))))

(assert (=> b!386876 (= lt!181908 (array!22898 (store (arr!10917 _keys!658) i!548 k0!778) (size!11269 _keys!658)))))

(declare-fun b!386877 () Bool)

(declare-fun e!234631 () Bool)

(assert (=> b!386877 (= e!234631 tp_is_empty!9501)))

(declare-fun b!386878 () Bool)

(declare-fun res!220937 () Bool)

(assert (=> b!386878 (=> (not res!220937) (not e!234630))))

(assert (=> b!386878 (= res!220937 (or (= (select (arr!10917 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10917 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!386879 () Bool)

(declare-fun res!220944 () Bool)

(assert (=> b!386879 (=> (not res!220944) (not e!234632))))

(assert (=> b!386879 (= res!220944 (arrayNoDuplicates!0 lt!181908 #b00000000000000000000000000000000 Nil!6293))))

(declare-fun b!386880 () Bool)

(declare-fun res!220943 () Bool)

(assert (=> b!386880 (=> (not res!220943) (not e!234630))))

(assert (=> b!386880 (= res!220943 (and (= (size!11268 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11269 _keys!658) (size!11268 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386881 () Bool)

(declare-fun res!220939 () Bool)

(assert (=> b!386881 (=> (not res!220939) (not e!234630))))

(assert (=> b!386881 (= res!220939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!386882 () Bool)

(declare-fun res!220941 () Bool)

(assert (=> b!386882 (=> (not res!220941) (not e!234630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386882 (= res!220941 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15816 () Bool)

(declare-fun tp!31238 () Bool)

(assert (=> mapNonEmpty!15816 (= mapRes!15816 (and tp!31238 e!234631))))

(declare-fun mapRest!15816 () (Array (_ BitVec 32) ValueCell!4407))

(declare-fun mapKey!15816 () (_ BitVec 32))

(declare-fun mapValue!15816 () ValueCell!4407)

(assert (=> mapNonEmpty!15816 (= (arr!10916 _values!506) (store mapRest!15816 mapKey!15816 mapValue!15816))))

(declare-fun res!220942 () Bool)

(assert (=> start!37726 (=> (not res!220942) (not e!234630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37726 (= res!220942 (validMask!0 mask!970))))

(assert (=> start!37726 e!234630))

(declare-fun array_inv!8030 (array!22895) Bool)

(assert (=> start!37726 (and (array_inv!8030 _values!506) e!234627)))

(assert (=> start!37726 tp!31239))

(assert (=> start!37726 true))

(assert (=> start!37726 tp_is_empty!9501))

(declare-fun array_inv!8031 (array!22897) Bool)

(assert (=> start!37726 (array_inv!8031 _keys!658)))

(assert (= (and start!37726 res!220942) b!386880))

(assert (= (and b!386880 res!220943) b!386881))

(assert (= (and b!386881 res!220939) b!386874))

(assert (= (and b!386874 res!220940) b!386873))

(assert (= (and b!386873 res!220938) b!386882))

(assert (= (and b!386882 res!220941) b!386878))

(assert (= (and b!386878 res!220937) b!386871))

(assert (= (and b!386871 res!220945) b!386876))

(assert (= (and b!386876 res!220946) b!386879))

(assert (= (and b!386879 res!220944) b!386872))

(assert (= (and b!386870 condMapEmpty!15816) mapIsEmpty!15816))

(assert (= (and b!386870 (not condMapEmpty!15816)) mapNonEmpty!15816))

(get-info :version)

(assert (= (and mapNonEmpty!15816 ((_ is ValueCellFull!4407) mapValue!15816)) b!386877))

(assert (= (and b!386870 ((_ is ValueCellFull!4407) mapDefault!15816)) b!386875))

(assert (= start!37726 b!386870))

(declare-fun m!383115 () Bool)

(assert (=> b!386881 m!383115))

(declare-fun m!383117 () Bool)

(assert (=> b!386871 m!383117))

(declare-fun m!383119 () Bool)

(assert (=> b!386882 m!383119))

(declare-fun m!383121 () Bool)

(assert (=> b!386878 m!383121))

(declare-fun m!383123 () Bool)

(assert (=> b!386874 m!383123))

(declare-fun m!383125 () Bool)

(assert (=> b!386879 m!383125))

(declare-fun m!383127 () Bool)

(assert (=> b!386872 m!383127))

(declare-fun m!383129 () Bool)

(assert (=> b!386872 m!383129))

(declare-fun m!383131 () Bool)

(assert (=> b!386872 m!383131))

(declare-fun m!383133 () Bool)

(assert (=> mapNonEmpty!15816 m!383133))

(declare-fun m!383135 () Bool)

(assert (=> start!37726 m!383135))

(declare-fun m!383137 () Bool)

(assert (=> start!37726 m!383137))

(declare-fun m!383139 () Bool)

(assert (=> start!37726 m!383139))

(declare-fun m!383141 () Bool)

(assert (=> b!386876 m!383141))

(declare-fun m!383143 () Bool)

(assert (=> b!386876 m!383143))

(check-sat (not b!386876) tp_is_empty!9501 (not b!386881) (not b!386874) b_and!16071 (not mapNonEmpty!15816) (not start!37726) (not b!386872) (not b_next!8829) (not b!386871) (not b!386879) (not b!386882))
(check-sat b_and!16071 (not b_next!8829))
