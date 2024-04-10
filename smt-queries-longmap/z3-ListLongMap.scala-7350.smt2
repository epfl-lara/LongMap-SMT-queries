; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93806 () Bool)

(assert start!93806)

(declare-fun b_free!21279 () Bool)

(declare-fun b_next!21279 () Bool)

(assert (=> start!93806 (= b_free!21279 (not b_next!21279))))

(declare-fun tp!75259 () Bool)

(declare-fun b_and!33993 () Bool)

(assert (=> start!93806 (= tp!75259 b_and!33993)))

(declare-fun b!1060991 () Bool)

(declare-fun res!708566 () Bool)

(declare-fun e!604125 () Bool)

(assert (=> b!1060991 (=> (not res!708566) (not e!604125))))

(declare-datatypes ((array!67187 0))(
  ( (array!67188 (arr!32301 (Array (_ BitVec 32) (_ BitVec 64))) (size!32837 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67187)

(declare-datatypes ((List!22501 0))(
  ( (Nil!22498) (Cons!22497 (h!23706 (_ BitVec 64)) (t!31810 List!22501)) )
))
(declare-fun arrayNoDuplicates!0 (array!67187 (_ BitVec 32) List!22501) Bool)

(assert (=> b!1060991 (= res!708566 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22498))))

(declare-fun mapNonEmpty!39304 () Bool)

(declare-fun mapRes!39304 () Bool)

(declare-fun tp!75260 () Bool)

(declare-fun e!604124 () Bool)

(assert (=> mapNonEmpty!39304 (= mapRes!39304 (and tp!75260 e!604124))))

(declare-datatypes ((V!38587 0))(
  ( (V!38588 (val!12595 Int)) )
))
(declare-datatypes ((ValueCell!11841 0))(
  ( (ValueCellFull!11841 (v!15205 V!38587)) (EmptyCell!11841) )
))
(declare-fun mapRest!39304 () (Array (_ BitVec 32) ValueCell!11841))

(declare-datatypes ((array!67189 0))(
  ( (array!67190 (arr!32302 (Array (_ BitVec 32) ValueCell!11841)) (size!32838 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67189)

(declare-fun mapKey!39304 () (_ BitVec 32))

(declare-fun mapValue!39304 () ValueCell!11841)

(assert (=> mapNonEmpty!39304 (= (arr!32302 _values!955) (store mapRest!39304 mapKey!39304 mapValue!39304))))

(declare-fun b!1060992 () Bool)

(declare-fun res!708565 () Bool)

(assert (=> b!1060992 (=> (not res!708565) (not e!604125))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060992 (= res!708565 (and (= (size!32838 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32837 _keys!1163) (size!32838 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708568 () Bool)

(assert (=> start!93806 (=> (not res!708568) (not e!604125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93806 (= res!708568 (validMask!0 mask!1515))))

(assert (=> start!93806 e!604125))

(assert (=> start!93806 true))

(declare-fun tp_is_empty!25089 () Bool)

(assert (=> start!93806 tp_is_empty!25089))

(declare-fun e!604128 () Bool)

(declare-fun array_inv!25032 (array!67189) Bool)

(assert (=> start!93806 (and (array_inv!25032 _values!955) e!604128)))

(assert (=> start!93806 tp!75259))

(declare-fun array_inv!25033 (array!67187) Bool)

(assert (=> start!93806 (array_inv!25033 _keys!1163)))

(declare-fun b!1060993 () Bool)

(assert (=> b!1060993 (= e!604124 tp_is_empty!25089)))

(declare-fun mapIsEmpty!39304 () Bool)

(assert (=> mapIsEmpty!39304 mapRes!39304))

(declare-fun b!1060994 () Bool)

(assert (=> b!1060994 (= e!604125 false)))

(declare-datatypes ((tuple2!15914 0))(
  ( (tuple2!15915 (_1!7968 (_ BitVec 64)) (_2!7968 V!38587)) )
))
(declare-datatypes ((List!22502 0))(
  ( (Nil!22499) (Cons!22498 (h!23707 tuple2!15914) (t!31811 List!22502)) )
))
(declare-datatypes ((ListLongMap!13883 0))(
  ( (ListLongMap!13884 (toList!6957 List!22502)) )
))
(declare-fun lt!467436 () ListLongMap!13883)

(declare-fun minValue!907 () V!38587)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38587)

(declare-fun getCurrentListMapNoExtraKeys!3559 (array!67187 array!67189 (_ BitVec 32) (_ BitVec 32) V!38587 V!38587 (_ BitVec 32) Int) ListLongMap!13883)

(assert (=> b!1060994 (= lt!467436 (getCurrentListMapNoExtraKeys!3559 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38587)

(declare-fun lt!467437 () ListLongMap!13883)

(assert (=> b!1060994 (= lt!467437 (getCurrentListMapNoExtraKeys!3559 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060995 () Bool)

(declare-fun res!708567 () Bool)

(assert (=> b!1060995 (=> (not res!708567) (not e!604125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67187 (_ BitVec 32)) Bool)

(assert (=> b!1060995 (= res!708567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060996 () Bool)

(declare-fun e!604127 () Bool)

(assert (=> b!1060996 (= e!604128 (and e!604127 mapRes!39304))))

(declare-fun condMapEmpty!39304 () Bool)

(declare-fun mapDefault!39304 () ValueCell!11841)

(assert (=> b!1060996 (= condMapEmpty!39304 (= (arr!32302 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11841)) mapDefault!39304)))))

(declare-fun b!1060997 () Bool)

(assert (=> b!1060997 (= e!604127 tp_is_empty!25089)))

(assert (= (and start!93806 res!708568) b!1060992))

(assert (= (and b!1060992 res!708565) b!1060995))

(assert (= (and b!1060995 res!708567) b!1060991))

(assert (= (and b!1060991 res!708566) b!1060994))

(assert (= (and b!1060996 condMapEmpty!39304) mapIsEmpty!39304))

(assert (= (and b!1060996 (not condMapEmpty!39304)) mapNonEmpty!39304))

(get-info :version)

(assert (= (and mapNonEmpty!39304 ((_ is ValueCellFull!11841) mapValue!39304)) b!1060993))

(assert (= (and b!1060996 ((_ is ValueCellFull!11841) mapDefault!39304)) b!1060997))

(assert (= start!93806 b!1060996))

(declare-fun m!979927 () Bool)

(assert (=> b!1060995 m!979927))

(declare-fun m!979929 () Bool)

(assert (=> b!1060994 m!979929))

(declare-fun m!979931 () Bool)

(assert (=> b!1060994 m!979931))

(declare-fun m!979933 () Bool)

(assert (=> start!93806 m!979933))

(declare-fun m!979935 () Bool)

(assert (=> start!93806 m!979935))

(declare-fun m!979937 () Bool)

(assert (=> start!93806 m!979937))

(declare-fun m!979939 () Bool)

(assert (=> mapNonEmpty!39304 m!979939))

(declare-fun m!979941 () Bool)

(assert (=> b!1060991 m!979941))

(check-sat (not b_next!21279) (not mapNonEmpty!39304) b_and!33993 (not start!93806) tp_is_empty!25089 (not b!1060994) (not b!1060995) (not b!1060991))
(check-sat b_and!33993 (not b_next!21279))
