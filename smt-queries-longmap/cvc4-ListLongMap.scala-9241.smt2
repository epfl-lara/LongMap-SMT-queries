; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110798 () Bool)

(assert start!110798)

(declare-fun b_free!29633 () Bool)

(declare-fun b_next!29633 () Bool)

(assert (=> start!110798 (= b_free!29633 (not b_next!29633))))

(declare-fun tp!104221 () Bool)

(declare-fun b_and!47841 () Bool)

(assert (=> start!110798 (= tp!104221 b_and!47841)))

(declare-fun b!1311383 () Bool)

(declare-fun e!748110 () Bool)

(assert (=> b!1311383 (= e!748110 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87714 0))(
  ( (array!87715 (arr!42337 (Array (_ BitVec 32) (_ BitVec 64))) (size!42887 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87714)

(declare-fun lt!585468 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52253 0))(
  ( (V!52254 (val!17756 Int)) )
))
(declare-fun minValue!1296 () V!52253)

(declare-datatypes ((ValueCell!16783 0))(
  ( (ValueCellFull!16783 (v!20383 V!52253)) (EmptyCell!16783) )
))
(declare-datatypes ((array!87716 0))(
  ( (array!87717 (arr!42338 (Array (_ BitVec 32) ValueCell!16783)) (size!42888 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87716)

(declare-fun zeroValue!1296 () V!52253)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22882 0))(
  ( (tuple2!22883 (_1!11452 (_ BitVec 64)) (_2!11452 V!52253)) )
))
(declare-datatypes ((List!30023 0))(
  ( (Nil!30020) (Cons!30019 (h!31228 tuple2!22882) (t!43629 List!30023)) )
))
(declare-datatypes ((ListLongMap!20539 0))(
  ( (ListLongMap!20540 (toList!10285 List!30023)) )
))
(declare-fun contains!8435 (ListLongMap!20539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5298 (array!87714 array!87716 (_ BitVec 32) (_ BitVec 32) V!52253 V!52253 (_ BitVec 32) Int) ListLongMap!20539)

(assert (=> b!1311383 (= lt!585468 (contains!8435 (getCurrentListMap!5298 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54673 () Bool)

(declare-fun mapRes!54673 () Bool)

(declare-fun tp!104220 () Bool)

(declare-fun e!748109 () Bool)

(assert (=> mapNonEmpty!54673 (= mapRes!54673 (and tp!104220 e!748109))))

(declare-fun mapValue!54673 () ValueCell!16783)

(declare-fun mapRest!54673 () (Array (_ BitVec 32) ValueCell!16783))

(declare-fun mapKey!54673 () (_ BitVec 32))

(assert (=> mapNonEmpty!54673 (= (arr!42338 _values!1354) (store mapRest!54673 mapKey!54673 mapValue!54673))))

(declare-fun b!1311384 () Bool)

(declare-fun tp_is_empty!35363 () Bool)

(assert (=> b!1311384 (= e!748109 tp_is_empty!35363)))

(declare-fun b!1311385 () Bool)

(declare-fun res!870579 () Bool)

(assert (=> b!1311385 (=> (not res!870579) (not e!748110))))

(declare-datatypes ((List!30024 0))(
  ( (Nil!30021) (Cons!30020 (h!31229 (_ BitVec 64)) (t!43630 List!30024)) )
))
(declare-fun arrayNoDuplicates!0 (array!87714 (_ BitVec 32) List!30024) Bool)

(assert (=> b!1311385 (= res!870579 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30021))))

(declare-fun mapIsEmpty!54673 () Bool)

(assert (=> mapIsEmpty!54673 mapRes!54673))

(declare-fun b!1311386 () Bool)

(declare-fun res!870580 () Bool)

(assert (=> b!1311386 (=> (not res!870580) (not e!748110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87714 (_ BitVec 32)) Bool)

(assert (=> b!1311386 (= res!870580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311387 () Bool)

(declare-fun e!748112 () Bool)

(declare-fun e!748111 () Bool)

(assert (=> b!1311387 (= e!748112 (and e!748111 mapRes!54673))))

(declare-fun condMapEmpty!54673 () Bool)

(declare-fun mapDefault!54673 () ValueCell!16783)

