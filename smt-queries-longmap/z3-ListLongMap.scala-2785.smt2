; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40584 () Bool)

(assert start!40584)

(declare-fun b_free!10609 () Bool)

(declare-fun b_next!10609 () Bool)

(assert (=> start!40584 (= b_free!10609 (not b_next!10609))))

(declare-fun tp!37647 () Bool)

(declare-fun b_and!18591 () Bool)

(assert (=> start!40584 (= tp!37647 b_and!18591)))

(declare-fun b!447601 () Bool)

(declare-fun e!262725 () Bool)

(declare-fun e!262727 () Bool)

(assert (=> b!447601 (= e!262725 e!262727)))

(declare-fun res!265953 () Bool)

(assert (=> b!447601 (=> (not res!265953) (not e!262727))))

(declare-datatypes ((array!27699 0))(
  ( (array!27700 (arr!13295 (Array (_ BitVec 32) (_ BitVec 64))) (size!13648 (_ BitVec 32))) )
))
(declare-fun lt!203818 () array!27699)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27699 (_ BitVec 32)) Bool)

(assert (=> b!447601 (= res!265953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203818 mask!1025))))

(declare-fun _keys!709 () array!27699)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447601 (= lt!203818 (array!27700 (store (arr!13295 _keys!709) i!563 k0!794) (size!13648 _keys!709)))))

(declare-fun b!447602 () Bool)

(declare-fun e!262726 () Bool)

(declare-fun tp_is_empty!11947 () Bool)

(assert (=> b!447602 (= e!262726 tp_is_empty!11947)))

(declare-fun b!447603 () Bool)

(declare-fun res!265957 () Bool)

(assert (=> b!447603 (=> (not res!265957) (not e!262725))))

(assert (=> b!447603 (= res!265957 (or (= (select (arr!13295 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13295 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447604 () Bool)

(declare-fun res!265954 () Bool)

(assert (=> b!447604 (=> (not res!265954) (not e!262725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447604 (= res!265954 (validMask!0 mask!1025))))

(declare-fun b!447605 () Bool)

(declare-fun res!265959 () Bool)

(assert (=> b!447605 (=> (not res!265959) (not e!262725))))

(declare-fun arrayContainsKey!0 (array!27699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447605 (= res!265959 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447606 () Bool)

(declare-fun res!265960 () Bool)

(assert (=> b!447606 (=> (not res!265960) (not e!262725))))

(assert (=> b!447606 (= res!265960 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13648 _keys!709))))))

(declare-fun b!447607 () Bool)

(declare-fun res!265962 () Bool)

(assert (=> b!447607 (=> (not res!265962) (not e!262727))))

(declare-datatypes ((List!7962 0))(
  ( (Nil!7959) (Cons!7958 (h!8814 (_ BitVec 64)) (t!13715 List!7962)) )
))
(declare-fun arrayNoDuplicates!0 (array!27699 (_ BitVec 32) List!7962) Bool)

(assert (=> b!447607 (= res!265962 (arrayNoDuplicates!0 lt!203818 #b00000000000000000000000000000000 Nil!7959))))

(declare-fun res!265955 () Bool)

(assert (=> start!40584 (=> (not res!265955) (not e!262725))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40584 (= res!265955 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13648 _keys!709))))))

(assert (=> start!40584 e!262725))

(assert (=> start!40584 tp_is_empty!11947))

(assert (=> start!40584 tp!37647))

(assert (=> start!40584 true))

(declare-datatypes ((V!17035 0))(
  ( (V!17036 (val!6018 Int)) )
))
(declare-datatypes ((ValueCell!5630 0))(
  ( (ValueCellFull!5630 (v!8267 V!17035)) (EmptyCell!5630) )
))
(declare-datatypes ((array!27701 0))(
  ( (array!27702 (arr!13296 (Array (_ BitVec 32) ValueCell!5630)) (size!13649 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27701)

(declare-fun e!262730 () Bool)

(declare-fun array_inv!9690 (array!27701) Bool)

(assert (=> start!40584 (and (array_inv!9690 _values!549) e!262730)))

(declare-fun array_inv!9691 (array!27699) Bool)

(assert (=> start!40584 (array_inv!9691 _keys!709)))

(declare-fun b!447608 () Bool)

(declare-fun res!265956 () Bool)

(assert (=> b!447608 (=> (not res!265956) (not e!262727))))

(assert (=> b!447608 (= res!265956 (bvsle from!863 i!563))))

(declare-fun b!447609 () Bool)

(assert (=> b!447609 (= e!262727 false)))

(declare-fun minValue!515 () V!17035)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17035)

(declare-datatypes ((tuple2!7902 0))(
  ( (tuple2!7903 (_1!3962 (_ BitVec 64)) (_2!3962 V!17035)) )
))
(declare-datatypes ((List!7963 0))(
  ( (Nil!7960) (Cons!7959 (h!8815 tuple2!7902) (t!13716 List!7963)) )
))
(declare-datatypes ((ListLongMap!6805 0))(
  ( (ListLongMap!6806 (toList!3418 List!7963)) )
))
(declare-fun lt!203819 () ListLongMap!6805)

(declare-fun v!412 () V!17035)

(declare-fun getCurrentListMapNoExtraKeys!1616 (array!27699 array!27701 (_ BitVec 32) (_ BitVec 32) V!17035 V!17035 (_ BitVec 32) Int) ListLongMap!6805)

(assert (=> b!447609 (= lt!203819 (getCurrentListMapNoExtraKeys!1616 lt!203818 (array!27702 (store (arr!13296 _values!549) i!563 (ValueCellFull!5630 v!412)) (size!13649 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203820 () ListLongMap!6805)

(assert (=> b!447609 (= lt!203820 (getCurrentListMapNoExtraKeys!1616 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19554 () Bool)

(declare-fun mapRes!19554 () Bool)

(declare-fun tp!37646 () Bool)

(assert (=> mapNonEmpty!19554 (= mapRes!19554 (and tp!37646 e!262726))))

(declare-fun mapRest!19554 () (Array (_ BitVec 32) ValueCell!5630))

(declare-fun mapKey!19554 () (_ BitVec 32))

(declare-fun mapValue!19554 () ValueCell!5630)

(assert (=> mapNonEmpty!19554 (= (arr!13296 _values!549) (store mapRest!19554 mapKey!19554 mapValue!19554))))

(declare-fun b!447610 () Bool)

(declare-fun e!262728 () Bool)

(assert (=> b!447610 (= e!262730 (and e!262728 mapRes!19554))))

(declare-fun condMapEmpty!19554 () Bool)

(declare-fun mapDefault!19554 () ValueCell!5630)

(assert (=> b!447610 (= condMapEmpty!19554 (= (arr!13296 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5630)) mapDefault!19554)))))

(declare-fun b!447611 () Bool)

(declare-fun res!265952 () Bool)

(assert (=> b!447611 (=> (not res!265952) (not e!262725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447611 (= res!265952 (validKeyInArray!0 k0!794))))

(declare-fun b!447612 () Bool)

(assert (=> b!447612 (= e!262728 tp_is_empty!11947)))

(declare-fun b!447613 () Bool)

(declare-fun res!265951 () Bool)

(assert (=> b!447613 (=> (not res!265951) (not e!262725))))

(assert (=> b!447613 (= res!265951 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7959))))

(declare-fun b!447614 () Bool)

(declare-fun res!265961 () Bool)

(assert (=> b!447614 (=> (not res!265961) (not e!262725))))

(assert (=> b!447614 (= res!265961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447615 () Bool)

(declare-fun res!265958 () Bool)

(assert (=> b!447615 (=> (not res!265958) (not e!262725))))

(assert (=> b!447615 (= res!265958 (and (= (size!13649 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13648 _keys!709) (size!13649 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19554 () Bool)

(assert (=> mapIsEmpty!19554 mapRes!19554))

(assert (= (and start!40584 res!265955) b!447604))

(assert (= (and b!447604 res!265954) b!447615))

(assert (= (and b!447615 res!265958) b!447614))

(assert (= (and b!447614 res!265961) b!447613))

(assert (= (and b!447613 res!265951) b!447606))

(assert (= (and b!447606 res!265960) b!447611))

(assert (= (and b!447611 res!265952) b!447603))

(assert (= (and b!447603 res!265957) b!447605))

(assert (= (and b!447605 res!265959) b!447601))

(assert (= (and b!447601 res!265953) b!447607))

(assert (= (and b!447607 res!265962) b!447608))

(assert (= (and b!447608 res!265956) b!447609))

(assert (= (and b!447610 condMapEmpty!19554) mapIsEmpty!19554))

(assert (= (and b!447610 (not condMapEmpty!19554)) mapNonEmpty!19554))

(get-info :version)

(assert (= (and mapNonEmpty!19554 ((_ is ValueCellFull!5630) mapValue!19554)) b!447602))

(assert (= (and b!447610 ((_ is ValueCellFull!5630) mapDefault!19554)) b!447612))

(assert (= start!40584 b!447610))

(declare-fun m!431881 () Bool)

(assert (=> b!447604 m!431881))

(declare-fun m!431883 () Bool)

(assert (=> start!40584 m!431883))

(declare-fun m!431885 () Bool)

(assert (=> start!40584 m!431885))

(declare-fun m!431887 () Bool)

(assert (=> b!447601 m!431887))

(declare-fun m!431889 () Bool)

(assert (=> b!447601 m!431889))

(declare-fun m!431891 () Bool)

(assert (=> b!447607 m!431891))

(declare-fun m!431893 () Bool)

(assert (=> mapNonEmpty!19554 m!431893))

(declare-fun m!431895 () Bool)

(assert (=> b!447605 m!431895))

(declare-fun m!431897 () Bool)

(assert (=> b!447611 m!431897))

(declare-fun m!431899 () Bool)

(assert (=> b!447613 m!431899))

(declare-fun m!431901 () Bool)

(assert (=> b!447614 m!431901))

(declare-fun m!431903 () Bool)

(assert (=> b!447603 m!431903))

(declare-fun m!431905 () Bool)

(assert (=> b!447609 m!431905))

(declare-fun m!431907 () Bool)

(assert (=> b!447609 m!431907))

(declare-fun m!431909 () Bool)

(assert (=> b!447609 m!431909))

(check-sat tp_is_empty!11947 (not b!447601) (not mapNonEmpty!19554) (not start!40584) (not b!447609) (not b!447607) (not b!447605) (not b_next!10609) b_and!18591 (not b!447613) (not b!447611) (not b!447604) (not b!447614))
(check-sat b_and!18591 (not b_next!10609))
