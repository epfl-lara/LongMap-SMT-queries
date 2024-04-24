; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40792 () Bool)

(assert start!40792)

(declare-fun b_free!10795 () Bool)

(declare-fun b_next!10795 () Bool)

(assert (=> start!40792 (= b_free!10795 (not b_next!10795))))

(declare-fun tp!38208 () Bool)

(declare-fun b_and!18887 () Bool)

(assert (=> start!40792 (= tp!38208 b_and!18887)))

(declare-fun b!452764 () Bool)

(declare-fun res!269763 () Bool)

(declare-fun e!265052 () Bool)

(assert (=> b!452764 (=> (not res!269763) (not e!265052))))

(declare-datatypes ((array!28062 0))(
  ( (array!28063 (arr!13475 (Array (_ BitVec 32) (_ BitVec 64))) (size!13827 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28062)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452764 (= res!269763 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452765 () Bool)

(declare-fun res!269760 () Bool)

(assert (=> b!452765 (=> (not res!269760) (not e!265052))))

(declare-datatypes ((List!8017 0))(
  ( (Nil!8014) (Cons!8013 (h!8869 (_ BitVec 64)) (t!13827 List!8017)) )
))
(declare-fun arrayNoDuplicates!0 (array!28062 (_ BitVec 32) List!8017) Bool)

(assert (=> b!452765 (= res!269760 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8014))))

(declare-datatypes ((V!17283 0))(
  ( (V!17284 (val!6111 Int)) )
))
(declare-fun minValue!515 () V!17283)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7950 0))(
  ( (tuple2!7951 (_1!3986 (_ BitVec 64)) (_2!3986 V!17283)) )
))
(declare-datatypes ((List!8018 0))(
  ( (Nil!8015) (Cons!8014 (h!8870 tuple2!7950) (t!13828 List!8018)) )
))
(declare-datatypes ((ListLongMap!6865 0))(
  ( (ListLongMap!6866 (toList!3448 List!8018)) )
))
(declare-fun call!29984 () ListLongMap!6865)

(declare-fun c!56114 () Bool)

(declare-datatypes ((ValueCell!5723 0))(
  ( (ValueCellFull!5723 (v!8371 V!17283)) (EmptyCell!5723) )
))
(declare-datatypes ((array!28064 0))(
  ( (array!28065 (arr!13476 (Array (_ BitVec 32) ValueCell!5723)) (size!13828 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28064)

(declare-fun zeroValue!515 () V!17283)

(declare-fun lt!205471 () array!28062)

(declare-fun bm!29981 () Bool)

(declare-fun lt!205472 () array!28064)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1677 (array!28062 array!28064 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) Int) ListLongMap!6865)

(assert (=> bm!29981 (= call!29984 (getCurrentListMapNoExtraKeys!1677 (ite c!56114 lt!205471 _keys!709) (ite c!56114 lt!205472 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452766 () Bool)

(declare-fun e!265053 () Bool)

(declare-fun tp_is_empty!12133 () Bool)

(assert (=> b!452766 (= e!265053 tp_is_empty!12133)))

(declare-fun res!269751 () Bool)

(assert (=> start!40792 (=> (not res!269751) (not e!265052))))

(assert (=> start!40792 (= res!269751 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13827 _keys!709))))))

(assert (=> start!40792 e!265052))

(assert (=> start!40792 tp_is_empty!12133))

(assert (=> start!40792 tp!38208))

(assert (=> start!40792 true))

(declare-fun e!265055 () Bool)

(declare-fun array_inv!9838 (array!28064) Bool)

(assert (=> start!40792 (and (array_inv!9838 _values!549) e!265055)))

(declare-fun array_inv!9839 (array!28062) Bool)

(assert (=> start!40792 (array_inv!9839 _keys!709)))

(declare-fun b!452767 () Bool)

(declare-fun res!269756 () Bool)

(assert (=> b!452767 (=> (not res!269756) (not e!265052))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452767 (= res!269756 (or (= (select (arr!13475 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13475 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29982 () Bool)

(declare-fun call!29985 () ListLongMap!6865)

(assert (=> bm!29982 (= call!29985 (getCurrentListMapNoExtraKeys!1677 (ite c!56114 _keys!709 lt!205471) (ite c!56114 _values!549 lt!205472) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452768 () Bool)

(declare-fun res!269758 () Bool)

(assert (=> b!452768 (=> (not res!269758) (not e!265052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28062 (_ BitVec 32)) Bool)

(assert (=> b!452768 (= res!269758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19836 () Bool)

(declare-fun mapRes!19836 () Bool)

(declare-fun tp!38207 () Bool)

(assert (=> mapNonEmpty!19836 (= mapRes!19836 (and tp!38207 e!265053))))

(declare-fun mapRest!19836 () (Array (_ BitVec 32) ValueCell!5723))

(declare-fun mapKey!19836 () (_ BitVec 32))

(declare-fun mapValue!19836 () ValueCell!5723)

(assert (=> mapNonEmpty!19836 (= (arr!13476 _values!549) (store mapRest!19836 mapKey!19836 mapValue!19836))))

(declare-fun b!452769 () Bool)

(declare-fun e!265050 () Bool)

(assert (=> b!452769 (= e!265055 (and e!265050 mapRes!19836))))

(declare-fun condMapEmpty!19836 () Bool)

(declare-fun mapDefault!19836 () ValueCell!5723)

(assert (=> b!452769 (= condMapEmpty!19836 (= (arr!13476 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5723)) mapDefault!19836)))))

(declare-fun b!452770 () Bool)

(declare-fun e!265047 () Bool)

(assert (=> b!452770 (= e!265047 true)))

(declare-fun lt!205473 () ListLongMap!6865)

(declare-fun lt!205468 () V!17283)

(declare-fun lt!205470 () tuple2!7950)

(declare-fun +!1572 (ListLongMap!6865 tuple2!7950) ListLongMap!6865)

(assert (=> b!452770 (= (+!1572 lt!205473 lt!205470) (+!1572 (+!1572 lt!205473 (tuple2!7951 k0!794 lt!205468)) lt!205470))))

(declare-fun lt!205465 () V!17283)

(assert (=> b!452770 (= lt!205470 (tuple2!7951 k0!794 lt!205465))))

(declare-datatypes ((Unit!13223 0))(
  ( (Unit!13224) )
))
(declare-fun lt!205469 () Unit!13223)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!87 (ListLongMap!6865 (_ BitVec 64) V!17283 V!17283) Unit!13223)

(assert (=> b!452770 (= lt!205469 (addSameAsAddTwiceSameKeyDiffValues!87 lt!205473 k0!794 lt!205468 lt!205465))))

(declare-fun lt!205467 () V!17283)

(declare-fun get!6652 (ValueCell!5723 V!17283) V!17283)

(assert (=> b!452770 (= lt!205468 (get!6652 (select (arr!13476 _values!549) from!863) lt!205467))))

(declare-fun lt!205474 () ListLongMap!6865)

(assert (=> b!452770 (= lt!205474 (+!1572 lt!205473 (tuple2!7951 (select (arr!13475 lt!205471) from!863) lt!205465)))))

(declare-fun v!412 () V!17283)

(assert (=> b!452770 (= lt!205465 (get!6652 (select (store (arr!13476 _values!549) i!563 (ValueCellFull!5723 v!412)) from!863) lt!205467))))

(declare-fun dynLambda!869 (Int (_ BitVec 64)) V!17283)

(assert (=> b!452770 (= lt!205467 (dynLambda!869 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452770 (= lt!205473 (getCurrentListMapNoExtraKeys!1677 lt!205471 lt!205472 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452771 () Bool)

(declare-fun e!265051 () Bool)

(assert (=> b!452771 (= e!265051 (= call!29984 (+!1572 call!29985 (tuple2!7951 k0!794 v!412))))))

(declare-fun b!452772 () Bool)

(declare-fun res!269762 () Bool)

(declare-fun e!265048 () Bool)

(assert (=> b!452772 (=> (not res!269762) (not e!265048))))

(assert (=> b!452772 (= res!269762 (bvsle from!863 i!563))))

(declare-fun b!452773 () Bool)

(declare-fun res!269755 () Bool)

(assert (=> b!452773 (=> (not res!269755) (not e!265052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452773 (= res!269755 (validMask!0 mask!1025))))

(declare-fun b!452774 () Bool)

(declare-fun res!269761 () Bool)

(assert (=> b!452774 (=> (not res!269761) (not e!265052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452774 (= res!269761 (validKeyInArray!0 k0!794))))

(declare-fun b!452775 () Bool)

(declare-fun e!265049 () Bool)

(assert (=> b!452775 (= e!265048 e!265049)))

(declare-fun res!269752 () Bool)

(assert (=> b!452775 (=> (not res!269752) (not e!265049))))

(assert (=> b!452775 (= res!269752 (= from!863 i!563))))

(assert (=> b!452775 (= lt!205474 (getCurrentListMapNoExtraKeys!1677 lt!205471 lt!205472 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452775 (= lt!205472 (array!28065 (store (arr!13476 _values!549) i!563 (ValueCellFull!5723 v!412)) (size!13828 _values!549)))))

(declare-fun lt!205466 () ListLongMap!6865)

(assert (=> b!452775 (= lt!205466 (getCurrentListMapNoExtraKeys!1677 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452776 () Bool)

(assert (=> b!452776 (= e!265049 (not e!265047))))

(declare-fun res!269757 () Bool)

(assert (=> b!452776 (=> res!269757 e!265047)))

(assert (=> b!452776 (= res!269757 (validKeyInArray!0 (select (arr!13475 _keys!709) from!863)))))

(assert (=> b!452776 e!265051))

(assert (=> b!452776 (= c!56114 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205475 () Unit!13223)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!732 (array!28062 array!28064 (_ BitVec 32) (_ BitVec 32) V!17283 V!17283 (_ BitVec 32) (_ BitVec 64) V!17283 (_ BitVec 32) Int) Unit!13223)

(assert (=> b!452776 (= lt!205475 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!732 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452777 () Bool)

(declare-fun res!269753 () Bool)

(assert (=> b!452777 (=> (not res!269753) (not e!265052))))

(assert (=> b!452777 (= res!269753 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13827 _keys!709))))))

(declare-fun mapIsEmpty!19836 () Bool)

(assert (=> mapIsEmpty!19836 mapRes!19836))

(declare-fun b!452778 () Bool)

(declare-fun res!269754 () Bool)

(assert (=> b!452778 (=> (not res!269754) (not e!265052))))

(assert (=> b!452778 (= res!269754 (and (= (size!13828 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13827 _keys!709) (size!13828 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452779 () Bool)

(assert (=> b!452779 (= e!265051 (= call!29985 call!29984))))

(declare-fun b!452780 () Bool)

(assert (=> b!452780 (= e!265050 tp_is_empty!12133)))

(declare-fun b!452781 () Bool)

(assert (=> b!452781 (= e!265052 e!265048)))

(declare-fun res!269764 () Bool)

(assert (=> b!452781 (=> (not res!269764) (not e!265048))))

(assert (=> b!452781 (= res!269764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205471 mask!1025))))

(assert (=> b!452781 (= lt!205471 (array!28063 (store (arr!13475 _keys!709) i!563 k0!794) (size!13827 _keys!709)))))

(declare-fun b!452782 () Bool)

(declare-fun res!269759 () Bool)

(assert (=> b!452782 (=> (not res!269759) (not e!265048))))

(assert (=> b!452782 (= res!269759 (arrayNoDuplicates!0 lt!205471 #b00000000000000000000000000000000 Nil!8014))))

(assert (= (and start!40792 res!269751) b!452773))

(assert (= (and b!452773 res!269755) b!452778))

(assert (= (and b!452778 res!269754) b!452768))

(assert (= (and b!452768 res!269758) b!452765))

(assert (= (and b!452765 res!269760) b!452777))

(assert (= (and b!452777 res!269753) b!452774))

(assert (= (and b!452774 res!269761) b!452767))

(assert (= (and b!452767 res!269756) b!452764))

(assert (= (and b!452764 res!269763) b!452781))

(assert (= (and b!452781 res!269764) b!452782))

(assert (= (and b!452782 res!269759) b!452772))

(assert (= (and b!452772 res!269762) b!452775))

(assert (= (and b!452775 res!269752) b!452776))

(assert (= (and b!452776 c!56114) b!452771))

(assert (= (and b!452776 (not c!56114)) b!452779))

(assert (= (or b!452771 b!452779) bm!29981))

(assert (= (or b!452771 b!452779) bm!29982))

(assert (= (and b!452776 (not res!269757)) b!452770))

(assert (= (and b!452769 condMapEmpty!19836) mapIsEmpty!19836))

(assert (= (and b!452769 (not condMapEmpty!19836)) mapNonEmpty!19836))

(get-info :version)

(assert (= (and mapNonEmpty!19836 ((_ is ValueCellFull!5723) mapValue!19836)) b!452766))

(assert (= (and b!452769 ((_ is ValueCellFull!5723) mapDefault!19836)) b!452780))

(assert (= start!40792 b!452769))

(declare-fun b_lambda!9587 () Bool)

(assert (=> (not b_lambda!9587) (not b!452770)))

(declare-fun t!13826 () Bool)

(declare-fun tb!3767 () Bool)

(assert (=> (and start!40792 (= defaultEntry!557 defaultEntry!557) t!13826) tb!3767))

(declare-fun result!7079 () Bool)

(assert (=> tb!3767 (= result!7079 tp_is_empty!12133)))

(assert (=> b!452770 t!13826))

(declare-fun b_and!18889 () Bool)

(assert (= b_and!18887 (and (=> t!13826 result!7079) b_and!18889)))

(declare-fun m!436771 () Bool)

(assert (=> b!452774 m!436771))

(declare-fun m!436773 () Bool)

(assert (=> b!452776 m!436773))

(assert (=> b!452776 m!436773))

(declare-fun m!436775 () Bool)

(assert (=> b!452776 m!436775))

(declare-fun m!436777 () Bool)

(assert (=> b!452776 m!436777))

(declare-fun m!436779 () Bool)

(assert (=> b!452781 m!436779))

(declare-fun m!436781 () Bool)

(assert (=> b!452781 m!436781))

(declare-fun m!436783 () Bool)

(assert (=> b!452782 m!436783))

(declare-fun m!436785 () Bool)

(assert (=> b!452767 m!436785))

(declare-fun m!436787 () Bool)

(assert (=> b!452768 m!436787))

(declare-fun m!436789 () Bool)

(assert (=> start!40792 m!436789))

(declare-fun m!436791 () Bool)

(assert (=> start!40792 m!436791))

(declare-fun m!436793 () Bool)

(assert (=> b!452764 m!436793))

(declare-fun m!436795 () Bool)

(assert (=> b!452770 m!436795))

(declare-fun m!436797 () Bool)

(assert (=> b!452770 m!436797))

(declare-fun m!436799 () Bool)

(assert (=> b!452770 m!436799))

(declare-fun m!436801 () Bool)

(assert (=> b!452770 m!436801))

(declare-fun m!436803 () Bool)

(assert (=> b!452770 m!436803))

(assert (=> b!452770 m!436801))

(declare-fun m!436805 () Bool)

(assert (=> b!452770 m!436805))

(declare-fun m!436807 () Bool)

(assert (=> b!452770 m!436807))

(declare-fun m!436809 () Bool)

(assert (=> b!452770 m!436809))

(declare-fun m!436811 () Bool)

(assert (=> b!452770 m!436811))

(declare-fun m!436813 () Bool)

(assert (=> b!452770 m!436813))

(assert (=> b!452770 m!436811))

(declare-fun m!436815 () Bool)

(assert (=> b!452770 m!436815))

(declare-fun m!436817 () Bool)

(assert (=> b!452770 m!436817))

(declare-fun m!436819 () Bool)

(assert (=> b!452770 m!436819))

(assert (=> b!452770 m!436817))

(declare-fun m!436821 () Bool)

(assert (=> b!452765 m!436821))

(declare-fun m!436823 () Bool)

(assert (=> mapNonEmpty!19836 m!436823))

(declare-fun m!436825 () Bool)

(assert (=> b!452775 m!436825))

(assert (=> b!452775 m!436797))

(declare-fun m!436827 () Bool)

(assert (=> b!452775 m!436827))

(declare-fun m!436829 () Bool)

(assert (=> b!452773 m!436829))

(declare-fun m!436831 () Bool)

(assert (=> bm!29982 m!436831))

(declare-fun m!436833 () Bool)

(assert (=> bm!29981 m!436833))

(declare-fun m!436835 () Bool)

(assert (=> b!452771 m!436835))

(check-sat (not bm!29982) b_and!18889 (not b!452776) (not b_next!10795) (not b!452782) (not b!452773) (not b_lambda!9587) (not mapNonEmpty!19836) tp_is_empty!12133 (not b!452781) (not b!452771) (not b!452768) (not bm!29981) (not b!452765) (not b!452764) (not start!40792) (not b!452775) (not b!452770) (not b!452774))
(check-sat b_and!18889 (not b_next!10795))
