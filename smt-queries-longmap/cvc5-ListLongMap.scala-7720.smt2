; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96984 () Bool)

(assert start!96984)

(declare-fun b!1103275 () Bool)

(declare-fun e!629781 () Bool)

(declare-datatypes ((List!24035 0))(
  ( (Nil!24032) (Cons!24031 (h!25240 (_ BitVec 64)) (t!34300 List!24035)) )
))
(declare-fun noDuplicate!1581 (List!24035) Bool)

(assert (=> b!1103275 (= e!629781 (not (noDuplicate!1581 Nil!24032)))))

(declare-fun b!1103276 () Bool)

(declare-fun res!736052 () Bool)

(assert (=> b!1103276 (=> (not res!736052) (not e!629781))))

(declare-datatypes ((array!71511 0))(
  ( (array!71512 (arr!34414 (Array (_ BitVec 32) (_ BitVec 64))) (size!34950 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71511)

(assert (=> b!1103276 (= res!736052 (and (bvsle #b00000000000000000000000000000000 (size!34950 _keys!1208)) (bvslt (size!34950 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103277 () Bool)

(declare-fun res!736053 () Bool)

(assert (=> b!1103277 (=> (not res!736053) (not e!629781))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103277 (= res!736053 (validMask!0 mask!1564))))

(declare-fun b!1103278 () Bool)

(declare-fun res!736050 () Bool)

(assert (=> b!1103278 (=> (not res!736050) (not e!629781))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41521 0))(
  ( (V!41522 (val!13704 Int)) )
))
(declare-datatypes ((ValueCell!12938 0))(
  ( (ValueCellFull!12938 (v!16335 V!41521)) (EmptyCell!12938) )
))
(declare-datatypes ((array!71513 0))(
  ( (array!71514 (arr!34415 (Array (_ BitVec 32) ValueCell!12938)) (size!34951 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71513)

(assert (=> b!1103278 (= res!736050 (and (= (size!34951 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34950 _keys!1208) (size!34951 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42742 () Bool)

(declare-fun mapRes!42742 () Bool)

(declare-fun tp!81662 () Bool)

(declare-fun e!629780 () Bool)

(assert (=> mapNonEmpty!42742 (= mapRes!42742 (and tp!81662 e!629780))))

(declare-fun mapRest!42742 () (Array (_ BitVec 32) ValueCell!12938))

(declare-fun mapValue!42742 () ValueCell!12938)

(declare-fun mapKey!42742 () (_ BitVec 32))

(assert (=> mapNonEmpty!42742 (= (arr!34415 _values!996) (store mapRest!42742 mapKey!42742 mapValue!42742))))

(declare-fun mapIsEmpty!42742 () Bool)

(assert (=> mapIsEmpty!42742 mapRes!42742))

(declare-fun b!1103279 () Bool)

(declare-fun tp_is_empty!27295 () Bool)

(assert (=> b!1103279 (= e!629780 tp_is_empty!27295)))

(declare-fun b!1103280 () Bool)

(declare-fun res!736054 () Bool)

(assert (=> b!1103280 (=> (not res!736054) (not e!629781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71511 (_ BitVec 32)) Bool)

(assert (=> b!1103280 (= res!736054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!736051 () Bool)

(assert (=> start!96984 (=> (not res!736051) (not e!629781))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96984 (= res!736051 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34950 _keys!1208))))))

(assert (=> start!96984 e!629781))

(declare-fun array_inv!26504 (array!71511) Bool)

(assert (=> start!96984 (array_inv!26504 _keys!1208)))

(assert (=> start!96984 true))

(declare-fun e!629782 () Bool)

(declare-fun array_inv!26505 (array!71513) Bool)

(assert (=> start!96984 (and (array_inv!26505 _values!996) e!629782)))

(declare-fun b!1103281 () Bool)

(declare-fun e!629779 () Bool)

(assert (=> b!1103281 (= e!629782 (and e!629779 mapRes!42742))))

(declare-fun condMapEmpty!42742 () Bool)

(declare-fun mapDefault!42742 () ValueCell!12938)

