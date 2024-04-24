; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94144 () Bool)

(assert start!94144)

(declare-fun b_free!21367 () Bool)

(declare-fun b_next!21367 () Bool)

(assert (=> start!94144 (= b_free!21367 (not b_next!21367))))

(declare-fun tp!75526 () Bool)

(declare-fun b_and!34099 () Bool)

(assert (=> start!94144 (= tp!75526 b_and!34099)))

(declare-fun b!1063358 () Bool)

(declare-fun e!605726 () Bool)

(declare-fun e!605728 () Bool)

(declare-fun mapRes!39439 () Bool)

(assert (=> b!1063358 (= e!605726 (and e!605728 mapRes!39439))))

(declare-fun condMapEmpty!39439 () Bool)

(declare-datatypes ((V!38705 0))(
  ( (V!38706 (val!12639 Int)) )
))
(declare-datatypes ((ValueCell!11885 0))(
  ( (ValueCellFull!11885 (v!15245 V!38705)) (EmptyCell!11885) )
))
(declare-datatypes ((array!67401 0))(
  ( (array!67402 (arr!32401 (Array (_ BitVec 32) ValueCell!11885)) (size!32938 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67401)

(declare-fun mapDefault!39439 () ValueCell!11885)

(assert (=> b!1063358 (= condMapEmpty!39439 (= (arr!32401 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11885)) mapDefault!39439)))))

(declare-fun b!1063359 () Bool)

(declare-fun e!605725 () Bool)

(declare-fun tp_is_empty!25177 () Bool)

(assert (=> b!1063359 (= e!605725 tp_is_empty!25177)))

(declare-fun b!1063360 () Bool)

(assert (=> b!1063360 (= e!605728 tp_is_empty!25177)))

(declare-fun mapNonEmpty!39439 () Bool)

(declare-fun tp!75527 () Bool)

(assert (=> mapNonEmpty!39439 (= mapRes!39439 (and tp!75527 e!605725))))

(declare-fun mapValue!39439 () ValueCell!11885)

(declare-fun mapKey!39439 () (_ BitVec 32))

(declare-fun mapRest!39439 () (Array (_ BitVec 32) ValueCell!11885))

(assert (=> mapNonEmpty!39439 (= (arr!32401 _values!955) (store mapRest!39439 mapKey!39439 mapValue!39439))))

(declare-fun mapIsEmpty!39439 () Bool)

(assert (=> mapIsEmpty!39439 mapRes!39439))

(declare-fun b!1063362 () Bool)

(declare-fun e!605730 () Bool)

(assert (=> b!1063362 (= e!605730 true)))

(declare-datatypes ((tuple2!15966 0))(
  ( (tuple2!15967 (_1!7994 (_ BitVec 64)) (_2!7994 V!38705)) )
))
(declare-datatypes ((List!22553 0))(
  ( (Nil!22550) (Cons!22549 (h!23767 tuple2!15966) (t!31856 List!22553)) )
))
(declare-datatypes ((ListLongMap!13943 0))(
  ( (ListLongMap!13944 (toList!6987 List!22553)) )
))
(declare-fun lt!468387 () ListLongMap!13943)

(declare-fun -!552 (ListLongMap!13943 (_ BitVec 64)) ListLongMap!13943)

(assert (=> b!1063362 (= (-!552 lt!468387 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468387)))

(declare-datatypes ((Unit!34779 0))(
  ( (Unit!34780) )
))
(declare-fun lt!468390 () Unit!34779)

(declare-fun removeNotPresentStillSame!3 (ListLongMap!13943 (_ BitVec 64)) Unit!34779)

(assert (=> b!1063362 (= lt!468390 (removeNotPresentStillSame!3 lt!468387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063363 () Bool)

(declare-fun res!709680 () Bool)

(declare-fun e!605727 () Bool)

(assert (=> b!1063363 (=> (not res!709680) (not e!605727))))

(declare-datatypes ((array!67403 0))(
  ( (array!67404 (arr!32402 (Array (_ BitVec 32) (_ BitVec 64))) (size!32939 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67403)

(declare-datatypes ((List!22554 0))(
  ( (Nil!22551) (Cons!22550 (h!23768 (_ BitVec 64)) (t!31857 List!22554)) )
))
(declare-fun arrayNoDuplicates!0 (array!67403 (_ BitVec 32) List!22554) Bool)

(assert (=> b!1063363 (= res!709680 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22551))))

(declare-fun b!1063364 () Bool)

(declare-fun e!605729 () Bool)

(assert (=> b!1063364 (= e!605729 e!605730)))

(declare-fun res!709678 () Bool)

(assert (=> b!1063364 (=> res!709678 e!605730)))

(declare-fun contains!6247 (ListLongMap!13943 (_ BitVec 64)) Bool)

(assert (=> b!1063364 (= res!709678 (contains!6247 lt!468387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38705)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38705)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3973 (array!67403 array!67401 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!13943)

(assert (=> b!1063364 (= lt!468387 (getCurrentListMap!3973 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709681 () Bool)

(assert (=> start!94144 (=> (not res!709681) (not e!605727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94144 (= res!709681 (validMask!0 mask!1515))))

(assert (=> start!94144 e!605727))

(assert (=> start!94144 true))

(assert (=> start!94144 tp_is_empty!25177))

(declare-fun array_inv!25120 (array!67401) Bool)

(assert (=> start!94144 (and (array_inv!25120 _values!955) e!605726)))

(assert (=> start!94144 tp!75526))

(declare-fun array_inv!25121 (array!67403) Bool)

(assert (=> start!94144 (array_inv!25121 _keys!1163)))

(declare-fun b!1063361 () Bool)

(declare-fun res!709679 () Bool)

(assert (=> b!1063361 (=> (not res!709679) (not e!605727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67403 (_ BitVec 32)) Bool)

(assert (=> b!1063361 (= res!709679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063365 () Bool)

(assert (=> b!1063365 (= e!605727 (not e!605729))))

(declare-fun res!709677 () Bool)

(assert (=> b!1063365 (=> res!709677 e!605729)))

(assert (=> b!1063365 (= res!709677 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468389 () ListLongMap!13943)

(declare-fun lt!468391 () ListLongMap!13943)

(assert (=> b!1063365 (= lt!468389 lt!468391)))

(declare-fun lt!468388 () Unit!34779)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38705)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!638 (array!67403 array!67401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 V!38705 V!38705 (_ BitVec 32) Int) Unit!34779)

(assert (=> b!1063365 (= lt!468388 (lemmaNoChangeToArrayThenSameMapNoExtras!638 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3635 (array!67403 array!67401 (_ BitVec 32) (_ BitVec 32) V!38705 V!38705 (_ BitVec 32) Int) ListLongMap!13943)

(assert (=> b!1063365 (= lt!468391 (getCurrentListMapNoExtraKeys!3635 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063365 (= lt!468389 (getCurrentListMapNoExtraKeys!3635 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063366 () Bool)

(declare-fun res!709682 () Bool)

(assert (=> b!1063366 (=> (not res!709682) (not e!605727))))

(assert (=> b!1063366 (= res!709682 (and (= (size!32938 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32939 _keys!1163) (size!32938 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94144 res!709681) b!1063366))

(assert (= (and b!1063366 res!709682) b!1063361))

(assert (= (and b!1063361 res!709679) b!1063363))

(assert (= (and b!1063363 res!709680) b!1063365))

(assert (= (and b!1063365 (not res!709677)) b!1063364))

(assert (= (and b!1063364 (not res!709678)) b!1063362))

(assert (= (and b!1063358 condMapEmpty!39439) mapIsEmpty!39439))

(assert (= (and b!1063358 (not condMapEmpty!39439)) mapNonEmpty!39439))

(get-info :version)

(assert (= (and mapNonEmpty!39439 ((_ is ValueCellFull!11885) mapValue!39439)) b!1063359))

(assert (= (and b!1063358 ((_ is ValueCellFull!11885) mapDefault!39439)) b!1063360))

(assert (= start!94144 b!1063358))

(declare-fun m!982471 () Bool)

(assert (=> start!94144 m!982471))

(declare-fun m!982473 () Bool)

(assert (=> start!94144 m!982473))

(declare-fun m!982475 () Bool)

(assert (=> start!94144 m!982475))

(declare-fun m!982477 () Bool)

(assert (=> b!1063364 m!982477))

(declare-fun m!982479 () Bool)

(assert (=> b!1063364 m!982479))

(declare-fun m!982481 () Bool)

(assert (=> mapNonEmpty!39439 m!982481))

(declare-fun m!982483 () Bool)

(assert (=> b!1063361 m!982483))

(declare-fun m!982485 () Bool)

(assert (=> b!1063365 m!982485))

(declare-fun m!982487 () Bool)

(assert (=> b!1063365 m!982487))

(declare-fun m!982489 () Bool)

(assert (=> b!1063365 m!982489))

(declare-fun m!982491 () Bool)

(assert (=> b!1063363 m!982491))

(declare-fun m!982493 () Bool)

(assert (=> b!1063362 m!982493))

(declare-fun m!982495 () Bool)

(assert (=> b!1063362 m!982495))

(check-sat (not start!94144) (not b!1063361) b_and!34099 (not b!1063363) (not b!1063364) (not mapNonEmpty!39439) (not b!1063365) (not b!1063362) (not b_next!21367) tp_is_empty!25177)
(check-sat b_and!34099 (not b_next!21367))
