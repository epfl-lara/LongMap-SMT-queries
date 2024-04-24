; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113894 () Bool)

(assert start!113894)

(declare-fun b_free!31579 () Bool)

(declare-fun b_next!31579 () Bool)

(assert (=> start!113894 (= b_free!31579 (not b_next!31579))))

(declare-fun tp!110552 () Bool)

(declare-fun b_and!50959 () Bool)

(assert (=> start!113894 (= tp!110552 b_and!50959)))

(declare-fun b!1350435 () Bool)

(declare-fun res!895577 () Bool)

(declare-fun e!768335 () Bool)

(assert (=> b!1350435 (=> (not res!895577) (not e!768335))))

(declare-datatypes ((V!55209 0))(
  ( (V!55210 (val!18864 Int)) )
))
(declare-fun minValue!1245 () V!55209)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92103 0))(
  ( (array!92104 (arr!44500 (Array (_ BitVec 32) (_ BitVec 64))) (size!45051 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92103)

(declare-fun zeroValue!1245 () V!55209)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17891 0))(
  ( (ValueCellFull!17891 (v!21514 V!55209)) (EmptyCell!17891) )
))
(declare-datatypes ((array!92105 0))(
  ( (array!92106 (arr!44501 (Array (_ BitVec 32) ValueCell!17891)) (size!45052 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92105)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24380 0))(
  ( (tuple2!24381 (_1!12201 (_ BitVec 64)) (_2!12201 V!55209)) )
))
(declare-datatypes ((List!31517 0))(
  ( (Nil!31514) (Cons!31513 (h!32731 tuple2!24380) (t!46155 List!31517)) )
))
(declare-datatypes ((ListLongMap!22045 0))(
  ( (ListLongMap!22046 (toList!11038 List!31517)) )
))
(declare-fun contains!9231 (ListLongMap!22045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5975 (array!92103 array!92105 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!22045)

(assert (=> b!1350435 (= res!895577 (contains!9231 (getCurrentListMap!5975 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1350436 () Bool)

(declare-fun res!895584 () Bool)

(assert (=> b!1350436 (=> (not res!895584) (not e!768335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350436 (= res!895584 (validKeyInArray!0 (select (arr!44500 _keys!1571) from!1960)))))

(declare-fun b!1350437 () Bool)

(declare-fun e!768338 () Bool)

(declare-fun e!768337 () Bool)

(declare-fun mapRes!58086 () Bool)

(assert (=> b!1350437 (= e!768338 (and e!768337 mapRes!58086))))

(declare-fun condMapEmpty!58086 () Bool)

(declare-fun mapDefault!58086 () ValueCell!17891)

(assert (=> b!1350437 (= condMapEmpty!58086 (= (arr!44501 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17891)) mapDefault!58086)))))

(declare-fun res!895582 () Bool)

(assert (=> start!113894 (=> (not res!895582) (not e!768335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113894 (= res!895582 (validMask!0 mask!1977))))

(assert (=> start!113894 e!768335))

(declare-fun tp_is_empty!37579 () Bool)

(assert (=> start!113894 tp_is_empty!37579))

(assert (=> start!113894 true))

(declare-fun array_inv!33783 (array!92103) Bool)

(assert (=> start!113894 (array_inv!33783 _keys!1571)))

(declare-fun array_inv!33784 (array!92105) Bool)

(assert (=> start!113894 (and (array_inv!33784 _values!1303) e!768338)))

(assert (=> start!113894 tp!110552))

(declare-fun b!1350438 () Bool)

(declare-fun res!895579 () Bool)

(assert (=> b!1350438 (=> (not res!895579) (not e!768335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92103 (_ BitVec 32)) Bool)

(assert (=> b!1350438 (= res!895579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1350439 () Bool)

(declare-fun res!895578 () Bool)

(assert (=> b!1350439 (=> (not res!895578) (not e!768335))))

(assert (=> b!1350439 (= res!895578 (and (= (size!45052 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45051 _keys!1571) (size!45052 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1350440 () Bool)

(declare-fun res!895581 () Bool)

(assert (=> b!1350440 (=> (not res!895581) (not e!768335))))

(declare-datatypes ((List!31518 0))(
  ( (Nil!31515) (Cons!31514 (h!32732 (_ BitVec 64)) (t!46156 List!31518)) )
))
(declare-fun arrayNoDuplicates!0 (array!92103 (_ BitVec 32) List!31518) Bool)

(assert (=> b!1350440 (= res!895581 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31515))))

(declare-fun mapIsEmpty!58086 () Bool)

(assert (=> mapIsEmpty!58086 mapRes!58086))

(declare-fun b!1350441 () Bool)

(assert (=> b!1350441 (= e!768335 (= k0!1142 (select (arr!44500 _keys!1571) from!1960)))))

(declare-fun b!1350442 () Bool)

(declare-fun res!895576 () Bool)

(assert (=> b!1350442 (=> (not res!895576) (not e!768335))))

(assert (=> b!1350442 (= res!895576 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1350443 () Bool)

(declare-fun res!895575 () Bool)

(assert (=> b!1350443 (=> (not res!895575) (not e!768335))))

(assert (=> b!1350443 (= res!895575 (not (= (select (arr!44500 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!58086 () Bool)

(declare-fun tp!110553 () Bool)

(declare-fun e!768339 () Bool)

(assert (=> mapNonEmpty!58086 (= mapRes!58086 (and tp!110553 e!768339))))

(declare-fun mapValue!58086 () ValueCell!17891)

(declare-fun mapKey!58086 () (_ BitVec 32))

(declare-fun mapRest!58086 () (Array (_ BitVec 32) ValueCell!17891))

(assert (=> mapNonEmpty!58086 (= (arr!44501 _values!1303) (store mapRest!58086 mapKey!58086 mapValue!58086))))

(declare-fun b!1350444 () Bool)

(assert (=> b!1350444 (= e!768337 tp_is_empty!37579)))

(declare-fun b!1350445 () Bool)

(assert (=> b!1350445 (= e!768339 tp_is_empty!37579)))

(declare-fun b!1350446 () Bool)

(declare-fun res!895583 () Bool)

(assert (=> b!1350446 (=> (not res!895583) (not e!768335))))

(assert (=> b!1350446 (= res!895583 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45051 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1350447 () Bool)

(declare-fun res!895580 () Bool)

(assert (=> b!1350447 (=> (not res!895580) (not e!768335))))

(declare-fun +!4892 (ListLongMap!22045 tuple2!24380) ListLongMap!22045)

(declare-fun getCurrentListMapNoExtraKeys!6545 (array!92103 array!92105 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!22045)

(declare-fun get!22502 (ValueCell!17891 V!55209) V!55209)

(declare-fun dynLambda!3846 (Int (_ BitVec 64)) V!55209)

(assert (=> b!1350447 (= res!895580 (contains!9231 (+!4892 (getCurrentListMapNoExtraKeys!6545 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24381 (select (arr!44500 _keys!1571) from!1960) (get!22502 (select (arr!44501 _values!1303) from!1960) (dynLambda!3846 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(assert (= (and start!113894 res!895582) b!1350439))

(assert (= (and b!1350439 res!895578) b!1350438))

(assert (= (and b!1350438 res!895579) b!1350440))

(assert (= (and b!1350440 res!895581) b!1350446))

(assert (= (and b!1350446 res!895583) b!1350435))

(assert (= (and b!1350435 res!895577) b!1350443))

(assert (= (and b!1350443 res!895575) b!1350436))

(assert (= (and b!1350436 res!895584) b!1350442))

(assert (= (and b!1350442 res!895576) b!1350447))

(assert (= (and b!1350447 res!895580) b!1350441))

(assert (= (and b!1350437 condMapEmpty!58086) mapIsEmpty!58086))

(assert (= (and b!1350437 (not condMapEmpty!58086)) mapNonEmpty!58086))

(get-info :version)

(assert (= (and mapNonEmpty!58086 ((_ is ValueCellFull!17891) mapValue!58086)) b!1350445))

(assert (= (and b!1350437 ((_ is ValueCellFull!17891) mapDefault!58086)) b!1350444))

(assert (= start!113894 b!1350437))

(declare-fun b_lambda!24683 () Bool)

(assert (=> (not b_lambda!24683) (not b!1350447)))

(declare-fun t!46154 () Bool)

(declare-fun tb!12441 () Bool)

(assert (=> (and start!113894 (= defaultEntry!1306 defaultEntry!1306) t!46154) tb!12441))

(declare-fun result!25987 () Bool)

(assert (=> tb!12441 (= result!25987 tp_is_empty!37579)))

(assert (=> b!1350447 t!46154))

(declare-fun b_and!50961 () Bool)

(assert (= b_and!50959 (and (=> t!46154 result!25987) b_and!50961)))

(declare-fun m!1237863 () Bool)

(assert (=> b!1350436 m!1237863))

(assert (=> b!1350436 m!1237863))

(declare-fun m!1237865 () Bool)

(assert (=> b!1350436 m!1237865))

(declare-fun m!1237867 () Bool)

(assert (=> start!113894 m!1237867))

(declare-fun m!1237869 () Bool)

(assert (=> start!113894 m!1237869))

(declare-fun m!1237871 () Bool)

(assert (=> start!113894 m!1237871))

(declare-fun m!1237873 () Bool)

(assert (=> mapNonEmpty!58086 m!1237873))

(declare-fun m!1237875 () Bool)

(assert (=> b!1350435 m!1237875))

(assert (=> b!1350435 m!1237875))

(declare-fun m!1237877 () Bool)

(assert (=> b!1350435 m!1237877))

(declare-fun m!1237879 () Bool)

(assert (=> b!1350447 m!1237879))

(declare-fun m!1237881 () Bool)

(assert (=> b!1350447 m!1237881))

(declare-fun m!1237883 () Bool)

(assert (=> b!1350447 m!1237883))

(declare-fun m!1237885 () Bool)

(assert (=> b!1350447 m!1237885))

(assert (=> b!1350447 m!1237879))

(declare-fun m!1237887 () Bool)

(assert (=> b!1350447 m!1237887))

(assert (=> b!1350447 m!1237881))

(assert (=> b!1350447 m!1237883))

(assert (=> b!1350447 m!1237887))

(declare-fun m!1237889 () Bool)

(assert (=> b!1350447 m!1237889))

(assert (=> b!1350447 m!1237863))

(declare-fun m!1237891 () Bool)

(assert (=> b!1350440 m!1237891))

(assert (=> b!1350441 m!1237863))

(declare-fun m!1237893 () Bool)

(assert (=> b!1350438 m!1237893))

(assert (=> b!1350443 m!1237863))

(check-sat (not b!1350447) (not b_lambda!24683) (not mapNonEmpty!58086) (not b!1350435) (not b!1350440) (not b!1350438) (not b!1350436) (not start!113894) (not b_next!31579) tp_is_empty!37579 b_and!50961)
(check-sat b_and!50961 (not b_next!31579))
