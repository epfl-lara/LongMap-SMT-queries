; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110982 () Bool)

(assert start!110982)

(declare-fun b_free!29593 () Bool)

(declare-fun b_next!29593 () Bool)

(assert (=> start!110982 (= b_free!29593 (not b_next!29593))))

(declare-fun tp!104100 () Bool)

(declare-fun b_and!47803 () Bool)

(assert (=> start!110982 (= tp!104100 b_and!47803)))

(declare-fun b!1312202 () Bool)

(declare-fun e!748655 () Bool)

(declare-fun e!748653 () Bool)

(declare-fun mapRes!54613 () Bool)

(assert (=> b!1312202 (= e!748655 (and e!748653 mapRes!54613))))

(declare-fun condMapEmpty!54613 () Bool)

(declare-datatypes ((V!52201 0))(
  ( (V!52202 (val!17736 Int)) )
))
(declare-datatypes ((ValueCell!16763 0))(
  ( (ValueCellFull!16763 (v!20358 V!52201)) (EmptyCell!16763) )
))
(declare-datatypes ((array!87689 0))(
  ( (array!87690 (arr!42320 (Array (_ BitVec 32) ValueCell!16763)) (size!42871 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87689)

(declare-fun mapDefault!54613 () ValueCell!16763)

(assert (=> b!1312202 (= condMapEmpty!54613 (= (arr!42320 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16763)) mapDefault!54613)))))

(declare-fun b!1312203 () Bool)

(declare-fun res!870798 () Bool)

(declare-fun e!748654 () Bool)

(assert (=> b!1312203 (=> (not res!870798) (not e!748654))))

(declare-datatypes ((array!87691 0))(
  ( (array!87692 (arr!42321 (Array (_ BitVec 32) (_ BitVec 64))) (size!42872 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87691)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312203 (= res!870798 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42872 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54613 () Bool)

(assert (=> mapIsEmpty!54613 mapRes!54613))

(declare-fun b!1312204 () Bool)

(declare-fun tp_is_empty!35323 () Bool)

(assert (=> b!1312204 (= e!748653 tp_is_empty!35323)))

(declare-fun b!1312205 () Bool)

(declare-fun res!870796 () Bool)

(assert (=> b!1312205 (=> (not res!870796) (not e!748654))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312205 (= res!870796 (and (= (size!42871 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42872 _keys!1628) (size!42871 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312206 () Bool)

(declare-fun e!748652 () Bool)

(assert (=> b!1312206 (= e!748652 tp_is_empty!35323)))

(declare-fun b!1312207 () Bool)

(assert (=> b!1312207 (= e!748654 false)))

(declare-fun minValue!1296 () V!52201)

(declare-fun zeroValue!1296 () V!52201)

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585884 () Bool)

(declare-datatypes ((tuple2!22892 0))(
  ( (tuple2!22893 (_1!11457 (_ BitVec 64)) (_2!11457 V!52201)) )
))
(declare-datatypes ((List!30045 0))(
  ( (Nil!30042) (Cons!30041 (h!31259 tuple2!22892) (t!43643 List!30045)) )
))
(declare-datatypes ((ListLongMap!20557 0))(
  ( (ListLongMap!20558 (toList!10294 List!30045)) )
))
(declare-fun contains!8456 (ListLongMap!20557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5298 (array!87691 array!87689 (_ BitVec 32) (_ BitVec 32) V!52201 V!52201 (_ BitVec 32) Int) ListLongMap!20557)

(assert (=> b!1312207 (= lt!585884 (contains!8456 (getCurrentListMap!5298 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312208 () Bool)

(declare-fun res!870800 () Bool)

(assert (=> b!1312208 (=> (not res!870800) (not e!748654))))

(declare-datatypes ((List!30046 0))(
  ( (Nil!30043) (Cons!30042 (h!31260 (_ BitVec 64)) (t!43644 List!30046)) )
))
(declare-fun arrayNoDuplicates!0 (array!87691 (_ BitVec 32) List!30046) Bool)

(assert (=> b!1312208 (= res!870800 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30043))))

(declare-fun b!1312209 () Bool)

(declare-fun res!870799 () Bool)

(assert (=> b!1312209 (=> (not res!870799) (not e!748654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87691 (_ BitVec 32)) Bool)

(assert (=> b!1312209 (= res!870799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54613 () Bool)

(declare-fun tp!104101 () Bool)

(assert (=> mapNonEmpty!54613 (= mapRes!54613 (and tp!104101 e!748652))))

(declare-fun mapRest!54613 () (Array (_ BitVec 32) ValueCell!16763))

(declare-fun mapValue!54613 () ValueCell!16763)

(declare-fun mapKey!54613 () (_ BitVec 32))

(assert (=> mapNonEmpty!54613 (= (arr!42320 _values!1354) (store mapRest!54613 mapKey!54613 mapValue!54613))))

(declare-fun res!870797 () Bool)

(assert (=> start!110982 (=> (not res!870797) (not e!748654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110982 (= res!870797 (validMask!0 mask!2040))))

(assert (=> start!110982 e!748654))

(assert (=> start!110982 tp!104100))

(declare-fun array_inv!32249 (array!87691) Bool)

(assert (=> start!110982 (array_inv!32249 _keys!1628)))

(assert (=> start!110982 true))

(assert (=> start!110982 tp_is_empty!35323))

(declare-fun array_inv!32250 (array!87689) Bool)

(assert (=> start!110982 (and (array_inv!32250 _values!1354) e!748655)))

(assert (= (and start!110982 res!870797) b!1312205))

(assert (= (and b!1312205 res!870796) b!1312209))

(assert (= (and b!1312209 res!870799) b!1312208))

(assert (= (and b!1312208 res!870800) b!1312203))

(assert (= (and b!1312203 res!870798) b!1312207))

(assert (= (and b!1312202 condMapEmpty!54613) mapIsEmpty!54613))

(assert (= (and b!1312202 (not condMapEmpty!54613)) mapNonEmpty!54613))

(get-info :version)

(assert (= (and mapNonEmpty!54613 ((_ is ValueCellFull!16763) mapValue!54613)) b!1312206))

(assert (= (and b!1312202 ((_ is ValueCellFull!16763) mapDefault!54613)) b!1312204))

(assert (= start!110982 b!1312202))

(declare-fun m!1202147 () Bool)

(assert (=> b!1312208 m!1202147))

(declare-fun m!1202149 () Bool)

(assert (=> start!110982 m!1202149))

(declare-fun m!1202151 () Bool)

(assert (=> start!110982 m!1202151))

(declare-fun m!1202153 () Bool)

(assert (=> start!110982 m!1202153))

(declare-fun m!1202155 () Bool)

(assert (=> b!1312207 m!1202155))

(assert (=> b!1312207 m!1202155))

(declare-fun m!1202157 () Bool)

(assert (=> b!1312207 m!1202157))

(declare-fun m!1202159 () Bool)

(assert (=> mapNonEmpty!54613 m!1202159))

(declare-fun m!1202161 () Bool)

(assert (=> b!1312209 m!1202161))

(check-sat tp_is_empty!35323 (not b!1312208) (not b_next!29593) (not b!1312209) (not b!1312207) b_and!47803 (not start!110982) (not mapNonEmpty!54613))
(check-sat b_and!47803 (not b_next!29593))
