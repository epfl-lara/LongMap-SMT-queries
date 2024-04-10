; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97496 () Bool)

(assert start!97496)

(declare-fun b!1112910 () Bool)

(declare-fun res!742723 () Bool)

(declare-fun e!634467 () Bool)

(assert (=> b!1112910 (=> (not res!742723) (not e!634467))))

(declare-datatypes ((array!72363 0))(
  ( (array!72364 (arr!34834 (Array (_ BitVec 32) (_ BitVec 64))) (size!35370 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72363)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72363 (_ BitVec 32)) Bool)

(assert (=> b!1112910 (= res!742723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112911 () Bool)

(declare-fun e!634465 () Bool)

(assert (=> b!1112911 (= e!634467 e!634465)))

(declare-fun res!742729 () Bool)

(assert (=> b!1112911 (=> (not res!742729) (not e!634465))))

(declare-fun lt!496591 () array!72363)

(assert (=> b!1112911 (= res!742729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496591 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1112911 (= lt!496591 (array!72364 (store (arr!34834 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35370 _keys!1208)))))

(declare-fun b!1112912 () Bool)

(declare-fun e!634466 () Bool)

(declare-fun tp_is_empty!27727 () Bool)

(assert (=> b!1112912 (= e!634466 tp_is_empty!27727)))

(declare-fun mapNonEmpty!43408 () Bool)

(declare-fun mapRes!43408 () Bool)

(declare-fun tp!82652 () Bool)

(assert (=> mapNonEmpty!43408 (= mapRes!43408 (and tp!82652 e!634466))))

(declare-datatypes ((V!42097 0))(
  ( (V!42098 (val!13920 Int)) )
))
(declare-datatypes ((ValueCell!13154 0))(
  ( (ValueCellFull!13154 (v!16553 V!42097)) (EmptyCell!13154) )
))
(declare-fun mapValue!43408 () ValueCell!13154)

(declare-fun mapRest!43408 () (Array (_ BitVec 32) ValueCell!13154))

(declare-fun mapKey!43408 () (_ BitVec 32))

(declare-datatypes ((array!72365 0))(
  ( (array!72366 (arr!34835 (Array (_ BitVec 32) ValueCell!13154)) (size!35371 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72365)

(assert (=> mapNonEmpty!43408 (= (arr!34835 _values!996) (store mapRest!43408 mapKey!43408 mapValue!43408))))

(declare-fun b!1112913 () Bool)

(declare-fun e!634464 () Bool)

(assert (=> b!1112913 (= e!634464 tp_is_empty!27727)))

(declare-fun b!1112914 () Bool)

(declare-fun res!742730 () Bool)

(assert (=> b!1112914 (=> (not res!742730) (not e!634465))))

(declare-datatypes ((List!24300 0))(
  ( (Nil!24297) (Cons!24296 (h!25505 (_ BitVec 64)) (t!34781 List!24300)) )
))
(declare-fun arrayNoDuplicates!0 (array!72363 (_ BitVec 32) List!24300) Bool)

(assert (=> b!1112914 (= res!742730 (arrayNoDuplicates!0 lt!496591 #b00000000000000000000000000000000 Nil!24297))))

(declare-fun b!1112915 () Bool)

(declare-fun res!742726 () Bool)

(assert (=> b!1112915 (=> (not res!742726) (not e!634467))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1112915 (= res!742726 (= (select (arr!34834 _keys!1208) i!673) k!934))))

(declare-fun b!1112916 () Bool)

(declare-fun res!742732 () Bool)

(assert (=> b!1112916 (=> (not res!742732) (not e!634467))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112916 (= res!742732 (and (= (size!35371 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35370 _keys!1208) (size!35371 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112917 () Bool)

(declare-fun res!742725 () Bool)

(assert (=> b!1112917 (=> (not res!742725) (not e!634467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112917 (= res!742725 (validMask!0 mask!1564))))

(declare-fun b!1112918 () Bool)

(declare-fun res!742728 () Bool)

(assert (=> b!1112918 (=> (not res!742728) (not e!634467))))

(assert (=> b!1112918 (= res!742728 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35370 _keys!1208))))))

(declare-fun b!1112919 () Bool)

(declare-fun e!634463 () Bool)

(assert (=> b!1112919 (= e!634463 (and e!634464 mapRes!43408))))

(declare-fun condMapEmpty!43408 () Bool)

(declare-fun mapDefault!43408 () ValueCell!13154)

