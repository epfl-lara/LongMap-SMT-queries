; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93728 () Bool)

(assert start!93728)

(declare-fun b_free!21213 () Bool)

(declare-fun b_next!21213 () Bool)

(assert (=> start!93728 (= b_free!21213 (not b_next!21213))))

(declare-fun tp!75058 () Bool)

(declare-fun b_and!33923 () Bool)

(assert (=> start!93728 (= tp!75058 b_and!33923)))

(declare-fun b!1060225 () Bool)

(declare-fun res!708144 () Bool)

(declare-fun e!603583 () Bool)

(assert (=> b!1060225 (=> (not res!708144) (not e!603583))))

(declare-datatypes ((array!67067 0))(
  ( (array!67068 (arr!32242 (Array (_ BitVec 32) (_ BitVec 64))) (size!32778 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67067)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67067 (_ BitVec 32)) Bool)

(assert (=> b!1060225 (= res!708144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060226 () Bool)

(declare-fun res!708142 () Bool)

(assert (=> b!1060226 (=> (not res!708142) (not e!603583))))

(declare-datatypes ((List!22464 0))(
  ( (Nil!22461) (Cons!22460 (h!23669 (_ BitVec 64)) (t!31771 List!22464)) )
))
(declare-fun arrayNoDuplicates!0 (array!67067 (_ BitVec 32) List!22464) Bool)

(assert (=> b!1060226 (= res!708142 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22461))))

(declare-fun b!1060227 () Bool)

(assert (=> b!1060227 (= e!603583 false)))

(declare-datatypes ((V!38499 0))(
  ( (V!38500 (val!12562 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38499)

(declare-datatypes ((ValueCell!11808 0))(
  ( (ValueCellFull!11808 (v!15172 V!38499)) (EmptyCell!11808) )
))
(declare-datatypes ((array!67069 0))(
  ( (array!67070 (arr!32243 (Array (_ BitVec 32) ValueCell!11808)) (size!32779 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67069)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38499)

(declare-datatypes ((tuple2!15878 0))(
  ( (tuple2!15879 (_1!7950 (_ BitVec 64)) (_2!7950 V!38499)) )
))
(declare-datatypes ((List!22465 0))(
  ( (Nil!22462) (Cons!22461 (h!23670 tuple2!15878) (t!31772 List!22465)) )
))
(declare-datatypes ((ListLongMap!13847 0))(
  ( (ListLongMap!13848 (toList!6939 List!22465)) )
))
(declare-fun lt!467239 () ListLongMap!13847)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3541 (array!67067 array!67069 (_ BitVec 32) (_ BitVec 32) V!38499 V!38499 (_ BitVec 32) Int) ListLongMap!13847)

(assert (=> b!1060227 (= lt!467239 (getCurrentListMapNoExtraKeys!3541 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060228 () Bool)

(declare-fun res!708145 () Bool)

(assert (=> b!1060228 (=> (not res!708145) (not e!603583))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060228 (= res!708145 (and (= (size!32779 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32778 _keys!1163) (size!32779 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!708143 () Bool)

(assert (=> start!93728 (=> (not res!708143) (not e!603583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93728 (= res!708143 (validMask!0 mask!1515))))

(assert (=> start!93728 e!603583))

(assert (=> start!93728 true))

(declare-fun tp_is_empty!25023 () Bool)

(assert (=> start!93728 tp_is_empty!25023))

(declare-fun e!603582 () Bool)

(declare-fun array_inv!24988 (array!67069) Bool)

(assert (=> start!93728 (and (array_inv!24988 _values!955) e!603582)))

(assert (=> start!93728 tp!75058))

(declare-fun array_inv!24989 (array!67067) Bool)

(assert (=> start!93728 (array_inv!24989 _keys!1163)))

(declare-fun b!1060229 () Bool)

(declare-fun e!603581 () Bool)

(assert (=> b!1060229 (= e!603581 tp_is_empty!25023)))

(declare-fun mapNonEmpty!39202 () Bool)

(declare-fun mapRes!39202 () Bool)

(declare-fun tp!75059 () Bool)

(declare-fun e!603585 () Bool)

(assert (=> mapNonEmpty!39202 (= mapRes!39202 (and tp!75059 e!603585))))

(declare-fun mapValue!39202 () ValueCell!11808)

(declare-fun mapKey!39202 () (_ BitVec 32))

(declare-fun mapRest!39202 () (Array (_ BitVec 32) ValueCell!11808))

(assert (=> mapNonEmpty!39202 (= (arr!32243 _values!955) (store mapRest!39202 mapKey!39202 mapValue!39202))))

(declare-fun b!1060230 () Bool)

(assert (=> b!1060230 (= e!603582 (and e!603581 mapRes!39202))))

(declare-fun condMapEmpty!39202 () Bool)

(declare-fun mapDefault!39202 () ValueCell!11808)

(assert (=> b!1060230 (= condMapEmpty!39202 (= (arr!32243 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11808)) mapDefault!39202)))))

(declare-fun mapIsEmpty!39202 () Bool)

(assert (=> mapIsEmpty!39202 mapRes!39202))

(declare-fun b!1060231 () Bool)

(assert (=> b!1060231 (= e!603585 tp_is_empty!25023)))

(assert (= (and start!93728 res!708143) b!1060228))

(assert (= (and b!1060228 res!708145) b!1060225))

(assert (= (and b!1060225 res!708144) b!1060226))

(assert (= (and b!1060226 res!708142) b!1060227))

(assert (= (and b!1060230 condMapEmpty!39202) mapIsEmpty!39202))

(assert (= (and b!1060230 (not condMapEmpty!39202)) mapNonEmpty!39202))

(get-info :version)

(assert (= (and mapNonEmpty!39202 ((_ is ValueCellFull!11808) mapValue!39202)) b!1060231))

(assert (= (and b!1060230 ((_ is ValueCellFull!11808) mapDefault!39202)) b!1060229))

(assert (= start!93728 b!1060230))

(declare-fun m!979377 () Bool)

(assert (=> b!1060225 m!979377))

(declare-fun m!979379 () Bool)

(assert (=> start!93728 m!979379))

(declare-fun m!979381 () Bool)

(assert (=> start!93728 m!979381))

(declare-fun m!979383 () Bool)

(assert (=> start!93728 m!979383))

(declare-fun m!979385 () Bool)

(assert (=> b!1060226 m!979385))

(declare-fun m!979387 () Bool)

(assert (=> mapNonEmpty!39202 m!979387))

(declare-fun m!979389 () Bool)

(assert (=> b!1060227 m!979389))

(check-sat (not b!1060226) (not b!1060225) b_and!33923 (not b_next!21213) (not b!1060227) (not mapNonEmpty!39202) tp_is_empty!25023 (not start!93728))
(check-sat b_and!33923 (not b_next!21213))
