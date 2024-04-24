; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97266 () Bool)

(assert start!97266)

(declare-fun b!1104975 () Bool)

(declare-fun e!630873 () Bool)

(declare-fun e!630874 () Bool)

(declare-fun mapRes!42784 () Bool)

(assert (=> b!1104975 (= e!630873 (and e!630874 mapRes!42784))))

(declare-fun condMapEmpty!42784 () Bool)

(declare-datatypes ((V!41553 0))(
  ( (V!41554 (val!13716 Int)) )
))
(declare-datatypes ((ValueCell!12950 0))(
  ( (ValueCellFull!12950 (v!16344 V!41553)) (EmptyCell!12950) )
))
(declare-datatypes ((array!71595 0))(
  ( (array!71596 (arr!34448 (Array (_ BitVec 32) ValueCell!12950)) (size!34985 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71595)

(declare-fun mapDefault!42784 () ValueCell!12950)

(assert (=> b!1104975 (= condMapEmpty!42784 (= (arr!34448 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12950)) mapDefault!42784)))))

(declare-fun b!1104976 () Bool)

(declare-fun res!736810 () Bool)

(declare-fun e!630875 () Bool)

(assert (=> b!1104976 (=> (not res!736810) (not e!630875))))

(declare-datatypes ((array!71597 0))(
  ( (array!71598 (arr!34449 (Array (_ BitVec 32) (_ BitVec 64))) (size!34986 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71597)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71597 (_ BitVec 32)) Bool)

(assert (=> b!1104976 (= res!736810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!736812 () Bool)

(assert (=> start!97266 (=> (not res!736812) (not e!630875))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97266 (= res!736812 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34986 _keys!1208))))))

(assert (=> start!97266 e!630875))

(declare-fun array_inv!26562 (array!71597) Bool)

(assert (=> start!97266 (array_inv!26562 _keys!1208)))

(assert (=> start!97266 true))

(declare-fun array_inv!26563 (array!71595) Bool)

(assert (=> start!97266 (and (array_inv!26563 _values!996) e!630873)))

(declare-fun b!1104977 () Bool)

(declare-fun tp_is_empty!27319 () Bool)

(assert (=> b!1104977 (= e!630874 tp_is_empty!27319)))

(declare-fun b!1104978 () Bool)

(declare-fun res!736811 () Bool)

(assert (=> b!1104978 (=> (not res!736811) (not e!630875))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104978 (= res!736811 (and (= (size!34985 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34986 _keys!1208) (size!34985 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42784 () Bool)

(assert (=> mapIsEmpty!42784 mapRes!42784))

(declare-fun b!1104979 () Bool)

(declare-fun e!630872 () Bool)

(assert (=> b!1104979 (= e!630872 tp_is_empty!27319)))

(declare-fun b!1104980 () Bool)

(assert (=> b!1104980 (= e!630875 false)))

(declare-fun lt!495600 () Bool)

(declare-datatypes ((List!24065 0))(
  ( (Nil!24062) (Cons!24061 (h!25279 (_ BitVec 64)) (t!34322 List!24065)) )
))
(declare-fun arrayNoDuplicates!0 (array!71597 (_ BitVec 32) List!24065) Bool)

(assert (=> b!1104980 (= lt!495600 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24062))))

(declare-fun b!1104981 () Bool)

(declare-fun res!736809 () Bool)

(assert (=> b!1104981 (=> (not res!736809) (not e!630875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104981 (= res!736809 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42784 () Bool)

(declare-fun tp!81704 () Bool)

(assert (=> mapNonEmpty!42784 (= mapRes!42784 (and tp!81704 e!630872))))

(declare-fun mapKey!42784 () (_ BitVec 32))

(declare-fun mapValue!42784 () ValueCell!12950)

(declare-fun mapRest!42784 () (Array (_ BitVec 32) ValueCell!12950))

(assert (=> mapNonEmpty!42784 (= (arr!34448 _values!996) (store mapRest!42784 mapKey!42784 mapValue!42784))))

(assert (= (and start!97266 res!736812) b!1104981))

(assert (= (and b!1104981 res!736809) b!1104978))

(assert (= (and b!1104978 res!736811) b!1104976))

(assert (= (and b!1104976 res!736810) b!1104980))

(assert (= (and b!1104975 condMapEmpty!42784) mapIsEmpty!42784))

(assert (= (and b!1104975 (not condMapEmpty!42784)) mapNonEmpty!42784))

(get-info :version)

(assert (= (and mapNonEmpty!42784 ((_ is ValueCellFull!12950) mapValue!42784)) b!1104979))

(assert (= (and b!1104975 ((_ is ValueCellFull!12950) mapDefault!42784)) b!1104977))

(assert (= start!97266 b!1104975))

(declare-fun m!1025389 () Bool)

(assert (=> b!1104980 m!1025389))

(declare-fun m!1025391 () Bool)

(assert (=> start!97266 m!1025391))

(declare-fun m!1025393 () Bool)

(assert (=> start!97266 m!1025393))

(declare-fun m!1025395 () Bool)

(assert (=> b!1104976 m!1025395))

(declare-fun m!1025397 () Bool)

(assert (=> mapNonEmpty!42784 m!1025397))

(declare-fun m!1025399 () Bool)

(assert (=> b!1104981 m!1025399))

(check-sat tp_is_empty!27319 (not b!1104980) (not b!1104981) (not b!1104976) (not mapNonEmpty!42784) (not start!97266))
(check-sat)
