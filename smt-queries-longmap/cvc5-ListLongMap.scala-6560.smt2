; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83244 () Bool)

(assert start!83244)

(declare-fun b_free!19237 () Bool)

(declare-fun b_next!19237 () Bool)

(assert (=> start!83244 (= b_free!19237 (not b_next!19237))))

(declare-fun tp!66989 () Bool)

(declare-fun b_and!30725 () Bool)

(assert (=> start!83244 (= tp!66989 b_and!30725)))

(declare-fun b!971359 () Bool)

(declare-fun res!650160 () Bool)

(declare-fun e!547578 () Bool)

(assert (=> b!971359 (=> (not res!650160) (not e!547578))))

(declare-datatypes ((array!60317 0))(
  ( (array!60318 (arr!29022 (Array (_ BitVec 32) (_ BitVec 64))) (size!29501 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60317)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60317 (_ BitVec 32)) Bool)

(assert (=> b!971359 (= res!650160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35212 () Bool)

(declare-fun mapRes!35212 () Bool)

(assert (=> mapIsEmpty!35212 mapRes!35212))

(declare-fun b!971360 () Bool)

(declare-fun res!650162 () Bool)

(assert (=> b!971360 (=> (not res!650162) (not e!547578))))

(declare-datatypes ((List!20116 0))(
  ( (Nil!20113) (Cons!20112 (h!21274 (_ BitVec 64)) (t!28479 List!20116)) )
))
(declare-fun arrayNoDuplicates!0 (array!60317 (_ BitVec 32) List!20116) Bool)

(assert (=> b!971360 (= res!650162 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20113))))

(declare-fun b!971361 () Bool)

(declare-fun res!650166 () Bool)

(assert (=> b!971361 (=> (not res!650166) (not e!547578))))

(declare-datatypes ((V!34497 0))(
  ( (V!34498 (val!11118 Int)) )
))
(declare-datatypes ((ValueCell!10586 0))(
  ( (ValueCellFull!10586 (v!13677 V!34497)) (EmptyCell!10586) )
))
(declare-datatypes ((array!60319 0))(
  ( (array!60320 (arr!29023 (Array (_ BitVec 32) ValueCell!10586)) (size!29502 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60319)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971361 (= res!650166 (and (= (size!29502 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29501 _keys!1717) (size!29502 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971362 () Bool)

(assert (=> b!971362 (= e!547578 false)))

(declare-datatypes ((tuple2!14248 0))(
  ( (tuple2!14249 (_1!7135 (_ BitVec 64)) (_2!7135 V!34497)) )
))
(declare-datatypes ((List!20117 0))(
  ( (Nil!20114) (Cons!20113 (h!21275 tuple2!14248) (t!28480 List!20117)) )
))
(declare-datatypes ((ListLongMap!12945 0))(
  ( (ListLongMap!12946 (toList!6488 List!20117)) )
))
(declare-fun lt!431825 () ListLongMap!12945)

(declare-fun zeroValue!1367 () V!34497)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34497)

(declare-fun getCurrentListMap!3721 (array!60317 array!60319 (_ BitVec 32) (_ BitVec 32) V!34497 V!34497 (_ BitVec 32) Int) ListLongMap!12945)

(assert (=> b!971362 (= lt!431825 (getCurrentListMap!3721 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971363 () Bool)

(declare-fun res!650161 () Bool)

(assert (=> b!971363 (=> (not res!650161) (not e!547578))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5589 (ListLongMap!12945 (_ BitVec 64)) Bool)

(assert (=> b!971363 (= res!650161 (contains!5589 (getCurrentListMap!3721 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29022 _keys!1717) i!822)))))

(declare-fun b!971364 () Bool)

(declare-fun res!650164 () Bool)

(assert (=> b!971364 (=> (not res!650164) (not e!547578))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971364 (= res!650164 (validKeyInArray!0 (select (arr!29022 _keys!1717) i!822)))))

(declare-fun b!971365 () Bool)

(declare-fun e!547577 () Bool)

(declare-fun tp_is_empty!22135 () Bool)

(assert (=> b!971365 (= e!547577 tp_is_empty!22135)))

(declare-fun b!971366 () Bool)

(declare-fun res!650165 () Bool)

(assert (=> b!971366 (=> (not res!650165) (not e!547578))))

(assert (=> b!971366 (= res!650165 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29501 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29501 _keys!1717))))))

(declare-fun res!650163 () Bool)

(assert (=> start!83244 (=> (not res!650163) (not e!547578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83244 (= res!650163 (validMask!0 mask!2147))))

(assert (=> start!83244 e!547578))

(assert (=> start!83244 true))

(declare-fun e!547576 () Bool)

(declare-fun array_inv!22459 (array!60319) Bool)

(assert (=> start!83244 (and (array_inv!22459 _values!1425) e!547576)))

(assert (=> start!83244 tp_is_empty!22135))

(assert (=> start!83244 tp!66989))

(declare-fun array_inv!22460 (array!60317) Bool)

(assert (=> start!83244 (array_inv!22460 _keys!1717)))

(declare-fun b!971367 () Bool)

(assert (=> b!971367 (= e!547576 (and e!547577 mapRes!35212))))

(declare-fun condMapEmpty!35212 () Bool)

(declare-fun mapDefault!35212 () ValueCell!10586)

