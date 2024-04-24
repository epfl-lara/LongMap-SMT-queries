; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70306 () Bool)

(assert start!70306)

(declare-fun b_free!12547 () Bool)

(declare-fun b_next!12547 () Bool)

(assert (=> start!70306 (= b_free!12547 (not b_next!12547))))

(declare-fun tp!44359 () Bool)

(declare-fun b_and!21337 () Bool)

(assert (=> start!70306 (= tp!44359 b_and!21337)))

(declare-fun mapIsEmpty!22969 () Bool)

(declare-fun mapRes!22969 () Bool)

(assert (=> mapIsEmpty!22969 mapRes!22969))

(declare-fun b!815878 () Bool)

(declare-fun e!452418 () Bool)

(assert (=> b!815878 (= e!452418 (not true))))

(declare-datatypes ((V!24011 0))(
  ( (V!24012 (val!7176 Int)) )
))
(declare-datatypes ((tuple2!9324 0))(
  ( (tuple2!9325 (_1!4673 (_ BitVec 64)) (_2!4673 V!24011)) )
))
(declare-datatypes ((List!15142 0))(
  ( (Nil!15139) (Cons!15138 (h!16273 tuple2!9324) (t!21453 List!15142)) )
))
(declare-datatypes ((ListLongMap!8149 0))(
  ( (ListLongMap!8150 (toList!4090 List!15142)) )
))
(declare-fun lt!365209 () ListLongMap!8149)

(declare-fun lt!365207 () ListLongMap!8149)

(assert (=> b!815878 (= lt!365209 lt!365207)))

(declare-fun zeroValueBefore!34 () V!24011)

(declare-datatypes ((array!44715 0))(
  ( (array!44716 (arr!21412 (Array (_ BitVec 32) (_ BitVec 64))) (size!21832 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44715)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24011)

(declare-fun minValue!754 () V!24011)

(declare-datatypes ((ValueCell!6713 0))(
  ( (ValueCellFull!6713 (v!9603 V!24011)) (EmptyCell!6713) )
))
(declare-datatypes ((array!44717 0))(
  ( (array!44718 (arr!21413 (Array (_ BitVec 32) ValueCell!6713)) (size!21833 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44717)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27747 0))(
  ( (Unit!27748) )
))
(declare-fun lt!365208 () Unit!27747)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!285 (array!44715 array!44717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 V!24011 V!24011 (_ BitVec 32) Int) Unit!27747)

(assert (=> b!815878 (= lt!365208 (lemmaNoChangeToArrayThenSameMapNoExtras!285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2197 (array!44715 array!44717 (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 (_ BitVec 32) Int) ListLongMap!8149)

(assert (=> b!815878 (= lt!365207 (getCurrentListMapNoExtraKeys!2197 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815878 (= lt!365209 (getCurrentListMapNoExtraKeys!2197 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22969 () Bool)

(declare-fun tp!44358 () Bool)

(declare-fun e!452417 () Bool)

(assert (=> mapNonEmpty!22969 (= mapRes!22969 (and tp!44358 e!452417))))

(declare-fun mapValue!22969 () ValueCell!6713)

(declare-fun mapRest!22969 () (Array (_ BitVec 32) ValueCell!6713))

(declare-fun mapKey!22969 () (_ BitVec 32))

(assert (=> mapNonEmpty!22969 (= (arr!21413 _values!788) (store mapRest!22969 mapKey!22969 mapValue!22969))))

(declare-fun b!815879 () Bool)

(declare-fun res!556916 () Bool)

(assert (=> b!815879 (=> (not res!556916) (not e!452418))))

(declare-datatypes ((List!15143 0))(
  ( (Nil!15140) (Cons!15139 (h!16274 (_ BitVec 64)) (t!21454 List!15143)) )
))
(declare-fun arrayNoDuplicates!0 (array!44715 (_ BitVec 32) List!15143) Bool)

(assert (=> b!815879 (= res!556916 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15140))))

(declare-fun b!815880 () Bool)

(declare-fun e!452421 () Bool)

(declare-fun tp_is_empty!14257 () Bool)

(assert (=> b!815880 (= e!452421 tp_is_empty!14257)))

(declare-fun b!815881 () Bool)

(declare-fun res!556918 () Bool)

(assert (=> b!815881 (=> (not res!556918) (not e!452418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44715 (_ BitVec 32)) Bool)

(assert (=> b!815881 (= res!556918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556917 () Bool)

(assert (=> start!70306 (=> (not res!556917) (not e!452418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70306 (= res!556917 (validMask!0 mask!1312))))

(assert (=> start!70306 e!452418))

(assert (=> start!70306 tp_is_empty!14257))

(declare-fun array_inv!17179 (array!44715) Bool)

(assert (=> start!70306 (array_inv!17179 _keys!976)))

(assert (=> start!70306 true))

(declare-fun e!452419 () Bool)

(declare-fun array_inv!17180 (array!44717) Bool)

(assert (=> start!70306 (and (array_inv!17180 _values!788) e!452419)))

(assert (=> start!70306 tp!44359))

(declare-fun b!815877 () Bool)

(assert (=> b!815877 (= e!452419 (and e!452421 mapRes!22969))))

(declare-fun condMapEmpty!22969 () Bool)

(declare-fun mapDefault!22969 () ValueCell!6713)

(assert (=> b!815877 (= condMapEmpty!22969 (= (arr!21413 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6713)) mapDefault!22969)))))

(declare-fun b!815882 () Bool)

(declare-fun res!556919 () Bool)

(assert (=> b!815882 (=> (not res!556919) (not e!452418))))

(assert (=> b!815882 (= res!556919 (and (= (size!21833 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21832 _keys!976) (size!21833 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815883 () Bool)

(assert (=> b!815883 (= e!452417 tp_is_empty!14257)))

(assert (= (and start!70306 res!556917) b!815882))

(assert (= (and b!815882 res!556919) b!815881))

(assert (= (and b!815881 res!556918) b!815879))

(assert (= (and b!815879 res!556916) b!815878))

(assert (= (and b!815877 condMapEmpty!22969) mapIsEmpty!22969))

(assert (= (and b!815877 (not condMapEmpty!22969)) mapNonEmpty!22969))

(get-info :version)

(assert (= (and mapNonEmpty!22969 ((_ is ValueCellFull!6713) mapValue!22969)) b!815883))

(assert (= (and b!815877 ((_ is ValueCellFull!6713) mapDefault!22969)) b!815880))

(assert (= start!70306 b!815877))

(declare-fun m!757995 () Bool)

(assert (=> b!815878 m!757995))

(declare-fun m!757997 () Bool)

(assert (=> b!815878 m!757997))

(declare-fun m!757999 () Bool)

(assert (=> b!815878 m!757999))

(declare-fun m!758001 () Bool)

(assert (=> start!70306 m!758001))

(declare-fun m!758003 () Bool)

(assert (=> start!70306 m!758003))

(declare-fun m!758005 () Bool)

(assert (=> start!70306 m!758005))

(declare-fun m!758007 () Bool)

(assert (=> mapNonEmpty!22969 m!758007))

(declare-fun m!758009 () Bool)

(assert (=> b!815879 m!758009))

(declare-fun m!758011 () Bool)

(assert (=> b!815881 m!758011))

(check-sat (not start!70306) (not b!815879) (not b_next!12547) (not b!815881) tp_is_empty!14257 b_and!21337 (not b!815878) (not mapNonEmpty!22969))
(check-sat b_and!21337 (not b_next!12547))
