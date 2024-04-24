; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93956 () Bool)

(assert start!93956)

(declare-fun b_free!21205 () Bool)

(declare-fun b_next!21205 () Bool)

(assert (=> start!93956 (= b_free!21205 (not b_next!21205))))

(declare-fun tp!75034 () Bool)

(declare-fun b_and!33925 () Bool)

(assert (=> start!93956 (= tp!75034 b_and!33925)))

(declare-fun mapIsEmpty!39190 () Bool)

(declare-fun mapRes!39190 () Bool)

(assert (=> mapIsEmpty!39190 mapRes!39190))

(declare-fun b!1061468 () Bool)

(declare-fun e!604377 () Bool)

(declare-fun tp_is_empty!25015 () Bool)

(assert (=> b!1061468 (= e!604377 tp_is_empty!25015)))

(declare-fun b!1061469 () Bool)

(declare-fun e!604380 () Bool)

(assert (=> b!1061469 (= e!604380 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38489 0))(
  ( (V!38490 (val!12558 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38489)

(declare-datatypes ((tuple2!15860 0))(
  ( (tuple2!15861 (_1!7941 (_ BitVec 64)) (_2!7941 V!38489)) )
))
(declare-datatypes ((List!22444 0))(
  ( (Nil!22441) (Cons!22440 (h!23658 tuple2!15860) (t!31743 List!22444)) )
))
(declare-datatypes ((ListLongMap!13837 0))(
  ( (ListLongMap!13838 (toList!6934 List!22444)) )
))
(declare-fun lt!467742 () ListLongMap!13837)

(declare-datatypes ((ValueCell!11804 0))(
  ( (ValueCellFull!11804 (v!15164 V!38489)) (EmptyCell!11804) )
))
(declare-datatypes ((array!67099 0))(
  ( (array!67100 (arr!32252 (Array (_ BitVec 32) ValueCell!11804)) (size!32789 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67099)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38489)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67101 0))(
  ( (array!67102 (arr!32253 (Array (_ BitVec 32) (_ BitVec 64))) (size!32790 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67101)

(declare-fun getCurrentListMapNoExtraKeys!3582 (array!67101 array!67099 (_ BitVec 32) (_ BitVec 32) V!38489 V!38489 (_ BitVec 32) Int) ListLongMap!13837)

(assert (=> b!1061469 (= lt!467742 (getCurrentListMapNoExtraKeys!3582 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061470 () Bool)

(declare-fun res!708617 () Bool)

(assert (=> b!1061470 (=> (not res!708617) (not e!604380))))

(declare-datatypes ((List!22445 0))(
  ( (Nil!22442) (Cons!22441 (h!23659 (_ BitVec 64)) (t!31744 List!22445)) )
))
(declare-fun arrayNoDuplicates!0 (array!67101 (_ BitVec 32) List!22445) Bool)

(assert (=> b!1061470 (= res!708617 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22442))))

(declare-fun b!1061471 () Bool)

(declare-fun e!604378 () Bool)

(assert (=> b!1061471 (= e!604378 tp_is_empty!25015)))

(declare-fun b!1061472 () Bool)

(declare-fun e!604376 () Bool)

(assert (=> b!1061472 (= e!604376 (and e!604378 mapRes!39190))))

(declare-fun condMapEmpty!39190 () Bool)

(declare-fun mapDefault!39190 () ValueCell!11804)

(assert (=> b!1061472 (= condMapEmpty!39190 (= (arr!32252 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11804)) mapDefault!39190)))))

(declare-fun b!1061473 () Bool)

(declare-fun res!708618 () Bool)

(assert (=> b!1061473 (=> (not res!708618) (not e!604380))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061473 (= res!708618 (and (= (size!32789 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32790 _keys!1163) (size!32789 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061474 () Bool)

(declare-fun res!708619 () Bool)

(assert (=> b!1061474 (=> (not res!708619) (not e!604380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67101 (_ BitVec 32)) Bool)

(assert (=> b!1061474 (= res!708619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708616 () Bool)

(assert (=> start!93956 (=> (not res!708616) (not e!604380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93956 (= res!708616 (validMask!0 mask!1515))))

(assert (=> start!93956 e!604380))

(assert (=> start!93956 true))

(assert (=> start!93956 tp_is_empty!25015))

(declare-fun array_inv!25008 (array!67099) Bool)

(assert (=> start!93956 (and (array_inv!25008 _values!955) e!604376)))

(assert (=> start!93956 tp!75034))

(declare-fun array_inv!25009 (array!67101) Bool)

(assert (=> start!93956 (array_inv!25009 _keys!1163)))

(declare-fun mapNonEmpty!39190 () Bool)

(declare-fun tp!75035 () Bool)

(assert (=> mapNonEmpty!39190 (= mapRes!39190 (and tp!75035 e!604377))))

(declare-fun mapRest!39190 () (Array (_ BitVec 32) ValueCell!11804))

(declare-fun mapValue!39190 () ValueCell!11804)

(declare-fun mapKey!39190 () (_ BitVec 32))

(assert (=> mapNonEmpty!39190 (= (arr!32252 _values!955) (store mapRest!39190 mapKey!39190 mapValue!39190))))

(assert (= (and start!93956 res!708616) b!1061473))

(assert (= (and b!1061473 res!708618) b!1061474))

(assert (= (and b!1061474 res!708619) b!1061470))

(assert (= (and b!1061470 res!708617) b!1061469))

(assert (= (and b!1061472 condMapEmpty!39190) mapIsEmpty!39190))

(assert (= (and b!1061472 (not condMapEmpty!39190)) mapNonEmpty!39190))

(get-info :version)

(assert (= (and mapNonEmpty!39190 ((_ is ValueCellFull!11804) mapValue!39190)) b!1061468))

(assert (= (and b!1061472 ((_ is ValueCellFull!11804) mapDefault!39190)) b!1061471))

(assert (= start!93956 b!1061472))

(declare-fun m!980993 () Bool)

(assert (=> b!1061474 m!980993))

(declare-fun m!980995 () Bool)

(assert (=> start!93956 m!980995))

(declare-fun m!980997 () Bool)

(assert (=> start!93956 m!980997))

(declare-fun m!980999 () Bool)

(assert (=> start!93956 m!980999))

(declare-fun m!981001 () Bool)

(assert (=> b!1061469 m!981001))

(declare-fun m!981003 () Bool)

(assert (=> b!1061470 m!981003))

(declare-fun m!981005 () Bool)

(assert (=> mapNonEmpty!39190 m!981005))

(check-sat (not b!1061470) (not start!93956) tp_is_empty!25015 (not b_next!21205) (not b!1061474) (not mapNonEmpty!39190) (not b!1061469) b_and!33925)
(check-sat b_and!33925 (not b_next!21205))
