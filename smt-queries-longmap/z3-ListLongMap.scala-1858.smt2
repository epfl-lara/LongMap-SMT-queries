; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33530 () Bool)

(assert start!33530)

(declare-fun b_free!6819 () Bool)

(declare-fun b_next!6819 () Bool)

(assert (=> start!33530 (= b_free!6819 (not b_next!6819))))

(declare-fun tp!23951 () Bool)

(declare-fun b_and!13993 () Bool)

(assert (=> start!33530 (= tp!23951 b_and!13993)))

(declare-fun b!332775 () Bool)

(declare-fun res!183345 () Bool)

(declare-fun e!204348 () Bool)

(assert (=> b!332775 (=> (not res!183345) (not e!204348))))

(declare-datatypes ((array!17137 0))(
  ( (array!17138 (arr!8102 (Array (_ BitVec 32) (_ BitVec 64))) (size!8454 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17137)

(declare-datatypes ((List!4609 0))(
  ( (Nil!4606) (Cons!4605 (h!5461 (_ BitVec 64)) (t!9691 List!4609)) )
))
(declare-fun arrayNoDuplicates!0 (array!17137 (_ BitVec 32) List!4609) Bool)

(assert (=> b!332775 (= res!183345 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4606))))

(declare-fun b!332776 () Bool)

(assert (=> b!332776 (= e!204348 false)))

(declare-fun lt!159043 () Bool)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10005 0))(
  ( (V!10006 (val!3430 Int)) )
))
(declare-fun zeroValue!1467 () V!10005)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3042 0))(
  ( (ValueCellFull!3042 (v!5589 V!10005)) (EmptyCell!3042) )
))
(declare-datatypes ((array!17139 0))(
  ( (array!17140 (arr!8103 (Array (_ BitVec 32) ValueCell!3042)) (size!8455 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17139)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10005)

(declare-datatypes ((tuple2!4994 0))(
  ( (tuple2!4995 (_1!2508 (_ BitVec 64)) (_2!2508 V!10005)) )
))
(declare-datatypes ((List!4610 0))(
  ( (Nil!4607) (Cons!4606 (h!5462 tuple2!4994) (t!9692 List!4610)) )
))
(declare-datatypes ((ListLongMap!3907 0))(
  ( (ListLongMap!3908 (toList!1969 List!4610)) )
))
(declare-fun contains!2010 (ListLongMap!3907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1497 (array!17137 array!17139 (_ BitVec 32) (_ BitVec 32) V!10005 V!10005 (_ BitVec 32) Int) ListLongMap!3907)

(assert (=> b!332776 (= lt!159043 (contains!2010 (getCurrentListMap!1497 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun mapNonEmpty!11544 () Bool)

(declare-fun mapRes!11544 () Bool)

(declare-fun tp!23952 () Bool)

(declare-fun e!204344 () Bool)

(assert (=> mapNonEmpty!11544 (= mapRes!11544 (and tp!23952 e!204344))))

(declare-fun mapKey!11544 () (_ BitVec 32))

(declare-fun mapRest!11544 () (Array (_ BitVec 32) ValueCell!3042))

(declare-fun mapValue!11544 () ValueCell!3042)

(assert (=> mapNonEmpty!11544 (= (arr!8103 _values!1525) (store mapRest!11544 mapKey!11544 mapValue!11544))))

(declare-fun b!332777 () Bool)

(declare-fun e!204347 () Bool)

(declare-fun e!204345 () Bool)

(assert (=> b!332777 (= e!204347 (and e!204345 mapRes!11544))))

(declare-fun condMapEmpty!11544 () Bool)

(declare-fun mapDefault!11544 () ValueCell!3042)

(assert (=> b!332777 (= condMapEmpty!11544 (= (arr!8103 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3042)) mapDefault!11544)))))

(declare-fun mapIsEmpty!11544 () Bool)

(assert (=> mapIsEmpty!11544 mapRes!11544))

(declare-fun b!332779 () Bool)

(declare-fun res!183347 () Bool)

(assert (=> b!332779 (=> (not res!183347) (not e!204348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17137 (_ BitVec 32)) Bool)

(assert (=> b!332779 (= res!183347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183344 () Bool)

(assert (=> start!33530 (=> (not res!183344) (not e!204348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33530 (= res!183344 (validMask!0 mask!2385))))

(assert (=> start!33530 e!204348))

(assert (=> start!33530 true))

(declare-fun tp_is_empty!6771 () Bool)

(assert (=> start!33530 tp_is_empty!6771))

(assert (=> start!33530 tp!23951))

(declare-fun array_inv!6034 (array!17139) Bool)

(assert (=> start!33530 (and (array_inv!6034 _values!1525) e!204347)))

(declare-fun array_inv!6035 (array!17137) Bool)

(assert (=> start!33530 (array_inv!6035 _keys!1895)))

(declare-fun b!332778 () Bool)

(assert (=> b!332778 (= e!204345 tp_is_empty!6771)))

(declare-fun b!332780 () Bool)

(declare-fun res!183346 () Bool)

(assert (=> b!332780 (=> (not res!183346) (not e!204348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332780 (= res!183346 (validKeyInArray!0 k0!1348))))

(declare-fun b!332781 () Bool)

(assert (=> b!332781 (= e!204344 tp_is_empty!6771)))

(declare-fun b!332782 () Bool)

(declare-fun res!183343 () Bool)

(assert (=> b!332782 (=> (not res!183343) (not e!204348))))

(assert (=> b!332782 (= res!183343 (and (= (size!8455 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8454 _keys!1895) (size!8455 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33530 res!183344) b!332782))

(assert (= (and b!332782 res!183343) b!332779))

(assert (= (and b!332779 res!183347) b!332775))

(assert (= (and b!332775 res!183345) b!332780))

(assert (= (and b!332780 res!183346) b!332776))

(assert (= (and b!332777 condMapEmpty!11544) mapIsEmpty!11544))

(assert (= (and b!332777 (not condMapEmpty!11544)) mapNonEmpty!11544))

(get-info :version)

(assert (= (and mapNonEmpty!11544 ((_ is ValueCellFull!3042) mapValue!11544)) b!332781))

(assert (= (and b!332777 ((_ is ValueCellFull!3042) mapDefault!11544)) b!332778))

(assert (= start!33530 b!332777))

(declare-fun m!337185 () Bool)

(assert (=> mapNonEmpty!11544 m!337185))

(declare-fun m!337187 () Bool)

(assert (=> b!332775 m!337187))

(declare-fun m!337189 () Bool)

(assert (=> b!332779 m!337189))

(declare-fun m!337191 () Bool)

(assert (=> start!33530 m!337191))

(declare-fun m!337193 () Bool)

(assert (=> start!33530 m!337193))

(declare-fun m!337195 () Bool)

(assert (=> start!33530 m!337195))

(declare-fun m!337197 () Bool)

(assert (=> b!332780 m!337197))

(declare-fun m!337199 () Bool)

(assert (=> b!332776 m!337199))

(assert (=> b!332776 m!337199))

(declare-fun m!337201 () Bool)

(assert (=> b!332776 m!337201))

(check-sat (not start!33530) tp_is_empty!6771 b_and!13993 (not mapNonEmpty!11544) (not b!332780) (not b_next!6819) (not b!332775) (not b!332779) (not b!332776))
(check-sat b_and!13993 (not b_next!6819))
