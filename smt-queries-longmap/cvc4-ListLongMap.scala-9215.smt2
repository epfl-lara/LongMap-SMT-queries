; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110642 () Bool)

(assert start!110642)

(declare-fun b_free!29477 () Bool)

(declare-fun b_next!29477 () Bool)

(assert (=> start!110642 (= b_free!29477 (not b_next!29477))))

(declare-fun tp!103753 () Bool)

(declare-fun b_and!47685 () Bool)

(assert (=> start!110642 (= tp!103753 b_and!47685)))

(declare-fun b!1309187 () Bool)

(declare-fun res!869085 () Bool)

(declare-fun e!746940 () Bool)

(assert (=> b!1309187 (=> (not res!869085) (not e!746940))))

(declare-datatypes ((array!87408 0))(
  ( (array!87409 (arr!42184 (Array (_ BitVec 32) (_ BitVec 64))) (size!42734 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87408)

(declare-datatypes ((V!52045 0))(
  ( (V!52046 (val!17678 Int)) )
))
(declare-datatypes ((ValueCell!16705 0))(
  ( (ValueCellFull!16705 (v!20305 V!52045)) (EmptyCell!16705) )
))
(declare-datatypes ((array!87410 0))(
  ( (array!87411 (arr!42185 (Array (_ BitVec 32) ValueCell!16705)) (size!42735 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87410)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1309187 (= res!869085 (and (= (size!42735 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42734 _keys!1628) (size!42735 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54439 () Bool)

(declare-fun mapRes!54439 () Bool)

(assert (=> mapIsEmpty!54439 mapRes!54439))

(declare-fun b!1309188 () Bool)

(assert (=> b!1309188 (= e!746940 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585234 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52045)

(declare-fun zeroValue!1296 () V!52045)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22762 0))(
  ( (tuple2!22763 (_1!11392 (_ BitVec 64)) (_2!11392 V!52045)) )
))
(declare-datatypes ((List!29905 0))(
  ( (Nil!29902) (Cons!29901 (h!31110 tuple2!22762) (t!43511 List!29905)) )
))
(declare-datatypes ((ListLongMap!20419 0))(
  ( (ListLongMap!20420 (toList!10225 List!29905)) )
))
(declare-fun contains!8375 (ListLongMap!20419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5238 (array!87408 array!87410 (_ BitVec 32) (_ BitVec 32) V!52045 V!52045 (_ BitVec 32) Int) ListLongMap!20419)

(assert (=> b!1309188 (= lt!585234 (contains!8375 (getCurrentListMap!5238 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309189 () Bool)

(declare-fun res!869088 () Bool)

(assert (=> b!1309189 (=> (not res!869088) (not e!746940))))

(assert (=> b!1309189 (= res!869088 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42734 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309190 () Bool)

(declare-fun e!746942 () Bool)

(declare-fun e!746941 () Bool)

(assert (=> b!1309190 (= e!746942 (and e!746941 mapRes!54439))))

(declare-fun condMapEmpty!54439 () Bool)

(declare-fun mapDefault!54439 () ValueCell!16705)

