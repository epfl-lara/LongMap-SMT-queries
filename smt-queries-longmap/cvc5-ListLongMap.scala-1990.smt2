; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34824 () Bool)

(assert start!34824)

(declare-fun b_free!7609 () Bool)

(declare-fun b_next!7609 () Bool)

(assert (=> start!34824 (= b_free!7609 (not b_next!7609))))

(declare-fun tp!26393 () Bool)

(declare-fun b_and!14831 () Bool)

(assert (=> start!34824 (= tp!26393 b_and!14831)))

(declare-fun mapIsEmpty!12801 () Bool)

(declare-fun mapRes!12801 () Bool)

(assert (=> mapIsEmpty!12801 mapRes!12801))

(declare-fun b!348608 () Bool)

(declare-fun res!193141 () Bool)

(declare-fun e!213576 () Bool)

(assert (=> b!348608 (=> (not res!193141) (not e!213576))))

(declare-datatypes ((array!18709 0))(
  ( (array!18710 (arr!8864 (Array (_ BitVec 32) (_ BitVec 64))) (size!9216 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18709)

(declare-datatypes ((List!5150 0))(
  ( (Nil!5147) (Cons!5146 (h!6002 (_ BitVec 64)) (t!10280 List!5150)) )
))
(declare-fun arrayNoDuplicates!0 (array!18709 (_ BitVec 32) List!5150) Bool)

(assert (=> b!348608 (= res!193141 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5147))))

(declare-fun mapNonEmpty!12801 () Bool)

(declare-fun tp!26394 () Bool)

(declare-fun e!213578 () Bool)

(assert (=> mapNonEmpty!12801 (= mapRes!12801 (and tp!26394 e!213578))))

(declare-datatypes ((V!11059 0))(
  ( (V!11060 (val!3825 Int)) )
))
(declare-datatypes ((ValueCell!3437 0))(
  ( (ValueCellFull!3437 (v!6008 V!11059)) (EmptyCell!3437) )
))
(declare-fun mapValue!12801 () ValueCell!3437)

(declare-fun mapRest!12801 () (Array (_ BitVec 32) ValueCell!3437))

(declare-datatypes ((array!18711 0))(
  ( (array!18712 (arr!8865 (Array (_ BitVec 32) ValueCell!3437)) (size!9217 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18711)

(declare-fun mapKey!12801 () (_ BitVec 32))

(assert (=> mapNonEmpty!12801 (= (arr!8865 _values!1525) (store mapRest!12801 mapKey!12801 mapValue!12801))))

(declare-fun b!348609 () Bool)

(declare-fun e!213574 () Bool)

(declare-fun tp_is_empty!7561 () Bool)

(assert (=> b!348609 (= e!213574 tp_is_empty!7561)))

(declare-fun b!348610 () Bool)

(declare-fun res!193140 () Bool)

(assert (=> b!348610 (=> (not res!193140) (not e!213576))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11059)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11059)

(declare-datatypes ((tuple2!5530 0))(
  ( (tuple2!5531 (_1!2776 (_ BitVec 64)) (_2!2776 V!11059)) )
))
(declare-datatypes ((List!5151 0))(
  ( (Nil!5148) (Cons!5147 (h!6003 tuple2!5530) (t!10281 List!5151)) )
))
(declare-datatypes ((ListLongMap!4443 0))(
  ( (ListLongMap!4444 (toList!2237 List!5151)) )
))
(declare-fun contains!2302 (ListLongMap!4443 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1758 (array!18709 array!18711 (_ BitVec 32) (_ BitVec 32) V!11059 V!11059 (_ BitVec 32) Int) ListLongMap!4443)

(assert (=> b!348610 (= res!193140 (not (contains!2302 (getCurrentListMap!1758 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348611 () Bool)

(declare-fun res!193137 () Bool)

(declare-fun e!213575 () Bool)

(assert (=> b!348611 (=> (not res!193137) (not e!213575))))

(declare-fun arrayContainsKey!0 (array!18709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348611 (= res!193137 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348612 () Bool)

(declare-fun res!193138 () Bool)

(assert (=> b!348612 (=> (not res!193138) (not e!213576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348612 (= res!193138 (validKeyInArray!0 k!1348))))

(declare-fun b!348613 () Bool)

(assert (=> b!348613 (= e!213575 false)))

(declare-fun lt!163908 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18709 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348613 (= lt!163908 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348614 () Bool)

(assert (=> b!348614 (= e!213576 e!213575)))

(declare-fun res!193139 () Bool)

(assert (=> b!348614 (=> (not res!193139) (not e!213575))))

(declare-datatypes ((SeekEntryResult!3418 0))(
  ( (MissingZero!3418 (index!15851 (_ BitVec 32))) (Found!3418 (index!15852 (_ BitVec 32))) (Intermediate!3418 (undefined!4230 Bool) (index!15853 (_ BitVec 32)) (x!34730 (_ BitVec 32))) (Undefined!3418) (MissingVacant!3418 (index!15854 (_ BitVec 32))) )
))
(declare-fun lt!163909 () SeekEntryResult!3418)

(assert (=> b!348614 (= res!193139 (and (not (is-Found!3418 lt!163909)) (is-MissingZero!3418 lt!163909)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18709 (_ BitVec 32)) SeekEntryResult!3418)

(assert (=> b!348614 (= lt!163909 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348615 () Bool)

(declare-fun e!213577 () Bool)

(assert (=> b!348615 (= e!213577 (and e!213574 mapRes!12801))))

(declare-fun condMapEmpty!12801 () Bool)

(declare-fun mapDefault!12801 () ValueCell!3437)

