; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113228 () Bool)

(assert start!113228)

(declare-fun b_free!31279 () Bool)

(declare-fun b_next!31279 () Bool)

(assert (=> start!113228 (= b_free!31279 (not b_next!31279))))

(declare-fun tp!109642 () Bool)

(declare-fun b_and!50447 () Bool)

(assert (=> start!113228 (= tp!109642 b_and!50447)))

(declare-fun b!1343125 () Bool)

(declare-fun e!764536 () Bool)

(declare-fun tp_is_empty!37279 () Bool)

(assert (=> b!1343125 (= e!764536 tp_is_empty!37279)))

(declare-fun mapNonEmpty!57625 () Bool)

(declare-fun mapRes!57625 () Bool)

(declare-fun tp!109643 () Bool)

(assert (=> mapNonEmpty!57625 (= mapRes!57625 (and tp!109643 e!764536))))

(declare-datatypes ((V!54809 0))(
  ( (V!54810 (val!18714 Int)) )
))
(declare-datatypes ((ValueCell!17741 0))(
  ( (ValueCellFull!17741 (v!21361 V!54809)) (EmptyCell!17741) )
))
(declare-fun mapValue!57625 () ValueCell!17741)

(declare-fun mapKey!57625 () (_ BitVec 32))

(declare-fun mapRest!57625 () (Array (_ BitVec 32) ValueCell!17741))

(declare-datatypes ((array!91347 0))(
  ( (array!91348 (arr!44130 (Array (_ BitVec 32) ValueCell!17741)) (size!44682 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91347)

(assert (=> mapNonEmpty!57625 (= (arr!44130 _values!1303) (store mapRest!57625 mapKey!57625 mapValue!57625))))

(declare-fun res!891139 () Bool)

(declare-fun e!764540 () Bool)

(assert (=> start!113228 (=> (not res!891139) (not e!764540))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113228 (= res!891139 (validMask!0 mask!1977))))

(assert (=> start!113228 e!764540))

(assert (=> start!113228 tp_is_empty!37279))

(assert (=> start!113228 true))

(declare-datatypes ((array!91349 0))(
  ( (array!91350 (arr!44131 (Array (_ BitVec 32) (_ BitVec 64))) (size!44683 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91349)

(declare-fun array_inv!33455 (array!91349) Bool)

(assert (=> start!113228 (array_inv!33455 _keys!1571)))

(declare-fun e!764539 () Bool)

(declare-fun array_inv!33456 (array!91347) Bool)

(assert (=> start!113228 (and (array_inv!33456 _values!1303) e!764539)))

(assert (=> start!113228 tp!109642))

(declare-fun b!1343126 () Bool)

(declare-fun res!891141 () Bool)

(assert (=> b!1343126 (=> (not res!891141) (not e!764540))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343126 (= res!891141 (and (= (size!44682 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44683 _keys!1571) (size!44682 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343127 () Bool)

(declare-fun res!891136 () Bool)

(assert (=> b!1343127 (=> (not res!891136) (not e!764540))))

(declare-datatypes ((List!31314 0))(
  ( (Nil!31311) (Cons!31310 (h!32519 (_ BitVec 64)) (t!45796 List!31314)) )
))
(declare-fun arrayNoDuplicates!0 (array!91349 (_ BitVec 32) List!31314) Bool)

(assert (=> b!1343127 (= res!891136 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31311))))

(declare-fun b!1343128 () Bool)

(declare-fun res!891135 () Bool)

(assert (=> b!1343128 (=> (not res!891135) (not e!764540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91349 (_ BitVec 32)) Bool)

(assert (=> b!1343128 (= res!891135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343129 () Bool)

(assert (=> b!1343129 (= e!764540 (not true))))

(declare-datatypes ((tuple2!24170 0))(
  ( (tuple2!24171 (_1!12096 (_ BitVec 64)) (_2!12096 V!54809)) )
))
(declare-datatypes ((List!31315 0))(
  ( (Nil!31312) (Cons!31311 (h!32520 tuple2!24170) (t!45797 List!31315)) )
))
(declare-datatypes ((ListLongMap!21827 0))(
  ( (ListLongMap!21828 (toList!10929 List!31315)) )
))
(declare-fun lt!594626 () ListLongMap!21827)

(declare-fun zeroValue!1245 () V!54809)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9034 (ListLongMap!21827 (_ BitVec 64)) Bool)

(declare-fun +!4830 (ListLongMap!21827 tuple2!24170) ListLongMap!21827)

(assert (=> b!1343129 (contains!9034 (+!4830 lt!594626 (tuple2!24171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43902 0))(
  ( (Unit!43903) )
))
(declare-fun lt!594622 () Unit!43902)

(declare-fun addStillContains!1194 (ListLongMap!21827 (_ BitVec 64) V!54809 (_ BitVec 64)) Unit!43902)

(assert (=> b!1343129 (= lt!594622 (addStillContains!1194 lt!594626 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343129 (contains!9034 lt!594626 k0!1142)))

(declare-fun lt!594624 () V!54809)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!594625 () Unit!43902)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!369 ((_ BitVec 64) (_ BitVec 64) V!54809 ListLongMap!21827) Unit!43902)

(assert (=> b!1343129 (= lt!594625 (lemmaInListMapAfterAddingDiffThenInBefore!369 k0!1142 (select (arr!44131 _keys!1571) from!1960) lt!594624 lt!594626))))

(declare-fun lt!594623 () ListLongMap!21827)

(assert (=> b!1343129 (contains!9034 lt!594623 k0!1142)))

(declare-fun lt!594627 () Unit!43902)

(assert (=> b!1343129 (= lt!594627 (lemmaInListMapAfterAddingDiffThenInBefore!369 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594623))))

(assert (=> b!1343129 (= lt!594623 (+!4830 lt!594626 (tuple2!24171 (select (arr!44131 _keys!1571) from!1960) lt!594624)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22296 (ValueCell!17741 V!54809) V!54809)

(declare-fun dynLambda!3760 (Int (_ BitVec 64)) V!54809)

(assert (=> b!1343129 (= lt!594624 (get!22296 (select (arr!44130 _values!1303) from!1960) (dynLambda!3760 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54809)

(declare-fun getCurrentListMapNoExtraKeys!6473 (array!91349 array!91347 (_ BitVec 32) (_ BitVec 32) V!54809 V!54809 (_ BitVec 32) Int) ListLongMap!21827)

(assert (=> b!1343129 (= lt!594626 (getCurrentListMapNoExtraKeys!6473 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343130 () Bool)

(declare-fun res!891140 () Bool)

(assert (=> b!1343130 (=> (not res!891140) (not e!764540))))

(assert (=> b!1343130 (= res!891140 (not (= (select (arr!44131 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343131 () Bool)

(declare-fun res!891138 () Bool)

(assert (=> b!1343131 (=> (not res!891138) (not e!764540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343131 (= res!891138 (validKeyInArray!0 (select (arr!44131 _keys!1571) from!1960)))))

(declare-fun b!1343132 () Bool)

(declare-fun e!764537 () Bool)

(assert (=> b!1343132 (= e!764537 tp_is_empty!37279)))

(declare-fun b!1343133 () Bool)

(declare-fun res!891134 () Bool)

(assert (=> b!1343133 (=> (not res!891134) (not e!764540))))

(assert (=> b!1343133 (= res!891134 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57625 () Bool)

(assert (=> mapIsEmpty!57625 mapRes!57625))

(declare-fun b!1343134 () Bool)

(declare-fun res!891142 () Bool)

(assert (=> b!1343134 (=> (not res!891142) (not e!764540))))

(declare-fun getCurrentListMap!5778 (array!91349 array!91347 (_ BitVec 32) (_ BitVec 32) V!54809 V!54809 (_ BitVec 32) Int) ListLongMap!21827)

(assert (=> b!1343134 (= res!891142 (contains!9034 (getCurrentListMap!5778 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343135 () Bool)

(assert (=> b!1343135 (= e!764539 (and e!764537 mapRes!57625))))

(declare-fun condMapEmpty!57625 () Bool)

(declare-fun mapDefault!57625 () ValueCell!17741)

(assert (=> b!1343135 (= condMapEmpty!57625 (= (arr!44130 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17741)) mapDefault!57625)))))

(declare-fun b!1343136 () Bool)

(declare-fun res!891137 () Bool)

(assert (=> b!1343136 (=> (not res!891137) (not e!764540))))

(assert (=> b!1343136 (= res!891137 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44683 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113228 res!891139) b!1343126))

(assert (= (and b!1343126 res!891141) b!1343128))

(assert (= (and b!1343128 res!891135) b!1343127))

(assert (= (and b!1343127 res!891136) b!1343136))

(assert (= (and b!1343136 res!891137) b!1343134))

(assert (= (and b!1343134 res!891142) b!1343130))

(assert (= (and b!1343130 res!891140) b!1343131))

(assert (= (and b!1343131 res!891138) b!1343133))

(assert (= (and b!1343133 res!891134) b!1343129))

(assert (= (and b!1343135 condMapEmpty!57625) mapIsEmpty!57625))

(assert (= (and b!1343135 (not condMapEmpty!57625)) mapNonEmpty!57625))

(get-info :version)

(assert (= (and mapNonEmpty!57625 ((_ is ValueCellFull!17741) mapValue!57625)) b!1343125))

(assert (= (and b!1343135 ((_ is ValueCellFull!17741) mapDefault!57625)) b!1343132))

(assert (= start!113228 b!1343135))

(declare-fun b_lambda!24445 () Bool)

(assert (=> (not b_lambda!24445) (not b!1343129)))

(declare-fun t!45795 () Bool)

(declare-fun tb!12285 () Bool)

(assert (=> (and start!113228 (= defaultEntry!1306 defaultEntry!1306) t!45795) tb!12285))

(declare-fun result!25669 () Bool)

(assert (=> tb!12285 (= result!25669 tp_is_empty!37279)))

(assert (=> b!1343129 t!45795))

(declare-fun b_and!50449 () Bool)

(assert (= b_and!50447 (and (=> t!45795 result!25669) b_and!50449)))

(declare-fun m!1230355 () Bool)

(assert (=> b!1343134 m!1230355))

(assert (=> b!1343134 m!1230355))

(declare-fun m!1230357 () Bool)

(assert (=> b!1343134 m!1230357))

(declare-fun m!1230359 () Bool)

(assert (=> b!1343130 m!1230359))

(declare-fun m!1230361 () Bool)

(assert (=> start!113228 m!1230361))

(declare-fun m!1230363 () Bool)

(assert (=> start!113228 m!1230363))

(declare-fun m!1230365 () Bool)

(assert (=> start!113228 m!1230365))

(assert (=> b!1343131 m!1230359))

(assert (=> b!1343131 m!1230359))

(declare-fun m!1230367 () Bool)

(assert (=> b!1343131 m!1230367))

(declare-fun m!1230369 () Bool)

(assert (=> b!1343128 m!1230369))

(declare-fun m!1230371 () Bool)

(assert (=> mapNonEmpty!57625 m!1230371))

(declare-fun m!1230373 () Bool)

(assert (=> b!1343127 m!1230373))

(declare-fun m!1230375 () Bool)

(assert (=> b!1343129 m!1230375))

(declare-fun m!1230377 () Bool)

(assert (=> b!1343129 m!1230377))

(declare-fun m!1230379 () Bool)

(assert (=> b!1343129 m!1230379))

(declare-fun m!1230381 () Bool)

(assert (=> b!1343129 m!1230381))

(declare-fun m!1230383 () Bool)

(assert (=> b!1343129 m!1230383))

(declare-fun m!1230385 () Bool)

(assert (=> b!1343129 m!1230385))

(declare-fun m!1230387 () Bool)

(assert (=> b!1343129 m!1230387))

(declare-fun m!1230389 () Bool)

(assert (=> b!1343129 m!1230389))

(assert (=> b!1343129 m!1230383))

(assert (=> b!1343129 m!1230385))

(assert (=> b!1343129 m!1230359))

(assert (=> b!1343129 m!1230379))

(declare-fun m!1230391 () Bool)

(assert (=> b!1343129 m!1230391))

(declare-fun m!1230393 () Bool)

(assert (=> b!1343129 m!1230393))

(declare-fun m!1230395 () Bool)

(assert (=> b!1343129 m!1230395))

(assert (=> b!1343129 m!1230359))

(declare-fun m!1230397 () Bool)

(assert (=> b!1343129 m!1230397))

(check-sat tp_is_empty!37279 (not start!113228) (not b_lambda!24445) (not b!1343131) (not b!1343128) (not b!1343129) (not mapNonEmpty!57625) (not b!1343127) (not b_next!31279) b_and!50449 (not b!1343134))
(check-sat b_and!50449 (not b_next!31279))
