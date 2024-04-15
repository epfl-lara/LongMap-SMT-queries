; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78786 () Bool)

(assert start!78786)

(declare-fun b_free!17017 () Bool)

(declare-fun b_next!17017 () Bool)

(assert (=> start!78786 (= b_free!17017 (not b_next!17017))))

(declare-fun tp!59493 () Bool)

(declare-fun b_and!27745 () Bool)

(assert (=> start!78786 (= tp!59493 b_and!27745)))

(declare-fun b!919689 () Bool)

(declare-fun res!620218 () Bool)

(declare-fun e!516195 () Bool)

(assert (=> b!919689 (=> (not res!620218) (not e!516195))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919689 (= res!620218 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919690 () Bool)

(declare-fun res!620211 () Bool)

(declare-fun e!516194 () Bool)

(assert (=> b!919690 (=> (not res!620211) (not e!516194))))

(declare-datatypes ((array!55011 0))(
  ( (array!55012 (arr!26451 (Array (_ BitVec 32) (_ BitVec 64))) (size!26912 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55011)

(assert (=> b!919690 (= res!620211 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26912 _keys!1487))))))

(declare-fun mapNonEmpty!31044 () Bool)

(declare-fun mapRes!31044 () Bool)

(declare-fun tp!59492 () Bool)

(declare-fun e!516191 () Bool)

(assert (=> mapNonEmpty!31044 (= mapRes!31044 (and tp!59492 e!516191))))

(declare-datatypes ((V!30999 0))(
  ( (V!31000 (val!9813 Int)) )
))
(declare-datatypes ((ValueCell!9281 0))(
  ( (ValueCellFull!9281 (v!12330 V!30999)) (EmptyCell!9281) )
))
(declare-datatypes ((array!55013 0))(
  ( (array!55014 (arr!26452 (Array (_ BitVec 32) ValueCell!9281)) (size!26913 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55013)

(declare-fun mapKey!31044 () (_ BitVec 32))

(declare-fun mapValue!31044 () ValueCell!9281)

(declare-fun mapRest!31044 () (Array (_ BitVec 32) ValueCell!9281))

(assert (=> mapNonEmpty!31044 (= (arr!26452 _values!1231) (store mapRest!31044 mapKey!31044 mapValue!31044))))

(declare-fun b!919691 () Bool)

(declare-fun tp_is_empty!19525 () Bool)

(assert (=> b!919691 (= e!516191 tp_is_empty!19525)))

(declare-fun b!919692 () Bool)

(declare-fun res!620214 () Bool)

(assert (=> b!919692 (=> (not res!620214) (not e!516195))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919692 (= res!620214 (validKeyInArray!0 k0!1099))))

(declare-fun b!919693 () Bool)

(declare-fun res!620217 () Bool)

(assert (=> b!919693 (=> (not res!620217) (not e!516194))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55011 (_ BitVec 32)) Bool)

(assert (=> b!919693 (= res!620217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31044 () Bool)

(assert (=> mapIsEmpty!31044 mapRes!31044))

(declare-fun b!919694 () Bool)

(declare-fun e!516193 () Bool)

(assert (=> b!919694 (= e!516193 (not true))))

(declare-datatypes ((List!18595 0))(
  ( (Nil!18592) (Cons!18591 (h!19737 (_ BitVec 64)) (t!26333 List!18595)) )
))
(declare-fun arrayNoDuplicates!0 (array!55011 (_ BitVec 32) List!18595) Bool)

(assert (=> b!919694 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18592)))

(declare-datatypes ((Unit!30970 0))(
  ( (Unit!30971) )
))
(declare-fun lt!412718 () Unit!30970)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55011 (_ BitVec 32) (_ BitVec 32)) Unit!30970)

(assert (=> b!919694 (= lt!412718 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12812 0))(
  ( (tuple2!12813 (_1!6417 (_ BitVec 64)) (_2!6417 V!30999)) )
))
(declare-datatypes ((List!18596 0))(
  ( (Nil!18593) (Cons!18592 (h!19738 tuple2!12812) (t!26334 List!18596)) )
))
(declare-datatypes ((ListLongMap!11499 0))(
  ( (ListLongMap!11500 (toList!5765 List!18596)) )
))
(declare-fun lt!412723 () ListLongMap!11499)

(declare-fun lt!412720 () tuple2!12812)

(declare-fun contains!4764 (ListLongMap!11499 (_ BitVec 64)) Bool)

(declare-fun +!2679 (ListLongMap!11499 tuple2!12812) ListLongMap!11499)

(assert (=> b!919694 (contains!4764 (+!2679 lt!412723 lt!412720) k0!1099)))

(declare-fun lt!412719 () (_ BitVec 64))

(declare-fun lt!412721 () V!30999)

(declare-fun lt!412722 () Unit!30970)

(declare-fun addStillContains!376 (ListLongMap!11499 (_ BitVec 64) V!30999 (_ BitVec 64)) Unit!30970)

(assert (=> b!919694 (= lt!412722 (addStillContains!376 lt!412723 lt!412719 lt!412721 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30999)

(declare-fun minValue!1173 () V!30999)

(declare-fun getCurrentListMap!2956 (array!55011 array!55013 (_ BitVec 32) (_ BitVec 32) V!30999 V!30999 (_ BitVec 32) Int) ListLongMap!11499)

(assert (=> b!919694 (= (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2679 (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412720))))

(assert (=> b!919694 (= lt!412720 (tuple2!12813 lt!412719 lt!412721))))

(declare-fun get!13880 (ValueCell!9281 V!30999) V!30999)

(declare-fun dynLambda!1435 (Int (_ BitVec 64)) V!30999)

(assert (=> b!919694 (= lt!412721 (get!13880 (select (arr!26452 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1435 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412724 () Unit!30970)

(declare-fun lemmaListMapRecursiveValidKeyArray!43 (array!55011 array!55013 (_ BitVec 32) (_ BitVec 32) V!30999 V!30999 (_ BitVec 32) Int) Unit!30970)

(assert (=> b!919694 (= lt!412724 (lemmaListMapRecursiveValidKeyArray!43 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919695 () Bool)

(declare-fun e!516189 () Bool)

(declare-fun e!516190 () Bool)

(assert (=> b!919695 (= e!516189 (and e!516190 mapRes!31044))))

(declare-fun condMapEmpty!31044 () Bool)

(declare-fun mapDefault!31044 () ValueCell!9281)

(assert (=> b!919695 (= condMapEmpty!31044 (= (arr!26452 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9281)) mapDefault!31044)))))

(declare-fun res!620210 () Bool)

(assert (=> start!78786 (=> (not res!620210) (not e!516194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78786 (= res!620210 (validMask!0 mask!1881))))

(assert (=> start!78786 e!516194))

(assert (=> start!78786 true))

(assert (=> start!78786 tp_is_empty!19525))

(declare-fun array_inv!20698 (array!55013) Bool)

(assert (=> start!78786 (and (array_inv!20698 _values!1231) e!516189)))

(assert (=> start!78786 tp!59493))

(declare-fun array_inv!20699 (array!55011) Bool)

(assert (=> start!78786 (array_inv!20699 _keys!1487)))

(declare-fun b!919696 () Bool)

(assert (=> b!919696 (= e!516194 e!516195)))

(declare-fun res!620213 () Bool)

(assert (=> b!919696 (=> (not res!620213) (not e!516195))))

(assert (=> b!919696 (= res!620213 (contains!4764 lt!412723 k0!1099))))

(assert (=> b!919696 (= lt!412723 (getCurrentListMap!2956 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919697 () Bool)

(assert (=> b!919697 (= e!516190 tp_is_empty!19525)))

(declare-fun b!919698 () Bool)

(assert (=> b!919698 (= e!516195 e!516193)))

(declare-fun res!620212 () Bool)

(assert (=> b!919698 (=> (not res!620212) (not e!516193))))

(assert (=> b!919698 (= res!620212 (validKeyInArray!0 lt!412719))))

(assert (=> b!919698 (= lt!412719 (select (arr!26451 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919699 () Bool)

(declare-fun res!620219 () Bool)

(assert (=> b!919699 (=> (not res!620219) (not e!516194))))

(assert (=> b!919699 (= res!620219 (and (= (size!26913 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26912 _keys!1487) (size!26913 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919700 () Bool)

(declare-fun res!620216 () Bool)

(assert (=> b!919700 (=> (not res!620216) (not e!516195))))

(declare-fun v!791 () V!30999)

(declare-fun apply!590 (ListLongMap!11499 (_ BitVec 64)) V!30999)

(assert (=> b!919700 (= res!620216 (= (apply!590 lt!412723 k0!1099) v!791))))

(declare-fun b!919701 () Bool)

(declare-fun res!620215 () Bool)

(assert (=> b!919701 (=> (not res!620215) (not e!516194))))

(assert (=> b!919701 (= res!620215 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18592))))

(assert (= (and start!78786 res!620210) b!919699))

(assert (= (and b!919699 res!620219) b!919693))

(assert (= (and b!919693 res!620217) b!919701))

(assert (= (and b!919701 res!620215) b!919690))

(assert (= (and b!919690 res!620211) b!919696))

(assert (= (and b!919696 res!620213) b!919700))

(assert (= (and b!919700 res!620216) b!919689))

(assert (= (and b!919689 res!620218) b!919692))

(assert (= (and b!919692 res!620214) b!919698))

(assert (= (and b!919698 res!620212) b!919694))

(assert (= (and b!919695 condMapEmpty!31044) mapIsEmpty!31044))

(assert (= (and b!919695 (not condMapEmpty!31044)) mapNonEmpty!31044))

(get-info :version)

(assert (= (and mapNonEmpty!31044 ((_ is ValueCellFull!9281) mapValue!31044)) b!919691))

(assert (= (and b!919695 ((_ is ValueCellFull!9281) mapDefault!31044)) b!919697))

(assert (= start!78786 b!919695))

(declare-fun b_lambda!13501 () Bool)

(assert (=> (not b_lambda!13501) (not b!919694)))

(declare-fun t!26332 () Bool)

(declare-fun tb!5589 () Bool)

(assert (=> (and start!78786 (= defaultEntry!1235 defaultEntry!1235) t!26332) tb!5589))

(declare-fun result!11009 () Bool)

(assert (=> tb!5589 (= result!11009 tp_is_empty!19525)))

(assert (=> b!919694 t!26332))

(declare-fun b_and!27747 () Bool)

(assert (= b_and!27745 (and (=> t!26332 result!11009) b_and!27747)))

(declare-fun m!853033 () Bool)

(assert (=> b!919694 m!853033))

(declare-fun m!853035 () Bool)

(assert (=> b!919694 m!853035))

(declare-fun m!853037 () Bool)

(assert (=> b!919694 m!853037))

(declare-fun m!853039 () Bool)

(assert (=> b!919694 m!853039))

(assert (=> b!919694 m!853037))

(assert (=> b!919694 m!853039))

(declare-fun m!853041 () Bool)

(assert (=> b!919694 m!853041))

(declare-fun m!853043 () Bool)

(assert (=> b!919694 m!853043))

(declare-fun m!853045 () Bool)

(assert (=> b!919694 m!853045))

(declare-fun m!853047 () Bool)

(assert (=> b!919694 m!853047))

(declare-fun m!853049 () Bool)

(assert (=> b!919694 m!853049))

(declare-fun m!853051 () Bool)

(assert (=> b!919694 m!853051))

(declare-fun m!853053 () Bool)

(assert (=> b!919694 m!853053))

(assert (=> b!919694 m!853033))

(assert (=> b!919694 m!853051))

(declare-fun m!853055 () Bool)

(assert (=> b!919694 m!853055))

(declare-fun m!853057 () Bool)

(assert (=> b!919692 m!853057))

(declare-fun m!853059 () Bool)

(assert (=> mapNonEmpty!31044 m!853059))

(declare-fun m!853061 () Bool)

(assert (=> b!919693 m!853061))

(declare-fun m!853063 () Bool)

(assert (=> b!919701 m!853063))

(declare-fun m!853065 () Bool)

(assert (=> b!919696 m!853065))

(declare-fun m!853067 () Bool)

(assert (=> b!919696 m!853067))

(declare-fun m!853069 () Bool)

(assert (=> b!919700 m!853069))

(declare-fun m!853071 () Bool)

(assert (=> b!919698 m!853071))

(declare-fun m!853073 () Bool)

(assert (=> b!919698 m!853073))

(declare-fun m!853075 () Bool)

(assert (=> start!78786 m!853075))

(declare-fun m!853077 () Bool)

(assert (=> start!78786 m!853077))

(declare-fun m!853079 () Bool)

(assert (=> start!78786 m!853079))

(check-sat (not start!78786) (not b!919692) (not b!919696) (not b!919698) (not b_lambda!13501) (not b!919700) tp_is_empty!19525 (not b!919693) (not b!919694) (not mapNonEmpty!31044) (not b!919701) (not b_next!17017) b_and!27747)
(check-sat b_and!27747 (not b_next!17017))
