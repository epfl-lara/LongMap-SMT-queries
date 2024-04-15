; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70284 () Bool)

(assert start!70284)

(declare-fun b_free!12679 () Bool)

(declare-fun b_next!12679 () Bool)

(assert (=> start!70284 (= b_free!12679 (not b_next!12679))))

(declare-fun tp!44760 () Bool)

(declare-fun b_and!21453 () Bool)

(assert (=> start!70284 (= tp!44760 b_and!21453)))

(declare-fun mapNonEmpty!23173 () Bool)

(declare-fun mapRes!23173 () Bool)

(declare-fun tp!44761 () Bool)

(declare-fun e!452985 () Bool)

(assert (=> mapNonEmpty!23173 (= mapRes!23173 (and tp!44761 e!452985))))

(declare-datatypes ((V!24187 0))(
  ( (V!24188 (val!7242 Int)) )
))
(declare-datatypes ((ValueCell!6779 0))(
  ( (ValueCellFull!6779 (v!9664 V!24187)) (EmptyCell!6779) )
))
(declare-datatypes ((array!44955 0))(
  ( (array!44956 (arr!21535 (Array (_ BitVec 32) ValueCell!6779)) (size!21956 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44955)

(declare-fun mapValue!23173 () ValueCell!6779)

(declare-fun mapKey!23173 () (_ BitVec 32))

(declare-fun mapRest!23173 () (Array (_ BitVec 32) ValueCell!6779))

(assert (=> mapNonEmpty!23173 (= (arr!21535 _values!788) (store mapRest!23173 mapKey!23173 mapValue!23173))))

(declare-fun b!816529 () Bool)

(declare-fun res!557509 () Bool)

(declare-fun e!452986 () Bool)

(assert (=> b!816529 (=> (not res!557509) (not e!452986))))

(declare-datatypes ((array!44957 0))(
  ( (array!44958 (arr!21536 (Array (_ BitVec 32) (_ BitVec 64))) (size!21957 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44957)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816529 (= res!557509 (and (= (size!21956 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21957 _keys!976) (size!21956 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816530 () Bool)

(declare-fun e!452981 () Bool)

(declare-fun tp_is_empty!14389 () Bool)

(assert (=> b!816530 (= e!452981 tp_is_empty!14389)))

(declare-fun b!816531 () Bool)

(declare-fun res!557510 () Bool)

(assert (=> b!816531 (=> (not res!557510) (not e!452986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44957 (_ BitVec 32)) Bool)

(assert (=> b!816531 (= res!557510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23173 () Bool)

(assert (=> mapIsEmpty!23173 mapRes!23173))

(declare-fun b!816532 () Bool)

(declare-fun e!452982 () Bool)

(assert (=> b!816532 (= e!452986 (not e!452982))))

(declare-fun res!557507 () Bool)

(assert (=> b!816532 (=> res!557507 e!452982)))

(assert (=> b!816532 (= res!557507 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9530 0))(
  ( (tuple2!9531 (_1!4776 (_ BitVec 64)) (_2!4776 V!24187)) )
))
(declare-datatypes ((List!15354 0))(
  ( (Nil!15351) (Cons!15350 (h!16479 tuple2!9530) (t!21668 List!15354)) )
))
(declare-datatypes ((ListLongMap!8343 0))(
  ( (ListLongMap!8344 (toList!4187 List!15354)) )
))
(declare-fun lt!365644 () ListLongMap!8343)

(declare-fun lt!365640 () ListLongMap!8343)

(assert (=> b!816532 (= lt!365644 lt!365640)))

(declare-fun zeroValueBefore!34 () V!24187)

(declare-fun zeroValueAfter!34 () V!24187)

(declare-fun minValue!754 () V!24187)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27802 0))(
  ( (Unit!27803) )
))
(declare-fun lt!365643 () Unit!27802)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!341 (array!44957 array!44955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 V!24187 V!24187 (_ BitVec 32) Int) Unit!27802)

(assert (=> b!816532 (= lt!365643 (lemmaNoChangeToArrayThenSameMapNoExtras!341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2248 (array!44957 array!44955 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8343)

(assert (=> b!816532 (= lt!365640 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816532 (= lt!365644 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557508 () Bool)

(assert (=> start!70284 (=> (not res!557508) (not e!452986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70284 (= res!557508 (validMask!0 mask!1312))))

(assert (=> start!70284 e!452986))

(assert (=> start!70284 tp_is_empty!14389))

(declare-fun array_inv!17307 (array!44957) Bool)

(assert (=> start!70284 (array_inv!17307 _keys!976)))

(assert (=> start!70284 true))

(declare-fun e!452983 () Bool)

(declare-fun array_inv!17308 (array!44955) Bool)

(assert (=> start!70284 (and (array_inv!17308 _values!788) e!452983)))

(assert (=> start!70284 tp!44760))

(declare-fun b!816533 () Bool)

(declare-fun res!557506 () Bool)

(assert (=> b!816533 (=> (not res!557506) (not e!452986))))

(declare-datatypes ((List!15355 0))(
  ( (Nil!15352) (Cons!15351 (h!16480 (_ BitVec 64)) (t!21669 List!15355)) )
))
(declare-fun arrayNoDuplicates!0 (array!44957 (_ BitVec 32) List!15355) Bool)

(assert (=> b!816533 (= res!557506 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15352))))

(declare-fun b!816534 () Bool)

(assert (=> b!816534 (= e!452983 (and e!452981 mapRes!23173))))

(declare-fun condMapEmpty!23173 () Bool)

(declare-fun mapDefault!23173 () ValueCell!6779)

(assert (=> b!816534 (= condMapEmpty!23173 (= (arr!21535 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6779)) mapDefault!23173)))))

(declare-fun b!816535 () Bool)

(assert (=> b!816535 (= e!452985 tp_is_empty!14389)))

(declare-fun b!816536 () Bool)

(assert (=> b!816536 (= e!452982 true)))

(declare-fun lt!365641 () ListLongMap!8343)

(declare-fun getCurrentListMap!2359 (array!44957 array!44955 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8343)

(assert (=> b!816536 (= lt!365641 (getCurrentListMap!2359 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365642 () ListLongMap!8343)

(declare-fun +!1847 (ListLongMap!8343 tuple2!9530) ListLongMap!8343)

(assert (=> b!816536 (= lt!365642 (+!1847 (getCurrentListMap!2359 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70284 res!557508) b!816529))

(assert (= (and b!816529 res!557509) b!816531))

(assert (= (and b!816531 res!557510) b!816533))

(assert (= (and b!816533 res!557506) b!816532))

(assert (= (and b!816532 (not res!557507)) b!816536))

(assert (= (and b!816534 condMapEmpty!23173) mapIsEmpty!23173))

(assert (= (and b!816534 (not condMapEmpty!23173)) mapNonEmpty!23173))

(get-info :version)

(assert (= (and mapNonEmpty!23173 ((_ is ValueCellFull!6779) mapValue!23173)) b!816535))

(assert (= (and b!816534 ((_ is ValueCellFull!6779) mapDefault!23173)) b!816530))

(assert (= start!70284 b!816534))

(declare-fun m!757655 () Bool)

(assert (=> start!70284 m!757655))

(declare-fun m!757657 () Bool)

(assert (=> start!70284 m!757657))

(declare-fun m!757659 () Bool)

(assert (=> start!70284 m!757659))

(declare-fun m!757661 () Bool)

(assert (=> b!816532 m!757661))

(declare-fun m!757663 () Bool)

(assert (=> b!816532 m!757663))

(declare-fun m!757665 () Bool)

(assert (=> b!816532 m!757665))

(declare-fun m!757667 () Bool)

(assert (=> b!816536 m!757667))

(declare-fun m!757669 () Bool)

(assert (=> b!816536 m!757669))

(assert (=> b!816536 m!757669))

(declare-fun m!757671 () Bool)

(assert (=> b!816536 m!757671))

(declare-fun m!757673 () Bool)

(assert (=> mapNonEmpty!23173 m!757673))

(declare-fun m!757675 () Bool)

(assert (=> b!816531 m!757675))

(declare-fun m!757677 () Bool)

(assert (=> b!816533 m!757677))

(check-sat b_and!21453 (not b!816533) (not b!816532) (not start!70284) (not mapNonEmpty!23173) (not b!816531) tp_is_empty!14389 (not b_next!12679) (not b!816536))
(check-sat b_and!21453 (not b_next!12679))
