; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40704 () Bool)

(assert start!40704)

(declare-fun b_free!10729 () Bool)

(declare-fun b_next!10729 () Bool)

(assert (=> start!40704 (= b_free!10729 (not b_next!10729))))

(declare-fun tp!38007 () Bool)

(declare-fun b_and!18751 () Bool)

(assert (=> start!40704 (= tp!38007 b_and!18751)))

(declare-fun b!450684 () Bool)

(declare-fun res!268309 () Bool)

(declare-fun e!264067 () Bool)

(assert (=> b!450684 (=> (not res!268309) (not e!264067))))

(declare-datatypes ((array!27934 0))(
  ( (array!27935 (arr!13412 (Array (_ BitVec 32) (_ BitVec 64))) (size!13764 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27934)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17195 0))(
  ( (V!17196 (val!6078 Int)) )
))
(declare-datatypes ((ValueCell!5690 0))(
  ( (ValueCellFull!5690 (v!8334 V!17195)) (EmptyCell!5690) )
))
(declare-datatypes ((array!27936 0))(
  ( (array!27937 (arr!13413 (Array (_ BitVec 32) ValueCell!5690)) (size!13765 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27936)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!450684 (= res!268309 (and (= (size!13765 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13764 _keys!709) (size!13765 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450685 () Bool)

(declare-fun res!268315 () Bool)

(declare-fun e!264065 () Bool)

(assert (=> b!450685 (=> (not res!268315) (not e!264065))))

(declare-fun lt!204709 () array!27934)

(declare-datatypes ((List!7964 0))(
  ( (Nil!7961) (Cons!7960 (h!8816 (_ BitVec 64)) (t!13718 List!7964)) )
))
(declare-fun arrayNoDuplicates!0 (array!27934 (_ BitVec 32) List!7964) Bool)

(assert (=> b!450685 (= res!268315 (arrayNoDuplicates!0 lt!204709 #b00000000000000000000000000000000 Nil!7961))))

(declare-fun b!450686 () Bool)

(declare-fun e!264062 () Bool)

(assert (=> b!450686 (= e!264065 e!264062)))

(declare-fun res!268317 () Bool)

(assert (=> b!450686 (=> (not res!268317) (not e!264062))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450686 (= res!268317 (= from!863 i!563))))

(declare-fun minValue!515 () V!17195)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7892 0))(
  ( (tuple2!7893 (_1!3957 (_ BitVec 64)) (_2!3957 V!17195)) )
))
(declare-datatypes ((List!7965 0))(
  ( (Nil!7962) (Cons!7961 (h!8817 tuple2!7892) (t!13719 List!7965)) )
))
(declare-datatypes ((ListLongMap!6807 0))(
  ( (ListLongMap!6808 (toList!3419 List!7965)) )
))
(declare-fun lt!204708 () ListLongMap!6807)

(declare-fun lt!204707 () array!27936)

(declare-fun zeroValue!515 () V!17195)

(declare-fun getCurrentListMapNoExtraKeys!1648 (array!27934 array!27936 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) Int) ListLongMap!6807)

(assert (=> b!450686 (= lt!204708 (getCurrentListMapNoExtraKeys!1648 lt!204709 lt!204707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17195)

(assert (=> b!450686 (= lt!204707 (array!27937 (store (arr!13413 _values!549) i!563 (ValueCellFull!5690 v!412)) (size!13765 _values!549)))))

(declare-fun lt!204711 () ListLongMap!6807)

(assert (=> b!450686 (= lt!204711 (getCurrentListMapNoExtraKeys!1648 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450687 () Bool)

(declare-fun res!268310 () Bool)

(assert (=> b!450687 (=> (not res!268310) (not e!264067))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450687 (= res!268310 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450688 () Bool)

(declare-fun res!268314 () Bool)

(assert (=> b!450688 (=> (not res!268314) (not e!264067))))

(assert (=> b!450688 (= res!268314 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13764 _keys!709))))))

(declare-fun b!450689 () Bool)

(declare-fun res!268307 () Bool)

(assert (=> b!450689 (=> (not res!268307) (not e!264067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450689 (= res!268307 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19734 () Bool)

(declare-fun mapRes!19734 () Bool)

(assert (=> mapIsEmpty!19734 mapRes!19734))

(declare-fun b!450690 () Bool)

(declare-fun e!264064 () Bool)

(declare-fun tp_is_empty!12067 () Bool)

(assert (=> b!450690 (= e!264064 tp_is_empty!12067)))

(declare-fun b!450691 () Bool)

(declare-fun e!264063 () Bool)

(declare-fun e!264061 () Bool)

(assert (=> b!450691 (= e!264063 (and e!264061 mapRes!19734))))

(declare-fun condMapEmpty!19734 () Bool)

(declare-fun mapDefault!19734 () ValueCell!5690)

(assert (=> b!450691 (= condMapEmpty!19734 (= (arr!13413 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5690)) mapDefault!19734)))))

(declare-fun call!29766 () ListLongMap!6807)

(declare-fun c!55977 () Bool)

(declare-fun bm!29763 () Bool)

(assert (=> bm!29763 (= call!29766 (getCurrentListMapNoExtraKeys!1648 (ite c!55977 _keys!709 lt!204709) (ite c!55977 _values!549 lt!204707) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29764 () Bool)

(declare-fun call!29767 () ListLongMap!6807)

(assert (=> bm!29764 (= call!29767 (getCurrentListMapNoExtraKeys!1648 (ite c!55977 lt!204709 _keys!709) (ite c!55977 lt!204707 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450692 () Bool)

(assert (=> b!450692 (= e!264061 tp_is_empty!12067)))

(declare-fun b!450694 () Bool)

(declare-fun res!268311 () Bool)

(assert (=> b!450694 (=> (not res!268311) (not e!264065))))

(assert (=> b!450694 (= res!268311 (bvsle from!863 i!563))))

(declare-fun b!450695 () Bool)

(declare-fun e!264069 () Bool)

(declare-fun +!1547 (ListLongMap!6807 tuple2!7892) ListLongMap!6807)

(assert (=> b!450695 (= e!264069 (= call!29767 (+!1547 call!29766 (tuple2!7893 k0!794 v!412))))))

(declare-fun b!450696 () Bool)

(declare-fun res!268316 () Bool)

(assert (=> b!450696 (=> (not res!268316) (not e!264067))))

(assert (=> b!450696 (= res!268316 (or (= (select (arr!13412 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13412 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450697 () Bool)

(assert (=> b!450697 (= e!264067 e!264065)))

(declare-fun res!268312 () Bool)

(assert (=> b!450697 (=> (not res!268312) (not e!264065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27934 (_ BitVec 32)) Bool)

(assert (=> b!450697 (= res!268312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204709 mask!1025))))

(assert (=> b!450697 (= lt!204709 (array!27935 (store (arr!13412 _keys!709) i!563 k0!794) (size!13764 _keys!709)))))

(declare-fun b!450698 () Bool)

(declare-fun res!268305 () Bool)

(assert (=> b!450698 (=> (not res!268305) (not e!264067))))

(assert (=> b!450698 (= res!268305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450699 () Bool)

(assert (=> b!450699 (= e!264069 (= call!29766 call!29767))))

(declare-fun b!450700 () Bool)

(declare-fun e!264066 () Bool)

(assert (=> b!450700 (= e!264066 (bvslt from!863 (size!13764 _keys!709)))))

(declare-fun lt!204710 () ListLongMap!6807)

(assert (=> b!450700 (= lt!204710 (getCurrentListMapNoExtraKeys!1648 lt!204709 lt!204707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450701 () Bool)

(declare-fun res!268308 () Bool)

(assert (=> b!450701 (=> (not res!268308) (not e!264067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450701 (= res!268308 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19734 () Bool)

(declare-fun tp!38006 () Bool)

(assert (=> mapNonEmpty!19734 (= mapRes!19734 (and tp!38006 e!264064))))

(declare-fun mapValue!19734 () ValueCell!5690)

(declare-fun mapKey!19734 () (_ BitVec 32))

(declare-fun mapRest!19734 () (Array (_ BitVec 32) ValueCell!5690))

(assert (=> mapNonEmpty!19734 (= (arr!13413 _values!549) (store mapRest!19734 mapKey!19734 mapValue!19734))))

(declare-fun b!450702 () Bool)

(declare-fun res!268304 () Bool)

(assert (=> b!450702 (=> (not res!268304) (not e!264067))))

(assert (=> b!450702 (= res!268304 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7961))))

(declare-fun b!450693 () Bool)

(assert (=> b!450693 (= e!264062 (not e!264066))))

(declare-fun res!268306 () Bool)

(assert (=> b!450693 (=> res!268306 e!264066)))

(assert (=> b!450693 (= res!268306 (validKeyInArray!0 (select (arr!13412 _keys!709) from!863)))))

(assert (=> b!450693 e!264069))

(assert (=> b!450693 (= c!55977 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13177 0))(
  ( (Unit!13178) )
))
(declare-fun lt!204712 () Unit!13177)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 (array!27934 array!27936 (_ BitVec 32) (_ BitVec 32) V!17195 V!17195 (_ BitVec 32) (_ BitVec 64) V!17195 (_ BitVec 32) Int) Unit!13177)

(assert (=> b!450693 (= lt!204712 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!268313 () Bool)

(assert (=> start!40704 (=> (not res!268313) (not e!264067))))

(assert (=> start!40704 (= res!268313 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13764 _keys!709))))))

(assert (=> start!40704 e!264067))

(assert (=> start!40704 tp_is_empty!12067))

(assert (=> start!40704 tp!38007))

(assert (=> start!40704 true))

(declare-fun array_inv!9794 (array!27936) Bool)

(assert (=> start!40704 (and (array_inv!9794 _values!549) e!264063)))

(declare-fun array_inv!9795 (array!27934) Bool)

(assert (=> start!40704 (array_inv!9795 _keys!709)))

(assert (= (and start!40704 res!268313) b!450701))

(assert (= (and b!450701 res!268308) b!450684))

(assert (= (and b!450684 res!268309) b!450698))

(assert (= (and b!450698 res!268305) b!450702))

(assert (= (and b!450702 res!268304) b!450688))

(assert (= (and b!450688 res!268314) b!450689))

(assert (= (and b!450689 res!268307) b!450696))

(assert (= (and b!450696 res!268316) b!450687))

(assert (= (and b!450687 res!268310) b!450697))

(assert (= (and b!450697 res!268312) b!450685))

(assert (= (and b!450685 res!268315) b!450694))

(assert (= (and b!450694 res!268311) b!450686))

(assert (= (and b!450686 res!268317) b!450693))

(assert (= (and b!450693 c!55977) b!450695))

(assert (= (and b!450693 (not c!55977)) b!450699))

(assert (= (or b!450695 b!450699) bm!29764))

(assert (= (or b!450695 b!450699) bm!29763))

(assert (= (and b!450693 (not res!268306)) b!450700))

(assert (= (and b!450691 condMapEmpty!19734) mapIsEmpty!19734))

(assert (= (and b!450691 (not condMapEmpty!19734)) mapNonEmpty!19734))

(get-info :version)

(assert (= (and mapNonEmpty!19734 ((_ is ValueCellFull!5690) mapValue!19734)) b!450690))

(assert (= (and b!450691 ((_ is ValueCellFull!5690) mapDefault!19734)) b!450692))

(assert (= start!40704 b!450691))

(declare-fun m!434775 () Bool)

(assert (=> b!450697 m!434775))

(declare-fun m!434777 () Bool)

(assert (=> b!450697 m!434777))

(declare-fun m!434779 () Bool)

(assert (=> mapNonEmpty!19734 m!434779))

(declare-fun m!434781 () Bool)

(assert (=> b!450693 m!434781))

(assert (=> b!450693 m!434781))

(declare-fun m!434783 () Bool)

(assert (=> b!450693 m!434783))

(declare-fun m!434785 () Bool)

(assert (=> b!450693 m!434785))

(declare-fun m!434787 () Bool)

(assert (=> b!450696 m!434787))

(declare-fun m!434789 () Bool)

(assert (=> b!450686 m!434789))

(declare-fun m!434791 () Bool)

(assert (=> b!450686 m!434791))

(declare-fun m!434793 () Bool)

(assert (=> b!450686 m!434793))

(declare-fun m!434795 () Bool)

(assert (=> b!450687 m!434795))

(declare-fun m!434797 () Bool)

(assert (=> bm!29764 m!434797))

(declare-fun m!434799 () Bool)

(assert (=> b!450698 m!434799))

(declare-fun m!434801 () Bool)

(assert (=> bm!29763 m!434801))

(declare-fun m!434803 () Bool)

(assert (=> start!40704 m!434803))

(declare-fun m!434805 () Bool)

(assert (=> start!40704 m!434805))

(declare-fun m!434807 () Bool)

(assert (=> b!450685 m!434807))

(declare-fun m!434809 () Bool)

(assert (=> b!450702 m!434809))

(declare-fun m!434811 () Bool)

(assert (=> b!450701 m!434811))

(declare-fun m!434813 () Bool)

(assert (=> b!450700 m!434813))

(declare-fun m!434815 () Bool)

(assert (=> b!450689 m!434815))

(declare-fun m!434817 () Bool)

(assert (=> b!450695 m!434817))

(check-sat (not b!450685) (not b!450687) (not start!40704) (not b!450693) b_and!18751 (not b!450686) (not bm!29764) (not bm!29763) (not b!450700) (not b!450698) tp_is_empty!12067 (not b!450697) (not b!450689) (not b!450695) (not b!450701) (not b_next!10729) (not b!450702) (not mapNonEmpty!19734))
(check-sat b_and!18751 (not b_next!10729))
