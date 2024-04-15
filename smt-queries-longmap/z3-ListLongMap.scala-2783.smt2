; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40572 () Bool)

(assert start!40572)

(declare-fun b_free!10597 () Bool)

(declare-fun b_next!10597 () Bool)

(assert (=> start!40572 (= b_free!10597 (not b_next!10597))))

(declare-fun tp!37611 () Bool)

(declare-fun b_and!18579 () Bool)

(assert (=> start!40572 (= tp!37611 b_and!18579)))

(declare-fun b!447331 () Bool)

(declare-fun res!265736 () Bool)

(declare-fun e!262619 () Bool)

(assert (=> b!447331 (=> (not res!265736) (not e!262619))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447331 (= res!265736 (validKeyInArray!0 k0!794))))

(declare-fun b!447332 () Bool)

(declare-fun res!265741 () Bool)

(assert (=> b!447332 (=> (not res!265741) (not e!262619))))

(declare-datatypes ((array!27677 0))(
  ( (array!27678 (arr!13284 (Array (_ BitVec 32) (_ BitVec 64))) (size!13637 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27677)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27677 (_ BitVec 32)) Bool)

(assert (=> b!447332 (= res!265741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447333 () Bool)

(declare-fun res!265742 () Bool)

(assert (=> b!447333 (=> (not res!265742) (not e!262619))))

(declare-fun arrayContainsKey!0 (array!27677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447333 (= res!265742 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447334 () Bool)

(declare-fun e!262617 () Bool)

(assert (=> b!447334 (= e!262619 e!262617)))

(declare-fun res!265746 () Bool)

(assert (=> b!447334 (=> (not res!265746) (not e!262617))))

(declare-fun lt!203764 () array!27677)

(assert (=> b!447334 (= res!265746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203764 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447334 (= lt!203764 (array!27678 (store (arr!13284 _keys!709) i!563 k0!794) (size!13637 _keys!709)))))

(declare-fun b!447335 () Bool)

(declare-fun res!265740 () Bool)

(assert (=> b!447335 (=> (not res!265740) (not e!262617))))

(declare-datatypes ((List!7953 0))(
  ( (Nil!7950) (Cons!7949 (h!8805 (_ BitVec 64)) (t!13706 List!7953)) )
))
(declare-fun arrayNoDuplicates!0 (array!27677 (_ BitVec 32) List!7953) Bool)

(assert (=> b!447335 (= res!265740 (arrayNoDuplicates!0 lt!203764 #b00000000000000000000000000000000 Nil!7950))))

(declare-fun b!447336 () Bool)

(declare-fun res!265738 () Bool)

(assert (=> b!447336 (=> (not res!265738) (not e!262619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447336 (= res!265738 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19536 () Bool)

(declare-fun mapRes!19536 () Bool)

(assert (=> mapIsEmpty!19536 mapRes!19536))

(declare-fun res!265737 () Bool)

(assert (=> start!40572 (=> (not res!265737) (not e!262619))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40572 (= res!265737 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13637 _keys!709))))))

(assert (=> start!40572 e!262619))

(declare-fun tp_is_empty!11935 () Bool)

(assert (=> start!40572 tp_is_empty!11935))

(assert (=> start!40572 tp!37611))

(assert (=> start!40572 true))

(declare-datatypes ((V!17019 0))(
  ( (V!17020 (val!6012 Int)) )
))
(declare-datatypes ((ValueCell!5624 0))(
  ( (ValueCellFull!5624 (v!8261 V!17019)) (EmptyCell!5624) )
))
(declare-datatypes ((array!27679 0))(
  ( (array!27680 (arr!13285 (Array (_ BitVec 32) ValueCell!5624)) (size!13638 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27679)

(declare-fun e!262622 () Bool)

(declare-fun array_inv!9682 (array!27679) Bool)

(assert (=> start!40572 (and (array_inv!9682 _values!549) e!262622)))

(declare-fun array_inv!9683 (array!27677) Bool)

(assert (=> start!40572 (array_inv!9683 _keys!709)))

(declare-fun mapNonEmpty!19536 () Bool)

(declare-fun tp!37610 () Bool)

(declare-fun e!262618 () Bool)

(assert (=> mapNonEmpty!19536 (= mapRes!19536 (and tp!37610 e!262618))))

(declare-fun mapValue!19536 () ValueCell!5624)

(declare-fun mapRest!19536 () (Array (_ BitVec 32) ValueCell!5624))

(declare-fun mapKey!19536 () (_ BitVec 32))

(assert (=> mapNonEmpty!19536 (= (arr!13285 _values!549) (store mapRest!19536 mapKey!19536 mapValue!19536))))

(declare-fun b!447337 () Bool)

(declare-fun res!265745 () Bool)

(assert (=> b!447337 (=> (not res!265745) (not e!262619))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447337 (= res!265745 (and (= (size!13638 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13637 _keys!709) (size!13638 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447338 () Bool)

(assert (=> b!447338 (= e!262618 tp_is_empty!11935)))

(declare-fun b!447339 () Bool)

(declare-fun e!262621 () Bool)

(assert (=> b!447339 (= e!262621 tp_is_empty!11935)))

(declare-fun b!447340 () Bool)

(assert (=> b!447340 (= e!262617 false)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7892 0))(
  ( (tuple2!7893 (_1!3957 (_ BitVec 64)) (_2!3957 V!17019)) )
))
(declare-datatypes ((List!7954 0))(
  ( (Nil!7951) (Cons!7950 (h!8806 tuple2!7892) (t!13707 List!7954)) )
))
(declare-datatypes ((ListLongMap!6795 0))(
  ( (ListLongMap!6796 (toList!3413 List!7954)) )
))
(declare-fun lt!203766 () ListLongMap!6795)

(declare-fun zeroValue!515 () V!17019)

(declare-fun v!412 () V!17019)

(declare-fun minValue!515 () V!17019)

(declare-fun getCurrentListMapNoExtraKeys!1611 (array!27677 array!27679 (_ BitVec 32) (_ BitVec 32) V!17019 V!17019 (_ BitVec 32) Int) ListLongMap!6795)

(assert (=> b!447340 (= lt!203766 (getCurrentListMapNoExtraKeys!1611 lt!203764 (array!27680 (store (arr!13285 _values!549) i!563 (ValueCellFull!5624 v!412)) (size!13638 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203765 () ListLongMap!6795)

(assert (=> b!447340 (= lt!203765 (getCurrentListMapNoExtraKeys!1611 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447341 () Bool)

(declare-fun res!265743 () Bool)

(assert (=> b!447341 (=> (not res!265743) (not e!262619))))

(assert (=> b!447341 (= res!265743 (or (= (select (arr!13284 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13284 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447342 () Bool)

(assert (=> b!447342 (= e!262622 (and e!262621 mapRes!19536))))

(declare-fun condMapEmpty!19536 () Bool)

(declare-fun mapDefault!19536 () ValueCell!5624)

(assert (=> b!447342 (= condMapEmpty!19536 (= (arr!13285 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5624)) mapDefault!19536)))))

(declare-fun b!447343 () Bool)

(declare-fun res!265744 () Bool)

(assert (=> b!447343 (=> (not res!265744) (not e!262619))))

(assert (=> b!447343 (= res!265744 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7950))))

(declare-fun b!447344 () Bool)

(declare-fun res!265735 () Bool)

(assert (=> b!447344 (=> (not res!265735) (not e!262617))))

(assert (=> b!447344 (= res!265735 (bvsle from!863 i!563))))

(declare-fun b!447345 () Bool)

(declare-fun res!265739 () Bool)

(assert (=> b!447345 (=> (not res!265739) (not e!262619))))

(assert (=> b!447345 (= res!265739 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13637 _keys!709))))))

(assert (= (and start!40572 res!265737) b!447336))

(assert (= (and b!447336 res!265738) b!447337))

(assert (= (and b!447337 res!265745) b!447332))

(assert (= (and b!447332 res!265741) b!447343))

(assert (= (and b!447343 res!265744) b!447345))

(assert (= (and b!447345 res!265739) b!447331))

(assert (= (and b!447331 res!265736) b!447341))

(assert (= (and b!447341 res!265743) b!447333))

(assert (= (and b!447333 res!265742) b!447334))

(assert (= (and b!447334 res!265746) b!447335))

(assert (= (and b!447335 res!265740) b!447344))

(assert (= (and b!447344 res!265735) b!447340))

(assert (= (and b!447342 condMapEmpty!19536) mapIsEmpty!19536))

(assert (= (and b!447342 (not condMapEmpty!19536)) mapNonEmpty!19536))

(get-info :version)

(assert (= (and mapNonEmpty!19536 ((_ is ValueCellFull!5624) mapValue!19536)) b!447338))

(assert (= (and b!447342 ((_ is ValueCellFull!5624) mapDefault!19536)) b!447339))

(assert (= start!40572 b!447342))

(declare-fun m!431701 () Bool)

(assert (=> b!447331 m!431701))

(declare-fun m!431703 () Bool)

(assert (=> b!447343 m!431703))

(declare-fun m!431705 () Bool)

(assert (=> b!447336 m!431705))

(declare-fun m!431707 () Bool)

(assert (=> b!447332 m!431707))

(declare-fun m!431709 () Bool)

(assert (=> start!40572 m!431709))

(declare-fun m!431711 () Bool)

(assert (=> start!40572 m!431711))

(declare-fun m!431713 () Bool)

(assert (=> b!447340 m!431713))

(declare-fun m!431715 () Bool)

(assert (=> b!447340 m!431715))

(declare-fun m!431717 () Bool)

(assert (=> b!447340 m!431717))

(declare-fun m!431719 () Bool)

(assert (=> b!447335 m!431719))

(declare-fun m!431721 () Bool)

(assert (=> b!447333 m!431721))

(declare-fun m!431723 () Bool)

(assert (=> b!447341 m!431723))

(declare-fun m!431725 () Bool)

(assert (=> mapNonEmpty!19536 m!431725))

(declare-fun m!431727 () Bool)

(assert (=> b!447334 m!431727))

(declare-fun m!431729 () Bool)

(assert (=> b!447334 m!431729))

(check-sat (not b!447333) (not b!447332) (not b!447343) b_and!18579 (not b!447334) (not b!447340) (not b!447336) (not b!447331) (not start!40572) (not mapNonEmpty!19536) (not b!447335) (not b_next!10597) tp_is_empty!11935)
(check-sat b_and!18579 (not b_next!10597))
