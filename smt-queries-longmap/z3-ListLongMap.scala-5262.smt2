; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70686 () Bool)

(assert start!70686)

(declare-fun b_free!12979 () Bool)

(declare-fun b_next!12979 () Bool)

(assert (=> start!70686 (= b_free!12979 (not b_next!12979))))

(declare-fun tp!45678 () Bool)

(declare-fun b_and!21815 () Bool)

(assert (=> start!70686 (= tp!45678 b_and!21815)))

(declare-fun b!821019 () Bool)

(declare-fun e!456243 () Bool)

(assert (=> b!821019 (= e!456243 true)))

(declare-datatypes ((V!24587 0))(
  ( (V!24588 (val!7392 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24587)

(declare-datatypes ((array!45545 0))(
  ( (array!45546 (arr!21824 (Array (_ BitVec 32) (_ BitVec 64))) (size!22245 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45545)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24587)

(declare-datatypes ((ValueCell!6929 0))(
  ( (ValueCellFull!6929 (v!9817 V!24587)) (EmptyCell!6929) )
))
(declare-datatypes ((array!45547 0))(
  ( (array!45548 (arr!21825 (Array (_ BitVec 32) ValueCell!6929)) (size!22246 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45547)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9762 0))(
  ( (tuple2!9763 (_1!4892 (_ BitVec 64)) (_2!4892 V!24587)) )
))
(declare-datatypes ((List!15572 0))(
  ( (Nil!15569) (Cons!15568 (h!16697 tuple2!9762) (t!21898 List!15572)) )
))
(declare-datatypes ((ListLongMap!8575 0))(
  ( (ListLongMap!8576 (toList!4303 List!15572)) )
))
(declare-fun lt!368894 () ListLongMap!8575)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2431 (array!45545 array!45547 (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!821019 (= lt!368894 (getCurrentListMap!2431 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821020 () Bool)

(declare-fun e!456248 () Bool)

(declare-fun e!456247 () Bool)

(declare-fun mapRes!23641 () Bool)

(assert (=> b!821020 (= e!456248 (and e!456247 mapRes!23641))))

(declare-fun condMapEmpty!23641 () Bool)

(declare-fun mapDefault!23641 () ValueCell!6929)

(assert (=> b!821020 (= condMapEmpty!23641 (= (arr!21825 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6929)) mapDefault!23641)))))

(declare-fun b!821021 () Bool)

(declare-fun res!560142 () Bool)

(declare-fun e!456244 () Bool)

(assert (=> b!821021 (=> (not res!560142) (not e!456244))))

(declare-datatypes ((List!15573 0))(
  ( (Nil!15570) (Cons!15569 (h!16698 (_ BitVec 64)) (t!21899 List!15573)) )
))
(declare-fun arrayNoDuplicates!0 (array!45545 (_ BitVec 32) List!15573) Bool)

(assert (=> b!821021 (= res!560142 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15570))))

(declare-fun b!821022 () Bool)

(declare-fun tp_is_empty!14689 () Bool)

(assert (=> b!821022 (= e!456247 tp_is_empty!14689)))

(declare-fun b!821023 () Bool)

(declare-fun res!560145 () Bool)

(assert (=> b!821023 (=> (not res!560145) (not e!456244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45545 (_ BitVec 32)) Bool)

(assert (=> b!821023 (= res!560145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23641 () Bool)

(assert (=> mapIsEmpty!23641 mapRes!23641))

(declare-fun b!821024 () Bool)

(assert (=> b!821024 (= e!456244 (not e!456243))))

(declare-fun res!560144 () Bool)

(assert (=> b!821024 (=> res!560144 e!456243)))

(assert (=> b!821024 (= res!560144 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!368891 () ListLongMap!8575)

(declare-fun lt!368892 () ListLongMap!8575)

(assert (=> b!821024 (= lt!368891 lt!368892)))

(declare-fun zeroValueAfter!34 () V!24587)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28031 0))(
  ( (Unit!28032) )
))
(declare-fun lt!368893 () Unit!28031)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!446 (array!45545 array!45547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 V!24587 V!24587 (_ BitVec 32) Int) Unit!28031)

(assert (=> b!821024 (= lt!368893 (lemmaNoChangeToArrayThenSameMapNoExtras!446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2353 (array!45545 array!45547 (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!821024 (= lt!368892 (getCurrentListMapNoExtraKeys!2353 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821024 (= lt!368891 (getCurrentListMapNoExtraKeys!2353 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821025 () Bool)

(declare-fun e!456246 () Bool)

(assert (=> b!821025 (= e!456246 tp_is_empty!14689)))

(declare-fun res!560143 () Bool)

(assert (=> start!70686 (=> (not res!560143) (not e!456244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70686 (= res!560143 (validMask!0 mask!1312))))

(assert (=> start!70686 e!456244))

(assert (=> start!70686 tp_is_empty!14689))

(declare-fun array_inv!17511 (array!45545) Bool)

(assert (=> start!70686 (array_inv!17511 _keys!976)))

(assert (=> start!70686 true))

(declare-fun array_inv!17512 (array!45547) Bool)

(assert (=> start!70686 (and (array_inv!17512 _values!788) e!456248)))

(assert (=> start!70686 tp!45678))

(declare-fun mapNonEmpty!23641 () Bool)

(declare-fun tp!45679 () Bool)

(assert (=> mapNonEmpty!23641 (= mapRes!23641 (and tp!45679 e!456246))))

(declare-fun mapRest!23641 () (Array (_ BitVec 32) ValueCell!6929))

(declare-fun mapKey!23641 () (_ BitVec 32))

(declare-fun mapValue!23641 () ValueCell!6929)

(assert (=> mapNonEmpty!23641 (= (arr!21825 _values!788) (store mapRest!23641 mapKey!23641 mapValue!23641))))

(declare-fun b!821026 () Bool)

(declare-fun res!560146 () Bool)

(assert (=> b!821026 (=> (not res!560146) (not e!456244))))

(assert (=> b!821026 (= res!560146 (and (= (size!22246 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22245 _keys!976) (size!22246 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70686 res!560143) b!821026))

(assert (= (and b!821026 res!560146) b!821023))

(assert (= (and b!821023 res!560145) b!821021))

(assert (= (and b!821021 res!560142) b!821024))

(assert (= (and b!821024 (not res!560144)) b!821019))

(assert (= (and b!821020 condMapEmpty!23641) mapIsEmpty!23641))

(assert (= (and b!821020 (not condMapEmpty!23641)) mapNonEmpty!23641))

(get-info :version)

(assert (= (and mapNonEmpty!23641 ((_ is ValueCellFull!6929) mapValue!23641)) b!821025))

(assert (= (and b!821020 ((_ is ValueCellFull!6929) mapDefault!23641)) b!821022))

(assert (= start!70686 b!821020))

(declare-fun m!762337 () Bool)

(assert (=> b!821019 m!762337))

(declare-fun m!762339 () Bool)

(assert (=> b!821023 m!762339))

(declare-fun m!762341 () Bool)

(assert (=> b!821021 m!762341))

(declare-fun m!762343 () Bool)

(assert (=> b!821024 m!762343))

(declare-fun m!762345 () Bool)

(assert (=> b!821024 m!762345))

(declare-fun m!762347 () Bool)

(assert (=> b!821024 m!762347))

(declare-fun m!762349 () Bool)

(assert (=> start!70686 m!762349))

(declare-fun m!762351 () Bool)

(assert (=> start!70686 m!762351))

(declare-fun m!762353 () Bool)

(assert (=> start!70686 m!762353))

(declare-fun m!762355 () Bool)

(assert (=> mapNonEmpty!23641 m!762355))

(check-sat (not b!821023) tp_is_empty!14689 (not start!70686) (not mapNonEmpty!23641) (not b!821019) (not b!821024) (not b_next!12979) b_and!21815 (not b!821021))
(check-sat b_and!21815 (not b_next!12979))
