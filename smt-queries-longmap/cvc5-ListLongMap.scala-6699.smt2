; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84166 () Bool)

(assert start!84166)

(declare-fun b_free!19867 () Bool)

(declare-fun b_next!19867 () Bool)

(assert (=> start!84166 (= b_free!19867 (not b_next!19867))))

(declare-fun tp!69204 () Bool)

(declare-fun b_and!31811 () Bool)

(assert (=> start!84166 (= tp!69204 b_and!31811)))

(declare-fun b!984212 () Bool)

(declare-fun res!658580 () Bool)

(declare-fun e!554846 () Bool)

(assert (=> b!984212 (=> (not res!658580) (not e!554846))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35609 0))(
  ( (V!35610 (val!11535 Int)) )
))
(declare-datatypes ((ValueCell!11003 0))(
  ( (ValueCellFull!11003 (v!14097 V!35609)) (EmptyCell!11003) )
))
(declare-datatypes ((array!61919 0))(
  ( (array!61920 (arr!29817 (Array (_ BitVec 32) ValueCell!11003)) (size!30296 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61919)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61921 0))(
  ( (array!61922 (arr!29818 (Array (_ BitVec 32) (_ BitVec 64))) (size!30297 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61921)

(assert (=> b!984212 (= res!658580 (and (= (size!30296 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30297 _keys!1544) (size!30296 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984213 () Bool)

(declare-fun res!658581 () Bool)

(assert (=> b!984213 (=> (not res!658581) (not e!554846))))

(declare-datatypes ((List!20642 0))(
  ( (Nil!20639) (Cons!20638 (h!21800 (_ BitVec 64)) (t!29453 List!20642)) )
))
(declare-fun arrayNoDuplicates!0 (array!61921 (_ BitVec 32) List!20642) Bool)

(assert (=> b!984213 (= res!658581 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20639))))

(declare-fun b!984214 () Bool)

(declare-fun res!658582 () Bool)

(assert (=> b!984214 (=> (not res!658582) (not e!554846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61921 (_ BitVec 32)) Bool)

(assert (=> b!984214 (= res!658582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36482 () Bool)

(declare-fun mapRes!36482 () Bool)

(declare-fun tp!69205 () Bool)

(declare-fun e!554847 () Bool)

(assert (=> mapNonEmpty!36482 (= mapRes!36482 (and tp!69205 e!554847))))

(declare-fun mapKey!36482 () (_ BitVec 32))

(declare-fun mapRest!36482 () (Array (_ BitVec 32) ValueCell!11003))

(declare-fun mapValue!36482 () ValueCell!11003)

(assert (=> mapNonEmpty!36482 (= (arr!29817 _values!1278) (store mapRest!36482 mapKey!36482 mapValue!36482))))

(declare-fun mapIsEmpty!36482 () Bool)

(assert (=> mapIsEmpty!36482 mapRes!36482))

(declare-fun b!984215 () Bool)

(declare-fun e!554848 () Bool)

(declare-fun e!554849 () Bool)

(assert (=> b!984215 (= e!554848 (and e!554849 mapRes!36482))))

(declare-fun condMapEmpty!36482 () Bool)

(declare-fun mapDefault!36482 () ValueCell!11003)

