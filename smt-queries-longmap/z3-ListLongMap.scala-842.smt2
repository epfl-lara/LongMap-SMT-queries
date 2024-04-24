; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20152 () Bool)

(assert start!20152)

(declare-fun b_free!4807 () Bool)

(declare-fun b_next!4807 () Bool)

(assert (=> start!20152 (= b_free!4807 (not b_next!4807))))

(declare-fun tp!17453 () Bool)

(declare-fun b_and!11567 () Bool)

(assert (=> start!20152 (= tp!17453 b_and!11567)))

(declare-fun b!197701 () Bool)

(declare-fun e!130055 () Bool)

(declare-fun tp_is_empty!4663 () Bool)

(assert (=> b!197701 (= e!130055 tp_is_empty!4663)))

(declare-fun b!197702 () Bool)

(declare-fun res!93563 () Bool)

(declare-fun e!130056 () Bool)

(assert (=> b!197702 (=> (not res!93563) (not e!130056))))

(declare-datatypes ((array!8569 0))(
  ( (array!8570 (arr!4035 (Array (_ BitVec 32) (_ BitVec 64))) (size!4360 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8569)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8569 (_ BitVec 32)) Bool)

(assert (=> b!197702 (= res!93563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8063 () Bool)

(declare-fun mapRes!8063 () Bool)

(assert (=> mapIsEmpty!8063 mapRes!8063))

(declare-fun b!197703 () Bool)

(declare-fun res!93562 () Bool)

(assert (=> b!197703 (=> (not res!93562) (not e!130056))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5865 0))(
  ( (V!5866 (val!2376 Int)) )
))
(declare-datatypes ((ValueCell!1988 0))(
  ( (ValueCellFull!1988 (v!4347 V!5865)) (EmptyCell!1988) )
))
(declare-datatypes ((array!8571 0))(
  ( (array!8572 (arr!4036 (Array (_ BitVec 32) ValueCell!1988)) (size!4361 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8571)

(assert (=> b!197703 (= res!93562 (and (= (size!4361 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4360 _keys!825) (size!4361 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!93564 () Bool)

(assert (=> start!20152 (=> (not res!93564) (not e!130056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20152 (= res!93564 (validMask!0 mask!1149))))

(assert (=> start!20152 e!130056))

(declare-fun e!130057 () Bool)

(declare-fun array_inv!2629 (array!8571) Bool)

(assert (=> start!20152 (and (array_inv!2629 _values!649) e!130057)))

(assert (=> start!20152 true))

(assert (=> start!20152 tp_is_empty!4663))

(declare-fun array_inv!2630 (array!8569) Bool)

(assert (=> start!20152 (array_inv!2630 _keys!825)))

(assert (=> start!20152 tp!17453))

(declare-fun b!197704 () Bool)

(assert (=> b!197704 (= e!130057 (and e!130055 mapRes!8063))))

(declare-fun condMapEmpty!8063 () Bool)

(declare-fun mapDefault!8063 () ValueCell!1988)

(assert (=> b!197704 (= condMapEmpty!8063 (= (arr!4036 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1988)) mapDefault!8063)))))

(declare-fun b!197705 () Bool)

(declare-fun res!93559 () Bool)

(assert (=> b!197705 (=> (not res!93559) (not e!130056))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197705 (= res!93559 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8063 () Bool)

(declare-fun tp!17452 () Bool)

(declare-fun e!130058 () Bool)

(assert (=> mapNonEmpty!8063 (= mapRes!8063 (and tp!17452 e!130058))))

(declare-fun mapKey!8063 () (_ BitVec 32))

(declare-fun mapRest!8063 () (Array (_ BitVec 32) ValueCell!1988))

(declare-fun mapValue!8063 () ValueCell!1988)

(assert (=> mapNonEmpty!8063 (= (arr!4036 _values!649) (store mapRest!8063 mapKey!8063 mapValue!8063))))

(declare-fun b!197706 () Bool)

(assert (=> b!197706 (= e!130056 false)))

(declare-fun v!520 () V!5865)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5865)

(declare-datatypes ((tuple2!3558 0))(
  ( (tuple2!3559 (_1!1790 (_ BitVec 64)) (_2!1790 V!5865)) )
))
(declare-datatypes ((List!2476 0))(
  ( (Nil!2473) (Cons!2472 (h!3114 tuple2!3558) (t!7399 List!2476)) )
))
(declare-datatypes ((ListLongMap!2473 0))(
  ( (ListLongMap!2474 (toList!1252 List!2476)) )
))
(declare-fun lt!97819 () ListLongMap!2473)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5865)

(declare-fun getCurrentListMapNoExtraKeys!242 (array!8569 array!8571 (_ BitVec 32) (_ BitVec 32) V!5865 V!5865 (_ BitVec 32) Int) ListLongMap!2473)

(assert (=> b!197706 (= lt!97819 (getCurrentListMapNoExtraKeys!242 _keys!825 (array!8572 (store (arr!4036 _values!649) i!601 (ValueCellFull!1988 v!520)) (size!4361 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97820 () ListLongMap!2473)

(assert (=> b!197706 (= lt!97820 (getCurrentListMapNoExtraKeys!242 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197707 () Bool)

(declare-fun res!93561 () Bool)

(assert (=> b!197707 (=> (not res!93561) (not e!130056))))

(assert (=> b!197707 (= res!93561 (= (select (arr!4035 _keys!825) i!601) k0!843))))

(declare-fun b!197708 () Bool)

(assert (=> b!197708 (= e!130058 tp_is_empty!4663)))

(declare-fun b!197709 () Bool)

(declare-fun res!93565 () Bool)

(assert (=> b!197709 (=> (not res!93565) (not e!130056))))

(declare-datatypes ((List!2477 0))(
  ( (Nil!2474) (Cons!2473 (h!3115 (_ BitVec 64)) (t!7400 List!2477)) )
))
(declare-fun arrayNoDuplicates!0 (array!8569 (_ BitVec 32) List!2477) Bool)

(assert (=> b!197709 (= res!93565 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2474))))

(declare-fun b!197710 () Bool)

(declare-fun res!93560 () Bool)

(assert (=> b!197710 (=> (not res!93560) (not e!130056))))

(assert (=> b!197710 (= res!93560 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4360 _keys!825))))))

(assert (= (and start!20152 res!93564) b!197703))

(assert (= (and b!197703 res!93562) b!197702))

(assert (= (and b!197702 res!93563) b!197709))

(assert (= (and b!197709 res!93565) b!197710))

(assert (= (and b!197710 res!93560) b!197705))

(assert (= (and b!197705 res!93559) b!197707))

(assert (= (and b!197707 res!93561) b!197706))

(assert (= (and b!197704 condMapEmpty!8063) mapIsEmpty!8063))

(assert (= (and b!197704 (not condMapEmpty!8063)) mapNonEmpty!8063))

(get-info :version)

(assert (= (and mapNonEmpty!8063 ((_ is ValueCellFull!1988) mapValue!8063)) b!197708))

(assert (= (and b!197704 ((_ is ValueCellFull!1988) mapDefault!8063)) b!197701))

(assert (= start!20152 b!197704))

(declare-fun m!224655 () Bool)

(assert (=> mapNonEmpty!8063 m!224655))

(declare-fun m!224657 () Bool)

(assert (=> b!197705 m!224657))

(declare-fun m!224659 () Bool)

(assert (=> b!197707 m!224659))

(declare-fun m!224661 () Bool)

(assert (=> start!20152 m!224661))

(declare-fun m!224663 () Bool)

(assert (=> start!20152 m!224663))

(declare-fun m!224665 () Bool)

(assert (=> start!20152 m!224665))

(declare-fun m!224667 () Bool)

(assert (=> b!197709 m!224667))

(declare-fun m!224669 () Bool)

(assert (=> b!197706 m!224669))

(declare-fun m!224671 () Bool)

(assert (=> b!197706 m!224671))

(declare-fun m!224673 () Bool)

(assert (=> b!197706 m!224673))

(declare-fun m!224675 () Bool)

(assert (=> b!197702 m!224675))

(check-sat (not b!197706) (not mapNonEmpty!8063) (not start!20152) (not b!197709) (not b_next!4807) (not b!197705) tp_is_empty!4663 (not b!197702) b_and!11567)
(check-sat b_and!11567 (not b_next!4807))
