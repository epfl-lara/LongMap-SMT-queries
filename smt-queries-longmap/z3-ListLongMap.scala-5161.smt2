; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70106 () Bool)

(assert start!70106)

(declare-fun b_free!12373 () Bool)

(declare-fun b_next!12373 () Bool)

(assert (=> start!70106 (= b_free!12373 (not b_next!12373))))

(declare-fun tp!43831 () Bool)

(declare-fun b_and!21151 () Bool)

(assert (=> start!70106 (= tp!43831 b_and!21151)))

(declare-fun b!813892 () Bool)

(declare-fun res!555816 () Bool)

(declare-fun e!451009 () Bool)

(assert (=> b!813892 (=> (not res!555816) (not e!451009))))

(declare-datatypes ((array!44385 0))(
  ( (array!44386 (arr!21249 (Array (_ BitVec 32) (_ BitVec 64))) (size!21669 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44385)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23779 0))(
  ( (V!23780 (val!7089 Int)) )
))
(declare-datatypes ((ValueCell!6626 0))(
  ( (ValueCellFull!6626 (v!9516 V!23779)) (EmptyCell!6626) )
))
(declare-datatypes ((array!44387 0))(
  ( (array!44388 (arr!21250 (Array (_ BitVec 32) ValueCell!6626)) (size!21670 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44387)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813892 (= res!555816 (and (= (size!21670 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21669 _keys!976) (size!21670 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555817 () Bool)

(assert (=> start!70106 (=> (not res!555817) (not e!451009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70106 (= res!555817 (validMask!0 mask!1312))))

(assert (=> start!70106 e!451009))

(declare-fun tp_is_empty!14083 () Bool)

(assert (=> start!70106 tp_is_empty!14083))

(declare-fun array_inv!17075 (array!44385) Bool)

(assert (=> start!70106 (array_inv!17075 _keys!976)))

(assert (=> start!70106 true))

(declare-fun e!451011 () Bool)

(declare-fun array_inv!17076 (array!44387) Bool)

(assert (=> start!70106 (and (array_inv!17076 _values!788) e!451011)))

(assert (=> start!70106 tp!43831))

(declare-fun b!813893 () Bool)

(declare-fun e!451013 () Bool)

(assert (=> b!813893 (= e!451013 tp_is_empty!14083)))

(declare-fun b!813894 () Bool)

(declare-fun e!451010 () Bool)

(assert (=> b!813894 (= e!451010 tp_is_empty!14083)))

(declare-fun mapIsEmpty!22702 () Bool)

(declare-fun mapRes!22702 () Bool)

(assert (=> mapIsEmpty!22702 mapRes!22702))

(declare-fun mapNonEmpty!22702 () Bool)

(declare-fun tp!43830 () Bool)

(assert (=> mapNonEmpty!22702 (= mapRes!22702 (and tp!43830 e!451010))))

(declare-fun mapValue!22702 () ValueCell!6626)

(declare-fun mapRest!22702 () (Array (_ BitVec 32) ValueCell!6626))

(declare-fun mapKey!22702 () (_ BitVec 32))

(assert (=> mapNonEmpty!22702 (= (arr!21250 _values!788) (store mapRest!22702 mapKey!22702 mapValue!22702))))

(declare-fun b!813895 () Bool)

(assert (=> b!813895 (= e!451011 (and e!451013 mapRes!22702))))

(declare-fun condMapEmpty!22702 () Bool)

(declare-fun mapDefault!22702 () ValueCell!6626)

(assert (=> b!813895 (= condMapEmpty!22702 (= (arr!21250 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6626)) mapDefault!22702)))))

(declare-fun b!813896 () Bool)

(declare-fun res!555815 () Bool)

(assert (=> b!813896 (=> (not res!555815) (not e!451009))))

(declare-datatypes ((List!15021 0))(
  ( (Nil!15018) (Cons!15017 (h!16152 (_ BitVec 64)) (t!21328 List!15021)) )
))
(declare-fun arrayNoDuplicates!0 (array!44385 (_ BitVec 32) List!15021) Bool)

(assert (=> b!813896 (= res!555815 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15018))))

(declare-fun b!813897 () Bool)

(declare-fun res!555814 () Bool)

(assert (=> b!813897 (=> (not res!555814) (not e!451009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44385 (_ BitVec 32)) Bool)

(assert (=> b!813897 (= res!555814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813898 () Bool)

(assert (=> b!813898 (= e!451009 false)))

(declare-fun zeroValueBefore!34 () V!23779)

(declare-fun minValue!754 () V!23779)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9202 0))(
  ( (tuple2!9203 (_1!4612 (_ BitVec 64)) (_2!4612 V!23779)) )
))
(declare-datatypes ((List!15022 0))(
  ( (Nil!15019) (Cons!15018 (h!16153 tuple2!9202) (t!21329 List!15022)) )
))
(declare-datatypes ((ListLongMap!8027 0))(
  ( (ListLongMap!8028 (toList!4029 List!15022)) )
))
(declare-fun lt!364575 () ListLongMap!8027)

(declare-fun getCurrentListMapNoExtraKeys!2136 (array!44385 array!44387 (_ BitVec 32) (_ BitVec 32) V!23779 V!23779 (_ BitVec 32) Int) ListLongMap!8027)

(assert (=> b!813898 (= lt!364575 (getCurrentListMapNoExtraKeys!2136 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70106 res!555817) b!813892))

(assert (= (and b!813892 res!555816) b!813897))

(assert (= (and b!813897 res!555814) b!813896))

(assert (= (and b!813896 res!555815) b!813898))

(assert (= (and b!813895 condMapEmpty!22702) mapIsEmpty!22702))

(assert (= (and b!813895 (not condMapEmpty!22702)) mapNonEmpty!22702))

(get-info :version)

(assert (= (and mapNonEmpty!22702 ((_ is ValueCellFull!6626) mapValue!22702)) b!813894))

(assert (= (and b!813895 ((_ is ValueCellFull!6626) mapDefault!22702)) b!813893))

(assert (= start!70106 b!813895))

(declare-fun m!756469 () Bool)

(assert (=> b!813898 m!756469))

(declare-fun m!756471 () Bool)

(assert (=> start!70106 m!756471))

(declare-fun m!756473 () Bool)

(assert (=> start!70106 m!756473))

(declare-fun m!756475 () Bool)

(assert (=> start!70106 m!756475))

(declare-fun m!756477 () Bool)

(assert (=> mapNonEmpty!22702 m!756477))

(declare-fun m!756479 () Bool)

(assert (=> b!813897 m!756479))

(declare-fun m!756481 () Bool)

(assert (=> b!813896 m!756481))

(check-sat (not b_next!12373) tp_is_empty!14083 (not mapNonEmpty!22702) (not b!813896) (not b!813898) (not start!70106) b_and!21151 (not b!813897))
(check-sat b_and!21151 (not b_next!12373))
