; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77616 () Bool)

(assert start!77616)

(declare-fun b_free!16219 () Bool)

(declare-fun b_next!16219 () Bool)

(assert (=> start!77616 (= b_free!16219 (not b_next!16219))))

(declare-fun tp!56920 () Bool)

(declare-fun b_and!26565 () Bool)

(assert (=> start!77616 (= tp!56920 b_and!26565)))

(declare-fun b!904761 () Bool)

(declare-fun res!610563 () Bool)

(declare-fun e!506978 () Bool)

(assert (=> b!904761 (=> (not res!610563) (not e!506978))))

(declare-datatypes ((array!53295 0))(
  ( (array!53296 (arr!25607 (Array (_ BitVec 32) (_ BitVec 64))) (size!26068 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53295)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53295 (_ BitVec 32)) Bool)

(assert (=> b!904761 (= res!610563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!610569 () Bool)

(assert (=> start!77616 (=> (not res!610569) (not e!506978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77616 (= res!610569 (validMask!0 mask!1756))))

(assert (=> start!77616 e!506978))

(declare-datatypes ((V!29815 0))(
  ( (V!29816 (val!9369 Int)) )
))
(declare-datatypes ((ValueCell!8837 0))(
  ( (ValueCellFull!8837 (v!11873 V!29815)) (EmptyCell!8837) )
))
(declare-datatypes ((array!53297 0))(
  ( (array!53298 (arr!25608 (Array (_ BitVec 32) ValueCell!8837)) (size!26069 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53297)

(declare-fun e!506979 () Bool)

(declare-fun array_inv!20116 (array!53297) Bool)

(assert (=> start!77616 (and (array_inv!20116 _values!1152) e!506979)))

(assert (=> start!77616 tp!56920))

(assert (=> start!77616 true))

(declare-fun tp_is_empty!18637 () Bool)

(assert (=> start!77616 tp_is_empty!18637))

(declare-fun array_inv!20117 (array!53295) Bool)

(assert (=> start!77616 (array_inv!20117 _keys!1386)))

(declare-fun b!904762 () Bool)

(declare-fun res!610567 () Bool)

(assert (=> b!904762 (=> (not res!610567) (not e!506978))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!904762 (= res!610567 (and (= (size!26069 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26068 _keys!1386) (size!26069 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904763 () Bool)

(declare-fun res!610564 () Bool)

(assert (=> b!904763 (=> (not res!610564) (not e!506978))))

(declare-datatypes ((List!18000 0))(
  ( (Nil!17997) (Cons!17996 (h!19142 (_ BitVec 64)) (t!25382 List!18000)) )
))
(declare-fun arrayNoDuplicates!0 (array!53295 (_ BitVec 32) List!18000) Bool)

(assert (=> b!904763 (= res!610564 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17997))))

(declare-fun b!904764 () Bool)

(declare-fun e!506976 () Bool)

(assert (=> b!904764 (= e!506976 tp_is_empty!18637)))

(declare-fun b!904765 () Bool)

(declare-fun res!610561 () Bool)

(declare-fun e!506977 () Bool)

(assert (=> b!904765 (=> res!610561 e!506977)))

(declare-fun lt!408160 () V!29815)

(declare-datatypes ((tuple2!12200 0))(
  ( (tuple2!12201 (_1!6111 (_ BitVec 64)) (_2!6111 V!29815)) )
))
(declare-datatypes ((List!18001 0))(
  ( (Nil!17998) (Cons!17997 (h!19143 tuple2!12200) (t!25383 List!18001)) )
))
(declare-datatypes ((ListLongMap!10887 0))(
  ( (ListLongMap!10888 (toList!5459 List!18001)) )
))
(declare-fun lt!408157 () ListLongMap!10887)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!439 (ListLongMap!10887 (_ BitVec 64)) V!29815)

(assert (=> b!904765 (= res!610561 (not (= (apply!439 lt!408157 k0!1033) lt!408160)))))

(declare-fun b!904766 () Bool)

(declare-fun e!506981 () Bool)

(assert (=> b!904766 (= e!506978 e!506981)))

(declare-fun res!610562 () Bool)

(assert (=> b!904766 (=> (not res!610562) (not e!506981))))

(declare-fun lt!408159 () ListLongMap!10887)

(declare-fun contains!4469 (ListLongMap!10887 (_ BitVec 64)) Bool)

(assert (=> b!904766 (= res!610562 (contains!4469 lt!408159 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29815)

(declare-fun minValue!1094 () V!29815)

(declare-fun getCurrentListMap!2673 (array!53295 array!53297 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 32) Int) ListLongMap!10887)

(assert (=> b!904766 (= lt!408159 (getCurrentListMap!2673 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!904767 () Bool)

(declare-fun e!506980 () Bool)

(declare-fun mapRes!29668 () Bool)

(assert (=> b!904767 (= e!506979 (and e!506980 mapRes!29668))))

(declare-fun condMapEmpty!29668 () Bool)

(declare-fun mapDefault!29668 () ValueCell!8837)

(assert (=> b!904767 (= condMapEmpty!29668 (= (arr!25608 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8837)) mapDefault!29668)))))

(declare-fun b!904768 () Bool)

(declare-fun e!506974 () Bool)

(assert (=> b!904768 (= e!506981 (not e!506974))))

(declare-fun res!610565 () Bool)

(assert (=> b!904768 (=> res!610565 e!506974)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904768 (= res!610565 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26068 _keys!1386))))))

(declare-fun get!13457 (ValueCell!8837 V!29815) V!29815)

(declare-fun dynLambda!1318 (Int (_ BitVec 64)) V!29815)

(assert (=> b!904768 (= lt!408160 (get!13457 (select (arr!25608 _values!1152) i!717) (dynLambda!1318 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904768 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30624 0))(
  ( (Unit!30625) )
))
(declare-fun lt!408156 () Unit!30624)

(declare-fun lemmaKeyInListMapIsInArray!194 (array!53295 array!53297 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 64) Int) Unit!30624)

(assert (=> b!904768 (= lt!408156 (lemmaKeyInListMapIsInArray!194 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29668 () Bool)

(assert (=> mapIsEmpty!29668 mapRes!29668))

(declare-fun b!904769 () Bool)

(declare-fun res!610560 () Bool)

(assert (=> b!904769 (=> (not res!610560) (not e!506981))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904769 (= res!610560 (inRange!0 i!717 mask!1756))))

(declare-fun b!904770 () Bool)

(assert (=> b!904770 (= e!506974 e!506977)))

(declare-fun res!610568 () Bool)

(assert (=> b!904770 (=> res!610568 e!506977)))

(assert (=> b!904770 (= res!610568 (not (contains!4469 lt!408157 k0!1033)))))

(assert (=> b!904770 (= lt!408157 (getCurrentListMap!2673 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29668 () Bool)

(declare-fun tp!56919 () Bool)

(assert (=> mapNonEmpty!29668 (= mapRes!29668 (and tp!56919 e!506976))))

(declare-fun mapKey!29668 () (_ BitVec 32))

(declare-fun mapRest!29668 () (Array (_ BitVec 32) ValueCell!8837))

(declare-fun mapValue!29668 () ValueCell!8837)

(assert (=> mapNonEmpty!29668 (= (arr!25608 _values!1152) (store mapRest!29668 mapKey!29668 mapValue!29668))))

(declare-fun b!904771 () Bool)

(assert (=> b!904771 (= e!506980 tp_is_empty!18637)))

(declare-fun b!904772 () Bool)

(assert (=> b!904772 (= e!506977 true)))

(assert (=> b!904772 (= (apply!439 lt!408159 k0!1033) lt!408160)))

(declare-fun lt!408158 () Unit!30624)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!3 (array!53295 array!53297 (_ BitVec 32) (_ BitVec 32) V!29815 V!29815 (_ BitVec 64) V!29815 (_ BitVec 32) Int) Unit!30624)

(assert (=> b!904772 (= lt!408158 (lemmaListMapApplyFromThenApplyFromZero!3 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408160 i!717 defaultEntry!1160))))

(declare-fun b!904773 () Bool)

(declare-fun res!610566 () Bool)

(assert (=> b!904773 (=> (not res!610566) (not e!506981))))

(assert (=> b!904773 (= res!610566 (and (= (select (arr!25607 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77616 res!610569) b!904762))

(assert (= (and b!904762 res!610567) b!904761))

(assert (= (and b!904761 res!610563) b!904763))

(assert (= (and b!904763 res!610564) b!904766))

(assert (= (and b!904766 res!610562) b!904769))

(assert (= (and b!904769 res!610560) b!904773))

(assert (= (and b!904773 res!610566) b!904768))

(assert (= (and b!904768 (not res!610565)) b!904770))

(assert (= (and b!904770 (not res!610568)) b!904765))

(assert (= (and b!904765 (not res!610561)) b!904772))

(assert (= (and b!904767 condMapEmpty!29668) mapIsEmpty!29668))

(assert (= (and b!904767 (not condMapEmpty!29668)) mapNonEmpty!29668))

(get-info :version)

(assert (= (and mapNonEmpty!29668 ((_ is ValueCellFull!8837) mapValue!29668)) b!904764))

(assert (= (and b!904767 ((_ is ValueCellFull!8837) mapDefault!29668)) b!904771))

(assert (= start!77616 b!904767))

(declare-fun b_lambda!13075 () Bool)

(assert (=> (not b_lambda!13075) (not b!904768)))

(declare-fun t!25381 () Bool)

(declare-fun tb!5233 () Bool)

(assert (=> (and start!77616 (= defaultEntry!1160 defaultEntry!1160) t!25381) tb!5233))

(declare-fun result!10269 () Bool)

(assert (=> tb!5233 (= result!10269 tp_is_empty!18637)))

(assert (=> b!904768 t!25381))

(declare-fun b_and!26567 () Bool)

(assert (= b_and!26565 (and (=> t!25381 result!10269) b_and!26567)))

(declare-fun m!839657 () Bool)

(assert (=> b!904761 m!839657))

(declare-fun m!839659 () Bool)

(assert (=> b!904773 m!839659))

(declare-fun m!839661 () Bool)

(assert (=> b!904763 m!839661))

(declare-fun m!839663 () Bool)

(assert (=> mapNonEmpty!29668 m!839663))

(declare-fun m!839665 () Bool)

(assert (=> b!904769 m!839665))

(declare-fun m!839667 () Bool)

(assert (=> b!904770 m!839667))

(declare-fun m!839669 () Bool)

(assert (=> b!904770 m!839669))

(declare-fun m!839671 () Bool)

(assert (=> b!904768 m!839671))

(declare-fun m!839673 () Bool)

(assert (=> b!904768 m!839673))

(declare-fun m!839675 () Bool)

(assert (=> b!904768 m!839675))

(declare-fun m!839677 () Bool)

(assert (=> b!904768 m!839677))

(assert (=> b!904768 m!839671))

(assert (=> b!904768 m!839675))

(declare-fun m!839679 () Bool)

(assert (=> b!904768 m!839679))

(declare-fun m!839681 () Bool)

(assert (=> b!904772 m!839681))

(declare-fun m!839683 () Bool)

(assert (=> b!904772 m!839683))

(declare-fun m!839685 () Bool)

(assert (=> start!77616 m!839685))

(declare-fun m!839687 () Bool)

(assert (=> start!77616 m!839687))

(declare-fun m!839689 () Bool)

(assert (=> start!77616 m!839689))

(declare-fun m!839691 () Bool)

(assert (=> b!904766 m!839691))

(declare-fun m!839693 () Bool)

(assert (=> b!904766 m!839693))

(declare-fun m!839695 () Bool)

(assert (=> b!904765 m!839695))

(check-sat (not b!904761) (not b!904765) (not b!904763) (not b!904772) (not b!904770) b_and!26567 (not b!904766) tp_is_empty!18637 (not b_lambda!13075) (not b!904769) (not b_next!16219) (not start!77616) (not mapNonEmpty!29668) (not b!904768))
(check-sat b_and!26567 (not b_next!16219))
