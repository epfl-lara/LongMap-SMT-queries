; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97680 () Bool)

(assert start!97680)

(declare-fun b!1116498 () Bool)

(declare-fun res!745491 () Bool)

(declare-fun e!636121 () Bool)

(assert (=> b!1116498 (=> (not res!745491) (not e!636121))))

(declare-datatypes ((array!72719 0))(
  ( (array!72720 (arr!35012 (Array (_ BitVec 32) (_ BitVec 64))) (size!35548 (_ BitVec 32))) )
))
(declare-fun lt!497143 () array!72719)

(declare-datatypes ((List!24369 0))(
  ( (Nil!24366) (Cons!24365 (h!25574 (_ BitVec 64)) (t!34850 List!24369)) )
))
(declare-fun arrayNoDuplicates!0 (array!72719 (_ BitVec 32) List!24369) Bool)

(assert (=> b!1116498 (= res!745491 (arrayNoDuplicates!0 lt!497143 #b00000000000000000000000000000000 Nil!24366))))

(declare-fun b!1116499 () Bool)

(declare-fun e!636123 () Bool)

(declare-fun tp_is_empty!27911 () Bool)

(assert (=> b!1116499 (= e!636123 tp_is_empty!27911)))

(declare-fun b!1116500 () Bool)

(declare-fun res!745490 () Bool)

(declare-fun e!636118 () Bool)

(assert (=> b!1116500 (=> (not res!745490) (not e!636118))))

(declare-fun _keys!1208 () array!72719)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116500 (= res!745490 (= (select (arr!35012 _keys!1208) i!673) k!934))))

(declare-fun b!1116501 () Bool)

(declare-fun res!745484 () Bool)

(assert (=> b!1116501 (=> (not res!745484) (not e!636118))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72719 (_ BitVec 32)) Bool)

(assert (=> b!1116501 (= res!745484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116502 () Bool)

(declare-fun res!745486 () Bool)

(assert (=> b!1116502 (=> (not res!745486) (not e!636118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116502 (= res!745486 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43684 () Bool)

(declare-fun mapRes!43684 () Bool)

(assert (=> mapIsEmpty!43684 mapRes!43684))

(declare-fun b!1116503 () Bool)

(declare-fun res!745487 () Bool)

(assert (=> b!1116503 (=> (not res!745487) (not e!636118))))

(assert (=> b!1116503 (= res!745487 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35548 _keys!1208))))))

(declare-fun b!1116505 () Bool)

(declare-fun res!745489 () Bool)

(assert (=> b!1116505 (=> (not res!745489) (not e!636118))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42341 0))(
  ( (V!42342 (val!14012 Int)) )
))
(declare-datatypes ((ValueCell!13246 0))(
  ( (ValueCellFull!13246 (v!16645 V!42341)) (EmptyCell!13246) )
))
(declare-datatypes ((array!72721 0))(
  ( (array!72722 (arr!35013 (Array (_ BitVec 32) ValueCell!13246)) (size!35549 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72721)

(assert (=> b!1116505 (= res!745489 (and (= (size!35549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35548 _keys!1208) (size!35549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116506 () Bool)

(declare-fun e!636119 () Bool)

(declare-fun e!636122 () Bool)

(assert (=> b!1116506 (= e!636119 (and e!636122 mapRes!43684))))

(declare-fun condMapEmpty!43684 () Bool)

(declare-fun mapDefault!43684 () ValueCell!13246)

