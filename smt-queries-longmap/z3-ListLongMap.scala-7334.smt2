; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93932 () Bool)

(assert start!93932)

(declare-fun b_free!21181 () Bool)

(declare-fun b_next!21181 () Bool)

(assert (=> start!93932 (= b_free!21181 (not b_next!21181))))

(declare-fun tp!74963 () Bool)

(declare-fun b_and!33901 () Bool)

(assert (=> start!93932 (= tp!74963 b_and!33901)))

(declare-fun b!1061216 () Bool)

(declare-fun e!604200 () Bool)

(declare-fun e!604198 () Bool)

(declare-fun mapRes!39154 () Bool)

(assert (=> b!1061216 (= e!604200 (and e!604198 mapRes!39154))))

(declare-fun condMapEmpty!39154 () Bool)

(declare-datatypes ((V!38457 0))(
  ( (V!38458 (val!12546 Int)) )
))
(declare-datatypes ((ValueCell!11792 0))(
  ( (ValueCellFull!11792 (v!15152 V!38457)) (EmptyCell!11792) )
))
(declare-datatypes ((array!67053 0))(
  ( (array!67054 (arr!32229 (Array (_ BitVec 32) ValueCell!11792)) (size!32766 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67053)

(declare-fun mapDefault!39154 () ValueCell!11792)

(assert (=> b!1061216 (= condMapEmpty!39154 (= (arr!32229 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11792)) mapDefault!39154)))))

(declare-fun b!1061217 () Bool)

(declare-fun res!708472 () Bool)

(declare-fun e!604197 () Bool)

(assert (=> b!1061217 (=> (not res!708472) (not e!604197))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67055 0))(
  ( (array!67056 (arr!32230 (Array (_ BitVec 32) (_ BitVec 64))) (size!32767 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67055)

(assert (=> b!1061217 (= res!708472 (and (= (size!32766 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32767 _keys!1163) (size!32766 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39154 () Bool)

(declare-fun tp!74962 () Bool)

(declare-fun e!604199 () Bool)

(assert (=> mapNonEmpty!39154 (= mapRes!39154 (and tp!74962 e!604199))))

(declare-fun mapRest!39154 () (Array (_ BitVec 32) ValueCell!11792))

(declare-fun mapKey!39154 () (_ BitVec 32))

(declare-fun mapValue!39154 () ValueCell!11792)

(assert (=> mapNonEmpty!39154 (= (arr!32229 _values!955) (store mapRest!39154 mapKey!39154 mapValue!39154))))

(declare-fun mapIsEmpty!39154 () Bool)

(assert (=> mapIsEmpty!39154 mapRes!39154))

(declare-fun b!1061218 () Bool)

(declare-fun tp_is_empty!24991 () Bool)

(assert (=> b!1061218 (= e!604198 tp_is_empty!24991)))

(declare-fun b!1061219 () Bool)

(declare-fun res!708474 () Bool)

(assert (=> b!1061219 (=> (not res!708474) (not e!604197))))

(declare-datatypes ((List!22433 0))(
  ( (Nil!22430) (Cons!22429 (h!23647 (_ BitVec 64)) (t!31732 List!22433)) )
))
(declare-fun arrayNoDuplicates!0 (array!67055 (_ BitVec 32) List!22433) Bool)

(assert (=> b!1061219 (= res!708474 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22430))))

(declare-fun b!1061220 () Bool)

(declare-fun res!708473 () Bool)

(assert (=> b!1061220 (=> (not res!708473) (not e!604197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67055 (_ BitVec 32)) Bool)

(assert (=> b!1061220 (= res!708473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708475 () Bool)

(assert (=> start!93932 (=> (not res!708475) (not e!604197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93932 (= res!708475 (validMask!0 mask!1515))))

(assert (=> start!93932 e!604197))

(assert (=> start!93932 true))

(assert (=> start!93932 tp_is_empty!24991))

(declare-fun array_inv!24990 (array!67053) Bool)

(assert (=> start!93932 (and (array_inv!24990 _values!955) e!604200)))

(assert (=> start!93932 tp!74963))

(declare-fun array_inv!24991 (array!67055) Bool)

(assert (=> start!93932 (array_inv!24991 _keys!1163)))

(declare-fun b!1061221 () Bool)

(assert (=> b!1061221 (= e!604197 false)))

(declare-fun zeroValueBefore!47 () V!38457)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38457)

(declare-datatypes ((tuple2!15850 0))(
  ( (tuple2!15851 (_1!7936 (_ BitVec 64)) (_2!7936 V!38457)) )
))
(declare-datatypes ((List!22434 0))(
  ( (Nil!22431) (Cons!22430 (h!23648 tuple2!15850) (t!31733 List!22434)) )
))
(declare-datatypes ((ListLongMap!13827 0))(
  ( (ListLongMap!13828 (toList!6929 List!22434)) )
))
(declare-fun lt!467706 () ListLongMap!13827)

(declare-fun getCurrentListMapNoExtraKeys!3577 (array!67055 array!67053 (_ BitVec 32) (_ BitVec 32) V!38457 V!38457 (_ BitVec 32) Int) ListLongMap!13827)

(assert (=> b!1061221 (= lt!467706 (getCurrentListMapNoExtraKeys!3577 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061222 () Bool)

(assert (=> b!1061222 (= e!604199 tp_is_empty!24991)))

(assert (= (and start!93932 res!708475) b!1061217))

(assert (= (and b!1061217 res!708472) b!1061220))

(assert (= (and b!1061220 res!708473) b!1061219))

(assert (= (and b!1061219 res!708474) b!1061221))

(assert (= (and b!1061216 condMapEmpty!39154) mapIsEmpty!39154))

(assert (= (and b!1061216 (not condMapEmpty!39154)) mapNonEmpty!39154))

(get-info :version)

(assert (= (and mapNonEmpty!39154 ((_ is ValueCellFull!11792) mapValue!39154)) b!1061222))

(assert (= (and b!1061216 ((_ is ValueCellFull!11792) mapDefault!39154)) b!1061218))

(assert (= start!93932 b!1061216))

(declare-fun m!980825 () Bool)

(assert (=> b!1061220 m!980825))

(declare-fun m!980827 () Bool)

(assert (=> b!1061219 m!980827))

(declare-fun m!980829 () Bool)

(assert (=> b!1061221 m!980829))

(declare-fun m!980831 () Bool)

(assert (=> mapNonEmpty!39154 m!980831))

(declare-fun m!980833 () Bool)

(assert (=> start!93932 m!980833))

(declare-fun m!980835 () Bool)

(assert (=> start!93932 m!980835))

(declare-fun m!980837 () Bool)

(assert (=> start!93932 m!980837))

(check-sat (not b!1061219) (not b_next!21181) (not mapNonEmpty!39154) (not start!93932) b_and!33901 tp_is_empty!24991 (not b!1061220) (not b!1061221))
(check-sat b_and!33901 (not b_next!21181))
