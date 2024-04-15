; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93834 () Bool)

(assert start!93834)

(declare-fun b_free!21313 () Bool)

(declare-fun b_next!21313 () Bool)

(assert (=> start!93834 (= b_free!21313 (not b_next!21313))))

(declare-fun tp!75362 () Bool)

(declare-fun b_and!34001 () Bool)

(assert (=> start!93834 (= tp!75362 b_and!34001)))

(declare-fun mapNonEmpty!39355 () Bool)

(declare-fun mapRes!39355 () Bool)

(declare-fun tp!75361 () Bool)

(declare-fun e!604287 () Bool)

(assert (=> mapNonEmpty!39355 (= mapRes!39355 (and tp!75361 e!604287))))

(declare-datatypes ((V!38633 0))(
  ( (V!38634 (val!12612 Int)) )
))
(declare-datatypes ((ValueCell!11858 0))(
  ( (ValueCellFull!11858 (v!15221 V!38633)) (EmptyCell!11858) )
))
(declare-fun mapRest!39355 () (Array (_ BitVec 32) ValueCell!11858))

(declare-fun mapValue!39355 () ValueCell!11858)

(declare-datatypes ((array!67196 0))(
  ( (array!67197 (arr!32306 (Array (_ BitVec 32) ValueCell!11858)) (size!32844 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67196)

(declare-fun mapKey!39355 () (_ BitVec 32))

(assert (=> mapNonEmpty!39355 (= (arr!32306 _values!955) (store mapRest!39355 mapKey!39355 mapValue!39355))))

(declare-fun b!1061195 () Bool)

(declare-fun e!604290 () Bool)

(assert (=> b!1061195 (= e!604290 (not true))))

(declare-datatypes ((tuple2!16010 0))(
  ( (tuple2!16011 (_1!8016 (_ BitVec 64)) (_2!8016 V!38633)) )
))
(declare-datatypes ((List!22565 0))(
  ( (Nil!22562) (Cons!22561 (h!23770 tuple2!16010) (t!31865 List!22565)) )
))
(declare-datatypes ((ListLongMap!13979 0))(
  ( (ListLongMap!13980 (toList!7005 List!22565)) )
))
(declare-fun lt!467360 () ListLongMap!13979)

(declare-fun lt!467359 () ListLongMap!13979)

(assert (=> b!1061195 (= lt!467360 lt!467359)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38633)

(declare-datatypes ((Unit!34609 0))(
  ( (Unit!34610) )
))
(declare-fun lt!467358 () Unit!34609)

(declare-fun minValue!907 () V!38633)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38633)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67198 0))(
  ( (array!67199 (arr!32307 (Array (_ BitVec 32) (_ BitVec 64))) (size!32845 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67198)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!616 (array!67198 array!67196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 V!38633 V!38633 (_ BitVec 32) Int) Unit!34609)

(assert (=> b!1061195 (= lt!467358 (lemmaNoChangeToArrayThenSameMapNoExtras!616 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3622 (array!67198 array!67196 (_ BitVec 32) (_ BitVec 32) V!38633 V!38633 (_ BitVec 32) Int) ListLongMap!13979)

(assert (=> b!1061195 (= lt!467359 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061195 (= lt!467360 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061196 () Bool)

(declare-fun res!708700 () Bool)

(assert (=> b!1061196 (=> (not res!708700) (not e!604290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67198 (_ BitVec 32)) Bool)

(assert (=> b!1061196 (= res!708700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708701 () Bool)

(assert (=> start!93834 (=> (not res!708701) (not e!604290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93834 (= res!708701 (validMask!0 mask!1515))))

(assert (=> start!93834 e!604290))

(assert (=> start!93834 true))

(declare-fun tp_is_empty!25123 () Bool)

(assert (=> start!93834 tp_is_empty!25123))

(declare-fun e!604288 () Bool)

(declare-fun array_inv!25038 (array!67196) Bool)

(assert (=> start!93834 (and (array_inv!25038 _values!955) e!604288)))

(assert (=> start!93834 tp!75362))

(declare-fun array_inv!25039 (array!67198) Bool)

(assert (=> start!93834 (array_inv!25039 _keys!1163)))

(declare-fun b!1061197 () Bool)

(declare-fun e!604286 () Bool)

(assert (=> b!1061197 (= e!604286 tp_is_empty!25123)))

(declare-fun b!1061198 () Bool)

(assert (=> b!1061198 (= e!604287 tp_is_empty!25123)))

(declare-fun mapIsEmpty!39355 () Bool)

(assert (=> mapIsEmpty!39355 mapRes!39355))

(declare-fun b!1061199 () Bool)

(declare-fun res!708703 () Bool)

(assert (=> b!1061199 (=> (not res!708703) (not e!604290))))

(assert (=> b!1061199 (= res!708703 (and (= (size!32844 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32845 _keys!1163) (size!32844 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061200 () Bool)

(assert (=> b!1061200 (= e!604288 (and e!604286 mapRes!39355))))

(declare-fun condMapEmpty!39355 () Bool)

(declare-fun mapDefault!39355 () ValueCell!11858)

(assert (=> b!1061200 (= condMapEmpty!39355 (= (arr!32306 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11858)) mapDefault!39355)))))

(declare-fun b!1061201 () Bool)

(declare-fun res!708702 () Bool)

(assert (=> b!1061201 (=> (not res!708702) (not e!604290))))

(declare-datatypes ((List!22566 0))(
  ( (Nil!22563) (Cons!22562 (h!23771 (_ BitVec 64)) (t!31866 List!22566)) )
))
(declare-fun arrayNoDuplicates!0 (array!67198 (_ BitVec 32) List!22566) Bool)

(assert (=> b!1061201 (= res!708702 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22563))))

(assert (= (and start!93834 res!708701) b!1061199))

(assert (= (and b!1061199 res!708703) b!1061196))

(assert (= (and b!1061196 res!708700) b!1061201))

(assert (= (and b!1061201 res!708702) b!1061195))

(assert (= (and b!1061200 condMapEmpty!39355) mapIsEmpty!39355))

(assert (= (and b!1061200 (not condMapEmpty!39355)) mapNonEmpty!39355))

(get-info :version)

(assert (= (and mapNonEmpty!39355 ((_ is ValueCellFull!11858) mapValue!39355)) b!1061198))

(assert (= (and b!1061200 ((_ is ValueCellFull!11858) mapDefault!39355)) b!1061197))

(assert (= start!93834 b!1061200))

(declare-fun m!979585 () Bool)

(assert (=> b!1061196 m!979585))

(declare-fun m!979587 () Bool)

(assert (=> mapNonEmpty!39355 m!979587))

(declare-fun m!979589 () Bool)

(assert (=> b!1061201 m!979589))

(declare-fun m!979591 () Bool)

(assert (=> b!1061195 m!979591))

(declare-fun m!979593 () Bool)

(assert (=> b!1061195 m!979593))

(declare-fun m!979595 () Bool)

(assert (=> b!1061195 m!979595))

(declare-fun m!979597 () Bool)

(assert (=> start!93834 m!979597))

(declare-fun m!979599 () Bool)

(assert (=> start!93834 m!979599))

(declare-fun m!979601 () Bool)

(assert (=> start!93834 m!979601))

(check-sat tp_is_empty!25123 (not b!1061195) (not b!1061196) (not b!1061201) (not mapNonEmpty!39355) b_and!34001 (not b_next!21313) (not start!93834))
(check-sat b_and!34001 (not b_next!21313))
