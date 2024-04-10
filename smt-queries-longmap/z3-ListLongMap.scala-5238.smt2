; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70510 () Bool)

(assert start!70510)

(declare-fun b_free!12837 () Bool)

(declare-fun b_next!12837 () Bool)

(assert (=> start!70510 (= b_free!12837 (not b_next!12837))))

(declare-fun tp!45244 () Bool)

(declare-fun b_and!21667 () Bool)

(assert (=> start!70510 (= tp!45244 b_and!21667)))

(declare-fun res!558942 () Bool)

(declare-fun e!454786 () Bool)

(assert (=> start!70510 (=> (not res!558942) (not e!454786))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70510 (= res!558942 (validMask!0 mask!1312))))

(assert (=> start!70510 e!454786))

(declare-fun tp_is_empty!14547 () Bool)

(assert (=> start!70510 tp_is_empty!14547))

(declare-datatypes ((array!45290 0))(
  ( (array!45291 (arr!21699 (Array (_ BitVec 32) (_ BitVec 64))) (size!22120 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45290)

(declare-fun array_inv!17345 (array!45290) Bool)

(assert (=> start!70510 (array_inv!17345 _keys!976)))

(assert (=> start!70510 true))

(declare-datatypes ((V!24397 0))(
  ( (V!24398 (val!7321 Int)) )
))
(declare-datatypes ((ValueCell!6858 0))(
  ( (ValueCellFull!6858 (v!9750 V!24397)) (EmptyCell!6858) )
))
(declare-datatypes ((array!45292 0))(
  ( (array!45293 (arr!21700 (Array (_ BitVec 32) ValueCell!6858)) (size!22121 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45292)

(declare-fun e!454782 () Bool)

(declare-fun array_inv!17346 (array!45292) Bool)

(assert (=> start!70510 (and (array_inv!17346 _values!788) e!454782)))

(assert (=> start!70510 tp!45244))

(declare-fun b!819057 () Bool)

(declare-fun res!558938 () Bool)

(assert (=> b!819057 (=> (not res!558938) (not e!454786))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819057 (= res!558938 (and (= (size!22121 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22120 _keys!976) (size!22121 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23419 () Bool)

(declare-fun mapRes!23419 () Bool)

(declare-fun tp!45243 () Bool)

(declare-fun e!454787 () Bool)

(assert (=> mapNonEmpty!23419 (= mapRes!23419 (and tp!45243 e!454787))))

(declare-fun mapKey!23419 () (_ BitVec 32))

(declare-fun mapRest!23419 () (Array (_ BitVec 32) ValueCell!6858))

(declare-fun mapValue!23419 () ValueCell!6858)

(assert (=> mapNonEmpty!23419 (= (arr!21700 _values!788) (store mapRest!23419 mapKey!23419 mapValue!23419))))

(declare-fun b!819058 () Bool)

(declare-fun res!558941 () Bool)

(assert (=> b!819058 (=> (not res!558941) (not e!454786))))

(declare-datatypes ((List!15457 0))(
  ( (Nil!15454) (Cons!15453 (h!16582 (_ BitVec 64)) (t!21786 List!15457)) )
))
(declare-fun arrayNoDuplicates!0 (array!45290 (_ BitVec 32) List!15457) Bool)

(assert (=> b!819058 (= res!558941 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15454))))

(declare-fun b!819059 () Bool)

(declare-fun res!558937 () Bool)

(assert (=> b!819059 (=> (not res!558937) (not e!454786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45290 (_ BitVec 32)) Bool)

(assert (=> b!819059 (= res!558937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-datatypes ((tuple2!9628 0))(
  ( (tuple2!9629 (_1!4825 (_ BitVec 64)) (_2!4825 V!24397)) )
))
(declare-datatypes ((List!15458 0))(
  ( (Nil!15455) (Cons!15454 (h!16583 tuple2!9628) (t!21787 List!15458)) )
))
(declare-datatypes ((ListLongMap!8451 0))(
  ( (ListLongMap!8452 (toList!4241 List!15458)) )
))
(declare-fun lt!367350 () ListLongMap!8451)

(declare-fun zeroValueAfter!34 () V!24397)

(declare-fun lt!367349 () ListLongMap!8451)

(declare-fun b!819060 () Bool)

(declare-fun e!454784 () Bool)

(declare-fun +!1838 (ListLongMap!8451 tuple2!9628) ListLongMap!8451)

(assert (=> b!819060 (= e!454784 (= lt!367349 (+!1838 lt!367350 (tuple2!9629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819061 () Bool)

(assert (=> b!819061 (= e!454787 tp_is_empty!14547)))

(declare-fun b!819062 () Bool)

(declare-fun e!454785 () Bool)

(assert (=> b!819062 (= e!454785 tp_is_empty!14547)))

(declare-fun mapIsEmpty!23419 () Bool)

(assert (=> mapIsEmpty!23419 mapRes!23419))

(declare-fun b!819063 () Bool)

(declare-fun e!454781 () Bool)

(assert (=> b!819063 (= e!454781 true)))

(declare-fun lt!367343 () tuple2!9628)

(declare-fun lt!367345 () ListLongMap!8451)

(declare-fun lt!367351 () tuple2!9628)

(assert (=> b!819063 (= lt!367345 (+!1838 (+!1838 lt!367350 lt!367351) lt!367343))))

(declare-fun lt!367348 () ListLongMap!8451)

(declare-fun lt!367352 () ListLongMap!8451)

(assert (=> b!819063 (= (+!1838 lt!367348 lt!367343) (+!1838 lt!367352 lt!367343))))

(declare-fun zeroValueBefore!34 () V!24397)

(declare-datatypes ((Unit!27961 0))(
  ( (Unit!27962) )
))
(declare-fun lt!367344 () Unit!27961)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!178 (ListLongMap!8451 (_ BitVec 64) V!24397 V!24397) Unit!27961)

(assert (=> b!819063 (= lt!367344 (addSameAsAddTwiceSameKeyDiffValues!178 lt!367348 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819063 (= lt!367343 (tuple2!9629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819063 e!454784))

(declare-fun res!558940 () Bool)

(assert (=> b!819063 (=> (not res!558940) (not e!454784))))

(declare-fun lt!367347 () ListLongMap!8451)

(assert (=> b!819063 (= res!558940 (= lt!367347 lt!367352))))

(assert (=> b!819063 (= lt!367352 (+!1838 lt!367348 lt!367351))))

(assert (=> b!819063 (= lt!367351 (tuple2!9629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24397)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2444 (array!45290 array!45292 (_ BitVec 32) (_ BitVec 32) V!24397 V!24397 (_ BitVec 32) Int) ListLongMap!8451)

(assert (=> b!819063 (= lt!367349 (getCurrentListMap!2444 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819063 (= lt!367347 (getCurrentListMap!2444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819064 () Bool)

(assert (=> b!819064 (= e!454782 (and e!454785 mapRes!23419))))

(declare-fun condMapEmpty!23419 () Bool)

(declare-fun mapDefault!23419 () ValueCell!6858)

(assert (=> b!819064 (= condMapEmpty!23419 (= (arr!21700 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6858)) mapDefault!23419)))))

(declare-fun b!819065 () Bool)

(assert (=> b!819065 (= e!454786 (not e!454781))))

(declare-fun res!558939 () Bool)

(assert (=> b!819065 (=> res!558939 e!454781)))

(assert (=> b!819065 (= res!558939 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819065 (= lt!367348 lt!367350)))

(declare-fun lt!367346 () Unit!27961)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!385 (array!45290 array!45292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24397 V!24397 V!24397 V!24397 (_ BitVec 32) Int) Unit!27961)

(assert (=> b!819065 (= lt!367346 (lemmaNoChangeToArrayThenSameMapNoExtras!385 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2275 (array!45290 array!45292 (_ BitVec 32) (_ BitVec 32) V!24397 V!24397 (_ BitVec 32) Int) ListLongMap!8451)

(assert (=> b!819065 (= lt!367350 (getCurrentListMapNoExtraKeys!2275 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819065 (= lt!367348 (getCurrentListMapNoExtraKeys!2275 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70510 res!558942) b!819057))

(assert (= (and b!819057 res!558938) b!819059))

(assert (= (and b!819059 res!558937) b!819058))

(assert (= (and b!819058 res!558941) b!819065))

(assert (= (and b!819065 (not res!558939)) b!819063))

(assert (= (and b!819063 res!558940) b!819060))

(assert (= (and b!819064 condMapEmpty!23419) mapIsEmpty!23419))

(assert (= (and b!819064 (not condMapEmpty!23419)) mapNonEmpty!23419))

(get-info :version)

(assert (= (and mapNonEmpty!23419 ((_ is ValueCellFull!6858) mapValue!23419)) b!819061))

(assert (= (and b!819064 ((_ is ValueCellFull!6858) mapDefault!23419)) b!819062))

(assert (= start!70510 b!819064))

(declare-fun m!760573 () Bool)

(assert (=> start!70510 m!760573))

(declare-fun m!760575 () Bool)

(assert (=> start!70510 m!760575))

(declare-fun m!760577 () Bool)

(assert (=> start!70510 m!760577))

(declare-fun m!760579 () Bool)

(assert (=> b!819059 m!760579))

(declare-fun m!760581 () Bool)

(assert (=> b!819058 m!760581))

(declare-fun m!760583 () Bool)

(assert (=> b!819065 m!760583))

(declare-fun m!760585 () Bool)

(assert (=> b!819065 m!760585))

(declare-fun m!760587 () Bool)

(assert (=> b!819065 m!760587))

(declare-fun m!760589 () Bool)

(assert (=> b!819063 m!760589))

(declare-fun m!760591 () Bool)

(assert (=> b!819063 m!760591))

(declare-fun m!760593 () Bool)

(assert (=> b!819063 m!760593))

(assert (=> b!819063 m!760591))

(declare-fun m!760595 () Bool)

(assert (=> b!819063 m!760595))

(declare-fun m!760597 () Bool)

(assert (=> b!819063 m!760597))

(declare-fun m!760599 () Bool)

(assert (=> b!819063 m!760599))

(declare-fun m!760601 () Bool)

(assert (=> b!819063 m!760601))

(declare-fun m!760603 () Bool)

(assert (=> b!819063 m!760603))

(declare-fun m!760605 () Bool)

(assert (=> b!819060 m!760605))

(declare-fun m!760607 () Bool)

(assert (=> mapNonEmpty!23419 m!760607))

(check-sat b_and!21667 (not b!819058) (not b!819065) tp_is_empty!14547 (not start!70510) (not b!819060) (not b!819063) (not mapNonEmpty!23419) (not b!819059) (not b_next!12837))
(check-sat b_and!21667 (not b_next!12837))
