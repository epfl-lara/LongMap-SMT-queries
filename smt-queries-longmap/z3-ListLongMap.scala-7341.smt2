; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93740 () Bool)

(assert start!93740)

(declare-fun b_free!21225 () Bool)

(declare-fun b_next!21225 () Bool)

(assert (=> start!93740 (= b_free!21225 (not b_next!21225))))

(declare-fun tp!75094 () Bool)

(declare-fun b_and!33935 () Bool)

(assert (=> start!93740 (= tp!75094 b_and!33935)))

(declare-fun b!1060351 () Bool)

(declare-fun e!603672 () Bool)

(declare-fun e!603675 () Bool)

(declare-fun mapRes!39220 () Bool)

(assert (=> b!1060351 (= e!603672 (and e!603675 mapRes!39220))))

(declare-fun condMapEmpty!39220 () Bool)

(declare-datatypes ((V!38515 0))(
  ( (V!38516 (val!12568 Int)) )
))
(declare-datatypes ((ValueCell!11814 0))(
  ( (ValueCellFull!11814 (v!15178 V!38515)) (EmptyCell!11814) )
))
(declare-datatypes ((array!67089 0))(
  ( (array!67090 (arr!32253 (Array (_ BitVec 32) ValueCell!11814)) (size!32789 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67089)

(declare-fun mapDefault!39220 () ValueCell!11814)

(assert (=> b!1060351 (= condMapEmpty!39220 (= (arr!32253 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11814)) mapDefault!39220)))))

(declare-fun b!1060352 () Bool)

(declare-fun res!708215 () Bool)

(declare-fun e!603673 () Bool)

(assert (=> b!1060352 (=> (not res!708215) (not e!603673))))

(declare-datatypes ((array!67091 0))(
  ( (array!67092 (arr!32254 (Array (_ BitVec 32) (_ BitVec 64))) (size!32790 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67091)

(declare-datatypes ((List!22470 0))(
  ( (Nil!22467) (Cons!22466 (h!23675 (_ BitVec 64)) (t!31777 List!22470)) )
))
(declare-fun arrayNoDuplicates!0 (array!67091 (_ BitVec 32) List!22470) Bool)

(assert (=> b!1060352 (= res!708215 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22467))))

(declare-fun b!1060353 () Bool)

(declare-fun e!603671 () Bool)

(declare-fun tp_is_empty!25035 () Bool)

(assert (=> b!1060353 (= e!603671 tp_is_empty!25035)))

(declare-fun b!1060354 () Bool)

(declare-fun res!708217 () Bool)

(assert (=> b!1060354 (=> (not res!708217) (not e!603673))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060354 (= res!708217 (and (= (size!32789 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32790 _keys!1163) (size!32789 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708216 () Bool)

(assert (=> start!93740 (=> (not res!708216) (not e!603673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93740 (= res!708216 (validMask!0 mask!1515))))

(assert (=> start!93740 e!603673))

(assert (=> start!93740 true))

(assert (=> start!93740 tp_is_empty!25035))

(declare-fun array_inv!24994 (array!67089) Bool)

(assert (=> start!93740 (and (array_inv!24994 _values!955) e!603672)))

(assert (=> start!93740 tp!75094))

(declare-fun array_inv!24995 (array!67091) Bool)

(assert (=> start!93740 (array_inv!24995 _keys!1163)))

(declare-fun mapNonEmpty!39220 () Bool)

(declare-fun tp!75095 () Bool)

(assert (=> mapNonEmpty!39220 (= mapRes!39220 (and tp!75095 e!603671))))

(declare-fun mapValue!39220 () ValueCell!11814)

(declare-fun mapRest!39220 () (Array (_ BitVec 32) ValueCell!11814))

(declare-fun mapKey!39220 () (_ BitVec 32))

(assert (=> mapNonEmpty!39220 (= (arr!32253 _values!955) (store mapRest!39220 mapKey!39220 mapValue!39220))))

(declare-fun b!1060355 () Bool)

(declare-fun res!708214 () Bool)

(assert (=> b!1060355 (=> (not res!708214) (not e!603673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67091 (_ BitVec 32)) Bool)

(assert (=> b!1060355 (= res!708214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060356 () Bool)

(assert (=> b!1060356 (= e!603673 false)))

(declare-fun zeroValueBefore!47 () V!38515)

(declare-datatypes ((tuple2!15884 0))(
  ( (tuple2!15885 (_1!7953 (_ BitVec 64)) (_2!7953 V!38515)) )
))
(declare-datatypes ((List!22471 0))(
  ( (Nil!22468) (Cons!22467 (h!23676 tuple2!15884) (t!31778 List!22471)) )
))
(declare-datatypes ((ListLongMap!13853 0))(
  ( (ListLongMap!13854 (toList!6942 List!22471)) )
))
(declare-fun lt!467257 () ListLongMap!13853)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38515)

(declare-fun getCurrentListMapNoExtraKeys!3544 (array!67091 array!67089 (_ BitVec 32) (_ BitVec 32) V!38515 V!38515 (_ BitVec 32) Int) ListLongMap!13853)

(assert (=> b!1060356 (= lt!467257 (getCurrentListMapNoExtraKeys!3544 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39220 () Bool)

(assert (=> mapIsEmpty!39220 mapRes!39220))

(declare-fun b!1060357 () Bool)

(assert (=> b!1060357 (= e!603675 tp_is_empty!25035)))

(assert (= (and start!93740 res!708216) b!1060354))

(assert (= (and b!1060354 res!708217) b!1060355))

(assert (= (and b!1060355 res!708214) b!1060352))

(assert (= (and b!1060352 res!708215) b!1060356))

(assert (= (and b!1060351 condMapEmpty!39220) mapIsEmpty!39220))

(assert (= (and b!1060351 (not condMapEmpty!39220)) mapNonEmpty!39220))

(get-info :version)

(assert (= (and mapNonEmpty!39220 ((_ is ValueCellFull!11814) mapValue!39220)) b!1060353))

(assert (= (and b!1060351 ((_ is ValueCellFull!11814) mapDefault!39220)) b!1060357))

(assert (= start!93740 b!1060351))

(declare-fun m!979461 () Bool)

(assert (=> b!1060356 m!979461))

(declare-fun m!979463 () Bool)

(assert (=> b!1060352 m!979463))

(declare-fun m!979465 () Bool)

(assert (=> mapNonEmpty!39220 m!979465))

(declare-fun m!979467 () Bool)

(assert (=> b!1060355 m!979467))

(declare-fun m!979469 () Bool)

(assert (=> start!93740 m!979469))

(declare-fun m!979471 () Bool)

(assert (=> start!93740 m!979471))

(declare-fun m!979473 () Bool)

(assert (=> start!93740 m!979473))

(check-sat (not mapNonEmpty!39220) (not b_next!21225) (not b!1060355) tp_is_empty!25035 (not b!1060356) b_and!33935 (not b!1060352) (not start!93740))
(check-sat b_and!33935 (not b_next!21225))
