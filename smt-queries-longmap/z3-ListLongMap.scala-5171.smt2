; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70014 () Bool)

(assert start!70014)

(declare-fun b_free!12435 () Bool)

(declare-fun b_next!12435 () Bool)

(assert (=> start!70014 (= b_free!12435 (not b_next!12435))))

(declare-fun tp!44019 () Bool)

(declare-fun b_and!21207 () Bool)

(assert (=> start!70014 (= tp!44019 b_and!21207)))

(declare-fun mapNonEmpty!22798 () Bool)

(declare-fun mapRes!22798 () Bool)

(declare-fun tp!44020 () Bool)

(declare-fun e!450944 () Bool)

(assert (=> mapNonEmpty!22798 (= mapRes!22798 (and tp!44020 e!450944))))

(declare-datatypes ((V!23861 0))(
  ( (V!23862 (val!7120 Int)) )
))
(declare-datatypes ((ValueCell!6657 0))(
  ( (ValueCellFull!6657 (v!9547 V!23861)) (EmptyCell!6657) )
))
(declare-fun mapRest!22798 () (Array (_ BitVec 32) ValueCell!6657))

(declare-datatypes ((array!44498 0))(
  ( (array!44499 (arr!21309 (Array (_ BitVec 32) ValueCell!6657)) (size!21730 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44498)

(declare-fun mapValue!22798 () ValueCell!6657)

(declare-fun mapKey!22798 () (_ BitVec 32))

(assert (=> mapNonEmpty!22798 (= (arr!21309 _values!788) (store mapRest!22798 mapKey!22798 mapValue!22798))))

(declare-fun mapIsEmpty!22798 () Bool)

(assert (=> mapIsEmpty!22798 mapRes!22798))

(declare-fun b!813722 () Bool)

(declare-fun e!450947 () Bool)

(declare-fun e!450945 () Bool)

(assert (=> b!813722 (= e!450947 (and e!450945 mapRes!22798))))

(declare-fun condMapEmpty!22798 () Bool)

(declare-fun mapDefault!22798 () ValueCell!6657)

(assert (=> b!813722 (= condMapEmpty!22798 (= (arr!21309 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6657)) mapDefault!22798)))))

(declare-fun b!813723 () Bool)

(declare-fun e!450946 () Bool)

(assert (=> b!813723 (= e!450946 false)))

(declare-datatypes ((array!44500 0))(
  ( (array!44501 (arr!21310 (Array (_ BitVec 32) (_ BitVec 64))) (size!21731 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44500)

(declare-fun zeroValueAfter!34 () V!23861)

(declare-fun minValue!754 () V!23861)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9326 0))(
  ( (tuple2!9327 (_1!4674 (_ BitVec 64)) (_2!4674 V!23861)) )
))
(declare-datatypes ((List!15158 0))(
  ( (Nil!15155) (Cons!15154 (h!16283 tuple2!9326) (t!21475 List!15158)) )
))
(declare-datatypes ((ListLongMap!8149 0))(
  ( (ListLongMap!8150 (toList!4090 List!15158)) )
))
(declare-fun lt!364377 () ListLongMap!8149)

(declare-fun getCurrentListMapNoExtraKeys!2140 (array!44500 array!44498 (_ BitVec 32) (_ BitVec 32) V!23861 V!23861 (_ BitVec 32) Int) ListLongMap!8149)

(assert (=> b!813723 (= lt!364377 (getCurrentListMapNoExtraKeys!2140 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23861)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364376 () ListLongMap!8149)

(assert (=> b!813723 (= lt!364376 (getCurrentListMapNoExtraKeys!2140 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813724 () Bool)

(declare-fun res!555868 () Bool)

(assert (=> b!813724 (=> (not res!555868) (not e!450946))))

(declare-datatypes ((List!15159 0))(
  ( (Nil!15156) (Cons!15155 (h!16284 (_ BitVec 64)) (t!21476 List!15159)) )
))
(declare-fun arrayNoDuplicates!0 (array!44500 (_ BitVec 32) List!15159) Bool)

(assert (=> b!813724 (= res!555868 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15156))))

(declare-fun b!813725 () Bool)

(declare-fun res!555869 () Bool)

(assert (=> b!813725 (=> (not res!555869) (not e!450946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44500 (_ BitVec 32)) Bool)

(assert (=> b!813725 (= res!555869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813727 () Bool)

(declare-fun res!555867 () Bool)

(assert (=> b!813727 (=> (not res!555867) (not e!450946))))

(assert (=> b!813727 (= res!555867 (and (= (size!21730 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21731 _keys!976) (size!21730 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813728 () Bool)

(declare-fun tp_is_empty!14145 () Bool)

(assert (=> b!813728 (= e!450945 tp_is_empty!14145)))

(declare-fun b!813726 () Bool)

(assert (=> b!813726 (= e!450944 tp_is_empty!14145)))

(declare-fun res!555870 () Bool)

(assert (=> start!70014 (=> (not res!555870) (not e!450946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70014 (= res!555870 (validMask!0 mask!1312))))

(assert (=> start!70014 e!450946))

(assert (=> start!70014 tp_is_empty!14145))

(declare-fun array_inv!17063 (array!44500) Bool)

(assert (=> start!70014 (array_inv!17063 _keys!976)))

(assert (=> start!70014 true))

(declare-fun array_inv!17064 (array!44498) Bool)

(assert (=> start!70014 (and (array_inv!17064 _values!788) e!450947)))

(assert (=> start!70014 tp!44019))

(assert (= (and start!70014 res!555870) b!813727))

(assert (= (and b!813727 res!555867) b!813725))

(assert (= (and b!813725 res!555869) b!813724))

(assert (= (and b!813724 res!555868) b!813723))

(assert (= (and b!813722 condMapEmpty!22798) mapIsEmpty!22798))

(assert (= (and b!813722 (not condMapEmpty!22798)) mapNonEmpty!22798))

(get-info :version)

(assert (= (and mapNonEmpty!22798 ((_ is ValueCellFull!6657) mapValue!22798)) b!813726))

(assert (= (and b!813722 ((_ is ValueCellFull!6657) mapDefault!22798)) b!813728))

(assert (= start!70014 b!813722))

(declare-fun m!755685 () Bool)

(assert (=> b!813724 m!755685))

(declare-fun m!755687 () Bool)

(assert (=> b!813725 m!755687))

(declare-fun m!755689 () Bool)

(assert (=> mapNonEmpty!22798 m!755689))

(declare-fun m!755691 () Bool)

(assert (=> start!70014 m!755691))

(declare-fun m!755693 () Bool)

(assert (=> start!70014 m!755693))

(declare-fun m!755695 () Bool)

(assert (=> start!70014 m!755695))

(declare-fun m!755697 () Bool)

(assert (=> b!813723 m!755697))

(declare-fun m!755699 () Bool)

(assert (=> b!813723 m!755699))

(check-sat (not b!813724) (not b!813725) (not b_next!12435) (not start!70014) (not b!813723) (not mapNonEmpty!22798) b_and!21207 tp_is_empty!14145)
(check-sat b_and!21207 (not b_next!12435))
