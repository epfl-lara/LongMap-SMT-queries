; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82274 () Bool)

(assert start!82274)

(declare-fun b_free!18565 () Bool)

(declare-fun b_next!18565 () Bool)

(assert (=> start!82274 (= b_free!18565 (not b_next!18565))))

(declare-fun tp!64656 () Bool)

(declare-fun b_and!30027 () Bool)

(assert (=> start!82274 (= tp!64656 b_and!30027)))

(declare-fun b!959123 () Bool)

(declare-fun e!540662 () Bool)

(declare-fun tp_is_empty!21271 () Bool)

(assert (=> b!959123 (= e!540662 tp_is_empty!21271)))

(declare-fun b!959124 () Bool)

(declare-fun res!642072 () Bool)

(declare-fun e!540659 () Bool)

(assert (=> b!959124 (=> (not res!642072) (not e!540659))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33345 0))(
  ( (V!33346 (val!10686 Int)) )
))
(declare-fun minValue!1328 () V!33345)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58570 0))(
  ( (array!58571 (arr!28159 (Array (_ BitVec 32) (_ BitVec 64))) (size!28640 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58570)

(declare-datatypes ((ValueCell!10154 0))(
  ( (ValueCellFull!10154 (v!13242 V!33345)) (EmptyCell!10154) )
))
(declare-datatypes ((array!58572 0))(
  ( (array!58573 (arr!28160 (Array (_ BitVec 32) ValueCell!10154)) (size!28641 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58572)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33345)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13826 0))(
  ( (tuple2!13827 (_1!6924 (_ BitVec 64)) (_2!6924 V!33345)) )
))
(declare-datatypes ((List!19610 0))(
  ( (Nil!19607) (Cons!19606 (h!20768 tuple2!13826) (t!27964 List!19610)) )
))
(declare-datatypes ((ListLongMap!12513 0))(
  ( (ListLongMap!12514 (toList!6272 List!19610)) )
))
(declare-fun contains!5318 (ListLongMap!12513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3434 (array!58570 array!58572 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) Int) ListLongMap!12513)

(assert (=> b!959124 (= res!642072 (contains!5318 (getCurrentListMap!3434 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28159 _keys!1668) i!793)))))

(declare-fun b!959126 () Bool)

(declare-fun e!540660 () Bool)

(assert (=> b!959126 (= e!540660 tp_is_empty!21271)))

(declare-fun b!959127 () Bool)

(declare-fun res!642074 () Bool)

(assert (=> b!959127 (=> (not res!642074) (not e!540659))))

(assert (=> b!959127 (= res!642074 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28640 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28640 _keys!1668))))))

(declare-fun b!959128 () Bool)

(declare-fun res!642073 () Bool)

(assert (=> b!959128 (=> (not res!642073) (not e!540659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959128 (= res!642073 (validKeyInArray!0 (select (arr!28159 _keys!1668) i!793)))))

(declare-fun b!959129 () Bool)

(declare-fun res!642075 () Bool)

(assert (=> b!959129 (=> (not res!642075) (not e!540659))))

(declare-datatypes ((List!19611 0))(
  ( (Nil!19608) (Cons!19607 (h!20769 (_ BitVec 64)) (t!27965 List!19611)) )
))
(declare-fun arrayNoDuplicates!0 (array!58570 (_ BitVec 32) List!19611) Bool)

(assert (=> b!959129 (= res!642075 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19608))))

(declare-fun mapNonEmpty!33886 () Bool)

(declare-fun mapRes!33886 () Bool)

(declare-fun tp!64657 () Bool)

(assert (=> mapNonEmpty!33886 (= mapRes!33886 (and tp!64657 e!540660))))

(declare-fun mapKey!33886 () (_ BitVec 32))

(declare-fun mapValue!33886 () ValueCell!10154)

(declare-fun mapRest!33886 () (Array (_ BitVec 32) ValueCell!10154))

(assert (=> mapNonEmpty!33886 (= (arr!28160 _values!1386) (store mapRest!33886 mapKey!33886 mapValue!33886))))

(declare-fun b!959125 () Bool)

(declare-fun res!642071 () Bool)

(assert (=> b!959125 (=> (not res!642071) (not e!540659))))

(assert (=> b!959125 (= res!642071 (and (= (size!28641 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28640 _keys!1668) (size!28641 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!642069 () Bool)

(assert (=> start!82274 (=> (not res!642069) (not e!540659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82274 (= res!642069 (validMask!0 mask!2088))))

(assert (=> start!82274 e!540659))

(assert (=> start!82274 true))

(assert (=> start!82274 tp_is_empty!21271))

(declare-fun array_inv!21889 (array!58570) Bool)

(assert (=> start!82274 (array_inv!21889 _keys!1668)))

(declare-fun e!540658 () Bool)

(declare-fun array_inv!21890 (array!58572) Bool)

(assert (=> start!82274 (and (array_inv!21890 _values!1386) e!540658)))

(assert (=> start!82274 tp!64656))

(declare-fun mapIsEmpty!33886 () Bool)

(assert (=> mapIsEmpty!33886 mapRes!33886))

(declare-fun b!959130 () Bool)

(assert (=> b!959130 (= e!540659 (not true))))

(assert (=> b!959130 (contains!5318 (getCurrentListMap!3434 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28159 _keys!1668) i!793))))

(declare-datatypes ((Unit!32040 0))(
  ( (Unit!32041) )
))
(declare-fun lt!430303 () Unit!32040)

(declare-fun lemmaInListMapFromThenInFromSmaller!11 (array!58570 array!58572 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32040)

(assert (=> b!959130 (= lt!430303 (lemmaInListMapFromThenInFromSmaller!11 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959131 () Bool)

(declare-fun res!642070 () Bool)

(assert (=> b!959131 (=> (not res!642070) (not e!540659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58570 (_ BitVec 32)) Bool)

(assert (=> b!959131 (= res!642070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959132 () Bool)

(assert (=> b!959132 (= e!540658 (and e!540662 mapRes!33886))))

(declare-fun condMapEmpty!33886 () Bool)

(declare-fun mapDefault!33886 () ValueCell!10154)

(assert (=> b!959132 (= condMapEmpty!33886 (= (arr!28160 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10154)) mapDefault!33886)))))

(assert (= (and start!82274 res!642069) b!959125))

(assert (= (and b!959125 res!642071) b!959131))

(assert (= (and b!959131 res!642070) b!959129))

(assert (= (and b!959129 res!642075) b!959127))

(assert (= (and b!959127 res!642074) b!959128))

(assert (= (and b!959128 res!642073) b!959124))

(assert (= (and b!959124 res!642072) b!959130))

(assert (= (and b!959132 condMapEmpty!33886) mapIsEmpty!33886))

(assert (= (and b!959132 (not condMapEmpty!33886)) mapNonEmpty!33886))

(get-info :version)

(assert (= (and mapNonEmpty!33886 ((_ is ValueCellFull!10154) mapValue!33886)) b!959126))

(assert (= (and b!959132 ((_ is ValueCellFull!10154) mapDefault!33886)) b!959123))

(assert (= start!82274 b!959132))

(declare-fun m!889107 () Bool)

(assert (=> b!959130 m!889107))

(declare-fun m!889109 () Bool)

(assert (=> b!959130 m!889109))

(assert (=> b!959130 m!889107))

(assert (=> b!959130 m!889109))

(declare-fun m!889111 () Bool)

(assert (=> b!959130 m!889111))

(declare-fun m!889113 () Bool)

(assert (=> b!959130 m!889113))

(declare-fun m!889115 () Bool)

(assert (=> start!82274 m!889115))

(declare-fun m!889117 () Bool)

(assert (=> start!82274 m!889117))

(declare-fun m!889119 () Bool)

(assert (=> start!82274 m!889119))

(declare-fun m!889121 () Bool)

(assert (=> b!959124 m!889121))

(assert (=> b!959124 m!889109))

(assert (=> b!959124 m!889121))

(assert (=> b!959124 m!889109))

(declare-fun m!889123 () Bool)

(assert (=> b!959124 m!889123))

(declare-fun m!889125 () Bool)

(assert (=> b!959131 m!889125))

(declare-fun m!889127 () Bool)

(assert (=> b!959129 m!889127))

(assert (=> b!959128 m!889109))

(assert (=> b!959128 m!889109))

(declare-fun m!889129 () Bool)

(assert (=> b!959128 m!889129))

(declare-fun m!889131 () Bool)

(assert (=> mapNonEmpty!33886 m!889131))

(check-sat (not mapNonEmpty!33886) (not b!959124) (not b!959129) (not start!82274) (not b!959131) (not b!959130) (not b_next!18565) b_and!30027 (not b!959128) tp_is_empty!21271)
(check-sat b_and!30027 (not b_next!18565))
