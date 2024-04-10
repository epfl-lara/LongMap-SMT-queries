; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34802 () Bool)

(assert start!34802)

(declare-fun b_free!7587 () Bool)

(declare-fun b_next!7587 () Bool)

(assert (=> start!34802 (= b_free!7587 (not b_next!7587))))

(declare-fun tp!26328 () Bool)

(declare-fun b_and!14809 () Bool)

(assert (=> start!34802 (= tp!26328 b_and!14809)))

(declare-fun b!348245 () Bool)

(declare-fun res!192873 () Bool)

(declare-fun e!213380 () Bool)

(assert (=> b!348245 (=> (not res!192873) (not e!213380))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11029 0))(
  ( (V!11030 (val!3814 Int)) )
))
(declare-datatypes ((ValueCell!3426 0))(
  ( (ValueCellFull!3426 (v!5997 V!11029)) (EmptyCell!3426) )
))
(declare-datatypes ((array!18665 0))(
  ( (array!18666 (arr!8842 (Array (_ BitVec 32) ValueCell!3426)) (size!9194 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18665)

(declare-datatypes ((array!18667 0))(
  ( (array!18668 (arr!8843 (Array (_ BitVec 32) (_ BitVec 64))) (size!9195 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18667)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348245 (= res!192873 (and (= (size!9194 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9195 _keys!1895) (size!9194 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348246 () Bool)

(declare-fun e!213378 () Bool)

(assert (=> b!348246 (= e!213378 false)))

(declare-fun lt!163843 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18667 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348246 (= lt!163843 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348247 () Bool)

(declare-fun res!192876 () Bool)

(assert (=> b!348247 (=> (not res!192876) (not e!213380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18667 (_ BitVec 32)) Bool)

(assert (=> b!348247 (= res!192876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348248 () Bool)

(declare-fun res!192875 () Bool)

(assert (=> b!348248 (=> (not res!192875) (not e!213378))))

(declare-fun arrayContainsKey!0 (array!18667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348248 (= res!192875 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348249 () Bool)

(declare-fun res!192878 () Bool)

(assert (=> b!348249 (=> (not res!192878) (not e!213380))))

(declare-fun zeroValue!1467 () V!11029)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11029)

(declare-datatypes ((tuple2!5514 0))(
  ( (tuple2!5515 (_1!2768 (_ BitVec 64)) (_2!2768 V!11029)) )
))
(declare-datatypes ((List!5136 0))(
  ( (Nil!5133) (Cons!5132 (h!5988 tuple2!5514) (t!10266 List!5136)) )
))
(declare-datatypes ((ListLongMap!4427 0))(
  ( (ListLongMap!4428 (toList!2229 List!5136)) )
))
(declare-fun contains!2294 (ListLongMap!4427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1750 (array!18667 array!18665 (_ BitVec 32) (_ BitVec 32) V!11029 V!11029 (_ BitVec 32) Int) ListLongMap!4427)

(assert (=> b!348249 (= res!192878 (not (contains!2294 (getCurrentListMap!1750 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!348250 () Bool)

(assert (=> b!348250 (= e!213380 e!213378)))

(declare-fun res!192877 () Bool)

(assert (=> b!348250 (=> (not res!192877) (not e!213378))))

(declare-datatypes ((SeekEntryResult!3411 0))(
  ( (MissingZero!3411 (index!15823 (_ BitVec 32))) (Found!3411 (index!15824 (_ BitVec 32))) (Intermediate!3411 (undefined!4223 Bool) (index!15825 (_ BitVec 32)) (x!34691 (_ BitVec 32))) (Undefined!3411) (MissingVacant!3411 (index!15826 (_ BitVec 32))) )
))
(declare-fun lt!163842 () SeekEntryResult!3411)

(get-info :version)

(assert (=> b!348250 (= res!192877 (and (not ((_ is Found!3411) lt!163842)) ((_ is MissingZero!3411) lt!163842)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18667 (_ BitVec 32)) SeekEntryResult!3411)

(assert (=> b!348250 (= lt!163842 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348251 () Bool)

(declare-fun res!192879 () Bool)

(assert (=> b!348251 (=> (not res!192879) (not e!213380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348251 (= res!192879 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12768 () Bool)

(declare-fun mapRes!12768 () Bool)

(assert (=> mapIsEmpty!12768 mapRes!12768))

(declare-fun res!192874 () Bool)

(assert (=> start!34802 (=> (not res!192874) (not e!213380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34802 (= res!192874 (validMask!0 mask!2385))))

(assert (=> start!34802 e!213380))

(assert (=> start!34802 true))

(declare-fun tp_is_empty!7539 () Bool)

(assert (=> start!34802 tp_is_empty!7539))

(assert (=> start!34802 tp!26328))

(declare-fun e!213377 () Bool)

(declare-fun array_inv!6548 (array!18665) Bool)

(assert (=> start!34802 (and (array_inv!6548 _values!1525) e!213377)))

(declare-fun array_inv!6549 (array!18667) Bool)

(assert (=> start!34802 (array_inv!6549 _keys!1895)))

(declare-fun b!348252 () Bool)

(declare-fun res!192880 () Bool)

(assert (=> b!348252 (=> (not res!192880) (not e!213380))))

(declare-datatypes ((List!5137 0))(
  ( (Nil!5134) (Cons!5133 (h!5989 (_ BitVec 64)) (t!10267 List!5137)) )
))
(declare-fun arrayNoDuplicates!0 (array!18667 (_ BitVec 32) List!5137) Bool)

(assert (=> b!348252 (= res!192880 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5134))))

(declare-fun b!348253 () Bool)

(declare-fun e!213379 () Bool)

(assert (=> b!348253 (= e!213377 (and e!213379 mapRes!12768))))

(declare-fun condMapEmpty!12768 () Bool)

(declare-fun mapDefault!12768 () ValueCell!3426)

(assert (=> b!348253 (= condMapEmpty!12768 (= (arr!8842 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3426)) mapDefault!12768)))))

(declare-fun b!348254 () Bool)

(assert (=> b!348254 (= e!213379 tp_is_empty!7539)))

(declare-fun b!348255 () Bool)

(declare-fun e!213375 () Bool)

(assert (=> b!348255 (= e!213375 tp_is_empty!7539)))

(declare-fun mapNonEmpty!12768 () Bool)

(declare-fun tp!26327 () Bool)

(assert (=> mapNonEmpty!12768 (= mapRes!12768 (and tp!26327 e!213375))))

(declare-fun mapKey!12768 () (_ BitVec 32))

(declare-fun mapRest!12768 () (Array (_ BitVec 32) ValueCell!3426))

(declare-fun mapValue!12768 () ValueCell!3426)

(assert (=> mapNonEmpty!12768 (= (arr!8842 _values!1525) (store mapRest!12768 mapKey!12768 mapValue!12768))))

(assert (= (and start!34802 res!192874) b!348245))

(assert (= (and b!348245 res!192873) b!348247))

(assert (= (and b!348247 res!192876) b!348252))

(assert (= (and b!348252 res!192880) b!348251))

(assert (= (and b!348251 res!192879) b!348249))

(assert (= (and b!348249 res!192878) b!348250))

(assert (= (and b!348250 res!192877) b!348248))

(assert (= (and b!348248 res!192875) b!348246))

(assert (= (and b!348253 condMapEmpty!12768) mapIsEmpty!12768))

(assert (= (and b!348253 (not condMapEmpty!12768)) mapNonEmpty!12768))

(assert (= (and mapNonEmpty!12768 ((_ is ValueCellFull!3426) mapValue!12768)) b!348255))

(assert (= (and b!348253 ((_ is ValueCellFull!3426) mapDefault!12768)) b!348254))

(assert (= start!34802 b!348253))

(declare-fun m!349069 () Bool)

(assert (=> mapNonEmpty!12768 m!349069))

(declare-fun m!349071 () Bool)

(assert (=> start!34802 m!349071))

(declare-fun m!349073 () Bool)

(assert (=> start!34802 m!349073))

(declare-fun m!349075 () Bool)

(assert (=> start!34802 m!349075))

(declare-fun m!349077 () Bool)

(assert (=> b!348251 m!349077))

(declare-fun m!349079 () Bool)

(assert (=> b!348247 m!349079))

(declare-fun m!349081 () Bool)

(assert (=> b!348249 m!349081))

(assert (=> b!348249 m!349081))

(declare-fun m!349083 () Bool)

(assert (=> b!348249 m!349083))

(declare-fun m!349085 () Bool)

(assert (=> b!348252 m!349085))

(declare-fun m!349087 () Bool)

(assert (=> b!348248 m!349087))

(declare-fun m!349089 () Bool)

(assert (=> b!348246 m!349089))

(declare-fun m!349091 () Bool)

(assert (=> b!348250 m!349091))

(check-sat (not b!348251) (not b!348250) tp_is_empty!7539 (not b!348249) b_and!14809 (not b!348252) (not b!348248) (not start!34802) (not mapNonEmpty!12768) (not b_next!7587) (not b!348247) (not b!348246))
(check-sat b_and!14809 (not b_next!7587))
