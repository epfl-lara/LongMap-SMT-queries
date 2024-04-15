; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40238 () Bool)

(assert start!40238)

(declare-fun b_free!10519 () Bool)

(declare-fun b_next!10519 () Bool)

(assert (=> start!40238 (= b_free!10519 (not b_next!10519))))

(declare-fun tp!37085 () Bool)

(declare-fun b_and!18461 () Bool)

(assert (=> start!40238 (= tp!37085 b_and!18461)))

(declare-fun b!441541 () Bool)

(declare-fun res!261493 () Bool)

(declare-fun e!259918 () Bool)

(assert (=> b!441541 (=> (not res!261493) (not e!259918))))

(declare-datatypes ((array!27155 0))(
  ( (array!27156 (arr!13027 (Array (_ BitVec 32) (_ BitVec 64))) (size!13380 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27155)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441541 (= res!261493 (or (= (select (arr!13027 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13027 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19128 () Bool)

(declare-fun mapRes!19128 () Bool)

(declare-fun tp!37086 () Bool)

(declare-fun e!259919 () Bool)

(assert (=> mapNonEmpty!19128 (= mapRes!19128 (and tp!37086 e!259919))))

(declare-datatypes ((V!16667 0))(
  ( (V!16668 (val!5880 Int)) )
))
(declare-datatypes ((ValueCell!5492 0))(
  ( (ValueCellFull!5492 (v!8121 V!16667)) (EmptyCell!5492) )
))
(declare-datatypes ((array!27157 0))(
  ( (array!27158 (arr!13028 (Array (_ BitVec 32) ValueCell!5492)) (size!13381 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27157)

(declare-fun mapRest!19128 () (Array (_ BitVec 32) ValueCell!5492))

(declare-fun mapValue!19128 () ValueCell!5492)

(declare-fun mapKey!19128 () (_ BitVec 32))

(assert (=> mapNonEmpty!19128 (= (arr!13028 _values!549) (store mapRest!19128 mapKey!19128 mapValue!19128))))

(declare-fun b!441542 () Bool)

(declare-fun res!261484 () Bool)

(assert (=> b!441542 (=> (not res!261484) (not e!259918))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441542 (= res!261484 (and (= (size!13381 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13380 _keys!709) (size!13381 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441543 () Bool)

(declare-fun res!261491 () Bool)

(assert (=> b!441543 (=> (not res!261491) (not e!259918))))

(assert (=> b!441543 (= res!261491 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13380 _keys!709))))))

(declare-fun b!441544 () Bool)

(declare-fun e!259917 () Bool)

(declare-fun tp_is_empty!11671 () Bool)

(assert (=> b!441544 (= e!259917 tp_is_empty!11671)))

(declare-fun b!441545 () Bool)

(declare-fun res!261483 () Bool)

(assert (=> b!441545 (=> (not res!261483) (not e!259918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27155 (_ BitVec 32)) Bool)

(assert (=> b!441545 (= res!261483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441546 () Bool)

(declare-fun res!261488 () Bool)

(assert (=> b!441546 (=> (not res!261488) (not e!259918))))

(declare-datatypes ((List!7821 0))(
  ( (Nil!7818) (Cons!7817 (h!8673 (_ BitVec 64)) (t!13568 List!7821)) )
))
(declare-fun arrayNoDuplicates!0 (array!27155 (_ BitVec 32) List!7821) Bool)

(assert (=> b!441546 (= res!261488 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7818))))

(declare-fun mapIsEmpty!19128 () Bool)

(assert (=> mapIsEmpty!19128 mapRes!19128))

(declare-fun b!441547 () Bool)

(declare-fun e!259921 () Bool)

(assert (=> b!441547 (= e!259921 (and e!259917 mapRes!19128))))

(declare-fun condMapEmpty!19128 () Bool)

(declare-fun mapDefault!19128 () ValueCell!5492)

(assert (=> b!441547 (= condMapEmpty!19128 (= (arr!13028 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5492)) mapDefault!19128)))))

(declare-fun b!441548 () Bool)

(declare-fun res!261494 () Bool)

(assert (=> b!441548 (=> (not res!261494) (not e!259918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441548 (= res!261494 (validMask!0 mask!1025))))

(declare-fun b!441549 () Bool)

(declare-fun res!261485 () Bool)

(assert (=> b!441549 (=> (not res!261485) (not e!259918))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441549 (= res!261485 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441550 () Bool)

(declare-fun res!261487 () Bool)

(assert (=> b!441550 (=> (not res!261487) (not e!259918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441550 (= res!261487 (validKeyInArray!0 k0!794))))

(declare-fun b!441551 () Bool)

(declare-fun res!261492 () Bool)

(declare-fun e!259920 () Bool)

(assert (=> b!441551 (=> (not res!261492) (not e!259920))))

(declare-fun lt!202781 () array!27155)

(assert (=> b!441551 (= res!261492 (arrayNoDuplicates!0 lt!202781 #b00000000000000000000000000000000 Nil!7818))))

(declare-fun b!441552 () Bool)

(declare-fun e!259922 () Bool)

(assert (=> b!441552 (= e!259920 e!259922)))

(declare-fun res!261495 () Bool)

(assert (=> b!441552 (=> (not res!261495) (not e!259922))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441552 (= res!261495 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16667)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7836 0))(
  ( (tuple2!7837 (_1!3929 (_ BitVec 64)) (_2!3929 V!16667)) )
))
(declare-datatypes ((List!7822 0))(
  ( (Nil!7819) (Cons!7818 (h!8674 tuple2!7836) (t!13569 List!7822)) )
))
(declare-datatypes ((ListLongMap!6739 0))(
  ( (ListLongMap!6740 (toList!3385 List!7822)) )
))
(declare-fun lt!202777 () ListLongMap!6739)

(declare-fun zeroValue!515 () V!16667)

(declare-fun lt!202779 () array!27157)

(declare-fun getCurrentListMapNoExtraKeys!1584 (array!27155 array!27157 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) Int) ListLongMap!6739)

(assert (=> b!441552 (= lt!202777 (getCurrentListMapNoExtraKeys!1584 lt!202781 lt!202779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16667)

(assert (=> b!441552 (= lt!202779 (array!27158 (store (arr!13028 _values!549) i!563 (ValueCellFull!5492 v!412)) (size!13381 _values!549)))))

(declare-fun lt!202778 () ListLongMap!6739)

(assert (=> b!441552 (= lt!202778 (getCurrentListMapNoExtraKeys!1584 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441553 () Bool)

(assert (=> b!441553 (= e!259919 tp_is_empty!11671)))

(declare-fun b!441554 () Bool)

(assert (=> b!441554 (= e!259922 (not true))))

(declare-fun +!1545 (ListLongMap!6739 tuple2!7836) ListLongMap!6739)

(assert (=> b!441554 (= (getCurrentListMapNoExtraKeys!1584 lt!202781 lt!202779 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1545 (getCurrentListMapNoExtraKeys!1584 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7837 k0!794 v!412)))))

(declare-datatypes ((Unit!13107 0))(
  ( (Unit!13108) )
))
(declare-fun lt!202780 () Unit!13107)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!683 (array!27155 array!27157 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) (_ BitVec 64) V!16667 (_ BitVec 32) Int) Unit!13107)

(assert (=> b!441554 (= lt!202780 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!683 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441555 () Bool)

(assert (=> b!441555 (= e!259918 e!259920)))

(declare-fun res!261490 () Bool)

(assert (=> b!441555 (=> (not res!261490) (not e!259920))))

(assert (=> b!441555 (= res!261490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202781 mask!1025))))

(assert (=> b!441555 (= lt!202781 (array!27156 (store (arr!13027 _keys!709) i!563 k0!794) (size!13380 _keys!709)))))

(declare-fun res!261489 () Bool)

(assert (=> start!40238 (=> (not res!261489) (not e!259918))))

(assert (=> start!40238 (= res!261489 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13380 _keys!709))))))

(assert (=> start!40238 e!259918))

(assert (=> start!40238 tp_is_empty!11671))

(assert (=> start!40238 tp!37085))

(assert (=> start!40238 true))

(declare-fun array_inv!9498 (array!27157) Bool)

(assert (=> start!40238 (and (array_inv!9498 _values!549) e!259921)))

(declare-fun array_inv!9499 (array!27155) Bool)

(assert (=> start!40238 (array_inv!9499 _keys!709)))

(declare-fun b!441556 () Bool)

(declare-fun res!261486 () Bool)

(assert (=> b!441556 (=> (not res!261486) (not e!259920))))

(assert (=> b!441556 (= res!261486 (bvsle from!863 i!563))))

(assert (= (and start!40238 res!261489) b!441548))

(assert (= (and b!441548 res!261494) b!441542))

(assert (= (and b!441542 res!261484) b!441545))

(assert (= (and b!441545 res!261483) b!441546))

(assert (= (and b!441546 res!261488) b!441543))

(assert (= (and b!441543 res!261491) b!441550))

(assert (= (and b!441550 res!261487) b!441541))

(assert (= (and b!441541 res!261493) b!441549))

(assert (= (and b!441549 res!261485) b!441555))

(assert (= (and b!441555 res!261490) b!441551))

(assert (= (and b!441551 res!261492) b!441556))

(assert (= (and b!441556 res!261486) b!441552))

(assert (= (and b!441552 res!261495) b!441554))

(assert (= (and b!441547 condMapEmpty!19128) mapIsEmpty!19128))

(assert (= (and b!441547 (not condMapEmpty!19128)) mapNonEmpty!19128))

(get-info :version)

(assert (= (and mapNonEmpty!19128 ((_ is ValueCellFull!5492) mapValue!19128)) b!441553))

(assert (= (and b!441547 ((_ is ValueCellFull!5492) mapDefault!19128)) b!441544))

(assert (= start!40238 b!441547))

(declare-fun m!427839 () Bool)

(assert (=> start!40238 m!427839))

(declare-fun m!427841 () Bool)

(assert (=> start!40238 m!427841))

(declare-fun m!427843 () Bool)

(assert (=> mapNonEmpty!19128 m!427843))

(declare-fun m!427845 () Bool)

(assert (=> b!441548 m!427845))

(declare-fun m!427847 () Bool)

(assert (=> b!441550 m!427847))

(declare-fun m!427849 () Bool)

(assert (=> b!441554 m!427849))

(declare-fun m!427851 () Bool)

(assert (=> b!441554 m!427851))

(assert (=> b!441554 m!427851))

(declare-fun m!427853 () Bool)

(assert (=> b!441554 m!427853))

(declare-fun m!427855 () Bool)

(assert (=> b!441554 m!427855))

(declare-fun m!427857 () Bool)

(assert (=> b!441551 m!427857))

(declare-fun m!427859 () Bool)

(assert (=> b!441555 m!427859))

(declare-fun m!427861 () Bool)

(assert (=> b!441555 m!427861))

(declare-fun m!427863 () Bool)

(assert (=> b!441552 m!427863))

(declare-fun m!427865 () Bool)

(assert (=> b!441552 m!427865))

(declare-fun m!427867 () Bool)

(assert (=> b!441552 m!427867))

(declare-fun m!427869 () Bool)

(assert (=> b!441541 m!427869))

(declare-fun m!427871 () Bool)

(assert (=> b!441545 m!427871))

(declare-fun m!427873 () Bool)

(assert (=> b!441546 m!427873))

(declare-fun m!427875 () Bool)

(assert (=> b!441549 m!427875))

(check-sat (not start!40238) b_and!18461 tp_is_empty!11671 (not b_next!10519) (not b!441554) (not b!441550) (not b!441549) (not b!441552) (not b!441555) (not b!441551) (not b!441548) (not b!441546) (not b!441545) (not mapNonEmpty!19128))
(check-sat b_and!18461 (not b_next!10519))
