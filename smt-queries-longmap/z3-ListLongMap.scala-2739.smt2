; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40238 () Bool)

(assert start!40238)

(declare-fun b_free!10519 () Bool)

(declare-fun b_next!10519 () Bool)

(assert (=> start!40238 (= b_free!10519 (not b_next!10519))))

(declare-fun tp!37085 () Bool)

(declare-fun b_and!18501 () Bool)

(assert (=> start!40238 (= tp!37085 b_and!18501)))

(declare-fun b!441763 () Bool)

(declare-fun res!261612 () Bool)

(declare-fun e!260062 () Bool)

(assert (=> b!441763 (=> (not res!261612) (not e!260062))))

(declare-datatypes ((array!27160 0))(
  ( (array!27161 (arr!13029 (Array (_ BitVec 32) (_ BitVec 64))) (size!13381 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27160)

(declare-datatypes ((List!7720 0))(
  ( (Nil!7717) (Cons!7716 (h!8572 (_ BitVec 64)) (t!13468 List!7720)) )
))
(declare-fun arrayNoDuplicates!0 (array!27160 (_ BitVec 32) List!7720) Bool)

(assert (=> b!441763 (= res!261612 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7717))))

(declare-fun res!261611 () Bool)

(assert (=> start!40238 (=> (not res!261611) (not e!260062))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40238 (= res!261611 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13381 _keys!709))))))

(assert (=> start!40238 e!260062))

(declare-fun tp_is_empty!11671 () Bool)

(assert (=> start!40238 tp_is_empty!11671))

(assert (=> start!40238 tp!37085))

(assert (=> start!40238 true))

(declare-datatypes ((V!16667 0))(
  ( (V!16668 (val!5880 Int)) )
))
(declare-datatypes ((ValueCell!5492 0))(
  ( (ValueCellFull!5492 (v!8128 V!16667)) (EmptyCell!5492) )
))
(declare-datatypes ((array!27162 0))(
  ( (array!27163 (arr!13030 (Array (_ BitVec 32) ValueCell!5492)) (size!13382 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27162)

(declare-fun e!260065 () Bool)

(declare-fun array_inv!9522 (array!27162) Bool)

(assert (=> start!40238 (and (array_inv!9522 _values!549) e!260065)))

(declare-fun array_inv!9523 (array!27160) Bool)

(assert (=> start!40238 (array_inv!9523 _keys!709)))

(declare-fun b!441764 () Bool)

(declare-fun e!260064 () Bool)

(assert (=> b!441764 (= e!260062 e!260064)))

(declare-fun res!261610 () Bool)

(assert (=> b!441764 (=> (not res!261610) (not e!260064))))

(declare-fun lt!203033 () array!27160)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27160 (_ BitVec 32)) Bool)

(assert (=> b!441764 (= res!261610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203033 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441764 (= lt!203033 (array!27161 (store (arr!13029 _keys!709) i!563 k0!794) (size!13381 _keys!709)))))

(declare-fun mapNonEmpty!19128 () Bool)

(declare-fun mapRes!19128 () Bool)

(declare-fun tp!37086 () Bool)

(declare-fun e!260061 () Bool)

(assert (=> mapNonEmpty!19128 (= mapRes!19128 (and tp!37086 e!260061))))

(declare-fun mapKey!19128 () (_ BitVec 32))

(declare-fun mapRest!19128 () (Array (_ BitVec 32) ValueCell!5492))

(declare-fun mapValue!19128 () ValueCell!5492)

(assert (=> mapNonEmpty!19128 (= (arr!13030 _values!549) (store mapRest!19128 mapKey!19128 mapValue!19128))))

(declare-fun mapIsEmpty!19128 () Bool)

(assert (=> mapIsEmpty!19128 mapRes!19128))

(declare-fun b!441765 () Bool)

(declare-fun res!261613 () Bool)

(assert (=> b!441765 (=> (not res!261613) (not e!260064))))

(assert (=> b!441765 (= res!261613 (arrayNoDuplicates!0 lt!203033 #b00000000000000000000000000000000 Nil!7717))))

(declare-fun b!441766 () Bool)

(declare-fun res!261616 () Bool)

(assert (=> b!441766 (=> (not res!261616) (not e!260064))))

(assert (=> b!441766 (= res!261616 (bvsle from!863 i!563))))

(declare-fun b!441767 () Bool)

(declare-fun res!261618 () Bool)

(assert (=> b!441767 (=> (not res!261618) (not e!260062))))

(declare-fun arrayContainsKey!0 (array!27160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441767 (= res!261618 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441768 () Bool)

(declare-fun res!261619 () Bool)

(assert (=> b!441768 (=> (not res!261619) (not e!260062))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441768 (= res!261619 (and (= (size!13382 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13381 _keys!709) (size!13382 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441769 () Bool)

(declare-fun res!261614 () Bool)

(assert (=> b!441769 (=> (not res!261614) (not e!260062))))

(assert (=> b!441769 (= res!261614 (or (= (select (arr!13029 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13029 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441770 () Bool)

(assert (=> b!441770 (= e!260061 tp_is_empty!11671)))

(declare-fun b!441771 () Bool)

(declare-fun res!261620 () Bool)

(assert (=> b!441771 (=> (not res!261620) (not e!260062))))

(assert (=> b!441771 (= res!261620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441772 () Bool)

(declare-fun res!261617 () Bool)

(assert (=> b!441772 (=> (not res!261617) (not e!260062))))

(assert (=> b!441772 (= res!261617 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13381 _keys!709))))))

(declare-fun b!441773 () Bool)

(declare-fun e!260059 () Bool)

(assert (=> b!441773 (= e!260059 tp_is_empty!11671)))

(declare-fun b!441774 () Bool)

(declare-fun e!260060 () Bool)

(assert (=> b!441774 (= e!260060 (not true))))

(declare-fun minValue!515 () V!16667)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16667)

(declare-fun lt!203034 () array!27162)

(declare-fun v!412 () V!16667)

(declare-datatypes ((tuple2!7730 0))(
  ( (tuple2!7731 (_1!3876 (_ BitVec 64)) (_2!3876 V!16667)) )
))
(declare-datatypes ((List!7721 0))(
  ( (Nil!7718) (Cons!7717 (h!8573 tuple2!7730) (t!13469 List!7721)) )
))
(declare-datatypes ((ListLongMap!6645 0))(
  ( (ListLongMap!6646 (toList!3338 List!7721)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1571 (array!27160 array!27162 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) Int) ListLongMap!6645)

(declare-fun +!1524 (ListLongMap!6645 tuple2!7730) ListLongMap!6645)

(assert (=> b!441774 (= (getCurrentListMapNoExtraKeys!1571 lt!203033 lt!203034 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1524 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7731 k0!794 v!412)))))

(declare-datatypes ((Unit!13123 0))(
  ( (Unit!13124) )
))
(declare-fun lt!203031 () Unit!13123)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!684 (array!27160 array!27162 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) (_ BitVec 64) V!16667 (_ BitVec 32) Int) Unit!13123)

(assert (=> b!441774 (= lt!203031 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!684 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441775 () Bool)

(assert (=> b!441775 (= e!260065 (and e!260059 mapRes!19128))))

(declare-fun condMapEmpty!19128 () Bool)

(declare-fun mapDefault!19128 () ValueCell!5492)

(assert (=> b!441775 (= condMapEmpty!19128 (= (arr!13030 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5492)) mapDefault!19128)))))

(declare-fun b!441776 () Bool)

(assert (=> b!441776 (= e!260064 e!260060)))

(declare-fun res!261615 () Bool)

(assert (=> b!441776 (=> (not res!261615) (not e!260060))))

(assert (=> b!441776 (= res!261615 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!203030 () ListLongMap!6645)

(assert (=> b!441776 (= lt!203030 (getCurrentListMapNoExtraKeys!1571 lt!203033 lt!203034 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441776 (= lt!203034 (array!27163 (store (arr!13030 _values!549) i!563 (ValueCellFull!5492 v!412)) (size!13382 _values!549)))))

(declare-fun lt!203032 () ListLongMap!6645)

(assert (=> b!441776 (= lt!203032 (getCurrentListMapNoExtraKeys!1571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441777 () Bool)

(declare-fun res!261609 () Bool)

(assert (=> b!441777 (=> (not res!261609) (not e!260062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441777 (= res!261609 (validKeyInArray!0 k0!794))))

(declare-fun b!441778 () Bool)

(declare-fun res!261621 () Bool)

(assert (=> b!441778 (=> (not res!261621) (not e!260062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441778 (= res!261621 (validMask!0 mask!1025))))

(assert (= (and start!40238 res!261611) b!441778))

(assert (= (and b!441778 res!261621) b!441768))

(assert (= (and b!441768 res!261619) b!441771))

(assert (= (and b!441771 res!261620) b!441763))

(assert (= (and b!441763 res!261612) b!441772))

(assert (= (and b!441772 res!261617) b!441777))

(assert (= (and b!441777 res!261609) b!441769))

(assert (= (and b!441769 res!261614) b!441767))

(assert (= (and b!441767 res!261618) b!441764))

(assert (= (and b!441764 res!261610) b!441765))

(assert (= (and b!441765 res!261613) b!441766))

(assert (= (and b!441766 res!261616) b!441776))

(assert (= (and b!441776 res!261615) b!441774))

(assert (= (and b!441775 condMapEmpty!19128) mapIsEmpty!19128))

(assert (= (and b!441775 (not condMapEmpty!19128)) mapNonEmpty!19128))

(get-info :version)

(assert (= (and mapNonEmpty!19128 ((_ is ValueCellFull!5492) mapValue!19128)) b!441770))

(assert (= (and b!441775 ((_ is ValueCellFull!5492) mapDefault!19128)) b!441773))

(assert (= start!40238 b!441775))

(declare-fun m!428789 () Bool)

(assert (=> start!40238 m!428789))

(declare-fun m!428791 () Bool)

(assert (=> start!40238 m!428791))

(declare-fun m!428793 () Bool)

(assert (=> b!441778 m!428793))

(declare-fun m!428795 () Bool)

(assert (=> b!441763 m!428795))

(declare-fun m!428797 () Bool)

(assert (=> b!441771 m!428797))

(declare-fun m!428799 () Bool)

(assert (=> b!441776 m!428799))

(declare-fun m!428801 () Bool)

(assert (=> b!441776 m!428801))

(declare-fun m!428803 () Bool)

(assert (=> b!441776 m!428803))

(declare-fun m!428805 () Bool)

(assert (=> b!441767 m!428805))

(declare-fun m!428807 () Bool)

(assert (=> b!441764 m!428807))

(declare-fun m!428809 () Bool)

(assert (=> b!441764 m!428809))

(declare-fun m!428811 () Bool)

(assert (=> b!441774 m!428811))

(declare-fun m!428813 () Bool)

(assert (=> b!441774 m!428813))

(assert (=> b!441774 m!428813))

(declare-fun m!428815 () Bool)

(assert (=> b!441774 m!428815))

(declare-fun m!428817 () Bool)

(assert (=> b!441774 m!428817))

(declare-fun m!428819 () Bool)

(assert (=> b!441765 m!428819))

(declare-fun m!428821 () Bool)

(assert (=> b!441769 m!428821))

(declare-fun m!428823 () Bool)

(assert (=> b!441777 m!428823))

(declare-fun m!428825 () Bool)

(assert (=> mapNonEmpty!19128 m!428825))

(check-sat (not b!441776) (not b!441777) (not b!441767) (not b!441765) b_and!18501 (not b!441774) (not b!441778) (not b!441763) (not start!40238) tp_is_empty!11671 (not b!441771) (not b!441764) (not mapNonEmpty!19128) (not b_next!10519))
(check-sat b_and!18501 (not b_next!10519))
