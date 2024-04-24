; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40614 () Bool)

(assert start!40614)

(declare-fun b_free!10639 () Bool)

(declare-fun b_next!10639 () Bool)

(assert (=> start!40614 (= b_free!10639 (not b_next!10639))))

(declare-fun tp!37736 () Bool)

(declare-fun b_and!18661 () Bool)

(assert (=> start!40614 (= tp!37736 b_and!18661)))

(declare-fun b!448498 () Bool)

(declare-fun res!266622 () Bool)

(declare-fun e!263138 () Bool)

(assert (=> b!448498 (=> (not res!266622) (not e!263138))))

(declare-datatypes ((array!27758 0))(
  ( (array!27759 (arr!13324 (Array (_ BitVec 32) (_ BitVec 64))) (size!13676 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27758)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448498 (= res!266622 (or (= (select (arr!13324 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13324 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448499 () Bool)

(declare-fun res!266626 () Bool)

(assert (=> b!448499 (=> (not res!266626) (not e!263138))))

(assert (=> b!448499 (= res!266626 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13676 _keys!709))))))

(declare-fun b!448500 () Bool)

(declare-fun e!263137 () Bool)

(declare-fun tp_is_empty!11977 () Bool)

(assert (=> b!448500 (= e!263137 tp_is_empty!11977)))

(declare-fun b!448501 () Bool)

(declare-fun e!263139 () Bool)

(declare-fun mapRes!19599 () Bool)

(assert (=> b!448501 (= e!263139 (and e!263137 mapRes!19599))))

(declare-fun condMapEmpty!19599 () Bool)

(declare-datatypes ((V!17075 0))(
  ( (V!17076 (val!6033 Int)) )
))
(declare-datatypes ((ValueCell!5645 0))(
  ( (ValueCellFull!5645 (v!8289 V!17075)) (EmptyCell!5645) )
))
(declare-datatypes ((array!27760 0))(
  ( (array!27761 (arr!13325 (Array (_ BitVec 32) ValueCell!5645)) (size!13677 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27760)

(declare-fun mapDefault!19599 () ValueCell!5645)

(assert (=> b!448501 (= condMapEmpty!19599 (= (arr!13325 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5645)) mapDefault!19599)))))

(declare-fun b!448502 () Bool)

(declare-fun res!266620 () Bool)

(assert (=> b!448502 (=> (not res!266620) (not e!263138))))

(declare-datatypes ((List!7895 0))(
  ( (Nil!7892) (Cons!7891 (h!8747 (_ BitVec 64)) (t!13649 List!7895)) )
))
(declare-fun arrayNoDuplicates!0 (array!27758 (_ BitVec 32) List!7895) Bool)

(assert (=> b!448502 (= res!266620 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7892))))

(declare-fun b!448503 () Bool)

(declare-fun res!266617 () Bool)

(assert (=> b!448503 (=> (not res!266617) (not e!263138))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27758 (_ BitVec 32)) Bool)

(assert (=> b!448503 (= res!266617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448504 () Bool)

(declare-fun res!266624 () Bool)

(assert (=> b!448504 (=> (not res!266624) (not e!263138))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448504 (= res!266624 (validKeyInArray!0 k0!794))))

(declare-fun b!448505 () Bool)

(declare-fun e!263142 () Bool)

(assert (=> b!448505 (= e!263138 e!263142)))

(declare-fun res!266619 () Bool)

(assert (=> b!448505 (=> (not res!266619) (not e!263142))))

(declare-fun lt!204208 () array!27758)

(assert (=> b!448505 (= res!266619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204208 mask!1025))))

(assert (=> b!448505 (= lt!204208 (array!27759 (store (arr!13324 _keys!709) i!563 k0!794) (size!13676 _keys!709)))))

(declare-fun b!448506 () Bool)

(declare-fun e!263141 () Bool)

(assert (=> b!448506 (= e!263141 tp_is_empty!11977)))

(declare-fun res!266628 () Bool)

(assert (=> start!40614 (=> (not res!266628) (not e!263138))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40614 (= res!266628 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13676 _keys!709))))))

(assert (=> start!40614 e!263138))

(assert (=> start!40614 tp_is_empty!11977))

(assert (=> start!40614 tp!37736))

(assert (=> start!40614 true))

(declare-fun array_inv!9736 (array!27760) Bool)

(assert (=> start!40614 (and (array_inv!9736 _values!549) e!263139)))

(declare-fun array_inv!9737 (array!27758) Bool)

(assert (=> start!40614 (array_inv!9737 _keys!709)))

(declare-fun mapIsEmpty!19599 () Bool)

(assert (=> mapIsEmpty!19599 mapRes!19599))

(declare-fun b!448507 () Bool)

(declare-fun res!266625 () Bool)

(assert (=> b!448507 (=> (not res!266625) (not e!263142))))

(assert (=> b!448507 (= res!266625 (bvsle from!863 i!563))))

(declare-fun b!448508 () Bool)

(assert (=> b!448508 (= e!263142 false)))

(declare-fun minValue!515 () V!17075)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17075)

(declare-datatypes ((tuple2!7822 0))(
  ( (tuple2!7823 (_1!3922 (_ BitVec 64)) (_2!3922 V!17075)) )
))
(declare-datatypes ((List!7896 0))(
  ( (Nil!7893) (Cons!7892 (h!8748 tuple2!7822) (t!13650 List!7896)) )
))
(declare-datatypes ((ListLongMap!6737 0))(
  ( (ListLongMap!6738 (toList!3384 List!7896)) )
))
(declare-fun lt!204206 () ListLongMap!6737)

(declare-fun v!412 () V!17075)

(declare-fun getCurrentListMapNoExtraKeys!1614 (array!27758 array!27760 (_ BitVec 32) (_ BitVec 32) V!17075 V!17075 (_ BitVec 32) Int) ListLongMap!6737)

(assert (=> b!448508 (= lt!204206 (getCurrentListMapNoExtraKeys!1614 lt!204208 (array!27761 (store (arr!13325 _values!549) i!563 (ValueCellFull!5645 v!412)) (size!13677 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204207 () ListLongMap!6737)

(assert (=> b!448508 (= lt!204207 (getCurrentListMapNoExtraKeys!1614 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448509 () Bool)

(declare-fun res!266623 () Bool)

(assert (=> b!448509 (=> (not res!266623) (not e!263138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448509 (= res!266623 (validMask!0 mask!1025))))

(declare-fun b!448510 () Bool)

(declare-fun res!266627 () Bool)

(assert (=> b!448510 (=> (not res!266627) (not e!263142))))

(assert (=> b!448510 (= res!266627 (arrayNoDuplicates!0 lt!204208 #b00000000000000000000000000000000 Nil!7892))))

(declare-fun mapNonEmpty!19599 () Bool)

(declare-fun tp!37737 () Bool)

(assert (=> mapNonEmpty!19599 (= mapRes!19599 (and tp!37737 e!263141))))

(declare-fun mapKey!19599 () (_ BitVec 32))

(declare-fun mapRest!19599 () (Array (_ BitVec 32) ValueCell!5645))

(declare-fun mapValue!19599 () ValueCell!5645)

(assert (=> mapNonEmpty!19599 (= (arr!13325 _values!549) (store mapRest!19599 mapKey!19599 mapValue!19599))))

(declare-fun b!448511 () Bool)

(declare-fun res!266618 () Bool)

(assert (=> b!448511 (=> (not res!266618) (not e!263138))))

(declare-fun arrayContainsKey!0 (array!27758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448511 (= res!266618 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448512 () Bool)

(declare-fun res!266621 () Bool)

(assert (=> b!448512 (=> (not res!266621) (not e!263138))))

(assert (=> b!448512 (= res!266621 (and (= (size!13677 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13676 _keys!709) (size!13677 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40614 res!266628) b!448509))

(assert (= (and b!448509 res!266623) b!448512))

(assert (= (and b!448512 res!266621) b!448503))

(assert (= (and b!448503 res!266617) b!448502))

(assert (= (and b!448502 res!266620) b!448499))

(assert (= (and b!448499 res!266626) b!448504))

(assert (= (and b!448504 res!266624) b!448498))

(assert (= (and b!448498 res!266622) b!448511))

(assert (= (and b!448511 res!266618) b!448505))

(assert (= (and b!448505 res!266619) b!448510))

(assert (= (and b!448510 res!266627) b!448507))

(assert (= (and b!448507 res!266625) b!448508))

(assert (= (and b!448501 condMapEmpty!19599) mapIsEmpty!19599))

(assert (= (and b!448501 (not condMapEmpty!19599)) mapNonEmpty!19599))

(get-info :version)

(assert (= (and mapNonEmpty!19599 ((_ is ValueCellFull!5645) mapValue!19599)) b!448506))

(assert (= (and b!448501 ((_ is ValueCellFull!5645) mapDefault!19599)) b!448500))

(assert (= start!40614 b!448501))

(declare-fun m!433281 () Bool)

(assert (=> b!448508 m!433281))

(declare-fun m!433283 () Bool)

(assert (=> b!448508 m!433283))

(declare-fun m!433285 () Bool)

(assert (=> b!448508 m!433285))

(declare-fun m!433287 () Bool)

(assert (=> b!448509 m!433287))

(declare-fun m!433289 () Bool)

(assert (=> b!448502 m!433289))

(declare-fun m!433291 () Bool)

(assert (=> b!448511 m!433291))

(declare-fun m!433293 () Bool)

(assert (=> mapNonEmpty!19599 m!433293))

(declare-fun m!433295 () Bool)

(assert (=> b!448510 m!433295))

(declare-fun m!433297 () Bool)

(assert (=> b!448504 m!433297))

(declare-fun m!433299 () Bool)

(assert (=> b!448503 m!433299))

(declare-fun m!433301 () Bool)

(assert (=> start!40614 m!433301))

(declare-fun m!433303 () Bool)

(assert (=> start!40614 m!433303))

(declare-fun m!433305 () Bool)

(assert (=> b!448498 m!433305))

(declare-fun m!433307 () Bool)

(assert (=> b!448505 m!433307))

(declare-fun m!433309 () Bool)

(assert (=> b!448505 m!433309))

(check-sat tp_is_empty!11977 (not b!448510) (not b_next!10639) (not b!448509) (not b!448502) (not mapNonEmpty!19599) b_and!18661 (not start!40614) (not b!448504) (not b!448511) (not b!448508) (not b!448503) (not b!448505))
(check-sat b_and!18661 (not b_next!10639))
