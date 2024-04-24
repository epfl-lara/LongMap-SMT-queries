; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70470 () Bool)

(assert start!70470)

(declare-fun b_free!12679 () Bool)

(declare-fun b_next!12679 () Bool)

(assert (=> start!70470 (= b_free!12679 (not b_next!12679))))

(declare-fun tp!44761 () Bool)

(declare-fun b_and!21489 () Bool)

(assert (=> start!70470 (= tp!44761 b_and!21489)))

(declare-fun b!817669 () Bool)

(declare-fun res!557959 () Bool)

(declare-fun e!453711 () Bool)

(assert (=> b!817669 (=> (not res!557959) (not e!453711))))

(declare-datatypes ((array!44979 0))(
  ( (array!44980 (arr!21542 (Array (_ BitVec 32) (_ BitVec 64))) (size!21962 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44979)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24187 0))(
  ( (V!24188 (val!7242 Int)) )
))
(declare-datatypes ((ValueCell!6779 0))(
  ( (ValueCellFull!6779 (v!9670 V!24187)) (EmptyCell!6779) )
))
(declare-datatypes ((array!44981 0))(
  ( (array!44982 (arr!21543 (Array (_ BitVec 32) ValueCell!6779)) (size!21963 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44981)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817669 (= res!557959 (and (= (size!21963 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21962 _keys!976) (size!21963 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817670 () Bool)

(declare-fun e!453709 () Bool)

(assert (=> b!817670 (= e!453709 true)))

(declare-fun zeroValueAfter!34 () V!24187)

(declare-fun minValue!754 () V!24187)

(declare-datatypes ((tuple2!9426 0))(
  ( (tuple2!9427 (_1!4724 (_ BitVec 64)) (_2!4724 V!24187)) )
))
(declare-datatypes ((List!15238 0))(
  ( (Nil!15235) (Cons!15234 (h!16369 tuple2!9426) (t!21553 List!15238)) )
))
(declare-datatypes ((ListLongMap!8251 0))(
  ( (ListLongMap!8252 (toList!4141 List!15238)) )
))
(declare-fun lt!366240 () ListLongMap!8251)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2358 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8251)

(assert (=> b!817670 (= lt!366240 (getCurrentListMap!2358 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24187)

(declare-fun lt!366239 () ListLongMap!8251)

(declare-fun +!1818 (ListLongMap!8251 tuple2!9426) ListLongMap!8251)

(assert (=> b!817670 (= lt!366239 (+!1818 (getCurrentListMap!2358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!817671 () Bool)

(declare-fun e!453712 () Bool)

(declare-fun e!453710 () Bool)

(declare-fun mapRes!23173 () Bool)

(assert (=> b!817671 (= e!453712 (and e!453710 mapRes!23173))))

(declare-fun condMapEmpty!23173 () Bool)

(declare-fun mapDefault!23173 () ValueCell!6779)

(assert (=> b!817671 (= condMapEmpty!23173 (= (arr!21543 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6779)) mapDefault!23173)))))

(declare-fun b!817672 () Bool)

(declare-fun e!453713 () Bool)

(declare-fun tp_is_empty!14389 () Bool)

(assert (=> b!817672 (= e!453713 tp_is_empty!14389)))

(declare-fun res!557958 () Bool)

(assert (=> start!70470 (=> (not res!557958) (not e!453711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70470 (= res!557958 (validMask!0 mask!1312))))

(assert (=> start!70470 e!453711))

(assert (=> start!70470 tp_is_empty!14389))

(declare-fun array_inv!17265 (array!44979) Bool)

(assert (=> start!70470 (array_inv!17265 _keys!976)))

(assert (=> start!70470 true))

(declare-fun array_inv!17266 (array!44981) Bool)

(assert (=> start!70470 (and (array_inv!17266 _values!788) e!453712)))

(assert (=> start!70470 tp!44761))

(declare-fun b!817673 () Bool)

(assert (=> b!817673 (= e!453710 tp_is_empty!14389)))

(declare-fun b!817674 () Bool)

(assert (=> b!817674 (= e!453711 (not e!453709))))

(declare-fun res!557960 () Bool)

(assert (=> b!817674 (=> res!557960 e!453709)))

(assert (=> b!817674 (= res!557960 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!366237 () ListLongMap!8251)

(declare-fun lt!366238 () ListLongMap!8251)

(assert (=> b!817674 (= lt!366237 lt!366238)))

(declare-datatypes ((Unit!27837 0))(
  ( (Unit!27838) )
))
(declare-fun lt!366241 () Unit!27837)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!329 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 V!24187 V!24187 (_ BitVec 32) Int) Unit!27837)

(assert (=> b!817674 (= lt!366241 (lemmaNoChangeToArrayThenSameMapNoExtras!329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2241 (array!44979 array!44981 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8251)

(assert (=> b!817674 (= lt!366238 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817674 (= lt!366237 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23173 () Bool)

(assert (=> mapIsEmpty!23173 mapRes!23173))

(declare-fun b!817675 () Bool)

(declare-fun res!557962 () Bool)

(assert (=> b!817675 (=> (not res!557962) (not e!453711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44979 (_ BitVec 32)) Bool)

(assert (=> b!817675 (= res!557962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817676 () Bool)

(declare-fun res!557961 () Bool)

(assert (=> b!817676 (=> (not res!557961) (not e!453711))))

(declare-datatypes ((List!15239 0))(
  ( (Nil!15236) (Cons!15235 (h!16370 (_ BitVec 64)) (t!21554 List!15239)) )
))
(declare-fun arrayNoDuplicates!0 (array!44979 (_ BitVec 32) List!15239) Bool)

(assert (=> b!817676 (= res!557961 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15236))))

(declare-fun mapNonEmpty!23173 () Bool)

(declare-fun tp!44760 () Bool)

(assert (=> mapNonEmpty!23173 (= mapRes!23173 (and tp!44760 e!453713))))

(declare-fun mapRest!23173 () (Array (_ BitVec 32) ValueCell!6779))

(declare-fun mapValue!23173 () ValueCell!6779)

(declare-fun mapKey!23173 () (_ BitVec 32))

(assert (=> mapNonEmpty!23173 (= (arr!21543 _values!788) (store mapRest!23173 mapKey!23173 mapValue!23173))))

(assert (= (and start!70470 res!557958) b!817669))

(assert (= (and b!817669 res!557959) b!817675))

(assert (= (and b!817675 res!557962) b!817676))

(assert (= (and b!817676 res!557961) b!817674))

(assert (= (and b!817674 (not res!557960)) b!817670))

(assert (= (and b!817671 condMapEmpty!23173) mapIsEmpty!23173))

(assert (= (and b!817671 (not condMapEmpty!23173)) mapNonEmpty!23173))

(get-info :version)

(assert (= (and mapNonEmpty!23173 ((_ is ValueCellFull!6779) mapValue!23173)) b!817672))

(assert (= (and b!817671 ((_ is ValueCellFull!6779) mapDefault!23173)) b!817673))

(assert (= start!70470 b!817671))

(declare-fun m!759689 () Bool)

(assert (=> b!817670 m!759689))

(declare-fun m!759691 () Bool)

(assert (=> b!817670 m!759691))

(assert (=> b!817670 m!759691))

(declare-fun m!759693 () Bool)

(assert (=> b!817670 m!759693))

(declare-fun m!759695 () Bool)

(assert (=> start!70470 m!759695))

(declare-fun m!759697 () Bool)

(assert (=> start!70470 m!759697))

(declare-fun m!759699 () Bool)

(assert (=> start!70470 m!759699))

(declare-fun m!759701 () Bool)

(assert (=> mapNonEmpty!23173 m!759701))

(declare-fun m!759703 () Bool)

(assert (=> b!817676 m!759703))

(declare-fun m!759705 () Bool)

(assert (=> b!817674 m!759705))

(declare-fun m!759707 () Bool)

(assert (=> b!817674 m!759707))

(declare-fun m!759709 () Bool)

(assert (=> b!817674 m!759709))

(declare-fun m!759711 () Bool)

(assert (=> b!817675 m!759711))

(check-sat tp_is_empty!14389 (not b!817674) (not b!817676) b_and!21489 (not b_next!12679) (not b!817670) (not start!70470) (not mapNonEmpty!23173) (not b!817675))
(check-sat b_and!21489 (not b_next!12679))
