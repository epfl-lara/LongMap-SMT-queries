; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70476 () Bool)

(assert start!70476)

(declare-fun b_free!12823 () Bool)

(declare-fun b_next!12823 () Bool)

(assert (=> start!70476 (= b_free!12823 (not b_next!12823))))

(declare-fun tp!45201 () Bool)

(declare-fun b_and!21627 () Bool)

(assert (=> start!70476 (= tp!45201 b_and!21627)))

(declare-fun res!558708 () Bool)

(declare-fun e!454489 () Bool)

(assert (=> start!70476 (=> (not res!558708) (not e!454489))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70476 (= res!558708 (validMask!0 mask!1312))))

(assert (=> start!70476 e!454489))

(declare-fun tp_is_empty!14533 () Bool)

(assert (=> start!70476 tp_is_empty!14533))

(declare-datatypes ((array!45241 0))(
  ( (array!45242 (arr!21675 (Array (_ BitVec 32) (_ BitVec 64))) (size!22096 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45241)

(declare-fun array_inv!17395 (array!45241) Bool)

(assert (=> start!70476 (array_inv!17395 _keys!976)))

(assert (=> start!70476 true))

(declare-datatypes ((V!24379 0))(
  ( (V!24380 (val!7314 Int)) )
))
(declare-datatypes ((ValueCell!6851 0))(
  ( (ValueCellFull!6851 (v!9737 V!24379)) (EmptyCell!6851) )
))
(declare-datatypes ((array!45243 0))(
  ( (array!45244 (arr!21676 (Array (_ BitVec 32) ValueCell!6851)) (size!22097 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45243)

(declare-fun e!454488 () Bool)

(declare-fun array_inv!17396 (array!45243) Bool)

(assert (=> start!70476 (and (array_inv!17396 _values!788) e!454488)))

(assert (=> start!70476 tp!45201))

(declare-fun b!818622 () Bool)

(declare-fun res!558706 () Bool)

(assert (=> b!818622 (=> (not res!558706) (not e!454489))))

(declare-datatypes ((List!15461 0))(
  ( (Nil!15458) (Cons!15457 (h!16586 (_ BitVec 64)) (t!21781 List!15461)) )
))
(declare-fun arrayNoDuplicates!0 (array!45241 (_ BitVec 32) List!15461) Bool)

(assert (=> b!818622 (= res!558706 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15458))))

(declare-fun mapIsEmpty!23398 () Bool)

(declare-fun mapRes!23398 () Bool)

(assert (=> mapIsEmpty!23398 mapRes!23398))

(declare-fun b!818623 () Bool)

(declare-fun e!454490 () Bool)

(assert (=> b!818623 (= e!454488 (and e!454490 mapRes!23398))))

(declare-fun condMapEmpty!23398 () Bool)

(declare-fun mapDefault!23398 () ValueCell!6851)

(assert (=> b!818623 (= condMapEmpty!23398 (= (arr!21676 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6851)) mapDefault!23398)))))

(declare-fun b!818624 () Bool)

(declare-fun e!454484 () Bool)

(assert (=> b!818624 (= e!454484 tp_is_empty!14533)))

(declare-datatypes ((tuple2!9640 0))(
  ( (tuple2!9641 (_1!4831 (_ BitVec 64)) (_2!4831 V!24379)) )
))
(declare-datatypes ((List!15462 0))(
  ( (Nil!15459) (Cons!15458 (h!16587 tuple2!9640) (t!21782 List!15462)) )
))
(declare-datatypes ((ListLongMap!8453 0))(
  ( (ListLongMap!8454 (toList!4242 List!15462)) )
))
(declare-fun lt!366896 () ListLongMap!8453)

(declare-fun e!454485 () Bool)

(declare-fun b!818625 () Bool)

(declare-fun zeroValueAfter!34 () V!24379)

(declare-fun lt!366894 () ListLongMap!8453)

(declare-fun +!1864 (ListLongMap!8453 tuple2!9640) ListLongMap!8453)

(assert (=> b!818625 (= e!454485 (= lt!366896 (+!1864 lt!366894 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818626 () Bool)

(declare-fun res!558710 () Bool)

(assert (=> b!818626 (=> (not res!558710) (not e!454489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45241 (_ BitVec 32)) Bool)

(assert (=> b!818626 (= res!558710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23398 () Bool)

(declare-fun tp!45202 () Bool)

(assert (=> mapNonEmpty!23398 (= mapRes!23398 (and tp!45202 e!454484))))

(declare-fun mapValue!23398 () ValueCell!6851)

(declare-fun mapRest!23398 () (Array (_ BitVec 32) ValueCell!6851))

(declare-fun mapKey!23398 () (_ BitVec 32))

(assert (=> mapNonEmpty!23398 (= (arr!21676 _values!788) (store mapRest!23398 mapKey!23398 mapValue!23398))))

(declare-fun b!818627 () Bool)

(declare-fun e!454486 () Bool)

(assert (=> b!818627 (= e!454486 true)))

(declare-fun lt!366899 () ListLongMap!8453)

(declare-fun lt!366892 () tuple2!9640)

(declare-fun lt!366890 () tuple2!9640)

(assert (=> b!818627 (= lt!366899 (+!1864 (+!1864 lt!366894 lt!366892) lt!366890))))

(declare-fun lt!366891 () ListLongMap!8453)

(declare-fun lt!366897 () ListLongMap!8453)

(assert (=> b!818627 (= (+!1864 lt!366891 lt!366890) (+!1864 lt!366897 lt!366890))))

(declare-fun zeroValueBefore!34 () V!24379)

(declare-datatypes ((Unit!27909 0))(
  ( (Unit!27910) )
))
(declare-fun lt!366895 () Unit!27909)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!179 (ListLongMap!8453 (_ BitVec 64) V!24379 V!24379) Unit!27909)

(assert (=> b!818627 (= lt!366895 (addSameAsAddTwiceSameKeyDiffValues!179 lt!366891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818627 (= lt!366890 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818627 e!454485))

(declare-fun res!558709 () Bool)

(assert (=> b!818627 (=> (not res!558709) (not e!454485))))

(declare-fun lt!366898 () ListLongMap!8453)

(assert (=> b!818627 (= res!558709 (= lt!366898 lt!366897))))

(assert (=> b!818627 (= lt!366897 (+!1864 lt!366891 lt!366892))))

(assert (=> b!818627 (= lt!366892 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24379)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2392 (array!45241 array!45243 (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 (_ BitVec 32) Int) ListLongMap!8453)

(assert (=> b!818627 (= lt!366896 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818627 (= lt!366898 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818628 () Bool)

(declare-fun res!558705 () Bool)

(assert (=> b!818628 (=> (not res!558705) (not e!454489))))

(assert (=> b!818628 (= res!558705 (and (= (size!22097 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22096 _keys!976) (size!22097 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818629 () Bool)

(assert (=> b!818629 (= e!454490 tp_is_empty!14533)))

(declare-fun b!818630 () Bool)

(assert (=> b!818630 (= e!454489 (not e!454486))))

(declare-fun res!558707 () Bool)

(assert (=> b!818630 (=> res!558707 e!454486)))

(assert (=> b!818630 (= res!558707 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818630 (= lt!366891 lt!366894)))

(declare-fun lt!366893 () Unit!27909)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!392 (array!45241 array!45243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 V!24379 V!24379 (_ BitVec 32) Int) Unit!27909)

(assert (=> b!818630 (= lt!366893 (lemmaNoChangeToArrayThenSameMapNoExtras!392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2299 (array!45241 array!45243 (_ BitVec 32) (_ BitVec 32) V!24379 V!24379 (_ BitVec 32) Int) ListLongMap!8453)

(assert (=> b!818630 (= lt!366894 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818630 (= lt!366891 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70476 res!558708) b!818628))

(assert (= (and b!818628 res!558705) b!818626))

(assert (= (and b!818626 res!558710) b!818622))

(assert (= (and b!818622 res!558706) b!818630))

(assert (= (and b!818630 (not res!558707)) b!818627))

(assert (= (and b!818627 res!558709) b!818625))

(assert (= (and b!818623 condMapEmpty!23398) mapIsEmpty!23398))

(assert (= (and b!818623 (not condMapEmpty!23398)) mapNonEmpty!23398))

(get-info :version)

(assert (= (and mapNonEmpty!23398 ((_ is ValueCellFull!6851) mapValue!23398)) b!818624))

(assert (= (and b!818623 ((_ is ValueCellFull!6851) mapDefault!23398)) b!818629))

(assert (= start!70476 b!818623))

(declare-fun m!759569 () Bool)

(assert (=> b!818626 m!759569))

(declare-fun m!759571 () Bool)

(assert (=> start!70476 m!759571))

(declare-fun m!759573 () Bool)

(assert (=> start!70476 m!759573))

(declare-fun m!759575 () Bool)

(assert (=> start!70476 m!759575))

(declare-fun m!759577 () Bool)

(assert (=> b!818627 m!759577))

(declare-fun m!759579 () Bool)

(assert (=> b!818627 m!759579))

(declare-fun m!759581 () Bool)

(assert (=> b!818627 m!759581))

(declare-fun m!759583 () Bool)

(assert (=> b!818627 m!759583))

(declare-fun m!759585 () Bool)

(assert (=> b!818627 m!759585))

(declare-fun m!759587 () Bool)

(assert (=> b!818627 m!759587))

(assert (=> b!818627 m!759585))

(declare-fun m!759589 () Bool)

(assert (=> b!818627 m!759589))

(declare-fun m!759591 () Bool)

(assert (=> b!818627 m!759591))

(declare-fun m!759593 () Bool)

(assert (=> mapNonEmpty!23398 m!759593))

(declare-fun m!759595 () Bool)

(assert (=> b!818625 m!759595))

(declare-fun m!759597 () Bool)

(assert (=> b!818622 m!759597))

(declare-fun m!759599 () Bool)

(assert (=> b!818630 m!759599))

(declare-fun m!759601 () Bool)

(assert (=> b!818630 m!759601))

(declare-fun m!759603 () Bool)

(assert (=> b!818630 m!759603))

(check-sat (not b!818625) (not start!70476) (not b_next!12823) (not b!818630) (not b!818626) (not mapNonEmpty!23398) b_and!21627 (not b!818622) (not b!818627) tp_is_empty!14533)
(check-sat b_and!21627 (not b_next!12823))
