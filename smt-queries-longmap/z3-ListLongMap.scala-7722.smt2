; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97020 () Bool)

(assert start!97020)

(declare-fun mapIsEmpty!42769 () Bool)

(declare-fun mapRes!42769 () Bool)

(assert (=> mapIsEmpty!42769 mapRes!42769))

(declare-fun b!1103516 () Bool)

(declare-fun e!629945 () Bool)

(declare-fun tp_is_empty!27309 () Bool)

(assert (=> b!1103516 (= e!629945 tp_is_empty!27309)))

(declare-fun b!1103517 () Bool)

(declare-fun e!629943 () Bool)

(assert (=> b!1103517 (= e!629943 false)))

(declare-fun lt!495079 () Bool)

(declare-datatypes ((array!71541 0))(
  ( (array!71542 (arr!34427 (Array (_ BitVec 32) (_ BitVec 64))) (size!34963 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71541)

(declare-datatypes ((List!24040 0))(
  ( (Nil!24037) (Cons!24036 (h!25245 (_ BitVec 64)) (t!34305 List!24040)) )
))
(declare-fun arrayNoDuplicates!0 (array!71541 (_ BitVec 32) List!24040) Bool)

(assert (=> b!1103517 (= lt!495079 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24037))))

(declare-fun b!1103518 () Bool)

(declare-fun e!629944 () Bool)

(assert (=> b!1103518 (= e!629944 tp_is_empty!27309)))

(declare-fun b!1103519 () Bool)

(declare-fun e!629946 () Bool)

(assert (=> b!1103519 (= e!629946 (and e!629945 mapRes!42769))))

(declare-fun condMapEmpty!42769 () Bool)

(declare-datatypes ((V!41539 0))(
  ( (V!41540 (val!13711 Int)) )
))
(declare-datatypes ((ValueCell!12945 0))(
  ( (ValueCellFull!12945 (v!16343 V!41539)) (EmptyCell!12945) )
))
(declare-datatypes ((array!71543 0))(
  ( (array!71544 (arr!34428 (Array (_ BitVec 32) ValueCell!12945)) (size!34964 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71543)

(declare-fun mapDefault!42769 () ValueCell!12945)

(assert (=> b!1103519 (= condMapEmpty!42769 (= (arr!34428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12945)) mapDefault!42769)))))

(declare-fun b!1103520 () Bool)

(declare-fun res!736202 () Bool)

(assert (=> b!1103520 (=> (not res!736202) (not e!629943))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103520 (= res!736202 (validMask!0 mask!1564))))

(declare-fun res!736203 () Bool)

(assert (=> start!97020 (=> (not res!736203) (not e!629943))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97020 (= res!736203 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34963 _keys!1208))))))

(assert (=> start!97020 e!629943))

(declare-fun array_inv!26512 (array!71541) Bool)

(assert (=> start!97020 (array_inv!26512 _keys!1208)))

(assert (=> start!97020 true))

(declare-fun array_inv!26513 (array!71543) Bool)

(assert (=> start!97020 (and (array_inv!26513 _values!996) e!629946)))

(declare-fun mapNonEmpty!42769 () Bool)

(declare-fun tp!81689 () Bool)

(assert (=> mapNonEmpty!42769 (= mapRes!42769 (and tp!81689 e!629944))))

(declare-fun mapRest!42769 () (Array (_ BitVec 32) ValueCell!12945))

(declare-fun mapKey!42769 () (_ BitVec 32))

(declare-fun mapValue!42769 () ValueCell!12945)

(assert (=> mapNonEmpty!42769 (= (arr!34428 _values!996) (store mapRest!42769 mapKey!42769 mapValue!42769))))

(declare-fun b!1103521 () Bool)

(declare-fun res!736201 () Bool)

(assert (=> b!1103521 (=> (not res!736201) (not e!629943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71541 (_ BitVec 32)) Bool)

(assert (=> b!1103521 (= res!736201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103522 () Bool)

(declare-fun res!736200 () Bool)

(assert (=> b!1103522 (=> (not res!736200) (not e!629943))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103522 (= res!736200 (and (= (size!34964 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34963 _keys!1208) (size!34964 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97020 res!736203) b!1103520))

(assert (= (and b!1103520 res!736202) b!1103522))

(assert (= (and b!1103522 res!736200) b!1103521))

(assert (= (and b!1103521 res!736201) b!1103517))

(assert (= (and b!1103519 condMapEmpty!42769) mapIsEmpty!42769))

(assert (= (and b!1103519 (not condMapEmpty!42769)) mapNonEmpty!42769))

(get-info :version)

(assert (= (and mapNonEmpty!42769 ((_ is ValueCellFull!12945) mapValue!42769)) b!1103518))

(assert (= (and b!1103519 ((_ is ValueCellFull!12945) mapDefault!42769)) b!1103516))

(assert (= start!97020 b!1103519))

(declare-fun m!1023645 () Bool)

(assert (=> b!1103521 m!1023645))

(declare-fun m!1023647 () Bool)

(assert (=> b!1103520 m!1023647))

(declare-fun m!1023649 () Bool)

(assert (=> b!1103517 m!1023649))

(declare-fun m!1023651 () Bool)

(assert (=> start!97020 m!1023651))

(declare-fun m!1023653 () Bool)

(assert (=> start!97020 m!1023653))

(declare-fun m!1023655 () Bool)

(assert (=> mapNonEmpty!42769 m!1023655))

(check-sat (not b!1103521) tp_is_empty!27309 (not b!1103517) (not mapNonEmpty!42769) (not b!1103520) (not start!97020))
(check-sat)
