; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40474 () Bool)

(assert start!40474)

(declare-fun b_free!10545 () Bool)

(declare-fun b_next!10545 () Bool)

(assert (=> start!40474 (= b_free!10545 (not b_next!10545))))

(declare-fun tp!37413 () Bool)

(declare-fun b_and!18529 () Bool)

(assert (=> start!40474 (= tp!37413 b_and!18529)))

(declare-fun mapNonEmpty!19416 () Bool)

(declare-fun mapRes!19416 () Bool)

(declare-fun tp!37412 () Bool)

(declare-fun e!261923 () Bool)

(assert (=> mapNonEmpty!19416 (= mapRes!19416 (and tp!37412 e!261923))))

(declare-datatypes ((V!16917 0))(
  ( (V!16918 (val!5974 Int)) )
))
(declare-datatypes ((ValueCell!5586 0))(
  ( (ValueCellFull!5586 (v!8225 V!16917)) (EmptyCell!5586) )
))
(declare-fun mapRest!19416 () (Array (_ BitVec 32) ValueCell!5586))

(declare-fun mapValue!19416 () ValueCell!5586)

(declare-datatypes ((array!27525 0))(
  ( (array!27526 (arr!13210 (Array (_ BitVec 32) ValueCell!5586)) (size!13562 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27525)

(declare-fun mapKey!19416 () (_ BitVec 32))

(assert (=> mapNonEmpty!19416 (= (arr!13210 _values!549) (store mapRest!19416 mapKey!19416 mapValue!19416))))

(declare-fun b!445654 () Bool)

(declare-fun res!264460 () Bool)

(declare-fun e!261919 () Bool)

(assert (=> b!445654 (=> (not res!264460) (not e!261919))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445654 (= res!264460 (validMask!0 mask!1025))))

(declare-fun b!445655 () Bool)

(declare-fun e!261917 () Bool)

(declare-datatypes ((tuple2!7846 0))(
  ( (tuple2!7847 (_1!3934 (_ BitVec 64)) (_2!3934 V!16917)) )
))
(declare-datatypes ((List!7897 0))(
  ( (Nil!7894) (Cons!7893 (h!8749 tuple2!7846) (t!13655 List!7897)) )
))
(declare-datatypes ((ListLongMap!6759 0))(
  ( (ListLongMap!6760 (toList!3395 List!7897)) )
))
(declare-fun call!29592 () ListLongMap!6759)

(declare-fun call!29591 () ListLongMap!6759)

(assert (=> b!445655 (= e!261917 (= call!29592 call!29591))))

(declare-fun b!445656 () Bool)

(declare-fun res!264466 () Bool)

(assert (=> b!445656 (=> (not res!264466) (not e!261919))))

(declare-datatypes ((array!27527 0))(
  ( (array!27528 (arr!13211 (Array (_ BitVec 32) (_ BitVec 64))) (size!13563 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27527)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445656 (= res!264466 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445657 () Bool)

(declare-fun e!261918 () Bool)

(assert (=> b!445657 (= e!261919 e!261918)))

(declare-fun res!264469 () Bool)

(assert (=> b!445657 (=> (not res!264469) (not e!261918))))

(declare-fun lt!203659 () array!27527)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27527 (_ BitVec 32)) Bool)

(assert (=> b!445657 (= res!264469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203659 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445657 (= lt!203659 (array!27528 (store (arr!13211 _keys!709) i!563 k0!794) (size!13563 _keys!709)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29588 () Bool)

(declare-fun zeroValue!515 () V!16917)

(declare-fun v!412 () V!16917)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16917)

(declare-fun c!55863 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1583 (array!27527 array!27525 (_ BitVec 32) (_ BitVec 32) V!16917 V!16917 (_ BitVec 32) Int) ListLongMap!6759)

(assert (=> bm!29588 (= call!29591 (getCurrentListMapNoExtraKeys!1583 (ite c!55863 lt!203659 _keys!709) (ite c!55863 (array!27526 (store (arr!13210 _values!549) i!563 (ValueCellFull!5586 v!412)) (size!13562 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445658 () Bool)

(declare-fun e!261922 () Bool)

(declare-fun e!261921 () Bool)

(assert (=> b!445658 (= e!261922 (and e!261921 mapRes!19416))))

(declare-fun condMapEmpty!19416 () Bool)

(declare-fun mapDefault!19416 () ValueCell!5586)

(assert (=> b!445658 (= condMapEmpty!19416 (= (arr!13210 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5586)) mapDefault!19416)))))

(declare-fun b!445659 () Bool)

(declare-fun tp_is_empty!11859 () Bool)

(assert (=> b!445659 (= e!261921 tp_is_empty!11859)))

(declare-fun mapIsEmpty!19416 () Bool)

(assert (=> mapIsEmpty!19416 mapRes!19416))

(declare-fun b!445660 () Bool)

(declare-fun res!264464 () Bool)

(assert (=> b!445660 (=> (not res!264464) (not e!261919))))

(assert (=> b!445660 (= res!264464 (or (= (select (arr!13211 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13211 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445661 () Bool)

(assert (=> b!445661 (= e!261923 tp_is_empty!11859)))

(declare-fun b!445663 () Bool)

(declare-fun res!264463 () Bool)

(assert (=> b!445663 (=> (not res!264463) (not e!261919))))

(assert (=> b!445663 (= res!264463 (and (= (size!13562 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13563 _keys!709) (size!13562 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445664 () Bool)

(declare-fun +!1526 (ListLongMap!6759 tuple2!7846) ListLongMap!6759)

(assert (=> b!445664 (= e!261917 (= call!29591 (+!1526 call!29592 (tuple2!7847 k0!794 v!412))))))

(declare-fun b!445665 () Bool)

(declare-fun res!264465 () Bool)

(assert (=> b!445665 (=> (not res!264465) (not e!261919))))

(declare-datatypes ((List!7898 0))(
  ( (Nil!7895) (Cons!7894 (h!8750 (_ BitVec 64)) (t!13656 List!7898)) )
))
(declare-fun arrayNoDuplicates!0 (array!27527 (_ BitVec 32) List!7898) Bool)

(assert (=> b!445665 (= res!264465 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7895))))

(declare-fun b!445666 () Bool)

(declare-fun res!264462 () Bool)

(assert (=> b!445666 (=> (not res!264462) (not e!261918))))

(assert (=> b!445666 (= res!264462 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13563 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445667 () Bool)

(declare-fun res!264461 () Bool)

(assert (=> b!445667 (=> (not res!264461) (not e!261919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445667 (= res!264461 (validKeyInArray!0 k0!794))))

(declare-fun b!445668 () Bool)

(assert (=> b!445668 (= e!261918 (not true))))

(assert (=> b!445668 e!261917))

(assert (=> b!445668 (= c!55863 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13164 0))(
  ( (Unit!13165) )
))
(declare-fun lt!203660 () Unit!13164)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 (array!27527 array!27525 (_ BitVec 32) (_ BitVec 32) V!16917 V!16917 (_ BitVec 32) (_ BitVec 64) V!16917 (_ BitVec 32) Int) Unit!13164)

(assert (=> b!445668 (= lt!203660 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!698 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29589 () Bool)

(assert (=> bm!29589 (= call!29592 (getCurrentListMapNoExtraKeys!1583 (ite c!55863 _keys!709 lt!203659) (ite c!55863 _values!549 (array!27526 (store (arr!13210 _values!549) i!563 (ValueCellFull!5586 v!412)) (size!13562 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!264458 () Bool)

(assert (=> start!40474 (=> (not res!264458) (not e!261919))))

(assert (=> start!40474 (= res!264458 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13563 _keys!709))))))

(assert (=> start!40474 e!261919))

(assert (=> start!40474 tp_is_empty!11859))

(assert (=> start!40474 tp!37413))

(assert (=> start!40474 true))

(declare-fun array_inv!9580 (array!27525) Bool)

(assert (=> start!40474 (and (array_inv!9580 _values!549) e!261922)))

(declare-fun array_inv!9581 (array!27527) Bool)

(assert (=> start!40474 (array_inv!9581 _keys!709)))

(declare-fun b!445662 () Bool)

(declare-fun res!264468 () Bool)

(assert (=> b!445662 (=> (not res!264468) (not e!261919))))

(assert (=> b!445662 (= res!264468 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13563 _keys!709))))))

(declare-fun b!445669 () Bool)

(declare-fun res!264459 () Bool)

(assert (=> b!445669 (=> (not res!264459) (not e!261919))))

(assert (=> b!445669 (= res!264459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445670 () Bool)

(declare-fun res!264467 () Bool)

(assert (=> b!445670 (=> (not res!264467) (not e!261918))))

(assert (=> b!445670 (= res!264467 (arrayNoDuplicates!0 lt!203659 #b00000000000000000000000000000000 Nil!7895))))

(assert (= (and start!40474 res!264458) b!445654))

(assert (= (and b!445654 res!264460) b!445663))

(assert (= (and b!445663 res!264463) b!445669))

(assert (= (and b!445669 res!264459) b!445665))

(assert (= (and b!445665 res!264465) b!445662))

(assert (= (and b!445662 res!264468) b!445667))

(assert (= (and b!445667 res!264461) b!445660))

(assert (= (and b!445660 res!264464) b!445656))

(assert (= (and b!445656 res!264466) b!445657))

(assert (= (and b!445657 res!264469) b!445670))

(assert (= (and b!445670 res!264467) b!445666))

(assert (= (and b!445666 res!264462) b!445668))

(assert (= (and b!445668 c!55863) b!445664))

(assert (= (and b!445668 (not c!55863)) b!445655))

(assert (= (or b!445664 b!445655) bm!29588))

(assert (= (or b!445664 b!445655) bm!29589))

(assert (= (and b!445658 condMapEmpty!19416) mapIsEmpty!19416))

(assert (= (and b!445658 (not condMapEmpty!19416)) mapNonEmpty!19416))

(get-info :version)

(assert (= (and mapNonEmpty!19416 ((_ is ValueCellFull!5586) mapValue!19416)) b!445661))

(assert (= (and b!445658 ((_ is ValueCellFull!5586) mapDefault!19416)) b!445659))

(assert (= start!40474 b!445658))

(declare-fun m!431069 () Bool)

(assert (=> b!445668 m!431069))

(declare-fun m!431071 () Bool)

(assert (=> bm!29589 m!431071))

(declare-fun m!431073 () Bool)

(assert (=> bm!29589 m!431073))

(assert (=> bm!29588 m!431071))

(declare-fun m!431075 () Bool)

(assert (=> bm!29588 m!431075))

(declare-fun m!431077 () Bool)

(assert (=> b!445670 m!431077))

(declare-fun m!431079 () Bool)

(assert (=> mapNonEmpty!19416 m!431079))

(declare-fun m!431081 () Bool)

(assert (=> b!445657 m!431081))

(declare-fun m!431083 () Bool)

(assert (=> b!445657 m!431083))

(declare-fun m!431085 () Bool)

(assert (=> b!445664 m!431085))

(declare-fun m!431087 () Bool)

(assert (=> start!40474 m!431087))

(declare-fun m!431089 () Bool)

(assert (=> start!40474 m!431089))

(declare-fun m!431091 () Bool)

(assert (=> b!445660 m!431091))

(declare-fun m!431093 () Bool)

(assert (=> b!445654 m!431093))

(declare-fun m!431095 () Bool)

(assert (=> b!445667 m!431095))

(declare-fun m!431097 () Bool)

(assert (=> b!445656 m!431097))

(declare-fun m!431099 () Bool)

(assert (=> b!445665 m!431099))

(declare-fun m!431101 () Bool)

(assert (=> b!445669 m!431101))

(check-sat (not b!445654) (not bm!29588) (not b!445657) (not b!445665) (not bm!29589) (not b!445664) (not b!445668) (not b!445670) b_and!18529 (not b!445667) (not start!40474) (not b_next!10545) (not b!445656) (not mapNonEmpty!19416) (not b!445669) tp_is_empty!11859)
(check-sat b_and!18529 (not b_next!10545))
