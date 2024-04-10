; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83200 () Bool)

(assert start!83200)

(declare-fun b_free!19193 () Bool)

(declare-fun b_next!19193 () Bool)

(assert (=> start!83200 (= b_free!19193 (not b_next!19193))))

(declare-fun tp!66858 () Bool)

(declare-fun b_and!30681 () Bool)

(assert (=> start!83200 (= tp!66858 b_and!30681)))

(declare-fun b!970709 () Bool)

(declare-fun e!547247 () Bool)

(declare-fun tp_is_empty!22091 () Bool)

(assert (=> b!970709 (= e!547247 tp_is_empty!22091)))

(declare-fun b!970710 () Bool)

(declare-fun res!649708 () Bool)

(declare-fun e!547245 () Bool)

(assert (=> b!970710 (=> (not res!649708) (not e!547245))))

(declare-datatypes ((array!60237 0))(
  ( (array!60238 (arr!28982 (Array (_ BitVec 32) (_ BitVec 64))) (size!29461 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60237)

(declare-datatypes ((List!20090 0))(
  ( (Nil!20087) (Cons!20086 (h!21248 (_ BitVec 64)) (t!28453 List!20090)) )
))
(declare-fun arrayNoDuplicates!0 (array!60237 (_ BitVec 32) List!20090) Bool)

(assert (=> b!970710 (= res!649708 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20087))))

(declare-fun b!970711 () Bool)

(declare-fun res!649710 () Bool)

(assert (=> b!970711 (=> (not res!649710) (not e!547245))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60237 (_ BitVec 32)) Bool)

(assert (=> b!970711 (= res!649710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970712 () Bool)

(declare-fun e!547248 () Bool)

(declare-fun mapRes!35146 () Bool)

(assert (=> b!970712 (= e!547248 (and e!547247 mapRes!35146))))

(declare-fun condMapEmpty!35146 () Bool)

(declare-datatypes ((V!34437 0))(
  ( (V!34438 (val!11096 Int)) )
))
(declare-datatypes ((ValueCell!10564 0))(
  ( (ValueCellFull!10564 (v!13655 V!34437)) (EmptyCell!10564) )
))
(declare-datatypes ((array!60239 0))(
  ( (array!60240 (arr!28983 (Array (_ BitVec 32) ValueCell!10564)) (size!29462 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60239)

(declare-fun mapDefault!35146 () ValueCell!10564)

