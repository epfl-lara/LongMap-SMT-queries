; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93944 () Bool)

(assert start!93944)

(declare-fun b_free!21193 () Bool)

(declare-fun b_next!21193 () Bool)

(assert (=> start!93944 (= b_free!21193 (not b_next!21193))))

(declare-fun tp!74998 () Bool)

(declare-fun b_and!33913 () Bool)

(assert (=> start!93944 (= tp!74998 b_and!33913)))

(declare-fun mapNonEmpty!39172 () Bool)

(declare-fun mapRes!39172 () Bool)

(declare-fun tp!74999 () Bool)

(declare-fun e!604288 () Bool)

(assert (=> mapNonEmpty!39172 (= mapRes!39172 (and tp!74999 e!604288))))

(declare-datatypes ((V!38473 0))(
  ( (V!38474 (val!12552 Int)) )
))
(declare-datatypes ((ValueCell!11798 0))(
  ( (ValueCellFull!11798 (v!15158 V!38473)) (EmptyCell!11798) )
))
(declare-fun mapValue!39172 () ValueCell!11798)

(declare-fun mapRest!39172 () (Array (_ BitVec 32) ValueCell!11798))

(declare-datatypes ((array!67077 0))(
  ( (array!67078 (arr!32241 (Array (_ BitVec 32) ValueCell!11798)) (size!32778 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67077)

(declare-fun mapKey!39172 () (_ BitVec 32))

(assert (=> mapNonEmpty!39172 (= (arr!32241 _values!955) (store mapRest!39172 mapKey!39172 mapValue!39172))))

(declare-fun b!1061342 () Bool)

(declare-fun res!708547 () Bool)

(declare-fun e!604290 () Bool)

(assert (=> b!1061342 (=> (not res!708547) (not e!604290))))

(declare-datatypes ((array!67079 0))(
  ( (array!67080 (arr!32242 (Array (_ BitVec 32) (_ BitVec 64))) (size!32779 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67079)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67079 (_ BitVec 32)) Bool)

(assert (=> b!1061342 (= res!708547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708545 () Bool)

(assert (=> start!93944 (=> (not res!708545) (not e!604290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93944 (= res!708545 (validMask!0 mask!1515))))

(assert (=> start!93944 e!604290))

(assert (=> start!93944 true))

(declare-fun tp_is_empty!25003 () Bool)

(assert (=> start!93944 tp_is_empty!25003))

(declare-fun e!604286 () Bool)

(declare-fun array_inv!24998 (array!67077) Bool)

(assert (=> start!93944 (and (array_inv!24998 _values!955) e!604286)))

(assert (=> start!93944 tp!74998))

(declare-fun array_inv!24999 (array!67079) Bool)

(assert (=> start!93944 (array_inv!24999 _keys!1163)))

(declare-fun b!1061343 () Bool)

(declare-fun e!604287 () Bool)

(assert (=> b!1061343 (= e!604286 (and e!604287 mapRes!39172))))

(declare-fun condMapEmpty!39172 () Bool)

(declare-fun mapDefault!39172 () ValueCell!11798)

(assert (=> b!1061343 (= condMapEmpty!39172 (= (arr!32241 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11798)) mapDefault!39172)))))

(declare-fun b!1061344 () Bool)

(assert (=> b!1061344 (= e!604290 false)))

(declare-fun zeroValueBefore!47 () V!38473)

(declare-datatypes ((tuple2!15856 0))(
  ( (tuple2!15857 (_1!7939 (_ BitVec 64)) (_2!7939 V!38473)) )
))
(declare-datatypes ((List!22439 0))(
  ( (Nil!22436) (Cons!22435 (h!23653 tuple2!15856) (t!31738 List!22439)) )
))
(declare-datatypes ((ListLongMap!13833 0))(
  ( (ListLongMap!13834 (toList!6932 List!22439)) )
))
(declare-fun lt!467724 () ListLongMap!13833)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38473)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3580 (array!67079 array!67077 (_ BitVec 32) (_ BitVec 32) V!38473 V!38473 (_ BitVec 32) Int) ListLongMap!13833)

(assert (=> b!1061344 (= lt!467724 (getCurrentListMapNoExtraKeys!3580 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061345 () Bool)

(assert (=> b!1061345 (= e!604287 tp_is_empty!25003)))

(declare-fun b!1061346 () Bool)

(assert (=> b!1061346 (= e!604288 tp_is_empty!25003)))

(declare-fun b!1061347 () Bool)

(declare-fun res!708544 () Bool)

(assert (=> b!1061347 (=> (not res!708544) (not e!604290))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061347 (= res!708544 (and (= (size!32778 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32779 _keys!1163) (size!32778 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39172 () Bool)

(assert (=> mapIsEmpty!39172 mapRes!39172))

(declare-fun b!1061348 () Bool)

(declare-fun res!708546 () Bool)

(assert (=> b!1061348 (=> (not res!708546) (not e!604290))))

(declare-datatypes ((List!22440 0))(
  ( (Nil!22437) (Cons!22436 (h!23654 (_ BitVec 64)) (t!31739 List!22440)) )
))
(declare-fun arrayNoDuplicates!0 (array!67079 (_ BitVec 32) List!22440) Bool)

(assert (=> b!1061348 (= res!708546 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22437))))

(assert (= (and start!93944 res!708545) b!1061347))

(assert (= (and b!1061347 res!708544) b!1061342))

(assert (= (and b!1061342 res!708547) b!1061348))

(assert (= (and b!1061348 res!708546) b!1061344))

(assert (= (and b!1061343 condMapEmpty!39172) mapIsEmpty!39172))

(assert (= (and b!1061343 (not condMapEmpty!39172)) mapNonEmpty!39172))

(get-info :version)

(assert (= (and mapNonEmpty!39172 ((_ is ValueCellFull!11798) mapValue!39172)) b!1061346))

(assert (= (and b!1061343 ((_ is ValueCellFull!11798) mapDefault!39172)) b!1061345))

(assert (= start!93944 b!1061343))

(declare-fun m!980909 () Bool)

(assert (=> mapNonEmpty!39172 m!980909))

(declare-fun m!980911 () Bool)

(assert (=> b!1061348 m!980911))

(declare-fun m!980913 () Bool)

(assert (=> b!1061344 m!980913))

(declare-fun m!980915 () Bool)

(assert (=> b!1061342 m!980915))

(declare-fun m!980917 () Bool)

(assert (=> start!93944 m!980917))

(declare-fun m!980919 () Bool)

(assert (=> start!93944 m!980919))

(declare-fun m!980921 () Bool)

(assert (=> start!93944 m!980921))

(check-sat (not mapNonEmpty!39172) (not b!1061342) b_and!33913 tp_is_empty!25003 (not b!1061344) (not start!93944) (not b!1061348) (not b_next!21193))
(check-sat b_and!33913 (not b_next!21193))
