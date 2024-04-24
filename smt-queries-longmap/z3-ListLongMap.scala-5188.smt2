; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70294 () Bool)

(assert start!70294)

(declare-fun b_free!12535 () Bool)

(declare-fun b_next!12535 () Bool)

(assert (=> start!70294 (= b_free!12535 (not b_next!12535))))

(declare-fun tp!44323 () Bool)

(declare-fun b_and!21325 () Bool)

(assert (=> start!70294 (= tp!44323 b_and!21325)))

(declare-fun b!815751 () Bool)

(declare-fun res!556846 () Bool)

(declare-fun e!452328 () Bool)

(assert (=> b!815751 (=> (not res!556846) (not e!452328))))

(declare-datatypes ((array!44691 0))(
  ( (array!44692 (arr!21400 (Array (_ BitVec 32) (_ BitVec 64))) (size!21820 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44691)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23995 0))(
  ( (V!23996 (val!7170 Int)) )
))
(declare-datatypes ((ValueCell!6707 0))(
  ( (ValueCellFull!6707 (v!9597 V!23995)) (EmptyCell!6707) )
))
(declare-datatypes ((array!44693 0))(
  ( (array!44694 (arr!21401 (Array (_ BitVec 32) ValueCell!6707)) (size!21821 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44693)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!815751 (= res!556846 (and (= (size!21821 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21820 _keys!976) (size!21821 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815752 () Bool)

(declare-fun res!556847 () Bool)

(assert (=> b!815752 (=> (not res!556847) (not e!452328))))

(declare-datatypes ((List!15133 0))(
  ( (Nil!15130) (Cons!15129 (h!16264 (_ BitVec 64)) (t!21444 List!15133)) )
))
(declare-fun arrayNoDuplicates!0 (array!44691 (_ BitVec 32) List!15133) Bool)

(assert (=> b!815752 (= res!556847 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15130))))

(declare-fun b!815753 () Bool)

(declare-fun e!452330 () Bool)

(declare-fun tp_is_empty!14245 () Bool)

(assert (=> b!815753 (= e!452330 tp_is_empty!14245)))

(declare-fun mapNonEmpty!22951 () Bool)

(declare-fun mapRes!22951 () Bool)

(declare-fun tp!44322 () Bool)

(assert (=> mapNonEmpty!22951 (= mapRes!22951 (and tp!44322 e!452330))))

(declare-fun mapValue!22951 () ValueCell!6707)

(declare-fun mapKey!22951 () (_ BitVec 32))

(declare-fun mapRest!22951 () (Array (_ BitVec 32) ValueCell!6707))

(assert (=> mapNonEmpty!22951 (= (arr!21401 _values!788) (store mapRest!22951 mapKey!22951 mapValue!22951))))

(declare-fun mapIsEmpty!22951 () Bool)

(assert (=> mapIsEmpty!22951 mapRes!22951))

(declare-fun b!815755 () Bool)

(assert (=> b!815755 (= e!452328 (not true))))

(declare-datatypes ((tuple2!9316 0))(
  ( (tuple2!9317 (_1!4669 (_ BitVec 64)) (_2!4669 V!23995)) )
))
(declare-datatypes ((List!15134 0))(
  ( (Nil!15131) (Cons!15130 (h!16265 tuple2!9316) (t!21445 List!15134)) )
))
(declare-datatypes ((ListLongMap!8141 0))(
  ( (ListLongMap!8142 (toList!4086 List!15134)) )
))
(declare-fun lt!365155 () ListLongMap!8141)

(declare-fun lt!365153 () ListLongMap!8141)

(assert (=> b!815755 (= lt!365155 lt!365153)))

(declare-fun zeroValueBefore!34 () V!23995)

(declare-datatypes ((Unit!27739 0))(
  ( (Unit!27740) )
))
(declare-fun lt!365154 () Unit!27739)

(declare-fun zeroValueAfter!34 () V!23995)

(declare-fun minValue!754 () V!23995)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!281 (array!44691 array!44693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 V!23995 V!23995 (_ BitVec 32) Int) Unit!27739)

(assert (=> b!815755 (= lt!365154 (lemmaNoChangeToArrayThenSameMapNoExtras!281 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2193 (array!44691 array!44693 (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 (_ BitVec 32) Int) ListLongMap!8141)

(assert (=> b!815755 (= lt!365153 (getCurrentListMapNoExtraKeys!2193 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815755 (= lt!365155 (getCurrentListMapNoExtraKeys!2193 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815756 () Bool)

(declare-fun e!452331 () Bool)

(assert (=> b!815756 (= e!452331 tp_is_empty!14245)))

(declare-fun b!815757 () Bool)

(declare-fun e!452327 () Bool)

(assert (=> b!815757 (= e!452327 (and e!452331 mapRes!22951))))

(declare-fun condMapEmpty!22951 () Bool)

(declare-fun mapDefault!22951 () ValueCell!6707)

(assert (=> b!815757 (= condMapEmpty!22951 (= (arr!21401 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6707)) mapDefault!22951)))))

(declare-fun res!556844 () Bool)

(assert (=> start!70294 (=> (not res!556844) (not e!452328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70294 (= res!556844 (validMask!0 mask!1312))))

(assert (=> start!70294 e!452328))

(assert (=> start!70294 tp_is_empty!14245))

(declare-fun array_inv!17173 (array!44691) Bool)

(assert (=> start!70294 (array_inv!17173 _keys!976)))

(assert (=> start!70294 true))

(declare-fun array_inv!17174 (array!44693) Bool)

(assert (=> start!70294 (and (array_inv!17174 _values!788) e!452327)))

(assert (=> start!70294 tp!44323))

(declare-fun b!815754 () Bool)

(declare-fun res!556845 () Bool)

(assert (=> b!815754 (=> (not res!556845) (not e!452328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44691 (_ BitVec 32)) Bool)

(assert (=> b!815754 (= res!556845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70294 res!556844) b!815751))

(assert (= (and b!815751 res!556846) b!815754))

(assert (= (and b!815754 res!556845) b!815752))

(assert (= (and b!815752 res!556847) b!815755))

(assert (= (and b!815757 condMapEmpty!22951) mapIsEmpty!22951))

(assert (= (and b!815757 (not condMapEmpty!22951)) mapNonEmpty!22951))

(get-info :version)

(assert (= (and mapNonEmpty!22951 ((_ is ValueCellFull!6707) mapValue!22951)) b!815753))

(assert (= (and b!815757 ((_ is ValueCellFull!6707) mapDefault!22951)) b!815756))

(assert (= start!70294 b!815757))

(declare-fun m!757887 () Bool)

(assert (=> b!815754 m!757887))

(declare-fun m!757889 () Bool)

(assert (=> mapNonEmpty!22951 m!757889))

(declare-fun m!757891 () Bool)

(assert (=> b!815752 m!757891))

(declare-fun m!757893 () Bool)

(assert (=> start!70294 m!757893))

(declare-fun m!757895 () Bool)

(assert (=> start!70294 m!757895))

(declare-fun m!757897 () Bool)

(assert (=> start!70294 m!757897))

(declare-fun m!757899 () Bool)

(assert (=> b!815755 m!757899))

(declare-fun m!757901 () Bool)

(assert (=> b!815755 m!757901))

(declare-fun m!757903 () Bool)

(assert (=> b!815755 m!757903))

(check-sat (not b!815752) (not start!70294) tp_is_empty!14245 (not b_next!12535) (not mapNonEmpty!22951) b_and!21325 (not b!815755) (not b!815754))
(check-sat b_and!21325 (not b_next!12535))
