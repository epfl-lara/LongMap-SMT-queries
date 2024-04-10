; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71314 () Bool)

(assert start!71314)

(declare-fun b_free!13431 () Bool)

(declare-fun b_next!13431 () Bool)

(assert (=> start!71314 (= b_free!13431 (not b_next!13431))))

(declare-fun tp!47061 () Bool)

(declare-fun b_and!22389 () Bool)

(assert (=> start!71314 (= tp!47061 b_and!22389)))

(declare-fun b!828248 () Bool)

(declare-fun res!564399 () Bool)

(declare-fun e!461503 () Bool)

(assert (=> b!828248 (=> (not res!564399) (not e!461503))))

(declare-datatypes ((array!46446 0))(
  ( (array!46447 (arr!22265 (Array (_ BitVec 32) (_ BitVec 64))) (size!22686 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46446)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46446 (_ BitVec 32)) Bool)

(assert (=> b!828248 (= res!564399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828250 () Bool)

(declare-fun res!564402 () Bool)

(assert (=> b!828250 (=> (not res!564402) (not e!461503))))

(declare-datatypes ((List!15891 0))(
  ( (Nil!15888) (Cons!15887 (h!17016 (_ BitVec 64)) (t!22244 List!15891)) )
))
(declare-fun arrayNoDuplicates!0 (array!46446 (_ BitVec 32) List!15891) Bool)

(assert (=> b!828250 (= res!564402 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15888))))

(declare-fun mapNonEmpty!24346 () Bool)

(declare-fun mapRes!24346 () Bool)

(declare-fun tp!47062 () Bool)

(declare-fun e!461502 () Bool)

(assert (=> mapNonEmpty!24346 (= mapRes!24346 (and tp!47062 e!461502))))

(declare-fun mapKey!24346 () (_ BitVec 32))

(declare-datatypes ((V!25189 0))(
  ( (V!25190 (val!7618 Int)) )
))
(declare-datatypes ((ValueCell!7155 0))(
  ( (ValueCellFull!7155 (v!10054 V!25189)) (EmptyCell!7155) )
))
(declare-fun mapValue!24346 () ValueCell!7155)

(declare-fun mapRest!24346 () (Array (_ BitVec 32) ValueCell!7155))

(declare-datatypes ((array!46448 0))(
  ( (array!46449 (arr!22266 (Array (_ BitVec 32) ValueCell!7155)) (size!22687 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46448)

(assert (=> mapNonEmpty!24346 (= (arr!22266 _values!788) (store mapRest!24346 mapKey!24346 mapValue!24346))))

(declare-fun mapIsEmpty!24346 () Bool)

(assert (=> mapIsEmpty!24346 mapRes!24346))

(declare-fun b!828251 () Bool)

(declare-fun e!461504 () Bool)

(declare-fun tp_is_empty!15141 () Bool)

(assert (=> b!828251 (= e!461504 tp_is_empty!15141)))

(declare-fun b!828252 () Bool)

(declare-fun e!461499 () Bool)

(assert (=> b!828252 (= e!461503 (not e!461499))))

(declare-fun res!564403 () Bool)

(assert (=> b!828252 (=> res!564403 e!461499)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828252 (= res!564403 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10100 0))(
  ( (tuple2!10101 (_1!5061 (_ BitVec 64)) (_2!5061 V!25189)) )
))
(declare-datatypes ((List!15892 0))(
  ( (Nil!15889) (Cons!15888 (h!17017 tuple2!10100) (t!22245 List!15892)) )
))
(declare-datatypes ((ListLongMap!8923 0))(
  ( (ListLongMap!8924 (toList!4477 List!15892)) )
))
(declare-fun lt!375260 () ListLongMap!8923)

(declare-fun lt!375259 () ListLongMap!8923)

(assert (=> b!828252 (= lt!375260 lt!375259)))

(declare-fun zeroValueBefore!34 () V!25189)

(declare-fun zeroValueAfter!34 () V!25189)

(declare-fun minValue!754 () V!25189)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28373 0))(
  ( (Unit!28374) )
))
(declare-fun lt!375262 () Unit!28373)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!567 (array!46446 array!46448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25189 V!25189 V!25189 V!25189 (_ BitVec 32) Int) Unit!28373)

(assert (=> b!828252 (= lt!375262 (lemmaNoChangeToArrayThenSameMapNoExtras!567 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2479 (array!46446 array!46448 (_ BitVec 32) (_ BitVec 32) V!25189 V!25189 (_ BitVec 32) Int) ListLongMap!8923)

(assert (=> b!828252 (= lt!375259 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828252 (= lt!375260 (getCurrentListMapNoExtraKeys!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828253 () Bool)

(assert (=> b!828253 (= e!461502 tp_is_empty!15141)))

(declare-fun res!564400 () Bool)

(assert (=> start!71314 (=> (not res!564400) (not e!461503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71314 (= res!564400 (validMask!0 mask!1312))))

(assert (=> start!71314 e!461503))

(assert (=> start!71314 tp_is_empty!15141))

(declare-fun array_inv!17737 (array!46446) Bool)

(assert (=> start!71314 (array_inv!17737 _keys!976)))

(assert (=> start!71314 true))

(declare-fun e!461500 () Bool)

(declare-fun array_inv!17738 (array!46448) Bool)

(assert (=> start!71314 (and (array_inv!17738 _values!788) e!461500)))

(assert (=> start!71314 tp!47061))

(declare-fun b!828249 () Bool)

(declare-fun res!564401 () Bool)

(assert (=> b!828249 (=> (not res!564401) (not e!461503))))

(assert (=> b!828249 (= res!564401 (and (= (size!22687 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22686 _keys!976) (size!22687 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828254 () Bool)

(assert (=> b!828254 (= e!461500 (and e!461504 mapRes!24346))))

(declare-fun condMapEmpty!24346 () Bool)

(declare-fun mapDefault!24346 () ValueCell!7155)

(assert (=> b!828254 (= condMapEmpty!24346 (= (arr!22266 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7155)) mapDefault!24346)))))

(declare-fun b!828255 () Bool)

(assert (=> b!828255 (= e!461499 true)))

(declare-fun lt!375261 () ListLongMap!8923)

(declare-fun getCurrentListMap!2579 (array!46446 array!46448 (_ BitVec 32) (_ BitVec 32) V!25189 V!25189 (_ BitVec 32) Int) ListLongMap!8923)

(assert (=> b!828255 (= lt!375261 (getCurrentListMap!2579 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375263 () ListLongMap!8923)

(declare-fun +!1960 (ListLongMap!8923 tuple2!10100) ListLongMap!8923)

(assert (=> b!828255 (= lt!375263 (+!1960 (getCurrentListMap!2579 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!71314 res!564400) b!828249))

(assert (= (and b!828249 res!564401) b!828248))

(assert (= (and b!828248 res!564399) b!828250))

(assert (= (and b!828250 res!564402) b!828252))

(assert (= (and b!828252 (not res!564403)) b!828255))

(assert (= (and b!828254 condMapEmpty!24346) mapIsEmpty!24346))

(assert (= (and b!828254 (not condMapEmpty!24346)) mapNonEmpty!24346))

(get-info :version)

(assert (= (and mapNonEmpty!24346 ((_ is ValueCellFull!7155) mapValue!24346)) b!828253))

(assert (= (and b!828254 ((_ is ValueCellFull!7155) mapDefault!24346)) b!828251))

(assert (= start!71314 b!828254))

(declare-fun m!771193 () Bool)

(assert (=> b!828250 m!771193))

(declare-fun m!771195 () Bool)

(assert (=> start!71314 m!771195))

(declare-fun m!771197 () Bool)

(assert (=> start!71314 m!771197))

(declare-fun m!771199 () Bool)

(assert (=> start!71314 m!771199))

(declare-fun m!771201 () Bool)

(assert (=> b!828248 m!771201))

(declare-fun m!771203 () Bool)

(assert (=> b!828255 m!771203))

(declare-fun m!771205 () Bool)

(assert (=> b!828255 m!771205))

(assert (=> b!828255 m!771205))

(declare-fun m!771207 () Bool)

(assert (=> b!828255 m!771207))

(declare-fun m!771209 () Bool)

(assert (=> b!828252 m!771209))

(declare-fun m!771211 () Bool)

(assert (=> b!828252 m!771211))

(declare-fun m!771213 () Bool)

(assert (=> b!828252 m!771213))

(declare-fun m!771215 () Bool)

(assert (=> mapNonEmpty!24346 m!771215))

(check-sat b_and!22389 (not b!828248) (not mapNonEmpty!24346) tp_is_empty!15141 (not b!828255) (not start!71314) (not b_next!13431) (not b!828250) (not b!828252))
(check-sat b_and!22389 (not b_next!13431))
