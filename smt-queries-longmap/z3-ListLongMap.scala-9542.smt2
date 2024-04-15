; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113114 () Bool)

(assert start!113114)

(declare-fun b_free!31165 () Bool)

(declare-fun b_next!31165 () Bool)

(assert (=> start!113114 (= b_free!31165 (not b_next!31165))))

(declare-fun tp!109300 () Bool)

(declare-fun b_and!50219 () Bool)

(assert (=> start!113114 (= tp!109300 b_and!50219)))

(declare-fun b!1340959 () Bool)

(declare-fun res!889598 () Bool)

(declare-fun e!763685 () Bool)

(assert (=> b!1340959 (=> (not res!889598) (not e!763685))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91123 0))(
  ( (array!91124 (arr!44018 (Array (_ BitVec 32) (_ BitVec 64))) (size!44570 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91123)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340959 (= res!889598 (not (= (select (arr!44018 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340960 () Bool)

(declare-fun res!889597 () Bool)

(assert (=> b!1340960 (=> (not res!889597) (not e!763685))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340960 (= res!889597 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340961 () Bool)

(declare-fun res!889601 () Bool)

(assert (=> b!1340961 (=> (not res!889601) (not e!763685))))

(assert (=> b!1340961 (= res!889601 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44570 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340962 () Bool)

(declare-fun res!889596 () Bool)

(assert (=> b!1340962 (=> (not res!889596) (not e!763685))))

(declare-datatypes ((V!54657 0))(
  ( (V!54658 (val!18657 Int)) )
))
(declare-fun minValue!1245 () V!54657)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54657)

(declare-datatypes ((ValueCell!17684 0))(
  ( (ValueCellFull!17684 (v!21304 V!54657)) (EmptyCell!17684) )
))
(declare-datatypes ((array!91125 0))(
  ( (array!91126 (arr!44019 (Array (_ BitVec 32) ValueCell!17684)) (size!44571 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91125)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24074 0))(
  ( (tuple2!24075 (_1!12048 (_ BitVec 64)) (_2!12048 V!54657)) )
))
(declare-datatypes ((List!31225 0))(
  ( (Nil!31222) (Cons!31221 (h!32430 tuple2!24074) (t!45593 List!31225)) )
))
(declare-datatypes ((ListLongMap!21731 0))(
  ( (ListLongMap!21732 (toList!10881 List!31225)) )
))
(declare-fun contains!8986 (ListLongMap!21731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5734 (array!91123 array!91125 (_ BitVec 32) (_ BitVec 32) V!54657 V!54657 (_ BitVec 32) Int) ListLongMap!21731)

(assert (=> b!1340962 (= res!889596 (contains!8986 (getCurrentListMap!5734 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!889599 () Bool)

(assert (=> start!113114 (=> (not res!889599) (not e!763685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113114 (= res!889599 (validMask!0 mask!1977))))

(assert (=> start!113114 e!763685))

(declare-fun tp_is_empty!37165 () Bool)

(assert (=> start!113114 tp_is_empty!37165))

(assert (=> start!113114 true))

(declare-fun array_inv!33375 (array!91123) Bool)

(assert (=> start!113114 (array_inv!33375 _keys!1571)))

(declare-fun e!763681 () Bool)

(declare-fun array_inv!33376 (array!91125) Bool)

(assert (=> start!113114 (and (array_inv!33376 _values!1303) e!763681)))

(assert (=> start!113114 tp!109300))

(declare-fun b!1340963 () Bool)

(declare-fun res!889603 () Bool)

(assert (=> b!1340963 (=> (not res!889603) (not e!763685))))

(declare-datatypes ((List!31226 0))(
  ( (Nil!31223) (Cons!31222 (h!32431 (_ BitVec 64)) (t!45594 List!31226)) )
))
(declare-fun arrayNoDuplicates!0 (array!91123 (_ BitVec 32) List!31226) Bool)

(assert (=> b!1340963 (= res!889603 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31223))))

(declare-fun b!1340964 () Bool)

(declare-fun res!889602 () Bool)

(assert (=> b!1340964 (=> (not res!889602) (not e!763685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340964 (= res!889602 (validKeyInArray!0 (select (arr!44018 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57454 () Bool)

(declare-fun mapRes!57454 () Bool)

(assert (=> mapIsEmpty!57454 mapRes!57454))

(declare-fun b!1340965 () Bool)

(declare-fun e!763682 () Bool)

(assert (=> b!1340965 (= e!763682 tp_is_empty!37165)))

(declare-fun b!1340966 () Bool)

(assert (=> b!1340966 (= e!763681 (and e!763682 mapRes!57454))))

(declare-fun condMapEmpty!57454 () Bool)

(declare-fun mapDefault!57454 () ValueCell!17684)

(assert (=> b!1340966 (= condMapEmpty!57454 (= (arr!44019 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17684)) mapDefault!57454)))))

(declare-fun b!1340967 () Bool)

(declare-fun e!763684 () Bool)

(assert (=> b!1340967 (= e!763684 tp_is_empty!37165)))

(declare-fun b!1340968 () Bool)

(declare-fun res!889595 () Bool)

(assert (=> b!1340968 (=> (not res!889595) (not e!763685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91123 (_ BitVec 32)) Bool)

(assert (=> b!1340968 (= res!889595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57454 () Bool)

(declare-fun tp!109301 () Bool)

(assert (=> mapNonEmpty!57454 (= mapRes!57454 (and tp!109301 e!763684))))

(declare-fun mapValue!57454 () ValueCell!17684)

(declare-fun mapRest!57454 () (Array (_ BitVec 32) ValueCell!17684))

(declare-fun mapKey!57454 () (_ BitVec 32))

(assert (=> mapNonEmpty!57454 (= (arr!44019 _values!1303) (store mapRest!57454 mapKey!57454 mapValue!57454))))

(declare-fun b!1340969 () Bool)

(assert (=> b!1340969 (= e!763685 (not true))))

(declare-fun lt!593895 () ListLongMap!21731)

(assert (=> b!1340969 (contains!8986 lt!593895 k0!1142)))

(declare-datatypes ((Unit!43820 0))(
  ( (Unit!43821) )
))
(declare-fun lt!593894 () Unit!43820)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!328 ((_ BitVec 64) (_ BitVec 64) V!54657 ListLongMap!21731) Unit!43820)

(assert (=> b!1340969 (= lt!593894 (lemmaInListMapAfterAddingDiffThenInBefore!328 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593895))))

(declare-fun +!4789 (ListLongMap!21731 tuple2!24074) ListLongMap!21731)

(declare-fun getCurrentListMapNoExtraKeys!6432 (array!91123 array!91125 (_ BitVec 32) (_ BitVec 32) V!54657 V!54657 (_ BitVec 32) Int) ListLongMap!21731)

(declare-fun get!22217 (ValueCell!17684 V!54657) V!54657)

(declare-fun dynLambda!3719 (Int (_ BitVec 64)) V!54657)

(assert (=> b!1340969 (= lt!593895 (+!4789 (getCurrentListMapNoExtraKeys!6432 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24075 (select (arr!44018 _keys!1571) from!1960) (get!22217 (select (arr!44019 _values!1303) from!1960) (dynLambda!3719 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340970 () Bool)

(declare-fun res!889600 () Bool)

(assert (=> b!1340970 (=> (not res!889600) (not e!763685))))

(assert (=> b!1340970 (= res!889600 (and (= (size!44571 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44570 _keys!1571) (size!44571 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113114 res!889599) b!1340970))

(assert (= (and b!1340970 res!889600) b!1340968))

(assert (= (and b!1340968 res!889595) b!1340963))

(assert (= (and b!1340963 res!889603) b!1340961))

(assert (= (and b!1340961 res!889601) b!1340962))

(assert (= (and b!1340962 res!889596) b!1340959))

(assert (= (and b!1340959 res!889598) b!1340964))

(assert (= (and b!1340964 res!889602) b!1340960))

(assert (= (and b!1340960 res!889597) b!1340969))

(assert (= (and b!1340966 condMapEmpty!57454) mapIsEmpty!57454))

(assert (= (and b!1340966 (not condMapEmpty!57454)) mapNonEmpty!57454))

(get-info :version)

(assert (= (and mapNonEmpty!57454 ((_ is ValueCellFull!17684) mapValue!57454)) b!1340967))

(assert (= (and b!1340966 ((_ is ValueCellFull!17684) mapDefault!57454)) b!1340965))

(assert (= start!113114 b!1340966))

(declare-fun b_lambda!24331 () Bool)

(assert (=> (not b_lambda!24331) (not b!1340969)))

(declare-fun t!45592 () Bool)

(declare-fun tb!12171 () Bool)

(assert (=> (and start!113114 (= defaultEntry!1306 defaultEntry!1306) t!45592) tb!12171))

(declare-fun result!25441 () Bool)

(assert (=> tb!12171 (= result!25441 tp_is_empty!37165)))

(assert (=> b!1340969 t!45592))

(declare-fun b_and!50221 () Bool)

(assert (= b_and!50219 (and (=> t!45592 result!25441) b_and!50221)))

(declare-fun m!1228207 () Bool)

(assert (=> b!1340969 m!1228207))

(declare-fun m!1228209 () Bool)

(assert (=> b!1340969 m!1228209))

(declare-fun m!1228211 () Bool)

(assert (=> b!1340969 m!1228211))

(declare-fun m!1228213 () Bool)

(assert (=> b!1340969 m!1228213))

(declare-fun m!1228215 () Bool)

(assert (=> b!1340969 m!1228215))

(assert (=> b!1340969 m!1228207))

(declare-fun m!1228217 () Bool)

(assert (=> b!1340969 m!1228217))

(assert (=> b!1340969 m!1228211))

(assert (=> b!1340969 m!1228213))

(declare-fun m!1228219 () Bool)

(assert (=> b!1340969 m!1228219))

(declare-fun m!1228221 () Bool)

(assert (=> b!1340969 m!1228221))

(declare-fun m!1228223 () Bool)

(assert (=> b!1340962 m!1228223))

(assert (=> b!1340962 m!1228223))

(declare-fun m!1228225 () Bool)

(assert (=> b!1340962 m!1228225))

(assert (=> b!1340959 m!1228219))

(declare-fun m!1228227 () Bool)

(assert (=> mapNonEmpty!57454 m!1228227))

(declare-fun m!1228229 () Bool)

(assert (=> b!1340968 m!1228229))

(declare-fun m!1228231 () Bool)

(assert (=> b!1340963 m!1228231))

(assert (=> b!1340964 m!1228219))

(assert (=> b!1340964 m!1228219))

(declare-fun m!1228233 () Bool)

(assert (=> b!1340964 m!1228233))

(declare-fun m!1228235 () Bool)

(assert (=> start!113114 m!1228235))

(declare-fun m!1228237 () Bool)

(assert (=> start!113114 m!1228237))

(declare-fun m!1228239 () Bool)

(assert (=> start!113114 m!1228239))

(check-sat (not b_next!31165) (not b!1340963) (not b!1340964) (not b!1340968) (not start!113114) b_and!50221 (not b!1340962) (not mapNonEmpty!57454) (not b_lambda!24331) (not b!1340969) tp_is_empty!37165)
(check-sat b_and!50221 (not b_next!31165))
