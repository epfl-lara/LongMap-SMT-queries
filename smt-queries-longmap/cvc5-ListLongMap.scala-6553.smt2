; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83202 () Bool)

(assert start!83202)

(declare-fun b_free!19195 () Bool)

(declare-fun b_next!19195 () Bool)

(assert (=> start!83202 (= b_free!19195 (not b_next!19195))))

(declare-fun tp!66864 () Bool)

(declare-fun b_and!30683 () Bool)

(assert (=> start!83202 (= tp!66864 b_and!30683)))

(declare-fun b!970736 () Bool)

(declare-fun res!649729 () Bool)

(declare-fun e!547263 () Bool)

(assert (=> b!970736 (=> (not res!649729) (not e!547263))))

(declare-datatypes ((array!60241 0))(
  ( (array!60242 (arr!28984 (Array (_ BitVec 32) (_ BitVec 64))) (size!29463 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60241)

(declare-datatypes ((List!20091 0))(
  ( (Nil!20088) (Cons!20087 (h!21249 (_ BitVec 64)) (t!28454 List!20091)) )
))
(declare-fun arrayNoDuplicates!0 (array!60241 (_ BitVec 32) List!20091) Bool)

(assert (=> b!970736 (= res!649729 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20088))))

(declare-fun b!970737 () Bool)

(declare-fun res!649728 () Bool)

(assert (=> b!970737 (=> (not res!649728) (not e!547263))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60241 (_ BitVec 32)) Bool)

(assert (=> b!970737 (= res!649728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970738 () Bool)

(declare-fun e!547261 () Bool)

(declare-fun tp_is_empty!22093 () Bool)

(assert (=> b!970738 (= e!547261 tp_is_empty!22093)))

(declare-fun mapNonEmpty!35149 () Bool)

(declare-fun mapRes!35149 () Bool)

(declare-fun tp!66863 () Bool)

(declare-fun e!547260 () Bool)

(assert (=> mapNonEmpty!35149 (= mapRes!35149 (and tp!66863 e!547260))))

(declare-datatypes ((V!34441 0))(
  ( (V!34442 (val!11097 Int)) )
))
(declare-datatypes ((ValueCell!10565 0))(
  ( (ValueCellFull!10565 (v!13656 V!34441)) (EmptyCell!10565) )
))
(declare-datatypes ((array!60243 0))(
  ( (array!60244 (arr!28985 (Array (_ BitVec 32) ValueCell!10565)) (size!29464 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60243)

(declare-fun mapKey!35149 () (_ BitVec 32))

(declare-fun mapRest!35149 () (Array (_ BitVec 32) ValueCell!10565))

(declare-fun mapValue!35149 () ValueCell!10565)

(assert (=> mapNonEmpty!35149 (= (arr!28985 _values!1425) (store mapRest!35149 mapKey!35149 mapValue!35149))))

(declare-fun b!970739 () Bool)

(declare-fun e!547264 () Bool)

(assert (=> b!970739 (= e!547264 (and e!547261 mapRes!35149))))

(declare-fun condMapEmpty!35149 () Bool)

(declare-fun mapDefault!35149 () ValueCell!10565)

