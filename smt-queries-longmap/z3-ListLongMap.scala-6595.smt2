; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83436 () Bool)

(assert start!83436)

(declare-fun b_free!19441 () Bool)

(declare-fun b_next!19441 () Bool)

(assert (=> start!83436 (= b_free!19441 (not b_next!19441))))

(declare-fun tp!67611 () Bool)

(declare-fun b_and!31017 () Bool)

(assert (=> start!83436 (= tp!67611 b_and!31017)))

(declare-fun b!974528 () Bool)

(declare-fun res!652404 () Bool)

(declare-fun e!549264 () Bool)

(assert (=> b!974528 (=> (not res!652404) (not e!549264))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34777 0))(
  ( (V!34778 (val!11223 Int)) )
))
(declare-fun zeroValue!1367 () V!34777)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34777)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10691 0))(
  ( (ValueCellFull!10691 (v!13781 V!34777)) (EmptyCell!10691) )
))
(declare-datatypes ((array!60652 0))(
  ( (array!60653 (arr!29190 (Array (_ BitVec 32) ValueCell!10691)) (size!29671 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60652)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60654 0))(
  ( (array!60655 (arr!29191 (Array (_ BitVec 32) (_ BitVec 64))) (size!29672 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60654)

(declare-datatypes ((tuple2!14490 0))(
  ( (tuple2!14491 (_1!7256 (_ BitVec 64)) (_2!7256 V!34777)) )
))
(declare-datatypes ((List!20298 0))(
  ( (Nil!20295) (Cons!20294 (h!21456 tuple2!14490) (t!28766 List!20298)) )
))
(declare-datatypes ((ListLongMap!13177 0))(
  ( (ListLongMap!13178 (toList!6604 List!20298)) )
))
(declare-fun contains!5640 (ListLongMap!13177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3766 (array!60654 array!60652 (_ BitVec 32) (_ BitVec 32) V!34777 V!34777 (_ BitVec 32) Int) ListLongMap!13177)

(assert (=> b!974528 (= res!652404 (contains!5640 (getCurrentListMap!3766 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29191 _keys!1717) i!822)))))

(declare-fun b!974529 () Bool)

(declare-fun res!652402 () Bool)

(assert (=> b!974529 (=> (not res!652402) (not e!549264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974529 (= res!652402 (validKeyInArray!0 (select (arr!29191 _keys!1717) i!822)))))

(declare-fun b!974530 () Bool)

(declare-fun e!549263 () Bool)

(declare-fun tp_is_empty!22345 () Bool)

(assert (=> b!974530 (= e!549263 tp_is_empty!22345)))

(declare-fun mapIsEmpty!35527 () Bool)

(declare-fun mapRes!35527 () Bool)

(assert (=> mapIsEmpty!35527 mapRes!35527))

(declare-fun mapNonEmpty!35527 () Bool)

(declare-fun tp!67612 () Bool)

(declare-fun e!549266 () Bool)

(assert (=> mapNonEmpty!35527 (= mapRes!35527 (and tp!67612 e!549266))))

(declare-fun mapValue!35527 () ValueCell!10691)

(declare-fun mapKey!35527 () (_ BitVec 32))

(declare-fun mapRest!35527 () (Array (_ BitVec 32) ValueCell!10691))

(assert (=> mapNonEmpty!35527 (= (arr!29190 _values!1425) (store mapRest!35527 mapKey!35527 mapValue!35527))))

(declare-fun b!974531 () Bool)

(declare-fun e!549265 () Bool)

(assert (=> b!974531 (= e!549265 (and e!549263 mapRes!35527))))

(declare-fun condMapEmpty!35527 () Bool)

(declare-fun mapDefault!35527 () ValueCell!10691)

(assert (=> b!974531 (= condMapEmpty!35527 (= (arr!29190 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10691)) mapDefault!35527)))))

(declare-fun b!974532 () Bool)

(declare-fun res!652400 () Bool)

(assert (=> b!974532 (=> (not res!652400) (not e!549264))))

(assert (=> b!974532 (= res!652400 (and (= (size!29671 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29672 _keys!1717) (size!29671 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974534 () Bool)

(assert (=> b!974534 (= e!549264 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29672 _keys!1717)))))

(declare-fun lt!432561 () ListLongMap!13177)

(assert (=> b!974534 (= lt!432561 (getCurrentListMap!3766 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974535 () Bool)

(declare-fun res!652403 () Bool)

(assert (=> b!974535 (=> (not res!652403) (not e!549264))))

(assert (=> b!974535 (= res!652403 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29672 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29672 _keys!1717))))))

(declare-fun b!974536 () Bool)

(declare-fun res!652399 () Bool)

(assert (=> b!974536 (=> (not res!652399) (not e!549264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60654 (_ BitVec 32)) Bool)

(assert (=> b!974536 (= res!652399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974537 () Bool)

(assert (=> b!974537 (= e!549266 tp_is_empty!22345)))

(declare-fun res!652401 () Bool)

(assert (=> start!83436 (=> (not res!652401) (not e!549264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83436 (= res!652401 (validMask!0 mask!2147))))

(assert (=> start!83436 e!549264))

(assert (=> start!83436 true))

(declare-fun array_inv!22629 (array!60652) Bool)

(assert (=> start!83436 (and (array_inv!22629 _values!1425) e!549265)))

(assert (=> start!83436 tp_is_empty!22345))

(assert (=> start!83436 tp!67611))

(declare-fun array_inv!22630 (array!60654) Bool)

(assert (=> start!83436 (array_inv!22630 _keys!1717)))

(declare-fun b!974533 () Bool)

(declare-fun res!652405 () Bool)

(assert (=> b!974533 (=> (not res!652405) (not e!549264))))

(declare-datatypes ((List!20299 0))(
  ( (Nil!20296) (Cons!20295 (h!21457 (_ BitVec 64)) (t!28767 List!20299)) )
))
(declare-fun arrayNoDuplicates!0 (array!60654 (_ BitVec 32) List!20299) Bool)

(assert (=> b!974533 (= res!652405 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20296))))

(assert (= (and start!83436 res!652401) b!974532))

(assert (= (and b!974532 res!652400) b!974536))

(assert (= (and b!974536 res!652399) b!974533))

(assert (= (and b!974533 res!652405) b!974535))

(assert (= (and b!974535 res!652403) b!974529))

(assert (= (and b!974529 res!652402) b!974528))

(assert (= (and b!974528 res!652404) b!974534))

(assert (= (and b!974531 condMapEmpty!35527) mapIsEmpty!35527))

(assert (= (and b!974531 (not condMapEmpty!35527)) mapNonEmpty!35527))

(get-info :version)

(assert (= (and mapNonEmpty!35527 ((_ is ValueCellFull!10691) mapValue!35527)) b!974537))

(assert (= (and b!974531 ((_ is ValueCellFull!10691) mapDefault!35527)) b!974530))

(assert (= start!83436 b!974531))

(declare-fun m!901433 () Bool)

(assert (=> b!974529 m!901433))

(assert (=> b!974529 m!901433))

(declare-fun m!901435 () Bool)

(assert (=> b!974529 m!901435))

(declare-fun m!901437 () Bool)

(assert (=> b!974528 m!901437))

(assert (=> b!974528 m!901433))

(assert (=> b!974528 m!901437))

(assert (=> b!974528 m!901433))

(declare-fun m!901439 () Bool)

(assert (=> b!974528 m!901439))

(declare-fun m!901441 () Bool)

(assert (=> start!83436 m!901441))

(declare-fun m!901443 () Bool)

(assert (=> start!83436 m!901443))

(declare-fun m!901445 () Bool)

(assert (=> start!83436 m!901445))

(declare-fun m!901447 () Bool)

(assert (=> b!974534 m!901447))

(declare-fun m!901449 () Bool)

(assert (=> mapNonEmpty!35527 m!901449))

(declare-fun m!901451 () Bool)

(assert (=> b!974536 m!901451))

(declare-fun m!901453 () Bool)

(assert (=> b!974533 m!901453))

(check-sat (not b!974529) (not b!974536) (not b!974533) (not b_next!19441) (not b!974534) b_and!31017 (not mapNonEmpty!35527) tp_is_empty!22345 (not start!83436) (not b!974528))
(check-sat b_and!31017 (not b_next!19441))
