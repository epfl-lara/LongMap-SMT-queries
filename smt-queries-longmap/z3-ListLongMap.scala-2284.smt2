; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37152 () Bool)

(assert start!37152)

(declare-fun b_free!8293 () Bool)

(declare-fun b_next!8293 () Bool)

(assert (=> start!37152 (= b_free!8293 (not b_next!8293))))

(declare-fun tp!29594 () Bool)

(declare-fun b_and!15549 () Bool)

(assert (=> start!37152 (= tp!29594 b_and!15549)))

(declare-fun b!374978 () Bool)

(declare-fun res!211615 () Bool)

(declare-fun e!228482 () Bool)

(assert (=> b!374978 (=> (not res!211615) (not e!228482))))

(declare-datatypes ((array!21800 0))(
  ( (array!21801 (arr!10368 (Array (_ BitVec 32) (_ BitVec 64))) (size!10720 (_ BitVec 32))) )
))
(declare-fun lt!173305 () array!21800)

(declare-datatypes ((List!5752 0))(
  ( (Nil!5749) (Cons!5748 (h!6604 (_ BitVec 64)) (t!10894 List!5752)) )
))
(declare-fun arrayNoDuplicates!0 (array!21800 (_ BitVec 32) List!5752) Bool)

(assert (=> b!374978 (= res!211615 (arrayNoDuplicates!0 lt!173305 #b00000000000000000000000000000000 Nil!5749))))

(declare-fun b!374979 () Bool)

(declare-fun e!228484 () Bool)

(declare-fun tp_is_empty!8941 () Bool)

(assert (=> b!374979 (= e!228484 tp_is_empty!8941)))

(declare-fun b!374980 () Bool)

(declare-fun e!228481 () Bool)

(assert (=> b!374980 (= e!228481 e!228482)))

(declare-fun res!211612 () Bool)

(assert (=> b!374980 (=> (not res!211612) (not e!228482))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21800 (_ BitVec 32)) Bool)

(assert (=> b!374980 (= res!211612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173305 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21800)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!374980 (= lt!173305 (array!21801 (store (arr!10368 _keys!658) i!548 k0!778) (size!10720 _keys!658)))))

(declare-fun b!374982 () Bool)

(declare-fun res!211614 () Bool)

(assert (=> b!374982 (=> (not res!211614) (not e!228481))))

(assert (=> b!374982 (= res!211614 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10720 _keys!658))))))

(declare-fun b!374983 () Bool)

(declare-fun res!211616 () Bool)

(assert (=> b!374983 (=> (not res!211616) (not e!228481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!374983 (= res!211616 (validKeyInArray!0 k0!778))))

(declare-fun b!374984 () Bool)

(declare-fun e!228479 () Bool)

(declare-fun mapRes!14976 () Bool)

(assert (=> b!374984 (= e!228479 (and e!228484 mapRes!14976))))

(declare-fun condMapEmpty!14976 () Bool)

(declare-datatypes ((V!13027 0))(
  ( (V!13028 (val!4515 Int)) )
))
(declare-datatypes ((ValueCell!4127 0))(
  ( (ValueCellFull!4127 (v!6713 V!13027)) (EmptyCell!4127) )
))
(declare-datatypes ((array!21802 0))(
  ( (array!21803 (arr!10369 (Array (_ BitVec 32) ValueCell!4127)) (size!10721 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21802)

(declare-fun mapDefault!14976 () ValueCell!4127)

(assert (=> b!374984 (= condMapEmpty!14976 (= (arr!10369 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4127)) mapDefault!14976)))))

(declare-fun b!374985 () Bool)

(declare-fun e!228480 () Bool)

(assert (=> b!374985 (= e!228480 tp_is_empty!8941)))

(declare-fun b!374986 () Bool)

(declare-fun e!228485 () Bool)

(assert (=> b!374986 (= e!228482 (not e!228485))))

(declare-fun res!211617 () Bool)

(assert (=> b!374986 (=> res!211617 e!228485)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374986 (= res!211617 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13027)

(declare-datatypes ((tuple2!5908 0))(
  ( (tuple2!5909 (_1!2965 (_ BitVec 64)) (_2!2965 V!13027)) )
))
(declare-datatypes ((List!5753 0))(
  ( (Nil!5750) (Cons!5749 (h!6605 tuple2!5908) (t!10895 List!5753)) )
))
(declare-datatypes ((ListLongMap!4823 0))(
  ( (ListLongMap!4824 (toList!2427 List!5753)) )
))
(declare-fun lt!173310 () ListLongMap!4823)

(declare-fun minValue!472 () V!13027)

(declare-fun getCurrentListMap!1884 (array!21800 array!21802 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!374986 (= lt!173310 (getCurrentListMap!1884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173311 () ListLongMap!4823)

(declare-fun lt!173309 () array!21802)

(assert (=> b!374986 (= lt!173311 (getCurrentListMap!1884 lt!173305 lt!173309 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173297 () ListLongMap!4823)

(declare-fun lt!173304 () ListLongMap!4823)

(assert (=> b!374986 (and (= lt!173297 lt!173304) (= lt!173304 lt!173297))))

(declare-fun lt!173306 () ListLongMap!4823)

(declare-fun lt!173302 () tuple2!5908)

(declare-fun +!823 (ListLongMap!4823 tuple2!5908) ListLongMap!4823)

(assert (=> b!374986 (= lt!173304 (+!823 lt!173306 lt!173302))))

(declare-fun v!373 () V!13027)

(assert (=> b!374986 (= lt!173302 (tuple2!5909 k0!778 v!373))))

(declare-datatypes ((Unit!11535 0))(
  ( (Unit!11536) )
))
(declare-fun lt!173295 () Unit!11535)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 (array!21800 array!21802 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) (_ BitVec 64) V!13027 (_ BitVec 32) Int) Unit!11535)

(assert (=> b!374986 (= lt!173295 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!71 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!731 (array!21800 array!21802 (_ BitVec 32) (_ BitVec 32) V!13027 V!13027 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!374986 (= lt!173297 (getCurrentListMapNoExtraKeys!731 lt!173305 lt!173309 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374986 (= lt!173309 (array!21803 (store (arr!10369 _values!506) i!548 (ValueCellFull!4127 v!373)) (size!10721 _values!506)))))

(assert (=> b!374986 (= lt!173306 (getCurrentListMapNoExtraKeys!731 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14976 () Bool)

(assert (=> mapIsEmpty!14976 mapRes!14976))

(declare-fun b!374987 () Bool)

(declare-fun res!211613 () Bool)

(assert (=> b!374987 (=> (not res!211613) (not e!228481))))

(assert (=> b!374987 (= res!211613 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5749))))

(declare-fun b!374988 () Bool)

(declare-fun res!211620 () Bool)

(assert (=> b!374988 (=> (not res!211620) (not e!228481))))

(assert (=> b!374988 (= res!211620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374989 () Bool)

(declare-fun res!211618 () Bool)

(assert (=> b!374989 (=> (not res!211618) (not e!228481))))

(declare-fun arrayContainsKey!0 (array!21800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374989 (= res!211618 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!374990 () Bool)

(declare-fun res!211622 () Bool)

(assert (=> b!374990 (=> (not res!211622) (not e!228481))))

(assert (=> b!374990 (= res!211622 (and (= (size!10721 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10720 _keys!658) (size!10721 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!374991 () Bool)

(declare-fun e!228483 () Bool)

(assert (=> b!374991 (= e!228485 e!228483)))

(declare-fun res!211621 () Bool)

(assert (=> b!374991 (=> res!211621 e!228483)))

(assert (=> b!374991 (= res!211621 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173296 () ListLongMap!4823)

(declare-fun lt!173303 () ListLongMap!4823)

(assert (=> b!374991 (= lt!173296 lt!173303)))

(declare-fun lt!173307 () ListLongMap!4823)

(assert (=> b!374991 (= lt!173303 (+!823 lt!173307 lt!173302))))

(declare-fun lt!173308 () Unit!11535)

(declare-fun addCommutativeForDiffKeys!251 (ListLongMap!4823 (_ BitVec 64) V!13027 (_ BitVec 64) V!13027) Unit!11535)

(assert (=> b!374991 (= lt!173308 (addCommutativeForDiffKeys!251 lt!173306 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173299 () tuple2!5908)

(assert (=> b!374991 (= lt!173311 (+!823 lt!173296 lt!173299))))

(declare-fun lt!173298 () tuple2!5908)

(assert (=> b!374991 (= lt!173296 (+!823 lt!173304 lt!173298))))

(declare-fun lt!173300 () ListLongMap!4823)

(assert (=> b!374991 (= lt!173310 lt!173300)))

(assert (=> b!374991 (= lt!173300 (+!823 lt!173307 lt!173299))))

(assert (=> b!374991 (= lt!173307 (+!823 lt!173306 lt!173298))))

(assert (=> b!374991 (= lt!173311 (+!823 (+!823 lt!173297 lt!173298) lt!173299))))

(assert (=> b!374991 (= lt!173299 (tuple2!5909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!374991 (= lt!173298 (tuple2!5909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!374981 () Bool)

(declare-fun res!211619 () Bool)

(assert (=> b!374981 (=> (not res!211619) (not e!228481))))

(assert (=> b!374981 (= res!211619 (or (= (select (arr!10368 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10368 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!211611 () Bool)

(assert (=> start!37152 (=> (not res!211611) (not e!228481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37152 (= res!211611 (validMask!0 mask!970))))

(assert (=> start!37152 e!228481))

(declare-fun array_inv!7694 (array!21802) Bool)

(assert (=> start!37152 (and (array_inv!7694 _values!506) e!228479)))

(assert (=> start!37152 tp!29594))

(assert (=> start!37152 true))

(assert (=> start!37152 tp_is_empty!8941))

(declare-fun array_inv!7695 (array!21800) Bool)

(assert (=> start!37152 (array_inv!7695 _keys!658)))

(declare-fun mapNonEmpty!14976 () Bool)

(declare-fun tp!29595 () Bool)

(assert (=> mapNonEmpty!14976 (= mapRes!14976 (and tp!29595 e!228480))))

(declare-fun mapKey!14976 () (_ BitVec 32))

(declare-fun mapValue!14976 () ValueCell!4127)

(declare-fun mapRest!14976 () (Array (_ BitVec 32) ValueCell!4127))

(assert (=> mapNonEmpty!14976 (= (arr!10369 _values!506) (store mapRest!14976 mapKey!14976 mapValue!14976))))

(declare-fun b!374992 () Bool)

(assert (=> b!374992 (= e!228483 true)))

(assert (=> b!374992 (= (+!823 lt!173303 lt!173299) (+!823 lt!173300 lt!173302))))

(declare-fun lt!173301 () Unit!11535)

(assert (=> b!374992 (= lt!173301 (addCommutativeForDiffKeys!251 lt!173307 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37152 res!211611) b!374990))

(assert (= (and b!374990 res!211622) b!374988))

(assert (= (and b!374988 res!211620) b!374987))

(assert (= (and b!374987 res!211613) b!374982))

(assert (= (and b!374982 res!211614) b!374983))

(assert (= (and b!374983 res!211616) b!374981))

(assert (= (and b!374981 res!211619) b!374989))

(assert (= (and b!374989 res!211618) b!374980))

(assert (= (and b!374980 res!211612) b!374978))

(assert (= (and b!374978 res!211615) b!374986))

(assert (= (and b!374986 (not res!211617)) b!374991))

(assert (= (and b!374991 (not res!211621)) b!374992))

(assert (= (and b!374984 condMapEmpty!14976) mapIsEmpty!14976))

(assert (= (and b!374984 (not condMapEmpty!14976)) mapNonEmpty!14976))

(get-info :version)

(assert (= (and mapNonEmpty!14976 ((_ is ValueCellFull!4127) mapValue!14976)) b!374985))

(assert (= (and b!374984 ((_ is ValueCellFull!4127) mapDefault!14976)) b!374979))

(assert (= start!37152 b!374984))

(declare-fun m!371705 () Bool)

(assert (=> start!37152 m!371705))

(declare-fun m!371707 () Bool)

(assert (=> start!37152 m!371707))

(declare-fun m!371709 () Bool)

(assert (=> start!37152 m!371709))

(declare-fun m!371711 () Bool)

(assert (=> b!374992 m!371711))

(declare-fun m!371713 () Bool)

(assert (=> b!374992 m!371713))

(declare-fun m!371715 () Bool)

(assert (=> b!374992 m!371715))

(declare-fun m!371717 () Bool)

(assert (=> b!374981 m!371717))

(declare-fun m!371719 () Bool)

(assert (=> b!374987 m!371719))

(declare-fun m!371721 () Bool)

(assert (=> b!374988 m!371721))

(declare-fun m!371723 () Bool)

(assert (=> b!374986 m!371723))

(declare-fun m!371725 () Bool)

(assert (=> b!374986 m!371725))

(declare-fun m!371727 () Bool)

(assert (=> b!374986 m!371727))

(declare-fun m!371729 () Bool)

(assert (=> b!374986 m!371729))

(declare-fun m!371731 () Bool)

(assert (=> b!374986 m!371731))

(declare-fun m!371733 () Bool)

(assert (=> b!374986 m!371733))

(declare-fun m!371735 () Bool)

(assert (=> b!374986 m!371735))

(declare-fun m!371737 () Bool)

(assert (=> mapNonEmpty!14976 m!371737))

(declare-fun m!371739 () Bool)

(assert (=> b!374983 m!371739))

(declare-fun m!371741 () Bool)

(assert (=> b!374991 m!371741))

(declare-fun m!371743 () Bool)

(assert (=> b!374991 m!371743))

(declare-fun m!371745 () Bool)

(assert (=> b!374991 m!371745))

(declare-fun m!371747 () Bool)

(assert (=> b!374991 m!371747))

(assert (=> b!374991 m!371743))

(declare-fun m!371749 () Bool)

(assert (=> b!374991 m!371749))

(declare-fun m!371751 () Bool)

(assert (=> b!374991 m!371751))

(declare-fun m!371753 () Bool)

(assert (=> b!374991 m!371753))

(declare-fun m!371755 () Bool)

(assert (=> b!374991 m!371755))

(declare-fun m!371757 () Bool)

(assert (=> b!374989 m!371757))

(declare-fun m!371759 () Bool)

(assert (=> b!374980 m!371759))

(declare-fun m!371761 () Bool)

(assert (=> b!374980 m!371761))

(declare-fun m!371763 () Bool)

(assert (=> b!374978 m!371763))

(check-sat (not b!374986) b_and!15549 (not b!374980) tp_is_empty!8941 (not b!374988) (not b_next!8293) (not b!374983) (not b!374987) (not b!374992) (not b!374978) (not b!374991) (not b!374989) (not mapNonEmpty!14976) (not start!37152))
(check-sat b_and!15549 (not b_next!8293))
