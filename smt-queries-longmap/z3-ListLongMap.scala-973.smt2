; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21078 () Bool)

(assert start!21078)

(declare-fun b_free!5589 () Bool)

(declare-fun b_next!5589 () Bool)

(assert (=> start!21078 (= b_free!5589 (not b_next!5589))))

(declare-fun tp!19829 () Bool)

(declare-fun b_and!12419 () Bool)

(assert (=> start!21078 (= tp!19829 b_and!12419)))

(declare-fun b!212019 () Bool)

(declare-fun res!103606 () Bool)

(declare-fun e!137980 () Bool)

(assert (=> b!212019 (=> (not res!103606) (not e!137980))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10105 0))(
  ( (array!10106 (arr!4796 (Array (_ BitVec 32) (_ BitVec 64))) (size!5121 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10105)

(assert (=> b!212019 (= res!103606 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5121 _keys!825))))))

(declare-fun b!212020 () Bool)

(declare-fun e!137979 () Bool)

(declare-datatypes ((V!6915 0))(
  ( (V!6916 (val!2770 Int)) )
))
(declare-datatypes ((ValueCell!2382 0))(
  ( (ValueCellFull!2382 (v!4768 V!6915)) (EmptyCell!2382) )
))
(declare-datatypes ((array!10107 0))(
  ( (array!10108 (arr!4797 (Array (_ BitVec 32) ValueCell!2382)) (size!5122 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10107)

(assert (=> b!212020 (= e!137979 (bvslt i!601 (size!5122 _values!649)))))

(declare-datatypes ((tuple2!4190 0))(
  ( (tuple2!4191 (_1!2106 (_ BitVec 64)) (_2!2106 V!6915)) )
))
(declare-datatypes ((List!3081 0))(
  ( (Nil!3078) (Cons!3077 (h!3719 tuple2!4190) (t!8026 List!3081)) )
))
(declare-datatypes ((ListLongMap!3103 0))(
  ( (ListLongMap!3104 (toList!1567 List!3081)) )
))
(declare-fun lt!109168 () ListLongMap!3103)

(declare-fun lt!109159 () ListLongMap!3103)

(declare-fun lt!109162 () tuple2!4190)

(declare-fun +!570 (ListLongMap!3103 tuple2!4190) ListLongMap!3103)

(assert (=> b!212020 (= lt!109168 (+!570 lt!109159 lt!109162))))

(declare-fun lt!109167 () ListLongMap!3103)

(declare-datatypes ((Unit!6434 0))(
  ( (Unit!6435) )
))
(declare-fun lt!109161 () Unit!6434)

(declare-fun v!520 () V!6915)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun zeroValue!615 () V!6915)

(declare-fun addCommutativeForDiffKeys!204 (ListLongMap!3103 (_ BitVec 64) V!6915 (_ BitVec 64) V!6915) Unit!6434)

(assert (=> b!212020 (= lt!109161 (addCommutativeForDiffKeys!204 lt!109167 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212021 () Bool)

(declare-fun res!103609 () Bool)

(assert (=> b!212021 (=> (not res!103609) (not e!137980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212021 (= res!103609 (validKeyInArray!0 k0!843))))

(declare-fun b!212022 () Bool)

(declare-fun res!103604 () Bool)

(assert (=> b!212022 (=> (not res!103604) (not e!137980))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10105 (_ BitVec 32)) Bool)

(assert (=> b!212022 (= res!103604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212023 () Bool)

(declare-fun e!137975 () Bool)

(declare-fun e!137977 () Bool)

(declare-fun mapRes!9266 () Bool)

(assert (=> b!212023 (= e!137975 (and e!137977 mapRes!9266))))

(declare-fun condMapEmpty!9266 () Bool)

(declare-fun mapDefault!9266 () ValueCell!2382)

(assert (=> b!212023 (= condMapEmpty!9266 (= (arr!4797 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2382)) mapDefault!9266)))))

(declare-fun mapIsEmpty!9266 () Bool)

(assert (=> mapIsEmpty!9266 mapRes!9266))

(declare-fun res!103605 () Bool)

(assert (=> start!21078 (=> (not res!103605) (not e!137980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21078 (= res!103605 (validMask!0 mask!1149))))

(assert (=> start!21078 e!137980))

(declare-fun array_inv!3173 (array!10107) Bool)

(assert (=> start!21078 (and (array_inv!3173 _values!649) e!137975)))

(assert (=> start!21078 true))

(declare-fun tp_is_empty!5451 () Bool)

(assert (=> start!21078 tp_is_empty!5451))

(declare-fun array_inv!3174 (array!10105) Bool)

(assert (=> start!21078 (array_inv!3174 _keys!825)))

(assert (=> start!21078 tp!19829))

(declare-fun b!212024 () Bool)

(declare-fun e!137976 () Bool)

(assert (=> b!212024 (= e!137976 tp_is_empty!5451)))

(declare-fun b!212025 () Bool)

(declare-fun res!103607 () Bool)

(assert (=> b!212025 (=> (not res!103607) (not e!137980))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212025 (= res!103607 (and (= (size!5122 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5121 _keys!825) (size!5122 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212026 () Bool)

(declare-fun res!103601 () Bool)

(assert (=> b!212026 (=> (not res!103601) (not e!137980))))

(assert (=> b!212026 (= res!103601 (= (select (arr!4796 _keys!825) i!601) k0!843))))

(declare-fun b!212027 () Bool)

(declare-fun res!103602 () Bool)

(assert (=> b!212027 (=> (not res!103602) (not e!137980))))

(declare-datatypes ((List!3082 0))(
  ( (Nil!3079) (Cons!3078 (h!3720 (_ BitVec 64)) (t!8027 List!3082)) )
))
(declare-fun arrayNoDuplicates!0 (array!10105 (_ BitVec 32) List!3082) Bool)

(assert (=> b!212027 (= res!103602 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3079))))

(declare-fun mapNonEmpty!9266 () Bool)

(declare-fun tp!19828 () Bool)

(assert (=> mapNonEmpty!9266 (= mapRes!9266 (and tp!19828 e!137976))))

(declare-fun mapValue!9266 () ValueCell!2382)

(declare-fun mapRest!9266 () (Array (_ BitVec 32) ValueCell!2382))

(declare-fun mapKey!9266 () (_ BitVec 32))

(assert (=> mapNonEmpty!9266 (= (arr!4797 _values!649) (store mapRest!9266 mapKey!9266 mapValue!9266))))

(declare-fun b!212028 () Bool)

(declare-fun e!137978 () Bool)

(assert (=> b!212028 (= e!137980 (not e!137978))))

(declare-fun res!103603 () Bool)

(assert (=> b!212028 (=> res!103603 e!137978)))

(assert (=> b!212028 (= res!103603 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!109166 () ListLongMap!3103)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6915)

(declare-fun getCurrentListMap!1100 (array!10105 array!10107 (_ BitVec 32) (_ BitVec 32) V!6915 V!6915 (_ BitVec 32) Int) ListLongMap!3103)

(assert (=> b!212028 (= lt!109166 (getCurrentListMap!1100 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109160 () ListLongMap!3103)

(declare-fun lt!109169 () array!10107)

(assert (=> b!212028 (= lt!109160 (getCurrentListMap!1100 _keys!825 lt!109169 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109165 () ListLongMap!3103)

(declare-fun lt!109170 () ListLongMap!3103)

(assert (=> b!212028 (and (= lt!109165 lt!109170) (= lt!109170 lt!109165))))

(assert (=> b!212028 (= lt!109170 (+!570 lt!109167 lt!109162))))

(assert (=> b!212028 (= lt!109162 (tuple2!4191 k0!843 v!520))))

(declare-fun lt!109164 () Unit!6434)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 (array!10105 array!10107 (_ BitVec 32) (_ BitVec 32) V!6915 V!6915 (_ BitVec 32) (_ BitVec 64) V!6915 (_ BitVec 32) Int) Unit!6434)

(assert (=> b!212028 (= lt!109164 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!502 (array!10105 array!10107 (_ BitVec 32) (_ BitVec 32) V!6915 V!6915 (_ BitVec 32) Int) ListLongMap!3103)

(assert (=> b!212028 (= lt!109165 (getCurrentListMapNoExtraKeys!502 _keys!825 lt!109169 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212028 (= lt!109169 (array!10108 (store (arr!4797 _values!649) i!601 (ValueCellFull!2382 v!520)) (size!5122 _values!649)))))

(assert (=> b!212028 (= lt!109167 (getCurrentListMapNoExtraKeys!502 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212029 () Bool)

(assert (=> b!212029 (= e!137978 e!137979)))

(declare-fun res!103608 () Bool)

(assert (=> b!212029 (=> res!103608 e!137979)))

(assert (=> b!212029 (= res!103608 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!212029 (= lt!109160 lt!109168)))

(declare-fun lt!109163 () tuple2!4190)

(assert (=> b!212029 (= lt!109168 (+!570 lt!109170 lt!109163))))

(assert (=> b!212029 (= lt!109166 lt!109159)))

(assert (=> b!212029 (= lt!109159 (+!570 lt!109167 lt!109163))))

(assert (=> b!212029 (= lt!109160 (+!570 lt!109165 lt!109163))))

(assert (=> b!212029 (= lt!109163 (tuple2!4191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212030 () Bool)

(assert (=> b!212030 (= e!137977 tp_is_empty!5451)))

(assert (= (and start!21078 res!103605) b!212025))

(assert (= (and b!212025 res!103607) b!212022))

(assert (= (and b!212022 res!103604) b!212027))

(assert (= (and b!212027 res!103602) b!212019))

(assert (= (and b!212019 res!103606) b!212021))

(assert (= (and b!212021 res!103609) b!212026))

(assert (= (and b!212026 res!103601) b!212028))

(assert (= (and b!212028 (not res!103603)) b!212029))

(assert (= (and b!212029 (not res!103608)) b!212020))

(assert (= (and b!212023 condMapEmpty!9266) mapIsEmpty!9266))

(assert (= (and b!212023 (not condMapEmpty!9266)) mapNonEmpty!9266))

(get-info :version)

(assert (= (and mapNonEmpty!9266 ((_ is ValueCellFull!2382) mapValue!9266)) b!212024))

(assert (= (and b!212023 ((_ is ValueCellFull!2382) mapDefault!9266)) b!212030))

(assert (= start!21078 b!212023))

(declare-fun m!239791 () Bool)

(assert (=> start!21078 m!239791))

(declare-fun m!239793 () Bool)

(assert (=> start!21078 m!239793))

(declare-fun m!239795 () Bool)

(assert (=> start!21078 m!239795))

(declare-fun m!239797 () Bool)

(assert (=> b!212027 m!239797))

(declare-fun m!239799 () Bool)

(assert (=> mapNonEmpty!9266 m!239799))

(declare-fun m!239801 () Bool)

(assert (=> b!212029 m!239801))

(declare-fun m!239803 () Bool)

(assert (=> b!212029 m!239803))

(declare-fun m!239805 () Bool)

(assert (=> b!212029 m!239805))

(declare-fun m!239807 () Bool)

(assert (=> b!212026 m!239807))

(declare-fun m!239809 () Bool)

(assert (=> b!212020 m!239809))

(declare-fun m!239811 () Bool)

(assert (=> b!212020 m!239811))

(declare-fun m!239813 () Bool)

(assert (=> b!212021 m!239813))

(declare-fun m!239815 () Bool)

(assert (=> b!212022 m!239815))

(declare-fun m!239817 () Bool)

(assert (=> b!212028 m!239817))

(declare-fun m!239819 () Bool)

(assert (=> b!212028 m!239819))

(declare-fun m!239821 () Bool)

(assert (=> b!212028 m!239821))

(declare-fun m!239823 () Bool)

(assert (=> b!212028 m!239823))

(declare-fun m!239825 () Bool)

(assert (=> b!212028 m!239825))

(declare-fun m!239827 () Bool)

(assert (=> b!212028 m!239827))

(declare-fun m!239829 () Bool)

(assert (=> b!212028 m!239829))

(check-sat (not b!212028) (not b!212020) (not b!212027) (not b!212021) (not b!212029) (not b!212022) tp_is_empty!5451 b_and!12419 (not b_next!5589) (not mapNonEmpty!9266) (not start!21078))
(check-sat b_and!12419 (not b_next!5589))
