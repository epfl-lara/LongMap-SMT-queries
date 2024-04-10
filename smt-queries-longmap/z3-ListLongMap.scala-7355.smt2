; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93836 () Bool)

(assert start!93836)

(declare-fun b_free!21309 () Bool)

(declare-fun b_next!21309 () Bool)

(assert (=> start!93836 (= b_free!21309 (not b_next!21309))))

(declare-fun tp!75350 () Bool)

(declare-fun b_and!34023 () Bool)

(assert (=> start!93836 (= tp!75350 b_and!34023)))

(declare-fun b!1061306 () Bool)

(declare-fun res!708747 () Bool)

(declare-fun e!604350 () Bool)

(assert (=> b!1061306 (=> (not res!708747) (not e!604350))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38627 0))(
  ( (V!38628 (val!12610 Int)) )
))
(declare-datatypes ((ValueCell!11856 0))(
  ( (ValueCellFull!11856 (v!15220 V!38627)) (EmptyCell!11856) )
))
(declare-datatypes ((array!67241 0))(
  ( (array!67242 (arr!32328 (Array (_ BitVec 32) ValueCell!11856)) (size!32864 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67241)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67243 0))(
  ( (array!67244 (arr!32329 (Array (_ BitVec 32) (_ BitVec 64))) (size!32865 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67243)

(assert (=> b!1061306 (= res!708747 (and (= (size!32864 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32865 _keys!1163) (size!32864 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39349 () Bool)

(declare-fun mapRes!39349 () Bool)

(assert (=> mapIsEmpty!39349 mapRes!39349))

(declare-fun b!1061307 () Bool)

(assert (=> b!1061307 (= e!604350 (not true))))

(declare-datatypes ((tuple2!15936 0))(
  ( (tuple2!15937 (_1!7979 (_ BitVec 64)) (_2!7979 V!38627)) )
))
(declare-datatypes ((List!22522 0))(
  ( (Nil!22519) (Cons!22518 (h!23727 tuple2!15936) (t!31831 List!22522)) )
))
(declare-datatypes ((ListLongMap!13905 0))(
  ( (ListLongMap!13906 (toList!6968 List!22522)) )
))
(declare-fun lt!467541 () ListLongMap!13905)

(declare-fun lt!467542 () ListLongMap!13905)

(assert (=> b!1061307 (= lt!467541 lt!467542)))

(declare-fun zeroValueBefore!47 () V!38627)

(declare-fun minValue!907 () V!38627)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38627)

(declare-datatypes ((Unit!34738 0))(
  ( (Unit!34739) )
))
(declare-fun lt!467540 () Unit!34738)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!607 (array!67243 array!67241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38627 V!38627 V!38627 V!38627 (_ BitVec 32) Int) Unit!34738)

(assert (=> b!1061307 (= lt!467540 (lemmaNoChangeToArrayThenSameMapNoExtras!607 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3570 (array!67243 array!67241 (_ BitVec 32) (_ BitVec 32) V!38627 V!38627 (_ BitVec 32) Int) ListLongMap!13905)

(assert (=> b!1061307 (= lt!467542 (getCurrentListMapNoExtraKeys!3570 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061307 (= lt!467541 (getCurrentListMapNoExtraKeys!3570 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061308 () Bool)

(declare-fun res!708748 () Bool)

(assert (=> b!1061308 (=> (not res!708748) (not e!604350))))

(declare-datatypes ((List!22523 0))(
  ( (Nil!22520) (Cons!22519 (h!23728 (_ BitVec 64)) (t!31832 List!22523)) )
))
(declare-fun arrayNoDuplicates!0 (array!67243 (_ BitVec 32) List!22523) Bool)

(assert (=> b!1061308 (= res!708748 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22520))))

(declare-fun b!1061309 () Bool)

(declare-fun e!604352 () Bool)

(declare-fun tp_is_empty!25119 () Bool)

(assert (=> b!1061309 (= e!604352 tp_is_empty!25119)))

(declare-fun b!1061310 () Bool)

(declare-fun e!604351 () Bool)

(assert (=> b!1061310 (= e!604351 (and e!604352 mapRes!39349))))

(declare-fun condMapEmpty!39349 () Bool)

(declare-fun mapDefault!39349 () ValueCell!11856)

(assert (=> b!1061310 (= condMapEmpty!39349 (= (arr!32328 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11856)) mapDefault!39349)))))

(declare-fun mapNonEmpty!39349 () Bool)

(declare-fun tp!75349 () Bool)

(declare-fun e!604349 () Bool)

(assert (=> mapNonEmpty!39349 (= mapRes!39349 (and tp!75349 e!604349))))

(declare-fun mapValue!39349 () ValueCell!11856)

(declare-fun mapRest!39349 () (Array (_ BitVec 32) ValueCell!11856))

(declare-fun mapKey!39349 () (_ BitVec 32))

(assert (=> mapNonEmpty!39349 (= (arr!32328 _values!955) (store mapRest!39349 mapKey!39349 mapValue!39349))))

(declare-fun b!1061311 () Bool)

(assert (=> b!1061311 (= e!604349 tp_is_empty!25119)))

(declare-fun res!708745 () Bool)

(assert (=> start!93836 (=> (not res!708745) (not e!604350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93836 (= res!708745 (validMask!0 mask!1515))))

(assert (=> start!93836 e!604350))

(assert (=> start!93836 true))

(assert (=> start!93836 tp_is_empty!25119))

(declare-fun array_inv!25052 (array!67241) Bool)

(assert (=> start!93836 (and (array_inv!25052 _values!955) e!604351)))

(assert (=> start!93836 tp!75350))

(declare-fun array_inv!25053 (array!67243) Bool)

(assert (=> start!93836 (array_inv!25053 _keys!1163)))

(declare-fun b!1061312 () Bool)

(declare-fun res!708746 () Bool)

(assert (=> b!1061312 (=> (not res!708746) (not e!604350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67243 (_ BitVec 32)) Bool)

(assert (=> b!1061312 (= res!708746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93836 res!708745) b!1061306))

(assert (= (and b!1061306 res!708747) b!1061312))

(assert (= (and b!1061312 res!708746) b!1061308))

(assert (= (and b!1061308 res!708748) b!1061307))

(assert (= (and b!1061310 condMapEmpty!39349) mapIsEmpty!39349))

(assert (= (and b!1061310 (not condMapEmpty!39349)) mapNonEmpty!39349))

(get-info :version)

(assert (= (and mapNonEmpty!39349 ((_ is ValueCellFull!11856) mapValue!39349)) b!1061311))

(assert (= (and b!1061310 ((_ is ValueCellFull!11856) mapDefault!39349)) b!1061309))

(assert (= start!93836 b!1061310))

(declare-fun m!980175 () Bool)

(assert (=> b!1061308 m!980175))

(declare-fun m!980177 () Bool)

(assert (=> start!93836 m!980177))

(declare-fun m!980179 () Bool)

(assert (=> start!93836 m!980179))

(declare-fun m!980181 () Bool)

(assert (=> start!93836 m!980181))

(declare-fun m!980183 () Bool)

(assert (=> b!1061307 m!980183))

(declare-fun m!980185 () Bool)

(assert (=> b!1061307 m!980185))

(declare-fun m!980187 () Bool)

(assert (=> b!1061307 m!980187))

(declare-fun m!980189 () Bool)

(assert (=> b!1061312 m!980189))

(declare-fun m!980191 () Bool)

(assert (=> mapNonEmpty!39349 m!980191))

(check-sat b_and!34023 (not b!1061307) tp_is_empty!25119 (not b!1061312) (not b_next!21309) (not mapNonEmpty!39349) (not start!93836) (not b!1061308))
(check-sat b_and!34023 (not b_next!21309))
