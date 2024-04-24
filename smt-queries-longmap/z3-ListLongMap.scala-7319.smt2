; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93788 () Bool)

(assert start!93788)

(declare-fun b!1060248 () Bool)

(declare-fun e!603402 () Bool)

(declare-fun e!603399 () Bool)

(declare-fun mapRes!39001 () Bool)

(assert (=> b!1060248 (= e!603402 (and e!603399 mapRes!39001))))

(declare-fun condMapEmpty!39001 () Bool)

(declare-datatypes ((V!38337 0))(
  ( (V!38338 (val!12501 Int)) )
))
(declare-datatypes ((ValueCell!11747 0))(
  ( (ValueCellFull!11747 (v!15106 V!38337)) (EmptyCell!11747) )
))
(declare-datatypes ((array!66875 0))(
  ( (array!66876 (arr!32146 (Array (_ BitVec 32) ValueCell!11747)) (size!32683 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66875)

(declare-fun mapDefault!39001 () ValueCell!11747)

(assert (=> b!1060248 (= condMapEmpty!39001 (= (arr!32146 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11747)) mapDefault!39001)))))

(declare-fun b!1060249 () Bool)

(declare-fun tp_is_empty!24901 () Bool)

(assert (=> b!1060249 (= e!603399 tp_is_empty!24901)))

(declare-fun mapIsEmpty!39001 () Bool)

(assert (=> mapIsEmpty!39001 mapRes!39001))

(declare-fun res!707993 () Bool)

(declare-fun e!603401 () Bool)

(assert (=> start!93788 (=> (not res!707993) (not e!603401))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93788 (= res!707993 (validMask!0 mask!1515))))

(assert (=> start!93788 e!603401))

(assert (=> start!93788 true))

(declare-fun array_inv!24928 (array!66875) Bool)

(assert (=> start!93788 (and (array_inv!24928 _values!955) e!603402)))

(declare-datatypes ((array!66877 0))(
  ( (array!66878 (arr!32147 (Array (_ BitVec 32) (_ BitVec 64))) (size!32684 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66877)

(declare-fun array_inv!24929 (array!66877) Bool)

(assert (=> start!93788 (array_inv!24929 _keys!1163)))

(declare-fun b!1060250 () Bool)

(declare-fun e!603400 () Bool)

(assert (=> b!1060250 (= e!603400 tp_is_empty!24901)))

(declare-fun mapNonEmpty!39001 () Bool)

(declare-fun tp!74807 () Bool)

(assert (=> mapNonEmpty!39001 (= mapRes!39001 (and tp!74807 e!603400))))

(declare-fun mapRest!39001 () (Array (_ BitVec 32) ValueCell!11747))

(declare-fun mapValue!39001 () ValueCell!11747)

(declare-fun mapKey!39001 () (_ BitVec 32))

(assert (=> mapNonEmpty!39001 (= (arr!32146 _values!955) (store mapRest!39001 mapKey!39001 mapValue!39001))))

(declare-fun b!1060251 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060251 (= e!603401 (and (= (size!32683 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32684 _keys!1163) (size!32683 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (size!32684 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)))))))

(assert (= (and start!93788 res!707993) b!1060251))

(assert (= (and b!1060248 condMapEmpty!39001) mapIsEmpty!39001))

(assert (= (and b!1060248 (not condMapEmpty!39001)) mapNonEmpty!39001))

(get-info :version)

(assert (= (and mapNonEmpty!39001 ((_ is ValueCellFull!11747) mapValue!39001)) b!1060250))

(assert (= (and b!1060248 ((_ is ValueCellFull!11747) mapDefault!39001)) b!1060249))

(assert (= start!93788 b!1060248))

(declare-fun m!980215 () Bool)

(assert (=> start!93788 m!980215))

(declare-fun m!980217 () Bool)

(assert (=> start!93788 m!980217))

(declare-fun m!980219 () Bool)

(assert (=> start!93788 m!980219))

(declare-fun m!980221 () Bool)

(assert (=> mapNonEmpty!39001 m!980221))

(check-sat (not start!93788) (not mapNonEmpty!39001) tp_is_empty!24901)
(check-sat)
