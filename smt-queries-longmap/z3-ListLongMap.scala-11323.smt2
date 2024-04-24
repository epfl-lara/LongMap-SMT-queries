; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132254 () Bool)

(assert start!132254)

(declare-fun b!1545969 () Bool)

(declare-fun e!860552 () Bool)

(declare-fun e!860550 () Bool)

(declare-fun mapRes!58450 () Bool)

(assert (=> b!1545969 (= e!860552 (and e!860550 mapRes!58450))))

(declare-fun condMapEmpty!58450 () Bool)

(declare-datatypes ((V!58885 0))(
  ( (V!58886 (val!18993 Int)) )
))
(declare-datatypes ((ValueCell!18005 0))(
  ( (ValueCellFull!18005 (v!21786 V!58885)) (EmptyCell!18005) )
))
(declare-datatypes ((array!103002 0))(
  ( (array!103003 (arr!49696 (Array (_ BitVec 32) ValueCell!18005)) (size!50247 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103002)

(declare-fun mapDefault!58450 () ValueCell!18005)

(assert (=> b!1545969 (= condMapEmpty!58450 (= (arr!49696 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18005)) mapDefault!58450)))))

(declare-fun mapIsEmpty!58450 () Bool)

(assert (=> mapIsEmpty!58450 mapRes!58450))

(declare-fun b!1545970 () Bool)

(declare-fun e!860549 () Bool)

(assert (=> b!1545970 (= e!860549 false)))

(declare-fun lt!666907 () Bool)

(declare-datatypes ((array!103004 0))(
  ( (array!103005 (arr!49697 (Array (_ BitVec 32) (_ BitVec 64))) (size!50248 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103004)

(declare-datatypes ((List!35958 0))(
  ( (Nil!35955) (Cons!35954 (h!37417 (_ BitVec 64)) (t!50644 List!35958)) )
))
(declare-fun arrayNoDuplicates!0 (array!103004 (_ BitVec 32) List!35958) Bool)

(assert (=> b!1545970 (= lt!666907 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35955))))

(declare-fun mapNonEmpty!58450 () Bool)

(declare-fun tp!110977 () Bool)

(declare-fun e!860551 () Bool)

(assert (=> mapNonEmpty!58450 (= mapRes!58450 (and tp!110977 e!860551))))

(declare-fun mapRest!58450 () (Array (_ BitVec 32) ValueCell!18005))

(declare-fun mapKey!58450 () (_ BitVec 32))

(declare-fun mapValue!58450 () ValueCell!18005)

(assert (=> mapNonEmpty!58450 (= (arr!49696 _values!470) (store mapRest!58450 mapKey!58450 mapValue!58450))))

(declare-fun b!1545971 () Bool)

(declare-fun res!1059902 () Bool)

(assert (=> b!1545971 (=> (not res!1059902) (not e!860549))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103004 (_ BitVec 32)) Bool)

(assert (=> b!1545971 (= res!1059902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545972 () Bool)

(declare-fun res!1059900 () Bool)

(assert (=> b!1545972 (=> (not res!1059900) (not e!860549))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545972 (= res!1059900 (and (= (size!50247 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50248 _keys!618) (size!50247 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545974 () Bool)

(declare-fun tp_is_empty!37831 () Bool)

(assert (=> b!1545974 (= e!860551 tp_is_empty!37831)))

(declare-fun res!1059901 () Bool)

(assert (=> start!132254 (=> (not res!1059901) (not e!860549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132254 (= res!1059901 (validMask!0 mask!926))))

(assert (=> start!132254 e!860549))

(assert (=> start!132254 true))

(declare-fun array_inv!38923 (array!103002) Bool)

(assert (=> start!132254 (and (array_inv!38923 _values!470) e!860552)))

(declare-fun array_inv!38924 (array!103004) Bool)

(assert (=> start!132254 (array_inv!38924 _keys!618)))

(declare-fun b!1545973 () Bool)

(assert (=> b!1545973 (= e!860550 tp_is_empty!37831)))

(assert (= (and start!132254 res!1059901) b!1545972))

(assert (= (and b!1545972 res!1059900) b!1545971))

(assert (= (and b!1545971 res!1059902) b!1545970))

(assert (= (and b!1545969 condMapEmpty!58450) mapIsEmpty!58450))

(assert (= (and b!1545969 (not condMapEmpty!58450)) mapNonEmpty!58450))

(get-info :version)

(assert (= (and mapNonEmpty!58450 ((_ is ValueCellFull!18005) mapValue!58450)) b!1545974))

(assert (= (and b!1545969 ((_ is ValueCellFull!18005) mapDefault!58450)) b!1545973))

(assert (= start!132254 b!1545969))

(declare-fun m!1427067 () Bool)

(assert (=> b!1545970 m!1427067))

(declare-fun m!1427069 () Bool)

(assert (=> mapNonEmpty!58450 m!1427069))

(declare-fun m!1427071 () Bool)

(assert (=> b!1545971 m!1427071))

(declare-fun m!1427073 () Bool)

(assert (=> start!132254 m!1427073))

(declare-fun m!1427075 () Bool)

(assert (=> start!132254 m!1427075))

(declare-fun m!1427077 () Bool)

(assert (=> start!132254 m!1427077))

(check-sat (not b!1545970) (not mapNonEmpty!58450) (not b!1545971) (not start!132254) tp_is_empty!37831)
(check-sat)
