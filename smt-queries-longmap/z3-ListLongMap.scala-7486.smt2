; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94890 () Bool)

(assert start!94890)

(declare-fun b_free!22095 () Bool)

(declare-fun b_next!22095 () Bool)

(assert (=> start!94890 (= b_free!22095 (not b_next!22095))))

(declare-fun tp!77750 () Bool)

(declare-fun b_and!34949 () Bool)

(assert (=> start!94890 (= tp!77750 b_and!34949)))

(declare-fun b!1072943 () Bool)

(declare-fun e!612904 () Bool)

(declare-fun tp_is_empty!25905 () Bool)

(assert (=> b!1072943 (= e!612904 tp_is_empty!25905)))

(declare-fun b!1072944 () Bool)

(declare-fun res!715659 () Bool)

(declare-fun e!612905 () Bool)

(assert (=> b!1072944 (=> (not res!715659) (not e!612905))))

(declare-datatypes ((array!68775 0))(
  ( (array!68776 (arr!33081 (Array (_ BitVec 32) (_ BitVec 64))) (size!33617 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68775)

(declare-datatypes ((List!23094 0))(
  ( (Nil!23091) (Cons!23090 (h!24299 (_ BitVec 64)) (t!32431 List!23094)) )
))
(declare-fun arrayNoDuplicates!0 (array!68775 (_ BitVec 32) List!23094) Bool)

(assert (=> b!1072944 (= res!715659 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23091))))

(declare-fun b!1072945 () Bool)

(declare-fun res!715657 () Bool)

(assert (=> b!1072945 (=> (not res!715657) (not e!612905))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68775 (_ BitVec 32)) Bool)

(assert (=> b!1072945 (= res!715657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072946 () Bool)

(declare-fun res!715660 () Bool)

(assert (=> b!1072946 (=> (not res!715660) (not e!612905))))

(declare-datatypes ((V!39675 0))(
  ( (V!39676 (val!13003 Int)) )
))
(declare-datatypes ((ValueCell!12249 0))(
  ( (ValueCellFull!12249 (v!15621 V!39675)) (EmptyCell!12249) )
))
(declare-datatypes ((array!68777 0))(
  ( (array!68778 (arr!33082 (Array (_ BitVec 32) ValueCell!12249)) (size!33618 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68777)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072946 (= res!715660 (and (= (size!33618 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33617 _keys!1163) (size!33618 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715658 () Bool)

(assert (=> start!94890 (=> (not res!715658) (not e!612905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94890 (= res!715658 (validMask!0 mask!1515))))

(assert (=> start!94890 e!612905))

(assert (=> start!94890 true))

(assert (=> start!94890 tp_is_empty!25905))

(declare-fun e!612908 () Bool)

(declare-fun array_inv!25570 (array!68777) Bool)

(assert (=> start!94890 (and (array_inv!25570 _values!955) e!612908)))

(assert (=> start!94890 tp!77750))

(declare-fun array_inv!25571 (array!68775) Bool)

(assert (=> start!94890 (array_inv!25571 _keys!1163)))

(declare-fun mapIsEmpty!40570 () Bool)

(declare-fun mapRes!40570 () Bool)

(assert (=> mapIsEmpty!40570 mapRes!40570))

(declare-fun b!1072947 () Bool)

(declare-fun e!612907 () Bool)

(assert (=> b!1072947 (= e!612907 tp_is_empty!25905)))

(declare-fun b!1072948 () Bool)

(assert (=> b!1072948 (= e!612908 (and e!612904 mapRes!40570))))

(declare-fun condMapEmpty!40570 () Bool)

(declare-fun mapDefault!40570 () ValueCell!12249)

(assert (=> b!1072948 (= condMapEmpty!40570 (= (arr!33082 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12249)) mapDefault!40570)))))

(declare-fun mapNonEmpty!40570 () Bool)

(declare-fun tp!77749 () Bool)

(assert (=> mapNonEmpty!40570 (= mapRes!40570 (and tp!77749 e!612907))))

(declare-fun mapRest!40570 () (Array (_ BitVec 32) ValueCell!12249))

(declare-fun mapValue!40570 () ValueCell!12249)

(declare-fun mapKey!40570 () (_ BitVec 32))

(assert (=> mapNonEmpty!40570 (= (arr!33082 _values!955) (store mapRest!40570 mapKey!40570 mapValue!40570))))

(declare-fun b!1072949 () Bool)

(assert (=> b!1072949 (= e!612905 false)))

(declare-datatypes ((tuple2!16558 0))(
  ( (tuple2!16559 (_1!8290 (_ BitVec 64)) (_2!8290 V!39675)) )
))
(declare-datatypes ((List!23095 0))(
  ( (Nil!23092) (Cons!23091 (h!24300 tuple2!16558) (t!32432 List!23095)) )
))
(declare-datatypes ((ListLongMap!14527 0))(
  ( (ListLongMap!14528 (toList!7279 List!23095)) )
))
(declare-fun lt!475906 () ListLongMap!14527)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39675)

(declare-fun minValue!907 () V!39675)

(declare-fun getCurrentListMapNoExtraKeys!3843 (array!68775 array!68777 (_ BitVec 32) (_ BitVec 32) V!39675 V!39675 (_ BitVec 32) Int) ListLongMap!14527)

(assert (=> b!1072949 (= lt!475906 (getCurrentListMapNoExtraKeys!3843 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39675)

(declare-fun lt!475905 () ListLongMap!14527)

(assert (=> b!1072949 (= lt!475905 (getCurrentListMapNoExtraKeys!3843 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94890 res!715658) b!1072946))

(assert (= (and b!1072946 res!715660) b!1072945))

(assert (= (and b!1072945 res!715657) b!1072944))

(assert (= (and b!1072944 res!715659) b!1072949))

(assert (= (and b!1072948 condMapEmpty!40570) mapIsEmpty!40570))

(assert (= (and b!1072948 (not condMapEmpty!40570)) mapNonEmpty!40570))

(get-info :version)

(assert (= (and mapNonEmpty!40570 ((_ is ValueCellFull!12249) mapValue!40570)) b!1072947))

(assert (= (and b!1072948 ((_ is ValueCellFull!12249) mapDefault!40570)) b!1072943))

(assert (= start!94890 b!1072948))

(declare-fun m!992047 () Bool)

(assert (=> mapNonEmpty!40570 m!992047))

(declare-fun m!992049 () Bool)

(assert (=> b!1072945 m!992049))

(declare-fun m!992051 () Bool)

(assert (=> b!1072944 m!992051))

(declare-fun m!992053 () Bool)

(assert (=> start!94890 m!992053))

(declare-fun m!992055 () Bool)

(assert (=> start!94890 m!992055))

(declare-fun m!992057 () Bool)

(assert (=> start!94890 m!992057))

(declare-fun m!992059 () Bool)

(assert (=> b!1072949 m!992059))

(declare-fun m!992061 () Bool)

(assert (=> b!1072949 m!992061))

(check-sat (not b!1072949) (not b!1072945) (not b_next!22095) tp_is_empty!25905 b_and!34949 (not start!94890) (not mapNonEmpty!40570) (not b!1072944))
(check-sat b_and!34949 (not b_next!22095))
