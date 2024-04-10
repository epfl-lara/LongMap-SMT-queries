; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94590 () Bool)

(assert start!94590)

(declare-fun b_free!21873 () Bool)

(declare-fun b_next!21873 () Bool)

(assert (=> start!94590 (= b_free!21873 (not b_next!21873))))

(declare-fun tp!77072 () Bool)

(declare-fun b_and!34685 () Bool)

(assert (=> start!94590 (= tp!77072 b_and!34685)))

(declare-fun b!1069554 () Bool)

(declare-fun e!610406 () Bool)

(declare-fun tp_is_empty!25683 () Bool)

(assert (=> b!1069554 (= e!610406 tp_is_empty!25683)))

(declare-fun b!1069555 () Bool)

(declare-fun e!610404 () Bool)

(assert (=> b!1069555 (= e!610404 tp_is_empty!25683)))

(declare-fun b!1069556 () Bool)

(declare-fun res!713615 () Bool)

(declare-fun e!610405 () Bool)

(assert (=> b!1069556 (=> (not res!713615) (not e!610405))))

(declare-datatypes ((array!68345 0))(
  ( (array!68346 (arr!32870 (Array (_ BitVec 32) (_ BitVec 64))) (size!33406 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68345)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68345 (_ BitVec 32)) Bool)

(assert (=> b!1069556 (= res!713615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069557 () Bool)

(declare-fun res!713618 () Bool)

(assert (=> b!1069557 (=> (not res!713618) (not e!610405))))

(declare-datatypes ((List!22930 0))(
  ( (Nil!22927) (Cons!22926 (h!24135 (_ BitVec 64)) (t!32259 List!22930)) )
))
(declare-fun arrayNoDuplicates!0 (array!68345 (_ BitVec 32) List!22930) Bool)

(assert (=> b!1069557 (= res!713618 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22927))))

(declare-fun b!1069558 () Bool)

(assert (=> b!1069558 (= e!610405 (not true))))

(declare-datatypes ((V!39379 0))(
  ( (V!39380 (val!12892 Int)) )
))
(declare-datatypes ((tuple2!16386 0))(
  ( (tuple2!16387 (_1!8204 (_ BitVec 64)) (_2!8204 V!39379)) )
))
(declare-datatypes ((List!22931 0))(
  ( (Nil!22928) (Cons!22927 (h!24136 tuple2!16386) (t!32260 List!22931)) )
))
(declare-datatypes ((ListLongMap!14355 0))(
  ( (ListLongMap!14356 (toList!7193 List!22931)) )
))
(declare-fun lt!472660 () ListLongMap!14355)

(declare-fun lt!472661 () ListLongMap!14355)

(assert (=> b!1069558 (= lt!472660 lt!472661)))

(declare-fun zeroValueBefore!47 () V!39379)

(declare-datatypes ((ValueCell!12138 0))(
  ( (ValueCellFull!12138 (v!15508 V!39379)) (EmptyCell!12138) )
))
(declare-datatypes ((array!68347 0))(
  ( (array!68348 (arr!32871 (Array (_ BitVec 32) ValueCell!12138)) (size!33407 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68347)

(declare-fun minValue!907 () V!39379)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39379)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((Unit!35185 0))(
  ( (Unit!35186) )
))
(declare-fun lt!472662 () Unit!35185)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!806 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39379 V!39379 V!39379 V!39379 (_ BitVec 32) Int) Unit!35185)

(assert (=> b!1069558 (= lt!472662 (lemmaNoChangeToArrayThenSameMapNoExtras!806 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3769 (array!68345 array!68347 (_ BitVec 32) (_ BitVec 32) V!39379 V!39379 (_ BitVec 32) Int) ListLongMap!14355)

(assert (=> b!1069558 (= lt!472661 (getCurrentListMapNoExtraKeys!3769 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069558 (= lt!472660 (getCurrentListMapNoExtraKeys!3769 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!713617 () Bool)

(assert (=> start!94590 (=> (not res!713617) (not e!610405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94590 (= res!713617 (validMask!0 mask!1515))))

(assert (=> start!94590 e!610405))

(assert (=> start!94590 true))

(assert (=> start!94590 tp_is_empty!25683))

(declare-fun e!610403 () Bool)

(declare-fun array_inv!25438 (array!68347) Bool)

(assert (=> start!94590 (and (array_inv!25438 _values!955) e!610403)))

(assert (=> start!94590 tp!77072))

(declare-fun array_inv!25439 (array!68345) Bool)

(assert (=> start!94590 (array_inv!25439 _keys!1163)))

(declare-fun mapIsEmpty!40225 () Bool)

(declare-fun mapRes!40225 () Bool)

(assert (=> mapIsEmpty!40225 mapRes!40225))

(declare-fun b!1069559 () Bool)

(assert (=> b!1069559 (= e!610403 (and e!610406 mapRes!40225))))

(declare-fun condMapEmpty!40225 () Bool)

(declare-fun mapDefault!40225 () ValueCell!12138)

(assert (=> b!1069559 (= condMapEmpty!40225 (= (arr!32871 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12138)) mapDefault!40225)))))

(declare-fun b!1069560 () Bool)

(declare-fun res!713616 () Bool)

(assert (=> b!1069560 (=> (not res!713616) (not e!610405))))

(assert (=> b!1069560 (= res!713616 (and (= (size!33407 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33406 _keys!1163) (size!33407 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40225 () Bool)

(declare-fun tp!77071 () Bool)

(assert (=> mapNonEmpty!40225 (= mapRes!40225 (and tp!77071 e!610404))))

(declare-fun mapKey!40225 () (_ BitVec 32))

(declare-fun mapRest!40225 () (Array (_ BitVec 32) ValueCell!12138))

(declare-fun mapValue!40225 () ValueCell!12138)

(assert (=> mapNonEmpty!40225 (= (arr!32871 _values!955) (store mapRest!40225 mapKey!40225 mapValue!40225))))

(assert (= (and start!94590 res!713617) b!1069560))

(assert (= (and b!1069560 res!713616) b!1069556))

(assert (= (and b!1069556 res!713615) b!1069557))

(assert (= (and b!1069557 res!713618) b!1069558))

(assert (= (and b!1069559 condMapEmpty!40225) mapIsEmpty!40225))

(assert (= (and b!1069559 (not condMapEmpty!40225)) mapNonEmpty!40225))

(get-info :version)

(assert (= (and mapNonEmpty!40225 ((_ is ValueCellFull!12138) mapValue!40225)) b!1069555))

(assert (= (and b!1069559 ((_ is ValueCellFull!12138) mapDefault!40225)) b!1069554))

(assert (= start!94590 b!1069559))

(declare-fun m!988047 () Bool)

(assert (=> start!94590 m!988047))

(declare-fun m!988049 () Bool)

(assert (=> start!94590 m!988049))

(declare-fun m!988051 () Bool)

(assert (=> start!94590 m!988051))

(declare-fun m!988053 () Bool)

(assert (=> b!1069558 m!988053))

(declare-fun m!988055 () Bool)

(assert (=> b!1069558 m!988055))

(declare-fun m!988057 () Bool)

(assert (=> b!1069558 m!988057))

(declare-fun m!988059 () Bool)

(assert (=> b!1069557 m!988059))

(declare-fun m!988061 () Bool)

(assert (=> b!1069556 m!988061))

(declare-fun m!988063 () Bool)

(assert (=> mapNonEmpty!40225 m!988063))

(check-sat tp_is_empty!25683 (not b!1069556) (not b_next!21873) (not start!94590) (not b!1069558) b_and!34685 (not b!1069557) (not mapNonEmpty!40225))
(check-sat b_and!34685 (not b_next!21873))
