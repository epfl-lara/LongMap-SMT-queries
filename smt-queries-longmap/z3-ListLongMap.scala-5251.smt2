; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70792 () Bool)

(assert start!70792)

(declare-fun b_free!12913 () Bool)

(declare-fun b_next!12913 () Bool)

(assert (=> start!70792 (= b_free!12913 (not b_next!12913))))

(declare-fun tp!45477 () Bool)

(declare-fun b_and!21777 () Bool)

(assert (=> start!70792 (= tp!45477 b_and!21777)))

(declare-fun b!821361 () Bool)

(declare-fun res!560148 () Bool)

(declare-fun e!456401 () Bool)

(assert (=> b!821361 (=> (not res!560148) (not e!456401))))

(declare-datatypes ((array!45447 0))(
  ( (array!45448 (arr!21771 (Array (_ BitVec 32) (_ BitVec 64))) (size!22191 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45447)

(declare-datatypes ((List!15407 0))(
  ( (Nil!15404) (Cons!15403 (h!16538 (_ BitVec 64)) (t!21732 List!15407)) )
))
(declare-fun arrayNoDuplicates!0 (array!45447 (_ BitVec 32) List!15407) Bool)

(assert (=> b!821361 (= res!560148 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15404))))

(declare-fun res!560150 () Bool)

(assert (=> start!70792 (=> (not res!560150) (not e!456401))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70792 (= res!560150 (validMask!0 mask!1312))))

(assert (=> start!70792 e!456401))

(declare-fun tp_is_empty!14623 () Bool)

(assert (=> start!70792 tp_is_empty!14623))

(declare-fun array_inv!17429 (array!45447) Bool)

(assert (=> start!70792 (array_inv!17429 _keys!976)))

(assert (=> start!70792 true))

(declare-datatypes ((V!24499 0))(
  ( (V!24500 (val!7359 Int)) )
))
(declare-datatypes ((ValueCell!6896 0))(
  ( (ValueCellFull!6896 (v!9790 V!24499)) (EmptyCell!6896) )
))
(declare-datatypes ((array!45449 0))(
  ( (array!45450 (arr!21772 (Array (_ BitVec 32) ValueCell!6896)) (size!22192 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45449)

(declare-fun e!456403 () Bool)

(declare-fun array_inv!17430 (array!45449) Bool)

(assert (=> start!70792 (and (array_inv!17430 _values!788) e!456403)))

(assert (=> start!70792 tp!45477))

(declare-fun b!821362 () Bool)

(declare-fun e!456405 () Bool)

(assert (=> b!821362 (= e!456405 tp_is_empty!14623)))

(declare-fun b!821363 () Bool)

(declare-fun e!456404 () Bool)

(assert (=> b!821363 (= e!456404 tp_is_empty!14623)))

(declare-fun mapIsEmpty!23539 () Bool)

(declare-fun mapRes!23539 () Bool)

(assert (=> mapIsEmpty!23539 mapRes!23539))

(declare-fun b!821364 () Bool)

(declare-fun res!560147 () Bool)

(assert (=> b!821364 (=> (not res!560147) (not e!456401))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821364 (= res!560147 (and (= (size!22192 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22191 _keys!976) (size!22192 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821365 () Bool)

(declare-fun res!560149 () Bool)

(assert (=> b!821365 (=> (not res!560149) (not e!456401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45447 (_ BitVec 32)) Bool)

(assert (=> b!821365 (= res!560149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821366 () Bool)

(assert (=> b!821366 (= e!456401 (not true))))

(declare-datatypes ((tuple2!9610 0))(
  ( (tuple2!9611 (_1!4816 (_ BitVec 64)) (_2!4816 V!24499)) )
))
(declare-datatypes ((List!15408 0))(
  ( (Nil!15405) (Cons!15404 (h!16539 tuple2!9610) (t!21733 List!15408)) )
))
(declare-datatypes ((ListLongMap!8435 0))(
  ( (ListLongMap!8436 (toList!4233 List!15408)) )
))
(declare-fun lt!369131 () ListLongMap!8435)

(declare-fun lt!369133 () ListLongMap!8435)

(assert (=> b!821366 (= lt!369131 lt!369133)))

(declare-fun zeroValueBefore!34 () V!24499)

(declare-fun zeroValueAfter!34 () V!24499)

(declare-fun minValue!754 () V!24499)

(declare-datatypes ((Unit!28018 0))(
  ( (Unit!28019) )
))
(declare-fun lt!369132 () Unit!28018)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!412 (array!45447 array!45449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24499 V!24499 V!24499 V!24499 (_ BitVec 32) Int) Unit!28018)

(assert (=> b!821366 (= lt!369132 (lemmaNoChangeToArrayThenSameMapNoExtras!412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2324 (array!45447 array!45449 (_ BitVec 32) (_ BitVec 32) V!24499 V!24499 (_ BitVec 32) Int) ListLongMap!8435)

(assert (=> b!821366 (= lt!369133 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821366 (= lt!369131 (getCurrentListMapNoExtraKeys!2324 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821367 () Bool)

(assert (=> b!821367 (= e!456403 (and e!456405 mapRes!23539))))

(declare-fun condMapEmpty!23539 () Bool)

(declare-fun mapDefault!23539 () ValueCell!6896)

(assert (=> b!821367 (= condMapEmpty!23539 (= (arr!21772 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6896)) mapDefault!23539)))))

(declare-fun mapNonEmpty!23539 () Bool)

(declare-fun tp!45478 () Bool)

(assert (=> mapNonEmpty!23539 (= mapRes!23539 (and tp!45478 e!456404))))

(declare-fun mapRest!23539 () (Array (_ BitVec 32) ValueCell!6896))

(declare-fun mapValue!23539 () ValueCell!6896)

(declare-fun mapKey!23539 () (_ BitVec 32))

(assert (=> mapNonEmpty!23539 (= (arr!21772 _values!788) (store mapRest!23539 mapKey!23539 mapValue!23539))))

(assert (= (and start!70792 res!560150) b!821364))

(assert (= (and b!821364 res!560147) b!821365))

(assert (= (and b!821365 res!560149) b!821361))

(assert (= (and b!821361 res!560148) b!821366))

(assert (= (and b!821367 condMapEmpty!23539) mapIsEmpty!23539))

(assert (= (and b!821367 (not condMapEmpty!23539)) mapNonEmpty!23539))

(get-info :version)

(assert (= (and mapNonEmpty!23539 ((_ is ValueCellFull!6896) mapValue!23539)) b!821363))

(assert (= (and b!821367 ((_ is ValueCellFull!6896) mapDefault!23539)) b!821362))

(assert (= start!70792 b!821367))

(declare-fun m!763699 () Bool)

(assert (=> b!821361 m!763699))

(declare-fun m!763701 () Bool)

(assert (=> start!70792 m!763701))

(declare-fun m!763703 () Bool)

(assert (=> start!70792 m!763703))

(declare-fun m!763705 () Bool)

(assert (=> start!70792 m!763705))

(declare-fun m!763707 () Bool)

(assert (=> b!821366 m!763707))

(declare-fun m!763709 () Bool)

(assert (=> b!821366 m!763709))

(declare-fun m!763711 () Bool)

(assert (=> b!821366 m!763711))

(declare-fun m!763713 () Bool)

(assert (=> b!821365 m!763713))

(declare-fun m!763715 () Bool)

(assert (=> mapNonEmpty!23539 m!763715))

(check-sat (not b!821366) (not mapNonEmpty!23539) b_and!21777 (not b!821361) (not start!70792) (not b_next!12913) (not b!821365) tp_is_empty!14623)
(check-sat b_and!21777 (not b_next!12913))
