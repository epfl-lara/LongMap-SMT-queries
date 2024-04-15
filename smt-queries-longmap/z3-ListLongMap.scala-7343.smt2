; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93756 () Bool)

(assert start!93756)

(declare-fun b_free!21235 () Bool)

(declare-fun b_next!21235 () Bool)

(assert (=> start!93756 (= b_free!21235 (not b_next!21235))))

(declare-fun tp!75127 () Bool)

(declare-fun b_and!33923 () Bool)

(assert (=> start!93756 (= tp!75127 b_and!33923)))

(declare-fun mapIsEmpty!39238 () Bool)

(declare-fun mapRes!39238 () Bool)

(assert (=> mapIsEmpty!39238 mapRes!39238))

(declare-fun b!1060376 () Bool)

(declare-fun res!708235 () Bool)

(declare-fun e!603705 () Bool)

(assert (=> b!1060376 (=> (not res!708235) (not e!603705))))

(declare-datatypes ((array!67048 0))(
  ( (array!67049 (arr!32232 (Array (_ BitVec 32) (_ BitVec 64))) (size!32770 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67048)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67048 (_ BitVec 32)) Bool)

(assert (=> b!1060376 (= res!708235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060377 () Bool)

(declare-fun e!603704 () Bool)

(declare-fun tp_is_empty!25045 () Bool)

(assert (=> b!1060377 (= e!603704 tp_is_empty!25045)))

(declare-fun mapNonEmpty!39238 () Bool)

(declare-fun tp!75128 () Bool)

(declare-fun e!603701 () Bool)

(assert (=> mapNonEmpty!39238 (= mapRes!39238 (and tp!75128 e!603701))))

(declare-datatypes ((V!38529 0))(
  ( (V!38530 (val!12573 Int)) )
))
(declare-datatypes ((ValueCell!11819 0))(
  ( (ValueCellFull!11819 (v!15182 V!38529)) (EmptyCell!11819) )
))
(declare-fun mapRest!39238 () (Array (_ BitVec 32) ValueCell!11819))

(declare-datatypes ((array!67050 0))(
  ( (array!67051 (arr!32233 (Array (_ BitVec 32) ValueCell!11819)) (size!32771 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67050)

(declare-fun mapKey!39238 () (_ BitVec 32))

(declare-fun mapValue!39238 () ValueCell!11819)

(assert (=> mapNonEmpty!39238 (= (arr!32233 _values!955) (store mapRest!39238 mapKey!39238 mapValue!39238))))

(declare-fun res!708233 () Bool)

(assert (=> start!93756 (=> (not res!708233) (not e!603705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93756 (= res!708233 (validMask!0 mask!1515))))

(assert (=> start!93756 e!603705))

(assert (=> start!93756 true))

(assert (=> start!93756 tp_is_empty!25045))

(declare-fun e!603703 () Bool)

(declare-fun array_inv!24982 (array!67050) Bool)

(assert (=> start!93756 (and (array_inv!24982 _values!955) e!603703)))

(assert (=> start!93756 tp!75127))

(declare-fun array_inv!24983 (array!67048) Bool)

(assert (=> start!93756 (array_inv!24983 _keys!1163)))

(declare-fun b!1060378 () Bool)

(assert (=> b!1060378 (= e!603705 false)))

(declare-fun minValue!907 () V!38529)

(declare-datatypes ((tuple2!15950 0))(
  ( (tuple2!15951 (_1!7986 (_ BitVec 64)) (_2!7986 V!38529)) )
))
(declare-datatypes ((List!22505 0))(
  ( (Nil!22502) (Cons!22501 (h!23710 tuple2!15950) (t!31805 List!22505)) )
))
(declare-datatypes ((ListLongMap!13919 0))(
  ( (ListLongMap!13920 (toList!6975 List!22505)) )
))
(declare-fun lt!467104 () ListLongMap!13919)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38529)

(declare-fun getCurrentListMapNoExtraKeys!3592 (array!67048 array!67050 (_ BitVec 32) (_ BitVec 32) V!38529 V!38529 (_ BitVec 32) Int) ListLongMap!13919)

(assert (=> b!1060378 (= lt!467104 (getCurrentListMapNoExtraKeys!3592 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38529)

(declare-fun lt!467105 () ListLongMap!13919)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060378 (= lt!467105 (getCurrentListMapNoExtraKeys!3592 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060379 () Bool)

(assert (=> b!1060379 (= e!603701 tp_is_empty!25045)))

(declare-fun b!1060380 () Bool)

(declare-fun res!708234 () Bool)

(assert (=> b!1060380 (=> (not res!708234) (not e!603705))))

(declare-datatypes ((List!22506 0))(
  ( (Nil!22503) (Cons!22502 (h!23711 (_ BitVec 64)) (t!31806 List!22506)) )
))
(declare-fun arrayNoDuplicates!0 (array!67048 (_ BitVec 32) List!22506) Bool)

(assert (=> b!1060380 (= res!708234 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22503))))

(declare-fun b!1060381 () Bool)

(declare-fun res!708232 () Bool)

(assert (=> b!1060381 (=> (not res!708232) (not e!603705))))

(assert (=> b!1060381 (= res!708232 (and (= (size!32771 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32770 _keys!1163) (size!32771 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060382 () Bool)

(assert (=> b!1060382 (= e!603703 (and e!603704 mapRes!39238))))

(declare-fun condMapEmpty!39238 () Bool)

(declare-fun mapDefault!39238 () ValueCell!11819)

(assert (=> b!1060382 (= condMapEmpty!39238 (= (arr!32233 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11819)) mapDefault!39238)))))

(assert (= (and start!93756 res!708233) b!1060381))

(assert (= (and b!1060381 res!708232) b!1060376))

(assert (= (and b!1060376 res!708235) b!1060380))

(assert (= (and b!1060380 res!708234) b!1060378))

(assert (= (and b!1060382 condMapEmpty!39238) mapIsEmpty!39238))

(assert (= (and b!1060382 (not condMapEmpty!39238)) mapNonEmpty!39238))

(get-info :version)

(assert (= (and mapNonEmpty!39238 ((_ is ValueCellFull!11819) mapValue!39238)) b!1060379))

(assert (= (and b!1060382 ((_ is ValueCellFull!11819) mapDefault!39238)) b!1060377))

(assert (= start!93756 b!1060382))

(declare-fun m!978949 () Bool)

(assert (=> mapNonEmpty!39238 m!978949))

(declare-fun m!978951 () Bool)

(assert (=> b!1060378 m!978951))

(declare-fun m!978953 () Bool)

(assert (=> b!1060378 m!978953))

(declare-fun m!978955 () Bool)

(assert (=> start!93756 m!978955))

(declare-fun m!978957 () Bool)

(assert (=> start!93756 m!978957))

(declare-fun m!978959 () Bool)

(assert (=> start!93756 m!978959))

(declare-fun m!978961 () Bool)

(assert (=> b!1060376 m!978961))

(declare-fun m!978963 () Bool)

(assert (=> b!1060380 m!978963))

(check-sat (not b_next!21235) (not start!93756) (not b!1060376) (not mapNonEmpty!39238) b_and!33923 (not b!1060378) (not b!1060380) tp_is_empty!25045)
(check-sat b_and!33923 (not b_next!21235))
