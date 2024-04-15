; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96952 () Bool)

(assert start!96952)

(declare-datatypes ((array!71386 0))(
  ( (array!71387 (arr!34353 (Array (_ BitVec 32) (_ BitVec 64))) (size!34891 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71386)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun b!1102925 () Bool)

(declare-fun e!629539 () Bool)

(declare-datatypes ((V!41497 0))(
  ( (V!41498 (val!13695 Int)) )
))
(declare-datatypes ((ValueCell!12929 0))(
  ( (ValueCellFull!12929 (v!16325 V!41497)) (EmptyCell!12929) )
))
(declare-datatypes ((array!71388 0))(
  ( (array!71389 (arr!34354 (Array (_ BitVec 32) ValueCell!12929)) (size!34892 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71388)

(assert (=> b!1102925 (= e!629539 (and (= (size!34892 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34891 _keys!1208) (size!34892 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (= (size!34891 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34891 _keys!1208))))))

(declare-fun res!735879 () Bool)

(assert (=> start!96952 (=> (not res!735879) (not e!629539))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96952 (= res!735879 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34891 _keys!1208))))))

(assert (=> start!96952 e!629539))

(declare-fun array_inv!26492 (array!71386) Bool)

(assert (=> start!96952 (array_inv!26492 _keys!1208)))

(assert (=> start!96952 true))

(declare-fun e!629535 () Bool)

(declare-fun array_inv!26493 (array!71388) Bool)

(assert (=> start!96952 (and (array_inv!26493 _values!996) e!629535)))

(declare-fun b!1102926 () Bool)

(declare-fun e!629538 () Bool)

(declare-fun tp_is_empty!27277 () Bool)

(assert (=> b!1102926 (= e!629538 tp_is_empty!27277)))

(declare-fun mapIsEmpty!42712 () Bool)

(declare-fun mapRes!42712 () Bool)

(assert (=> mapIsEmpty!42712 mapRes!42712))

(declare-fun b!1102927 () Bool)

(declare-fun res!735880 () Bool)

(assert (=> b!1102927 (=> (not res!735880) (not e!629539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1102927 (= res!735880 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42712 () Bool)

(declare-fun tp!81632 () Bool)

(assert (=> mapNonEmpty!42712 (= mapRes!42712 (and tp!81632 e!629538))))

(declare-fun mapKey!42712 () (_ BitVec 32))

(declare-fun mapRest!42712 () (Array (_ BitVec 32) ValueCell!12929))

(declare-fun mapValue!42712 () ValueCell!12929)

(assert (=> mapNonEmpty!42712 (= (arr!34354 _values!996) (store mapRest!42712 mapKey!42712 mapValue!42712))))

(declare-fun b!1102928 () Bool)

(declare-fun e!629536 () Bool)

(assert (=> b!1102928 (= e!629535 (and e!629536 mapRes!42712))))

(declare-fun condMapEmpty!42712 () Bool)

(declare-fun mapDefault!42712 () ValueCell!12929)

(assert (=> b!1102928 (= condMapEmpty!42712 (= (arr!34354 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12929)) mapDefault!42712)))))

(declare-fun b!1102929 () Bool)

(assert (=> b!1102929 (= e!629536 tp_is_empty!27277)))

(assert (= (and start!96952 res!735879) b!1102927))

(assert (= (and b!1102927 res!735880) b!1102925))

(assert (= (and b!1102928 condMapEmpty!42712) mapIsEmpty!42712))

(assert (= (and b!1102928 (not condMapEmpty!42712)) mapNonEmpty!42712))

(get-info :version)

(assert (= (and mapNonEmpty!42712 ((_ is ValueCellFull!12929) mapValue!42712)) b!1102926))

(assert (= (and b!1102928 ((_ is ValueCellFull!12929) mapDefault!42712)) b!1102929))

(assert (= start!96952 b!1102928))

(declare-fun m!1022779 () Bool)

(assert (=> start!96952 m!1022779))

(declare-fun m!1022781 () Bool)

(assert (=> start!96952 m!1022781))

(declare-fun m!1022783 () Bool)

(assert (=> b!1102927 m!1022783))

(declare-fun m!1022785 () Bool)

(assert (=> mapNonEmpty!42712 m!1022785))

(check-sat (not b!1102927) (not start!96952) (not mapNonEmpty!42712) tp_is_empty!27277)
(check-sat)
