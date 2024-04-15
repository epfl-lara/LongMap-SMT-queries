; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70326 () Bool)

(assert start!70326)

(declare-fun b_free!12703 () Bool)

(declare-fun b_next!12703 () Bool)

(assert (=> start!70326 (= b_free!12703 (not b_next!12703))))

(declare-fun tp!44835 () Bool)

(declare-fun b_and!21489 () Bool)

(assert (=> start!70326 (= tp!44835 b_and!21489)))

(declare-fun b!816990 () Bool)

(declare-fun e!453296 () Bool)

(declare-fun e!453298 () Bool)

(declare-fun mapRes!23212 () Bool)

(assert (=> b!816990 (= e!453296 (and e!453298 mapRes!23212))))

(declare-fun condMapEmpty!23212 () Bool)

(declare-datatypes ((V!24219 0))(
  ( (V!24220 (val!7254 Int)) )
))
(declare-datatypes ((ValueCell!6791 0))(
  ( (ValueCellFull!6791 (v!9677 V!24219)) (EmptyCell!6791) )
))
(declare-datatypes ((array!45005 0))(
  ( (array!45006 (arr!21559 (Array (_ BitVec 32) ValueCell!6791)) (size!21980 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45005)

(declare-fun mapDefault!23212 () ValueCell!6791)

(assert (=> b!816990 (= condMapEmpty!23212 (= (arr!21559 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6791)) mapDefault!23212)))))

(declare-fun res!557758 () Bool)

(declare-fun e!453297 () Bool)

(assert (=> start!70326 (=> (not res!557758) (not e!453297))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70326 (= res!557758 (validMask!0 mask!1312))))

(assert (=> start!70326 e!453297))

(declare-fun tp_is_empty!14413 () Bool)

(assert (=> start!70326 tp_is_empty!14413))

(declare-datatypes ((array!45007 0))(
  ( (array!45008 (arr!21560 (Array (_ BitVec 32) (_ BitVec 64))) (size!21981 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45007)

(declare-fun array_inv!17319 (array!45007) Bool)

(assert (=> start!70326 (array_inv!17319 _keys!976)))

(assert (=> start!70326 true))

(declare-fun array_inv!17320 (array!45005) Bool)

(assert (=> start!70326 (and (array_inv!17320 _values!788) e!453296)))

(assert (=> start!70326 tp!44835))

(declare-fun mapNonEmpty!23212 () Bool)

(declare-fun tp!44836 () Bool)

(declare-fun e!453300 () Bool)

(assert (=> mapNonEmpty!23212 (= mapRes!23212 (and tp!44836 e!453300))))

(declare-fun mapRest!23212 () (Array (_ BitVec 32) ValueCell!6791))

(declare-fun mapKey!23212 () (_ BitVec 32))

(declare-fun mapValue!23212 () ValueCell!6791)

(assert (=> mapNonEmpty!23212 (= (arr!21559 _values!788) (store mapRest!23212 mapKey!23212 mapValue!23212))))

(declare-fun b!816991 () Bool)

(declare-fun res!557759 () Bool)

(assert (=> b!816991 (=> (not res!557759) (not e!453297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45007 (_ BitVec 32)) Bool)

(assert (=> b!816991 (= res!557759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816992 () Bool)

(declare-fun res!557760 () Bool)

(assert (=> b!816992 (=> (not res!557760) (not e!453297))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816992 (= res!557760 (and (= (size!21980 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21981 _keys!976) (size!21980 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816993 () Bool)

(assert (=> b!816993 (= e!453298 tp_is_empty!14413)))

(declare-fun b!816994 () Bool)

(declare-fun res!557757 () Bool)

(assert (=> b!816994 (=> (not res!557757) (not e!453297))))

(declare-datatypes ((List!15373 0))(
  ( (Nil!15370) (Cons!15369 (h!16498 (_ BitVec 64)) (t!21689 List!15373)) )
))
(declare-fun arrayNoDuplicates!0 (array!45007 (_ BitVec 32) List!15373) Bool)

(assert (=> b!816994 (= res!557757 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15370))))

(declare-fun b!816995 () Bool)

(assert (=> b!816995 (= e!453300 tp_is_empty!14413)))

(declare-fun b!816996 () Bool)

(assert (=> b!816996 (= e!453297 (not true))))

(declare-datatypes ((tuple2!9552 0))(
  ( (tuple2!9553 (_1!4787 (_ BitVec 64)) (_2!4787 V!24219)) )
))
(declare-datatypes ((List!15374 0))(
  ( (Nil!15371) (Cons!15370 (h!16499 tuple2!9552) (t!21690 List!15374)) )
))
(declare-datatypes ((ListLongMap!8365 0))(
  ( (ListLongMap!8366 (toList!4198 List!15374)) )
))
(declare-fun lt!365920 () ListLongMap!8365)

(declare-fun lt!365922 () ListLongMap!8365)

(assert (=> b!816996 (= lt!365920 lt!365922)))

(declare-fun zeroValueBefore!34 () V!24219)

(declare-fun zeroValueAfter!34 () V!24219)

(declare-fun minValue!754 () V!24219)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27824 0))(
  ( (Unit!27825) )
))
(declare-fun lt!365921 () Unit!27824)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!351 (array!45007 array!45005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24219 V!24219 V!24219 V!24219 (_ BitVec 32) Int) Unit!27824)

(assert (=> b!816996 (= lt!365921 (lemmaNoChangeToArrayThenSameMapNoExtras!351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2258 (array!45007 array!45005 (_ BitVec 32) (_ BitVec 32) V!24219 V!24219 (_ BitVec 32) Int) ListLongMap!8365)

(assert (=> b!816996 (= lt!365922 (getCurrentListMapNoExtraKeys!2258 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816996 (= lt!365920 (getCurrentListMapNoExtraKeys!2258 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23212 () Bool)

(assert (=> mapIsEmpty!23212 mapRes!23212))

(assert (= (and start!70326 res!557758) b!816992))

(assert (= (and b!816992 res!557760) b!816991))

(assert (= (and b!816991 res!557759) b!816994))

(assert (= (and b!816994 res!557757) b!816996))

(assert (= (and b!816990 condMapEmpty!23212) mapIsEmpty!23212))

(assert (= (and b!816990 (not condMapEmpty!23212)) mapNonEmpty!23212))

(get-info :version)

(assert (= (and mapNonEmpty!23212 ((_ is ValueCellFull!6791) mapValue!23212)) b!816995))

(assert (= (and b!816990 ((_ is ValueCellFull!6791) mapDefault!23212)) b!816993))

(assert (= start!70326 b!816990))

(declare-fun m!758095 () Bool)

(assert (=> b!816996 m!758095))

(declare-fun m!758097 () Bool)

(assert (=> b!816996 m!758097))

(declare-fun m!758099 () Bool)

(assert (=> b!816996 m!758099))

(declare-fun m!758101 () Bool)

(assert (=> mapNonEmpty!23212 m!758101))

(declare-fun m!758103 () Bool)

(assert (=> b!816991 m!758103))

(declare-fun m!758105 () Bool)

(assert (=> start!70326 m!758105))

(declare-fun m!758107 () Bool)

(assert (=> start!70326 m!758107))

(declare-fun m!758109 () Bool)

(assert (=> start!70326 m!758109))

(declare-fun m!758111 () Bool)

(assert (=> b!816994 m!758111))

(check-sat (not b!816991) (not b_next!12703) (not start!70326) tp_is_empty!14413 (not b!816994) (not mapNonEmpty!23212) (not b!816996) b_and!21489)
(check-sat b_and!21489 (not b_next!12703))
