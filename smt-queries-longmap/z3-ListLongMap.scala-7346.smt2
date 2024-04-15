; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93774 () Bool)

(assert start!93774)

(declare-fun b_free!21253 () Bool)

(declare-fun b_next!21253 () Bool)

(assert (=> start!93774 (= b_free!21253 (not b_next!21253))))

(declare-fun tp!75181 () Bool)

(declare-fun b_and!33941 () Bool)

(assert (=> start!93774 (= tp!75181 b_and!33941)))

(declare-fun b!1060565 () Bool)

(declare-fun e!603839 () Bool)

(assert (=> b!1060565 (= e!603839 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38553 0))(
  ( (V!38554 (val!12582 Int)) )
))
(declare-datatypes ((ValueCell!11828 0))(
  ( (ValueCellFull!11828 (v!15191 V!38553)) (EmptyCell!11828) )
))
(declare-datatypes ((array!67080 0))(
  ( (array!67081 (arr!32248 (Array (_ BitVec 32) ValueCell!11828)) (size!32786 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67080)

(declare-fun minValue!907 () V!38553)

(declare-datatypes ((array!67082 0))(
  ( (array!67083 (arr!32249 (Array (_ BitVec 32) (_ BitVec 64))) (size!32787 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67082)

(declare-datatypes ((tuple2!15962 0))(
  ( (tuple2!15963 (_1!7992 (_ BitVec 64)) (_2!7992 V!38553)) )
))
(declare-datatypes ((List!22518 0))(
  ( (Nil!22515) (Cons!22514 (h!23723 tuple2!15962) (t!31818 List!22518)) )
))
(declare-datatypes ((ListLongMap!13931 0))(
  ( (ListLongMap!13932 (toList!6981 List!22518)) )
))
(declare-fun lt!467158 () ListLongMap!13931)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38553)

(declare-fun getCurrentListMapNoExtraKeys!3598 (array!67082 array!67080 (_ BitVec 32) (_ BitVec 32) V!38553 V!38553 (_ BitVec 32) Int) ListLongMap!13931)

(assert (=> b!1060565 (= lt!467158 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38553)

(declare-fun lt!467159 () ListLongMap!13931)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060565 (= lt!467159 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39265 () Bool)

(declare-fun mapRes!39265 () Bool)

(declare-fun tp!75182 () Bool)

(declare-fun e!603837 () Bool)

(assert (=> mapNonEmpty!39265 (= mapRes!39265 (and tp!75182 e!603837))))

(declare-fun mapRest!39265 () (Array (_ BitVec 32) ValueCell!11828))

(declare-fun mapValue!39265 () ValueCell!11828)

(declare-fun mapKey!39265 () (_ BitVec 32))

(assert (=> mapNonEmpty!39265 (= (arr!32248 _values!955) (store mapRest!39265 mapKey!39265 mapValue!39265))))

(declare-fun b!1060566 () Bool)

(declare-fun res!708341 () Bool)

(assert (=> b!1060566 (=> (not res!708341) (not e!603839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67082 (_ BitVec 32)) Bool)

(assert (=> b!1060566 (= res!708341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060567 () Bool)

(declare-fun tp_is_empty!25063 () Bool)

(assert (=> b!1060567 (= e!603837 tp_is_empty!25063)))

(declare-fun mapIsEmpty!39265 () Bool)

(assert (=> mapIsEmpty!39265 mapRes!39265))

(declare-fun b!1060568 () Bool)

(declare-fun e!603840 () Bool)

(assert (=> b!1060568 (= e!603840 tp_is_empty!25063)))

(declare-fun b!1060569 () Bool)

(declare-fun res!708342 () Bool)

(assert (=> b!1060569 (=> (not res!708342) (not e!603839))))

(assert (=> b!1060569 (= res!708342 (and (= (size!32786 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32787 _keys!1163) (size!32786 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060570 () Bool)

(declare-fun e!603836 () Bool)

(assert (=> b!1060570 (= e!603836 (and e!603840 mapRes!39265))))

(declare-fun condMapEmpty!39265 () Bool)

(declare-fun mapDefault!39265 () ValueCell!11828)

(assert (=> b!1060570 (= condMapEmpty!39265 (= (arr!32248 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11828)) mapDefault!39265)))))

(declare-fun res!708340 () Bool)

(assert (=> start!93774 (=> (not res!708340) (not e!603839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93774 (= res!708340 (validMask!0 mask!1515))))

(assert (=> start!93774 e!603839))

(assert (=> start!93774 true))

(assert (=> start!93774 tp_is_empty!25063))

(declare-fun array_inv!24994 (array!67080) Bool)

(assert (=> start!93774 (and (array_inv!24994 _values!955) e!603836)))

(assert (=> start!93774 tp!75181))

(declare-fun array_inv!24995 (array!67082) Bool)

(assert (=> start!93774 (array_inv!24995 _keys!1163)))

(declare-fun b!1060571 () Bool)

(declare-fun res!708343 () Bool)

(assert (=> b!1060571 (=> (not res!708343) (not e!603839))))

(declare-datatypes ((List!22519 0))(
  ( (Nil!22516) (Cons!22515 (h!23724 (_ BitVec 64)) (t!31819 List!22519)) )
))
(declare-fun arrayNoDuplicates!0 (array!67082 (_ BitVec 32) List!22519) Bool)

(assert (=> b!1060571 (= res!708343 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22516))))

(assert (= (and start!93774 res!708340) b!1060569))

(assert (= (and b!1060569 res!708342) b!1060566))

(assert (= (and b!1060566 res!708341) b!1060571))

(assert (= (and b!1060571 res!708343) b!1060565))

(assert (= (and b!1060570 condMapEmpty!39265) mapIsEmpty!39265))

(assert (= (and b!1060570 (not condMapEmpty!39265)) mapNonEmpty!39265))

(get-info :version)

(assert (= (and mapNonEmpty!39265 ((_ is ValueCellFull!11828) mapValue!39265)) b!1060567))

(assert (= (and b!1060570 ((_ is ValueCellFull!11828) mapDefault!39265)) b!1060568))

(assert (= start!93774 b!1060570))

(declare-fun m!979093 () Bool)

(assert (=> b!1060571 m!979093))

(declare-fun m!979095 () Bool)

(assert (=> b!1060566 m!979095))

(declare-fun m!979097 () Bool)

(assert (=> b!1060565 m!979097))

(declare-fun m!979099 () Bool)

(assert (=> b!1060565 m!979099))

(declare-fun m!979101 () Bool)

(assert (=> start!93774 m!979101))

(declare-fun m!979103 () Bool)

(assert (=> start!93774 m!979103))

(declare-fun m!979105 () Bool)

(assert (=> start!93774 m!979105))

(declare-fun m!979107 () Bool)

(assert (=> mapNonEmpty!39265 m!979107))

(check-sat (not mapNonEmpty!39265) (not b!1060565) tp_is_empty!25063 (not b!1060571) (not b_next!21253) (not b!1060566) (not start!93774) b_and!33941)
(check-sat b_and!33941 (not b_next!21253))
