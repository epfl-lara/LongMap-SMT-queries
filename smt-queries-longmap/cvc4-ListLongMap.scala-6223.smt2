; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79542 () Bool)

(assert start!79542)

(declare-fun b_free!17663 () Bool)

(declare-fun b_next!17663 () Bool)

(assert (=> start!79542 (= b_free!17663 (not b_next!17663))))

(declare-fun tp!61439 () Bool)

(declare-fun b_and!28901 () Bool)

(assert (=> start!79542 (= tp!61439 b_and!28901)))

(declare-fun b!935114 () Bool)

(declare-fun e!525071 () Bool)

(declare-fun e!525065 () Bool)

(assert (=> b!935114 (= e!525071 e!525065)))

(declare-fun res!629759 () Bool)

(assert (=> b!935114 (=> (not res!629759) (not e!525065))))

(declare-fun lt!421372 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935114 (= res!629759 (validKeyInArray!0 lt!421372))))

(declare-datatypes ((array!56282 0))(
  ( (array!56283 (arr!27083 (Array (_ BitVec 32) (_ BitVec 64))) (size!27542 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56282)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935114 (= lt!421372 (select (arr!27083 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935115 () Bool)

(declare-fun res!629762 () Bool)

(declare-fun e!525066 () Bool)

(assert (=> b!935115 (=> (not res!629762) (not e!525066))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31859 0))(
  ( (V!31860 (val!10136 Int)) )
))
(declare-datatypes ((ValueCell!9604 0))(
  ( (ValueCellFull!9604 (v!12657 V!31859)) (EmptyCell!9604) )
))
(declare-datatypes ((array!56284 0))(
  ( (array!56285 (arr!27084 (Array (_ BitVec 32) ValueCell!9604)) (size!27543 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56284)

(assert (=> b!935115 (= res!629762 (and (= (size!27543 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27542 _keys!1487) (size!27543 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935116 () Bool)

(declare-fun e!525068 () Bool)

(declare-fun tp_is_empty!20171 () Bool)

(assert (=> b!935116 (= e!525068 tp_is_empty!20171)))

(declare-fun b!935117 () Bool)

(declare-fun e!525067 () Bool)

(assert (=> b!935117 (= e!525067 tp_is_empty!20171)))

(declare-fun b!935118 () Bool)

(declare-fun e!525069 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935118 (= e!525069 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!935119 () Bool)

(declare-fun res!629752 () Bool)

(assert (=> b!935119 (=> (not res!629752) (not e!525071))))

(assert (=> b!935119 (= res!629752 (validKeyInArray!0 k!1099))))

(declare-fun b!935120 () Bool)

(declare-fun e!525063 () Bool)

(declare-fun e!525072 () Bool)

(assert (=> b!935120 (= e!525063 e!525072)))

(declare-fun res!629753 () Bool)

(assert (=> b!935120 (=> (not res!629753) (not e!525072))))

(declare-datatypes ((List!19082 0))(
  ( (Nil!19079) (Cons!19078 (h!20224 (_ BitVec 64)) (t!27289 List!19082)) )
))
(declare-fun contains!5069 (List!19082 (_ BitVec 64)) Bool)

(assert (=> b!935120 (= res!629753 (not (contains!5069 Nil!19079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!32022 () Bool)

(declare-fun mapRes!32022 () Bool)

(assert (=> mapIsEmpty!32022 mapRes!32022))

(declare-fun b!935121 () Bool)

(assert (=> b!935121 (= e!525066 e!525071)))

(declare-fun res!629756 () Bool)

(assert (=> b!935121 (=> (not res!629756) (not e!525071))))

(declare-datatypes ((tuple2!13302 0))(
  ( (tuple2!13303 (_1!6662 (_ BitVec 64)) (_2!6662 V!31859)) )
))
(declare-datatypes ((List!19083 0))(
  ( (Nil!19080) (Cons!19079 (h!20225 tuple2!13302) (t!27290 List!19083)) )
))
(declare-datatypes ((ListLongMap!11999 0))(
  ( (ListLongMap!12000 (toList!6015 List!19083)) )
))
(declare-fun lt!421377 () ListLongMap!11999)

(declare-fun contains!5070 (ListLongMap!11999 (_ BitVec 64)) Bool)

(assert (=> b!935121 (= res!629756 (contains!5070 lt!421377 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31859)

(declare-fun minValue!1173 () V!31859)

(declare-fun getCurrentListMap!3252 (array!56282 array!56284 (_ BitVec 32) (_ BitVec 32) V!31859 V!31859 (_ BitVec 32) Int) ListLongMap!11999)

(assert (=> b!935121 (= lt!421377 (getCurrentListMap!3252 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935122 () Bool)

(declare-fun res!629763 () Bool)

(assert (=> b!935122 (=> (not res!629763) (not e!525066))))

(assert (=> b!935122 (= res!629763 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27542 _keys!1487))))))

(declare-fun b!935123 () Bool)

(declare-fun res!629758 () Bool)

(assert (=> b!935123 (=> (not res!629758) (not e!525066))))

(declare-fun arrayNoDuplicates!0 (array!56282 (_ BitVec 32) List!19082) Bool)

(assert (=> b!935123 (= res!629758 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19079))))

(declare-fun mapNonEmpty!32022 () Bool)

(declare-fun tp!61438 () Bool)

(assert (=> mapNonEmpty!32022 (= mapRes!32022 (and tp!61438 e!525068))))

(declare-fun mapRest!32022 () (Array (_ BitVec 32) ValueCell!9604))

(declare-fun mapValue!32022 () ValueCell!9604)

(declare-fun mapKey!32022 () (_ BitVec 32))

(assert (=> mapNonEmpty!32022 (= (arr!27084 _values!1231) (store mapRest!32022 mapKey!32022 mapValue!32022))))

(declare-fun res!629761 () Bool)

(assert (=> start!79542 (=> (not res!629761) (not e!525066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79542 (= res!629761 (validMask!0 mask!1881))))

(assert (=> start!79542 e!525066))

(assert (=> start!79542 true))

(assert (=> start!79542 tp_is_empty!20171))

(declare-fun e!525064 () Bool)

(declare-fun array_inv!21078 (array!56284) Bool)

(assert (=> start!79542 (and (array_inv!21078 _values!1231) e!525064)))

(assert (=> start!79542 tp!61439))

(declare-fun array_inv!21079 (array!56282) Bool)

(assert (=> start!79542 (array_inv!21079 _keys!1487)))

(declare-fun b!935124 () Bool)

(declare-fun res!629755 () Bool)

(assert (=> b!935124 (=> res!629755 e!525063)))

(declare-fun noDuplicate!1352 (List!19082) Bool)

(assert (=> b!935124 (= res!629755 (not (noDuplicate!1352 Nil!19079)))))

(declare-fun b!935125 () Bool)

(declare-fun res!629754 () Bool)

(assert (=> b!935125 (=> (not res!629754) (not e!525066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56282 (_ BitVec 32)) Bool)

(assert (=> b!935125 (= res!629754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935126 () Bool)

(assert (=> b!935126 (= e!525069 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935127 () Bool)

(declare-fun res!629764 () Bool)

(assert (=> b!935127 (=> (not res!629764) (not e!525071))))

(assert (=> b!935127 (= res!629764 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935128 () Bool)

(assert (=> b!935128 (= e!525072 (not (contains!5069 Nil!19079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935129 () Bool)

(declare-fun res!629757 () Bool)

(assert (=> b!935129 (=> (not res!629757) (not e!525071))))

(declare-fun v!791 () V!31859)

(declare-fun apply!818 (ListLongMap!11999 (_ BitVec 64)) V!31859)

(assert (=> b!935129 (= res!629757 (= (apply!818 lt!421377 k!1099) v!791))))

(declare-fun b!935130 () Bool)

(assert (=> b!935130 (= e!525064 (and e!525067 mapRes!32022))))

(declare-fun condMapEmpty!32022 () Bool)

(declare-fun mapDefault!32022 () ValueCell!9604)

