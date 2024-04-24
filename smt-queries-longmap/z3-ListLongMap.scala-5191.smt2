; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70312 () Bool)

(assert start!70312)

(declare-fun b_free!12553 () Bool)

(declare-fun b_next!12553 () Bool)

(assert (=> start!70312 (= b_free!12553 (not b_next!12553))))

(declare-fun tp!44377 () Bool)

(declare-fun b_and!21343 () Bool)

(assert (=> start!70312 (= tp!44377 b_and!21343)))

(declare-fun b!815940 () Bool)

(declare-fun e!452463 () Bool)

(declare-fun e!452464 () Bool)

(declare-fun mapRes!22978 () Bool)

(assert (=> b!815940 (= e!452463 (and e!452464 mapRes!22978))))

(declare-fun condMapEmpty!22978 () Bool)

(declare-datatypes ((V!24019 0))(
  ( (V!24020 (val!7179 Int)) )
))
(declare-datatypes ((ValueCell!6716 0))(
  ( (ValueCellFull!6716 (v!9606 V!24019)) (EmptyCell!6716) )
))
(declare-datatypes ((array!44725 0))(
  ( (array!44726 (arr!21417 (Array (_ BitVec 32) ValueCell!6716)) (size!21837 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44725)

(declare-fun mapDefault!22978 () ValueCell!6716)

(assert (=> b!815940 (= condMapEmpty!22978 (= (arr!21417 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6716)) mapDefault!22978)))))

(declare-fun b!815941 () Bool)

(declare-fun res!556953 () Bool)

(declare-fun e!452465 () Bool)

(assert (=> b!815941 (=> (not res!556953) (not e!452465))))

(declare-datatypes ((array!44727 0))(
  ( (array!44728 (arr!21418 (Array (_ BitVec 32) (_ BitVec 64))) (size!21838 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44727)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44727 (_ BitVec 32)) Bool)

(assert (=> b!815941 (= res!556953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815942 () Bool)

(declare-fun res!556954 () Bool)

(assert (=> b!815942 (=> (not res!556954) (not e!452465))))

(declare-datatypes ((List!15146 0))(
  ( (Nil!15143) (Cons!15142 (h!16277 (_ BitVec 64)) (t!21457 List!15146)) )
))
(declare-fun arrayNoDuplicates!0 (array!44727 (_ BitVec 32) List!15146) Bool)

(assert (=> b!815942 (= res!556954 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15143))))

(declare-fun res!556952 () Bool)

(assert (=> start!70312 (=> (not res!556952) (not e!452465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70312 (= res!556952 (validMask!0 mask!1312))))

(assert (=> start!70312 e!452465))

(declare-fun tp_is_empty!14263 () Bool)

(assert (=> start!70312 tp_is_empty!14263))

(declare-fun array_inv!17181 (array!44727) Bool)

(assert (=> start!70312 (array_inv!17181 _keys!976)))

(assert (=> start!70312 true))

(declare-fun array_inv!17182 (array!44725) Bool)

(assert (=> start!70312 (and (array_inv!17182 _values!788) e!452463)))

(assert (=> start!70312 tp!44377))

(declare-fun b!815943 () Bool)

(assert (=> b!815943 (= e!452464 tp_is_empty!14263)))

(declare-fun b!815944 () Bool)

(assert (=> b!815944 (= e!452465 (not true))))

(declare-datatypes ((tuple2!9328 0))(
  ( (tuple2!9329 (_1!4675 (_ BitVec 64)) (_2!4675 V!24019)) )
))
(declare-datatypes ((List!15147 0))(
  ( (Nil!15144) (Cons!15143 (h!16278 tuple2!9328) (t!21458 List!15147)) )
))
(declare-datatypes ((ListLongMap!8153 0))(
  ( (ListLongMap!8154 (toList!4092 List!15147)) )
))
(declare-fun lt!365235 () ListLongMap!8153)

(declare-fun lt!365236 () ListLongMap!8153)

(assert (=> b!815944 (= lt!365235 lt!365236)))

(declare-fun zeroValueBefore!34 () V!24019)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24019)

(declare-fun minValue!754 () V!24019)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27751 0))(
  ( (Unit!27752) )
))
(declare-fun lt!365234 () Unit!27751)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!287 (array!44727 array!44725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 V!24019 V!24019 (_ BitVec 32) Int) Unit!27751)

(assert (=> b!815944 (= lt!365234 (lemmaNoChangeToArrayThenSameMapNoExtras!287 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2199 (array!44727 array!44725 (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 (_ BitVec 32) Int) ListLongMap!8153)

(assert (=> b!815944 (= lt!365236 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815944 (= lt!365235 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22978 () Bool)

(declare-fun tp!44376 () Bool)

(declare-fun e!452466 () Bool)

(assert (=> mapNonEmpty!22978 (= mapRes!22978 (and tp!44376 e!452466))))

(declare-fun mapKey!22978 () (_ BitVec 32))

(declare-fun mapValue!22978 () ValueCell!6716)

(declare-fun mapRest!22978 () (Array (_ BitVec 32) ValueCell!6716))

(assert (=> mapNonEmpty!22978 (= (arr!21417 _values!788) (store mapRest!22978 mapKey!22978 mapValue!22978))))

(declare-fun mapIsEmpty!22978 () Bool)

(assert (=> mapIsEmpty!22978 mapRes!22978))

(declare-fun b!815945 () Bool)

(declare-fun res!556955 () Bool)

(assert (=> b!815945 (=> (not res!556955) (not e!452465))))

(assert (=> b!815945 (= res!556955 (and (= (size!21837 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21838 _keys!976) (size!21837 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815946 () Bool)

(assert (=> b!815946 (= e!452466 tp_is_empty!14263)))

(assert (= (and start!70312 res!556952) b!815945))

(assert (= (and b!815945 res!556955) b!815941))

(assert (= (and b!815941 res!556953) b!815942))

(assert (= (and b!815942 res!556954) b!815944))

(assert (= (and b!815940 condMapEmpty!22978) mapIsEmpty!22978))

(assert (= (and b!815940 (not condMapEmpty!22978)) mapNonEmpty!22978))

(get-info :version)

(assert (= (and mapNonEmpty!22978 ((_ is ValueCellFull!6716) mapValue!22978)) b!815946))

(assert (= (and b!815940 ((_ is ValueCellFull!6716) mapDefault!22978)) b!815943))

(assert (= start!70312 b!815940))

(declare-fun m!758049 () Bool)

(assert (=> b!815941 m!758049))

(declare-fun m!758051 () Bool)

(assert (=> mapNonEmpty!22978 m!758051))

(declare-fun m!758053 () Bool)

(assert (=> start!70312 m!758053))

(declare-fun m!758055 () Bool)

(assert (=> start!70312 m!758055))

(declare-fun m!758057 () Bool)

(assert (=> start!70312 m!758057))

(declare-fun m!758059 () Bool)

(assert (=> b!815942 m!758059))

(declare-fun m!758061 () Bool)

(assert (=> b!815944 m!758061))

(declare-fun m!758063 () Bool)

(assert (=> b!815944 m!758063))

(declare-fun m!758065 () Bool)

(assert (=> b!815944 m!758065))

(check-sat (not start!70312) (not b!815941) (not b!815944) (not mapNonEmpty!22978) (not b_next!12553) (not b!815942) tp_is_empty!14263 b_and!21343)
(check-sat b_and!21343 (not b_next!12553))
