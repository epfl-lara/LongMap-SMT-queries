; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96966 () Bool)

(assert start!96966)

(declare-fun b!1103148 () Bool)

(declare-fun res!735984 () Bool)

(declare-fun e!629692 () Bool)

(assert (=> b!1103148 (=> (not res!735984) (not e!629692))))

(declare-datatypes ((array!71489 0))(
  ( (array!71490 (arr!34404 (Array (_ BitVec 32) (_ BitVec 64))) (size!34940 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71489)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41507 0))(
  ( (V!41508 (val!13699 Int)) )
))
(declare-datatypes ((ValueCell!12933 0))(
  ( (ValueCellFull!12933 (v!16330 V!41507)) (EmptyCell!12933) )
))
(declare-datatypes ((array!71491 0))(
  ( (array!71492 (arr!34405 (Array (_ BitVec 32) ValueCell!12933)) (size!34941 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71491)

(assert (=> b!1103148 (= res!735984 (and (= (size!34941 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34940 _keys!1208) (size!34941 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103149 () Bool)

(declare-fun res!735983 () Bool)

(assert (=> b!1103149 (=> (not res!735983) (not e!629692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71489 (_ BitVec 32)) Bool)

(assert (=> b!1103149 (= res!735983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42724 () Bool)

(declare-fun mapRes!42724 () Bool)

(assert (=> mapIsEmpty!42724 mapRes!42724))

(declare-fun mapNonEmpty!42724 () Bool)

(declare-fun tp!81644 () Bool)

(declare-fun e!629690 () Bool)

(assert (=> mapNonEmpty!42724 (= mapRes!42724 (and tp!81644 e!629690))))

(declare-fun mapValue!42724 () ValueCell!12933)

(declare-fun mapRest!42724 () (Array (_ BitVec 32) ValueCell!12933))

(declare-fun mapKey!42724 () (_ BitVec 32))

(assert (=> mapNonEmpty!42724 (= (arr!34405 _values!996) (store mapRest!42724 mapKey!42724 mapValue!42724))))

(declare-fun res!735985 () Bool)

(assert (=> start!96966 (=> (not res!735985) (not e!629692))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96966 (= res!735985 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34940 _keys!1208))))))

(assert (=> start!96966 e!629692))

(declare-fun array_inv!26496 (array!71489) Bool)

(assert (=> start!96966 (array_inv!26496 _keys!1208)))

(assert (=> start!96966 true))

(declare-fun e!629691 () Bool)

(declare-fun array_inv!26497 (array!71491) Bool)

(assert (=> start!96966 (and (array_inv!26497 _values!996) e!629691)))

(declare-fun b!1103150 () Bool)

(declare-fun res!735982 () Bool)

(assert (=> b!1103150 (=> (not res!735982) (not e!629692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103150 (= res!735982 (validMask!0 mask!1564))))

(declare-fun b!1103151 () Bool)

(declare-fun e!629688 () Bool)

(assert (=> b!1103151 (= e!629691 (and e!629688 mapRes!42724))))

(declare-fun condMapEmpty!42724 () Bool)

(declare-fun mapDefault!42724 () ValueCell!12933)

(assert (=> b!1103151 (= condMapEmpty!42724 (= (arr!34405 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12933)) mapDefault!42724)))))

(declare-fun b!1103152 () Bool)

(declare-fun tp_is_empty!27285 () Bool)

(assert (=> b!1103152 (= e!629690 tp_is_empty!27285)))

(declare-fun b!1103153 () Bool)

(assert (=> b!1103153 (= e!629692 (bvsgt #b00000000000000000000000000000000 (size!34940 _keys!1208)))))

(declare-fun b!1103154 () Bool)

(assert (=> b!1103154 (= e!629688 tp_is_empty!27285)))

(assert (= (and start!96966 res!735985) b!1103150))

(assert (= (and b!1103150 res!735982) b!1103148))

(assert (= (and b!1103148 res!735984) b!1103149))

(assert (= (and b!1103149 res!735983) b!1103153))

(assert (= (and b!1103151 condMapEmpty!42724) mapIsEmpty!42724))

(assert (= (and b!1103151 (not condMapEmpty!42724)) mapNonEmpty!42724))

(get-info :version)

(assert (= (and mapNonEmpty!42724 ((_ is ValueCellFull!12933) mapValue!42724)) b!1103152))

(assert (= (and b!1103151 ((_ is ValueCellFull!12933) mapDefault!42724)) b!1103154))

(assert (= start!96966 b!1103151))

(declare-fun m!1023439 () Bool)

(assert (=> b!1103149 m!1023439))

(declare-fun m!1023441 () Bool)

(assert (=> mapNonEmpty!42724 m!1023441))

(declare-fun m!1023443 () Bool)

(assert (=> start!96966 m!1023443))

(declare-fun m!1023445 () Bool)

(assert (=> start!96966 m!1023445))

(declare-fun m!1023447 () Bool)

(assert (=> b!1103150 m!1023447))

(check-sat (not b!1103150) (not mapNonEmpty!42724) tp_is_empty!27285 (not b!1103149) (not start!96966))
(check-sat)
