; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132236 () Bool)

(assert start!132236)

(declare-fun b!1545807 () Bool)

(declare-fun e!860417 () Bool)

(declare-fun tp_is_empty!37813 () Bool)

(assert (=> b!1545807 (= e!860417 tp_is_empty!37813)))

(declare-fun mapNonEmpty!58423 () Bool)

(declare-fun mapRes!58423 () Bool)

(declare-fun tp!110950 () Bool)

(declare-fun e!860416 () Bool)

(assert (=> mapNonEmpty!58423 (= mapRes!58423 (and tp!110950 e!860416))))

(declare-fun mapKey!58423 () (_ BitVec 32))

(declare-datatypes ((V!58861 0))(
  ( (V!58862 (val!18984 Int)) )
))
(declare-datatypes ((ValueCell!17996 0))(
  ( (ValueCellFull!17996 (v!21777 V!58861)) (EmptyCell!17996) )
))
(declare-fun mapValue!58423 () ValueCell!17996)

(declare-fun mapRest!58423 () (Array (_ BitVec 32) ValueCell!17996))

(declare-datatypes ((array!102968 0))(
  ( (array!102969 (arr!49679 (Array (_ BitVec 32) ValueCell!17996)) (size!50230 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102968)

(assert (=> mapNonEmpty!58423 (= (arr!49679 _values!470) (store mapRest!58423 mapKey!58423 mapValue!58423))))

(declare-fun b!1545808 () Bool)

(declare-fun e!860414 () Bool)

(assert (=> b!1545808 (= e!860414 false)))

(declare-fun lt!666880 () Bool)

(declare-datatypes ((array!102970 0))(
  ( (array!102971 (arr!49680 (Array (_ BitVec 32) (_ BitVec 64))) (size!50231 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102970)

(declare-datatypes ((List!35950 0))(
  ( (Nil!35947) (Cons!35946 (h!37409 (_ BitVec 64)) (t!50636 List!35950)) )
))
(declare-fun arrayNoDuplicates!0 (array!102970 (_ BitVec 32) List!35950) Bool)

(assert (=> b!1545808 (= lt!666880 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35947))))

(declare-fun res!1059821 () Bool)

(assert (=> start!132236 (=> (not res!1059821) (not e!860414))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132236 (= res!1059821 (validMask!0 mask!926))))

(assert (=> start!132236 e!860414))

(assert (=> start!132236 true))

(declare-fun e!860415 () Bool)

(declare-fun array_inv!38909 (array!102968) Bool)

(assert (=> start!132236 (and (array_inv!38909 _values!470) e!860415)))

(declare-fun array_inv!38910 (array!102970) Bool)

(assert (=> start!132236 (array_inv!38910 _keys!618)))

(declare-fun mapIsEmpty!58423 () Bool)

(assert (=> mapIsEmpty!58423 mapRes!58423))

(declare-fun b!1545809 () Bool)

(assert (=> b!1545809 (= e!860415 (and e!860417 mapRes!58423))))

(declare-fun condMapEmpty!58423 () Bool)

(declare-fun mapDefault!58423 () ValueCell!17996)

(assert (=> b!1545809 (= condMapEmpty!58423 (= (arr!49679 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17996)) mapDefault!58423)))))

(declare-fun b!1545810 () Bool)

(declare-fun res!1059820 () Bool)

(assert (=> b!1545810 (=> (not res!1059820) (not e!860414))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545810 (= res!1059820 (and (= (size!50230 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50231 _keys!618) (size!50230 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545811 () Bool)

(assert (=> b!1545811 (= e!860416 tp_is_empty!37813)))

(declare-fun b!1545812 () Bool)

(declare-fun res!1059819 () Bool)

(assert (=> b!1545812 (=> (not res!1059819) (not e!860414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102970 (_ BitVec 32)) Bool)

(assert (=> b!1545812 (= res!1059819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132236 res!1059821) b!1545810))

(assert (= (and b!1545810 res!1059820) b!1545812))

(assert (= (and b!1545812 res!1059819) b!1545808))

(assert (= (and b!1545809 condMapEmpty!58423) mapIsEmpty!58423))

(assert (= (and b!1545809 (not condMapEmpty!58423)) mapNonEmpty!58423))

(get-info :version)

(assert (= (and mapNonEmpty!58423 ((_ is ValueCellFull!17996) mapValue!58423)) b!1545811))

(assert (= (and b!1545809 ((_ is ValueCellFull!17996) mapDefault!58423)) b!1545807))

(assert (= start!132236 b!1545809))

(declare-fun m!1426959 () Bool)

(assert (=> mapNonEmpty!58423 m!1426959))

(declare-fun m!1426961 () Bool)

(assert (=> b!1545808 m!1426961))

(declare-fun m!1426963 () Bool)

(assert (=> start!132236 m!1426963))

(declare-fun m!1426965 () Bool)

(assert (=> start!132236 m!1426965))

(declare-fun m!1426967 () Bool)

(assert (=> start!132236 m!1426967))

(declare-fun m!1426969 () Bool)

(assert (=> b!1545812 m!1426969))

(check-sat (not b!1545808) (not mapNonEmpty!58423) (not start!132236) (not b!1545812) tp_is_empty!37813)
(check-sat)
