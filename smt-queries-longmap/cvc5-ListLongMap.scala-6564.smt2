; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83268 () Bool)

(assert start!83268)

(declare-fun b_free!19261 () Bool)

(declare-fun b_next!19261 () Bool)

(assert (=> start!83268 (= b_free!19261 (not b_next!19261))))

(declare-fun tp!67062 () Bool)

(declare-fun b_and!30749 () Bool)

(assert (=> start!83268 (= tp!67062 b_and!30749)))

(declare-fun mapNonEmpty!35248 () Bool)

(declare-fun mapRes!35248 () Bool)

(declare-fun tp!67061 () Bool)

(declare-fun e!547758 () Bool)

(assert (=> mapNonEmpty!35248 (= mapRes!35248 (and tp!67061 e!547758))))

(declare-fun mapKey!35248 () (_ BitVec 32))

(declare-datatypes ((V!34529 0))(
  ( (V!34530 (val!11130 Int)) )
))
(declare-datatypes ((ValueCell!10598 0))(
  ( (ValueCellFull!10598 (v!13689 V!34529)) (EmptyCell!10598) )
))
(declare-datatypes ((array!60365 0))(
  ( (array!60366 (arr!29046 (Array (_ BitVec 32) ValueCell!10598)) (size!29525 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60365)

(declare-fun mapValue!35248 () ValueCell!10598)

(declare-fun mapRest!35248 () (Array (_ BitVec 32) ValueCell!10598))

(assert (=> mapNonEmpty!35248 (= (arr!29046 _values!1425) (store mapRest!35248 mapKey!35248 mapValue!35248))))

(declare-fun b!971719 () Bool)

(declare-fun res!650418 () Bool)

(declare-fun e!547756 () Bool)

(assert (=> b!971719 (=> (not res!650418) (not e!547756))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34529)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34529)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60367 0))(
  ( (array!60368 (arr!29047 (Array (_ BitVec 32) (_ BitVec 64))) (size!29526 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60367)

(declare-datatypes ((tuple2!14266 0))(
  ( (tuple2!14267 (_1!7144 (_ BitVec 64)) (_2!7144 V!34529)) )
))
(declare-datatypes ((List!20132 0))(
  ( (Nil!20129) (Cons!20128 (h!21290 tuple2!14266) (t!28495 List!20132)) )
))
(declare-datatypes ((ListLongMap!12963 0))(
  ( (ListLongMap!12964 (toList!6497 List!20132)) )
))
(declare-fun contains!5597 (ListLongMap!12963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3730 (array!60367 array!60365 (_ BitVec 32) (_ BitVec 32) V!34529 V!34529 (_ BitVec 32) Int) ListLongMap!12963)

(assert (=> b!971719 (= res!650418 (contains!5597 (getCurrentListMap!3730 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29047 _keys!1717) i!822)))))

(declare-fun b!971720 () Bool)

(declare-fun tp_is_empty!22159 () Bool)

(assert (=> b!971720 (= e!547758 tp_is_empty!22159)))

(declare-fun b!971721 () Bool)

(declare-fun res!650415 () Bool)

(assert (=> b!971721 (=> (not res!650415) (not e!547756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60367 (_ BitVec 32)) Bool)

(assert (=> b!971721 (= res!650415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971722 () Bool)

(declare-fun res!650417 () Bool)

(assert (=> b!971722 (=> (not res!650417) (not e!547756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971722 (= res!650417 (validKeyInArray!0 (select (arr!29047 _keys!1717) i!822)))))

(declare-fun b!971723 () Bool)

(declare-fun res!650413 () Bool)

(assert (=> b!971723 (=> (not res!650413) (not e!547756))))

(declare-datatypes ((List!20133 0))(
  ( (Nil!20130) (Cons!20129 (h!21291 (_ BitVec 64)) (t!28496 List!20133)) )
))
(declare-fun arrayNoDuplicates!0 (array!60367 (_ BitVec 32) List!20133) Bool)

(assert (=> b!971723 (= res!650413 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20130))))

(declare-fun b!971724 () Bool)

(declare-fun e!547755 () Bool)

(assert (=> b!971724 (= e!547755 tp_is_empty!22159)))

(declare-fun b!971725 () Bool)

(declare-fun res!650414 () Bool)

(assert (=> b!971725 (=> (not res!650414) (not e!547756))))

(assert (=> b!971725 (= res!650414 (and (= (size!29525 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29526 _keys!1717) (size!29525 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971726 () Bool)

(declare-fun e!547759 () Bool)

(assert (=> b!971726 (= e!547759 (and e!547755 mapRes!35248))))

(declare-fun condMapEmpty!35248 () Bool)

(declare-fun mapDefault!35248 () ValueCell!10598)

