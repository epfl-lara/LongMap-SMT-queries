; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97024 () Bool)

(assert start!97024)

(declare-fun mapIsEmpty!42784 () Bool)

(declare-fun mapRes!42784 () Bool)

(assert (=> mapIsEmpty!42784 mapRes!42784))

(declare-fun b!1103495 () Bool)

(declare-fun res!736221 () Bool)

(declare-fun e!629926 () Bool)

(assert (=> b!1103495 (=> (not res!736221) (not e!629926))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41553 0))(
  ( (V!41554 (val!13716 Int)) )
))
(declare-datatypes ((ValueCell!12950 0))(
  ( (ValueCellFull!12950 (v!16347 V!41553)) (EmptyCell!12950) )
))
(declare-datatypes ((array!71468 0))(
  ( (array!71469 (arr!34391 (Array (_ BitVec 32) ValueCell!12950)) (size!34929 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71468)

(declare-datatypes ((array!71470 0))(
  ( (array!71471 (arr!34392 (Array (_ BitVec 32) (_ BitVec 64))) (size!34930 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71470)

(assert (=> b!1103495 (= res!736221 (and (= (size!34929 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34930 _keys!1208) (size!34929 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103496 () Bool)

(declare-fun e!629928 () Bool)

(declare-fun tp_is_empty!27319 () Bool)

(assert (=> b!1103496 (= e!629928 tp_is_empty!27319)))

(declare-fun res!736220 () Bool)

(assert (=> start!97024 (=> (not res!736220) (not e!629926))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97024 (= res!736220 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34930 _keys!1208))))))

(assert (=> start!97024 e!629926))

(declare-fun array_inv!26518 (array!71470) Bool)

(assert (=> start!97024 (array_inv!26518 _keys!1208)))

(assert (=> start!97024 true))

(declare-fun e!629925 () Bool)

(declare-fun array_inv!26519 (array!71468) Bool)

(assert (=> start!97024 (and (array_inv!26519 _values!996) e!629925)))

(declare-fun b!1103497 () Bool)

(declare-fun e!629924 () Bool)

(assert (=> b!1103497 (= e!629924 tp_is_empty!27319)))

(declare-fun b!1103498 () Bool)

(assert (=> b!1103498 (= e!629925 (and e!629928 mapRes!42784))))

(declare-fun condMapEmpty!42784 () Bool)

(declare-fun mapDefault!42784 () ValueCell!12950)

(assert (=> b!1103498 (= condMapEmpty!42784 (= (arr!34391 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12950)) mapDefault!42784)))))

(declare-fun b!1103499 () Bool)

(declare-fun res!736219 () Bool)

(assert (=> b!1103499 (=> (not res!736219) (not e!629926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71470 (_ BitVec 32)) Bool)

(assert (=> b!1103499 (= res!736219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103500 () Bool)

(declare-fun res!736218 () Bool)

(assert (=> b!1103500 (=> (not res!736218) (not e!629926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103500 (= res!736218 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42784 () Bool)

(declare-fun tp!81704 () Bool)

(assert (=> mapNonEmpty!42784 (= mapRes!42784 (and tp!81704 e!629924))))

(declare-fun mapRest!42784 () (Array (_ BitVec 32) ValueCell!12950))

(declare-fun mapKey!42784 () (_ BitVec 32))

(declare-fun mapValue!42784 () ValueCell!12950)

(assert (=> mapNonEmpty!42784 (= (arr!34391 _values!996) (store mapRest!42784 mapKey!42784 mapValue!42784))))

(declare-fun b!1103501 () Bool)

(assert (=> b!1103501 (= e!629926 false)))

(declare-fun lt!494885 () Bool)

(declare-datatypes ((List!24074 0))(
  ( (Nil!24071) (Cons!24070 (h!25279 (_ BitVec 64)) (t!34330 List!24074)) )
))
(declare-fun arrayNoDuplicates!0 (array!71470 (_ BitVec 32) List!24074) Bool)

(assert (=> b!1103501 (= lt!494885 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24071))))

(assert (= (and start!97024 res!736220) b!1103500))

(assert (= (and b!1103500 res!736218) b!1103495))

(assert (= (and b!1103495 res!736221) b!1103499))

(assert (= (and b!1103499 res!736219) b!1103501))

(assert (= (and b!1103498 condMapEmpty!42784) mapIsEmpty!42784))

(assert (= (and b!1103498 (not condMapEmpty!42784)) mapNonEmpty!42784))

(get-info :version)

(assert (= (and mapNonEmpty!42784 ((_ is ValueCellFull!12950) mapValue!42784)) b!1103497))

(assert (= (and b!1103498 ((_ is ValueCellFull!12950) mapDefault!42784)) b!1103496))

(assert (= start!97024 b!1103498))

(declare-fun m!1023091 () Bool)

(assert (=> b!1103500 m!1023091))

(declare-fun m!1023093 () Bool)

(assert (=> b!1103499 m!1023093))

(declare-fun m!1023095 () Bool)

(assert (=> start!97024 m!1023095))

(declare-fun m!1023097 () Bool)

(assert (=> start!97024 m!1023097))

(declare-fun m!1023099 () Bool)

(assert (=> b!1103501 m!1023099))

(declare-fun m!1023101 () Bool)

(assert (=> mapNonEmpty!42784 m!1023101))

(check-sat (not b!1103499) (not mapNonEmpty!42784) (not b!1103500) (not start!97024) (not b!1103501) tp_is_empty!27319)
(check-sat)
