; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40196 () Bool)

(assert start!40196)

(declare-fun b_free!10477 () Bool)

(declare-fun b_next!10477 () Bool)

(assert (=> start!40196 (= b_free!10477 (not b_next!10477))))

(declare-fun tp!36959 () Bool)

(declare-fun b_and!18459 () Bool)

(assert (=> start!40196 (= tp!36959 b_and!18459)))

(declare-fun b!440755 () Bool)

(declare-fun res!260792 () Bool)

(declare-fun e!259620 () Bool)

(assert (=> b!440755 (=> (not res!260792) (not e!259620))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440755 (= res!260792 (validKeyInArray!0 k0!794))))

(declare-fun b!440756 () Bool)

(declare-fun res!260796 () Bool)

(assert (=> b!440756 (=> (not res!260796) (not e!259620))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27078 0))(
  ( (array!27079 (arr!12988 (Array (_ BitVec 32) (_ BitVec 64))) (size!13340 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27078)

(assert (=> b!440756 (= res!260796 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13340 _keys!709))))))

(declare-fun b!440757 () Bool)

(declare-fun res!260801 () Bool)

(assert (=> b!440757 (=> (not res!260801) (not e!259620))))

(declare-fun arrayContainsKey!0 (array!27078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440757 (= res!260801 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19065 () Bool)

(declare-fun mapRes!19065 () Bool)

(declare-fun tp!36960 () Bool)

(declare-fun e!259619 () Bool)

(assert (=> mapNonEmpty!19065 (= mapRes!19065 (and tp!36960 e!259619))))

(declare-datatypes ((V!16611 0))(
  ( (V!16612 (val!5859 Int)) )
))
(declare-datatypes ((ValueCell!5471 0))(
  ( (ValueCellFull!5471 (v!8107 V!16611)) (EmptyCell!5471) )
))
(declare-fun mapValue!19065 () ValueCell!5471)

(declare-fun mapRest!19065 () (Array (_ BitVec 32) ValueCell!5471))

(declare-datatypes ((array!27080 0))(
  ( (array!27081 (arr!12989 (Array (_ BitVec 32) ValueCell!5471)) (size!13341 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27080)

(declare-fun mapKey!19065 () (_ BitVec 32))

(assert (=> mapNonEmpty!19065 (= (arr!12989 _values!549) (store mapRest!19065 mapKey!19065 mapValue!19065))))

(declare-fun b!440758 () Bool)

(declare-fun res!260799 () Bool)

(assert (=> b!440758 (=> (not res!260799) (not e!259620))))

(assert (=> b!440758 (= res!260799 (or (= (select (arr!12988 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12988 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440759 () Bool)

(declare-fun e!259618 () Bool)

(declare-fun tp_is_empty!11629 () Bool)

(assert (=> b!440759 (= e!259618 tp_is_empty!11629)))

(declare-fun b!440760 () Bool)

(assert (=> b!440760 (= e!259619 tp_is_empty!11629)))

(declare-fun mapIsEmpty!19065 () Bool)

(assert (=> mapIsEmpty!19065 mapRes!19065))

(declare-fun b!440762 () Bool)

(declare-fun res!260797 () Bool)

(declare-fun e!259621 () Bool)

(assert (=> b!440762 (=> (not res!260797) (not e!259621))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440762 (= res!260797 (bvsle from!863 i!563))))

(declare-fun b!440763 () Bool)

(declare-fun res!260790 () Bool)

(assert (=> b!440763 (=> (not res!260790) (not e!259620))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!440763 (= res!260790 (and (= (size!13341 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13340 _keys!709) (size!13341 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440764 () Bool)

(declare-fun res!260793 () Bool)

(assert (=> b!440764 (=> (not res!260793) (not e!259620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27078 (_ BitVec 32)) Bool)

(assert (=> b!440764 (= res!260793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440765 () Bool)

(assert (=> b!440765 (= e!259620 e!259621)))

(declare-fun res!260800 () Bool)

(assert (=> b!440765 (=> (not res!260800) (not e!259621))))

(declare-fun lt!202716 () array!27078)

(assert (=> b!440765 (= res!260800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202716 mask!1025))))

(assert (=> b!440765 (= lt!202716 (array!27079 (store (arr!12988 _keys!709) i!563 k0!794) (size!13340 _keys!709)))))

(declare-fun b!440766 () Bool)

(declare-fun res!260795 () Bool)

(assert (=> b!440766 (=> (not res!260795) (not e!259620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440766 (= res!260795 (validMask!0 mask!1025))))

(declare-fun b!440767 () Bool)

(declare-fun res!260798 () Bool)

(assert (=> b!440767 (=> (not res!260798) (not e!259620))))

(declare-datatypes ((List!7683 0))(
  ( (Nil!7680) (Cons!7679 (h!8535 (_ BitVec 64)) (t!13431 List!7683)) )
))
(declare-fun arrayNoDuplicates!0 (array!27078 (_ BitVec 32) List!7683) Bool)

(assert (=> b!440767 (= res!260798 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7680))))

(declare-fun b!440768 () Bool)

(declare-fun e!259623 () Bool)

(assert (=> b!440768 (= e!259623 (and e!259618 mapRes!19065))))

(declare-fun condMapEmpty!19065 () Bool)

(declare-fun mapDefault!19065 () ValueCell!5471)

(assert (=> b!440768 (= condMapEmpty!19065 (= (arr!12989 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5471)) mapDefault!19065)))))

(declare-fun b!440769 () Bool)

(declare-fun e!259622 () Bool)

(assert (=> b!440769 (= e!259621 e!259622)))

(declare-fun res!260802 () Bool)

(assert (=> b!440769 (=> (not res!260802) (not e!259622))))

(assert (=> b!440769 (= res!260802 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7694 0))(
  ( (tuple2!7695 (_1!3858 (_ BitVec 64)) (_2!3858 V!16611)) )
))
(declare-datatypes ((List!7684 0))(
  ( (Nil!7681) (Cons!7680 (h!8536 tuple2!7694) (t!13432 List!7684)) )
))
(declare-datatypes ((ListLongMap!6609 0))(
  ( (ListLongMap!6610 (toList!3320 List!7684)) )
))
(declare-fun lt!202715 () ListLongMap!6609)

(declare-fun minValue!515 () V!16611)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!202718 () array!27080)

(declare-fun zeroValue!515 () V!16611)

(declare-fun getCurrentListMapNoExtraKeys!1553 (array!27078 array!27080 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) Int) ListLongMap!6609)

(assert (=> b!440769 (= lt!202715 (getCurrentListMapNoExtraKeys!1553 lt!202716 lt!202718 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16611)

(assert (=> b!440769 (= lt!202718 (array!27081 (store (arr!12989 _values!549) i!563 (ValueCellFull!5471 v!412)) (size!13341 _values!549)))))

(declare-fun lt!202719 () ListLongMap!6609)

(assert (=> b!440769 (= lt!202719 (getCurrentListMapNoExtraKeys!1553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440770 () Bool)

(declare-fun res!260794 () Bool)

(assert (=> b!440770 (=> (not res!260794) (not e!259621))))

(assert (=> b!440770 (= res!260794 (arrayNoDuplicates!0 lt!202716 #b00000000000000000000000000000000 Nil!7680))))

(declare-fun res!260791 () Bool)

(assert (=> start!40196 (=> (not res!260791) (not e!259620))))

(assert (=> start!40196 (= res!260791 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13340 _keys!709))))))

(assert (=> start!40196 e!259620))

(assert (=> start!40196 tp_is_empty!11629))

(assert (=> start!40196 tp!36959))

(assert (=> start!40196 true))

(declare-fun array_inv!9492 (array!27080) Bool)

(assert (=> start!40196 (and (array_inv!9492 _values!549) e!259623)))

(declare-fun array_inv!9493 (array!27078) Bool)

(assert (=> start!40196 (array_inv!9493 _keys!709)))

(declare-fun b!440761 () Bool)

(assert (=> b!440761 (= e!259622 (not true))))

(declare-fun +!1511 (ListLongMap!6609 tuple2!7694) ListLongMap!6609)

(assert (=> b!440761 (= (getCurrentListMapNoExtraKeys!1553 lt!202716 lt!202718 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1511 (getCurrentListMapNoExtraKeys!1553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7695 k0!794 v!412)))))

(declare-datatypes ((Unit!13097 0))(
  ( (Unit!13098) )
))
(declare-fun lt!202717 () Unit!13097)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!671 (array!27078 array!27080 (_ BitVec 32) (_ BitVec 32) V!16611 V!16611 (_ BitVec 32) (_ BitVec 64) V!16611 (_ BitVec 32) Int) Unit!13097)

(assert (=> b!440761 (= lt!202717 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!671 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40196 res!260791) b!440766))

(assert (= (and b!440766 res!260795) b!440763))

(assert (= (and b!440763 res!260790) b!440764))

(assert (= (and b!440764 res!260793) b!440767))

(assert (= (and b!440767 res!260798) b!440756))

(assert (= (and b!440756 res!260796) b!440755))

(assert (= (and b!440755 res!260792) b!440758))

(assert (= (and b!440758 res!260799) b!440757))

(assert (= (and b!440757 res!260801) b!440765))

(assert (= (and b!440765 res!260800) b!440770))

(assert (= (and b!440770 res!260794) b!440762))

(assert (= (and b!440762 res!260797) b!440769))

(assert (= (and b!440769 res!260802) b!440761))

(assert (= (and b!440768 condMapEmpty!19065) mapIsEmpty!19065))

(assert (= (and b!440768 (not condMapEmpty!19065)) mapNonEmpty!19065))

(get-info :version)

(assert (= (and mapNonEmpty!19065 ((_ is ValueCellFull!5471) mapValue!19065)) b!440760))

(assert (= (and b!440768 ((_ is ValueCellFull!5471) mapDefault!19065)) b!440759))

(assert (= start!40196 b!440768))

(declare-fun m!427991 () Bool)

(assert (=> b!440769 m!427991))

(declare-fun m!427993 () Bool)

(assert (=> b!440769 m!427993))

(declare-fun m!427995 () Bool)

(assert (=> b!440769 m!427995))

(declare-fun m!427997 () Bool)

(assert (=> b!440764 m!427997))

(declare-fun m!427999 () Bool)

(assert (=> b!440766 m!427999))

(declare-fun m!428001 () Bool)

(assert (=> b!440765 m!428001))

(declare-fun m!428003 () Bool)

(assert (=> b!440765 m!428003))

(declare-fun m!428005 () Bool)

(assert (=> start!40196 m!428005))

(declare-fun m!428007 () Bool)

(assert (=> start!40196 m!428007))

(declare-fun m!428009 () Bool)

(assert (=> b!440757 m!428009))

(declare-fun m!428011 () Bool)

(assert (=> b!440758 m!428011))

(declare-fun m!428013 () Bool)

(assert (=> b!440770 m!428013))

(declare-fun m!428015 () Bool)

(assert (=> b!440767 m!428015))

(declare-fun m!428017 () Bool)

(assert (=> b!440761 m!428017))

(declare-fun m!428019 () Bool)

(assert (=> b!440761 m!428019))

(assert (=> b!440761 m!428019))

(declare-fun m!428021 () Bool)

(assert (=> b!440761 m!428021))

(declare-fun m!428023 () Bool)

(assert (=> b!440761 m!428023))

(declare-fun m!428025 () Bool)

(assert (=> mapNonEmpty!19065 m!428025))

(declare-fun m!428027 () Bool)

(assert (=> b!440755 m!428027))

(check-sat (not b!440766) (not b!440755) (not b!440764) (not b!440761) (not b!440765) b_and!18459 (not b!440767) (not b_next!10477) (not b!440769) (not start!40196) (not b!440757) (not b!440770) tp_is_empty!11629 (not mapNonEmpty!19065))
(check-sat b_and!18459 (not b_next!10477))
