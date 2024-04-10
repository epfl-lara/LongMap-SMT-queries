; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70944 () Bool)

(assert start!70944)

(declare-fun b_free!13161 () Bool)

(declare-fun b_next!13161 () Bool)

(assert (=> start!70944 (= b_free!13161 (not b_next!13161))))

(declare-fun tp!46234 () Bool)

(declare-fun b_and!22057 () Bool)

(assert (=> start!70944 (= tp!46234 b_and!22057)))

(declare-fun mapNonEmpty!23923 () Bool)

(declare-fun mapRes!23923 () Bool)

(declare-fun tp!46233 () Bool)

(declare-fun e!458320 () Bool)

(assert (=> mapNonEmpty!23923 (= mapRes!23923 (and tp!46233 e!458320))))

(declare-datatypes ((V!24829 0))(
  ( (V!24830 (val!7483 Int)) )
))
(declare-datatypes ((ValueCell!7020 0))(
  ( (ValueCellFull!7020 (v!9916 V!24829)) (EmptyCell!7020) )
))
(declare-datatypes ((array!45932 0))(
  ( (array!45933 (arr!22014 (Array (_ BitVec 32) ValueCell!7020)) (size!22435 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45932)

(declare-fun mapValue!23923 () ValueCell!7020)

(declare-fun mapKey!23923 () (_ BitVec 32))

(declare-fun mapRest!23923 () (Array (_ BitVec 32) ValueCell!7020))

(assert (=> mapNonEmpty!23923 (= (arr!22014 _values!788) (store mapRest!23923 mapKey!23923 mapValue!23923))))

(declare-fun b!823927 () Bool)

(declare-fun res!561798 () Bool)

(declare-fun e!458319 () Bool)

(assert (=> b!823927 (=> (not res!561798) (not e!458319))))

(declare-datatypes ((array!45934 0))(
  ( (array!45935 (arr!22015 (Array (_ BitVec 32) (_ BitVec 64))) (size!22436 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45934)

(declare-datatypes ((List!15709 0))(
  ( (Nil!15706) (Cons!15705 (h!16834 (_ BitVec 64)) (t!22050 List!15709)) )
))
(declare-fun arrayNoDuplicates!0 (array!45934 (_ BitVec 32) List!15709) Bool)

(assert (=> b!823927 (= res!561798 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15706))))

(declare-fun b!823928 () Bool)

(declare-fun e!458321 () Bool)

(declare-fun e!458323 () Bool)

(assert (=> b!823928 (= e!458321 (and e!458323 mapRes!23923))))

(declare-fun condMapEmpty!23923 () Bool)

(declare-fun mapDefault!23923 () ValueCell!7020)

(assert (=> b!823928 (= condMapEmpty!23923 (= (arr!22014 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7020)) mapDefault!23923)))))

(declare-fun b!823929 () Bool)

(declare-fun res!561797 () Bool)

(assert (=> b!823929 (=> (not res!561797) (not e!458319))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823929 (= res!561797 (and (= (size!22435 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22436 _keys!976) (size!22435 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823930 () Bool)

(declare-fun res!561799 () Bool)

(assert (=> b!823930 (=> (not res!561799) (not e!458319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45934 (_ BitVec 32)) Bool)

(assert (=> b!823930 (= res!561799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823931 () Bool)

(declare-fun tp_is_empty!14871 () Bool)

(assert (=> b!823931 (= e!458320 tp_is_empty!14871)))

(declare-fun b!823932 () Bool)

(assert (=> b!823932 (= e!458323 tp_is_empty!14871)))

(declare-fun b!823933 () Bool)

(assert (=> b!823933 (= e!458319 (not true))))

(declare-datatypes ((tuple2!9898 0))(
  ( (tuple2!9899 (_1!4960 (_ BitVec 64)) (_2!4960 V!24829)) )
))
(declare-datatypes ((List!15710 0))(
  ( (Nil!15707) (Cons!15706 (h!16835 tuple2!9898) (t!22051 List!15710)) )
))
(declare-datatypes ((ListLongMap!8721 0))(
  ( (ListLongMap!8722 (toList!4376 List!15710)) )
))
(declare-fun lt!371591 () ListLongMap!8721)

(declare-fun lt!371593 () ListLongMap!8721)

(assert (=> b!823933 (= lt!371591 lt!371593)))

(declare-fun zeroValueBefore!34 () V!24829)

(declare-datatypes ((Unit!28220 0))(
  ( (Unit!28221) )
))
(declare-fun lt!371592 () Unit!28220)

(declare-fun zeroValueAfter!34 () V!24829)

(declare-fun minValue!754 () V!24829)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!501 (array!45934 array!45932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24829 V!24829 V!24829 V!24829 (_ BitVec 32) Int) Unit!28220)

(assert (=> b!823933 (= lt!371592 (lemmaNoChangeToArrayThenSameMapNoExtras!501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2391 (array!45934 array!45932 (_ BitVec 32) (_ BitVec 32) V!24829 V!24829 (_ BitVec 32) Int) ListLongMap!8721)

(assert (=> b!823933 (= lt!371593 (getCurrentListMapNoExtraKeys!2391 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823933 (= lt!371591 (getCurrentListMapNoExtraKeys!2391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23923 () Bool)

(assert (=> mapIsEmpty!23923 mapRes!23923))

(declare-fun res!561800 () Bool)

(assert (=> start!70944 (=> (not res!561800) (not e!458319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70944 (= res!561800 (validMask!0 mask!1312))))

(assert (=> start!70944 e!458319))

(assert (=> start!70944 tp_is_empty!14871))

(declare-fun array_inv!17567 (array!45934) Bool)

(assert (=> start!70944 (array_inv!17567 _keys!976)))

(assert (=> start!70944 true))

(declare-fun array_inv!17568 (array!45932) Bool)

(assert (=> start!70944 (and (array_inv!17568 _values!788) e!458321)))

(assert (=> start!70944 tp!46234))

(assert (= (and start!70944 res!561800) b!823929))

(assert (= (and b!823929 res!561797) b!823930))

(assert (= (and b!823930 res!561799) b!823927))

(assert (= (and b!823927 res!561798) b!823933))

(assert (= (and b!823928 condMapEmpty!23923) mapIsEmpty!23923))

(assert (= (and b!823928 (not condMapEmpty!23923)) mapNonEmpty!23923))

(get-info :version)

(assert (= (and mapNonEmpty!23923 ((_ is ValueCellFull!7020) mapValue!23923)) b!823931))

(assert (= (and b!823928 ((_ is ValueCellFull!7020) mapDefault!23923)) b!823932))

(assert (= start!70944 b!823928))

(declare-fun m!766099 () Bool)

(assert (=> b!823933 m!766099))

(declare-fun m!766101 () Bool)

(assert (=> b!823933 m!766101))

(declare-fun m!766103 () Bool)

(assert (=> b!823933 m!766103))

(declare-fun m!766105 () Bool)

(assert (=> b!823930 m!766105))

(declare-fun m!766107 () Bool)

(assert (=> start!70944 m!766107))

(declare-fun m!766109 () Bool)

(assert (=> start!70944 m!766109))

(declare-fun m!766111 () Bool)

(assert (=> start!70944 m!766111))

(declare-fun m!766113 () Bool)

(assert (=> b!823927 m!766113))

(declare-fun m!766115 () Bool)

(assert (=> mapNonEmpty!23923 m!766115))

(check-sat (not b!823933) (not b!823930) tp_is_empty!14871 b_and!22057 (not b!823927) (not start!70944) (not mapNonEmpty!23923) (not b_next!13161))
(check-sat b_and!22057 (not b_next!13161))
