; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83172 () Bool)

(assert start!83172)

(declare-fun b_free!19165 () Bool)

(declare-fun b_next!19165 () Bool)

(assert (=> start!83172 (= b_free!19165 (not b_next!19165))))

(declare-fun tp!66773 () Bool)

(declare-fun b_and!30653 () Bool)

(assert (=> start!83172 (= tp!66773 b_and!30653)))

(declare-fun b!970331 () Bool)

(declare-fun res!649457 () Bool)

(declare-fun e!547037 () Bool)

(assert (=> b!970331 (=> (not res!649457) (not e!547037))))

(declare-datatypes ((array!60185 0))(
  ( (array!60186 (arr!28956 (Array (_ BitVec 32) (_ BitVec 64))) (size!29435 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60185)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970331 (= res!649457 (validKeyInArray!0 (select (arr!28956 _keys!1717) i!822)))))

(declare-fun b!970332 () Bool)

(assert (=> b!970332 (= e!547037 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34401 0))(
  ( (V!34402 (val!11082 Int)) )
))
(declare-datatypes ((ValueCell!10550 0))(
  ( (ValueCellFull!10550 (v!13641 V!34401)) (EmptyCell!10550) )
))
(declare-datatypes ((array!60187 0))(
  ( (array!60188 (arr!28957 (Array (_ BitVec 32) ValueCell!10550)) (size!29436 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60187)

(declare-fun lt!431726 () Bool)

(declare-fun zeroValue!1367 () V!34401)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34401)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14200 0))(
  ( (tuple2!14201 (_1!7111 (_ BitVec 64)) (_2!7111 V!34401)) )
))
(declare-datatypes ((List!20070 0))(
  ( (Nil!20067) (Cons!20066 (h!21228 tuple2!14200) (t!28433 List!20070)) )
))
(declare-datatypes ((ListLongMap!12897 0))(
  ( (ListLongMap!12898 (toList!6464 List!20070)) )
))
(declare-fun contains!5568 (ListLongMap!12897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3697 (array!60185 array!60187 (_ BitVec 32) (_ BitVec 32) V!34401 V!34401 (_ BitVec 32) Int) ListLongMap!12897)

(assert (=> b!970332 (= lt!431726 (contains!5568 (getCurrentListMap!3697 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28956 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35104 () Bool)

(declare-fun mapRes!35104 () Bool)

(assert (=> mapIsEmpty!35104 mapRes!35104))

(declare-fun b!970333 () Bool)

(declare-fun res!649459 () Bool)

(assert (=> b!970333 (=> (not res!649459) (not e!547037))))

(assert (=> b!970333 (= res!649459 (and (= (size!29436 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29435 _keys!1717) (size!29436 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970334 () Bool)

(declare-fun e!547039 () Bool)

(declare-fun e!547035 () Bool)

(assert (=> b!970334 (= e!547039 (and e!547035 mapRes!35104))))

(declare-fun condMapEmpty!35104 () Bool)

(declare-fun mapDefault!35104 () ValueCell!10550)

