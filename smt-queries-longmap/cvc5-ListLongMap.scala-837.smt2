; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20118 () Bool)

(assert start!20118)

(declare-fun b_free!4777 () Bool)

(declare-fun b_next!4777 () Bool)

(assert (=> start!20118 (= b_free!4777 (not b_next!4777))))

(declare-fun tp!17362 () Bool)

(declare-fun b_and!11523 () Bool)

(assert (=> start!20118 (= tp!17362 b_and!11523)))

(declare-fun b!197204 () Bool)

(declare-fun e!129807 () Bool)

(declare-fun tp_is_empty!4633 () Bool)

(assert (=> b!197204 (= e!129807 tp_is_empty!4633)))

(declare-fun b!197205 () Bool)

(declare-fun res!93224 () Bool)

(declare-fun e!129806 () Bool)

(assert (=> b!197205 (=> (not res!93224) (not e!129806))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197205 (= res!93224 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!8018 () Bool)

(declare-fun mapRes!8018 () Bool)

(assert (=> mapIsEmpty!8018 mapRes!8018))

(declare-fun res!93229 () Bool)

(assert (=> start!20118 (=> (not res!93229) (not e!129806))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20118 (= res!93229 (validMask!0 mask!1149))))

(assert (=> start!20118 e!129806))

(declare-datatypes ((V!5825 0))(
  ( (V!5826 (val!2361 Int)) )
))
(declare-datatypes ((ValueCell!1973 0))(
  ( (ValueCellFull!1973 (v!4331 V!5825)) (EmptyCell!1973) )
))
(declare-datatypes ((array!8519 0))(
  ( (array!8520 (arr!4010 (Array (_ BitVec 32) ValueCell!1973)) (size!4335 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8519)

(declare-fun e!129809 () Bool)

(declare-fun array_inv!2617 (array!8519) Bool)

(assert (=> start!20118 (and (array_inv!2617 _values!649) e!129809)))

(assert (=> start!20118 true))

(assert (=> start!20118 tp_is_empty!4633))

(declare-datatypes ((array!8521 0))(
  ( (array!8522 (arr!4011 (Array (_ BitVec 32) (_ BitVec 64))) (size!4336 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8521)

(declare-fun array_inv!2618 (array!8521) Bool)

(assert (=> start!20118 (array_inv!2618 _keys!825)))

(assert (=> start!20118 tp!17362))

(declare-fun b!197206 () Bool)

(declare-fun e!129805 () Bool)

(assert (=> b!197206 (= e!129805 tp_is_empty!4633)))

(declare-fun mapNonEmpty!8018 () Bool)

(declare-fun tp!17363 () Bool)

(assert (=> mapNonEmpty!8018 (= mapRes!8018 (and tp!17363 e!129807))))

(declare-fun mapRest!8018 () (Array (_ BitVec 32) ValueCell!1973))

(declare-fun mapValue!8018 () ValueCell!1973)

(declare-fun mapKey!8018 () (_ BitVec 32))

(assert (=> mapNonEmpty!8018 (= (arr!4010 _values!649) (store mapRest!8018 mapKey!8018 mapValue!8018))))

(declare-fun b!197207 () Bool)

(declare-fun res!93225 () Bool)

(assert (=> b!197207 (=> (not res!93225) (not e!129806))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197207 (= res!93225 (= (select (arr!4011 _keys!825) i!601) k!843))))

(declare-fun b!197208 () Bool)

(declare-fun res!93223 () Bool)

(assert (=> b!197208 (=> (not res!93223) (not e!129806))))

(assert (=> b!197208 (= res!93223 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4336 _keys!825))))))

(declare-fun b!197209 () Bool)

(assert (=> b!197209 (= e!129806 false)))

(declare-datatypes ((tuple2!3590 0))(
  ( (tuple2!3591 (_1!1806 (_ BitVec 64)) (_2!1806 V!5825)) )
))
(declare-datatypes ((List!2502 0))(
  ( (Nil!2499) (Cons!2498 (h!3140 tuple2!3590) (t!7433 List!2502)) )
))
(declare-datatypes ((ListLongMap!2503 0))(
  ( (ListLongMap!2504 (toList!1267 List!2502)) )
))
(declare-fun lt!97695 () ListLongMap!2503)

(declare-fun zeroValue!615 () V!5825)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5825)

(declare-fun getCurrentListMapNoExtraKeys!232 (array!8521 array!8519 (_ BitVec 32) (_ BitVec 32) V!5825 V!5825 (_ BitVec 32) Int) ListLongMap!2503)

(assert (=> b!197209 (= lt!97695 (getCurrentListMapNoExtraKeys!232 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197210 () Bool)

(declare-fun res!93227 () Bool)

(assert (=> b!197210 (=> (not res!93227) (not e!129806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8521 (_ BitVec 32)) Bool)

(assert (=> b!197210 (= res!93227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197211 () Bool)

(declare-fun res!93228 () Bool)

(assert (=> b!197211 (=> (not res!93228) (not e!129806))))

(assert (=> b!197211 (= res!93228 (and (= (size!4335 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4336 _keys!825) (size!4335 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197212 () Bool)

(declare-fun res!93226 () Bool)

(assert (=> b!197212 (=> (not res!93226) (not e!129806))))

(declare-datatypes ((List!2503 0))(
  ( (Nil!2500) (Cons!2499 (h!3141 (_ BitVec 64)) (t!7434 List!2503)) )
))
(declare-fun arrayNoDuplicates!0 (array!8521 (_ BitVec 32) List!2503) Bool)

(assert (=> b!197212 (= res!93226 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2500))))

(declare-fun b!197213 () Bool)

(assert (=> b!197213 (= e!129809 (and e!129805 mapRes!8018))))

(declare-fun condMapEmpty!8018 () Bool)

(declare-fun mapDefault!8018 () ValueCell!1973)

