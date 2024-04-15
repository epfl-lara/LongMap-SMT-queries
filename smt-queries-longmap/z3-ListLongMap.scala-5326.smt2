; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71196 () Bool)

(assert start!71196)

(declare-fun b_free!13363 () Bool)

(declare-fun b_next!13363 () Bool)

(assert (=> start!71196 (= b_free!13363 (not b_next!13363))))

(declare-fun tp!46851 () Bool)

(declare-fun b_and!22275 () Bool)

(assert (=> start!71196 (= tp!46851 b_and!22275)))

(declare-fun b!827014 () Bool)

(declare-fun e!460663 () Bool)

(declare-fun tp_is_empty!15073 () Bool)

(assert (=> b!827014 (= e!460663 tp_is_empty!15073)))

(declare-fun b!827015 () Bool)

(declare-fun res!563768 () Bool)

(declare-fun e!460660 () Bool)

(assert (=> b!827015 (=> (not res!563768) (not e!460660))))

(declare-datatypes ((array!46289 0))(
  ( (array!46290 (arr!22189 (Array (_ BitVec 32) (_ BitVec 64))) (size!22610 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46289)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46289 (_ BitVec 32)) Bool)

(assert (=> b!827015 (= res!563768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827016 () Bool)

(declare-fun e!460662 () Bool)

(declare-fun e!460661 () Bool)

(declare-fun mapRes!24238 () Bool)

(assert (=> b!827016 (= e!460662 (and e!460661 mapRes!24238))))

(declare-fun condMapEmpty!24238 () Bool)

(declare-datatypes ((V!25099 0))(
  ( (V!25100 (val!7584 Int)) )
))
(declare-datatypes ((ValueCell!7121 0))(
  ( (ValueCellFull!7121 (v!10013 V!25099)) (EmptyCell!7121) )
))
(declare-datatypes ((array!46291 0))(
  ( (array!46292 (arr!22190 (Array (_ BitVec 32) ValueCell!7121)) (size!22611 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46291)

(declare-fun mapDefault!24238 () ValueCell!7121)

(assert (=> b!827016 (= condMapEmpty!24238 (= (arr!22190 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7121)) mapDefault!24238)))))

(declare-fun b!827017 () Bool)

(assert (=> b!827017 (= e!460660 false)))

(declare-fun zeroValueAfter!34 () V!25099)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!25099)

(declare-datatypes ((tuple2!10062 0))(
  ( (tuple2!10063 (_1!5042 (_ BitVec 64)) (_2!5042 V!25099)) )
))
(declare-datatypes ((List!15851 0))(
  ( (Nil!15848) (Cons!15847 (h!16976 tuple2!10062) (t!22191 List!15851)) )
))
(declare-datatypes ((ListLongMap!8875 0))(
  ( (ListLongMap!8876 (toList!4453 List!15851)) )
))
(declare-fun lt!374611 () ListLongMap!8875)

(declare-fun getCurrentListMapNoExtraKeys!2485 (array!46289 array!46291 (_ BitVec 32) (_ BitVec 32) V!25099 V!25099 (_ BitVec 32) Int) ListLongMap!8875)

(assert (=> b!827017 (= lt!374611 (getCurrentListMapNoExtraKeys!2485 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25099)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374612 () ListLongMap!8875)

(assert (=> b!827017 (= lt!374612 (getCurrentListMapNoExtraKeys!2485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827018 () Bool)

(declare-fun res!563770 () Bool)

(assert (=> b!827018 (=> (not res!563770) (not e!460660))))

(declare-datatypes ((List!15852 0))(
  ( (Nil!15849) (Cons!15848 (h!16977 (_ BitVec 64)) (t!22192 List!15852)) )
))
(declare-fun arrayNoDuplicates!0 (array!46289 (_ BitVec 32) List!15852) Bool)

(assert (=> b!827018 (= res!563770 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15849))))

(declare-fun res!563769 () Bool)

(assert (=> start!71196 (=> (not res!563769) (not e!460660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71196 (= res!563769 (validMask!0 mask!1312))))

(assert (=> start!71196 e!460660))

(assert (=> start!71196 tp_is_empty!15073))

(declare-fun array_inv!17747 (array!46289) Bool)

(assert (=> start!71196 (array_inv!17747 _keys!976)))

(assert (=> start!71196 true))

(declare-fun array_inv!17748 (array!46291) Bool)

(assert (=> start!71196 (and (array_inv!17748 _values!788) e!460662)))

(assert (=> start!71196 tp!46851))

(declare-fun b!827019 () Bool)

(declare-fun res!563767 () Bool)

(assert (=> b!827019 (=> (not res!563767) (not e!460660))))

(assert (=> b!827019 (= res!563767 (and (= (size!22611 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22610 _keys!976) (size!22611 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24238 () Bool)

(declare-fun tp!46852 () Bool)

(assert (=> mapNonEmpty!24238 (= mapRes!24238 (and tp!46852 e!460663))))

(declare-fun mapKey!24238 () (_ BitVec 32))

(declare-fun mapRest!24238 () (Array (_ BitVec 32) ValueCell!7121))

(declare-fun mapValue!24238 () ValueCell!7121)

(assert (=> mapNonEmpty!24238 (= (arr!22190 _values!788) (store mapRest!24238 mapKey!24238 mapValue!24238))))

(declare-fun b!827020 () Bool)

(assert (=> b!827020 (= e!460661 tp_is_empty!15073)))

(declare-fun mapIsEmpty!24238 () Bool)

(assert (=> mapIsEmpty!24238 mapRes!24238))

(assert (= (and start!71196 res!563769) b!827019))

(assert (= (and b!827019 res!563767) b!827015))

(assert (= (and b!827015 res!563768) b!827018))

(assert (= (and b!827018 res!563770) b!827017))

(assert (= (and b!827016 condMapEmpty!24238) mapIsEmpty!24238))

(assert (= (and b!827016 (not condMapEmpty!24238)) mapNonEmpty!24238))

(get-info :version)

(assert (= (and mapNonEmpty!24238 ((_ is ValueCellFull!7121) mapValue!24238)) b!827014))

(assert (= (and b!827016 ((_ is ValueCellFull!7121) mapDefault!24238)) b!827020))

(assert (= start!71196 b!827016))

(declare-fun m!769631 () Bool)

(assert (=> b!827017 m!769631))

(declare-fun m!769633 () Bool)

(assert (=> b!827017 m!769633))

(declare-fun m!769635 () Bool)

(assert (=> b!827018 m!769635))

(declare-fun m!769637 () Bool)

(assert (=> b!827015 m!769637))

(declare-fun m!769639 () Bool)

(assert (=> start!71196 m!769639))

(declare-fun m!769641 () Bool)

(assert (=> start!71196 m!769641))

(declare-fun m!769643 () Bool)

(assert (=> start!71196 m!769643))

(declare-fun m!769645 () Bool)

(assert (=> mapNonEmpty!24238 m!769645))

(check-sat (not mapNonEmpty!24238) tp_is_empty!15073 (not b!827018) (not b_next!13363) (not b!827015) (not b!827017) b_and!22275 (not start!71196))
(check-sat b_and!22275 (not b_next!13363))
