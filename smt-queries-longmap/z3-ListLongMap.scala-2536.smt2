; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39020 () Bool)

(assert start!39020)

(declare-fun b_free!9301 () Bool)

(declare-fun b_next!9301 () Bool)

(assert (=> start!39020 (= b_free!9301 (not b_next!9301))))

(declare-fun tp!33432 () Bool)

(declare-fun b_and!16661 () Bool)

(assert (=> start!39020 (= tp!33432 b_and!16661)))

(declare-fun b!409106 () Bool)

(declare-fun e!245408 () Bool)

(declare-fun e!245411 () Bool)

(assert (=> b!409106 (= e!245408 e!245411)))

(declare-fun res!236922 () Bool)

(assert (=> b!409106 (=> (not res!236922) (not e!245411))))

(declare-datatypes ((array!24767 0))(
  ( (array!24768 (arr!11833 (Array (_ BitVec 32) (_ BitVec 64))) (size!12186 (_ BitVec 32))) )
))
(declare-fun lt!188704 () array!24767)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24767 (_ BitVec 32)) Bool)

(assert (=> b!409106 (= res!236922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188704 mask!1025))))

(declare-fun _keys!709 () array!24767)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409106 (= lt!188704 (array!24768 (store (arr!11833 _keys!709) i!563 k0!794) (size!12186 _keys!709)))))

(declare-fun mapNonEmpty!17301 () Bool)

(declare-fun mapRes!17301 () Bool)

(declare-fun tp!33431 () Bool)

(declare-fun e!245412 () Bool)

(assert (=> mapNonEmpty!17301 (= mapRes!17301 (and tp!33431 e!245412))))

(declare-datatypes ((V!15043 0))(
  ( (V!15044 (val!5271 Int)) )
))
(declare-datatypes ((ValueCell!4883 0))(
  ( (ValueCellFull!4883 (v!7512 V!15043)) (EmptyCell!4883) )
))
(declare-fun mapRest!17301 () (Array (_ BitVec 32) ValueCell!4883))

(declare-datatypes ((array!24769 0))(
  ( (array!24770 (arr!11834 (Array (_ BitVec 32) ValueCell!4883)) (size!12187 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24769)

(declare-fun mapKey!17301 () (_ BitVec 32))

(declare-fun mapValue!17301 () ValueCell!4883)

(assert (=> mapNonEmpty!17301 (= (arr!11834 _values!549) (store mapRest!17301 mapKey!17301 mapValue!17301))))

(declare-fun b!409107 () Bool)

(declare-fun res!236915 () Bool)

(assert (=> b!409107 (=> (not res!236915) (not e!245408))))

(declare-fun arrayContainsKey!0 (array!24767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409107 (= res!236915 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409108 () Bool)

(declare-fun res!236911 () Bool)

(assert (=> b!409108 (=> (not res!236911) (not e!245411))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409108 (= res!236911 (bvsle from!863 i!563))))

(declare-fun b!409109 () Bool)

(declare-fun res!236912 () Bool)

(assert (=> b!409109 (=> (not res!236912) (not e!245408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409109 (= res!236912 (validKeyInArray!0 k0!794))))

(declare-fun b!409110 () Bool)

(declare-fun res!236917 () Bool)

(assert (=> b!409110 (=> (not res!236917) (not e!245408))))

(assert (=> b!409110 (= res!236917 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12186 _keys!709))))))

(declare-fun b!409111 () Bool)

(declare-fun e!245407 () Bool)

(declare-fun tp_is_empty!10453 () Bool)

(assert (=> b!409111 (= e!245407 tp_is_empty!10453)))

(declare-fun res!236921 () Bool)

(assert (=> start!39020 (=> (not res!236921) (not e!245408))))

(assert (=> start!39020 (= res!236921 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12186 _keys!709))))))

(assert (=> start!39020 e!245408))

(assert (=> start!39020 tp_is_empty!10453))

(assert (=> start!39020 tp!33432))

(assert (=> start!39020 true))

(declare-fun e!245410 () Bool)

(declare-fun array_inv!8678 (array!24769) Bool)

(assert (=> start!39020 (and (array_inv!8678 _values!549) e!245410)))

(declare-fun array_inv!8679 (array!24767) Bool)

(assert (=> start!39020 (array_inv!8679 _keys!709)))

(declare-fun mapIsEmpty!17301 () Bool)

(assert (=> mapIsEmpty!17301 mapRes!17301))

(declare-fun b!409112 () Bool)

(declare-fun res!236913 () Bool)

(assert (=> b!409112 (=> (not res!236913) (not e!245408))))

(assert (=> b!409112 (= res!236913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409113 () Bool)

(declare-fun res!236918 () Bool)

(assert (=> b!409113 (=> (not res!236918) (not e!245411))))

(declare-datatypes ((List!6828 0))(
  ( (Nil!6825) (Cons!6824 (h!7680 (_ BitVec 64)) (t!11993 List!6828)) )
))
(declare-fun arrayNoDuplicates!0 (array!24767 (_ BitVec 32) List!6828) Bool)

(assert (=> b!409113 (= res!236918 (arrayNoDuplicates!0 lt!188704 #b00000000000000000000000000000000 Nil!6825))))

(declare-fun b!409114 () Bool)

(declare-fun res!236920 () Bool)

(assert (=> b!409114 (=> (not res!236920) (not e!245408))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409114 (= res!236920 (and (= (size!12187 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12186 _keys!709) (size!12187 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409115 () Bool)

(declare-fun res!236919 () Bool)

(assert (=> b!409115 (=> (not res!236919) (not e!245408))))

(assert (=> b!409115 (= res!236919 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6825))))

(declare-fun b!409116 () Bool)

(declare-fun res!236916 () Bool)

(assert (=> b!409116 (=> (not res!236916) (not e!245408))))

(assert (=> b!409116 (= res!236916 (or (= (select (arr!11833 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11833 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409117 () Bool)

(assert (=> b!409117 (= e!245412 tp_is_empty!10453)))

(declare-fun b!409118 () Bool)

(declare-fun res!236914 () Bool)

(assert (=> b!409118 (=> (not res!236914) (not e!245408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409118 (= res!236914 (validMask!0 mask!1025))))

(declare-fun b!409119 () Bool)

(assert (=> b!409119 (= e!245410 (and e!245407 mapRes!17301))))

(declare-fun condMapEmpty!17301 () Bool)

(declare-fun mapDefault!17301 () ValueCell!4883)

(assert (=> b!409119 (= condMapEmpty!17301 (= (arr!11834 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4883)) mapDefault!17301)))))

(declare-fun b!409120 () Bool)

(assert (=> b!409120 (= e!245411 false)))

(declare-fun minValue!515 () V!15043)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6818 0))(
  ( (tuple2!6819 (_1!3420 (_ BitVec 64)) (_2!3420 V!15043)) )
))
(declare-datatypes ((List!6829 0))(
  ( (Nil!6826) (Cons!6825 (h!7681 tuple2!6818) (t!11994 List!6829)) )
))
(declare-datatypes ((ListLongMap!5721 0))(
  ( (ListLongMap!5722 (toList!2876 List!6829)) )
))
(declare-fun lt!188705 () ListLongMap!5721)

(declare-fun zeroValue!515 () V!15043)

(declare-fun getCurrentListMapNoExtraKeys!1090 (array!24767 array!24769 (_ BitVec 32) (_ BitVec 32) V!15043 V!15043 (_ BitVec 32) Int) ListLongMap!5721)

(assert (=> b!409120 (= lt!188705 (getCurrentListMapNoExtraKeys!1090 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39020 res!236921) b!409118))

(assert (= (and b!409118 res!236914) b!409114))

(assert (= (and b!409114 res!236920) b!409112))

(assert (= (and b!409112 res!236913) b!409115))

(assert (= (and b!409115 res!236919) b!409110))

(assert (= (and b!409110 res!236917) b!409109))

(assert (= (and b!409109 res!236912) b!409116))

(assert (= (and b!409116 res!236916) b!409107))

(assert (= (and b!409107 res!236915) b!409106))

(assert (= (and b!409106 res!236922) b!409113))

(assert (= (and b!409113 res!236918) b!409108))

(assert (= (and b!409108 res!236911) b!409120))

(assert (= (and b!409119 condMapEmpty!17301) mapIsEmpty!17301))

(assert (= (and b!409119 (not condMapEmpty!17301)) mapNonEmpty!17301))

(get-info :version)

(assert (= (and mapNonEmpty!17301 ((_ is ValueCellFull!4883) mapValue!17301)) b!409117))

(assert (= (and b!409119 ((_ is ValueCellFull!4883) mapDefault!17301)) b!409111))

(assert (= start!39020 b!409119))

(declare-fun m!399585 () Bool)

(assert (=> mapNonEmpty!17301 m!399585))

(declare-fun m!399587 () Bool)

(assert (=> b!409115 m!399587))

(declare-fun m!399589 () Bool)

(assert (=> b!409106 m!399589))

(declare-fun m!399591 () Bool)

(assert (=> b!409106 m!399591))

(declare-fun m!399593 () Bool)

(assert (=> b!409107 m!399593))

(declare-fun m!399595 () Bool)

(assert (=> start!39020 m!399595))

(declare-fun m!399597 () Bool)

(assert (=> start!39020 m!399597))

(declare-fun m!399599 () Bool)

(assert (=> b!409109 m!399599))

(declare-fun m!399601 () Bool)

(assert (=> b!409112 m!399601))

(declare-fun m!399603 () Bool)

(assert (=> b!409116 m!399603))

(declare-fun m!399605 () Bool)

(assert (=> b!409113 m!399605))

(declare-fun m!399607 () Bool)

(assert (=> b!409120 m!399607))

(declare-fun m!399609 () Bool)

(assert (=> b!409118 m!399609))

(check-sat (not b!409107) (not b!409115) b_and!16661 (not b!409109) (not mapNonEmpty!17301) (not b!409113) (not b!409120) tp_is_empty!10453 (not b!409112) (not b!409118) (not b!409106) (not start!39020) (not b_next!9301))
(check-sat b_and!16661 (not b_next!9301))
