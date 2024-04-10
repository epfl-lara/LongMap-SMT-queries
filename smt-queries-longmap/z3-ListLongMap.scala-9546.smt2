; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113140 () Bool)

(assert start!113140)

(declare-fun b_free!31191 () Bool)

(declare-fun b_next!31191 () Bool)

(assert (=> start!113140 (= b_free!31191 (not b_next!31191))))

(declare-fun tp!109377 () Bool)

(declare-fun b_and!50289 () Bool)

(assert (=> start!113140 (= tp!109377 b_and!50289)))

(declare-fun res!889979 () Bool)

(declare-fun e!763913 () Bool)

(assert (=> start!113140 (=> (not res!889979) (not e!763913))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113140 (= res!889979 (validMask!0 mask!1977))))

(assert (=> start!113140 e!763913))

(declare-fun tp_is_empty!37191 () Bool)

(assert (=> start!113140 tp_is_empty!37191))

(assert (=> start!113140 true))

(declare-datatypes ((array!91234 0))(
  ( (array!91235 (arr!44073 (Array (_ BitVec 32) (_ BitVec 64))) (size!44623 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91234)

(declare-fun array_inv!33223 (array!91234) Bool)

(assert (=> start!113140 (array_inv!33223 _keys!1571)))

(declare-datatypes ((V!54691 0))(
  ( (V!54692 (val!18670 Int)) )
))
(declare-datatypes ((ValueCell!17697 0))(
  ( (ValueCellFull!17697 (v!21318 V!54691)) (EmptyCell!17697) )
))
(declare-datatypes ((array!91236 0))(
  ( (array!91237 (arr!44074 (Array (_ BitVec 32) ValueCell!17697)) (size!44624 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91236)

(declare-fun e!763912 () Bool)

(declare-fun array_inv!33224 (array!91236) Bool)

(assert (=> start!113140 (and (array_inv!33224 _values!1303) e!763912)))

(assert (=> start!113140 tp!109377))

(declare-fun b!1341523 () Bool)

(declare-fun res!889978 () Bool)

(assert (=> b!1341523 (=> (not res!889978) (not e!763913))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341523 (= res!889978 (and (= (size!44624 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44623 _keys!1571) (size!44624 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57493 () Bool)

(declare-fun mapRes!57493 () Bool)

(declare-fun tp!109378 () Bool)

(declare-fun e!763911 () Bool)

(assert (=> mapNonEmpty!57493 (= mapRes!57493 (and tp!109378 e!763911))))

(declare-fun mapValue!57493 () ValueCell!17697)

(declare-fun mapKey!57493 () (_ BitVec 32))

(declare-fun mapRest!57493 () (Array (_ BitVec 32) ValueCell!17697))

(assert (=> mapNonEmpty!57493 (= (arr!44074 _values!1303) (store mapRest!57493 mapKey!57493 mapValue!57493))))

(declare-fun b!1341524 () Bool)

(declare-fun res!889981 () Bool)

(assert (=> b!1341524 (=> (not res!889981) (not e!763913))))

(declare-fun minValue!1245 () V!54691)

(declare-fun zeroValue!1245 () V!54691)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24042 0))(
  ( (tuple2!24043 (_1!12032 (_ BitVec 64)) (_2!12032 V!54691)) )
))
(declare-datatypes ((List!31199 0))(
  ( (Nil!31196) (Cons!31195 (h!32404 tuple2!24042) (t!45601 List!31199)) )
))
(declare-datatypes ((ListLongMap!21699 0))(
  ( (ListLongMap!21700 (toList!10865 List!31199)) )
))
(declare-fun contains!9041 (ListLongMap!21699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5829 (array!91234 array!91236 (_ BitVec 32) (_ BitVec 32) V!54691 V!54691 (_ BitVec 32) Int) ListLongMap!21699)

(assert (=> b!1341524 (= res!889981 (contains!9041 (getCurrentListMap!5829 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341525 () Bool)

(declare-fun e!763909 () Bool)

(assert (=> b!1341525 (= e!763912 (and e!763909 mapRes!57493))))

(declare-fun condMapEmpty!57493 () Bool)

(declare-fun mapDefault!57493 () ValueCell!17697)

(assert (=> b!1341525 (= condMapEmpty!57493 (= (arr!44074 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17697)) mapDefault!57493)))))

(declare-fun mapIsEmpty!57493 () Bool)

(assert (=> mapIsEmpty!57493 mapRes!57493))

(declare-fun b!1341526 () Bool)

(assert (=> b!1341526 (= e!763909 tp_is_empty!37191)))

(declare-fun b!1341527 () Bool)

(declare-fun res!889980 () Bool)

(assert (=> b!1341527 (=> (not res!889980) (not e!763913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341527 (= res!889980 (validKeyInArray!0 (select (arr!44073 _keys!1571) from!1960)))))

(declare-fun b!1341528 () Bool)

(declare-fun res!889976 () Bool)

(assert (=> b!1341528 (=> (not res!889976) (not e!763913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91234 (_ BitVec 32)) Bool)

(assert (=> b!1341528 (= res!889976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341529 () Bool)

(declare-fun res!889977 () Bool)

(assert (=> b!1341529 (=> (not res!889977) (not e!763913))))

(declare-datatypes ((List!31200 0))(
  ( (Nil!31197) (Cons!31196 (h!32405 (_ BitVec 64)) (t!45602 List!31200)) )
))
(declare-fun arrayNoDuplicates!0 (array!91234 (_ BitVec 32) List!31200) Bool)

(assert (=> b!1341529 (= res!889977 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31197))))

(declare-fun b!1341530 () Bool)

(declare-fun res!889975 () Bool)

(assert (=> b!1341530 (=> (not res!889975) (not e!763913))))

(assert (=> b!1341530 (= res!889975 (not (= (select (arr!44073 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341531 () Bool)

(assert (=> b!1341531 (= e!763913 (not true))))

(declare-fun lt!594158 () ListLongMap!21699)

(assert (=> b!1341531 (contains!9041 lt!594158 k0!1142)))

(declare-datatypes ((Unit!44033 0))(
  ( (Unit!44034) )
))
(declare-fun lt!594159 () Unit!44033)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!347 ((_ BitVec 64) (_ BitVec 64) V!54691 ListLongMap!21699) Unit!44033)

(assert (=> b!1341531 (= lt!594159 (lemmaInListMapAfterAddingDiffThenInBefore!347 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594158))))

(declare-fun +!4778 (ListLongMap!21699 tuple2!24042) ListLongMap!21699)

(declare-fun getCurrentListMapNoExtraKeys!6420 (array!91234 array!91236 (_ BitVec 32) (_ BitVec 32) V!54691 V!54691 (_ BitVec 32) Int) ListLongMap!21699)

(declare-fun get!22247 (ValueCell!17697 V!54691) V!54691)

(declare-fun dynLambda!3717 (Int (_ BitVec 64)) V!54691)

(assert (=> b!1341531 (= lt!594158 (+!4778 (getCurrentListMapNoExtraKeys!6420 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24043 (select (arr!44073 _keys!1571) from!1960) (get!22247 (select (arr!44074 _values!1303) from!1960) (dynLambda!3717 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341532 () Bool)

(assert (=> b!1341532 (= e!763911 tp_is_empty!37191)))

(declare-fun b!1341533 () Bool)

(declare-fun res!889982 () Bool)

(assert (=> b!1341533 (=> (not res!889982) (not e!763913))))

(assert (=> b!1341533 (= res!889982 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44623 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341534 () Bool)

(declare-fun res!889983 () Bool)

(assert (=> b!1341534 (=> (not res!889983) (not e!763913))))

(assert (=> b!1341534 (= res!889983 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113140 res!889979) b!1341523))

(assert (= (and b!1341523 res!889978) b!1341528))

(assert (= (and b!1341528 res!889976) b!1341529))

(assert (= (and b!1341529 res!889977) b!1341533))

(assert (= (and b!1341533 res!889982) b!1341524))

(assert (= (and b!1341524 res!889981) b!1341530))

(assert (= (and b!1341530 res!889975) b!1341527))

(assert (= (and b!1341527 res!889980) b!1341534))

(assert (= (and b!1341534 res!889983) b!1341531))

(assert (= (and b!1341525 condMapEmpty!57493) mapIsEmpty!57493))

(assert (= (and b!1341525 (not condMapEmpty!57493)) mapNonEmpty!57493))

(get-info :version)

(assert (= (and mapNonEmpty!57493 ((_ is ValueCellFull!17697) mapValue!57493)) b!1341532))

(assert (= (and b!1341525 ((_ is ValueCellFull!17697) mapDefault!57493)) b!1341526))

(assert (= start!113140 b!1341525))

(declare-fun b_lambda!24367 () Bool)

(assert (=> (not b_lambda!24367) (not b!1341531)))

(declare-fun t!45600 () Bool)

(declare-fun tb!12205 () Bool)

(assert (=> (and start!113140 (= defaultEntry!1306 defaultEntry!1306) t!45600) tb!12205))

(declare-fun result!25501 () Bool)

(assert (=> tb!12205 (= result!25501 tp_is_empty!37191)))

(assert (=> b!1341531 t!45600))

(declare-fun b_and!50291 () Bool)

(assert (= b_and!50289 (and (=> t!45600 result!25501) b_and!50291)))

(declare-fun m!1229165 () Bool)

(assert (=> b!1341529 m!1229165))

(declare-fun m!1229167 () Bool)

(assert (=> b!1341530 m!1229167))

(declare-fun m!1229169 () Bool)

(assert (=> b!1341531 m!1229169))

(declare-fun m!1229171 () Bool)

(assert (=> b!1341531 m!1229171))

(declare-fun m!1229173 () Bool)

(assert (=> b!1341531 m!1229173))

(declare-fun m!1229175 () Bool)

(assert (=> b!1341531 m!1229175))

(assert (=> b!1341531 m!1229169))

(declare-fun m!1229177 () Bool)

(assert (=> b!1341531 m!1229177))

(assert (=> b!1341531 m!1229171))

(assert (=> b!1341531 m!1229173))

(declare-fun m!1229179 () Bool)

(assert (=> b!1341531 m!1229179))

(assert (=> b!1341531 m!1229167))

(declare-fun m!1229181 () Bool)

(assert (=> b!1341531 m!1229181))

(declare-fun m!1229183 () Bool)

(assert (=> b!1341528 m!1229183))

(declare-fun m!1229185 () Bool)

(assert (=> b!1341524 m!1229185))

(assert (=> b!1341524 m!1229185))

(declare-fun m!1229187 () Bool)

(assert (=> b!1341524 m!1229187))

(declare-fun m!1229189 () Bool)

(assert (=> mapNonEmpty!57493 m!1229189))

(assert (=> b!1341527 m!1229167))

(assert (=> b!1341527 m!1229167))

(declare-fun m!1229191 () Bool)

(assert (=> b!1341527 m!1229191))

(declare-fun m!1229193 () Bool)

(assert (=> start!113140 m!1229193))

(declare-fun m!1229195 () Bool)

(assert (=> start!113140 m!1229195))

(declare-fun m!1229197 () Bool)

(assert (=> start!113140 m!1229197))

(check-sat (not b!1341524) tp_is_empty!37191 (not b!1341531) (not b_lambda!24367) (not b_next!31191) (not start!113140) (not b!1341528) (not b!1341527) (not b!1341529) b_and!50291 (not mapNonEmpty!57493))
(check-sat b_and!50291 (not b_next!31191))
