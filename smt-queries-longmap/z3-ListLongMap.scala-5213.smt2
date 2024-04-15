; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70290 () Bool)

(assert start!70290)

(declare-fun b_free!12685 () Bool)

(declare-fun b_next!12685 () Bool)

(assert (=> start!70290 (= b_free!12685 (not b_next!12685))))

(declare-fun tp!44778 () Bool)

(declare-fun b_and!21459 () Bool)

(assert (=> start!70290 (= tp!44778 b_and!21459)))

(declare-fun b!816601 () Bool)

(declare-fun res!557551 () Bool)

(declare-fun e!453036 () Bool)

(assert (=> b!816601 (=> (not res!557551) (not e!453036))))

(declare-datatypes ((array!44967 0))(
  ( (array!44968 (arr!21541 (Array (_ BitVec 32) (_ BitVec 64))) (size!21962 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44967)

(declare-datatypes ((List!15359 0))(
  ( (Nil!15356) (Cons!15355 (h!16484 (_ BitVec 64)) (t!21673 List!15359)) )
))
(declare-fun arrayNoDuplicates!0 (array!44967 (_ BitVec 32) List!15359) Bool)

(assert (=> b!816601 (= res!557551 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15356))))

(declare-fun res!557552 () Bool)

(assert (=> start!70290 (=> (not res!557552) (not e!453036))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70290 (= res!557552 (validMask!0 mask!1312))))

(assert (=> start!70290 e!453036))

(declare-fun tp_is_empty!14395 () Bool)

(assert (=> start!70290 tp_is_empty!14395))

(declare-fun array_inv!17311 (array!44967) Bool)

(assert (=> start!70290 (array_inv!17311 _keys!976)))

(assert (=> start!70290 true))

(declare-datatypes ((V!24195 0))(
  ( (V!24196 (val!7245 Int)) )
))
(declare-datatypes ((ValueCell!6782 0))(
  ( (ValueCellFull!6782 (v!9667 V!24195)) (EmptyCell!6782) )
))
(declare-datatypes ((array!44969 0))(
  ( (array!44970 (arr!21542 (Array (_ BitVec 32) ValueCell!6782)) (size!21963 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44969)

(declare-fun e!453038 () Bool)

(declare-fun array_inv!17312 (array!44969) Bool)

(assert (=> start!70290 (and (array_inv!17312 _values!788) e!453038)))

(assert (=> start!70290 tp!44778))

(declare-fun b!816602 () Bool)

(declare-fun e!453040 () Bool)

(assert (=> b!816602 (= e!453036 (not e!453040))))

(declare-fun res!557555 () Bool)

(assert (=> b!816602 (=> res!557555 e!453040)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816602 (= res!557555 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9536 0))(
  ( (tuple2!9537 (_1!4779 (_ BitVec 64)) (_2!4779 V!24195)) )
))
(declare-datatypes ((List!15360 0))(
  ( (Nil!15357) (Cons!15356 (h!16485 tuple2!9536) (t!21674 List!15360)) )
))
(declare-datatypes ((ListLongMap!8349 0))(
  ( (ListLongMap!8350 (toList!4190 List!15360)) )
))
(declare-fun lt!365687 () ListLongMap!8349)

(declare-fun lt!365686 () ListLongMap!8349)

(assert (=> b!816602 (= lt!365687 lt!365686)))

(declare-fun zeroValueBefore!34 () V!24195)

(declare-datatypes ((Unit!27806 0))(
  ( (Unit!27807) )
))
(declare-fun lt!365688 () Unit!27806)

(declare-fun zeroValueAfter!34 () V!24195)

(declare-fun minValue!754 () V!24195)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!343 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 V!24195 V!24195 (_ BitVec 32) Int) Unit!27806)

(assert (=> b!816602 (= lt!365688 (lemmaNoChangeToArrayThenSameMapNoExtras!343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2250 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 (_ BitVec 32) Int) ListLongMap!8349)

(assert (=> b!816602 (= lt!365686 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816602 (= lt!365687 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23182 () Bool)

(declare-fun mapRes!23182 () Bool)

(declare-fun tp!44779 () Bool)

(declare-fun e!453039 () Bool)

(assert (=> mapNonEmpty!23182 (= mapRes!23182 (and tp!44779 e!453039))))

(declare-fun mapValue!23182 () ValueCell!6782)

(declare-fun mapKey!23182 () (_ BitVec 32))

(declare-fun mapRest!23182 () (Array (_ BitVec 32) ValueCell!6782))

(assert (=> mapNonEmpty!23182 (= (arr!21542 _values!788) (store mapRest!23182 mapKey!23182 mapValue!23182))))

(declare-fun b!816603 () Bool)

(declare-fun res!557554 () Bool)

(assert (=> b!816603 (=> (not res!557554) (not e!453036))))

(assert (=> b!816603 (= res!557554 (and (= (size!21963 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21962 _keys!976) (size!21963 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816604 () Bool)

(declare-fun e!453035 () Bool)

(assert (=> b!816604 (= e!453038 (and e!453035 mapRes!23182))))

(declare-fun condMapEmpty!23182 () Bool)

(declare-fun mapDefault!23182 () ValueCell!6782)

(assert (=> b!816604 (= condMapEmpty!23182 (= (arr!21542 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6782)) mapDefault!23182)))))

(declare-fun b!816605 () Bool)

(declare-fun res!557553 () Bool)

(assert (=> b!816605 (=> (not res!557553) (not e!453036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44967 (_ BitVec 32)) Bool)

(assert (=> b!816605 (= res!557553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816606 () Bool)

(assert (=> b!816606 (= e!453039 tp_is_empty!14395)))

(declare-fun b!816607 () Bool)

(assert (=> b!816607 (= e!453035 tp_is_empty!14395)))

(declare-fun b!816608 () Bool)

(assert (=> b!816608 (= e!453040 true)))

(declare-fun lt!365689 () ListLongMap!8349)

(declare-fun getCurrentListMap!2362 (array!44967 array!44969 (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 (_ BitVec 32) Int) ListLongMap!8349)

(assert (=> b!816608 (= lt!365689 (getCurrentListMap!2362 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365685 () ListLongMap!8349)

(declare-fun +!1850 (ListLongMap!8349 tuple2!9536) ListLongMap!8349)

(assert (=> b!816608 (= lt!365685 (+!1850 (getCurrentListMap!2362 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23182 () Bool)

(assert (=> mapIsEmpty!23182 mapRes!23182))

(assert (= (and start!70290 res!557552) b!816603))

(assert (= (and b!816603 res!557554) b!816605))

(assert (= (and b!816605 res!557553) b!816601))

(assert (= (and b!816601 res!557551) b!816602))

(assert (= (and b!816602 (not res!557555)) b!816608))

(assert (= (and b!816604 condMapEmpty!23182) mapIsEmpty!23182))

(assert (= (and b!816604 (not condMapEmpty!23182)) mapNonEmpty!23182))

(get-info :version)

(assert (= (and mapNonEmpty!23182 ((_ is ValueCellFull!6782) mapValue!23182)) b!816606))

(assert (= (and b!816604 ((_ is ValueCellFull!6782) mapDefault!23182)) b!816607))

(assert (= start!70290 b!816604))

(declare-fun m!757727 () Bool)

(assert (=> b!816608 m!757727))

(declare-fun m!757729 () Bool)

(assert (=> b!816608 m!757729))

(assert (=> b!816608 m!757729))

(declare-fun m!757731 () Bool)

(assert (=> b!816608 m!757731))

(declare-fun m!757733 () Bool)

(assert (=> start!70290 m!757733))

(declare-fun m!757735 () Bool)

(assert (=> start!70290 m!757735))

(declare-fun m!757737 () Bool)

(assert (=> start!70290 m!757737))

(declare-fun m!757739 () Bool)

(assert (=> b!816602 m!757739))

(declare-fun m!757741 () Bool)

(assert (=> b!816602 m!757741))

(declare-fun m!757743 () Bool)

(assert (=> b!816602 m!757743))

(declare-fun m!757745 () Bool)

(assert (=> mapNonEmpty!23182 m!757745))

(declare-fun m!757747 () Bool)

(assert (=> b!816601 m!757747))

(declare-fun m!757749 () Bool)

(assert (=> b!816605 m!757749))

(check-sat b_and!21459 (not b!816601) (not mapNonEmpty!23182) tp_is_empty!14395 (not start!70290) (not b_next!12685) (not b!816608) (not b!816602) (not b!816605))
(check-sat b_and!21459 (not b_next!12685))
