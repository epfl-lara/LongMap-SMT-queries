; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113380 () Bool)

(assert start!113380)

(declare-fun b_free!31207 () Bool)

(declare-fun b_next!31207 () Bool)

(assert (=> start!113380 (= b_free!31207 (not b_next!31207))))

(declare-fun tp!109425 () Bool)

(declare-fun b_and!50323 () Bool)

(assert (=> start!113380 (= tp!109425 b_and!50323)))

(declare-fun mapNonEmpty!57517 () Bool)

(declare-fun mapRes!57517 () Bool)

(declare-fun tp!109426 () Bool)

(declare-fun e!764872 () Bool)

(assert (=> mapNonEmpty!57517 (= mapRes!57517 (and tp!109426 e!764872))))

(declare-datatypes ((V!54713 0))(
  ( (V!54714 (val!18678 Int)) )
))
(declare-datatypes ((ValueCell!17705 0))(
  ( (ValueCellFull!17705 (v!21321 V!54713)) (EmptyCell!17705) )
))
(declare-fun mapRest!57517 () (Array (_ BitVec 32) ValueCell!17705))

(declare-fun mapKey!57517 () (_ BitVec 32))

(declare-fun mapValue!57517 () ValueCell!17705)

(declare-datatypes ((array!91383 0))(
  ( (array!91384 (arr!44143 (Array (_ BitVec 32) ValueCell!17705)) (size!44694 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91383)

(assert (=> mapNonEmpty!57517 (= (arr!44143 _values!1303) (store mapRest!57517 mapKey!57517 mapValue!57517))))

(declare-fun mapIsEmpty!57517 () Bool)

(assert (=> mapIsEmpty!57517 mapRes!57517))

(declare-fun b!1343126 () Bool)

(declare-fun res!890716 () Bool)

(declare-fun e!764874 () Bool)

(assert (=> b!1343126 (=> (not res!890716) (not e!764874))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91385 0))(
  ( (array!91386 (arr!44144 (Array (_ BitVec 32) (_ BitVec 64))) (size!44695 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91385)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343126 (= res!890716 (not (= (select (arr!44144 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343127 () Bool)

(declare-fun res!890710 () Bool)

(assert (=> b!1343127 (=> (not res!890710) (not e!764874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343127 (= res!890710 (validKeyInArray!0 (select (arr!44144 _keys!1571) from!1960)))))

(declare-fun b!1343128 () Bool)

(declare-fun res!890714 () Bool)

(assert (=> b!1343128 (=> (not res!890714) (not e!764874))))

(declare-datatypes ((List!31259 0))(
  ( (Nil!31256) (Cons!31255 (h!32473 (_ BitVec 64)) (t!45669 List!31259)) )
))
(declare-fun arrayNoDuplicates!0 (array!91385 (_ BitVec 32) List!31259) Bool)

(assert (=> b!1343128 (= res!890714 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31256))))

(declare-fun b!1343129 () Bool)

(declare-fun res!890712 () Bool)

(assert (=> b!1343129 (=> (not res!890712) (not e!764874))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343129 (= res!890712 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!890711 () Bool)

(assert (=> start!113380 (=> (not res!890711) (not e!764874))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113380 (= res!890711 (validMask!0 mask!1977))))

(assert (=> start!113380 e!764874))

(declare-fun tp_is_empty!37207 () Bool)

(assert (=> start!113380 tp_is_empty!37207))

(assert (=> start!113380 true))

(declare-fun array_inv!33547 (array!91385) Bool)

(assert (=> start!113380 (array_inv!33547 _keys!1571)))

(declare-fun e!764873 () Bool)

(declare-fun array_inv!33548 (array!91383) Bool)

(assert (=> start!113380 (and (array_inv!33548 _values!1303) e!764873)))

(assert (=> start!113380 tp!109425))

(declare-fun b!1343130 () Bool)

(declare-fun res!890709 () Bool)

(assert (=> b!1343130 (=> (not res!890709) (not e!764874))))

(declare-fun minValue!1245 () V!54713)

(declare-fun zeroValue!1245 () V!54713)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24108 0))(
  ( (tuple2!24109 (_1!12065 (_ BitVec 64)) (_2!12065 V!54713)) )
))
(declare-datatypes ((List!31260 0))(
  ( (Nil!31257) (Cons!31256 (h!32474 tuple2!24108) (t!45670 List!31260)) )
))
(declare-datatypes ((ListLongMap!21773 0))(
  ( (ListLongMap!21774 (toList!10902 List!31260)) )
))
(declare-fun contains!9090 (ListLongMap!21773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5850 (array!91385 array!91383 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21773)

(assert (=> b!1343130 (= res!890709 (contains!9090 (getCurrentListMap!5850 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343131 () Bool)

(assert (=> b!1343131 (= e!764872 tp_is_empty!37207)))

(declare-fun b!1343132 () Bool)

(declare-fun e!764875 () Bool)

(assert (=> b!1343132 (= e!764873 (and e!764875 mapRes!57517))))

(declare-fun condMapEmpty!57517 () Bool)

(declare-fun mapDefault!57517 () ValueCell!17705)

(assert (=> b!1343132 (= condMapEmpty!57517 (= (arr!44143 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17705)) mapDefault!57517)))))

(declare-fun b!1343133 () Bool)

(declare-fun res!890715 () Bool)

(assert (=> b!1343133 (=> (not res!890715) (not e!764874))))

(assert (=> b!1343133 (= res!890715 (and (= (size!44694 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44695 _keys!1571) (size!44694 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343134 () Bool)

(assert (=> b!1343134 (= e!764875 tp_is_empty!37207)))

(declare-fun b!1343135 () Bool)

(declare-fun res!890717 () Bool)

(assert (=> b!1343135 (=> (not res!890717) (not e!764874))))

(assert (=> b!1343135 (= res!890717 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44695 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343136 () Bool)

(declare-fun res!890713 () Bool)

(assert (=> b!1343136 (=> (not res!890713) (not e!764874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91385 (_ BitVec 32)) Bool)

(assert (=> b!1343136 (= res!890713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343137 () Bool)

(assert (=> b!1343137 (= e!764874 (not true))))

(declare-fun lt!594717 () ListLongMap!21773)

(assert (=> b!1343137 (contains!9090 lt!594717 k0!1142)))

(declare-fun lt!594719 () V!54713)

(declare-datatypes ((Unit!43978 0))(
  ( (Unit!43979) )
))
(declare-fun lt!594718 () Unit!43978)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!345 ((_ BitVec 64) (_ BitVec 64) V!54713 ListLongMap!21773) Unit!43978)

(assert (=> b!1343137 (= lt!594718 (lemmaInListMapAfterAddingDiffThenInBefore!345 k0!1142 (select (arr!44144 _keys!1571) from!1960) lt!594719 lt!594717))))

(declare-fun lt!594715 () ListLongMap!21773)

(assert (=> b!1343137 (contains!9090 lt!594715 k0!1142)))

(declare-fun lt!594716 () Unit!43978)

(assert (=> b!1343137 (= lt!594716 (lemmaInListMapAfterAddingDiffThenInBefore!345 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594715))))

(declare-fun +!4819 (ListLongMap!21773 tuple2!24108) ListLongMap!21773)

(assert (=> b!1343137 (= lt!594715 (+!4819 lt!594717 (tuple2!24109 (select (arr!44144 _keys!1571) from!1960) lt!594719)))))

(declare-fun get!22297 (ValueCell!17705 V!54713) V!54713)

(declare-fun dynLambda!3773 (Int (_ BitVec 64)) V!54713)

(assert (=> b!1343137 (= lt!594719 (get!22297 (select (arr!44143 _values!1303) from!1960) (dynLambda!3773 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6468 (array!91385 array!91383 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21773)

(assert (=> b!1343137 (= lt!594717 (getCurrentListMapNoExtraKeys!6468 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and start!113380 res!890711) b!1343133))

(assert (= (and b!1343133 res!890715) b!1343136))

(assert (= (and b!1343136 res!890713) b!1343128))

(assert (= (and b!1343128 res!890714) b!1343135))

(assert (= (and b!1343135 res!890717) b!1343130))

(assert (= (and b!1343130 res!890709) b!1343126))

(assert (= (and b!1343126 res!890716) b!1343127))

(assert (= (and b!1343127 res!890710) b!1343129))

(assert (= (and b!1343129 res!890712) b!1343137))

(assert (= (and b!1343132 condMapEmpty!57517) mapIsEmpty!57517))

(assert (= (and b!1343132 (not condMapEmpty!57517)) mapNonEmpty!57517))

(get-info :version)

(assert (= (and mapNonEmpty!57517 ((_ is ValueCellFull!17705) mapValue!57517)) b!1343131))

(assert (= (and b!1343132 ((_ is ValueCellFull!17705) mapDefault!57517)) b!1343134))

(assert (= start!113380 b!1343132))

(declare-fun b_lambda!24377 () Bool)

(assert (=> (not b_lambda!24377) (not b!1343137)))

(declare-fun t!45668 () Bool)

(declare-fun tb!12213 () Bool)

(assert (=> (and start!113380 (= defaultEntry!1306 defaultEntry!1306) t!45668) tb!12213))

(declare-fun result!25525 () Bool)

(assert (=> tb!12213 (= result!25525 tp_is_empty!37207)))

(assert (=> b!1343137 t!45668))

(declare-fun b_and!50325 () Bool)

(assert (= b_and!50323 (and (=> t!45668 result!25525) b_and!50325)))

(declare-fun m!1231047 () Bool)

(assert (=> b!1343128 m!1231047))

(declare-fun m!1231049 () Bool)

(assert (=> start!113380 m!1231049))

(declare-fun m!1231051 () Bool)

(assert (=> start!113380 m!1231051))

(declare-fun m!1231053 () Bool)

(assert (=> start!113380 m!1231053))

(declare-fun m!1231055 () Bool)

(assert (=> b!1343127 m!1231055))

(assert (=> b!1343127 m!1231055))

(declare-fun m!1231057 () Bool)

(assert (=> b!1343127 m!1231057))

(declare-fun m!1231059 () Bool)

(assert (=> b!1343137 m!1231059))

(declare-fun m!1231061 () Bool)

(assert (=> b!1343137 m!1231061))

(declare-fun m!1231063 () Bool)

(assert (=> b!1343137 m!1231063))

(declare-fun m!1231065 () Bool)

(assert (=> b!1343137 m!1231065))

(assert (=> b!1343137 m!1231061))

(assert (=> b!1343137 m!1231055))

(declare-fun m!1231067 () Bool)

(assert (=> b!1343137 m!1231067))

(declare-fun m!1231069 () Bool)

(assert (=> b!1343137 m!1231069))

(assert (=> b!1343137 m!1231063))

(declare-fun m!1231071 () Bool)

(assert (=> b!1343137 m!1231071))

(assert (=> b!1343137 m!1231055))

(declare-fun m!1231073 () Bool)

(assert (=> b!1343137 m!1231073))

(declare-fun m!1231075 () Bool)

(assert (=> b!1343137 m!1231075))

(declare-fun m!1231077 () Bool)

(assert (=> b!1343136 m!1231077))

(declare-fun m!1231079 () Bool)

(assert (=> mapNonEmpty!57517 m!1231079))

(assert (=> b!1343126 m!1231055))

(declare-fun m!1231081 () Bool)

(assert (=> b!1343130 m!1231081))

(assert (=> b!1343130 m!1231081))

(declare-fun m!1231083 () Bool)

(assert (=> b!1343130 m!1231083))

(check-sat (not mapNonEmpty!57517) (not b_next!31207) (not b!1343137) (not b!1343128) (not b!1343127) (not b!1343130) tp_is_empty!37207 (not start!113380) b_and!50325 (not b_lambda!24377) (not b!1343136))
(check-sat b_and!50325 (not b_next!31207))
