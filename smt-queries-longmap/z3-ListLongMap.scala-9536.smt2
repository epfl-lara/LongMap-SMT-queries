; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113080 () Bool)

(assert start!113080)

(declare-fun b_free!31131 () Bool)

(declare-fun b_next!31131 () Bool)

(assert (=> start!113080 (= b_free!31131 (not b_next!31131))))

(declare-fun tp!109197 () Bool)

(declare-fun b_and!50169 () Bool)

(assert (=> start!113080 (= tp!109197 b_and!50169)))

(declare-fun b!1340383 () Bool)

(declare-fun e!763459 () Bool)

(declare-fun tp_is_empty!37131 () Bool)

(assert (=> b!1340383 (= e!763459 tp_is_empty!37131)))

(declare-fun b!1340384 () Bool)

(declare-fun res!889172 () Bool)

(declare-fun e!763462 () Bool)

(assert (=> b!1340384 (=> (not res!889172) (not e!763462))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91114 0))(
  ( (array!91115 (arr!44013 (Array (_ BitVec 32) (_ BitVec 64))) (size!44563 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91114)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54611 0))(
  ( (V!54612 (val!18640 Int)) )
))
(declare-datatypes ((ValueCell!17667 0))(
  ( (ValueCellFull!17667 (v!21288 V!54611)) (EmptyCell!17667) )
))
(declare-datatypes ((array!91116 0))(
  ( (array!91117 (arr!44014 (Array (_ BitVec 32) ValueCell!17667)) (size!44564 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91116)

(assert (=> b!1340384 (= res!889172 (and (= (size!44564 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44563 _keys!1571) (size!44564 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340385 () Bool)

(declare-fun res!889166 () Bool)

(assert (=> b!1340385 (=> (not res!889166) (not e!763462))))

(declare-fun minValue!1245 () V!54611)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun zeroValue!1245 () V!54611)

(declare-datatypes ((tuple2!23990 0))(
  ( (tuple2!23991 (_1!12006 (_ BitVec 64)) (_2!12006 V!54611)) )
))
(declare-datatypes ((List!31153 0))(
  ( (Nil!31150) (Cons!31149 (h!32358 tuple2!23990) (t!45495 List!31153)) )
))
(declare-datatypes ((ListLongMap!21647 0))(
  ( (ListLongMap!21648 (toList!10839 List!31153)) )
))
(declare-fun contains!9015 (ListLongMap!21647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5807 (array!91114 array!91116 (_ BitVec 32) (_ BitVec 32) V!54611 V!54611 (_ BitVec 32) Int) ListLongMap!21647)

(assert (=> b!1340385 (= res!889166 (contains!9015 (getCurrentListMap!5807 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340386 () Bool)

(declare-fun res!889168 () Bool)

(assert (=> b!1340386 (=> (not res!889168) (not e!763462))))

(assert (=> b!1340386 (= res!889168 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340387 () Bool)

(assert (=> b!1340387 (= e!763462 false)))

(declare-fun lt!593982 () Bool)

(declare-fun +!4756 (ListLongMap!21647 tuple2!23990) ListLongMap!21647)

(declare-fun getCurrentListMapNoExtraKeys!6398 (array!91114 array!91116 (_ BitVec 32) (_ BitVec 32) V!54611 V!54611 (_ BitVec 32) Int) ListLongMap!21647)

(declare-fun get!22205 (ValueCell!17667 V!54611) V!54611)

(declare-fun dynLambda!3695 (Int (_ BitVec 64)) V!54611)

(assert (=> b!1340387 (= lt!593982 (contains!9015 (+!4756 (+!4756 (getCurrentListMapNoExtraKeys!6398 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!23991 (select (arr!44013 _keys!1571) from!1960) (get!22205 (select (arr!44014 _values!1303) from!1960) (dynLambda!3695 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun mapIsEmpty!57403 () Bool)

(declare-fun mapRes!57403 () Bool)

(assert (=> mapIsEmpty!57403 mapRes!57403))

(declare-fun b!1340388 () Bool)

(declare-fun res!889165 () Bool)

(assert (=> b!1340388 (=> (not res!889165) (not e!763462))))

(assert (=> b!1340388 (= res!889165 (not (= (select (arr!44013 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340389 () Bool)

(declare-fun res!889173 () Bool)

(assert (=> b!1340389 (=> (not res!889173) (not e!763462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91114 (_ BitVec 32)) Bool)

(assert (=> b!1340389 (= res!889173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340390 () Bool)

(declare-fun res!889170 () Bool)

(assert (=> b!1340390 (=> (not res!889170) (not e!763462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340390 (= res!889170 (validKeyInArray!0 (select (arr!44013 _keys!1571) from!1960)))))

(declare-fun b!1340391 () Bool)

(declare-fun res!889167 () Bool)

(assert (=> b!1340391 (=> (not res!889167) (not e!763462))))

(declare-datatypes ((List!31154 0))(
  ( (Nil!31151) (Cons!31150 (h!32359 (_ BitVec 64)) (t!45496 List!31154)) )
))
(declare-fun arrayNoDuplicates!0 (array!91114 (_ BitVec 32) List!31154) Bool)

(assert (=> b!1340391 (= res!889167 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31151))))

(declare-fun res!889169 () Bool)

(assert (=> start!113080 (=> (not res!889169) (not e!763462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113080 (= res!889169 (validMask!0 mask!1977))))

(assert (=> start!113080 e!763462))

(assert (=> start!113080 tp_is_empty!37131))

(assert (=> start!113080 true))

(declare-fun array_inv!33185 (array!91114) Bool)

(assert (=> start!113080 (array_inv!33185 _keys!1571)))

(declare-fun e!763461 () Bool)

(declare-fun array_inv!33186 (array!91116) Bool)

(assert (=> start!113080 (and (array_inv!33186 _values!1303) e!763461)))

(assert (=> start!113080 tp!109197))

(declare-fun mapNonEmpty!57403 () Bool)

(declare-fun tp!109198 () Bool)

(assert (=> mapNonEmpty!57403 (= mapRes!57403 (and tp!109198 e!763459))))

(declare-fun mapValue!57403 () ValueCell!17667)

(declare-fun mapRest!57403 () (Array (_ BitVec 32) ValueCell!17667))

(declare-fun mapKey!57403 () (_ BitVec 32))

(assert (=> mapNonEmpty!57403 (= (arr!44014 _values!1303) (store mapRest!57403 mapKey!57403 mapValue!57403))))

(declare-fun b!1340392 () Bool)

(declare-fun e!763460 () Bool)

(assert (=> b!1340392 (= e!763460 tp_is_empty!37131)))

(declare-fun b!1340393 () Bool)

(assert (=> b!1340393 (= e!763461 (and e!763460 mapRes!57403))))

(declare-fun condMapEmpty!57403 () Bool)

(declare-fun mapDefault!57403 () ValueCell!17667)

(assert (=> b!1340393 (= condMapEmpty!57403 (= (arr!44014 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17667)) mapDefault!57403)))))

(declare-fun b!1340394 () Bool)

(declare-fun res!889171 () Bool)

(assert (=> b!1340394 (=> (not res!889171) (not e!763462))))

(assert (=> b!1340394 (= res!889171 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44563 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113080 res!889169) b!1340384))

(assert (= (and b!1340384 res!889172) b!1340389))

(assert (= (and b!1340389 res!889173) b!1340391))

(assert (= (and b!1340391 res!889167) b!1340394))

(assert (= (and b!1340394 res!889171) b!1340385))

(assert (= (and b!1340385 res!889166) b!1340388))

(assert (= (and b!1340388 res!889165) b!1340390))

(assert (= (and b!1340390 res!889170) b!1340386))

(assert (= (and b!1340386 res!889168) b!1340387))

(assert (= (and b!1340393 condMapEmpty!57403) mapIsEmpty!57403))

(assert (= (and b!1340393 (not condMapEmpty!57403)) mapNonEmpty!57403))

(get-info :version)

(assert (= (and mapNonEmpty!57403 ((_ is ValueCellFull!17667) mapValue!57403)) b!1340383))

(assert (= (and b!1340393 ((_ is ValueCellFull!17667) mapDefault!57403)) b!1340392))

(assert (= start!113080 b!1340393))

(declare-fun b_lambda!24307 () Bool)

(assert (=> (not b_lambda!24307) (not b!1340387)))

(declare-fun t!45494 () Bool)

(declare-fun tb!12145 () Bool)

(assert (=> (and start!113080 (= defaultEntry!1306 defaultEntry!1306) t!45494) tb!12145))

(declare-fun result!25381 () Bool)

(assert (=> tb!12145 (= result!25381 tp_is_empty!37131)))

(assert (=> b!1340387 t!45494))

(declare-fun b_and!50171 () Bool)

(assert (= b_and!50169 (and (=> t!45494 result!25381) b_and!50171)))

(declare-fun m!1228145 () Bool)

(assert (=> b!1340387 m!1228145))

(declare-fun m!1228147 () Bool)

(assert (=> b!1340387 m!1228147))

(declare-fun m!1228149 () Bool)

(assert (=> b!1340387 m!1228149))

(declare-fun m!1228151 () Bool)

(assert (=> b!1340387 m!1228151))

(declare-fun m!1228153 () Bool)

(assert (=> b!1340387 m!1228153))

(declare-fun m!1228155 () Bool)

(assert (=> b!1340387 m!1228155))

(assert (=> b!1340387 m!1228149))

(declare-fun m!1228157 () Bool)

(assert (=> b!1340387 m!1228157))

(assert (=> b!1340387 m!1228151))

(assert (=> b!1340387 m!1228153))

(declare-fun m!1228159 () Bool)

(assert (=> b!1340387 m!1228159))

(assert (=> b!1340387 m!1228157))

(assert (=> b!1340387 m!1228145))

(assert (=> b!1340388 m!1228159))

(declare-fun m!1228161 () Bool)

(assert (=> start!113080 m!1228161))

(declare-fun m!1228163 () Bool)

(assert (=> start!113080 m!1228163))

(declare-fun m!1228165 () Bool)

(assert (=> start!113080 m!1228165))

(declare-fun m!1228167 () Bool)

(assert (=> b!1340389 m!1228167))

(declare-fun m!1228169 () Bool)

(assert (=> b!1340385 m!1228169))

(assert (=> b!1340385 m!1228169))

(declare-fun m!1228171 () Bool)

(assert (=> b!1340385 m!1228171))

(declare-fun m!1228173 () Bool)

(assert (=> mapNonEmpty!57403 m!1228173))

(assert (=> b!1340390 m!1228159))

(assert (=> b!1340390 m!1228159))

(declare-fun m!1228175 () Bool)

(assert (=> b!1340390 m!1228175))

(declare-fun m!1228177 () Bool)

(assert (=> b!1340391 m!1228177))

(check-sat tp_is_empty!37131 (not b!1340390) (not b!1340385) (not b!1340391) b_and!50171 (not b_next!31131) (not b!1340389) (not b_lambda!24307) (not b!1340387) (not start!113080) (not mapNonEmpty!57403))
(check-sat b_and!50171 (not b_next!31131))
