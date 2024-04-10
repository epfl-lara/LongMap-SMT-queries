; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93722 () Bool)

(assert start!93722)

(declare-fun b_free!21207 () Bool)

(declare-fun b_next!21207 () Bool)

(assert (=> start!93722 (= b_free!21207 (not b_next!21207))))

(declare-fun tp!75040 () Bool)

(declare-fun b_and!33917 () Bool)

(assert (=> start!93722 (= tp!75040 b_and!33917)))

(declare-fun b!1060162 () Bool)

(declare-fun res!708109 () Bool)

(declare-fun e!603536 () Bool)

(assert (=> b!1060162 (=> (not res!708109) (not e!603536))))

(declare-datatypes ((array!67055 0))(
  ( (array!67056 (arr!32236 (Array (_ BitVec 32) (_ BitVec 64))) (size!32772 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67055)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67055 (_ BitVec 32)) Bool)

(assert (=> b!1060162 (= res!708109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39193 () Bool)

(declare-fun mapRes!39193 () Bool)

(declare-fun tp!75041 () Bool)

(declare-fun e!603538 () Bool)

(assert (=> mapNonEmpty!39193 (= mapRes!39193 (and tp!75041 e!603538))))

(declare-fun mapKey!39193 () (_ BitVec 32))

(declare-datatypes ((V!38491 0))(
  ( (V!38492 (val!12559 Int)) )
))
(declare-datatypes ((ValueCell!11805 0))(
  ( (ValueCellFull!11805 (v!15169 V!38491)) (EmptyCell!11805) )
))
(declare-fun mapValue!39193 () ValueCell!11805)

(declare-fun mapRest!39193 () (Array (_ BitVec 32) ValueCell!11805))

(declare-datatypes ((array!67057 0))(
  ( (array!67058 (arr!32237 (Array (_ BitVec 32) ValueCell!11805)) (size!32773 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67057)

(assert (=> mapNonEmpty!39193 (= (arr!32237 _values!955) (store mapRest!39193 mapKey!39193 mapValue!39193))))

(declare-fun b!1060163 () Bool)

(declare-fun e!603539 () Bool)

(declare-fun tp_is_empty!25017 () Bool)

(assert (=> b!1060163 (= e!603539 tp_is_empty!25017)))

(declare-fun b!1060164 () Bool)

(declare-fun e!603540 () Bool)

(assert (=> b!1060164 (= e!603540 (and e!603539 mapRes!39193))))

(declare-fun condMapEmpty!39193 () Bool)

(declare-fun mapDefault!39193 () ValueCell!11805)

(assert (=> b!1060164 (= condMapEmpty!39193 (= (arr!32237 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11805)) mapDefault!39193)))))

(declare-fun mapIsEmpty!39193 () Bool)

(assert (=> mapIsEmpty!39193 mapRes!39193))

(declare-fun b!1060165 () Bool)

(declare-fun res!708107 () Bool)

(assert (=> b!1060165 (=> (not res!708107) (not e!603536))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060165 (= res!708107 (and (= (size!32773 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32772 _keys!1163) (size!32773 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060166 () Bool)

(assert (=> b!1060166 (= e!603536 false)))

(declare-fun zeroValueBefore!47 () V!38491)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38491)

(declare-datatypes ((tuple2!15876 0))(
  ( (tuple2!15877 (_1!7949 (_ BitVec 64)) (_2!7949 V!38491)) )
))
(declare-datatypes ((List!22461 0))(
  ( (Nil!22458) (Cons!22457 (h!23666 tuple2!15876) (t!31768 List!22461)) )
))
(declare-datatypes ((ListLongMap!13845 0))(
  ( (ListLongMap!13846 (toList!6938 List!22461)) )
))
(declare-fun lt!467230 () ListLongMap!13845)

(declare-fun getCurrentListMapNoExtraKeys!3540 (array!67055 array!67057 (_ BitVec 32) (_ BitVec 32) V!38491 V!38491 (_ BitVec 32) Int) ListLongMap!13845)

(assert (=> b!1060166 (= lt!467230 (getCurrentListMapNoExtraKeys!3540 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060167 () Bool)

(declare-fun res!708106 () Bool)

(assert (=> b!1060167 (=> (not res!708106) (not e!603536))))

(declare-datatypes ((List!22462 0))(
  ( (Nil!22459) (Cons!22458 (h!23667 (_ BitVec 64)) (t!31769 List!22462)) )
))
(declare-fun arrayNoDuplicates!0 (array!67055 (_ BitVec 32) List!22462) Bool)

(assert (=> b!1060167 (= res!708106 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22459))))

(declare-fun b!1060168 () Bool)

(assert (=> b!1060168 (= e!603538 tp_is_empty!25017)))

(declare-fun res!708108 () Bool)

(assert (=> start!93722 (=> (not res!708108) (not e!603536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93722 (= res!708108 (validMask!0 mask!1515))))

(assert (=> start!93722 e!603536))

(assert (=> start!93722 true))

(assert (=> start!93722 tp_is_empty!25017))

(declare-fun array_inv!24982 (array!67057) Bool)

(assert (=> start!93722 (and (array_inv!24982 _values!955) e!603540)))

(assert (=> start!93722 tp!75040))

(declare-fun array_inv!24983 (array!67055) Bool)

(assert (=> start!93722 (array_inv!24983 _keys!1163)))

(assert (= (and start!93722 res!708108) b!1060165))

(assert (= (and b!1060165 res!708107) b!1060162))

(assert (= (and b!1060162 res!708109) b!1060167))

(assert (= (and b!1060167 res!708106) b!1060166))

(assert (= (and b!1060164 condMapEmpty!39193) mapIsEmpty!39193))

(assert (= (and b!1060164 (not condMapEmpty!39193)) mapNonEmpty!39193))

(get-info :version)

(assert (= (and mapNonEmpty!39193 ((_ is ValueCellFull!11805) mapValue!39193)) b!1060168))

(assert (= (and b!1060164 ((_ is ValueCellFull!11805) mapDefault!39193)) b!1060163))

(assert (= start!93722 b!1060164))

(declare-fun m!979335 () Bool)

(assert (=> start!93722 m!979335))

(declare-fun m!979337 () Bool)

(assert (=> start!93722 m!979337))

(declare-fun m!979339 () Bool)

(assert (=> start!93722 m!979339))

(declare-fun m!979341 () Bool)

(assert (=> b!1060162 m!979341))

(declare-fun m!979343 () Bool)

(assert (=> b!1060167 m!979343))

(declare-fun m!979345 () Bool)

(assert (=> mapNonEmpty!39193 m!979345))

(declare-fun m!979347 () Bool)

(assert (=> b!1060166 m!979347))

(check-sat (not b!1060167) (not b!1060162) (not b!1060166) tp_is_empty!25017 (not start!93722) (not mapNonEmpty!39193) b_and!33917 (not b_next!21207))
(check-sat b_and!33917 (not b_next!21207))
