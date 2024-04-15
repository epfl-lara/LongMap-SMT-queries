; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110866 () Bool)

(assert start!110866)

(declare-fun b_free!29701 () Bool)

(declare-fun b_next!29701 () Bool)

(assert (=> start!110866 (= b_free!29701 (not b_next!29701))))

(declare-fun tp!104425 () Bool)

(declare-fun b_and!47891 () Bool)

(assert (=> start!110866 (= tp!104425 b_and!47891)))

(declare-fun mapIsEmpty!54775 () Bool)

(declare-fun mapRes!54775 () Bool)

(assert (=> mapIsEmpty!54775 mapRes!54775))

(declare-fun b!1312453 () Bool)

(declare-fun res!871384 () Bool)

(declare-fun e!748585 () Bool)

(assert (=> b!1312453 (=> (not res!871384) (not e!748585))))

(declare-datatypes ((array!87753 0))(
  ( (array!87754 (arr!42357 (Array (_ BitVec 32) (_ BitVec 64))) (size!42909 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87753)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52345 0))(
  ( (V!52346 (val!17790 Int)) )
))
(declare-datatypes ((ValueCell!16817 0))(
  ( (ValueCellFull!16817 (v!20416 V!52345)) (EmptyCell!16817) )
))
(declare-datatypes ((array!87755 0))(
  ( (array!87756 (arr!42358 (Array (_ BitVec 32) ValueCell!16817)) (size!42910 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87755)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312453 (= res!871384 (and (= (size!42910 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42909 _keys!1628) (size!42910 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312454 () Bool)

(assert (=> b!1312454 (= e!748585 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52345)

(declare-fun zeroValue!1296 () V!52345)

(declare-fun lt!585384 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23022 0))(
  ( (tuple2!23023 (_1!11522 (_ BitVec 64)) (_2!11522 V!52345)) )
))
(declare-datatypes ((List!30139 0))(
  ( (Nil!30136) (Cons!30135 (h!31344 tuple2!23022) (t!43737 List!30139)) )
))
(declare-datatypes ((ListLongMap!20679 0))(
  ( (ListLongMap!20680 (toList!10355 List!30139)) )
))
(declare-fun contains!8432 (ListLongMap!20679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5250 (array!87753 array!87755 (_ BitVec 32) (_ BitVec 32) V!52345 V!52345 (_ BitVec 32) Int) ListLongMap!20679)

(assert (=> b!1312454 (= lt!585384 (contains!8432 (getCurrentListMap!5250 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312455 () Bool)

(declare-fun res!871383 () Bool)

(assert (=> b!1312455 (=> (not res!871383) (not e!748585))))

(assert (=> b!1312455 (= res!871383 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42909 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312456 () Bool)

(declare-fun e!748586 () Bool)

(declare-fun tp_is_empty!35431 () Bool)

(assert (=> b!1312456 (= e!748586 tp_is_empty!35431)))

(declare-fun b!1312457 () Bool)

(declare-fun res!871385 () Bool)

(assert (=> b!1312457 (=> (not res!871385) (not e!748585))))

(declare-datatypes ((List!30140 0))(
  ( (Nil!30137) (Cons!30136 (h!31345 (_ BitVec 64)) (t!43738 List!30140)) )
))
(declare-fun arrayNoDuplicates!0 (array!87753 (_ BitVec 32) List!30140) Bool)

(assert (=> b!1312457 (= res!871385 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30137))))

(declare-fun res!871387 () Bool)

(assert (=> start!110866 (=> (not res!871387) (not e!748585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110866 (= res!871387 (validMask!0 mask!2040))))

(assert (=> start!110866 e!748585))

(assert (=> start!110866 tp!104425))

(declare-fun array_inv!32191 (array!87753) Bool)

(assert (=> start!110866 (array_inv!32191 _keys!1628)))

(assert (=> start!110866 true))

(assert (=> start!110866 tp_is_empty!35431))

(declare-fun e!748589 () Bool)

(declare-fun array_inv!32192 (array!87755) Bool)

(assert (=> start!110866 (and (array_inv!32192 _values!1354) e!748589)))

(declare-fun mapNonEmpty!54775 () Bool)

(declare-fun tp!104426 () Bool)

(assert (=> mapNonEmpty!54775 (= mapRes!54775 (and tp!104426 e!748586))))

(declare-fun mapValue!54775 () ValueCell!16817)

(declare-fun mapKey!54775 () (_ BitVec 32))

(declare-fun mapRest!54775 () (Array (_ BitVec 32) ValueCell!16817))

(assert (=> mapNonEmpty!54775 (= (arr!42358 _values!1354) (store mapRest!54775 mapKey!54775 mapValue!54775))))

(declare-fun b!1312458 () Bool)

(declare-fun res!871386 () Bool)

(assert (=> b!1312458 (=> (not res!871386) (not e!748585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87753 (_ BitVec 32)) Bool)

(assert (=> b!1312458 (= res!871386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312459 () Bool)

(declare-fun e!748588 () Bool)

(assert (=> b!1312459 (= e!748588 tp_is_empty!35431)))

(declare-fun b!1312460 () Bool)

(assert (=> b!1312460 (= e!748589 (and e!748588 mapRes!54775))))

(declare-fun condMapEmpty!54775 () Bool)

(declare-fun mapDefault!54775 () ValueCell!16817)

(assert (=> b!1312460 (= condMapEmpty!54775 (= (arr!42358 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16817)) mapDefault!54775)))))

(assert (= (and start!110866 res!871387) b!1312453))

(assert (= (and b!1312453 res!871384) b!1312458))

(assert (= (and b!1312458 res!871386) b!1312457))

(assert (= (and b!1312457 res!871385) b!1312455))

(assert (= (and b!1312455 res!871383) b!1312454))

(assert (= (and b!1312460 condMapEmpty!54775) mapIsEmpty!54775))

(assert (= (and b!1312460 (not condMapEmpty!54775)) mapNonEmpty!54775))

(get-info :version)

(assert (= (and mapNonEmpty!54775 ((_ is ValueCellFull!16817) mapValue!54775)) b!1312456))

(assert (= (and b!1312460 ((_ is ValueCellFull!16817) mapDefault!54775)) b!1312459))

(assert (= start!110866 b!1312460))

(declare-fun m!1201167 () Bool)

(assert (=> b!1312454 m!1201167))

(assert (=> b!1312454 m!1201167))

(declare-fun m!1201169 () Bool)

(assert (=> b!1312454 m!1201169))

(declare-fun m!1201171 () Bool)

(assert (=> start!110866 m!1201171))

(declare-fun m!1201173 () Bool)

(assert (=> start!110866 m!1201173))

(declare-fun m!1201175 () Bool)

(assert (=> start!110866 m!1201175))

(declare-fun m!1201177 () Bool)

(assert (=> b!1312457 m!1201177))

(declare-fun m!1201179 () Bool)

(assert (=> b!1312458 m!1201179))

(declare-fun m!1201181 () Bool)

(assert (=> mapNonEmpty!54775 m!1201181))

(check-sat tp_is_empty!35431 b_and!47891 (not start!110866) (not b!1312458) (not b!1312457) (not mapNonEmpty!54775) (not b!1312454) (not b_next!29701))
(check-sat b_and!47891 (not b_next!29701))
