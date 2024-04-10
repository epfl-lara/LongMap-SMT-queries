; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97700 () Bool)

(assert start!97700)

(declare-fun b!1116888 () Bool)

(declare-fun res!745789 () Bool)

(declare-fun e!636298 () Bool)

(assert (=> b!1116888 (=> (not res!745789) (not e!636298))))

(declare-datatypes ((array!72759 0))(
  ( (array!72760 (arr!35032 (Array (_ BitVec 32) (_ BitVec 64))) (size!35568 (_ BitVec 32))) )
))
(declare-fun lt!497204 () array!72759)

(declare-datatypes ((List!24378 0))(
  ( (Nil!24375) (Cons!24374 (h!25583 (_ BitVec 64)) (t!34859 List!24378)) )
))
(declare-fun arrayNoDuplicates!0 (array!72759 (_ BitVec 32) List!24378) Bool)

(assert (=> b!1116888 (= res!745789 (arrayNoDuplicates!0 lt!497204 #b00000000000000000000000000000000 Nil!24375))))

(declare-fun b!1116889 () Bool)

(declare-fun res!745783 () Bool)

(declare-fun e!636299 () Bool)

(assert (=> b!1116889 (=> (not res!745783) (not e!636299))))

(declare-fun _keys!1208 () array!72759)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42369 0))(
  ( (V!42370 (val!14022 Int)) )
))
(declare-datatypes ((ValueCell!13256 0))(
  ( (ValueCellFull!13256 (v!16655 V!42369)) (EmptyCell!13256) )
))
(declare-datatypes ((array!72761 0))(
  ( (array!72762 (arr!35033 (Array (_ BitVec 32) ValueCell!13256)) (size!35569 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72761)

(assert (=> b!1116889 (= res!745783 (and (= (size!35569 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35568 _keys!1208) (size!35569 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43714 () Bool)

(declare-fun mapRes!43714 () Bool)

(declare-fun tp!82958 () Bool)

(declare-fun e!636300 () Bool)

(assert (=> mapNonEmpty!43714 (= mapRes!43714 (and tp!82958 e!636300))))

(declare-fun mapKey!43714 () (_ BitVec 32))

(declare-fun mapRest!43714 () (Array (_ BitVec 32) ValueCell!13256))

(declare-fun mapValue!43714 () ValueCell!13256)

(assert (=> mapNonEmpty!43714 (= (arr!35033 _values!996) (store mapRest!43714 mapKey!43714 mapValue!43714))))

(declare-fun b!1116890 () Bool)

(declare-fun e!636303 () Bool)

(declare-fun e!636302 () Bool)

(assert (=> b!1116890 (= e!636303 (and e!636302 mapRes!43714))))

(declare-fun condMapEmpty!43714 () Bool)

(declare-fun mapDefault!43714 () ValueCell!13256)

