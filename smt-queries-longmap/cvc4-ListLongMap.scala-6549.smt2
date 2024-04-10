; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83182 () Bool)

(assert start!83182)

(declare-fun b_free!19175 () Bool)

(declare-fun b_next!19175 () Bool)

(assert (=> start!83182 (= b_free!19175 (not b_next!19175))))

(declare-fun tp!66804 () Bool)

(declare-fun b_and!30663 () Bool)

(assert (=> start!83182 (= tp!66804 b_and!30663)))

(declare-fun mapIsEmpty!35119 () Bool)

(declare-fun mapRes!35119 () Bool)

(assert (=> mapIsEmpty!35119 mapRes!35119))

(declare-fun b!970466 () Bool)

(declare-fun e!547110 () Bool)

(declare-fun tp_is_empty!22073 () Bool)

(assert (=> b!970466 (= e!547110 tp_is_empty!22073)))

(declare-fun b!970467 () Bool)

(declare-fun res!649546 () Bool)

(declare-fun e!547111 () Bool)

(assert (=> b!970467 (=> (not res!649546) (not e!547111))))

(declare-datatypes ((array!60201 0))(
  ( (array!60202 (arr!28964 (Array (_ BitVec 32) (_ BitVec 64))) (size!29443 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60201)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970467 (= res!649546 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29443 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29443 _keys!1717))))))

(declare-fun b!970468 () Bool)

(declare-fun res!649550 () Bool)

(assert (=> b!970468 (=> (not res!649550) (not e!547111))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34413 0))(
  ( (V!34414 (val!11087 Int)) )
))
(declare-datatypes ((ValueCell!10555 0))(
  ( (ValueCellFull!10555 (v!13646 V!34413)) (EmptyCell!10555) )
))
(declare-datatypes ((array!60203 0))(
  ( (array!60204 (arr!28965 (Array (_ BitVec 32) ValueCell!10555)) (size!29444 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60203)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970468 (= res!649550 (and (= (size!29444 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29443 _keys!1717) (size!29444 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970470 () Bool)

(assert (=> b!970470 (= e!547111 false)))

(declare-fun zeroValue!1367 () V!34413)

(declare-fun defaultEntry!1428 () Int)

(declare-fun lt!431741 () Bool)

(declare-fun minValue!1367 () V!34413)

(declare-datatypes ((tuple2!14206 0))(
  ( (tuple2!14207 (_1!7114 (_ BitVec 64)) (_2!7114 V!34413)) )
))
(declare-datatypes ((List!20075 0))(
  ( (Nil!20072) (Cons!20071 (h!21233 tuple2!14206) (t!28438 List!20075)) )
))
(declare-datatypes ((ListLongMap!12903 0))(
  ( (ListLongMap!12904 (toList!6467 List!20075)) )
))
(declare-fun contains!5571 (ListLongMap!12903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3700 (array!60201 array!60203 (_ BitVec 32) (_ BitVec 32) V!34413 V!34413 (_ BitVec 32) Int) ListLongMap!12903)

(assert (=> b!970470 (= lt!431741 (contains!5571 (getCurrentListMap!3700 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28964 _keys!1717) i!822)))))

(declare-fun b!970471 () Bool)

(declare-fun res!649548 () Bool)

(assert (=> b!970471 (=> (not res!649548) (not e!547111))))

(declare-datatypes ((List!20076 0))(
  ( (Nil!20073) (Cons!20072 (h!21234 (_ BitVec 64)) (t!28439 List!20076)) )
))
(declare-fun arrayNoDuplicates!0 (array!60201 (_ BitVec 32) List!20076) Bool)

(assert (=> b!970471 (= res!649548 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20073))))

(declare-fun b!970472 () Bool)

(declare-fun e!547112 () Bool)

(declare-fun e!547114 () Bool)

(assert (=> b!970472 (= e!547112 (and e!547114 mapRes!35119))))

(declare-fun condMapEmpty!35119 () Bool)

(declare-fun mapDefault!35119 () ValueCell!10555)

