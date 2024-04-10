; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131772 () Bool)

(assert start!131772)

(declare-fun b!1542903 () Bool)

(declare-fun e!858517 () Bool)

(assert (=> b!1542903 (= e!858517 false)))

(declare-fun lt!665894 () Bool)

(declare-datatypes ((array!102750 0))(
  ( (array!102751 (arr!49577 (Array (_ BitVec 32) (_ BitVec 64))) (size!50127 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102750)

(declare-datatypes ((List!35896 0))(
  ( (Nil!35893) (Cons!35892 (h!37337 (_ BitVec 64)) (t!50590 List!35896)) )
))
(declare-fun arrayNoDuplicates!0 (array!102750 (_ BitVec 32) List!35896) Bool)

(assert (=> b!1542903 (= lt!665894 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35893))))

(declare-fun mapIsEmpty!58345 () Bool)

(declare-fun mapRes!58345 () Bool)

(assert (=> mapIsEmpty!58345 mapRes!58345))

(declare-fun b!1542904 () Bool)

(declare-fun e!858515 () Bool)

(declare-fun tp_is_empty!37761 () Bool)

(assert (=> b!1542904 (= e!858515 tp_is_empty!37761)))

(declare-fun b!1542905 () Bool)

(declare-fun res!1058726 () Bool)

(assert (=> b!1542905 (=> (not res!1058726) (not e!858517))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58791 0))(
  ( (V!58792 (val!18958 Int)) )
))
(declare-datatypes ((ValueCell!17970 0))(
  ( (ValueCellFull!17970 (v!21759 V!58791)) (EmptyCell!17970) )
))
(declare-datatypes ((array!102752 0))(
  ( (array!102753 (arr!49578 (Array (_ BitVec 32) ValueCell!17970)) (size!50128 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102752)

(assert (=> b!1542905 (= res!1058726 (and (= (size!50128 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50127 _keys!618) (size!50128 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542906 () Bool)

(declare-fun e!858516 () Bool)

(assert (=> b!1542906 (= e!858516 (and e!858515 mapRes!58345))))

(declare-fun condMapEmpty!58345 () Bool)

(declare-fun mapDefault!58345 () ValueCell!17970)

(assert (=> b!1542906 (= condMapEmpty!58345 (= (arr!49578 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17970)) mapDefault!58345)))))

(declare-fun res!1058727 () Bool)

(assert (=> start!131772 (=> (not res!1058727) (not e!858517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131772 (= res!1058727 (validMask!0 mask!926))))

(assert (=> start!131772 e!858517))

(assert (=> start!131772 true))

(declare-fun array_inv!38575 (array!102752) Bool)

(assert (=> start!131772 (and (array_inv!38575 _values!470) e!858516)))

(declare-fun array_inv!38576 (array!102750) Bool)

(assert (=> start!131772 (array_inv!38576 _keys!618)))

(declare-fun b!1542907 () Bool)

(declare-fun res!1058725 () Bool)

(assert (=> b!1542907 (=> (not res!1058725) (not e!858517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102750 (_ BitVec 32)) Bool)

(assert (=> b!1542907 (= res!1058725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542908 () Bool)

(declare-fun e!858518 () Bool)

(assert (=> b!1542908 (= e!858518 tp_is_empty!37761)))

(declare-fun mapNonEmpty!58345 () Bool)

(declare-fun tp!110872 () Bool)

(assert (=> mapNonEmpty!58345 (= mapRes!58345 (and tp!110872 e!858518))))

(declare-fun mapRest!58345 () (Array (_ BitVec 32) ValueCell!17970))

(declare-fun mapValue!58345 () ValueCell!17970)

(declare-fun mapKey!58345 () (_ BitVec 32))

(assert (=> mapNonEmpty!58345 (= (arr!49578 _values!470) (store mapRest!58345 mapKey!58345 mapValue!58345))))

(assert (= (and start!131772 res!1058727) b!1542905))

(assert (= (and b!1542905 res!1058726) b!1542907))

(assert (= (and b!1542907 res!1058725) b!1542903))

(assert (= (and b!1542906 condMapEmpty!58345) mapIsEmpty!58345))

(assert (= (and b!1542906 (not condMapEmpty!58345)) mapNonEmpty!58345))

(get-info :version)

(assert (= (and mapNonEmpty!58345 ((_ is ValueCellFull!17970) mapValue!58345)) b!1542908))

(assert (= (and b!1542906 ((_ is ValueCellFull!17970) mapDefault!58345)) b!1542904))

(assert (= start!131772 b!1542906))

(declare-fun m!1424389 () Bool)

(assert (=> b!1542903 m!1424389))

(declare-fun m!1424391 () Bool)

(assert (=> start!131772 m!1424391))

(declare-fun m!1424393 () Bool)

(assert (=> start!131772 m!1424393))

(declare-fun m!1424395 () Bool)

(assert (=> start!131772 m!1424395))

(declare-fun m!1424397 () Bool)

(assert (=> b!1542907 m!1424397))

(declare-fun m!1424399 () Bool)

(assert (=> mapNonEmpty!58345 m!1424399))

(check-sat (not mapNonEmpty!58345) (not b!1542903) (not b!1542907) tp_is_empty!37761 (not start!131772))
(check-sat)
