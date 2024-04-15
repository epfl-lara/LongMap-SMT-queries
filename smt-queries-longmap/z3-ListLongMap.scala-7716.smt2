; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96946 () Bool)

(assert start!96946)

(declare-datatypes ((array!71374 0))(
  ( (array!71375 (arr!34347 (Array (_ BitVec 32) (_ BitVec 64))) (size!34885 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71374)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41489 0))(
  ( (V!41490 (val!13692 Int)) )
))
(declare-datatypes ((ValueCell!12926 0))(
  ( (ValueCellFull!12926 (v!16322 V!41489)) (EmptyCell!12926) )
))
(declare-datatypes ((array!71376 0))(
  ( (array!71377 (arr!34348 (Array (_ BitVec 32) ValueCell!12926)) (size!34886 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71376)

(declare-fun e!629491 () Bool)

(declare-fun b!1102880 () Bool)

(assert (=> b!1102880 (= e!629491 (and (= (size!34886 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34885 _keys!1208) (size!34886 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (not (= (size!34885 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun mapNonEmpty!42703 () Bool)

(declare-fun mapRes!42703 () Bool)

(declare-fun tp!81623 () Bool)

(declare-fun e!629490 () Bool)

(assert (=> mapNonEmpty!42703 (= mapRes!42703 (and tp!81623 e!629490))))

(declare-fun mapKey!42703 () (_ BitVec 32))

(declare-fun mapValue!42703 () ValueCell!12926)

(declare-fun mapRest!42703 () (Array (_ BitVec 32) ValueCell!12926))

(assert (=> mapNonEmpty!42703 (= (arr!34348 _values!996) (store mapRest!42703 mapKey!42703 mapValue!42703))))

(declare-fun res!735861 () Bool)

(assert (=> start!96946 (=> (not res!735861) (not e!629491))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96946 (= res!735861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34885 _keys!1208))))))

(assert (=> start!96946 e!629491))

(declare-fun array_inv!26486 (array!71374) Bool)

(assert (=> start!96946 (array_inv!26486 _keys!1208)))

(assert (=> start!96946 true))

(declare-fun e!629492 () Bool)

(declare-fun array_inv!26487 (array!71376) Bool)

(assert (=> start!96946 (and (array_inv!26487 _values!996) e!629492)))

(declare-fun b!1102881 () Bool)

(declare-fun e!629493 () Bool)

(assert (=> b!1102881 (= e!629492 (and e!629493 mapRes!42703))))

(declare-fun condMapEmpty!42703 () Bool)

(declare-fun mapDefault!42703 () ValueCell!12926)

(assert (=> b!1102881 (= condMapEmpty!42703 (= (arr!34348 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12926)) mapDefault!42703)))))

(declare-fun b!1102882 () Bool)

(declare-fun res!735862 () Bool)

(assert (=> b!1102882 (=> (not res!735862) (not e!629491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1102882 (= res!735862 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42703 () Bool)

(assert (=> mapIsEmpty!42703 mapRes!42703))

(declare-fun b!1102883 () Bool)

(declare-fun tp_is_empty!27271 () Bool)

(assert (=> b!1102883 (= e!629493 tp_is_empty!27271)))

(declare-fun b!1102884 () Bool)

(assert (=> b!1102884 (= e!629490 tp_is_empty!27271)))

(assert (= (and start!96946 res!735861) b!1102882))

(assert (= (and b!1102882 res!735862) b!1102880))

(assert (= (and b!1102881 condMapEmpty!42703) mapIsEmpty!42703))

(assert (= (and b!1102881 (not condMapEmpty!42703)) mapNonEmpty!42703))

(get-info :version)

(assert (= (and mapNonEmpty!42703 ((_ is ValueCellFull!12926) mapValue!42703)) b!1102884))

(assert (= (and b!1102881 ((_ is ValueCellFull!12926) mapDefault!42703)) b!1102883))

(assert (= start!96946 b!1102881))

(declare-fun m!1022755 () Bool)

(assert (=> mapNonEmpty!42703 m!1022755))

(declare-fun m!1022757 () Bool)

(assert (=> start!96946 m!1022757))

(declare-fun m!1022759 () Bool)

(assert (=> start!96946 m!1022759))

(declare-fun m!1022761 () Bool)

(assert (=> b!1102882 m!1022761))

(check-sat (not start!96946) (not b!1102882) (not mapNonEmpty!42703) tp_is_empty!27271)
(check-sat)
