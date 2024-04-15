; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43496 () Bool)

(assert start!43496)

(declare-fun b_free!12289 () Bool)

(declare-fun b_next!12289 () Bool)

(assert (=> start!43496 (= b_free!12289 (not b_next!12289))))

(declare-fun tp!43149 () Bool)

(declare-fun b_and!21023 () Bool)

(assert (=> start!43496 (= tp!43149 b_and!21023)))

(declare-fun b!481819 () Bool)

(declare-fun e!283498 () Bool)

(declare-fun tp_is_empty!13801 () Bool)

(assert (=> b!481819 (= e!283498 tp_is_empty!13801)))

(declare-fun b!481820 () Bool)

(declare-fun res!287259 () Bool)

(declare-fun e!283500 () Bool)

(assert (=> b!481820 (=> (not res!287259) (not e!283500))))

(declare-datatypes ((array!31257 0))(
  ( (array!31258 (arr!15031 (Array (_ BitVec 32) (_ BitVec 64))) (size!15390 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31257)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31257 (_ BitVec 32)) Bool)

(assert (=> b!481820 (= res!287259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481821 () Bool)

(declare-fun e!283497 () Bool)

(declare-fun e!283499 () Bool)

(declare-fun mapRes!22411 () Bool)

(assert (=> b!481821 (= e!283497 (and e!283499 mapRes!22411))))

(declare-fun condMapEmpty!22411 () Bool)

(declare-datatypes ((V!19473 0))(
  ( (V!19474 (val!6948 Int)) )
))
(declare-datatypes ((ValueCell!6539 0))(
  ( (ValueCellFull!6539 (v!9235 V!19473)) (EmptyCell!6539) )
))
(declare-datatypes ((array!31259 0))(
  ( (array!31260 (arr!15032 (Array (_ BitVec 32) ValueCell!6539)) (size!15391 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31259)

(declare-fun mapDefault!22411 () ValueCell!6539)

(assert (=> b!481821 (= condMapEmpty!22411 (= (arr!15032 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6539)) mapDefault!22411)))))

(declare-fun b!481822 () Bool)

(assert (=> b!481822 (= e!283499 tp_is_empty!13801)))

(declare-fun mapIsEmpty!22411 () Bool)

(assert (=> mapIsEmpty!22411 mapRes!22411))

(declare-fun b!481823 () Bool)

(assert (=> b!481823 (= e!283500 false)))

(declare-fun lt!218437 () Bool)

(declare-fun minValue!1458 () V!19473)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19473)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9170 0))(
  ( (tuple2!9171 (_1!4596 (_ BitVec 64)) (_2!4596 V!19473)) )
))
(declare-datatypes ((List!9234 0))(
  ( (Nil!9231) (Cons!9230 (h!10086 tuple2!9170) (t!15439 List!9234)) )
))
(declare-datatypes ((ListLongMap!8073 0))(
  ( (ListLongMap!8074 (toList!4052 List!9234)) )
))
(declare-fun contains!2631 (ListLongMap!8073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2305 (array!31257 array!31259 (_ BitVec 32) (_ BitVec 32) V!19473 V!19473 (_ BitVec 32) Int) ListLongMap!8073)

(assert (=> b!481823 (= lt!218437 (contains!2631 (getCurrentListMap!2305 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287258 () Bool)

(assert (=> start!43496 (=> (not res!287258) (not e!283500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43496 (= res!287258 (validMask!0 mask!2352))))

(assert (=> start!43496 e!283500))

(assert (=> start!43496 true))

(assert (=> start!43496 tp_is_empty!13801))

(declare-fun array_inv!10932 (array!31259) Bool)

(assert (=> start!43496 (and (array_inv!10932 _values!1516) e!283497)))

(assert (=> start!43496 tp!43149))

(declare-fun array_inv!10933 (array!31257) Bool)

(assert (=> start!43496 (array_inv!10933 _keys!1874)))

(declare-fun b!481824 () Bool)

(declare-fun res!287260 () Bool)

(assert (=> b!481824 (=> (not res!287260) (not e!283500))))

(assert (=> b!481824 (= res!287260 (and (= (size!15391 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15390 _keys!1874) (size!15391 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481825 () Bool)

(declare-fun res!287257 () Bool)

(assert (=> b!481825 (=> (not res!287257) (not e!283500))))

(declare-datatypes ((List!9235 0))(
  ( (Nil!9232) (Cons!9231 (h!10087 (_ BitVec 64)) (t!15440 List!9235)) )
))
(declare-fun arrayNoDuplicates!0 (array!31257 (_ BitVec 32) List!9235) Bool)

(assert (=> b!481825 (= res!287257 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9232))))

(declare-fun mapNonEmpty!22411 () Bool)

(declare-fun tp!43150 () Bool)

(assert (=> mapNonEmpty!22411 (= mapRes!22411 (and tp!43150 e!283498))))

(declare-fun mapRest!22411 () (Array (_ BitVec 32) ValueCell!6539))

(declare-fun mapValue!22411 () ValueCell!6539)

(declare-fun mapKey!22411 () (_ BitVec 32))

(assert (=> mapNonEmpty!22411 (= (arr!15032 _values!1516) (store mapRest!22411 mapKey!22411 mapValue!22411))))

(assert (= (and start!43496 res!287258) b!481824))

(assert (= (and b!481824 res!287260) b!481820))

(assert (= (and b!481820 res!287259) b!481825))

(assert (= (and b!481825 res!287257) b!481823))

(assert (= (and b!481821 condMapEmpty!22411) mapIsEmpty!22411))

(assert (= (and b!481821 (not condMapEmpty!22411)) mapNonEmpty!22411))

(get-info :version)

(assert (= (and mapNonEmpty!22411 ((_ is ValueCellFull!6539) mapValue!22411)) b!481819))

(assert (= (and b!481821 ((_ is ValueCellFull!6539) mapDefault!22411)) b!481822))

(assert (= start!43496 b!481821))

(declare-fun m!462693 () Bool)

(assert (=> b!481823 m!462693))

(assert (=> b!481823 m!462693))

(declare-fun m!462695 () Bool)

(assert (=> b!481823 m!462695))

(declare-fun m!462697 () Bool)

(assert (=> start!43496 m!462697))

(declare-fun m!462699 () Bool)

(assert (=> start!43496 m!462699))

(declare-fun m!462701 () Bool)

(assert (=> start!43496 m!462701))

(declare-fun m!462703 () Bool)

(assert (=> mapNonEmpty!22411 m!462703))

(declare-fun m!462705 () Bool)

(assert (=> b!481820 m!462705))

(declare-fun m!462707 () Bool)

(assert (=> b!481825 m!462707))

(check-sat (not mapNonEmpty!22411) (not b!481820) (not b!481823) (not b!481825) tp_is_empty!13801 (not b_next!12289) b_and!21023 (not start!43496))
(check-sat b_and!21023 (not b_next!12289))
