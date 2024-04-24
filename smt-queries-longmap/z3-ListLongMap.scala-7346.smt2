; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94016 () Bool)

(assert start!94016)

(declare-fun b_free!21253 () Bool)

(declare-fun b_next!21253 () Bool)

(assert (=> start!94016 (= b_free!21253 (not b_next!21253))))

(declare-fun tp!75182 () Bool)

(declare-fun b_and!33977 () Bool)

(assert (=> start!94016 (= tp!75182 b_and!33977)))

(declare-fun b!1062045 () Bool)

(declare-fun e!604787 () Bool)

(assert (=> b!1062045 (= e!604787 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38553 0))(
  ( (V!38554 (val!12582 Int)) )
))
(declare-datatypes ((ValueCell!11828 0))(
  ( (ValueCellFull!11828 (v!15188 V!38553)) (EmptyCell!11828) )
))
(declare-datatypes ((array!67189 0))(
  ( (array!67190 (arr!32296 (Array (_ BitVec 32) ValueCell!11828)) (size!32833 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67189)

(declare-fun minValue!907 () V!38553)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38553)

(declare-datatypes ((tuple2!15892 0))(
  ( (tuple2!15893 (_1!7957 (_ BitVec 64)) (_2!7957 V!38553)) )
))
(declare-datatypes ((List!22476 0))(
  ( (Nil!22473) (Cons!22472 (h!23690 tuple2!15892) (t!31777 List!22476)) )
))
(declare-datatypes ((ListLongMap!13869 0))(
  ( (ListLongMap!13870 (toList!6950 List!22476)) )
))
(declare-fun lt!467873 () ListLongMap!13869)

(declare-datatypes ((array!67191 0))(
  ( (array!67192 (arr!32297 (Array (_ BitVec 32) (_ BitVec 64))) (size!32834 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67191)

(declare-fun getCurrentListMapNoExtraKeys!3598 (array!67191 array!67189 (_ BitVec 32) (_ BitVec 32) V!38553 V!38553 (_ BitVec 32) Int) ListLongMap!13869)

(assert (=> b!1062045 (= lt!467873 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38553)

(declare-fun lt!467874 () ListLongMap!13869)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062045 (= lt!467874 (getCurrentListMapNoExtraKeys!3598 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062046 () Bool)

(declare-fun e!604786 () Bool)

(declare-fun tp_is_empty!25063 () Bool)

(assert (=> b!1062046 (= e!604786 tp_is_empty!25063)))

(declare-fun mapNonEmpty!39265 () Bool)

(declare-fun mapRes!39265 () Bool)

(declare-fun tp!75181 () Bool)

(declare-fun e!604784 () Bool)

(assert (=> mapNonEmpty!39265 (= mapRes!39265 (and tp!75181 e!604784))))

(declare-fun mapRest!39265 () (Array (_ BitVec 32) ValueCell!11828))

(declare-fun mapKey!39265 () (_ BitVec 32))

(declare-fun mapValue!39265 () ValueCell!11828)

(assert (=> mapNonEmpty!39265 (= (arr!32296 _values!955) (store mapRest!39265 mapKey!39265 mapValue!39265))))

(declare-fun b!1062047 () Bool)

(declare-fun res!708933 () Bool)

(assert (=> b!1062047 (=> (not res!708933) (not e!604787))))

(declare-datatypes ((List!22477 0))(
  ( (Nil!22474) (Cons!22473 (h!23691 (_ BitVec 64)) (t!31778 List!22477)) )
))
(declare-fun arrayNoDuplicates!0 (array!67191 (_ BitVec 32) List!22477) Bool)

(assert (=> b!1062047 (= res!708933 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22474))))

(declare-fun b!1062048 () Bool)

(declare-fun res!708932 () Bool)

(assert (=> b!1062048 (=> (not res!708932) (not e!604787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67191 (_ BitVec 32)) Bool)

(assert (=> b!1062048 (= res!708932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708931 () Bool)

(assert (=> start!94016 (=> (not res!708931) (not e!604787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94016 (= res!708931 (validMask!0 mask!1515))))

(assert (=> start!94016 e!604787))

(assert (=> start!94016 true))

(assert (=> start!94016 tp_is_empty!25063))

(declare-fun e!604785 () Bool)

(declare-fun array_inv!25040 (array!67189) Bool)

(assert (=> start!94016 (and (array_inv!25040 _values!955) e!604785)))

(assert (=> start!94016 tp!75182))

(declare-fun array_inv!25041 (array!67191) Bool)

(assert (=> start!94016 (array_inv!25041 _keys!1163)))

(declare-fun b!1062049 () Bool)

(assert (=> b!1062049 (= e!604784 tp_is_empty!25063)))

(declare-fun mapIsEmpty!39265 () Bool)

(assert (=> mapIsEmpty!39265 mapRes!39265))

(declare-fun b!1062050 () Bool)

(assert (=> b!1062050 (= e!604785 (and e!604786 mapRes!39265))))

(declare-fun condMapEmpty!39265 () Bool)

(declare-fun mapDefault!39265 () ValueCell!11828)

(assert (=> b!1062050 (= condMapEmpty!39265 (= (arr!32296 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11828)) mapDefault!39265)))))

(declare-fun b!1062051 () Bool)

(declare-fun res!708934 () Bool)

(assert (=> b!1062051 (=> (not res!708934) (not e!604787))))

(assert (=> b!1062051 (= res!708934 (and (= (size!32833 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32834 _keys!1163) (size!32833 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94016 res!708931) b!1062051))

(assert (= (and b!1062051 res!708934) b!1062048))

(assert (= (and b!1062048 res!708932) b!1062047))

(assert (= (and b!1062047 res!708933) b!1062045))

(assert (= (and b!1062050 condMapEmpty!39265) mapIsEmpty!39265))

(assert (= (and b!1062050 (not condMapEmpty!39265)) mapNonEmpty!39265))

(get-info :version)

(assert (= (and mapNonEmpty!39265 ((_ is ValueCellFull!11828) mapValue!39265)) b!1062049))

(assert (= (and b!1062050 ((_ is ValueCellFull!11828) mapDefault!39265)) b!1062046))

(assert (= start!94016 b!1062050))

(declare-fun m!981391 () Bool)

(assert (=> mapNonEmpty!39265 m!981391))

(declare-fun m!981393 () Bool)

(assert (=> start!94016 m!981393))

(declare-fun m!981395 () Bool)

(assert (=> start!94016 m!981395))

(declare-fun m!981397 () Bool)

(assert (=> start!94016 m!981397))

(declare-fun m!981399 () Bool)

(assert (=> b!1062047 m!981399))

(declare-fun m!981401 () Bool)

(assert (=> b!1062048 m!981401))

(declare-fun m!981403 () Bool)

(assert (=> b!1062045 m!981403))

(declare-fun m!981405 () Bool)

(assert (=> b!1062045 m!981405))

(check-sat (not b!1062047) (not b!1062048) (not b_next!21253) (not mapNonEmpty!39265) (not start!94016) b_and!33977 tp_is_empty!25063 (not b!1062045))
(check-sat b_and!33977 (not b_next!21253))
