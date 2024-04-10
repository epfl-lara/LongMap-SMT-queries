; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83968 () Bool)

(assert start!83968)

(declare-fun b!981229 () Bool)

(declare-fun e!553172 () Bool)

(declare-fun tp_is_empty!22771 () Bool)

(assert (=> b!981229 (= e!553172 tp_is_empty!22771)))

(declare-fun b!981230 () Bool)

(declare-fun res!656613 () Bool)

(declare-fun e!553169 () Bool)

(assert (=> b!981230 (=> (not res!656613) (not e!553169))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35345 0))(
  ( (V!35346 (val!11436 Int)) )
))
(declare-datatypes ((ValueCell!10904 0))(
  ( (ValueCellFull!10904 (v!13998 V!35345)) (EmptyCell!10904) )
))
(declare-datatypes ((array!61539 0))(
  ( (array!61540 (arr!29627 (Array (_ BitVec 32) ValueCell!10904)) (size!30106 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61539)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61541 0))(
  ( (array!61542 (arr!29628 (Array (_ BitVec 32) (_ BitVec 64))) (size!30107 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61541)

(assert (=> b!981230 (= res!656613 (and (= (size!30106 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30107 _keys!1544) (size!30106 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981231 () Bool)

(declare-fun res!656615 () Bool)

(assert (=> b!981231 (=> (not res!656615) (not e!553169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61541 (_ BitVec 32)) Bool)

(assert (=> b!981231 (= res!656615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981232 () Bool)

(declare-fun res!656611 () Bool)

(assert (=> b!981232 (=> (not res!656611) (not e!553169))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981232 (= res!656611 (validKeyInArray!0 (select (arr!29628 _keys!1544) from!1932)))))

(declare-fun b!981233 () Bool)

(declare-fun res!656610 () Bool)

(assert (=> b!981233 (=> (not res!656610) (not e!553169))))

(declare-datatypes ((List!20521 0))(
  ( (Nil!20518) (Cons!20517 (h!21679 (_ BitVec 64)) (t!29204 List!20521)) )
))
(declare-fun arrayNoDuplicates!0 (array!61541 (_ BitVec 32) List!20521) Bool)

(assert (=> b!981233 (= res!656610 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20518))))

(declare-fun b!981234 () Bool)

(declare-fun e!553170 () Bool)

(assert (=> b!981234 (= e!553170 tp_is_empty!22771)))

(declare-fun b!981235 () Bool)

(declare-fun res!656612 () Bool)

(assert (=> b!981235 (=> (not res!656612) (not e!553169))))

(assert (=> b!981235 (= res!656612 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30107 _keys!1544))))))

(declare-fun mapIsEmpty!36185 () Bool)

(declare-fun mapRes!36185 () Bool)

(assert (=> mapIsEmpty!36185 mapRes!36185))

(declare-fun b!981237 () Bool)

(declare-fun e!553171 () Bool)

(assert (=> b!981237 (= e!553171 (and e!553170 mapRes!36185))))

(declare-fun condMapEmpty!36185 () Bool)

(declare-fun mapDefault!36185 () ValueCell!10904)

