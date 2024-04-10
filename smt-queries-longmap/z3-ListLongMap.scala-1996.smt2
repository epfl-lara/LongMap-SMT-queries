; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34906 () Bool)

(assert start!34906)

(declare-fun b_free!7647 () Bool)

(declare-fun b_next!7647 () Bool)

(assert (=> start!34906 (= b_free!7647 (not b_next!7647))))

(declare-fun tp!26513 () Bool)

(declare-fun b_and!14873 () Bool)

(assert (=> start!34906 (= tp!26513 b_and!14873)))

(declare-fun b!349524 () Bool)

(declare-fun res!193709 () Bool)

(declare-fun e!214109 () Bool)

(assert (=> b!349524 (=> (not res!193709) (not e!214109))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349524 (= res!193709 (validKeyInArray!0 k0!1348))))

(declare-fun b!349525 () Bool)

(declare-fun e!214106 () Bool)

(assert (=> b!349525 (= e!214109 e!214106)))

(declare-fun res!193708 () Bool)

(assert (=> b!349525 (=> (not res!193708) (not e!214106))))

(declare-datatypes ((SeekEntryResult!3428 0))(
  ( (MissingZero!3428 (index!15891 (_ BitVec 32))) (Found!3428 (index!15892 (_ BitVec 32))) (Intermediate!3428 (undefined!4240 Bool) (index!15893 (_ BitVec 32)) (x!34808 (_ BitVec 32))) (Undefined!3428) (MissingVacant!3428 (index!15894 (_ BitVec 32))) )
))
(declare-fun lt!164220 () SeekEntryResult!3428)

(get-info :version)

(assert (=> b!349525 (= res!193708 (and (not ((_ is Found!3428) lt!164220)) ((_ is MissingZero!3428) lt!164220)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18783 0))(
  ( (array!18784 (arr!8899 (Array (_ BitVec 32) (_ BitVec 64))) (size!9251 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18783)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18783 (_ BitVec 32)) SeekEntryResult!3428)

(assert (=> b!349525 (= lt!164220 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!193713 () Bool)

(assert (=> start!34906 (=> (not res!193713) (not e!214109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34906 (= res!193713 (validMask!0 mask!2385))))

(assert (=> start!34906 e!214109))

(assert (=> start!34906 true))

(declare-fun tp_is_empty!7599 () Bool)

(assert (=> start!34906 tp_is_empty!7599))

(assert (=> start!34906 tp!26513))

(declare-datatypes ((V!11109 0))(
  ( (V!11110 (val!3844 Int)) )
))
(declare-datatypes ((ValueCell!3456 0))(
  ( (ValueCellFull!3456 (v!6029 V!11109)) (EmptyCell!3456) )
))
(declare-datatypes ((array!18785 0))(
  ( (array!18786 (arr!8900 (Array (_ BitVec 32) ValueCell!3456)) (size!9252 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18785)

(declare-fun e!214111 () Bool)

(declare-fun array_inv!6578 (array!18785) Bool)

(assert (=> start!34906 (and (array_inv!6578 _values!1525) e!214111)))

(declare-fun array_inv!6579 (array!18783) Bool)

(assert (=> start!34906 (array_inv!6579 _keys!1895)))

(declare-fun mapIsEmpty!12864 () Bool)

(declare-fun mapRes!12864 () Bool)

(assert (=> mapIsEmpty!12864 mapRes!12864))

(declare-fun b!349526 () Bool)

(declare-fun res!193706 () Bool)

(assert (=> b!349526 (=> (not res!193706) (not e!214109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18783 (_ BitVec 32)) Bool)

(assert (=> b!349526 (= res!193706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349527 () Bool)

(declare-fun res!193711 () Bool)

(assert (=> b!349527 (=> (not res!193711) (not e!214109))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349527 (= res!193711 (and (= (size!9252 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9251 _keys!1895) (size!9252 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349528 () Bool)

(declare-fun res!193707 () Bool)

(assert (=> b!349528 (=> (not res!193707) (not e!214106))))

(declare-fun arrayContainsKey!0 (array!18783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349528 (= res!193707 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349529 () Bool)

(declare-fun e!214107 () Bool)

(assert (=> b!349529 (= e!214107 tp_is_empty!7599)))

(declare-fun b!349530 () Bool)

(declare-fun res!193710 () Bool)

(assert (=> b!349530 (=> (not res!193710) (not e!214109))))

(declare-datatypes ((List!5172 0))(
  ( (Nil!5169) (Cons!5168 (h!6024 (_ BitVec 64)) (t!10306 List!5172)) )
))
(declare-fun arrayNoDuplicates!0 (array!18783 (_ BitVec 32) List!5172) Bool)

(assert (=> b!349530 (= res!193710 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5169))))

(declare-fun b!349531 () Bool)

(assert (=> b!349531 (= e!214106 (not true))))

(assert (=> b!349531 false))

(declare-fun zeroValue!1467 () V!11109)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11109)

(declare-datatypes ((Unit!10815 0))(
  ( (Unit!10816) )
))
(declare-fun lt!164221 () Unit!10815)

(declare-fun lemmaArrayContainsKeyThenInListMap!316 (array!18783 array!18785 (_ BitVec 32) (_ BitVec 32) V!11109 V!11109 (_ BitVec 64) (_ BitVec 32) Int) Unit!10815)

(declare-fun arrayScanForKey!0 (array!18783 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349531 (= lt!164221 (lemmaArrayContainsKeyThenInListMap!316 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!349532 () Bool)

(declare-fun res!193712 () Bool)

(assert (=> b!349532 (=> (not res!193712) (not e!214109))))

(declare-datatypes ((tuple2!5550 0))(
  ( (tuple2!5551 (_1!2786 (_ BitVec 64)) (_2!2786 V!11109)) )
))
(declare-datatypes ((List!5173 0))(
  ( (Nil!5170) (Cons!5169 (h!6025 tuple2!5550) (t!10307 List!5173)) )
))
(declare-datatypes ((ListLongMap!4463 0))(
  ( (ListLongMap!4464 (toList!2247 List!5173)) )
))
(declare-fun contains!2314 (ListLongMap!4463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1768 (array!18783 array!18785 (_ BitVec 32) (_ BitVec 32) V!11109 V!11109 (_ BitVec 32) Int) ListLongMap!4463)

(assert (=> b!349532 (= res!193712 (not (contains!2314 (getCurrentListMap!1768 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349533 () Bool)

(declare-fun e!214108 () Bool)

(assert (=> b!349533 (= e!214111 (and e!214108 mapRes!12864))))

(declare-fun condMapEmpty!12864 () Bool)

(declare-fun mapDefault!12864 () ValueCell!3456)

(assert (=> b!349533 (= condMapEmpty!12864 (= (arr!8900 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3456)) mapDefault!12864)))))

(declare-fun b!349534 () Bool)

(assert (=> b!349534 (= e!214108 tp_is_empty!7599)))

(declare-fun mapNonEmpty!12864 () Bool)

(declare-fun tp!26514 () Bool)

(assert (=> mapNonEmpty!12864 (= mapRes!12864 (and tp!26514 e!214107))))

(declare-fun mapValue!12864 () ValueCell!3456)

(declare-fun mapKey!12864 () (_ BitVec 32))

(declare-fun mapRest!12864 () (Array (_ BitVec 32) ValueCell!3456))

(assert (=> mapNonEmpty!12864 (= (arr!8900 _values!1525) (store mapRest!12864 mapKey!12864 mapValue!12864))))

(assert (= (and start!34906 res!193713) b!349527))

(assert (= (and b!349527 res!193711) b!349526))

(assert (= (and b!349526 res!193706) b!349530))

(assert (= (and b!349530 res!193710) b!349524))

(assert (= (and b!349524 res!193709) b!349532))

(assert (= (and b!349532 res!193712) b!349525))

(assert (= (and b!349525 res!193708) b!349528))

(assert (= (and b!349528 res!193707) b!349531))

(assert (= (and b!349533 condMapEmpty!12864) mapIsEmpty!12864))

(assert (= (and b!349533 (not condMapEmpty!12864)) mapNonEmpty!12864))

(assert (= (and mapNonEmpty!12864 ((_ is ValueCellFull!3456) mapValue!12864)) b!349529))

(assert (= (and b!349533 ((_ is ValueCellFull!3456) mapDefault!12864)) b!349534))

(assert (= start!34906 b!349533))

(declare-fun m!350001 () Bool)

(assert (=> mapNonEmpty!12864 m!350001))

(declare-fun m!350003 () Bool)

(assert (=> b!349530 m!350003))

(declare-fun m!350005 () Bool)

(assert (=> b!349528 m!350005))

(declare-fun m!350007 () Bool)

(assert (=> b!349531 m!350007))

(assert (=> b!349531 m!350007))

(declare-fun m!350009 () Bool)

(assert (=> b!349531 m!350009))

(declare-fun m!350011 () Bool)

(assert (=> start!34906 m!350011))

(declare-fun m!350013 () Bool)

(assert (=> start!34906 m!350013))

(declare-fun m!350015 () Bool)

(assert (=> start!34906 m!350015))

(declare-fun m!350017 () Bool)

(assert (=> b!349524 m!350017))

(declare-fun m!350019 () Bool)

(assert (=> b!349532 m!350019))

(assert (=> b!349532 m!350019))

(declare-fun m!350021 () Bool)

(assert (=> b!349532 m!350021))

(declare-fun m!350023 () Bool)

(assert (=> b!349525 m!350023))

(declare-fun m!350025 () Bool)

(assert (=> b!349526 m!350025))

(check-sat (not mapNonEmpty!12864) (not b!349524) (not b!349531) (not b!349526) (not b!349528) b_and!14873 (not b!349530) (not b!349532) (not b_next!7647) (not start!34906) (not b!349525) tp_is_empty!7599)
(check-sat b_and!14873 (not b_next!7647))
