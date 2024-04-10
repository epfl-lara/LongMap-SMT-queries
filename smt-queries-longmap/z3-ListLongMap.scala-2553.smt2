; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39138 () Bool)

(assert start!39138)

(declare-fun b_free!9405 () Bool)

(declare-fun b_next!9405 () Bool)

(assert (=> start!39138 (= b_free!9405 (not b_next!9405))))

(declare-fun tp!33743 () Bool)

(declare-fun b_and!16791 () Bool)

(assert (=> start!39138 (= tp!33743 b_and!16791)))

(declare-fun b!411717 () Bool)

(declare-fun res!238920 () Bool)

(declare-fun e!246518 () Bool)

(assert (=> b!411717 (=> (not res!238920) (not e!246518))))

(declare-datatypes ((array!24975 0))(
  ( (array!24976 (arr!11937 (Array (_ BitVec 32) (_ BitVec 64))) (size!12289 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24975)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411717 (= res!238920 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411718 () Bool)

(declare-fun res!238916 () Bool)

(assert (=> b!411718 (=> (not res!238916) (not e!246518))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15181 0))(
  ( (V!15182 (val!5323 Int)) )
))
(declare-datatypes ((ValueCell!4935 0))(
  ( (ValueCellFull!4935 (v!7570 V!15181)) (EmptyCell!4935) )
))
(declare-datatypes ((array!24977 0))(
  ( (array!24978 (arr!11938 (Array (_ BitVec 32) ValueCell!4935)) (size!12290 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24977)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!411718 (= res!238916 (and (= (size!12290 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12289 _keys!709) (size!12290 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411719 () Bool)

(declare-fun res!238915 () Bool)

(assert (=> b!411719 (=> (not res!238915) (not e!246518))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411719 (= res!238915 (or (= (select (arr!11937 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11937 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!238919 () Bool)

(assert (=> start!39138 (=> (not res!238919) (not e!246518))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39138 (= res!238919 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12289 _keys!709))))))

(assert (=> start!39138 e!246518))

(declare-fun tp_is_empty!10557 () Bool)

(assert (=> start!39138 tp_is_empty!10557))

(assert (=> start!39138 tp!33743))

(assert (=> start!39138 true))

(declare-fun e!246519 () Bool)

(declare-fun array_inv!8710 (array!24977) Bool)

(assert (=> start!39138 (and (array_inv!8710 _values!549) e!246519)))

(declare-fun array_inv!8711 (array!24975) Bool)

(assert (=> start!39138 (array_inv!8711 _keys!709)))

(declare-fun b!411720 () Bool)

(declare-fun e!246522 () Bool)

(assert (=> b!411720 (= e!246522 tp_is_empty!10557)))

(declare-fun b!411721 () Bool)

(declare-fun res!238914 () Bool)

(assert (=> b!411721 (=> (not res!238914) (not e!246518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411721 (= res!238914 (validKeyInArray!0 k0!794))))

(declare-fun b!411722 () Bool)

(declare-fun res!238921 () Bool)

(assert (=> b!411722 (=> (not res!238921) (not e!246518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24975 (_ BitVec 32)) Bool)

(assert (=> b!411722 (= res!238921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411723 () Bool)

(declare-fun res!238917 () Bool)

(declare-fun e!246517 () Bool)

(assert (=> b!411723 (=> (not res!238917) (not e!246517))))

(assert (=> b!411723 (= res!238917 (bvsle from!863 i!563))))

(declare-fun b!411724 () Bool)

(assert (=> b!411724 (= e!246518 e!246517)))

(declare-fun res!238913 () Bool)

(assert (=> b!411724 (=> (not res!238913) (not e!246517))))

(declare-fun lt!189337 () array!24975)

(assert (=> b!411724 (= res!238913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189337 mask!1025))))

(assert (=> b!411724 (= lt!189337 (array!24976 (store (arr!11937 _keys!709) i!563 k0!794) (size!12289 _keys!709)))))

(declare-fun b!411725 () Bool)

(declare-fun mapRes!17457 () Bool)

(assert (=> b!411725 (= e!246519 (and e!246522 mapRes!17457))))

(declare-fun condMapEmpty!17457 () Bool)

(declare-fun mapDefault!17457 () ValueCell!4935)

(assert (=> b!411725 (= condMapEmpty!17457 (= (arr!11938 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4935)) mapDefault!17457)))))

(declare-fun b!411726 () Bool)

(declare-fun e!246521 () Bool)

(assert (=> b!411726 (= e!246521 tp_is_empty!10557)))

(declare-fun b!411727 () Bool)

(declare-fun res!238922 () Bool)

(assert (=> b!411727 (=> (not res!238922) (not e!246518))))

(declare-datatypes ((List!6931 0))(
  ( (Nil!6928) (Cons!6927 (h!7783 (_ BitVec 64)) (t!12105 List!6931)) )
))
(declare-fun arrayNoDuplicates!0 (array!24975 (_ BitVec 32) List!6931) Bool)

(assert (=> b!411727 (= res!238922 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6928))))

(declare-fun b!411728 () Bool)

(declare-fun res!238912 () Bool)

(assert (=> b!411728 (=> (not res!238912) (not e!246518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411728 (= res!238912 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17457 () Bool)

(assert (=> mapIsEmpty!17457 mapRes!17457))

(declare-fun b!411729 () Bool)

(declare-fun res!238918 () Bool)

(assert (=> b!411729 (=> (not res!238918) (not e!246518))))

(assert (=> b!411729 (= res!238918 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12289 _keys!709))))))

(declare-fun b!411730 () Bool)

(assert (=> b!411730 (= e!246517 false)))

(declare-fun minValue!515 () V!15181)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15181)

(declare-datatypes ((tuple2!6906 0))(
  ( (tuple2!6907 (_1!3464 (_ BitVec 64)) (_2!3464 V!15181)) )
))
(declare-datatypes ((List!6932 0))(
  ( (Nil!6929) (Cons!6928 (h!7784 tuple2!6906) (t!12106 List!6932)) )
))
(declare-datatypes ((ListLongMap!5819 0))(
  ( (ListLongMap!5820 (toList!2925 List!6932)) )
))
(declare-fun lt!189336 () ListLongMap!5819)

(declare-fun v!412 () V!15181)

(declare-fun getCurrentListMapNoExtraKeys!1133 (array!24975 array!24977 (_ BitVec 32) (_ BitVec 32) V!15181 V!15181 (_ BitVec 32) Int) ListLongMap!5819)

(assert (=> b!411730 (= lt!189336 (getCurrentListMapNoExtraKeys!1133 lt!189337 (array!24978 (store (arr!11938 _values!549) i!563 (ValueCellFull!4935 v!412)) (size!12290 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189338 () ListLongMap!5819)

(assert (=> b!411730 (= lt!189338 (getCurrentListMapNoExtraKeys!1133 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411731 () Bool)

(declare-fun res!238923 () Bool)

(assert (=> b!411731 (=> (not res!238923) (not e!246517))))

(assert (=> b!411731 (= res!238923 (arrayNoDuplicates!0 lt!189337 #b00000000000000000000000000000000 Nil!6928))))

(declare-fun mapNonEmpty!17457 () Bool)

(declare-fun tp!33744 () Bool)

(assert (=> mapNonEmpty!17457 (= mapRes!17457 (and tp!33744 e!246521))))

(declare-fun mapRest!17457 () (Array (_ BitVec 32) ValueCell!4935))

(declare-fun mapValue!17457 () ValueCell!4935)

(declare-fun mapKey!17457 () (_ BitVec 32))

(assert (=> mapNonEmpty!17457 (= (arr!11938 _values!549) (store mapRest!17457 mapKey!17457 mapValue!17457))))

(assert (= (and start!39138 res!238919) b!411728))

(assert (= (and b!411728 res!238912) b!411718))

(assert (= (and b!411718 res!238916) b!411722))

(assert (= (and b!411722 res!238921) b!411727))

(assert (= (and b!411727 res!238922) b!411729))

(assert (= (and b!411729 res!238918) b!411721))

(assert (= (and b!411721 res!238914) b!411719))

(assert (= (and b!411719 res!238915) b!411717))

(assert (= (and b!411717 res!238920) b!411724))

(assert (= (and b!411724 res!238913) b!411731))

(assert (= (and b!411731 res!238923) b!411723))

(assert (= (and b!411723 res!238917) b!411730))

(assert (= (and b!411725 condMapEmpty!17457) mapIsEmpty!17457))

(assert (= (and b!411725 (not condMapEmpty!17457)) mapNonEmpty!17457))

(get-info :version)

(assert (= (and mapNonEmpty!17457 ((_ is ValueCellFull!4935) mapValue!17457)) b!411726))

(assert (= (and b!411725 ((_ is ValueCellFull!4935) mapDefault!17457)) b!411720))

(assert (= start!39138 b!411725))

(declare-fun m!401773 () Bool)

(assert (=> b!411727 m!401773))

(declare-fun m!401775 () Bool)

(assert (=> b!411721 m!401775))

(declare-fun m!401777 () Bool)

(assert (=> b!411722 m!401777))

(declare-fun m!401779 () Bool)

(assert (=> b!411724 m!401779))

(declare-fun m!401781 () Bool)

(assert (=> b!411724 m!401781))

(declare-fun m!401783 () Bool)

(assert (=> start!39138 m!401783))

(declare-fun m!401785 () Bool)

(assert (=> start!39138 m!401785))

(declare-fun m!401787 () Bool)

(assert (=> b!411719 m!401787))

(declare-fun m!401789 () Bool)

(assert (=> b!411730 m!401789))

(declare-fun m!401791 () Bool)

(assert (=> b!411730 m!401791))

(declare-fun m!401793 () Bool)

(assert (=> b!411730 m!401793))

(declare-fun m!401795 () Bool)

(assert (=> mapNonEmpty!17457 m!401795))

(declare-fun m!401797 () Bool)

(assert (=> b!411728 m!401797))

(declare-fun m!401799 () Bool)

(assert (=> b!411731 m!401799))

(declare-fun m!401801 () Bool)

(assert (=> b!411717 m!401801))

(check-sat (not b!411717) (not mapNonEmpty!17457) (not b_next!9405) (not b!411731) (not b!411722) tp_is_empty!10557 (not b!411727) b_and!16791 (not b!411728) (not b!411730) (not start!39138) (not b!411724) (not b!411721))
(check-sat b_and!16791 (not b_next!9405))
