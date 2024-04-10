; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83474 () Bool)

(assert start!83474)

(declare-fun b_free!19461 () Bool)

(declare-fun b_next!19461 () Bool)

(assert (=> start!83474 (= b_free!19461 (not b_next!19461))))

(declare-fun tp!67671 () Bool)

(declare-fun b_and!31063 () Bool)

(assert (=> start!83474 (= tp!67671 b_and!31063)))

(declare-fun b!975067 () Bool)

(declare-fun e!549561 () Bool)

(declare-fun tp_is_empty!22365 () Bool)

(assert (=> b!975067 (= e!549561 tp_is_empty!22365)))

(declare-fun b!975068 () Bool)

(declare-fun e!549565 () Bool)

(assert (=> b!975068 (= e!549565 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34803 0))(
  ( (V!34804 (val!11233 Int)) )
))
(declare-fun zeroValue!1367 () V!34803)

(declare-datatypes ((tuple2!14440 0))(
  ( (tuple2!14441 (_1!7231 (_ BitVec 64)) (_2!7231 V!34803)) )
))
(declare-datatypes ((List!20293 0))(
  ( (Nil!20290) (Cons!20289 (h!21451 tuple2!14440) (t!28770 List!20293)) )
))
(declare-datatypes ((ListLongMap!13137 0))(
  ( (ListLongMap!13138 (toList!6584 List!20293)) )
))
(declare-fun lt!432827 () ListLongMap!13137)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34803)

(declare-datatypes ((ValueCell!10701 0))(
  ( (ValueCellFull!10701 (v!13792 V!34803)) (EmptyCell!10701) )
))
(declare-datatypes ((array!60763 0))(
  ( (array!60764 (arr!29245 (Array (_ BitVec 32) ValueCell!10701)) (size!29724 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60763)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60765 0))(
  ( (array!60766 (arr!29246 (Array (_ BitVec 32) (_ BitVec 64))) (size!29725 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60765)

(declare-fun getCurrentListMap!3817 (array!60765 array!60763 (_ BitVec 32) (_ BitVec 32) V!34803 V!34803 (_ BitVec 32) Int) ListLongMap!13137)

(assert (=> b!975068 (= lt!432827 (getCurrentListMap!3817 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35557 () Bool)

(declare-fun mapRes!35557 () Bool)

(declare-fun tp!67670 () Bool)

(declare-fun e!549564 () Bool)

(assert (=> mapNonEmpty!35557 (= mapRes!35557 (and tp!67670 e!549564))))

(declare-fun mapKey!35557 () (_ BitVec 32))

(declare-fun mapRest!35557 () (Array (_ BitVec 32) ValueCell!10701))

(declare-fun mapValue!35557 () ValueCell!10701)

(assert (=> mapNonEmpty!35557 (= (arr!29245 _values!1425) (store mapRest!35557 mapKey!35557 mapValue!35557))))

(declare-fun b!975069 () Bool)

(declare-fun res!652725 () Bool)

(assert (=> b!975069 (=> (not res!652725) (not e!549565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60765 (_ BitVec 32)) Bool)

(assert (=> b!975069 (= res!652725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!652721 () Bool)

(assert (=> start!83474 (=> (not res!652721) (not e!549565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83474 (= res!652721 (validMask!0 mask!2147))))

(assert (=> start!83474 e!549565))

(assert (=> start!83474 true))

(declare-fun e!549563 () Bool)

(declare-fun array_inv!22615 (array!60763) Bool)

(assert (=> start!83474 (and (array_inv!22615 _values!1425) e!549563)))

(assert (=> start!83474 tp_is_empty!22365))

(assert (=> start!83474 tp!67671))

(declare-fun array_inv!22616 (array!60765) Bool)

(assert (=> start!83474 (array_inv!22616 _keys!1717)))

(declare-fun b!975070 () Bool)

(assert (=> b!975070 (= e!549564 tp_is_empty!22365)))

(declare-fun b!975071 () Bool)

(declare-fun res!652724 () Bool)

(assert (=> b!975071 (=> (not res!652724) (not e!549565))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5666 (ListLongMap!13137 (_ BitVec 64)) Bool)

(assert (=> b!975071 (= res!652724 (contains!5666 (getCurrentListMap!3817 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29246 _keys!1717) i!822)))))

(declare-fun b!975072 () Bool)

(declare-fun res!652720 () Bool)

(assert (=> b!975072 (=> (not res!652720) (not e!549565))))

(assert (=> b!975072 (= res!652720 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29725 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29725 _keys!1717))))))

(declare-fun b!975073 () Bool)

(assert (=> b!975073 (= e!549563 (and e!549561 mapRes!35557))))

(declare-fun condMapEmpty!35557 () Bool)

(declare-fun mapDefault!35557 () ValueCell!10701)

(assert (=> b!975073 (= condMapEmpty!35557 (= (arr!29245 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10701)) mapDefault!35557)))))

(declare-fun mapIsEmpty!35557 () Bool)

(assert (=> mapIsEmpty!35557 mapRes!35557))

(declare-fun b!975074 () Bool)

(declare-fun res!652722 () Bool)

(assert (=> b!975074 (=> (not res!652722) (not e!549565))))

(assert (=> b!975074 (= res!652722 (and (= (size!29724 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29725 _keys!1717) (size!29724 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975075 () Bool)

(declare-fun res!652719 () Bool)

(assert (=> b!975075 (=> (not res!652719) (not e!549565))))

(declare-datatypes ((List!20294 0))(
  ( (Nil!20291) (Cons!20290 (h!21452 (_ BitVec 64)) (t!28771 List!20294)) )
))
(declare-fun arrayNoDuplicates!0 (array!60765 (_ BitVec 32) List!20294) Bool)

(assert (=> b!975075 (= res!652719 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20291))))

(declare-fun b!975076 () Bool)

(declare-fun res!652723 () Bool)

(assert (=> b!975076 (=> (not res!652723) (not e!549565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975076 (= res!652723 (validKeyInArray!0 (select (arr!29246 _keys!1717) i!822)))))

(assert (= (and start!83474 res!652721) b!975074))

(assert (= (and b!975074 res!652722) b!975069))

(assert (= (and b!975069 res!652725) b!975075))

(assert (= (and b!975075 res!652719) b!975072))

(assert (= (and b!975072 res!652720) b!975076))

(assert (= (and b!975076 res!652723) b!975071))

(assert (= (and b!975071 res!652724) b!975068))

(assert (= (and b!975073 condMapEmpty!35557) mapIsEmpty!35557))

(assert (= (and b!975073 (not condMapEmpty!35557)) mapNonEmpty!35557))

(get-info :version)

(assert (= (and mapNonEmpty!35557 ((_ is ValueCellFull!10701) mapValue!35557)) b!975070))

(assert (= (and b!975073 ((_ is ValueCellFull!10701) mapDefault!35557)) b!975067))

(assert (= start!83474 b!975073))

(declare-fun m!902411 () Bool)

(assert (=> b!975069 m!902411))

(declare-fun m!902413 () Bool)

(assert (=> b!975076 m!902413))

(assert (=> b!975076 m!902413))

(declare-fun m!902415 () Bool)

(assert (=> b!975076 m!902415))

(declare-fun m!902417 () Bool)

(assert (=> b!975071 m!902417))

(assert (=> b!975071 m!902413))

(assert (=> b!975071 m!902417))

(assert (=> b!975071 m!902413))

(declare-fun m!902419 () Bool)

(assert (=> b!975071 m!902419))

(declare-fun m!902421 () Bool)

(assert (=> mapNonEmpty!35557 m!902421))

(declare-fun m!902423 () Bool)

(assert (=> b!975068 m!902423))

(declare-fun m!902425 () Bool)

(assert (=> start!83474 m!902425))

(declare-fun m!902427 () Bool)

(assert (=> start!83474 m!902427))

(declare-fun m!902429 () Bool)

(assert (=> start!83474 m!902429))

(declare-fun m!902431 () Bool)

(assert (=> b!975075 m!902431))

(check-sat (not b!975069) (not b_next!19461) (not b!975068) (not b!975071) (not b!975075) (not start!83474) b_and!31063 tp_is_empty!22365 (not mapNonEmpty!35557) (not b!975076))
(check-sat b_and!31063 (not b_next!19461))
