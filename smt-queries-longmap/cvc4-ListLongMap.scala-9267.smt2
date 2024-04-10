; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110954 () Bool)

(assert start!110954)

(declare-fun b_free!29789 () Bool)

(declare-fun b_next!29789 () Bool)

(assert (=> start!110954 (= b_free!29789 (not b_next!29789))))

(declare-fun tp!104689 () Bool)

(declare-fun b_and!47997 () Bool)

(assert (=> start!110954 (= tp!104689 b_and!47997)))

(declare-fun b!1313606 () Bool)

(declare-fun e!749281 () Bool)

(declare-fun tp_is_empty!35519 () Bool)

(assert (=> b!1313606 (= e!749281 tp_is_empty!35519)))

(declare-fun mapIsEmpty!54907 () Bool)

(declare-fun mapRes!54907 () Bool)

(assert (=> mapIsEmpty!54907 mapRes!54907))

(declare-fun b!1313607 () Bool)

(declare-fun e!749279 () Bool)

(assert (=> b!1313607 (= e!749279 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88016 0))(
  ( (array!88017 (arr!42488 (Array (_ BitVec 32) (_ BitVec 64))) (size!43038 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88016)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun lt!585693 () Bool)

(declare-datatypes ((V!52461 0))(
  ( (V!52462 (val!17834 Int)) )
))
(declare-fun minValue!1296 () V!52461)

(declare-datatypes ((ValueCell!16861 0))(
  ( (ValueCellFull!16861 (v!20461 V!52461)) (EmptyCell!16861) )
))
(declare-datatypes ((array!88018 0))(
  ( (array!88019 (arr!42489 (Array (_ BitVec 32) ValueCell!16861)) (size!43039 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88018)

(declare-fun zeroValue!1296 () V!52461)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22994 0))(
  ( (tuple2!22995 (_1!11508 (_ BitVec 64)) (_2!11508 V!52461)) )
))
(declare-datatypes ((List!30130 0))(
  ( (Nil!30127) (Cons!30126 (h!31335 tuple2!22994) (t!43736 List!30130)) )
))
(declare-datatypes ((ListLongMap!20651 0))(
  ( (ListLongMap!20652 (toList!10341 List!30130)) )
))
(declare-fun contains!8491 (ListLongMap!20651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5354 (array!88016 array!88018 (_ BitVec 32) (_ BitVec 32) V!52461 V!52461 (_ BitVec 32) Int) ListLongMap!20651)

(assert (=> b!1313607 (= lt!585693 (contains!8491 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313608 () Bool)

(declare-fun res!872102 () Bool)

(assert (=> b!1313608 (=> (not res!872102) (not e!749279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88016 (_ BitVec 32)) Bool)

(assert (=> b!1313608 (= res!872102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54907 () Bool)

(declare-fun tp!104688 () Bool)

(assert (=> mapNonEmpty!54907 (= mapRes!54907 (and tp!104688 e!749281))))

(declare-fun mapValue!54907 () ValueCell!16861)

(declare-fun mapKey!54907 () (_ BitVec 32))

(declare-fun mapRest!54907 () (Array (_ BitVec 32) ValueCell!16861))

(assert (=> mapNonEmpty!54907 (= (arr!42489 _values!1354) (store mapRest!54907 mapKey!54907 mapValue!54907))))

(declare-fun b!1313609 () Bool)

(declare-fun e!749282 () Bool)

(assert (=> b!1313609 (= e!749282 tp_is_empty!35519)))

(declare-fun b!1313611 () Bool)

(declare-fun res!872103 () Bool)

(assert (=> b!1313611 (=> (not res!872103) (not e!749279))))

(assert (=> b!1313611 (= res!872103 (and (= (size!43039 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43038 _keys!1628) (size!43039 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!872100 () Bool)

(assert (=> start!110954 (=> (not res!872100) (not e!749279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110954 (= res!872100 (validMask!0 mask!2040))))

(assert (=> start!110954 e!749279))

(assert (=> start!110954 tp!104689))

(declare-fun array_inv!32093 (array!88016) Bool)

(assert (=> start!110954 (array_inv!32093 _keys!1628)))

(assert (=> start!110954 true))

(assert (=> start!110954 tp_is_empty!35519))

(declare-fun e!749278 () Bool)

(declare-fun array_inv!32094 (array!88018) Bool)

(assert (=> start!110954 (and (array_inv!32094 _values!1354) e!749278)))

(declare-fun b!1313610 () Bool)

(declare-fun res!872099 () Bool)

(assert (=> b!1313610 (=> (not res!872099) (not e!749279))))

(declare-datatypes ((List!30131 0))(
  ( (Nil!30128) (Cons!30127 (h!31336 (_ BitVec 64)) (t!43737 List!30131)) )
))
(declare-fun arrayNoDuplicates!0 (array!88016 (_ BitVec 32) List!30131) Bool)

(assert (=> b!1313610 (= res!872099 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30128))))

(declare-fun b!1313612 () Bool)

(assert (=> b!1313612 (= e!749278 (and e!749282 mapRes!54907))))

(declare-fun condMapEmpty!54907 () Bool)

(declare-fun mapDefault!54907 () ValueCell!16861)

