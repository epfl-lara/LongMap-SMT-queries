; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40672 () Bool)

(assert start!40672)

(declare-fun b_free!10683 () Bool)

(declare-fun b_next!10683 () Bool)

(assert (=> start!40672 (= b_free!10683 (not b_next!10683))))

(declare-fun tp!37868 () Bool)

(declare-fun b_and!18691 () Bool)

(assert (=> start!40672 (= tp!37868 b_and!18691)))

(declare-fun b!449537 () Bool)

(declare-fun res!267422 () Bool)

(declare-fun e!263565 () Bool)

(assert (=> b!449537 (=> (not res!267422) (not e!263565))))

(declare-datatypes ((array!27849 0))(
  ( (array!27850 (arr!13370 (Array (_ BitVec 32) (_ BitVec 64))) (size!13722 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27849)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449537 (= res!267422 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449538 () Bool)

(declare-fun res!267415 () Bool)

(assert (=> b!449538 (=> (not res!267415) (not e!263565))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27849 (_ BitVec 32)) Bool)

(assert (=> b!449538 (= res!267415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449539 () Bool)

(declare-fun res!267421 () Bool)

(assert (=> b!449539 (=> (not res!267421) (not e!263565))))

(declare-datatypes ((List!8017 0))(
  ( (Nil!8014) (Cons!8013 (h!8869 (_ BitVec 64)) (t!13779 List!8017)) )
))
(declare-fun arrayNoDuplicates!0 (array!27849 (_ BitVec 32) List!8017) Bool)

(assert (=> b!449539 (= res!267421 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8014))))

(declare-fun res!267423 () Bool)

(assert (=> start!40672 (=> (not res!267423) (not e!263565))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40672 (= res!267423 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13722 _keys!709))))))

(assert (=> start!40672 e!263565))

(declare-fun tp_is_empty!12021 () Bool)

(assert (=> start!40672 tp_is_empty!12021))

(assert (=> start!40672 tp!37868))

(assert (=> start!40672 true))

(declare-datatypes ((V!17133 0))(
  ( (V!17134 (val!6055 Int)) )
))
(declare-datatypes ((ValueCell!5667 0))(
  ( (ValueCellFull!5667 (v!8310 V!17133)) (EmptyCell!5667) )
))
(declare-datatypes ((array!27851 0))(
  ( (array!27852 (arr!13371 (Array (_ BitVec 32) ValueCell!5667)) (size!13723 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27851)

(declare-fun e!263566 () Bool)

(declare-fun array_inv!9686 (array!27851) Bool)

(assert (=> start!40672 (and (array_inv!9686 _values!549) e!263566)))

(declare-fun array_inv!9687 (array!27849) Bool)

(assert (=> start!40672 (array_inv!9687 _keys!709)))

(declare-fun b!449540 () Bool)

(declare-fun e!263570 () Bool)

(assert (=> b!449540 (= e!263565 e!263570)))

(declare-fun res!267416 () Bool)

(assert (=> b!449540 (=> (not res!267416) (not e!263570))))

(declare-fun lt!204385 () array!27849)

(assert (=> b!449540 (= res!267416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204385 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449540 (= lt!204385 (array!27850 (store (arr!13370 _keys!709) i!563 k0!794) (size!13722 _keys!709)))))

(declare-fun b!449541 () Bool)

(declare-fun res!267413 () Bool)

(assert (=> b!449541 (=> (not res!267413) (not e!263565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449541 (= res!267413 (validKeyInArray!0 k0!794))))

(declare-fun b!449542 () Bool)

(declare-fun res!267414 () Bool)

(assert (=> b!449542 (=> (not res!267414) (not e!263565))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449542 (= res!267414 (and (= (size!13723 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13722 _keys!709) (size!13723 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19665 () Bool)

(declare-fun mapRes!19665 () Bool)

(assert (=> mapIsEmpty!19665 mapRes!19665))

(declare-fun b!449543 () Bool)

(declare-fun res!267412 () Bool)

(assert (=> b!449543 (=> (not res!267412) (not e!263565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449543 (= res!267412 (validMask!0 mask!1025))))

(declare-fun b!449544 () Bool)

(assert (=> b!449544 (= e!263570 false)))

(declare-fun minValue!515 () V!17133)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17133)

(declare-datatypes ((tuple2!7952 0))(
  ( (tuple2!7953 (_1!3987 (_ BitVec 64)) (_2!3987 V!17133)) )
))
(declare-datatypes ((List!8018 0))(
  ( (Nil!8015) (Cons!8014 (h!8870 tuple2!7952) (t!13780 List!8018)) )
))
(declare-datatypes ((ListLongMap!6865 0))(
  ( (ListLongMap!6866 (toList!3448 List!8018)) )
))
(declare-fun lt!204386 () ListLongMap!6865)

(declare-fun v!412 () V!17133)

(declare-fun getCurrentListMapNoExtraKeys!1634 (array!27849 array!27851 (_ BitVec 32) (_ BitVec 32) V!17133 V!17133 (_ BitVec 32) Int) ListLongMap!6865)

(assert (=> b!449544 (= lt!204386 (getCurrentListMapNoExtraKeys!1634 lt!204385 (array!27852 (store (arr!13371 _values!549) i!563 (ValueCellFull!5667 v!412)) (size!13723 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204387 () ListLongMap!6865)

(assert (=> b!449544 (= lt!204387 (getCurrentListMapNoExtraKeys!1634 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449545 () Bool)

(declare-fun res!267418 () Bool)

(assert (=> b!449545 (=> (not res!267418) (not e!263565))))

(assert (=> b!449545 (= res!267418 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13722 _keys!709))))))

(declare-fun b!449546 () Bool)

(declare-fun res!267419 () Bool)

(assert (=> b!449546 (=> (not res!267419) (not e!263570))))

(assert (=> b!449546 (= res!267419 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19665 () Bool)

(declare-fun tp!37869 () Bool)

(declare-fun e!263567 () Bool)

(assert (=> mapNonEmpty!19665 (= mapRes!19665 (and tp!37869 e!263567))))

(declare-fun mapRest!19665 () (Array (_ BitVec 32) ValueCell!5667))

(declare-fun mapValue!19665 () ValueCell!5667)

(declare-fun mapKey!19665 () (_ BitVec 32))

(assert (=> mapNonEmpty!19665 (= (arr!13371 _values!549) (store mapRest!19665 mapKey!19665 mapValue!19665))))

(declare-fun b!449547 () Bool)

(assert (=> b!449547 (= e!263567 tp_is_empty!12021)))

(declare-fun b!449548 () Bool)

(declare-fun e!263568 () Bool)

(assert (=> b!449548 (= e!263566 (and e!263568 mapRes!19665))))

(declare-fun condMapEmpty!19665 () Bool)

(declare-fun mapDefault!19665 () ValueCell!5667)

(assert (=> b!449548 (= condMapEmpty!19665 (= (arr!13371 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5667)) mapDefault!19665)))))

(declare-fun b!449549 () Bool)

(declare-fun res!267417 () Bool)

(assert (=> b!449549 (=> (not res!267417) (not e!263570))))

(assert (=> b!449549 (= res!267417 (arrayNoDuplicates!0 lt!204385 #b00000000000000000000000000000000 Nil!8014))))

(declare-fun b!449550 () Bool)

(assert (=> b!449550 (= e!263568 tp_is_empty!12021)))

(declare-fun b!449551 () Bool)

(declare-fun res!267420 () Bool)

(assert (=> b!449551 (=> (not res!267420) (not e!263565))))

(assert (=> b!449551 (= res!267420 (or (= (select (arr!13370 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13370 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40672 res!267423) b!449543))

(assert (= (and b!449543 res!267412) b!449542))

(assert (= (and b!449542 res!267414) b!449538))

(assert (= (and b!449538 res!267415) b!449539))

(assert (= (and b!449539 res!267421) b!449545))

(assert (= (and b!449545 res!267418) b!449541))

(assert (= (and b!449541 res!267413) b!449551))

(assert (= (and b!449551 res!267420) b!449537))

(assert (= (and b!449537 res!267422) b!449540))

(assert (= (and b!449540 res!267416) b!449549))

(assert (= (and b!449549 res!267417) b!449546))

(assert (= (and b!449546 res!267419) b!449544))

(assert (= (and b!449548 condMapEmpty!19665) mapIsEmpty!19665))

(assert (= (and b!449548 (not condMapEmpty!19665)) mapNonEmpty!19665))

(get-info :version)

(assert (= (and mapNonEmpty!19665 ((_ is ValueCellFull!5667) mapValue!19665)) b!449547))

(assert (= (and b!449548 ((_ is ValueCellFull!5667) mapDefault!19665)) b!449550))

(assert (= start!40672 b!449548))

(declare-fun m!433723 () Bool)

(assert (=> b!449537 m!433723))

(declare-fun m!433725 () Bool)

(assert (=> b!449540 m!433725))

(declare-fun m!433727 () Bool)

(assert (=> b!449540 m!433727))

(declare-fun m!433729 () Bool)

(assert (=> b!449541 m!433729))

(declare-fun m!433731 () Bool)

(assert (=> b!449551 m!433731))

(declare-fun m!433733 () Bool)

(assert (=> b!449544 m!433733))

(declare-fun m!433735 () Bool)

(assert (=> b!449544 m!433735))

(declare-fun m!433737 () Bool)

(assert (=> b!449544 m!433737))

(declare-fun m!433739 () Bool)

(assert (=> mapNonEmpty!19665 m!433739))

(declare-fun m!433741 () Bool)

(assert (=> b!449539 m!433741))

(declare-fun m!433743 () Bool)

(assert (=> start!40672 m!433743))

(declare-fun m!433745 () Bool)

(assert (=> start!40672 m!433745))

(declare-fun m!433747 () Bool)

(assert (=> b!449543 m!433747))

(declare-fun m!433749 () Bool)

(assert (=> b!449549 m!433749))

(declare-fun m!433751 () Bool)

(assert (=> b!449538 m!433751))

(check-sat (not start!40672) (not b!449538) (not b_next!10683) (not b!449549) tp_is_empty!12021 (not b!449541) (not b!449543) (not b!449540) (not b!449537) (not b!449544) (not mapNonEmpty!19665) b_and!18691 (not b!449539))
(check-sat b_and!18691 (not b_next!10683))
