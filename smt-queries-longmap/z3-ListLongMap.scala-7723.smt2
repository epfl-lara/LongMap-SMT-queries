; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97018 () Bool)

(assert start!97018)

(declare-fun b!1103411 () Bool)

(declare-fun res!736164 () Bool)

(declare-fun e!629881 () Bool)

(assert (=> b!1103411 (=> (not res!736164) (not e!629881))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71456 0))(
  ( (array!71457 (arr!34385 (Array (_ BitVec 32) (_ BitVec 64))) (size!34923 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71456)

(assert (=> b!1103411 (= res!736164 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34923 _keys!1208))))))

(declare-fun mapNonEmpty!42775 () Bool)

(declare-fun mapRes!42775 () Bool)

(declare-fun tp!81695 () Bool)

(declare-fun e!629883 () Bool)

(assert (=> mapNonEmpty!42775 (= mapRes!42775 (and tp!81695 e!629883))))

(declare-datatypes ((V!41545 0))(
  ( (V!41546 (val!13713 Int)) )
))
(declare-datatypes ((ValueCell!12947 0))(
  ( (ValueCellFull!12947 (v!16344 V!41545)) (EmptyCell!12947) )
))
(declare-fun mapValue!42775 () ValueCell!12947)

(declare-fun mapRest!42775 () (Array (_ BitVec 32) ValueCell!12947))

(declare-datatypes ((array!71458 0))(
  ( (array!71459 (arr!34386 (Array (_ BitVec 32) ValueCell!12947)) (size!34924 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71458)

(declare-fun mapKey!42775 () (_ BitVec 32))

(assert (=> mapNonEmpty!42775 (= (arr!34386 _values!996) (store mapRest!42775 mapKey!42775 mapValue!42775))))

(declare-fun b!1103412 () Bool)

(declare-fun e!629882 () Bool)

(declare-fun tp_is_empty!27313 () Bool)

(assert (=> b!1103412 (= e!629882 tp_is_empty!27313)))

(declare-fun b!1103413 () Bool)

(declare-fun e!629879 () Bool)

(assert (=> b!1103413 (= e!629879 (and e!629882 mapRes!42775))))

(declare-fun condMapEmpty!42775 () Bool)

(declare-fun mapDefault!42775 () ValueCell!12947)

(assert (=> b!1103413 (= condMapEmpty!42775 (= (arr!34386 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12947)) mapDefault!42775)))))

(declare-fun res!736165 () Bool)

(assert (=> start!97018 (=> (not res!736165) (not e!629881))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97018 (= res!736165 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34923 _keys!1208))))))

(assert (=> start!97018 e!629881))

(declare-fun array_inv!26516 (array!71456) Bool)

(assert (=> start!97018 (array_inv!26516 _keys!1208)))

(assert (=> start!97018 true))

(declare-fun array_inv!26517 (array!71458) Bool)

(assert (=> start!97018 (and (array_inv!26517 _values!996) e!629879)))

(declare-fun b!1103414 () Bool)

(declare-fun res!736167 () Bool)

(assert (=> b!1103414 (=> (not res!736167) (not e!629881))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71456 (_ BitVec 32)) Bool)

(assert (=> b!1103414 (= res!736167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103415 () Bool)

(declare-fun res!736166 () Bool)

(assert (=> b!1103415 (=> (not res!736166) (not e!629881))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103415 (= res!736166 (and (= (size!34924 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34923 _keys!1208) (size!34924 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1103416 () Bool)

(assert (=> b!1103416 (= e!629881 (and (= (select (arr!34385 _keys!1208) i!673) k0!934) (not (= (size!34923 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun b!1103417 () Bool)

(declare-fun res!736162 () Bool)

(assert (=> b!1103417 (=> (not res!736162) (not e!629881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103417 (= res!736162 (validKeyInArray!0 k0!934))))

(declare-fun b!1103418 () Bool)

(declare-fun res!736163 () Bool)

(assert (=> b!1103418 (=> (not res!736163) (not e!629881))))

(declare-datatypes ((List!24073 0))(
  ( (Nil!24070) (Cons!24069 (h!25278 (_ BitVec 64)) (t!34329 List!24073)) )
))
(declare-fun arrayNoDuplicates!0 (array!71456 (_ BitVec 32) List!24073) Bool)

(assert (=> b!1103418 (= res!736163 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24070))))

(declare-fun b!1103419 () Bool)

(declare-fun res!736161 () Bool)

(assert (=> b!1103419 (=> (not res!736161) (not e!629881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103419 (= res!736161 (validMask!0 mask!1564))))

(declare-fun b!1103420 () Bool)

(assert (=> b!1103420 (= e!629883 tp_is_empty!27313)))

(declare-fun mapIsEmpty!42775 () Bool)

(assert (=> mapIsEmpty!42775 mapRes!42775))

(assert (= (and start!97018 res!736165) b!1103419))

(assert (= (and b!1103419 res!736161) b!1103415))

(assert (= (and b!1103415 res!736166) b!1103414))

(assert (= (and b!1103414 res!736167) b!1103418))

(assert (= (and b!1103418 res!736163) b!1103411))

(assert (= (and b!1103411 res!736164) b!1103417))

(assert (= (and b!1103417 res!736162) b!1103416))

(assert (= (and b!1103413 condMapEmpty!42775) mapIsEmpty!42775))

(assert (= (and b!1103413 (not condMapEmpty!42775)) mapNonEmpty!42775))

(get-info :version)

(assert (= (and mapNonEmpty!42775 ((_ is ValueCellFull!12947) mapValue!42775)) b!1103420))

(assert (= (and b!1103413 ((_ is ValueCellFull!12947) mapDefault!42775)) b!1103412))

(assert (= start!97018 b!1103413))

(declare-fun m!1023043 () Bool)

(assert (=> b!1103418 m!1023043))

(declare-fun m!1023045 () Bool)

(assert (=> b!1103416 m!1023045))

(declare-fun m!1023047 () Bool)

(assert (=> b!1103417 m!1023047))

(declare-fun m!1023049 () Bool)

(assert (=> start!97018 m!1023049))

(declare-fun m!1023051 () Bool)

(assert (=> start!97018 m!1023051))

(declare-fun m!1023053 () Bool)

(assert (=> mapNonEmpty!42775 m!1023053))

(declare-fun m!1023055 () Bool)

(assert (=> b!1103414 m!1023055))

(declare-fun m!1023057 () Bool)

(assert (=> b!1103419 m!1023057))

(check-sat (not b!1103418) (not mapNonEmpty!42775) tp_is_empty!27313 (not b!1103417) (not start!97018) (not b!1103414) (not b!1103419))
(check-sat)
