; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93704 () Bool)

(assert start!93704)

(declare-fun b_free!21189 () Bool)

(declare-fun b_next!21189 () Bool)

(assert (=> start!93704 (= b_free!21189 (not b_next!21189))))

(declare-fun tp!74986 () Bool)

(declare-fun b_and!33899 () Bool)

(assert (=> start!93704 (= tp!74986 b_and!33899)))

(declare-fun b!1059973 () Bool)

(declare-fun res!708001 () Bool)

(declare-fun e!603402 () Bool)

(assert (=> b!1059973 (=> (not res!708001) (not e!603402))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38467 0))(
  ( (V!38468 (val!12550 Int)) )
))
(declare-datatypes ((ValueCell!11796 0))(
  ( (ValueCellFull!11796 (v!15160 V!38467)) (EmptyCell!11796) )
))
(declare-datatypes ((array!67023 0))(
  ( (array!67024 (arr!32220 (Array (_ BitVec 32) ValueCell!11796)) (size!32756 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67023)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67025 0))(
  ( (array!67026 (arr!32221 (Array (_ BitVec 32) (_ BitVec 64))) (size!32757 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67025)

(assert (=> b!1059973 (= res!708001 (and (= (size!32756 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32757 _keys!1163) (size!32756 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059974 () Bool)

(declare-fun e!603401 () Bool)

(declare-fun tp_is_empty!24999 () Bool)

(assert (=> b!1059974 (= e!603401 tp_is_empty!24999)))

(declare-fun b!1059976 () Bool)

(declare-fun e!603405 () Bool)

(declare-fun e!603404 () Bool)

(declare-fun mapRes!39166 () Bool)

(assert (=> b!1059976 (= e!603405 (and e!603404 mapRes!39166))))

(declare-fun condMapEmpty!39166 () Bool)

(declare-fun mapDefault!39166 () ValueCell!11796)

(assert (=> b!1059976 (= condMapEmpty!39166 (= (arr!32220 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11796)) mapDefault!39166)))))

(declare-fun mapIsEmpty!39166 () Bool)

(assert (=> mapIsEmpty!39166 mapRes!39166))

(declare-fun b!1059977 () Bool)

(declare-fun res!708000 () Bool)

(assert (=> b!1059977 (=> (not res!708000) (not e!603402))))

(declare-datatypes ((List!22451 0))(
  ( (Nil!22448) (Cons!22447 (h!23656 (_ BitVec 64)) (t!31758 List!22451)) )
))
(declare-fun arrayNoDuplicates!0 (array!67025 (_ BitVec 32) List!22451) Bool)

(assert (=> b!1059977 (= res!708000 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22448))))

(declare-fun b!1059978 () Bool)

(assert (=> b!1059978 (= e!603402 false)))

(declare-fun zeroValueBefore!47 () V!38467)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38467)

(declare-datatypes ((tuple2!15864 0))(
  ( (tuple2!15865 (_1!7943 (_ BitVec 64)) (_2!7943 V!38467)) )
))
(declare-datatypes ((List!22452 0))(
  ( (Nil!22449) (Cons!22448 (h!23657 tuple2!15864) (t!31759 List!22452)) )
))
(declare-datatypes ((ListLongMap!13833 0))(
  ( (ListLongMap!13834 (toList!6932 List!22452)) )
))
(declare-fun lt!467203 () ListLongMap!13833)

(declare-fun getCurrentListMapNoExtraKeys!3534 (array!67025 array!67023 (_ BitVec 32) (_ BitVec 32) V!38467 V!38467 (_ BitVec 32) Int) ListLongMap!13833)

(assert (=> b!1059978 (= lt!467203 (getCurrentListMapNoExtraKeys!3534 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39166 () Bool)

(declare-fun tp!74987 () Bool)

(assert (=> mapNonEmpty!39166 (= mapRes!39166 (and tp!74987 e!603401))))

(declare-fun mapKey!39166 () (_ BitVec 32))

(declare-fun mapValue!39166 () ValueCell!11796)

(declare-fun mapRest!39166 () (Array (_ BitVec 32) ValueCell!11796))

(assert (=> mapNonEmpty!39166 (= (arr!32220 _values!955) (store mapRest!39166 mapKey!39166 mapValue!39166))))

(declare-fun b!1059979 () Bool)

(declare-fun res!707998 () Bool)

(assert (=> b!1059979 (=> (not res!707998) (not e!603402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67025 (_ BitVec 32)) Bool)

(assert (=> b!1059979 (= res!707998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059975 () Bool)

(assert (=> b!1059975 (= e!603404 tp_is_empty!24999)))

(declare-fun res!707999 () Bool)

(assert (=> start!93704 (=> (not res!707999) (not e!603402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93704 (= res!707999 (validMask!0 mask!1515))))

(assert (=> start!93704 e!603402))

(assert (=> start!93704 true))

(assert (=> start!93704 tp_is_empty!24999))

(declare-fun array_inv!24972 (array!67023) Bool)

(assert (=> start!93704 (and (array_inv!24972 _values!955) e!603405)))

(assert (=> start!93704 tp!74986))

(declare-fun array_inv!24973 (array!67025) Bool)

(assert (=> start!93704 (array_inv!24973 _keys!1163)))

(assert (= (and start!93704 res!707999) b!1059973))

(assert (= (and b!1059973 res!708001) b!1059979))

(assert (= (and b!1059979 res!707998) b!1059977))

(assert (= (and b!1059977 res!708000) b!1059978))

(assert (= (and b!1059976 condMapEmpty!39166) mapIsEmpty!39166))

(assert (= (and b!1059976 (not condMapEmpty!39166)) mapNonEmpty!39166))

(get-info :version)

(assert (= (and mapNonEmpty!39166 ((_ is ValueCellFull!11796) mapValue!39166)) b!1059974))

(assert (= (and b!1059976 ((_ is ValueCellFull!11796) mapDefault!39166)) b!1059975))

(assert (= start!93704 b!1059976))

(declare-fun m!979209 () Bool)

(assert (=> b!1059979 m!979209))

(declare-fun m!979211 () Bool)

(assert (=> mapNonEmpty!39166 m!979211))

(declare-fun m!979213 () Bool)

(assert (=> b!1059978 m!979213))

(declare-fun m!979215 () Bool)

(assert (=> start!93704 m!979215))

(declare-fun m!979217 () Bool)

(assert (=> start!93704 m!979217))

(declare-fun m!979219 () Bool)

(assert (=> start!93704 m!979219))

(declare-fun m!979221 () Bool)

(assert (=> b!1059977 m!979221))

(check-sat (not b!1059978) tp_is_empty!24999 (not start!93704) b_and!33899 (not mapNonEmpty!39166) (not b!1059979) (not b_next!21189) (not b!1059977))
(check-sat b_and!33899 (not b_next!21189))
