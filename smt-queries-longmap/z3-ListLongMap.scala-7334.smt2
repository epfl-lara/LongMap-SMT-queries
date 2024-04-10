; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93698 () Bool)

(assert start!93698)

(declare-fun b_free!21183 () Bool)

(declare-fun b_next!21183 () Bool)

(assert (=> start!93698 (= b_free!21183 (not b_next!21183))))

(declare-fun tp!74968 () Bool)

(declare-fun b_and!33893 () Bool)

(assert (=> start!93698 (= tp!74968 b_and!33893)))

(declare-fun b!1059910 () Bool)

(declare-fun res!707964 () Bool)

(declare-fun e!603357 () Bool)

(assert (=> b!1059910 (=> (not res!707964) (not e!603357))))

(declare-datatypes ((array!67011 0))(
  ( (array!67012 (arr!32214 (Array (_ BitVec 32) (_ BitVec 64))) (size!32750 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67011)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67011 (_ BitVec 32)) Bool)

(assert (=> b!1059910 (= res!707964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39157 () Bool)

(declare-fun mapRes!39157 () Bool)

(assert (=> mapIsEmpty!39157 mapRes!39157))

(declare-fun mapNonEmpty!39157 () Bool)

(declare-fun tp!74969 () Bool)

(declare-fun e!603358 () Bool)

(assert (=> mapNonEmpty!39157 (= mapRes!39157 (and tp!74969 e!603358))))

(declare-fun mapKey!39157 () (_ BitVec 32))

(declare-datatypes ((V!38459 0))(
  ( (V!38460 (val!12547 Int)) )
))
(declare-datatypes ((ValueCell!11793 0))(
  ( (ValueCellFull!11793 (v!15157 V!38459)) (EmptyCell!11793) )
))
(declare-fun mapRest!39157 () (Array (_ BitVec 32) ValueCell!11793))

(declare-fun mapValue!39157 () ValueCell!11793)

(declare-datatypes ((array!67013 0))(
  ( (array!67014 (arr!32215 (Array (_ BitVec 32) ValueCell!11793)) (size!32751 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67013)

(assert (=> mapNonEmpty!39157 (= (arr!32215 _values!955) (store mapRest!39157 mapKey!39157 mapValue!39157))))

(declare-fun res!707963 () Bool)

(assert (=> start!93698 (=> (not res!707963) (not e!603357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93698 (= res!707963 (validMask!0 mask!1515))))

(assert (=> start!93698 e!603357))

(assert (=> start!93698 true))

(declare-fun tp_is_empty!24993 () Bool)

(assert (=> start!93698 tp_is_empty!24993))

(declare-fun e!603359 () Bool)

(declare-fun array_inv!24968 (array!67013) Bool)

(assert (=> start!93698 (and (array_inv!24968 _values!955) e!603359)))

(assert (=> start!93698 tp!74968))

(declare-fun array_inv!24969 (array!67011) Bool)

(assert (=> start!93698 (array_inv!24969 _keys!1163)))

(declare-fun b!1059911 () Bool)

(declare-fun e!603356 () Bool)

(assert (=> b!1059911 (= e!603356 tp_is_empty!24993)))

(declare-fun b!1059912 () Bool)

(declare-fun res!707965 () Bool)

(assert (=> b!1059912 (=> (not res!707965) (not e!603357))))

(declare-datatypes ((List!22447 0))(
  ( (Nil!22444) (Cons!22443 (h!23652 (_ BitVec 64)) (t!31754 List!22447)) )
))
(declare-fun arrayNoDuplicates!0 (array!67011 (_ BitVec 32) List!22447) Bool)

(assert (=> b!1059912 (= res!707965 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22444))))

(declare-fun b!1059913 () Bool)

(assert (=> b!1059913 (= e!603358 tp_is_empty!24993)))

(declare-fun b!1059914 () Bool)

(assert (=> b!1059914 (= e!603359 (and e!603356 mapRes!39157))))

(declare-fun condMapEmpty!39157 () Bool)

(declare-fun mapDefault!39157 () ValueCell!11793)

(assert (=> b!1059914 (= condMapEmpty!39157 (= (arr!32215 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11793)) mapDefault!39157)))))

(declare-fun b!1059915 () Bool)

(assert (=> b!1059915 (= e!603357 false)))

(declare-fun zeroValueBefore!47 () V!38459)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38459)

(declare-datatypes ((tuple2!15860 0))(
  ( (tuple2!15861 (_1!7941 (_ BitVec 64)) (_2!7941 V!38459)) )
))
(declare-datatypes ((List!22448 0))(
  ( (Nil!22445) (Cons!22444 (h!23653 tuple2!15860) (t!31755 List!22448)) )
))
(declare-datatypes ((ListLongMap!13829 0))(
  ( (ListLongMap!13830 (toList!6930 List!22448)) )
))
(declare-fun lt!467194 () ListLongMap!13829)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3532 (array!67011 array!67013 (_ BitVec 32) (_ BitVec 32) V!38459 V!38459 (_ BitVec 32) Int) ListLongMap!13829)

(assert (=> b!1059915 (= lt!467194 (getCurrentListMapNoExtraKeys!3532 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1059916 () Bool)

(declare-fun res!707962 () Bool)

(assert (=> b!1059916 (=> (not res!707962) (not e!603357))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059916 (= res!707962 (and (= (size!32751 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32750 _keys!1163) (size!32751 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93698 res!707963) b!1059916))

(assert (= (and b!1059916 res!707962) b!1059910))

(assert (= (and b!1059910 res!707964) b!1059912))

(assert (= (and b!1059912 res!707965) b!1059915))

(assert (= (and b!1059914 condMapEmpty!39157) mapIsEmpty!39157))

(assert (= (and b!1059914 (not condMapEmpty!39157)) mapNonEmpty!39157))

(get-info :version)

(assert (= (and mapNonEmpty!39157 ((_ is ValueCellFull!11793) mapValue!39157)) b!1059913))

(assert (= (and b!1059914 ((_ is ValueCellFull!11793) mapDefault!39157)) b!1059911))

(assert (= start!93698 b!1059914))

(declare-fun m!979167 () Bool)

(assert (=> b!1059912 m!979167))

(declare-fun m!979169 () Bool)

(assert (=> b!1059915 m!979169))

(declare-fun m!979171 () Bool)

(assert (=> mapNonEmpty!39157 m!979171))

(declare-fun m!979173 () Bool)

(assert (=> b!1059910 m!979173))

(declare-fun m!979175 () Bool)

(assert (=> start!93698 m!979175))

(declare-fun m!979177 () Bool)

(assert (=> start!93698 m!979177))

(declare-fun m!979179 () Bool)

(assert (=> start!93698 m!979179))

(check-sat (not b_next!21183) (not b!1059912) (not b!1059915) (not start!93698) (not mapNonEmpty!39157) (not b!1059910) b_and!33893 tp_is_empty!24993)
(check-sat b_and!33893 (not b_next!21183))
