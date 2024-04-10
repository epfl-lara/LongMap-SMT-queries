; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83230 () Bool)

(assert start!83230)

(declare-fun b_free!19223 () Bool)

(declare-fun b_next!19223 () Bool)

(assert (=> start!83230 (= b_free!19223 (not b_next!19223))))

(declare-fun tp!66947 () Bool)

(declare-fun b_and!30711 () Bool)

(assert (=> start!83230 (= tp!66947 b_and!30711)))

(declare-fun b!971149 () Bool)

(declare-fun res!650016 () Bool)

(declare-fun e!547472 () Bool)

(assert (=> b!971149 (=> (not res!650016) (not e!547472))))

(declare-datatypes ((array!60295 0))(
  ( (array!60296 (arr!29011 (Array (_ BitVec 32) (_ BitVec 64))) (size!29490 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60295)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971149 (= res!650016 (validKeyInArray!0 (select (arr!29011 _keys!1717) i!822)))))

(declare-fun b!971150 () Bool)

(declare-fun res!650013 () Bool)

(assert (=> b!971150 (=> (not res!650013) (not e!547472))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34477 0))(
  ( (V!34478 (val!11111 Int)) )
))
(declare-datatypes ((ValueCell!10579 0))(
  ( (ValueCellFull!10579 (v!13670 V!34477)) (EmptyCell!10579) )
))
(declare-datatypes ((array!60297 0))(
  ( (array!60298 (arr!29012 (Array (_ BitVec 32) ValueCell!10579)) (size!29491 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60297)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971150 (= res!650013 (and (= (size!29491 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29490 _keys!1717) (size!29491 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35191 () Bool)

(declare-fun mapRes!35191 () Bool)

(assert (=> mapIsEmpty!35191 mapRes!35191))

(declare-fun b!971151 () Bool)

(declare-fun res!650017 () Bool)

(assert (=> b!971151 (=> (not res!650017) (not e!547472))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971151 (= res!650017 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29490 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29490 _keys!1717))))))

(declare-fun res!650018 () Bool)

(assert (=> start!83230 (=> (not res!650018) (not e!547472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83230 (= res!650018 (validMask!0 mask!2147))))

(assert (=> start!83230 e!547472))

(assert (=> start!83230 true))

(declare-fun e!547470 () Bool)

(declare-fun array_inv!22453 (array!60297) Bool)

(assert (=> start!83230 (and (array_inv!22453 _values!1425) e!547470)))

(declare-fun tp_is_empty!22121 () Bool)

(assert (=> start!83230 tp_is_empty!22121))

(assert (=> start!83230 tp!66947))

(declare-fun array_inv!22454 (array!60295) Bool)

(assert (=> start!83230 (array_inv!22454 _keys!1717)))

(declare-fun b!971152 () Bool)

(assert (=> b!971152 (= e!547472 false)))

(declare-datatypes ((tuple2!14242 0))(
  ( (tuple2!14243 (_1!7132 (_ BitVec 64)) (_2!7132 V!34477)) )
))
(declare-datatypes ((List!20110 0))(
  ( (Nil!20107) (Cons!20106 (h!21268 tuple2!14242) (t!28473 List!20110)) )
))
(declare-datatypes ((ListLongMap!12939 0))(
  ( (ListLongMap!12940 (toList!6485 List!20110)) )
))
(declare-fun lt!431804 () ListLongMap!12939)

(declare-fun zeroValue!1367 () V!34477)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34477)

(declare-fun getCurrentListMap!3718 (array!60295 array!60297 (_ BitVec 32) (_ BitVec 32) V!34477 V!34477 (_ BitVec 32) Int) ListLongMap!12939)

(assert (=> b!971152 (= lt!431804 (getCurrentListMap!3718 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971153 () Bool)

(declare-fun res!650014 () Bool)

(assert (=> b!971153 (=> (not res!650014) (not e!547472))))

(declare-datatypes ((List!20111 0))(
  ( (Nil!20108) (Cons!20107 (h!21269 (_ BitVec 64)) (t!28474 List!20111)) )
))
(declare-fun arrayNoDuplicates!0 (array!60295 (_ BitVec 32) List!20111) Bool)

(assert (=> b!971153 (= res!650014 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20108))))

(declare-fun b!971154 () Bool)

(declare-fun e!547474 () Bool)

(assert (=> b!971154 (= e!547474 tp_is_empty!22121)))

(declare-fun b!971155 () Bool)

(assert (=> b!971155 (= e!547470 (and e!547474 mapRes!35191))))

(declare-fun condMapEmpty!35191 () Bool)

(declare-fun mapDefault!35191 () ValueCell!10579)

