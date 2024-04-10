; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93734 () Bool)

(assert start!93734)

(declare-fun b_free!21219 () Bool)

(declare-fun b_next!21219 () Bool)

(assert (=> start!93734 (= b_free!21219 (not b_next!21219))))

(declare-fun tp!75076 () Bool)

(declare-fun b_and!33929 () Bool)

(assert (=> start!93734 (= tp!75076 b_and!33929)))

(declare-fun b!1060288 () Bool)

(declare-fun res!708178 () Bool)

(declare-fun e!603628 () Bool)

(assert (=> b!1060288 (=> (not res!708178) (not e!603628))))

(declare-datatypes ((array!67077 0))(
  ( (array!67078 (arr!32247 (Array (_ BitVec 32) (_ BitVec 64))) (size!32783 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67077)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67077 (_ BitVec 32)) Bool)

(assert (=> b!1060288 (= res!708178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060289 () Bool)

(declare-fun e!603626 () Bool)

(declare-fun tp_is_empty!25029 () Bool)

(assert (=> b!1060289 (= e!603626 tp_is_empty!25029)))

(declare-fun b!1060290 () Bool)

(declare-fun e!603627 () Bool)

(declare-fun mapRes!39211 () Bool)

(assert (=> b!1060290 (= e!603627 (and e!603626 mapRes!39211))))

(declare-fun condMapEmpty!39211 () Bool)

(declare-datatypes ((V!38507 0))(
  ( (V!38508 (val!12565 Int)) )
))
(declare-datatypes ((ValueCell!11811 0))(
  ( (ValueCellFull!11811 (v!15175 V!38507)) (EmptyCell!11811) )
))
(declare-datatypes ((array!67079 0))(
  ( (array!67080 (arr!32248 (Array (_ BitVec 32) ValueCell!11811)) (size!32784 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67079)

(declare-fun mapDefault!39211 () ValueCell!11811)

(assert (=> b!1060290 (= condMapEmpty!39211 (= (arr!32248 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11811)) mapDefault!39211)))))

(declare-fun res!708180 () Bool)

(assert (=> start!93734 (=> (not res!708180) (not e!603628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93734 (= res!708180 (validMask!0 mask!1515))))

(assert (=> start!93734 e!603628))

(assert (=> start!93734 true))

(assert (=> start!93734 tp_is_empty!25029))

(declare-fun array_inv!24992 (array!67079) Bool)

(assert (=> start!93734 (and (array_inv!24992 _values!955) e!603627)))

(assert (=> start!93734 tp!75076))

(declare-fun array_inv!24993 (array!67077) Bool)

(assert (=> start!93734 (array_inv!24993 _keys!1163)))

(declare-fun mapIsEmpty!39211 () Bool)

(assert (=> mapIsEmpty!39211 mapRes!39211))

(declare-fun b!1060291 () Bool)

(assert (=> b!1060291 (= e!603628 false)))

(declare-fun zeroValueBefore!47 () V!38507)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38507)

(declare-datatypes ((tuple2!15880 0))(
  ( (tuple2!15881 (_1!7951 (_ BitVec 64)) (_2!7951 V!38507)) )
))
(declare-datatypes ((List!22466 0))(
  ( (Nil!22463) (Cons!22462 (h!23671 tuple2!15880) (t!31773 List!22466)) )
))
(declare-datatypes ((ListLongMap!13849 0))(
  ( (ListLongMap!13850 (toList!6940 List!22466)) )
))
(declare-fun lt!467248 () ListLongMap!13849)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3542 (array!67077 array!67079 (_ BitVec 32) (_ BitVec 32) V!38507 V!38507 (_ BitVec 32) Int) ListLongMap!13849)

(assert (=> b!1060291 (= lt!467248 (getCurrentListMapNoExtraKeys!3542 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060292 () Bool)

(declare-fun e!603630 () Bool)

(assert (=> b!1060292 (= e!603630 tp_is_empty!25029)))

(declare-fun b!1060293 () Bool)

(declare-fun res!708179 () Bool)

(assert (=> b!1060293 (=> (not res!708179) (not e!603628))))

(declare-datatypes ((List!22467 0))(
  ( (Nil!22464) (Cons!22463 (h!23672 (_ BitVec 64)) (t!31774 List!22467)) )
))
(declare-fun arrayNoDuplicates!0 (array!67077 (_ BitVec 32) List!22467) Bool)

(assert (=> b!1060293 (= res!708179 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22464))))

(declare-fun mapNonEmpty!39211 () Bool)

(declare-fun tp!75077 () Bool)

(assert (=> mapNonEmpty!39211 (= mapRes!39211 (and tp!75077 e!603630))))

(declare-fun mapKey!39211 () (_ BitVec 32))

(declare-fun mapRest!39211 () (Array (_ BitVec 32) ValueCell!11811))

(declare-fun mapValue!39211 () ValueCell!11811)

(assert (=> mapNonEmpty!39211 (= (arr!32248 _values!955) (store mapRest!39211 mapKey!39211 mapValue!39211))))

(declare-fun b!1060294 () Bool)

(declare-fun res!708181 () Bool)

(assert (=> b!1060294 (=> (not res!708181) (not e!603628))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060294 (= res!708181 (and (= (size!32784 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32783 _keys!1163) (size!32784 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93734 res!708180) b!1060294))

(assert (= (and b!1060294 res!708181) b!1060288))

(assert (= (and b!1060288 res!708178) b!1060293))

(assert (= (and b!1060293 res!708179) b!1060291))

(assert (= (and b!1060290 condMapEmpty!39211) mapIsEmpty!39211))

(assert (= (and b!1060290 (not condMapEmpty!39211)) mapNonEmpty!39211))

(get-info :version)

(assert (= (and mapNonEmpty!39211 ((_ is ValueCellFull!11811) mapValue!39211)) b!1060292))

(assert (= (and b!1060290 ((_ is ValueCellFull!11811) mapDefault!39211)) b!1060289))

(assert (= start!93734 b!1060290))

(declare-fun m!979419 () Bool)

(assert (=> b!1060293 m!979419))

(declare-fun m!979421 () Bool)

(assert (=> b!1060288 m!979421))

(declare-fun m!979423 () Bool)

(assert (=> start!93734 m!979423))

(declare-fun m!979425 () Bool)

(assert (=> start!93734 m!979425))

(declare-fun m!979427 () Bool)

(assert (=> start!93734 m!979427))

(declare-fun m!979429 () Bool)

(assert (=> mapNonEmpty!39211 m!979429))

(declare-fun m!979431 () Bool)

(assert (=> b!1060291 m!979431))

(check-sat (not b!1060291) (not b_next!21219) (not start!93734) tp_is_empty!25029 (not b!1060288) (not b!1060293) b_and!33929 (not mapNonEmpty!39211))
(check-sat b_and!33929 (not b_next!21219))
