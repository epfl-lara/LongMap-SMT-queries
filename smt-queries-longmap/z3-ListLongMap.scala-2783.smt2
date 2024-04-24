; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40572 () Bool)

(assert start!40572)

(declare-fun b_free!10597 () Bool)

(declare-fun b_next!10597 () Bool)

(assert (=> start!40572 (= b_free!10597 (not b_next!10597))))

(declare-fun tp!37610 () Bool)

(declare-fun b_and!18619 () Bool)

(assert (=> start!40572 (= tp!37610 b_and!18619)))

(declare-fun b!447553 () Bool)

(declare-fun res!265863 () Bool)

(declare-fun e!262760 () Bool)

(assert (=> b!447553 (=> (not res!265863) (not e!262760))))

(declare-datatypes ((array!27678 0))(
  ( (array!27679 (arr!13284 (Array (_ BitVec 32) (_ BitVec 64))) (size!13636 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27678)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17019 0))(
  ( (V!17020 (val!6012 Int)) )
))
(declare-datatypes ((ValueCell!5624 0))(
  ( (ValueCellFull!5624 (v!8268 V!17019)) (EmptyCell!5624) )
))
(declare-datatypes ((array!27680 0))(
  ( (array!27681 (arr!13285 (Array (_ BitVec 32) ValueCell!5624)) (size!13637 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27680)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447553 (= res!265863 (and (= (size!13637 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13636 _keys!709) (size!13637 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447554 () Bool)

(declare-fun res!265865 () Bool)

(assert (=> b!447554 (=> (not res!265865) (not e!262760))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447554 (= res!265865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13636 _keys!709))))))

(declare-fun b!447555 () Bool)

(declare-fun e!262761 () Bool)

(declare-fun tp_is_empty!11935 () Bool)

(assert (=> b!447555 (= e!262761 tp_is_empty!11935)))

(declare-fun res!265862 () Bool)

(assert (=> start!40572 (=> (not res!265862) (not e!262760))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40572 (= res!265862 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13636 _keys!709))))))

(assert (=> start!40572 e!262760))

(assert (=> start!40572 tp_is_empty!11935))

(assert (=> start!40572 tp!37610))

(assert (=> start!40572 true))

(declare-fun e!262763 () Bool)

(declare-fun array_inv!9710 (array!27680) Bool)

(assert (=> start!40572 (and (array_inv!9710 _values!549) e!262763)))

(declare-fun array_inv!9711 (array!27678) Bool)

(assert (=> start!40572 (array_inv!9711 _keys!709)))

(declare-fun b!447556 () Bool)

(declare-fun res!265864 () Bool)

(assert (=> b!447556 (=> (not res!265864) (not e!262760))))

(assert (=> b!447556 (= res!265864 (or (= (select (arr!13284 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13284 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447557 () Bool)

(declare-fun res!265872 () Bool)

(declare-fun e!262762 () Bool)

(assert (=> b!447557 (=> (not res!265872) (not e!262762))))

(declare-fun lt!204017 () array!27678)

(declare-datatypes ((List!7862 0))(
  ( (Nil!7859) (Cons!7858 (h!8714 (_ BitVec 64)) (t!13616 List!7862)) )
))
(declare-fun arrayNoDuplicates!0 (array!27678 (_ BitVec 32) List!7862) Bool)

(assert (=> b!447557 (= res!265872 (arrayNoDuplicates!0 lt!204017 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!447558 () Bool)

(declare-fun res!265871 () Bool)

(assert (=> b!447558 (=> (not res!265871) (not e!262760))))

(assert (=> b!447558 (= res!265871 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!447559 () Bool)

(assert (=> b!447559 (= e!262762 false)))

(declare-fun minValue!515 () V!17019)

(declare-fun zeroValue!515 () V!17019)

(declare-fun v!412 () V!17019)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7790 0))(
  ( (tuple2!7791 (_1!3906 (_ BitVec 64)) (_2!3906 V!17019)) )
))
(declare-datatypes ((List!7863 0))(
  ( (Nil!7860) (Cons!7859 (h!8715 tuple2!7790) (t!13617 List!7863)) )
))
(declare-datatypes ((ListLongMap!6705 0))(
  ( (ListLongMap!6706 (toList!3368 List!7863)) )
))
(declare-fun lt!204018 () ListLongMap!6705)

(declare-fun getCurrentListMapNoExtraKeys!1598 (array!27678 array!27680 (_ BitVec 32) (_ BitVec 32) V!17019 V!17019 (_ BitVec 32) Int) ListLongMap!6705)

(assert (=> b!447559 (= lt!204018 (getCurrentListMapNoExtraKeys!1598 lt!204017 (array!27681 (store (arr!13285 _values!549) i!563 (ValueCellFull!5624 v!412)) (size!13637 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204019 () ListLongMap!6705)

(assert (=> b!447559 (= lt!204019 (getCurrentListMapNoExtraKeys!1598 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447560 () Bool)

(declare-fun e!262759 () Bool)

(assert (=> b!447560 (= e!262759 tp_is_empty!11935)))

(declare-fun b!447561 () Bool)

(declare-fun mapRes!19536 () Bool)

(assert (=> b!447561 (= e!262763 (and e!262759 mapRes!19536))))

(declare-fun condMapEmpty!19536 () Bool)

(declare-fun mapDefault!19536 () ValueCell!5624)

(assert (=> b!447561 (= condMapEmpty!19536 (= (arr!13285 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5624)) mapDefault!19536)))))

(declare-fun mapIsEmpty!19536 () Bool)

(assert (=> mapIsEmpty!19536 mapRes!19536))

(declare-fun mapNonEmpty!19536 () Bool)

(declare-fun tp!37611 () Bool)

(assert (=> mapNonEmpty!19536 (= mapRes!19536 (and tp!37611 e!262761))))

(declare-fun mapKey!19536 () (_ BitVec 32))

(declare-fun mapRest!19536 () (Array (_ BitVec 32) ValueCell!5624))

(declare-fun mapValue!19536 () ValueCell!5624)

(assert (=> mapNonEmpty!19536 (= (arr!13285 _values!549) (store mapRest!19536 mapKey!19536 mapValue!19536))))

(declare-fun b!447562 () Bool)

(declare-fun res!265861 () Bool)

(assert (=> b!447562 (=> (not res!265861) (not e!262760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27678 (_ BitVec 32)) Bool)

(assert (=> b!447562 (= res!265861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447563 () Bool)

(declare-fun res!265866 () Bool)

(assert (=> b!447563 (=> (not res!265866) (not e!262762))))

(assert (=> b!447563 (= res!265866 (bvsle from!863 i!563))))

(declare-fun b!447564 () Bool)

(declare-fun res!265870 () Bool)

(assert (=> b!447564 (=> (not res!265870) (not e!262760))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447564 (= res!265870 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447565 () Bool)

(declare-fun res!265869 () Bool)

(assert (=> b!447565 (=> (not res!265869) (not e!262760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447565 (= res!265869 (validMask!0 mask!1025))))

(declare-fun b!447566 () Bool)

(assert (=> b!447566 (= e!262760 e!262762)))

(declare-fun res!265867 () Bool)

(assert (=> b!447566 (=> (not res!265867) (not e!262762))))

(assert (=> b!447566 (= res!265867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204017 mask!1025))))

(assert (=> b!447566 (= lt!204017 (array!27679 (store (arr!13284 _keys!709) i!563 k0!794) (size!13636 _keys!709)))))

(declare-fun b!447567 () Bool)

(declare-fun res!265868 () Bool)

(assert (=> b!447567 (=> (not res!265868) (not e!262760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447567 (= res!265868 (validKeyInArray!0 k0!794))))

(assert (= (and start!40572 res!265862) b!447565))

(assert (= (and b!447565 res!265869) b!447553))

(assert (= (and b!447553 res!265863) b!447562))

(assert (= (and b!447562 res!265861) b!447558))

(assert (= (and b!447558 res!265871) b!447554))

(assert (= (and b!447554 res!265865) b!447567))

(assert (= (and b!447567 res!265868) b!447556))

(assert (= (and b!447556 res!265864) b!447564))

(assert (= (and b!447564 res!265870) b!447566))

(assert (= (and b!447566 res!265867) b!447557))

(assert (= (and b!447557 res!265872) b!447563))

(assert (= (and b!447563 res!265866) b!447559))

(assert (= (and b!447561 condMapEmpty!19536) mapIsEmpty!19536))

(assert (= (and b!447561 (not condMapEmpty!19536)) mapNonEmpty!19536))

(get-info :version)

(assert (= (and mapNonEmpty!19536 ((_ is ValueCellFull!5624) mapValue!19536)) b!447555))

(assert (= (and b!447561 ((_ is ValueCellFull!5624) mapDefault!19536)) b!447560))

(assert (= start!40572 b!447561))

(declare-fun m!432651 () Bool)

(assert (=> b!447562 m!432651))

(declare-fun m!432653 () Bool)

(assert (=> b!447558 m!432653))

(declare-fun m!432655 () Bool)

(assert (=> b!447557 m!432655))

(declare-fun m!432657 () Bool)

(assert (=> mapNonEmpty!19536 m!432657))

(declare-fun m!432659 () Bool)

(assert (=> b!447559 m!432659))

(declare-fun m!432661 () Bool)

(assert (=> b!447559 m!432661))

(declare-fun m!432663 () Bool)

(assert (=> b!447559 m!432663))

(declare-fun m!432665 () Bool)

(assert (=> b!447567 m!432665))

(declare-fun m!432667 () Bool)

(assert (=> start!40572 m!432667))

(declare-fun m!432669 () Bool)

(assert (=> start!40572 m!432669))

(declare-fun m!432671 () Bool)

(assert (=> b!447564 m!432671))

(declare-fun m!432673 () Bool)

(assert (=> b!447565 m!432673))

(declare-fun m!432675 () Bool)

(assert (=> b!447556 m!432675))

(declare-fun m!432677 () Bool)

(assert (=> b!447566 m!432677))

(declare-fun m!432679 () Bool)

(assert (=> b!447566 m!432679))

(check-sat (not b!447564) tp_is_empty!11935 (not b!447558) (not start!40572) (not b!447559) (not b!447557) (not b!447567) b_and!18619 (not b!447562) (not b!447565) (not b_next!10597) (not mapNonEmpty!19536) (not b!447566))
(check-sat b_and!18619 (not b_next!10597))
