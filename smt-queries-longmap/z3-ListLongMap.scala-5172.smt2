; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70184 () Bool)

(assert start!70184)

(declare-fun b_free!12439 () Bool)

(declare-fun b_next!12439 () Bool)

(assert (=> start!70184 (= b_free!12439 (not b_next!12439))))

(declare-fun tp!44032 () Bool)

(declare-fun b_and!21221 () Bool)

(assert (=> start!70184 (= tp!44032 b_and!21221)))

(declare-fun mapIsEmpty!22804 () Bool)

(declare-fun mapRes!22804 () Bool)

(assert (=> mapIsEmpty!22804 mapRes!22804))

(declare-fun res!556238 () Bool)

(declare-fun e!451556 () Bool)

(assert (=> start!70184 (=> (not res!556238) (not e!451556))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70184 (= res!556238 (validMask!0 mask!1312))))

(assert (=> start!70184 e!451556))

(declare-fun tp_is_empty!14149 () Bool)

(assert (=> start!70184 tp_is_empty!14149))

(declare-datatypes ((array!44511 0))(
  ( (array!44512 (arr!21311 (Array (_ BitVec 32) (_ BitVec 64))) (size!21731 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44511)

(declare-fun array_inv!17117 (array!44511) Bool)

(assert (=> start!70184 (array_inv!17117 _keys!976)))

(assert (=> start!70184 true))

(declare-datatypes ((V!23867 0))(
  ( (V!23868 (val!7122 Int)) )
))
(declare-datatypes ((ValueCell!6659 0))(
  ( (ValueCellFull!6659 (v!9549 V!23867)) (EmptyCell!6659) )
))
(declare-datatypes ((array!44513 0))(
  ( (array!44514 (arr!21312 (Array (_ BitVec 32) ValueCell!6659)) (size!21732 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44513)

(declare-fun e!451555 () Bool)

(declare-fun array_inv!17118 (array!44513) Bool)

(assert (=> start!70184 (and (array_inv!17118 _values!788) e!451555)))

(assert (=> start!70184 tp!44032))

(declare-fun b!814658 () Bool)

(declare-fun e!451553 () Bool)

(assert (=> b!814658 (= e!451553 tp_is_empty!14149)))

(declare-fun b!814659 () Bool)

(declare-fun e!451554 () Bool)

(assert (=> b!814659 (= e!451554 tp_is_empty!14149)))

(declare-fun b!814660 () Bool)

(declare-fun res!556237 () Bool)

(assert (=> b!814660 (=> (not res!556237) (not e!451556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44511 (_ BitVec 32)) Bool)

(assert (=> b!814660 (= res!556237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814661 () Bool)

(declare-fun res!556239 () Bool)

(assert (=> b!814661 (=> (not res!556239) (not e!451556))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814661 (= res!556239 (and (= (size!21732 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21731 _keys!976) (size!21732 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814662 () Bool)

(assert (=> b!814662 (= e!451555 (and e!451553 mapRes!22804))))

(declare-fun condMapEmpty!22804 () Bool)

(declare-fun mapDefault!22804 () ValueCell!6659)

(assert (=> b!814662 (= condMapEmpty!22804 (= (arr!21312 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6659)) mapDefault!22804)))))

(declare-fun b!814663 () Bool)

(declare-fun res!556240 () Bool)

(assert (=> b!814663 (=> (not res!556240) (not e!451556))))

(declare-datatypes ((List!15067 0))(
  ( (Nil!15064) (Cons!15063 (h!16198 (_ BitVec 64)) (t!21376 List!15067)) )
))
(declare-fun arrayNoDuplicates!0 (array!44511 (_ BitVec 32) List!15067) Bool)

(assert (=> b!814663 (= res!556240 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15064))))

(declare-fun mapNonEmpty!22804 () Bool)

(declare-fun tp!44031 () Bool)

(assert (=> mapNonEmpty!22804 (= mapRes!22804 (and tp!44031 e!451554))))

(declare-fun mapValue!22804 () ValueCell!6659)

(declare-fun mapKey!22804 () (_ BitVec 32))

(declare-fun mapRest!22804 () (Array (_ BitVec 32) ValueCell!6659))

(assert (=> mapNonEmpty!22804 (= (arr!21312 _values!788) (store mapRest!22804 mapKey!22804 mapValue!22804))))

(declare-fun b!814664 () Bool)

(assert (=> b!814664 (= e!451556 false)))

(declare-fun zeroValueAfter!34 () V!23867)

(declare-fun minValue!754 () V!23867)

(declare-datatypes ((tuple2!9250 0))(
  ( (tuple2!9251 (_1!4636 (_ BitVec 64)) (_2!4636 V!23867)) )
))
(declare-datatypes ((List!15068 0))(
  ( (Nil!15065) (Cons!15064 (h!16199 tuple2!9250) (t!21377 List!15068)) )
))
(declare-datatypes ((ListLongMap!8075 0))(
  ( (ListLongMap!8076 (toList!4053 List!15068)) )
))
(declare-fun lt!364743 () ListLongMap!8075)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2160 (array!44511 array!44513 (_ BitVec 32) (_ BitVec 32) V!23867 V!23867 (_ BitVec 32) Int) ListLongMap!8075)

(assert (=> b!814664 (= lt!364743 (getCurrentListMapNoExtraKeys!2160 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23867)

(declare-fun lt!364742 () ListLongMap!8075)

(assert (=> b!814664 (= lt!364742 (getCurrentListMapNoExtraKeys!2160 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70184 res!556238) b!814661))

(assert (= (and b!814661 res!556239) b!814660))

(assert (= (and b!814660 res!556237) b!814663))

(assert (= (and b!814663 res!556240) b!814664))

(assert (= (and b!814662 condMapEmpty!22804) mapIsEmpty!22804))

(assert (= (and b!814662 (not condMapEmpty!22804)) mapNonEmpty!22804))

(get-info :version)

(assert (= (and mapNonEmpty!22804 ((_ is ValueCellFull!6659) mapValue!22804)) b!814659))

(assert (= (and b!814662 ((_ is ValueCellFull!6659) mapDefault!22804)) b!814658))

(assert (= start!70184 b!814662))

(declare-fun m!756999 () Bool)

(assert (=> b!814664 m!756999))

(declare-fun m!757001 () Bool)

(assert (=> b!814664 m!757001))

(declare-fun m!757003 () Bool)

(assert (=> b!814663 m!757003))

(declare-fun m!757005 () Bool)

(assert (=> mapNonEmpty!22804 m!757005))

(declare-fun m!757007 () Bool)

(assert (=> start!70184 m!757007))

(declare-fun m!757009 () Bool)

(assert (=> start!70184 m!757009))

(declare-fun m!757011 () Bool)

(assert (=> start!70184 m!757011))

(declare-fun m!757013 () Bool)

(assert (=> b!814660 m!757013))

(check-sat (not mapNonEmpty!22804) (not b!814660) b_and!21221 tp_is_empty!14149 (not b!814664) (not start!70184) (not b!814663) (not b_next!12439))
(check-sat b_and!21221 (not b_next!12439))
