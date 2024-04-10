; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37468 () Bool)

(assert start!37468)

(declare-fun b_free!8595 () Bool)

(declare-fun b_next!8595 () Bool)

(assert (=> start!37468 (= b_free!8595 (not b_next!8595))))

(declare-fun tp!30501 () Bool)

(declare-fun b_and!15837 () Bool)

(assert (=> start!37468 (= tp!30501 b_and!15837)))

(declare-fun b!381772 () Bool)

(declare-fun e!232072 () Bool)

(declare-fun e!232069 () Bool)

(assert (=> b!381772 (= e!232072 (not e!232069))))

(declare-fun res!217004 () Bool)

(assert (=> b!381772 (=> res!217004 e!232069)))

(declare-fun lt!179000 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381772 (= res!217004 (or (and (not lt!179000) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179000)))))

(assert (=> b!381772 (= lt!179000 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13429 0))(
  ( (V!13430 (val!4666 Int)) )
))
(declare-datatypes ((ValueCell!4278 0))(
  ( (ValueCellFull!4278 (v!6863 V!13429)) (EmptyCell!4278) )
))
(declare-datatypes ((array!22399 0))(
  ( (array!22400 (arr!10668 (Array (_ BitVec 32) ValueCell!4278)) (size!11020 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22399)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6270 0))(
  ( (tuple2!6271 (_1!3146 (_ BitVec 64)) (_2!3146 V!13429)) )
))
(declare-datatypes ((List!6101 0))(
  ( (Nil!6098) (Cons!6097 (h!6953 tuple2!6270) (t!11251 List!6101)) )
))
(declare-datatypes ((ListLongMap!5183 0))(
  ( (ListLongMap!5184 (toList!2607 List!6101)) )
))
(declare-fun lt!178998 () ListLongMap!5183)

(declare-fun zeroValue!472 () V!13429)

(declare-datatypes ((array!22401 0))(
  ( (array!22402 (arr!10669 (Array (_ BitVec 32) (_ BitVec 64))) (size!11021 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22401)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13429)

(declare-fun getCurrentListMap!2016 (array!22401 array!22399 (_ BitVec 32) (_ BitVec 32) V!13429 V!13429 (_ BitVec 32) Int) ListLongMap!5183)

(assert (=> b!381772 (= lt!178998 (getCurrentListMap!2016 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178997 () ListLongMap!5183)

(declare-fun lt!178993 () array!22401)

(declare-fun lt!178999 () array!22399)

(assert (=> b!381772 (= lt!178997 (getCurrentListMap!2016 lt!178993 lt!178999 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178994 () ListLongMap!5183)

(declare-fun lt!178996 () ListLongMap!5183)

(assert (=> b!381772 (and (= lt!178994 lt!178996) (= lt!178996 lt!178994))))

(declare-fun lt!178995 () ListLongMap!5183)

(declare-fun v!373 () V!13429)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!946 (ListLongMap!5183 tuple2!6270) ListLongMap!5183)

(assert (=> b!381772 (= lt!178996 (+!946 lt!178995 (tuple2!6271 k0!778 v!373)))))

(declare-datatypes ((Unit!11786 0))(
  ( (Unit!11787) )
))
(declare-fun lt!179001 () Unit!11786)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!174 (array!22401 array!22399 (_ BitVec 32) (_ BitVec 32) V!13429 V!13429 (_ BitVec 32) (_ BitVec 64) V!13429 (_ BitVec 32) Int) Unit!11786)

(assert (=> b!381772 (= lt!179001 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!174 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!850 (array!22401 array!22399 (_ BitVec 32) (_ BitVec 32) V!13429 V!13429 (_ BitVec 32) Int) ListLongMap!5183)

(assert (=> b!381772 (= lt!178994 (getCurrentListMapNoExtraKeys!850 lt!178993 lt!178999 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381772 (= lt!178999 (array!22400 (store (arr!10668 _values!506) i!548 (ValueCellFull!4278 v!373)) (size!11020 _values!506)))))

(assert (=> b!381772 (= lt!178995 (getCurrentListMapNoExtraKeys!850 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381773 () Bool)

(declare-fun res!217010 () Bool)

(declare-fun e!232067 () Bool)

(assert (=> b!381773 (=> (not res!217010) (not e!232067))))

(assert (=> b!381773 (= res!217010 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11021 _keys!658))))))

(declare-fun b!381774 () Bool)

(assert (=> b!381774 (= e!232067 e!232072)))

(declare-fun res!217007 () Bool)

(assert (=> b!381774 (=> (not res!217007) (not e!232072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22401 (_ BitVec 32)) Bool)

(assert (=> b!381774 (= res!217007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178993 mask!970))))

(assert (=> b!381774 (= lt!178993 (array!22402 (store (arr!10669 _keys!658) i!548 k0!778) (size!11021 _keys!658)))))

(declare-fun b!381775 () Bool)

(declare-fun e!232071 () Bool)

(declare-fun e!232070 () Bool)

(declare-fun mapRes!15429 () Bool)

(assert (=> b!381775 (= e!232071 (and e!232070 mapRes!15429))))

(declare-fun condMapEmpty!15429 () Bool)

(declare-fun mapDefault!15429 () ValueCell!4278)

(assert (=> b!381775 (= condMapEmpty!15429 (= (arr!10668 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4278)) mapDefault!15429)))))

(declare-fun b!381776 () Bool)

(declare-fun res!217009 () Bool)

(assert (=> b!381776 (=> (not res!217009) (not e!232067))))

(assert (=> b!381776 (= res!217009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381777 () Bool)

(declare-fun res!217006 () Bool)

(assert (=> b!381777 (=> (not res!217006) (not e!232067))))

(assert (=> b!381777 (= res!217006 (and (= (size!11020 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11021 _keys!658) (size!11020 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15429 () Bool)

(assert (=> mapIsEmpty!15429 mapRes!15429))

(declare-fun b!381778 () Bool)

(declare-fun res!217005 () Bool)

(assert (=> b!381778 (=> (not res!217005) (not e!232067))))

(declare-fun arrayContainsKey!0 (array!22401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381778 (= res!217005 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381779 () Bool)

(declare-fun res!217000 () Bool)

(assert (=> b!381779 (=> (not res!217000) (not e!232067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381779 (= res!217000 (validKeyInArray!0 k0!778))))

(declare-fun b!381780 () Bool)

(declare-fun res!217001 () Bool)

(assert (=> b!381780 (=> (not res!217001) (not e!232072))))

(declare-datatypes ((List!6102 0))(
  ( (Nil!6099) (Cons!6098 (h!6954 (_ BitVec 64)) (t!11252 List!6102)) )
))
(declare-fun arrayNoDuplicates!0 (array!22401 (_ BitVec 32) List!6102) Bool)

(assert (=> b!381780 (= res!217001 (arrayNoDuplicates!0 lt!178993 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun res!217008 () Bool)

(assert (=> start!37468 (=> (not res!217008) (not e!232067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37468 (= res!217008 (validMask!0 mask!970))))

(assert (=> start!37468 e!232067))

(declare-fun array_inv!7854 (array!22399) Bool)

(assert (=> start!37468 (and (array_inv!7854 _values!506) e!232071)))

(assert (=> start!37468 tp!30501))

(assert (=> start!37468 true))

(declare-fun tp_is_empty!9243 () Bool)

(assert (=> start!37468 tp_is_empty!9243))

(declare-fun array_inv!7855 (array!22401) Bool)

(assert (=> start!37468 (array_inv!7855 _keys!658)))

(declare-fun mapNonEmpty!15429 () Bool)

(declare-fun tp!30500 () Bool)

(declare-fun e!232073 () Bool)

(assert (=> mapNonEmpty!15429 (= mapRes!15429 (and tp!30500 e!232073))))

(declare-fun mapRest!15429 () (Array (_ BitVec 32) ValueCell!4278))

(declare-fun mapKey!15429 () (_ BitVec 32))

(declare-fun mapValue!15429 () ValueCell!4278)

(assert (=> mapNonEmpty!15429 (= (arr!10668 _values!506) (store mapRest!15429 mapKey!15429 mapValue!15429))))

(declare-fun b!381781 () Bool)

(declare-fun res!217002 () Bool)

(assert (=> b!381781 (=> (not res!217002) (not e!232067))))

(assert (=> b!381781 (= res!217002 (or (= (select (arr!10669 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10669 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381782 () Bool)

(assert (=> b!381782 (= e!232073 tp_is_empty!9243)))

(declare-fun b!381783 () Bool)

(declare-fun res!217003 () Bool)

(assert (=> b!381783 (=> (not res!217003) (not e!232067))))

(assert (=> b!381783 (= res!217003 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6099))))

(declare-fun b!381784 () Bool)

(assert (=> b!381784 (= e!232069 true)))

(assert (=> b!381784 (= lt!178997 lt!178994)))

(declare-fun b!381785 () Bool)

(assert (=> b!381785 (= e!232070 tp_is_empty!9243)))

(assert (= (and start!37468 res!217008) b!381777))

(assert (= (and b!381777 res!217006) b!381776))

(assert (= (and b!381776 res!217009) b!381783))

(assert (= (and b!381783 res!217003) b!381773))

(assert (= (and b!381773 res!217010) b!381779))

(assert (= (and b!381779 res!217000) b!381781))

(assert (= (and b!381781 res!217002) b!381778))

(assert (= (and b!381778 res!217005) b!381774))

(assert (= (and b!381774 res!217007) b!381780))

(assert (= (and b!381780 res!217001) b!381772))

(assert (= (and b!381772 (not res!217004)) b!381784))

(assert (= (and b!381775 condMapEmpty!15429) mapIsEmpty!15429))

(assert (= (and b!381775 (not condMapEmpty!15429)) mapNonEmpty!15429))

(get-info :version)

(assert (= (and mapNonEmpty!15429 ((_ is ValueCellFull!4278) mapValue!15429)) b!381782))

(assert (= (and b!381775 ((_ is ValueCellFull!4278) mapDefault!15429)) b!381785))

(assert (= start!37468 b!381775))

(declare-fun m!378659 () Bool)

(assert (=> b!381778 m!378659))

(declare-fun m!378661 () Bool)

(assert (=> b!381779 m!378661))

(declare-fun m!378663 () Bool)

(assert (=> b!381772 m!378663))

(declare-fun m!378665 () Bool)

(assert (=> b!381772 m!378665))

(declare-fun m!378667 () Bool)

(assert (=> b!381772 m!378667))

(declare-fun m!378669 () Bool)

(assert (=> b!381772 m!378669))

(declare-fun m!378671 () Bool)

(assert (=> b!381772 m!378671))

(declare-fun m!378673 () Bool)

(assert (=> b!381772 m!378673))

(declare-fun m!378675 () Bool)

(assert (=> b!381772 m!378675))

(declare-fun m!378677 () Bool)

(assert (=> b!381781 m!378677))

(declare-fun m!378679 () Bool)

(assert (=> b!381774 m!378679))

(declare-fun m!378681 () Bool)

(assert (=> b!381774 m!378681))

(declare-fun m!378683 () Bool)

(assert (=> b!381776 m!378683))

(declare-fun m!378685 () Bool)

(assert (=> mapNonEmpty!15429 m!378685))

(declare-fun m!378687 () Bool)

(assert (=> start!37468 m!378687))

(declare-fun m!378689 () Bool)

(assert (=> start!37468 m!378689))

(declare-fun m!378691 () Bool)

(assert (=> start!37468 m!378691))

(declare-fun m!378693 () Bool)

(assert (=> b!381783 m!378693))

(declare-fun m!378695 () Bool)

(assert (=> b!381780 m!378695))

(check-sat (not b_next!8595) tp_is_empty!9243 (not b!381779) (not b!381774) (not b!381783) (not b!381776) (not mapNonEmpty!15429) (not start!37468) (not b!381778) (not b!381772) (not b!381780) b_and!15837)
(check-sat b_and!15837 (not b_next!8595))
