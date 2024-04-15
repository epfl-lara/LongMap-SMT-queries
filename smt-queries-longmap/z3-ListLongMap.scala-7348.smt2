; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93786 () Bool)

(assert start!93786)

(declare-fun b_free!21265 () Bool)

(declare-fun b_next!21265 () Bool)

(assert (=> start!93786 (= b_free!21265 (not b_next!21265))))

(declare-fun tp!75217 () Bool)

(declare-fun b_and!33953 () Bool)

(assert (=> start!93786 (= tp!75217 b_and!33953)))

(declare-fun mapNonEmpty!39283 () Bool)

(declare-fun mapRes!39283 () Bool)

(declare-fun tp!75218 () Bool)

(declare-fun e!603930 () Bool)

(assert (=> mapNonEmpty!39283 (= mapRes!39283 (and tp!75218 e!603930))))

(declare-fun mapKey!39283 () (_ BitVec 32))

(declare-datatypes ((V!38569 0))(
  ( (V!38570 (val!12588 Int)) )
))
(declare-datatypes ((ValueCell!11834 0))(
  ( (ValueCellFull!11834 (v!15197 V!38569)) (EmptyCell!11834) )
))
(declare-datatypes ((array!67104 0))(
  ( (array!67105 (arr!32260 (Array (_ BitVec 32) ValueCell!11834)) (size!32798 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67104)

(declare-fun mapValue!39283 () ValueCell!11834)

(declare-fun mapRest!39283 () (Array (_ BitVec 32) ValueCell!11834))

(assert (=> mapNonEmpty!39283 (= (arr!32260 _values!955) (store mapRest!39283 mapKey!39283 mapValue!39283))))

(declare-fun b!1060691 () Bool)

(declare-fun res!708412 () Bool)

(declare-fun e!603927 () Bool)

(assert (=> b!1060691 (=> (not res!708412) (not e!603927))))

(declare-datatypes ((array!67106 0))(
  ( (array!67107 (arr!32261 (Array (_ BitVec 32) (_ BitVec 64))) (size!32799 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67106)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67106 (_ BitVec 32)) Bool)

(assert (=> b!1060691 (= res!708412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060692 () Bool)

(declare-fun res!708415 () Bool)

(assert (=> b!1060692 (=> (not res!708415) (not e!603927))))

(declare-datatypes ((List!22530 0))(
  ( (Nil!22527) (Cons!22526 (h!23735 (_ BitVec 64)) (t!31830 List!22530)) )
))
(declare-fun arrayNoDuplicates!0 (array!67106 (_ BitVec 32) List!22530) Bool)

(assert (=> b!1060692 (= res!708415 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22527))))

(declare-fun b!1060693 () Bool)

(declare-fun e!603926 () Bool)

(declare-fun tp_is_empty!25075 () Bool)

(assert (=> b!1060693 (= e!603926 tp_is_empty!25075)))

(declare-fun b!1060694 () Bool)

(declare-fun e!603928 () Bool)

(assert (=> b!1060694 (= e!603928 (and e!603926 mapRes!39283))))

(declare-fun condMapEmpty!39283 () Bool)

(declare-fun mapDefault!39283 () ValueCell!11834)

(assert (=> b!1060694 (= condMapEmpty!39283 (= (arr!32260 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11834)) mapDefault!39283)))))

(declare-fun b!1060695 () Bool)

(declare-fun res!708413 () Bool)

(assert (=> b!1060695 (=> (not res!708413) (not e!603927))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060695 (= res!708413 (and (= (size!32798 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32799 _keys!1163) (size!32798 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060696 () Bool)

(assert (=> b!1060696 (= e!603927 false)))

(declare-fun minValue!907 () V!38569)

(declare-datatypes ((tuple2!15974 0))(
  ( (tuple2!15975 (_1!7998 (_ BitVec 64)) (_2!7998 V!38569)) )
))
(declare-datatypes ((List!22531 0))(
  ( (Nil!22528) (Cons!22527 (h!23736 tuple2!15974) (t!31831 List!22531)) )
))
(declare-datatypes ((ListLongMap!13943 0))(
  ( (ListLongMap!13944 (toList!6987 List!22531)) )
))
(declare-fun lt!467194 () ListLongMap!13943)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38569)

(declare-fun getCurrentListMapNoExtraKeys!3604 (array!67106 array!67104 (_ BitVec 32) (_ BitVec 32) V!38569 V!38569 (_ BitVec 32) Int) ListLongMap!13943)

(assert (=> b!1060696 (= lt!467194 (getCurrentListMapNoExtraKeys!3604 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38569)

(declare-fun lt!467195 () ListLongMap!13943)

(assert (=> b!1060696 (= lt!467195 (getCurrentListMapNoExtraKeys!3604 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708414 () Bool)

(assert (=> start!93786 (=> (not res!708414) (not e!603927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93786 (= res!708414 (validMask!0 mask!1515))))

(assert (=> start!93786 e!603927))

(assert (=> start!93786 true))

(assert (=> start!93786 tp_is_empty!25075))

(declare-fun array_inv!25002 (array!67104) Bool)

(assert (=> start!93786 (and (array_inv!25002 _values!955) e!603928)))

(assert (=> start!93786 tp!75217))

(declare-fun array_inv!25003 (array!67106) Bool)

(assert (=> start!93786 (array_inv!25003 _keys!1163)))

(declare-fun mapIsEmpty!39283 () Bool)

(assert (=> mapIsEmpty!39283 mapRes!39283))

(declare-fun b!1060697 () Bool)

(assert (=> b!1060697 (= e!603930 tp_is_empty!25075)))

(assert (= (and start!93786 res!708414) b!1060695))

(assert (= (and b!1060695 res!708413) b!1060691))

(assert (= (and b!1060691 res!708412) b!1060692))

(assert (= (and b!1060692 res!708415) b!1060696))

(assert (= (and b!1060694 condMapEmpty!39283) mapIsEmpty!39283))

(assert (= (and b!1060694 (not condMapEmpty!39283)) mapNonEmpty!39283))

(get-info :version)

(assert (= (and mapNonEmpty!39283 ((_ is ValueCellFull!11834) mapValue!39283)) b!1060697))

(assert (= (and b!1060694 ((_ is ValueCellFull!11834) mapDefault!39283)) b!1060693))

(assert (= start!93786 b!1060694))

(declare-fun m!979189 () Bool)

(assert (=> mapNonEmpty!39283 m!979189))

(declare-fun m!979191 () Bool)

(assert (=> b!1060696 m!979191))

(declare-fun m!979193 () Bool)

(assert (=> b!1060696 m!979193))

(declare-fun m!979195 () Bool)

(assert (=> start!93786 m!979195))

(declare-fun m!979197 () Bool)

(assert (=> start!93786 m!979197))

(declare-fun m!979199 () Bool)

(assert (=> start!93786 m!979199))

(declare-fun m!979201 () Bool)

(assert (=> b!1060692 m!979201))

(declare-fun m!979203 () Bool)

(assert (=> b!1060691 m!979203))

(check-sat (not start!93786) (not b!1060691) (not b!1060692) (not mapNonEmpty!39283) tp_is_empty!25075 b_and!33953 (not b_next!21265) (not b!1060696))
(check-sat b_and!33953 (not b_next!21265))
