; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131706 () Bool)

(assert start!131706)

(declare-fun b!1542309 () Bool)

(declare-fun e!858021 () Bool)

(assert (=> b!1542309 (= e!858021 false)))

(declare-fun lt!665795 () Bool)

(declare-datatypes ((array!102620 0))(
  ( (array!102621 (arr!49512 (Array (_ BitVec 32) (_ BitVec 64))) (size!50062 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102620)

(declare-datatypes ((List!35871 0))(
  ( (Nil!35868) (Cons!35867 (h!37312 (_ BitVec 64)) (t!50565 List!35871)) )
))
(declare-fun arrayNoDuplicates!0 (array!102620 (_ BitVec 32) List!35871) Bool)

(assert (=> b!1542309 (= lt!665795 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35868))))

(declare-fun mapNonEmpty!58246 () Bool)

(declare-fun mapRes!58246 () Bool)

(declare-fun tp!110773 () Bool)

(declare-fun e!858024 () Bool)

(assert (=> mapNonEmpty!58246 (= mapRes!58246 (and tp!110773 e!858024))))

(declare-fun mapKey!58246 () (_ BitVec 32))

(declare-datatypes ((V!58703 0))(
  ( (V!58704 (val!18925 Int)) )
))
(declare-datatypes ((ValueCell!17937 0))(
  ( (ValueCellFull!17937 (v!21726 V!58703)) (EmptyCell!17937) )
))
(declare-fun mapRest!58246 () (Array (_ BitVec 32) ValueCell!17937))

(declare-datatypes ((array!102622 0))(
  ( (array!102623 (arr!49513 (Array (_ BitVec 32) ValueCell!17937)) (size!50063 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102622)

(declare-fun mapValue!58246 () ValueCell!17937)

(assert (=> mapNonEmpty!58246 (= (arr!49513 _values!470) (store mapRest!58246 mapKey!58246 mapValue!58246))))

(declare-fun mapIsEmpty!58246 () Bool)

(assert (=> mapIsEmpty!58246 mapRes!58246))

(declare-fun b!1542311 () Bool)

(declare-fun res!1058429 () Bool)

(assert (=> b!1542311 (=> (not res!1058429) (not e!858021))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102620 (_ BitVec 32)) Bool)

(assert (=> b!1542311 (= res!1058429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542312 () Bool)

(declare-fun tp_is_empty!37695 () Bool)

(assert (=> b!1542312 (= e!858024 tp_is_empty!37695)))

(declare-fun b!1542313 () Bool)

(declare-fun e!858020 () Bool)

(assert (=> b!1542313 (= e!858020 tp_is_empty!37695)))

(declare-fun b!1542314 () Bool)

(declare-fun e!858023 () Bool)

(assert (=> b!1542314 (= e!858023 (and e!858020 mapRes!58246))))

(declare-fun condMapEmpty!58246 () Bool)

(declare-fun mapDefault!58246 () ValueCell!17937)

(assert (=> b!1542314 (= condMapEmpty!58246 (= (arr!49513 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17937)) mapDefault!58246)))))

(declare-fun b!1542310 () Bool)

(declare-fun res!1058428 () Bool)

(assert (=> b!1542310 (=> (not res!1058428) (not e!858021))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542310 (= res!1058428 (and (= (size!50063 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50062 _keys!618) (size!50063 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1058430 () Bool)

(assert (=> start!131706 (=> (not res!1058430) (not e!858021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131706 (= res!1058430 (validMask!0 mask!926))))

(assert (=> start!131706 e!858021))

(assert (=> start!131706 true))

(declare-fun array_inv!38523 (array!102622) Bool)

(assert (=> start!131706 (and (array_inv!38523 _values!470) e!858023)))

(declare-fun array_inv!38524 (array!102620) Bool)

(assert (=> start!131706 (array_inv!38524 _keys!618)))

(assert (= (and start!131706 res!1058430) b!1542310))

(assert (= (and b!1542310 res!1058428) b!1542311))

(assert (= (and b!1542311 res!1058429) b!1542309))

(assert (= (and b!1542314 condMapEmpty!58246) mapIsEmpty!58246))

(assert (= (and b!1542314 (not condMapEmpty!58246)) mapNonEmpty!58246))

(get-info :version)

(assert (= (and mapNonEmpty!58246 ((_ is ValueCellFull!17937) mapValue!58246)) b!1542312))

(assert (= (and b!1542314 ((_ is ValueCellFull!17937) mapDefault!58246)) b!1542313))

(assert (= start!131706 b!1542314))

(declare-fun m!1423993 () Bool)

(assert (=> b!1542309 m!1423993))

(declare-fun m!1423995 () Bool)

(assert (=> mapNonEmpty!58246 m!1423995))

(declare-fun m!1423997 () Bool)

(assert (=> b!1542311 m!1423997))

(declare-fun m!1423999 () Bool)

(assert (=> start!131706 m!1423999))

(declare-fun m!1424001 () Bool)

(assert (=> start!131706 m!1424001))

(declare-fun m!1424003 () Bool)

(assert (=> start!131706 m!1424003))

(check-sat tp_is_empty!37695 (not start!131706) (not b!1542309) (not b!1542311) (not mapNonEmpty!58246))
(check-sat)
