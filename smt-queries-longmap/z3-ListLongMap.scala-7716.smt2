; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97188 () Bool)

(assert start!97188)

(declare-fun b!1104360 () Bool)

(declare-fun e!630440 () Bool)

(declare-fun tp_is_empty!27271 () Bool)

(assert (=> b!1104360 (= e!630440 tp_is_empty!27271)))

(declare-datatypes ((array!71501 0))(
  ( (array!71502 (arr!34404 (Array (_ BitVec 32) (_ BitVec 64))) (size!34941 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71501)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41489 0))(
  ( (V!41490 (val!13692 Int)) )
))
(declare-datatypes ((ValueCell!12926 0))(
  ( (ValueCellFull!12926 (v!16319 V!41489)) (EmptyCell!12926) )
))
(declare-datatypes ((array!71503 0))(
  ( (array!71504 (arr!34405 (Array (_ BitVec 32) ValueCell!12926)) (size!34942 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71503)

(declare-fun e!630442 () Bool)

(declare-fun b!1104361 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104361 (= e!630442 (and (= (size!34942 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34941 _keys!1208) (size!34942 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (not (= (size!34941 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun mapNonEmpty!42703 () Bool)

(declare-fun mapRes!42703 () Bool)

(declare-fun tp!81623 () Bool)

(assert (=> mapNonEmpty!42703 (= mapRes!42703 (and tp!81623 e!630440))))

(declare-fun mapKey!42703 () (_ BitVec 32))

(declare-fun mapRest!42703 () (Array (_ BitVec 32) ValueCell!12926))

(declare-fun mapValue!42703 () ValueCell!12926)

(assert (=> mapNonEmpty!42703 (= (arr!34405 _values!996) (store mapRest!42703 mapKey!42703 mapValue!42703))))

(declare-fun b!1104362 () Bool)

(declare-fun e!630439 () Bool)

(declare-fun e!630438 () Bool)

(assert (=> b!1104362 (= e!630439 (and e!630438 mapRes!42703))))

(declare-fun condMapEmpty!42703 () Bool)

(declare-fun mapDefault!42703 () ValueCell!12926)

(assert (=> b!1104362 (= condMapEmpty!42703 (= (arr!34405 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12926)) mapDefault!42703)))))

(declare-fun mapIsEmpty!42703 () Bool)

(assert (=> mapIsEmpty!42703 mapRes!42703))

(declare-fun res!736452 () Bool)

(assert (=> start!97188 (=> (not res!736452) (not e!630442))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97188 (= res!736452 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34941 _keys!1208))))))

(assert (=> start!97188 e!630442))

(declare-fun array_inv!26524 (array!71501) Bool)

(assert (=> start!97188 (array_inv!26524 _keys!1208)))

(assert (=> start!97188 true))

(declare-fun array_inv!26525 (array!71503) Bool)

(assert (=> start!97188 (and (array_inv!26525 _values!996) e!630439)))

(declare-fun b!1104363 () Bool)

(declare-fun res!736453 () Bool)

(assert (=> b!1104363 (=> (not res!736453) (not e!630442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104363 (= res!736453 (validMask!0 mask!1564))))

(declare-fun b!1104364 () Bool)

(assert (=> b!1104364 (= e!630438 tp_is_empty!27271)))

(assert (= (and start!97188 res!736452) b!1104363))

(assert (= (and b!1104363 res!736453) b!1104361))

(assert (= (and b!1104362 condMapEmpty!42703) mapIsEmpty!42703))

(assert (= (and b!1104362 (not condMapEmpty!42703)) mapNonEmpty!42703))

(get-info :version)

(assert (= (and mapNonEmpty!42703 ((_ is ValueCellFull!12926) mapValue!42703)) b!1104360))

(assert (= (and b!1104362 ((_ is ValueCellFull!12926) mapDefault!42703)) b!1104364))

(assert (= start!97188 b!1104362))

(declare-fun m!1025053 () Bool)

(assert (=> mapNonEmpty!42703 m!1025053))

(declare-fun m!1025055 () Bool)

(assert (=> start!97188 m!1025055))

(declare-fun m!1025057 () Bool)

(assert (=> start!97188 m!1025057))

(declare-fun m!1025059 () Bool)

(assert (=> b!1104363 m!1025059))

(check-sat (not start!97188) (not b!1104363) (not mapNonEmpty!42703) tp_is_empty!27271)
(check-sat)
