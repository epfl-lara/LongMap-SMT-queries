; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110546 () Bool)

(assert start!110546)

(declare-fun b_free!29381 () Bool)

(declare-fun b_next!29381 () Bool)

(assert (=> start!110546 (= b_free!29381 (not b_next!29381))))

(declare-fun tp!103465 () Bool)

(declare-fun b_and!47589 () Bool)

(assert (=> start!110546 (= tp!103465 b_and!47589)))

(declare-fun b!1307711 () Bool)

(declare-fun e!746220 () Bool)

(assert (=> b!1307711 (= e!746220 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87222 0))(
  ( (array!87223 (arr!42091 (Array (_ BitVec 32) (_ BitVec 64))) (size!42641 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87222)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51917 0))(
  ( (V!51918 (val!17630 Int)) )
))
(declare-fun minValue!1296 () V!51917)

(declare-fun zeroValue!1296 () V!51917)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16657 0))(
  ( (ValueCellFull!16657 (v!20257 V!51917)) (EmptyCell!16657) )
))
(declare-datatypes ((array!87224 0))(
  ( (array!87225 (arr!42092 (Array (_ BitVec 32) ValueCell!16657)) (size!42642 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87224)

(declare-fun lt!585090 () Bool)

(declare-datatypes ((tuple2!22694 0))(
  ( (tuple2!22695 (_1!11358 (_ BitVec 64)) (_2!11358 V!51917)) )
))
(declare-datatypes ((List!29837 0))(
  ( (Nil!29834) (Cons!29833 (h!31042 tuple2!22694) (t!43443 List!29837)) )
))
(declare-datatypes ((ListLongMap!20351 0))(
  ( (ListLongMap!20352 (toList!10191 List!29837)) )
))
(declare-fun contains!8341 (ListLongMap!20351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5204 (array!87222 array!87224 (_ BitVec 32) (_ BitVec 32) V!51917 V!51917 (_ BitVec 32) Int) ListLongMap!20351)

(assert (=> b!1307711 (= lt!585090 (contains!8341 (getCurrentListMap!5204 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307712 () Bool)

(declare-fun res!868041 () Bool)

(assert (=> b!1307712 (=> (not res!868041) (not e!746220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87222 (_ BitVec 32)) Bool)

(assert (=> b!1307712 (= res!868041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307713 () Bool)

(declare-fun e!746221 () Bool)

(declare-fun tp_is_empty!35111 () Bool)

(assert (=> b!1307713 (= e!746221 tp_is_empty!35111)))

(declare-fun mapIsEmpty!54295 () Bool)

(declare-fun mapRes!54295 () Bool)

(assert (=> mapIsEmpty!54295 mapRes!54295))

(declare-fun b!1307714 () Bool)

(declare-fun e!746222 () Bool)

(assert (=> b!1307714 (= e!746222 tp_is_empty!35111)))

(declare-fun b!1307716 () Bool)

(declare-fun res!868043 () Bool)

(assert (=> b!1307716 (=> (not res!868043) (not e!746220))))

(assert (=> b!1307716 (= res!868043 (and (= (size!42642 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42641 _keys!1628) (size!42642 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307717 () Bool)

(declare-fun e!746219 () Bool)

(assert (=> b!1307717 (= e!746219 (and e!746221 mapRes!54295))))

(declare-fun condMapEmpty!54295 () Bool)

(declare-fun mapDefault!54295 () ValueCell!16657)

