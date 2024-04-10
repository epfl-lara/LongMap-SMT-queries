; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93770 () Bool)

(assert start!93770)

(declare-fun b_free!21243 () Bool)

(declare-fun b_next!21243 () Bool)

(assert (=> start!93770 (= b_free!21243 (not b_next!21243))))

(declare-fun tp!75151 () Bool)

(declare-fun b_and!33957 () Bool)

(assert (=> start!93770 (= tp!75151 b_and!33957)))

(declare-fun b!1060613 () Bool)

(declare-fun res!708350 () Bool)

(declare-fun e!603858 () Bool)

(assert (=> b!1060613 (=> (not res!708350) (not e!603858))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38539 0))(
  ( (V!38540 (val!12577 Int)) )
))
(declare-datatypes ((ValueCell!11823 0))(
  ( (ValueCellFull!11823 (v!15187 V!38539)) (EmptyCell!11823) )
))
(declare-datatypes ((array!67123 0))(
  ( (array!67124 (arr!32269 (Array (_ BitVec 32) ValueCell!11823)) (size!32805 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67123)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67125 0))(
  ( (array!67126 (arr!32270 (Array (_ BitVec 32) (_ BitVec 64))) (size!32806 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67125)

(assert (=> b!1060613 (= res!708350 (and (= (size!32805 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32806 _keys!1163) (size!32805 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060614 () Bool)

(declare-fun e!603854 () Bool)

(declare-fun tp_is_empty!25053 () Bool)

(assert (=> b!1060614 (= e!603854 tp_is_empty!25053)))

(declare-fun b!1060615 () Bool)

(declare-fun e!603855 () Bool)

(assert (=> b!1060615 (= e!603855 tp_is_empty!25053)))

(declare-fun res!708351 () Bool)

(assert (=> start!93770 (=> (not res!708351) (not e!603858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93770 (= res!708351 (validMask!0 mask!1515))))

(assert (=> start!93770 e!603858))

(assert (=> start!93770 true))

(assert (=> start!93770 tp_is_empty!25053))

(declare-fun e!603856 () Bool)

(declare-fun array_inv!25004 (array!67123) Bool)

(assert (=> start!93770 (and (array_inv!25004 _values!955) e!603856)))

(assert (=> start!93770 tp!75151))

(declare-fun array_inv!25005 (array!67125) Bool)

(assert (=> start!93770 (array_inv!25005 _keys!1163)))

(declare-fun b!1060616 () Bool)

(declare-fun res!708352 () Bool)

(assert (=> b!1060616 (=> (not res!708352) (not e!603858))))

(declare-datatypes ((List!22481 0))(
  ( (Nil!22478) (Cons!22477 (h!23686 (_ BitVec 64)) (t!31790 List!22481)) )
))
(declare-fun arrayNoDuplicates!0 (array!67125 (_ BitVec 32) List!22481) Bool)

(assert (=> b!1060616 (= res!708352 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22478))))

(declare-fun mapNonEmpty!39250 () Bool)

(declare-fun mapRes!39250 () Bool)

(declare-fun tp!75152 () Bool)

(assert (=> mapNonEmpty!39250 (= mapRes!39250 (and tp!75152 e!603854))))

(declare-fun mapRest!39250 () (Array (_ BitVec 32) ValueCell!11823))

(declare-fun mapValue!39250 () ValueCell!11823)

(declare-fun mapKey!39250 () (_ BitVec 32))

(assert (=> mapNonEmpty!39250 (= (arr!32269 _values!955) (store mapRest!39250 mapKey!39250 mapValue!39250))))

(declare-fun b!1060617 () Bool)

(assert (=> b!1060617 (= e!603856 (and e!603855 mapRes!39250))))

(declare-fun condMapEmpty!39250 () Bool)

(declare-fun mapDefault!39250 () ValueCell!11823)

(assert (=> b!1060617 (= condMapEmpty!39250 (= (arr!32269 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11823)) mapDefault!39250)))))

(declare-fun b!1060618 () Bool)

(assert (=> b!1060618 (= e!603858 false)))

(declare-datatypes ((tuple2!15894 0))(
  ( (tuple2!15895 (_1!7958 (_ BitVec 64)) (_2!7958 V!38539)) )
))
(declare-datatypes ((List!22482 0))(
  ( (Nil!22479) (Cons!22478 (h!23687 tuple2!15894) (t!31791 List!22482)) )
))
(declare-datatypes ((ListLongMap!13863 0))(
  ( (ListLongMap!13864 (toList!6947 List!22482)) )
))
(declare-fun lt!467329 () ListLongMap!13863)

(declare-fun minValue!907 () V!38539)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38539)

(declare-fun getCurrentListMapNoExtraKeys!3549 (array!67125 array!67123 (_ BitVec 32) (_ BitVec 32) V!38539 V!38539 (_ BitVec 32) Int) ListLongMap!13863)

(assert (=> b!1060618 (= lt!467329 (getCurrentListMapNoExtraKeys!3549 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38539)

(declare-fun lt!467328 () ListLongMap!13863)

(assert (=> b!1060618 (= lt!467328 (getCurrentListMapNoExtraKeys!3549 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39250 () Bool)

(assert (=> mapIsEmpty!39250 mapRes!39250))

(declare-fun b!1060619 () Bool)

(declare-fun res!708349 () Bool)

(assert (=> b!1060619 (=> (not res!708349) (not e!603858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67125 (_ BitVec 32)) Bool)

(assert (=> b!1060619 (= res!708349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93770 res!708351) b!1060613))

(assert (= (and b!1060613 res!708350) b!1060619))

(assert (= (and b!1060619 res!708349) b!1060616))

(assert (= (and b!1060616 res!708352) b!1060618))

(assert (= (and b!1060617 condMapEmpty!39250) mapIsEmpty!39250))

(assert (= (and b!1060617 (not condMapEmpty!39250)) mapNonEmpty!39250))

(get-info :version)

(assert (= (and mapNonEmpty!39250 ((_ is ValueCellFull!11823) mapValue!39250)) b!1060614))

(assert (= (and b!1060617 ((_ is ValueCellFull!11823) mapDefault!39250)) b!1060615))

(assert (= start!93770 b!1060617))

(declare-fun m!979639 () Bool)

(assert (=> b!1060618 m!979639))

(declare-fun m!979641 () Bool)

(assert (=> b!1060618 m!979641))

(declare-fun m!979643 () Bool)

(assert (=> mapNonEmpty!39250 m!979643))

(declare-fun m!979645 () Bool)

(assert (=> start!93770 m!979645))

(declare-fun m!979647 () Bool)

(assert (=> start!93770 m!979647))

(declare-fun m!979649 () Bool)

(assert (=> start!93770 m!979649))

(declare-fun m!979651 () Bool)

(assert (=> b!1060616 m!979651))

(declare-fun m!979653 () Bool)

(assert (=> b!1060619 m!979653))

(check-sat tp_is_empty!25053 (not b!1060616) (not b!1060618) (not mapNonEmpty!39250) (not b_next!21243) (not start!93770) (not b!1060619) b_and!33957)
(check-sat b_and!33957 (not b_next!21243))
