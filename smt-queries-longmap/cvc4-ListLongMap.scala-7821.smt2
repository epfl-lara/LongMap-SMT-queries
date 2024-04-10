; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97674 () Bool)

(assert start!97674)

(declare-fun b!1116381 () Bool)

(declare-fun e!636066 () Bool)

(declare-fun e!636065 () Bool)

(assert (=> b!1116381 (= e!636066 e!636065)))

(declare-fun res!745396 () Bool)

(assert (=> b!1116381 (=> (not res!745396) (not e!636065))))

(declare-datatypes ((array!72707 0))(
  ( (array!72708 (arr!35006 (Array (_ BitVec 32) (_ BitVec 64))) (size!35542 (_ BitVec 32))) )
))
(declare-fun lt!497125 () array!72707)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72707 (_ BitVec 32)) Bool)

(assert (=> b!1116381 (= res!745396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497125 mask!1564))))

(declare-fun _keys!1208 () array!72707)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116381 (= lt!497125 (array!72708 (store (arr!35006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35542 _keys!1208)))))

(declare-fun b!1116382 () Bool)

(declare-fun res!745395 () Bool)

(assert (=> b!1116382 (=> (not res!745395) (not e!636066))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1116382 (= res!745395 (= (select (arr!35006 _keys!1208) i!673) k!934))))

(declare-fun b!1116383 () Bool)

(declare-fun res!745393 () Bool)

(assert (=> b!1116383 (=> (not res!745393) (not e!636066))))

(assert (=> b!1116383 (= res!745393 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35542 _keys!1208))))))

(declare-fun mapIsEmpty!43675 () Bool)

(declare-fun mapRes!43675 () Bool)

(assert (=> mapIsEmpty!43675 mapRes!43675))

(declare-fun b!1116384 () Bool)

(declare-fun res!745397 () Bool)

(assert (=> b!1116384 (=> (not res!745397) (not e!636065))))

(declare-datatypes ((List!24366 0))(
  ( (Nil!24363) (Cons!24362 (h!25571 (_ BitVec 64)) (t!34847 List!24366)) )
))
(declare-fun arrayNoDuplicates!0 (array!72707 (_ BitVec 32) List!24366) Bool)

(assert (=> b!1116384 (= res!745397 (arrayNoDuplicates!0 lt!497125 #b00000000000000000000000000000000 Nil!24363))))

(declare-fun b!1116385 () Bool)

(declare-fun res!745401 () Bool)

(assert (=> b!1116385 (=> (not res!745401) (not e!636066))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42333 0))(
  ( (V!42334 (val!14009 Int)) )
))
(declare-datatypes ((ValueCell!13243 0))(
  ( (ValueCellFull!13243 (v!16642 V!42333)) (EmptyCell!13243) )
))
(declare-datatypes ((array!72709 0))(
  ( (array!72710 (arr!35007 (Array (_ BitVec 32) ValueCell!13243)) (size!35543 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72709)

(assert (=> b!1116385 (= res!745401 (and (= (size!35543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35542 _keys!1208) (size!35543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!745402 () Bool)

(assert (=> start!97674 (=> (not res!745402) (not e!636066))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97674 (= res!745402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35542 _keys!1208))))))

(assert (=> start!97674 e!636066))

(declare-fun array_inv!26904 (array!72707) Bool)

(assert (=> start!97674 (array_inv!26904 _keys!1208)))

(assert (=> start!97674 true))

(declare-fun e!636067 () Bool)

(declare-fun array_inv!26905 (array!72709) Bool)

(assert (=> start!97674 (and (array_inv!26905 _values!996) e!636067)))

(declare-fun b!1116386 () Bool)

(declare-fun e!636068 () Bool)

(declare-fun tp_is_empty!27905 () Bool)

(assert (=> b!1116386 (= e!636068 tp_is_empty!27905)))

(declare-fun b!1116387 () Bool)

(declare-fun e!636069 () Bool)

(assert (=> b!1116387 (= e!636067 (and e!636069 mapRes!43675))))

(declare-fun condMapEmpty!43675 () Bool)

(declare-fun mapDefault!43675 () ValueCell!13243)

