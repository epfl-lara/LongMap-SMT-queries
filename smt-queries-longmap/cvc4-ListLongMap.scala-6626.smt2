; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83732 () Bool)

(assert start!83732)

(declare-fun b!977698 () Bool)

(declare-fun res!654309 () Bool)

(declare-fun e!551239 () Bool)

(assert (=> b!977698 (=> (not res!654309) (not e!551239))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35029 0))(
  ( (V!35030 (val!11318 Int)) )
))
(declare-datatypes ((ValueCell!10786 0))(
  ( (ValueCellFull!10786 (v!13880 V!35029)) (EmptyCell!10786) )
))
(declare-datatypes ((array!61097 0))(
  ( (array!61098 (arr!29406 (Array (_ BitVec 32) ValueCell!10786)) (size!29885 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61097)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61099 0))(
  ( (array!61100 (arr!29407 (Array (_ BitVec 32) (_ BitVec 64))) (size!29886 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61099)

(assert (=> b!977698 (= res!654309 (and (= (size!29885 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29886 _keys!1544) (size!29885 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977700 () Bool)

(declare-fun e!551238 () Bool)

(declare-fun e!551240 () Bool)

(declare-fun mapRes!35831 () Bool)

(assert (=> b!977700 (= e!551238 (and e!551240 mapRes!35831))))

(declare-fun condMapEmpty!35831 () Bool)

(declare-fun mapDefault!35831 () ValueCell!10786)

