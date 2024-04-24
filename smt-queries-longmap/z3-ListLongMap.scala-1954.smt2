; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34456 () Bool)

(assert start!34456)

(declare-fun b_free!7393 () Bool)

(declare-fun b_next!7393 () Bool)

(assert (=> start!34456 (= b_free!7393 (not b_next!7393))))

(declare-fun tp!25724 () Bool)

(declare-fun b_and!14615 () Bool)

(assert (=> start!34456 (= tp!25724 b_and!14615)))

(declare-fun b!344300 () Bool)

(declare-fun e!211069 () Bool)

(declare-fun tp_is_empty!7345 () Bool)

(assert (=> b!344300 (= e!211069 tp_is_empty!7345)))

(declare-fun mapNonEmpty!12456 () Bool)

(declare-fun mapRes!12456 () Bool)

(declare-fun tp!25725 () Bool)

(assert (=> mapNonEmpty!12456 (= mapRes!12456 (and tp!25725 e!211069))))

(declare-datatypes ((V!10771 0))(
  ( (V!10772 (val!3717 Int)) )
))
(declare-datatypes ((ValueCell!3329 0))(
  ( (ValueCellFull!3329 (v!5894 V!10771)) (EmptyCell!3329) )
))
(declare-fun mapValue!12456 () ValueCell!3329)

(declare-fun mapKey!12456 () (_ BitVec 32))

(declare-datatypes ((array!18274 0))(
  ( (array!18275 (arr!8653 (Array (_ BitVec 32) ValueCell!3329)) (size!9005 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18274)

(declare-fun mapRest!12456 () (Array (_ BitVec 32) ValueCell!3329))

(assert (=> mapNonEmpty!12456 (= (arr!8653 _values!1525) (store mapRest!12456 mapKey!12456 mapValue!12456))))

(declare-fun b!344301 () Bool)

(declare-fun res!190430 () Bool)

(declare-fun e!211070 () Bool)

(assert (=> b!344301 (=> (not res!190430) (not e!211070))))

(declare-datatypes ((array!18276 0))(
  ( (array!18277 (arr!8654 (Array (_ BitVec 32) (_ BitVec 64))) (size!9006 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18276)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18276 (_ BitVec 32)) Bool)

(assert (=> b!344301 (= res!190430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344302 () Bool)

(declare-fun e!211068 () Bool)

(declare-fun e!211067 () Bool)

(assert (=> b!344302 (= e!211068 (and e!211067 mapRes!12456))))

(declare-fun condMapEmpty!12456 () Bool)

(declare-fun mapDefault!12456 () ValueCell!3329)

(assert (=> b!344302 (= condMapEmpty!12456 (= (arr!8653 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3329)) mapDefault!12456)))))

(declare-fun b!344303 () Bool)

(declare-fun res!190427 () Bool)

(assert (=> b!344303 (=> (not res!190427) (not e!211070))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344303 (= res!190427 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12456 () Bool)

(assert (=> mapIsEmpty!12456 mapRes!12456))

(declare-fun res!190425 () Bool)

(assert (=> start!34456 (=> (not res!190425) (not e!211070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34456 (= res!190425 (validMask!0 mask!2385))))

(assert (=> start!34456 e!211070))

(assert (=> start!34456 true))

(assert (=> start!34456 tp_is_empty!7345))

(assert (=> start!34456 tp!25724))

(declare-fun array_inv!6392 (array!18274) Bool)

(assert (=> start!34456 (and (array_inv!6392 _values!1525) e!211068)))

(declare-fun array_inv!6393 (array!18276) Bool)

(assert (=> start!34456 (array_inv!6393 _keys!1895)))

(declare-fun b!344304 () Bool)

(declare-fun res!190428 () Bool)

(assert (=> b!344304 (=> (not res!190428) (not e!211070))))

(declare-fun zeroValue!1467 () V!10771)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10771)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5300 0))(
  ( (tuple2!5301 (_1!2661 (_ BitVec 64)) (_2!2661 V!10771)) )
))
(declare-datatypes ((List!4902 0))(
  ( (Nil!4899) (Cons!4898 (h!5754 tuple2!5300) (t!10010 List!4902)) )
))
(declare-datatypes ((ListLongMap!4215 0))(
  ( (ListLongMap!4216 (toList!2123 List!4902)) )
))
(declare-fun contains!2200 (ListLongMap!4215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1652 (array!18276 array!18274 (_ BitVec 32) (_ BitVec 32) V!10771 V!10771 (_ BitVec 32) Int) ListLongMap!4215)

(assert (=> b!344304 (= res!190428 (not (contains!2200 (getCurrentListMap!1652 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344305 () Bool)

(declare-fun res!190426 () Bool)

(assert (=> b!344305 (=> (not res!190426) (not e!211070))))

(declare-datatypes ((List!4903 0))(
  ( (Nil!4900) (Cons!4899 (h!5755 (_ BitVec 64)) (t!10011 List!4903)) )
))
(declare-fun arrayNoDuplicates!0 (array!18276 (_ BitVec 32) List!4903) Bool)

(assert (=> b!344305 (= res!190426 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4900))))

(declare-fun b!344306 () Bool)

(assert (=> b!344306 (= e!211070 false)))

(declare-datatypes ((SeekEntryResult!3290 0))(
  ( (MissingZero!3290 (index!15339 (_ BitVec 32))) (Found!3290 (index!15340 (_ BitVec 32))) (Intermediate!3290 (undefined!4102 Bool) (index!15341 (_ BitVec 32)) (x!34241 (_ BitVec 32))) (Undefined!3290) (MissingVacant!3290 (index!15342 (_ BitVec 32))) )
))
(declare-fun lt!162682 () SeekEntryResult!3290)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18276 (_ BitVec 32)) SeekEntryResult!3290)

(assert (=> b!344306 (= lt!162682 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344307 () Bool)

(declare-fun res!190429 () Bool)

(assert (=> b!344307 (=> (not res!190429) (not e!211070))))

(assert (=> b!344307 (= res!190429 (and (= (size!9005 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9006 _keys!1895) (size!9005 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344308 () Bool)

(assert (=> b!344308 (= e!211067 tp_is_empty!7345)))

(assert (= (and start!34456 res!190425) b!344307))

(assert (= (and b!344307 res!190429) b!344301))

(assert (= (and b!344301 res!190430) b!344305))

(assert (= (and b!344305 res!190426) b!344303))

(assert (= (and b!344303 res!190427) b!344304))

(assert (= (and b!344304 res!190428) b!344306))

(assert (= (and b!344302 condMapEmpty!12456) mapIsEmpty!12456))

(assert (= (and b!344302 (not condMapEmpty!12456)) mapNonEmpty!12456))

(get-info :version)

(assert (= (and mapNonEmpty!12456 ((_ is ValueCellFull!3329) mapValue!12456)) b!344300))

(assert (= (and b!344302 ((_ is ValueCellFull!3329) mapDefault!12456)) b!344308))

(assert (= start!34456 b!344302))

(declare-fun m!346221 () Bool)

(assert (=> b!344305 m!346221))

(declare-fun m!346223 () Bool)

(assert (=> start!34456 m!346223))

(declare-fun m!346225 () Bool)

(assert (=> start!34456 m!346225))

(declare-fun m!346227 () Bool)

(assert (=> start!34456 m!346227))

(declare-fun m!346229 () Bool)

(assert (=> mapNonEmpty!12456 m!346229))

(declare-fun m!346231 () Bool)

(assert (=> b!344301 m!346231))

(declare-fun m!346233 () Bool)

(assert (=> b!344304 m!346233))

(assert (=> b!344304 m!346233))

(declare-fun m!346235 () Bool)

(assert (=> b!344304 m!346235))

(declare-fun m!346237 () Bool)

(assert (=> b!344306 m!346237))

(declare-fun m!346239 () Bool)

(assert (=> b!344303 m!346239))

(check-sat (not b!344306) b_and!14615 (not start!34456) (not mapNonEmpty!12456) (not b!344301) tp_is_empty!7345 (not b!344305) (not b!344304) (not b_next!7393) (not b!344303))
(check-sat b_and!14615 (not b_next!7393))
