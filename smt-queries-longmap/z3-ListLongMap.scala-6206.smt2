; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79538 () Bool)

(assert start!79538)

(declare-fun b_free!17557 () Bool)

(declare-fun b_next!17557 () Bool)

(assert (=> start!79538 (= b_free!17557 (not b_next!17557))))

(declare-fun tp!61116 () Bool)

(declare-fun b_and!28683 () Bool)

(assert (=> start!79538 (= tp!61116 b_and!28683)))

(declare-fun b!933307 () Bool)

(declare-fun e!524195 () Bool)

(assert (=> b!933307 (= e!524195 (not true))))

(declare-datatypes ((V!31719 0))(
  ( (V!31720 (val!10083 Int)) )
))
(declare-datatypes ((tuple2!13200 0))(
  ( (tuple2!13201 (_1!6611 (_ BitVec 64)) (_2!6611 V!31719)) )
))
(declare-datatypes ((List!18982 0))(
  ( (Nil!18979) (Cons!18978 (h!20130 tuple2!13200) (t!27075 List!18982)) )
))
(declare-datatypes ((ListLongMap!11899 0))(
  ( (ListLongMap!11900 (toList!5965 List!18982)) )
))
(declare-fun lt!420243 () ListLongMap!11899)

(declare-fun lt!420242 () tuple2!13200)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5030 (ListLongMap!11899 (_ BitVec 64)) Bool)

(declare-fun +!2793 (ListLongMap!11899 tuple2!13200) ListLongMap!11899)

(assert (=> b!933307 (contains!5030 (+!2793 lt!420243 lt!420242) k0!1099)))

(declare-fun lt!420238 () (_ BitVec 64))

(declare-datatypes ((Unit!31456 0))(
  ( (Unit!31457) )
))
(declare-fun lt!420239 () Unit!31456)

(declare-fun lt!420241 () V!31719)

(declare-fun addStillContains!496 (ListLongMap!11899 (_ BitVec 64) V!31719 (_ BitVec 64)) Unit!31456)

(assert (=> b!933307 (= lt!420239 (addStillContains!496 lt!420243 lt!420238 lt!420241 k0!1099))))

(declare-datatypes ((array!56125 0))(
  ( (array!56126 (arr!27002 (Array (_ BitVec 32) (_ BitVec 64))) (size!27462 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56125)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9551 0))(
  ( (ValueCellFull!9551 (v!12599 V!31719)) (EmptyCell!9551) )
))
(declare-datatypes ((array!56127 0))(
  ( (array!56128 (arr!27003 (Array (_ BitVec 32) ValueCell!9551)) (size!27463 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56127)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31719)

(declare-fun minValue!1173 () V!31719)

(declare-fun getCurrentListMap!3207 (array!56125 array!56127 (_ BitVec 32) (_ BitVec 32) V!31719 V!31719 (_ BitVec 32) Int) ListLongMap!11899)

(assert (=> b!933307 (= (getCurrentListMap!3207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2793 (getCurrentListMap!3207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420242))))

(assert (=> b!933307 (= lt!420242 (tuple2!13201 lt!420238 lt!420241))))

(declare-fun get!14217 (ValueCell!9551 V!31719) V!31719)

(declare-fun dynLambda!1590 (Int (_ BitVec 64)) V!31719)

(assert (=> b!933307 (= lt!420241 (get!14217 (select (arr!27003 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1590 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420240 () Unit!31456)

(declare-fun lemmaListMapRecursiveValidKeyArray!173 (array!56125 array!56127 (_ BitVec 32) (_ BitVec 32) V!31719 V!31719 (_ BitVec 32) Int) Unit!31456)

(assert (=> b!933307 (= lt!420240 (lemmaListMapRecursiveValidKeyArray!173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933308 () Bool)

(declare-fun res!628306 () Bool)

(declare-fun e!524193 () Bool)

(assert (=> b!933308 (=> (not res!628306) (not e!524193))))

(assert (=> b!933308 (= res!628306 (and (= (size!27463 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27462 _keys!1487) (size!27463 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933309 () Bool)

(declare-fun res!628302 () Bool)

(declare-fun e!524198 () Bool)

(assert (=> b!933309 (=> (not res!628302) (not e!524198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933309 (= res!628302 (validKeyInArray!0 k0!1099))))

(declare-fun b!933310 () Bool)

(assert (=> b!933310 (= e!524198 e!524195)))

(declare-fun res!628304 () Bool)

(assert (=> b!933310 (=> (not res!628304) (not e!524195))))

(assert (=> b!933310 (= res!628304 (validKeyInArray!0 lt!420238))))

(assert (=> b!933310 (= lt!420238 (select (arr!27002 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!628308 () Bool)

(assert (=> start!79538 (=> (not res!628308) (not e!524193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79538 (= res!628308 (validMask!0 mask!1881))))

(assert (=> start!79538 e!524193))

(assert (=> start!79538 true))

(declare-fun tp_is_empty!20065 () Bool)

(assert (=> start!79538 tp_is_empty!20065))

(declare-fun e!524199 () Bool)

(declare-fun array_inv!21102 (array!56127) Bool)

(assert (=> start!79538 (and (array_inv!21102 _values!1231) e!524199)))

(assert (=> start!79538 tp!61116))

(declare-fun array_inv!21103 (array!56125) Bool)

(assert (=> start!79538 (array_inv!21103 _keys!1487)))

(declare-fun b!933311 () Bool)

(declare-fun e!524196 () Bool)

(assert (=> b!933311 (= e!524196 tp_is_empty!20065)))

(declare-fun mapNonEmpty!31857 () Bool)

(declare-fun mapRes!31857 () Bool)

(declare-fun tp!61115 () Bool)

(assert (=> mapNonEmpty!31857 (= mapRes!31857 (and tp!61115 e!524196))))

(declare-fun mapKey!31857 () (_ BitVec 32))

(declare-fun mapValue!31857 () ValueCell!9551)

(declare-fun mapRest!31857 () (Array (_ BitVec 32) ValueCell!9551))

(assert (=> mapNonEmpty!31857 (= (arr!27003 _values!1231) (store mapRest!31857 mapKey!31857 mapValue!31857))))

(declare-fun mapIsEmpty!31857 () Bool)

(assert (=> mapIsEmpty!31857 mapRes!31857))

(declare-fun b!933312 () Bool)

(declare-fun res!628300 () Bool)

(assert (=> b!933312 (=> (not res!628300) (not e!524198))))

(assert (=> b!933312 (= res!628300 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933313 () Bool)

(declare-fun res!628303 () Bool)

(assert (=> b!933313 (=> (not res!628303) (not e!524193))))

(assert (=> b!933313 (= res!628303 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27462 _keys!1487))))))

(declare-fun b!933314 () Bool)

(declare-fun res!628305 () Bool)

(assert (=> b!933314 (=> (not res!628305) (not e!524193))))

(declare-datatypes ((List!18983 0))(
  ( (Nil!18980) (Cons!18979 (h!20131 (_ BitVec 64)) (t!27076 List!18983)) )
))
(declare-fun arrayNoDuplicates!0 (array!56125 (_ BitVec 32) List!18983) Bool)

(assert (=> b!933314 (= res!628305 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18980))))

(declare-fun b!933315 () Bool)

(declare-fun e!524197 () Bool)

(assert (=> b!933315 (= e!524197 tp_is_empty!20065)))

(declare-fun b!933316 () Bool)

(assert (=> b!933316 (= e!524199 (and e!524197 mapRes!31857))))

(declare-fun condMapEmpty!31857 () Bool)

(declare-fun mapDefault!31857 () ValueCell!9551)

(assert (=> b!933316 (= condMapEmpty!31857 (= (arr!27003 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9551)) mapDefault!31857)))))

(declare-fun b!933317 () Bool)

(declare-fun res!628307 () Bool)

(assert (=> b!933317 (=> (not res!628307) (not e!524198))))

(declare-fun v!791 () V!31719)

(declare-fun apply!793 (ListLongMap!11899 (_ BitVec 64)) V!31719)

(assert (=> b!933317 (= res!628307 (= (apply!793 lt!420243 k0!1099) v!791))))

(declare-fun b!933318 () Bool)

(declare-fun res!628299 () Bool)

(assert (=> b!933318 (=> (not res!628299) (not e!524193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56125 (_ BitVec 32)) Bool)

(assert (=> b!933318 (= res!628299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933319 () Bool)

(assert (=> b!933319 (= e!524193 e!524198)))

(declare-fun res!628301 () Bool)

(assert (=> b!933319 (=> (not res!628301) (not e!524198))))

(assert (=> b!933319 (= res!628301 (contains!5030 lt!420243 k0!1099))))

(assert (=> b!933319 (= lt!420243 (getCurrentListMap!3207 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79538 res!628308) b!933308))

(assert (= (and b!933308 res!628306) b!933318))

(assert (= (and b!933318 res!628299) b!933314))

(assert (= (and b!933314 res!628305) b!933313))

(assert (= (and b!933313 res!628303) b!933319))

(assert (= (and b!933319 res!628301) b!933317))

(assert (= (and b!933317 res!628307) b!933312))

(assert (= (and b!933312 res!628300) b!933309))

(assert (= (and b!933309 res!628302) b!933310))

(assert (= (and b!933310 res!628304) b!933307))

(assert (= (and b!933316 condMapEmpty!31857) mapIsEmpty!31857))

(assert (= (and b!933316 (not condMapEmpty!31857)) mapNonEmpty!31857))

(get-info :version)

(assert (= (and mapNonEmpty!31857 ((_ is ValueCellFull!9551) mapValue!31857)) b!933311))

(assert (= (and b!933316 ((_ is ValueCellFull!9551) mapDefault!31857)) b!933315))

(assert (= start!79538 b!933316))

(declare-fun b_lambda!13905 () Bool)

(assert (=> (not b_lambda!13905) (not b!933307)))

(declare-fun t!27074 () Bool)

(declare-fun tb!5943 () Bool)

(assert (=> (and start!79538 (= defaultEntry!1235 defaultEntry!1235) t!27074) tb!5943))

(declare-fun result!11719 () Bool)

(assert (=> tb!5943 (= result!11719 tp_is_empty!20065)))

(assert (=> b!933307 t!27074))

(declare-fun b_and!28685 () Bool)

(assert (= b_and!28683 (and (=> t!27074 result!11719) b_and!28685)))

(declare-fun m!867665 () Bool)

(assert (=> b!933317 m!867665))

(declare-fun m!867667 () Bool)

(assert (=> b!933314 m!867667))

(declare-fun m!867669 () Bool)

(assert (=> b!933310 m!867669))

(declare-fun m!867671 () Bool)

(assert (=> b!933310 m!867671))

(declare-fun m!867673 () Bool)

(assert (=> b!933309 m!867673))

(declare-fun m!867675 () Bool)

(assert (=> mapNonEmpty!31857 m!867675))

(declare-fun m!867677 () Bool)

(assert (=> b!933318 m!867677))

(declare-fun m!867679 () Bool)

(assert (=> b!933307 m!867679))

(declare-fun m!867681 () Bool)

(assert (=> b!933307 m!867681))

(declare-fun m!867683 () Bool)

(assert (=> b!933307 m!867683))

(declare-fun m!867685 () Bool)

(assert (=> b!933307 m!867685))

(declare-fun m!867687 () Bool)

(assert (=> b!933307 m!867687))

(declare-fun m!867689 () Bool)

(assert (=> b!933307 m!867689))

(declare-fun m!867691 () Bool)

(assert (=> b!933307 m!867691))

(assert (=> b!933307 m!867689))

(assert (=> b!933307 m!867691))

(declare-fun m!867693 () Bool)

(assert (=> b!933307 m!867693))

(declare-fun m!867695 () Bool)

(assert (=> b!933307 m!867695))

(assert (=> b!933307 m!867679))

(assert (=> b!933307 m!867685))

(declare-fun m!867697 () Bool)

(assert (=> b!933307 m!867697))

(declare-fun m!867699 () Bool)

(assert (=> start!79538 m!867699))

(declare-fun m!867701 () Bool)

(assert (=> start!79538 m!867701))

(declare-fun m!867703 () Bool)

(assert (=> start!79538 m!867703))

(declare-fun m!867705 () Bool)

(assert (=> b!933319 m!867705))

(declare-fun m!867707 () Bool)

(assert (=> b!933319 m!867707))

(check-sat (not b_next!17557) tp_is_empty!20065 (not b!933318) (not b!933314) b_and!28685 (not b!933309) (not mapNonEmpty!31857) (not b!933319) (not b_lambda!13905) (not start!79538) (not b!933317) (not b!933307) (not b!933310))
(check-sat b_and!28685 (not b_next!17557))
