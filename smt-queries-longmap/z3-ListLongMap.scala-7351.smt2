; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93804 () Bool)

(assert start!93804)

(declare-fun b_free!21283 () Bool)

(declare-fun b_next!21283 () Bool)

(assert (=> start!93804 (= b_free!21283 (not b_next!21283))))

(declare-fun tp!75271 () Bool)

(declare-fun b_and!33971 () Bool)

(assert (=> start!93804 (= tp!75271 b_and!33971)))

(declare-fun mapNonEmpty!39310 () Bool)

(declare-fun mapRes!39310 () Bool)

(declare-fun tp!75272 () Bool)

(declare-fun e!604063 () Bool)

(assert (=> mapNonEmpty!39310 (= mapRes!39310 (and tp!75272 e!604063))))

(declare-datatypes ((V!38593 0))(
  ( (V!38594 (val!12597 Int)) )
))
(declare-datatypes ((ValueCell!11843 0))(
  ( (ValueCellFull!11843 (v!15206 V!38593)) (EmptyCell!11843) )
))
(declare-fun mapRest!39310 () (Array (_ BitVec 32) ValueCell!11843))

(declare-fun mapKey!39310 () (_ BitVec 32))

(declare-datatypes ((array!67140 0))(
  ( (array!67141 (arr!32278 (Array (_ BitVec 32) ValueCell!11843)) (size!32816 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67140)

(declare-fun mapValue!39310 () ValueCell!11843)

(assert (=> mapNonEmpty!39310 (= (arr!32278 _values!955) (store mapRest!39310 mapKey!39310 mapValue!39310))))

(declare-fun mapIsEmpty!39310 () Bool)

(assert (=> mapIsEmpty!39310 mapRes!39310))

(declare-fun res!708523 () Bool)

(declare-fun e!604065 () Bool)

(assert (=> start!93804 (=> (not res!708523) (not e!604065))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93804 (= res!708523 (validMask!0 mask!1515))))

(assert (=> start!93804 e!604065))

(assert (=> start!93804 true))

(declare-fun tp_is_empty!25093 () Bool)

(assert (=> start!93804 tp_is_empty!25093))

(declare-fun e!604062 () Bool)

(declare-fun array_inv!25020 (array!67140) Bool)

(assert (=> start!93804 (and (array_inv!25020 _values!955) e!604062)))

(assert (=> start!93804 tp!75271))

(declare-datatypes ((array!67142 0))(
  ( (array!67143 (arr!32279 (Array (_ BitVec 32) (_ BitVec 64))) (size!32817 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67142)

(declare-fun array_inv!25021 (array!67142) Bool)

(assert (=> start!93804 (array_inv!25021 _keys!1163)))

(declare-fun b!1060880 () Bool)

(assert (=> b!1060880 (= e!604063 tp_is_empty!25093)))

(declare-fun b!1060881 () Bool)

(declare-fun e!604061 () Bool)

(assert (=> b!1060881 (= e!604061 tp_is_empty!25093)))

(declare-fun b!1060882 () Bool)

(declare-fun res!708520 () Bool)

(assert (=> b!1060882 (=> (not res!708520) (not e!604065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67142 (_ BitVec 32)) Bool)

(assert (=> b!1060882 (= res!708520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060883 () Bool)

(declare-fun res!708522 () Bool)

(assert (=> b!1060883 (=> (not res!708522) (not e!604065))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060883 (= res!708522 (and (= (size!32816 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32817 _keys!1163) (size!32816 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060884 () Bool)

(assert (=> b!1060884 (= e!604062 (and e!604061 mapRes!39310))))

(declare-fun condMapEmpty!39310 () Bool)

(declare-fun mapDefault!39310 () ValueCell!11843)

(assert (=> b!1060884 (= condMapEmpty!39310 (= (arr!32278 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11843)) mapDefault!39310)))))

(declare-fun b!1060885 () Bool)

(assert (=> b!1060885 (= e!604065 false)))

(declare-fun minValue!907 () V!38593)

(declare-datatypes ((tuple2!15990 0))(
  ( (tuple2!15991 (_1!8006 (_ BitVec 64)) (_2!8006 V!38593)) )
))
(declare-datatypes ((List!22544 0))(
  ( (Nil!22541) (Cons!22540 (h!23749 tuple2!15990) (t!31844 List!22544)) )
))
(declare-datatypes ((ListLongMap!13959 0))(
  ( (ListLongMap!13960 (toList!6995 List!22544)) )
))
(declare-fun lt!467248 () ListLongMap!13959)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38593)

(declare-fun getCurrentListMapNoExtraKeys!3612 (array!67142 array!67140 (_ BitVec 32) (_ BitVec 32) V!38593 V!38593 (_ BitVec 32) Int) ListLongMap!13959)

(assert (=> b!1060885 (= lt!467248 (getCurrentListMapNoExtraKeys!3612 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38593)

(declare-fun lt!467249 () ListLongMap!13959)

(assert (=> b!1060885 (= lt!467249 (getCurrentListMapNoExtraKeys!3612 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060886 () Bool)

(declare-fun res!708521 () Bool)

(assert (=> b!1060886 (=> (not res!708521) (not e!604065))))

(declare-datatypes ((List!22545 0))(
  ( (Nil!22542) (Cons!22541 (h!23750 (_ BitVec 64)) (t!31845 List!22545)) )
))
(declare-fun arrayNoDuplicates!0 (array!67142 (_ BitVec 32) List!22545) Bool)

(assert (=> b!1060886 (= res!708521 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22542))))

(assert (= (and start!93804 res!708523) b!1060883))

(assert (= (and b!1060883 res!708522) b!1060882))

(assert (= (and b!1060882 res!708520) b!1060886))

(assert (= (and b!1060886 res!708521) b!1060885))

(assert (= (and b!1060884 condMapEmpty!39310) mapIsEmpty!39310))

(assert (= (and b!1060884 (not condMapEmpty!39310)) mapNonEmpty!39310))

(get-info :version)

(assert (= (and mapNonEmpty!39310 ((_ is ValueCellFull!11843) mapValue!39310)) b!1060880))

(assert (= (and b!1060884 ((_ is ValueCellFull!11843) mapDefault!39310)) b!1060881))

(assert (= start!93804 b!1060884))

(declare-fun m!979333 () Bool)

(assert (=> b!1060885 m!979333))

(declare-fun m!979335 () Bool)

(assert (=> b!1060885 m!979335))

(declare-fun m!979337 () Bool)

(assert (=> b!1060882 m!979337))

(declare-fun m!979339 () Bool)

(assert (=> b!1060886 m!979339))

(declare-fun m!979341 () Bool)

(assert (=> start!93804 m!979341))

(declare-fun m!979343 () Bool)

(assert (=> start!93804 m!979343))

(declare-fun m!979345 () Bool)

(assert (=> start!93804 m!979345))

(declare-fun m!979347 () Bool)

(assert (=> mapNonEmpty!39310 m!979347))

(check-sat tp_is_empty!25093 b_and!33971 (not b_next!21283) (not mapNonEmpty!39310) (not start!93804) (not b!1060886) (not b!1060882) (not b!1060885))
(check-sat b_and!33971 (not b_next!21283))
