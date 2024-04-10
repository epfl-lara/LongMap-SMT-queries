; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111016 () Bool)

(assert start!111016)

(declare-fun b_free!29851 () Bool)

(declare-fun b_next!29851 () Bool)

(assert (=> start!111016 (= b_free!29851 (not b_next!29851))))

(declare-fun tp!104874 () Bool)

(declare-fun b_and!48059 () Bool)

(assert (=> start!111016 (= tp!104874 b_and!48059)))

(declare-fun mapIsEmpty!55000 () Bool)

(declare-fun mapRes!55000 () Bool)

(assert (=> mapIsEmpty!55000 mapRes!55000))

(declare-fun b!1314386 () Bool)

(declare-fun res!872603 () Bool)

(declare-fun e!749743 () Bool)

(assert (=> b!1314386 (=> (not res!872603) (not e!749743))))

(declare-datatypes ((array!88132 0))(
  ( (array!88133 (arr!42546 (Array (_ BitVec 32) (_ BitVec 64))) (size!43096 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88132)

(declare-datatypes ((List!30172 0))(
  ( (Nil!30169) (Cons!30168 (h!31377 (_ BitVec 64)) (t!43778 List!30172)) )
))
(declare-fun arrayNoDuplicates!0 (array!88132 (_ BitVec 32) List!30172) Bool)

(assert (=> b!1314386 (= res!872603 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30169))))

(declare-fun b!1314387 () Bool)

(assert (=> b!1314387 (= e!749743 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52545 0))(
  ( (V!52546 (val!17865 Int)) )
))
(declare-fun minValue!1296 () V!52545)

(declare-datatypes ((ValueCell!16892 0))(
  ( (ValueCellFull!16892 (v!20492 V!52545)) (EmptyCell!16892) )
))
(declare-datatypes ((array!88134 0))(
  ( (array!88135 (arr!42547 (Array (_ BitVec 32) ValueCell!16892)) (size!43097 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88134)

(declare-fun zeroValue!1296 () V!52545)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585786 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23036 0))(
  ( (tuple2!23037 (_1!11529 (_ BitVec 64)) (_2!11529 V!52545)) )
))
(declare-datatypes ((List!30173 0))(
  ( (Nil!30170) (Cons!30169 (h!31378 tuple2!23036) (t!43779 List!30173)) )
))
(declare-datatypes ((ListLongMap!20693 0))(
  ( (ListLongMap!20694 (toList!10362 List!30173)) )
))
(declare-fun contains!8512 (ListLongMap!20693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5375 (array!88132 array!88134 (_ BitVec 32) (_ BitVec 32) V!52545 V!52545 (_ BitVec 32) Int) ListLongMap!20693)

(assert (=> b!1314387 (= lt!585786 (contains!8512 (getCurrentListMap!5375 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314388 () Bool)

(declare-fun res!872602 () Bool)

(assert (=> b!1314388 (=> (not res!872602) (not e!749743))))

(assert (=> b!1314388 (= res!872602 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43096 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314389 () Bool)

(declare-fun e!749744 () Bool)

(declare-fun tp_is_empty!35581 () Bool)

(assert (=> b!1314389 (= e!749744 tp_is_empty!35581)))

(declare-fun b!1314390 () Bool)

(declare-fun res!872604 () Bool)

(assert (=> b!1314390 (=> (not res!872604) (not e!749743))))

(assert (=> b!1314390 (= res!872604 (and (= (size!43097 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43096 _keys!1628) (size!43097 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314391 () Bool)

(declare-fun e!749746 () Bool)

(assert (=> b!1314391 (= e!749746 tp_is_empty!35581)))

(declare-fun b!1314392 () Bool)

(declare-fun res!872600 () Bool)

(assert (=> b!1314392 (=> (not res!872600) (not e!749743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88132 (_ BitVec 32)) Bool)

(assert (=> b!1314392 (= res!872600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314393 () Bool)

(declare-fun e!749745 () Bool)

(assert (=> b!1314393 (= e!749745 (and e!749746 mapRes!55000))))

(declare-fun condMapEmpty!55000 () Bool)

(declare-fun mapDefault!55000 () ValueCell!16892)

