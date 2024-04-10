; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71676 () Bool)

(assert start!71676)

(declare-fun b_free!13509 () Bool)

(declare-fun b_next!13509 () Bool)

(assert (=> start!71676 (= b_free!13509 (not b_next!13509))))

(declare-fun tp!47323 () Bool)

(declare-fun b_and!22595 () Bool)

(assert (=> start!71676 (= tp!47323 b_and!22595)))

(declare-fun b!833525 () Bool)

(declare-fun res!566771 () Bool)

(declare-fun e!464960 () Bool)

(assert (=> b!833525 (=> (not res!566771) (not e!464960))))

(declare-datatypes ((array!46612 0))(
  ( (array!46613 (arr!22340 (Array (_ BitVec 32) (_ BitVec 64))) (size!22761 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46612)

(declare-datatypes ((List!15954 0))(
  ( (Nil!15951) (Cons!15950 (h!17081 (_ BitVec 64)) (t!22325 List!15954)) )
))
(declare-fun arrayNoDuplicates!0 (array!46612 (_ BitVec 32) List!15954) Bool)

(assert (=> b!833525 (= res!566771 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15951))))

(declare-fun b!833526 () Bool)

(declare-fun res!566776 () Bool)

(assert (=> b!833526 (=> (not res!566776) (not e!464960))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25293 0))(
  ( (V!25294 (val!7657 Int)) )
))
(declare-datatypes ((ValueCell!7194 0))(
  ( (ValueCellFull!7194 (v!10105 V!25293)) (EmptyCell!7194) )
))
(declare-datatypes ((array!46614 0))(
  ( (array!46615 (arr!22341 (Array (_ BitVec 32) ValueCell!7194)) (size!22762 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46614)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833526 (= res!566776 (and (= (size!22762 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22761 _keys!976) (size!22762 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833527 () Bool)

(declare-fun res!566774 () Bool)

(assert (=> b!833527 (=> (not res!566774) (not e!464960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46612 (_ BitVec 32)) Bool)

(assert (=> b!833527 (= res!566774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!566772 () Bool)

(assert (=> start!71676 (=> (not res!566772) (not e!464960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71676 (= res!566772 (validMask!0 mask!1312))))

(assert (=> start!71676 e!464960))

(declare-fun tp_is_empty!15219 () Bool)

(assert (=> start!71676 tp_is_empty!15219))

(declare-fun array_inv!17793 (array!46612) Bool)

(assert (=> start!71676 (array_inv!17793 _keys!976)))

(assert (=> start!71676 true))

(declare-fun e!464961 () Bool)

(declare-fun array_inv!17794 (array!46614) Bool)

(assert (=> start!71676 (and (array_inv!17794 _values!788) e!464961)))

(assert (=> start!71676 tp!47323))

(declare-fun b!833528 () Bool)

(declare-fun e!464957 () Bool)

(declare-datatypes ((tuple2!10162 0))(
  ( (tuple2!10163 (_1!5092 (_ BitVec 64)) (_2!5092 V!25293)) )
))
(declare-datatypes ((List!15955 0))(
  ( (Nil!15952) (Cons!15951 (h!17082 tuple2!10162) (t!22326 List!15955)) )
))
(declare-datatypes ((ListLongMap!8985 0))(
  ( (ListLongMap!8986 (toList!4508 List!15955)) )
))
(declare-fun lt!378239 () ListLongMap!8985)

(declare-fun lt!378232 () ListLongMap!8985)

(assert (=> b!833528 (= e!464957 (= lt!378239 lt!378232))))

(declare-fun lt!378241 () ListLongMap!8985)

(assert (=> b!833528 (= lt!378241 lt!378232)))

(declare-fun lt!378237 () ListLongMap!8985)

(declare-fun lt!378240 () tuple2!10162)

(declare-fun +!1986 (ListLongMap!8985 tuple2!10162) ListLongMap!8985)

(assert (=> b!833528 (= lt!378232 (+!1986 lt!378237 lt!378240))))

(declare-fun lt!378233 () ListLongMap!8985)

(assert (=> b!833528 (= lt!378241 (+!1986 lt!378233 lt!378240))))

(declare-fun zeroValueBefore!34 () V!25293)

(declare-datatypes ((Unit!28559 0))(
  ( (Unit!28560) )
))
(declare-fun lt!378235 () Unit!28559)

(declare-fun zeroValueAfter!34 () V!25293)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!240 (ListLongMap!8985 (_ BitVec 64) V!25293 V!25293) Unit!28559)

(assert (=> b!833528 (= lt!378235 (addSameAsAddTwiceSameKeyDiffValues!240 lt!378233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!464956 () Bool)

(assert (=> b!833528 e!464956))

(declare-fun res!566775 () Bool)

(assert (=> b!833528 (=> (not res!566775) (not e!464956))))

(declare-fun lt!378230 () ListLongMap!8985)

(assert (=> b!833528 (= res!566775 (= lt!378230 lt!378237))))

(declare-fun lt!378229 () tuple2!10162)

(assert (=> b!833528 (= lt!378237 (+!1986 lt!378233 lt!378229))))

(declare-fun lt!378236 () ListLongMap!8985)

(declare-fun lt!378231 () tuple2!10162)

(assert (=> b!833528 (= lt!378233 (+!1986 lt!378236 lt!378231))))

(assert (=> b!833528 (= lt!378240 (tuple2!10163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!464958 () Bool)

(assert (=> b!833528 e!464958))

(declare-fun res!566773 () Bool)

(assert (=> b!833528 (=> (not res!566773) (not e!464958))))

(assert (=> b!833528 (= res!566773 (= lt!378230 (+!1986 (+!1986 lt!378236 lt!378229) lt!378231)))))

(declare-fun minValue!754 () V!25293)

(assert (=> b!833528 (= lt!378231 (tuple2!10163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833528 (= lt!378229 (tuple2!10163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2603 (array!46612 array!46614 (_ BitVec 32) (_ BitVec 32) V!25293 V!25293 (_ BitVec 32) Int) ListLongMap!8985)

(assert (=> b!833528 (= lt!378239 (getCurrentListMap!2603 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833528 (= lt!378230 (getCurrentListMap!2603 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24491 () Bool)

(declare-fun mapRes!24491 () Bool)

(assert (=> mapIsEmpty!24491 mapRes!24491))

(declare-fun b!833529 () Bool)

(declare-fun e!464955 () Bool)

(assert (=> b!833529 (= e!464961 (and e!464955 mapRes!24491))))

(declare-fun condMapEmpty!24491 () Bool)

(declare-fun mapDefault!24491 () ValueCell!7194)

(assert (=> b!833529 (= condMapEmpty!24491 (= (arr!22341 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7194)) mapDefault!24491)))))

(declare-fun b!833530 () Bool)

(declare-fun lt!378238 () ListLongMap!8985)

(assert (=> b!833530 (= e!464956 (= lt!378239 (+!1986 (+!1986 lt!378238 lt!378231) lt!378240)))))

(declare-fun b!833531 () Bool)

(assert (=> b!833531 (= e!464955 tp_is_empty!15219)))

(declare-fun b!833532 () Bool)

(declare-fun e!464954 () Bool)

(assert (=> b!833532 (= e!464954 tp_is_empty!15219)))

(declare-fun b!833533 () Bool)

(assert (=> b!833533 (= e!464960 (not e!464957))))

(declare-fun res!566777 () Bool)

(assert (=> b!833533 (=> res!566777 e!464957)))

(assert (=> b!833533 (= res!566777 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!833533 (= lt!378236 lt!378238)))

(declare-fun lt!378234 () Unit!28559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!595 (array!46612 array!46614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25293 V!25293 V!25293 V!25293 (_ BitVec 32) Int) Unit!28559)

(assert (=> b!833533 (= lt!378234 (lemmaNoChangeToArrayThenSameMapNoExtras!595 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2507 (array!46612 array!46614 (_ BitVec 32) (_ BitVec 32) V!25293 V!25293 (_ BitVec 32) Int) ListLongMap!8985)

(assert (=> b!833533 (= lt!378238 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833533 (= lt!378236 (getCurrentListMapNoExtraKeys!2507 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833534 () Bool)

(assert (=> b!833534 (= e!464958 (= lt!378239 (+!1986 (+!1986 lt!378238 (tuple2!10163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378231)))))

(declare-fun mapNonEmpty!24491 () Bool)

(declare-fun tp!47324 () Bool)

(assert (=> mapNonEmpty!24491 (= mapRes!24491 (and tp!47324 e!464954))))

(declare-fun mapRest!24491 () (Array (_ BitVec 32) ValueCell!7194))

(declare-fun mapValue!24491 () ValueCell!7194)

(declare-fun mapKey!24491 () (_ BitVec 32))

(assert (=> mapNonEmpty!24491 (= (arr!22341 _values!788) (store mapRest!24491 mapKey!24491 mapValue!24491))))

(assert (= (and start!71676 res!566772) b!833526))

(assert (= (and b!833526 res!566776) b!833527))

(assert (= (and b!833527 res!566774) b!833525))

(assert (= (and b!833525 res!566771) b!833533))

(assert (= (and b!833533 (not res!566777)) b!833528))

(assert (= (and b!833528 res!566773) b!833534))

(assert (= (and b!833528 res!566775) b!833530))

(assert (= (and b!833529 condMapEmpty!24491) mapIsEmpty!24491))

(assert (= (and b!833529 (not condMapEmpty!24491)) mapNonEmpty!24491))

(get-info :version)

(assert (= (and mapNonEmpty!24491 ((_ is ValueCellFull!7194) mapValue!24491)) b!833532))

(assert (= (and b!833529 ((_ is ValueCellFull!7194) mapDefault!24491)) b!833531))

(assert (= start!71676 b!833529))

(declare-fun m!778323 () Bool)

(assert (=> b!833534 m!778323))

(assert (=> b!833534 m!778323))

(declare-fun m!778325 () Bool)

(assert (=> b!833534 m!778325))

(declare-fun m!778327 () Bool)

(assert (=> b!833530 m!778327))

(assert (=> b!833530 m!778327))

(declare-fun m!778329 () Bool)

(assert (=> b!833530 m!778329))

(declare-fun m!778331 () Bool)

(assert (=> b!833525 m!778331))

(declare-fun m!778333 () Bool)

(assert (=> start!71676 m!778333))

(declare-fun m!778335 () Bool)

(assert (=> start!71676 m!778335))

(declare-fun m!778337 () Bool)

(assert (=> start!71676 m!778337))

(declare-fun m!778339 () Bool)

(assert (=> b!833527 m!778339))

(declare-fun m!778341 () Bool)

(assert (=> b!833533 m!778341))

(declare-fun m!778343 () Bool)

(assert (=> b!833533 m!778343))

(declare-fun m!778345 () Bool)

(assert (=> b!833533 m!778345))

(declare-fun m!778347 () Bool)

(assert (=> mapNonEmpty!24491 m!778347))

(declare-fun m!778349 () Bool)

(assert (=> b!833528 m!778349))

(declare-fun m!778351 () Bool)

(assert (=> b!833528 m!778351))

(declare-fun m!778353 () Bool)

(assert (=> b!833528 m!778353))

(declare-fun m!778355 () Bool)

(assert (=> b!833528 m!778355))

(declare-fun m!778357 () Bool)

(assert (=> b!833528 m!778357))

(declare-fun m!778359 () Bool)

(assert (=> b!833528 m!778359))

(assert (=> b!833528 m!778357))

(declare-fun m!778361 () Bool)

(assert (=> b!833528 m!778361))

(declare-fun m!778363 () Bool)

(assert (=> b!833528 m!778363))

(declare-fun m!778365 () Bool)

(assert (=> b!833528 m!778365))

(check-sat b_and!22595 (not b!833533) (not b!833528) (not b!833534) tp_is_empty!15219 (not mapNonEmpty!24491) (not start!71676) (not b!833525) (not b_next!13509) (not b!833527) (not b!833530))
(check-sat b_and!22595 (not b_next!13509))
