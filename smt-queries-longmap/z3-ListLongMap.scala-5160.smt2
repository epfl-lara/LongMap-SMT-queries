; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70100 () Bool)

(assert start!70100)

(declare-fun b_free!12367 () Bool)

(declare-fun b_next!12367 () Bool)

(assert (=> start!70100 (= b_free!12367 (not b_next!12367))))

(declare-fun tp!43813 () Bool)

(declare-fun b_and!21145 () Bool)

(assert (=> start!70100 (= tp!43813 b_and!21145)))

(declare-fun res!555780 () Bool)

(declare-fun e!450965 () Bool)

(assert (=> start!70100 (=> (not res!555780) (not e!450965))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70100 (= res!555780 (validMask!0 mask!1312))))

(assert (=> start!70100 e!450965))

(declare-fun tp_is_empty!14077 () Bool)

(assert (=> start!70100 tp_is_empty!14077))

(declare-datatypes ((array!44375 0))(
  ( (array!44376 (arr!21244 (Array (_ BitVec 32) (_ BitVec 64))) (size!21664 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44375)

(declare-fun array_inv!17071 (array!44375) Bool)

(assert (=> start!70100 (array_inv!17071 _keys!976)))

(assert (=> start!70100 true))

(declare-datatypes ((V!23771 0))(
  ( (V!23772 (val!7086 Int)) )
))
(declare-datatypes ((ValueCell!6623 0))(
  ( (ValueCellFull!6623 (v!9513 V!23771)) (EmptyCell!6623) )
))
(declare-datatypes ((array!44377 0))(
  ( (array!44378 (arr!21245 (Array (_ BitVec 32) ValueCell!6623)) (size!21665 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44377)

(declare-fun e!450967 () Bool)

(declare-fun array_inv!17072 (array!44377) Bool)

(assert (=> start!70100 (and (array_inv!17072 _values!788) e!450967)))

(assert (=> start!70100 tp!43813))

(declare-fun mapIsEmpty!22693 () Bool)

(declare-fun mapRes!22693 () Bool)

(assert (=> mapIsEmpty!22693 mapRes!22693))

(declare-fun b!813829 () Bool)

(declare-fun res!555778 () Bool)

(assert (=> b!813829 (=> (not res!555778) (not e!450965))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!813829 (= res!555778 (and (= (size!21665 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21664 _keys!976) (size!21665 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22693 () Bool)

(declare-fun tp!43812 () Bool)

(declare-fun e!450968 () Bool)

(assert (=> mapNonEmpty!22693 (= mapRes!22693 (and tp!43812 e!450968))))

(declare-fun mapKey!22693 () (_ BitVec 32))

(declare-fun mapRest!22693 () (Array (_ BitVec 32) ValueCell!6623))

(declare-fun mapValue!22693 () ValueCell!6623)

(assert (=> mapNonEmpty!22693 (= (arr!21245 _values!788) (store mapRest!22693 mapKey!22693 mapValue!22693))))

(declare-fun b!813830 () Bool)

(declare-fun e!450966 () Bool)

(assert (=> b!813830 (= e!450966 tp_is_empty!14077)))

(declare-fun b!813831 () Bool)

(assert (=> b!813831 (= e!450968 tp_is_empty!14077)))

(declare-fun b!813832 () Bool)

(declare-fun res!555781 () Bool)

(assert (=> b!813832 (=> (not res!555781) (not e!450965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44375 (_ BitVec 32)) Bool)

(assert (=> b!813832 (= res!555781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813833 () Bool)

(assert (=> b!813833 (= e!450967 (and e!450966 mapRes!22693))))

(declare-fun condMapEmpty!22693 () Bool)

(declare-fun mapDefault!22693 () ValueCell!6623)

(assert (=> b!813833 (= condMapEmpty!22693 (= (arr!21245 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6623)) mapDefault!22693)))))

(declare-fun b!813834 () Bool)

(declare-fun res!555779 () Bool)

(assert (=> b!813834 (=> (not res!555779) (not e!450965))))

(declare-datatypes ((List!15017 0))(
  ( (Nil!15014) (Cons!15013 (h!16148 (_ BitVec 64)) (t!21324 List!15017)) )
))
(declare-fun arrayNoDuplicates!0 (array!44375 (_ BitVec 32) List!15017) Bool)

(assert (=> b!813834 (= res!555779 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15014))))

(declare-fun b!813835 () Bool)

(assert (=> b!813835 (= e!450965 false)))

(declare-datatypes ((tuple2!9198 0))(
  ( (tuple2!9199 (_1!4610 (_ BitVec 64)) (_2!4610 V!23771)) )
))
(declare-datatypes ((List!15018 0))(
  ( (Nil!15015) (Cons!15014 (h!16149 tuple2!9198) (t!21325 List!15018)) )
))
(declare-datatypes ((ListLongMap!8023 0))(
  ( (ListLongMap!8024 (toList!4027 List!15018)) )
))
(declare-fun lt!364566 () ListLongMap!8023)

(declare-fun zeroValueBefore!34 () V!23771)

(declare-fun minValue!754 () V!23771)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2134 (array!44375 array!44377 (_ BitVec 32) (_ BitVec 32) V!23771 V!23771 (_ BitVec 32) Int) ListLongMap!8023)

(assert (=> b!813835 (= lt!364566 (getCurrentListMapNoExtraKeys!2134 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70100 res!555780) b!813829))

(assert (= (and b!813829 res!555778) b!813832))

(assert (= (and b!813832 res!555781) b!813834))

(assert (= (and b!813834 res!555779) b!813835))

(assert (= (and b!813833 condMapEmpty!22693) mapIsEmpty!22693))

(assert (= (and b!813833 (not condMapEmpty!22693)) mapNonEmpty!22693))

(get-info :version)

(assert (= (and mapNonEmpty!22693 ((_ is ValueCellFull!6623) mapValue!22693)) b!813831))

(assert (= (and b!813833 ((_ is ValueCellFull!6623) mapDefault!22693)) b!813830))

(assert (= start!70100 b!813833))

(declare-fun m!756427 () Bool)

(assert (=> b!813835 m!756427))

(declare-fun m!756429 () Bool)

(assert (=> b!813834 m!756429))

(declare-fun m!756431 () Bool)

(assert (=> start!70100 m!756431))

(declare-fun m!756433 () Bool)

(assert (=> start!70100 m!756433))

(declare-fun m!756435 () Bool)

(assert (=> start!70100 m!756435))

(declare-fun m!756437 () Bool)

(assert (=> b!813832 m!756437))

(declare-fun m!756439 () Bool)

(assert (=> mapNonEmpty!22693 m!756439))

(check-sat (not start!70100) b_and!21145 (not mapNonEmpty!22693) (not b!813832) (not b!813835) tp_is_empty!14077 (not b_next!12367) (not b!813834))
(check-sat b_and!21145 (not b_next!12367))
