; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96958 () Bool)

(assert start!96958)

(declare-fun mapNonEmpty!42721 () Bool)

(declare-fun mapRes!42721 () Bool)

(declare-fun tp!81641 () Bool)

(declare-fun e!629583 () Bool)

(assert (=> mapNonEmpty!42721 (= mapRes!42721 (and tp!81641 e!629583))))

(declare-datatypes ((V!41505 0))(
  ( (V!41506 (val!13698 Int)) )
))
(declare-datatypes ((ValueCell!12932 0))(
  ( (ValueCellFull!12932 (v!16328 V!41505)) (EmptyCell!12932) )
))
(declare-fun mapRest!42721 () (Array (_ BitVec 32) ValueCell!12932))

(declare-datatypes ((array!71398 0))(
  ( (array!71399 (arr!34359 (Array (_ BitVec 32) ValueCell!12932)) (size!34897 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71398)

(declare-fun mapKey!42721 () (_ BitVec 32))

(declare-fun mapValue!42721 () ValueCell!12932)

(assert (=> mapNonEmpty!42721 (= (arr!34359 _values!996) (store mapRest!42721 mapKey!42721 mapValue!42721))))

(declare-fun b!1102974 () Bool)

(declare-fun e!629581 () Bool)

(declare-fun tp_is_empty!27283 () Bool)

(assert (=> b!1102974 (= e!629581 tp_is_empty!27283)))

(declare-fun b!1102975 () Bool)

(assert (=> b!1102975 (= e!629583 tp_is_empty!27283)))

(declare-fun b!1102976 () Bool)

(declare-fun e!629582 () Bool)

(assert (=> b!1102976 (= e!629582 (and e!629581 mapRes!42721))))

(declare-fun condMapEmpty!42721 () Bool)

(declare-fun mapDefault!42721 () ValueCell!12932)

(assert (=> b!1102976 (= condMapEmpty!42721 (= (arr!34359 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12932)) mapDefault!42721)))))

(declare-fun mapIsEmpty!42721 () Bool)

(assert (=> mapIsEmpty!42721 mapRes!42721))

(declare-fun b!1102977 () Bool)

(declare-fun res!735902 () Bool)

(declare-fun e!629580 () Bool)

(assert (=> b!1102977 (=> (not res!735902) (not e!629580))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1102977 (= res!735902 (validMask!0 mask!1564))))

(declare-fun res!735901 () Bool)

(assert (=> start!96958 (=> (not res!735901) (not e!629580))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71400 0))(
  ( (array!71401 (arr!34360 (Array (_ BitVec 32) (_ BitVec 64))) (size!34898 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71400)

(assert (=> start!96958 (= res!735901 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34898 _keys!1208))))))

(assert (=> start!96958 e!629580))

(declare-fun array_inv!26496 (array!71400) Bool)

(assert (=> start!96958 (array_inv!26496 _keys!1208)))

(assert (=> start!96958 true))

(declare-fun array_inv!26497 (array!71398) Bool)

(assert (=> start!96958 (and (array_inv!26497 _values!996) e!629582)))

(declare-fun b!1102978 () Bool)

(declare-fun res!735903 () Bool)

(assert (=> b!1102978 (=> (not res!735903) (not e!629580))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1102978 (= res!735903 (and (= (size!34897 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34898 _keys!1208) (size!34897 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1102979 () Bool)

(declare-fun res!735904 () Bool)

(assert (=> b!1102979 (=> (not res!735904) (not e!629580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71400 (_ BitVec 32)) Bool)

(assert (=> b!1102979 (= res!735904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1102980 () Bool)

(assert (=> b!1102980 (= e!629580 (bvsgt #b00000000000000000000000000000000 (size!34898 _keys!1208)))))

(assert (= (and start!96958 res!735901) b!1102977))

(assert (= (and b!1102977 res!735902) b!1102978))

(assert (= (and b!1102978 res!735903) b!1102979))

(assert (= (and b!1102979 res!735904) b!1102980))

(assert (= (and b!1102976 condMapEmpty!42721) mapIsEmpty!42721))

(assert (= (and b!1102976 (not condMapEmpty!42721)) mapNonEmpty!42721))

(get-info :version)

(assert (= (and mapNonEmpty!42721 ((_ is ValueCellFull!12932) mapValue!42721)) b!1102975))

(assert (= (and b!1102976 ((_ is ValueCellFull!12932) mapDefault!42721)) b!1102974))

(assert (= start!96958 b!1102976))

(declare-fun m!1022803 () Bool)

(assert (=> mapNonEmpty!42721 m!1022803))

(declare-fun m!1022805 () Bool)

(assert (=> b!1102977 m!1022805))

(declare-fun m!1022807 () Bool)

(assert (=> start!96958 m!1022807))

(declare-fun m!1022809 () Bool)

(assert (=> start!96958 m!1022809))

(declare-fun m!1022811 () Bool)

(assert (=> b!1102979 m!1022811))

(check-sat (not start!96958) (not b!1102977) (not b!1102979) tp_is_empty!27283 (not mapNonEmpty!42721))
(check-sat)
