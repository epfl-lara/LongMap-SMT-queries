; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93690 () Bool)

(assert start!93690)

(declare-fun b_free!21181 () Bool)

(declare-fun b_next!21181 () Bool)

(assert (=> start!93690 (= b_free!21181 (not b_next!21181))))

(declare-fun tp!74963 () Bool)

(declare-fun b_and!33865 () Bool)

(assert (=> start!93690 (= tp!74963 b_and!33865)))

(declare-fun mapIsEmpty!39154 () Bool)

(declare-fun mapRes!39154 () Bool)

(assert (=> mapIsEmpty!39154 mapRes!39154))

(declare-fun res!707884 () Bool)

(declare-fun e!603251 () Bool)

(assert (=> start!93690 (=> (not res!707884) (not e!603251))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93690 (= res!707884 (validMask!0 mask!1515))))

(assert (=> start!93690 e!603251))

(assert (=> start!93690 true))

(declare-fun tp_is_empty!24991 () Bool)

(assert (=> start!93690 tp_is_empty!24991))

(declare-datatypes ((V!38457 0))(
  ( (V!38458 (val!12546 Int)) )
))
(declare-datatypes ((ValueCell!11792 0))(
  ( (ValueCellFull!11792 (v!15155 V!38457)) (EmptyCell!11792) )
))
(declare-datatypes ((array!66946 0))(
  ( (array!66947 (arr!32182 (Array (_ BitVec 32) ValueCell!11792)) (size!32720 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66946)

(declare-fun e!603248 () Bool)

(declare-fun array_inv!24948 (array!66946) Bool)

(assert (=> start!93690 (and (array_inv!24948 _values!955) e!603248)))

(assert (=> start!93690 tp!74963))

(declare-datatypes ((array!66948 0))(
  ( (array!66949 (arr!32183 (Array (_ BitVec 32) (_ BitVec 64))) (size!32721 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66948)

(declare-fun array_inv!24949 (array!66948) Bool)

(assert (=> start!93690 (array_inv!24949 _keys!1163)))

(declare-fun b!1059736 () Bool)

(assert (=> b!1059736 (= e!603251 false)))

(declare-fun zeroValueBefore!47 () V!38457)

(declare-datatypes ((tuple2!15918 0))(
  ( (tuple2!15919 (_1!7970 (_ BitVec 64)) (_2!7970 V!38457)) )
))
(declare-datatypes ((List!22471 0))(
  ( (Nil!22468) (Cons!22467 (h!23676 tuple2!15918) (t!31769 List!22471)) )
))
(declare-datatypes ((ListLongMap!13887 0))(
  ( (ListLongMap!13888 (toList!6959 List!22471)) )
))
(declare-fun lt!466991 () ListLongMap!13887)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38457)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3576 (array!66948 array!66946 (_ BitVec 32) (_ BitVec 32) V!38457 V!38457 (_ BitVec 32) Int) ListLongMap!13887)

(assert (=> b!1059736 (= lt!466991 (getCurrentListMapNoExtraKeys!3576 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059737 () Bool)

(declare-fun e!603249 () Bool)

(assert (=> b!1059737 (= e!603249 tp_is_empty!24991)))

(declare-fun b!1059738 () Bool)

(declare-fun res!707883 () Bool)

(assert (=> b!1059738 (=> (not res!707883) (not e!603251))))

(declare-datatypes ((List!22472 0))(
  ( (Nil!22469) (Cons!22468 (h!23677 (_ BitVec 64)) (t!31770 List!22472)) )
))
(declare-fun arrayNoDuplicates!0 (array!66948 (_ BitVec 32) List!22472) Bool)

(assert (=> b!1059738 (= res!707883 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22469))))

(declare-fun b!1059739 () Bool)

(declare-fun e!603250 () Bool)

(assert (=> b!1059739 (= e!603248 (and e!603250 mapRes!39154))))

(declare-fun condMapEmpty!39154 () Bool)

(declare-fun mapDefault!39154 () ValueCell!11792)

(assert (=> b!1059739 (= condMapEmpty!39154 (= (arr!32182 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11792)) mapDefault!39154)))))

(declare-fun b!1059740 () Bool)

(assert (=> b!1059740 (= e!603250 tp_is_empty!24991)))

(declare-fun b!1059741 () Bool)

(declare-fun res!707882 () Bool)

(assert (=> b!1059741 (=> (not res!707882) (not e!603251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66948 (_ BitVec 32)) Bool)

(assert (=> b!1059741 (= res!707882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39154 () Bool)

(declare-fun tp!74962 () Bool)

(assert (=> mapNonEmpty!39154 (= mapRes!39154 (and tp!74962 e!603249))))

(declare-fun mapRest!39154 () (Array (_ BitVec 32) ValueCell!11792))

(declare-fun mapKey!39154 () (_ BitVec 32))

(declare-fun mapValue!39154 () ValueCell!11792)

(assert (=> mapNonEmpty!39154 (= (arr!32182 _values!955) (store mapRest!39154 mapKey!39154 mapValue!39154))))

(declare-fun b!1059742 () Bool)

(declare-fun res!707881 () Bool)

(assert (=> b!1059742 (=> (not res!707881) (not e!603251))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059742 (= res!707881 (and (= (size!32720 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32721 _keys!1163) (size!32720 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93690 res!707884) b!1059742))

(assert (= (and b!1059742 res!707881) b!1059741))

(assert (= (and b!1059741 res!707882) b!1059738))

(assert (= (and b!1059738 res!707883) b!1059736))

(assert (= (and b!1059739 condMapEmpty!39154) mapIsEmpty!39154))

(assert (= (and b!1059739 (not condMapEmpty!39154)) mapNonEmpty!39154))

(get-info :version)

(assert (= (and mapNonEmpty!39154 ((_ is ValueCellFull!11792) mapValue!39154)) b!1059737))

(assert (= (and b!1059739 ((_ is ValueCellFull!11792) mapDefault!39154)) b!1059740))

(assert (= start!93690 b!1059739))

(declare-fun m!978527 () Bool)

(assert (=> start!93690 m!978527))

(declare-fun m!978529 () Bool)

(assert (=> start!93690 m!978529))

(declare-fun m!978531 () Bool)

(assert (=> start!93690 m!978531))

(declare-fun m!978533 () Bool)

(assert (=> b!1059736 m!978533))

(declare-fun m!978535 () Bool)

(assert (=> mapNonEmpty!39154 m!978535))

(declare-fun m!978537 () Bool)

(assert (=> b!1059741 m!978537))

(declare-fun m!978539 () Bool)

(assert (=> b!1059738 m!978539))

(check-sat (not b_next!21181) (not b!1059741) (not b!1059736) (not b!1059738) b_and!33865 tp_is_empty!24991 (not mapNonEmpty!39154) (not start!93690))
(check-sat b_and!33865 (not b_next!21181))
