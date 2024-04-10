; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94584 () Bool)

(assert start!94584)

(declare-fun b_free!21867 () Bool)

(declare-fun b_next!21867 () Bool)

(assert (=> start!94584 (= b_free!21867 (not b_next!21867))))

(declare-fun tp!77054 () Bool)

(declare-fun b_and!34679 () Bool)

(assert (=> start!94584 (= tp!77054 b_and!34679)))

(declare-fun mapIsEmpty!40216 () Bool)

(declare-fun mapRes!40216 () Bool)

(assert (=> mapIsEmpty!40216 mapRes!40216))

(declare-fun mapNonEmpty!40216 () Bool)

(declare-fun tp!77053 () Bool)

(declare-fun e!610362 () Bool)

(assert (=> mapNonEmpty!40216 (= mapRes!40216 (and tp!77053 e!610362))))

(declare-fun mapKey!40216 () (_ BitVec 32))

(declare-datatypes ((V!39371 0))(
  ( (V!39372 (val!12889 Int)) )
))
(declare-datatypes ((ValueCell!12135 0))(
  ( (ValueCellFull!12135 (v!15505 V!39371)) (EmptyCell!12135) )
))
(declare-fun mapRest!40216 () (Array (_ BitVec 32) ValueCell!12135))

(declare-datatypes ((array!68333 0))(
  ( (array!68334 (arr!32864 (Array (_ BitVec 32) ValueCell!12135)) (size!33400 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68333)

(declare-fun mapValue!40216 () ValueCell!12135)

(assert (=> mapNonEmpty!40216 (= (arr!32864 _values!955) (store mapRest!40216 mapKey!40216 mapValue!40216))))

(declare-fun b!1069492 () Bool)

(declare-fun res!713579 () Bool)

(declare-fun e!610361 () Bool)

(assert (=> b!1069492 (=> (not res!713579) (not e!610361))))

(declare-datatypes ((array!68335 0))(
  ( (array!68336 (arr!32865 (Array (_ BitVec 32) (_ BitVec 64))) (size!33401 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68335)

(declare-datatypes ((List!22926 0))(
  ( (Nil!22923) (Cons!22922 (h!24131 (_ BitVec 64)) (t!32255 List!22926)) )
))
(declare-fun arrayNoDuplicates!0 (array!68335 (_ BitVec 32) List!22926) Bool)

(assert (=> b!1069492 (= res!713579 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22923))))

(declare-fun b!1069493 () Bool)

(assert (=> b!1069493 (= e!610361 (not true))))

(declare-datatypes ((tuple2!16382 0))(
  ( (tuple2!16383 (_1!8202 (_ BitVec 64)) (_2!8202 V!39371)) )
))
(declare-datatypes ((List!22927 0))(
  ( (Nil!22924) (Cons!22923 (h!24132 tuple2!16382) (t!32256 List!22927)) )
))
(declare-datatypes ((ListLongMap!14351 0))(
  ( (ListLongMap!14352 (toList!7191 List!22927)) )
))
(declare-fun lt!472635 () ListLongMap!14351)

(declare-fun lt!472634 () ListLongMap!14351)

(assert (=> b!1069493 (= lt!472635 lt!472634)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39371)

(declare-datatypes ((Unit!35181 0))(
  ( (Unit!35182) )
))
(declare-fun lt!472633 () Unit!35181)

(declare-fun minValue!907 () V!39371)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39371)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!804 (array!68335 array!68333 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39371 V!39371 V!39371 V!39371 (_ BitVec 32) Int) Unit!35181)

(assert (=> b!1069493 (= lt!472633 (lemmaNoChangeToArrayThenSameMapNoExtras!804 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3767 (array!68335 array!68333 (_ BitVec 32) (_ BitVec 32) V!39371 V!39371 (_ BitVec 32) Int) ListLongMap!14351)

(assert (=> b!1069493 (= lt!472634 (getCurrentListMapNoExtraKeys!3767 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069493 (= lt!472635 (getCurrentListMapNoExtraKeys!3767 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069494 () Bool)

(declare-fun e!610360 () Bool)

(declare-fun tp_is_empty!25677 () Bool)

(assert (=> b!1069494 (= e!610360 tp_is_empty!25677)))

(declare-fun b!1069495 () Bool)

(assert (=> b!1069495 (= e!610362 tp_is_empty!25677)))

(declare-fun res!713580 () Bool)

(assert (=> start!94584 (=> (not res!713580) (not e!610361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94584 (= res!713580 (validMask!0 mask!1515))))

(assert (=> start!94584 e!610361))

(assert (=> start!94584 true))

(assert (=> start!94584 tp_is_empty!25677))

(declare-fun e!610358 () Bool)

(declare-fun array_inv!25434 (array!68333) Bool)

(assert (=> start!94584 (and (array_inv!25434 _values!955) e!610358)))

(assert (=> start!94584 tp!77054))

(declare-fun array_inv!25435 (array!68335) Bool)

(assert (=> start!94584 (array_inv!25435 _keys!1163)))

(declare-fun b!1069491 () Bool)

(declare-fun res!713581 () Bool)

(assert (=> b!1069491 (=> (not res!713581) (not e!610361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68335 (_ BitVec 32)) Bool)

(assert (=> b!1069491 (= res!713581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069496 () Bool)

(assert (=> b!1069496 (= e!610358 (and e!610360 mapRes!40216))))

(declare-fun condMapEmpty!40216 () Bool)

(declare-fun mapDefault!40216 () ValueCell!12135)

(assert (=> b!1069496 (= condMapEmpty!40216 (= (arr!32864 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12135)) mapDefault!40216)))))

(declare-fun b!1069497 () Bool)

(declare-fun res!713582 () Bool)

(assert (=> b!1069497 (=> (not res!713582) (not e!610361))))

(assert (=> b!1069497 (= res!713582 (and (= (size!33400 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33401 _keys!1163) (size!33400 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94584 res!713580) b!1069497))

(assert (= (and b!1069497 res!713582) b!1069491))

(assert (= (and b!1069491 res!713581) b!1069492))

(assert (= (and b!1069492 res!713579) b!1069493))

(assert (= (and b!1069496 condMapEmpty!40216) mapIsEmpty!40216))

(assert (= (and b!1069496 (not condMapEmpty!40216)) mapNonEmpty!40216))

(get-info :version)

(assert (= (and mapNonEmpty!40216 ((_ is ValueCellFull!12135) mapValue!40216)) b!1069495))

(assert (= (and b!1069496 ((_ is ValueCellFull!12135) mapDefault!40216)) b!1069494))

(assert (= start!94584 b!1069496))

(declare-fun m!987993 () Bool)

(assert (=> b!1069492 m!987993))

(declare-fun m!987995 () Bool)

(assert (=> b!1069491 m!987995))

(declare-fun m!987997 () Bool)

(assert (=> start!94584 m!987997))

(declare-fun m!987999 () Bool)

(assert (=> start!94584 m!987999))

(declare-fun m!988001 () Bool)

(assert (=> start!94584 m!988001))

(declare-fun m!988003 () Bool)

(assert (=> mapNonEmpty!40216 m!988003))

(declare-fun m!988005 () Bool)

(assert (=> b!1069493 m!988005))

(declare-fun m!988007 () Bool)

(assert (=> b!1069493 m!988007))

(declare-fun m!988009 () Bool)

(assert (=> b!1069493 m!988009))

(check-sat (not mapNonEmpty!40216) b_and!34679 (not b!1069493) (not start!94584) tp_is_empty!25677 (not b!1069492) (not b!1069491) (not b_next!21867))
(check-sat b_and!34679 (not b_next!21867))
