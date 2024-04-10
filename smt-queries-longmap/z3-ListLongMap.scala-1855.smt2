; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33512 () Bool)

(assert start!33512)

(declare-fun b_free!6801 () Bool)

(declare-fun b_next!6801 () Bool)

(assert (=> start!33512 (= b_free!6801 (not b_next!6801))))

(declare-fun tp!23898 () Bool)

(declare-fun b_and!13975 () Bool)

(assert (=> start!33512 (= tp!23898 b_and!13975)))

(declare-fun mapNonEmpty!11517 () Bool)

(declare-fun mapRes!11517 () Bool)

(declare-fun tp!23897 () Bool)

(declare-fun e!204213 () Bool)

(assert (=> mapNonEmpty!11517 (= mapRes!11517 (and tp!23897 e!204213))))

(declare-datatypes ((V!9981 0))(
  ( (V!9982 (val!3421 Int)) )
))
(declare-datatypes ((ValueCell!3033 0))(
  ( (ValueCellFull!3033 (v!5580 V!9981)) (EmptyCell!3033) )
))
(declare-fun mapValue!11517 () ValueCell!3033)

(declare-datatypes ((array!17103 0))(
  ( (array!17104 (arr!8085 (Array (_ BitVec 32) ValueCell!3033)) (size!8437 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17103)

(declare-fun mapKey!11517 () (_ BitVec 32))

(declare-fun mapRest!11517 () (Array (_ BitVec 32) ValueCell!3033))

(assert (=> mapNonEmpty!11517 (= (arr!8085 _values!1525) (store mapRest!11517 mapKey!11517 mapValue!11517))))

(declare-fun b!332550 () Bool)

(declare-fun tp_is_empty!6753 () Bool)

(assert (=> b!332550 (= e!204213 tp_is_empty!6753)))

(declare-fun res!183203 () Bool)

(declare-fun e!204212 () Bool)

(assert (=> start!33512 (=> (not res!183203) (not e!204212))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33512 (= res!183203 (validMask!0 mask!2385))))

(assert (=> start!33512 e!204212))

(assert (=> start!33512 true))

(assert (=> start!33512 tp_is_empty!6753))

(assert (=> start!33512 tp!23898))

(declare-fun e!204210 () Bool)

(declare-fun array_inv!6024 (array!17103) Bool)

(assert (=> start!33512 (and (array_inv!6024 _values!1525) e!204210)))

(declare-datatypes ((array!17105 0))(
  ( (array!17106 (arr!8086 (Array (_ BitVec 32) (_ BitVec 64))) (size!8438 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17105)

(declare-fun array_inv!6025 (array!17105) Bool)

(assert (=> start!33512 (array_inv!6025 _keys!1895)))

(declare-fun b!332551 () Bool)

(assert (=> b!332551 (= e!204212 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!9981)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!159025 () Bool)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9981)

(declare-datatypes ((tuple2!4984 0))(
  ( (tuple2!4985 (_1!2503 (_ BitVec 64)) (_2!2503 V!9981)) )
))
(declare-datatypes ((List!4597 0))(
  ( (Nil!4594) (Cons!4593 (h!5449 tuple2!4984) (t!9679 List!4597)) )
))
(declare-datatypes ((ListLongMap!3897 0))(
  ( (ListLongMap!3898 (toList!1964 List!4597)) )
))
(declare-fun contains!2005 (ListLongMap!3897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1492 (array!17105 array!17103 (_ BitVec 32) (_ BitVec 32) V!9981 V!9981 (_ BitVec 32) Int) ListLongMap!3897)

(assert (=> b!332551 (= lt!159025 (contains!2005 (getCurrentListMap!1492 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332552 () Bool)

(declare-fun e!204209 () Bool)

(assert (=> b!332552 (= e!204210 (and e!204209 mapRes!11517))))

(declare-fun condMapEmpty!11517 () Bool)

(declare-fun mapDefault!11517 () ValueCell!3033)

(assert (=> b!332552 (= condMapEmpty!11517 (= (arr!8085 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3033)) mapDefault!11517)))))

(declare-fun b!332553 () Bool)

(declare-fun res!183200 () Bool)

(assert (=> b!332553 (=> (not res!183200) (not e!204212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332553 (= res!183200 (validKeyInArray!0 k0!1348))))

(declare-fun b!332554 () Bool)

(declare-fun res!183199 () Bool)

(assert (=> b!332554 (=> (not res!183199) (not e!204212))))

(declare-datatypes ((List!4598 0))(
  ( (Nil!4595) (Cons!4594 (h!5450 (_ BitVec 64)) (t!9680 List!4598)) )
))
(declare-fun arrayNoDuplicates!0 (array!17105 (_ BitVec 32) List!4598) Bool)

(assert (=> b!332554 (= res!183199 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4595))))

(declare-fun b!332555 () Bool)

(assert (=> b!332555 (= e!204209 tp_is_empty!6753)))

(declare-fun b!332556 () Bool)

(declare-fun res!183201 () Bool)

(assert (=> b!332556 (=> (not res!183201) (not e!204212))))

(assert (=> b!332556 (= res!183201 (and (= (size!8437 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8438 _keys!1895) (size!8437 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332557 () Bool)

(declare-fun res!183202 () Bool)

(assert (=> b!332557 (=> (not res!183202) (not e!204212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17105 (_ BitVec 32)) Bool)

(assert (=> b!332557 (= res!183202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11517 () Bool)

(assert (=> mapIsEmpty!11517 mapRes!11517))

(assert (= (and start!33512 res!183203) b!332556))

(assert (= (and b!332556 res!183201) b!332557))

(assert (= (and b!332557 res!183202) b!332554))

(assert (= (and b!332554 res!183199) b!332553))

(assert (= (and b!332553 res!183200) b!332551))

(assert (= (and b!332552 condMapEmpty!11517) mapIsEmpty!11517))

(assert (= (and b!332552 (not condMapEmpty!11517)) mapNonEmpty!11517))

(get-info :version)

(assert (= (and mapNonEmpty!11517 ((_ is ValueCellFull!3033) mapValue!11517)) b!332550))

(assert (= (and b!332552 ((_ is ValueCellFull!3033) mapDefault!11517)) b!332555))

(assert (= start!33512 b!332552))

(declare-fun m!337023 () Bool)

(assert (=> b!332553 m!337023))

(declare-fun m!337025 () Bool)

(assert (=> mapNonEmpty!11517 m!337025))

(declare-fun m!337027 () Bool)

(assert (=> b!332554 m!337027))

(declare-fun m!337029 () Bool)

(assert (=> start!33512 m!337029))

(declare-fun m!337031 () Bool)

(assert (=> start!33512 m!337031))

(declare-fun m!337033 () Bool)

(assert (=> start!33512 m!337033))

(declare-fun m!337035 () Bool)

(assert (=> b!332551 m!337035))

(assert (=> b!332551 m!337035))

(declare-fun m!337037 () Bool)

(assert (=> b!332551 m!337037))

(declare-fun m!337039 () Bool)

(assert (=> b!332557 m!337039))

(check-sat (not start!33512) (not b!332551) (not b!332557) b_and!13975 (not b_next!6801) (not b!332554) (not b!332553) tp_is_empty!6753 (not mapNonEmpty!11517))
(check-sat b_and!13975 (not b_next!6801))
