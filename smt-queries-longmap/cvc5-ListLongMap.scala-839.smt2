; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20130 () Bool)

(assert start!20130)

(declare-fun b_free!4789 () Bool)

(declare-fun b_next!4789 () Bool)

(assert (=> start!20130 (= b_free!4789 (not b_next!4789))))

(declare-fun tp!17398 () Bool)

(declare-fun b_and!11535 () Bool)

(assert (=> start!20130 (= tp!17398 b_and!11535)))

(declare-fun b!197384 () Bool)

(declare-fun res!93355 () Bool)

(declare-fun e!129899 () Bool)

(assert (=> b!197384 (=> (not res!93355) (not e!129899))))

(declare-datatypes ((array!8543 0))(
  ( (array!8544 (arr!4022 (Array (_ BitVec 32) (_ BitVec 64))) (size!4347 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8543)

(declare-datatypes ((List!2510 0))(
  ( (Nil!2507) (Cons!2506 (h!3148 (_ BitVec 64)) (t!7441 List!2510)) )
))
(declare-fun arrayNoDuplicates!0 (array!8543 (_ BitVec 32) List!2510) Bool)

(assert (=> b!197384 (= res!93355 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2507))))

(declare-fun res!93353 () Bool)

(assert (=> start!20130 (=> (not res!93353) (not e!129899))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20130 (= res!93353 (validMask!0 mask!1149))))

(assert (=> start!20130 e!129899))

(declare-datatypes ((V!5841 0))(
  ( (V!5842 (val!2367 Int)) )
))
(declare-datatypes ((ValueCell!1979 0))(
  ( (ValueCellFull!1979 (v!4337 V!5841)) (EmptyCell!1979) )
))
(declare-datatypes ((array!8545 0))(
  ( (array!8546 (arr!4023 (Array (_ BitVec 32) ValueCell!1979)) (size!4348 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8545)

(declare-fun e!129896 () Bool)

(declare-fun array_inv!2623 (array!8545) Bool)

(assert (=> start!20130 (and (array_inv!2623 _values!649) e!129896)))

(assert (=> start!20130 true))

(declare-fun tp_is_empty!4645 () Bool)

(assert (=> start!20130 tp_is_empty!4645))

(declare-fun array_inv!2624 (array!8543) Bool)

(assert (=> start!20130 (array_inv!2624 _keys!825)))

(assert (=> start!20130 tp!17398))

(declare-fun b!197385 () Bool)

(declare-fun res!93354 () Bool)

(assert (=> b!197385 (=> (not res!93354) (not e!129899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8543 (_ BitVec 32)) Bool)

(assert (=> b!197385 (= res!93354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197386 () Bool)

(declare-fun e!129898 () Bool)

(assert (=> b!197386 (= e!129898 tp_is_empty!4645)))

(declare-fun b!197387 () Bool)

(assert (=> b!197387 (= e!129899 (bvsgt #b00000000000000000000000000000000 (size!4347 _keys!825)))))

(declare-datatypes ((tuple2!3598 0))(
  ( (tuple2!3599 (_1!1810 (_ BitVec 64)) (_2!1810 V!5841)) )
))
(declare-datatypes ((List!2511 0))(
  ( (Nil!2508) (Cons!2507 (h!3149 tuple2!3598) (t!7442 List!2511)) )
))
(declare-datatypes ((ListLongMap!2511 0))(
  ( (ListLongMap!2512 (toList!1271 List!2511)) )
))
(declare-fun lt!97713 () ListLongMap!2511)

(declare-fun zeroValue!615 () V!5841)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5841)

(declare-fun getCurrentListMapNoExtraKeys!236 (array!8543 array!8545 (_ BitVec 32) (_ BitVec 32) V!5841 V!5841 (_ BitVec 32) Int) ListLongMap!2511)

(assert (=> b!197387 (= lt!97713 (getCurrentListMapNoExtraKeys!236 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197388 () Bool)

(declare-fun res!93351 () Bool)

(assert (=> b!197388 (=> (not res!93351) (not e!129899))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197388 (= res!93351 (= (select (arr!4022 _keys!825) i!601) k!843))))

(declare-fun b!197389 () Bool)

(declare-fun res!93352 () Bool)

(assert (=> b!197389 (=> (not res!93352) (not e!129899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197389 (= res!93352 (validKeyInArray!0 k!843))))

(declare-fun b!197390 () Bool)

(declare-fun res!93349 () Bool)

(assert (=> b!197390 (=> (not res!93349) (not e!129899))))

(assert (=> b!197390 (= res!93349 (and (= (size!4348 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4347 _keys!825) (size!4348 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8036 () Bool)

(declare-fun mapRes!8036 () Bool)

(declare-fun tp!17399 () Bool)

(assert (=> mapNonEmpty!8036 (= mapRes!8036 (and tp!17399 e!129898))))

(declare-fun mapKey!8036 () (_ BitVec 32))

(declare-fun mapValue!8036 () ValueCell!1979)

(declare-fun mapRest!8036 () (Array (_ BitVec 32) ValueCell!1979))

(assert (=> mapNonEmpty!8036 (= (arr!4023 _values!649) (store mapRest!8036 mapKey!8036 mapValue!8036))))

(declare-fun b!197391 () Bool)

(declare-fun e!129897 () Bool)

(assert (=> b!197391 (= e!129897 tp_is_empty!4645)))

(declare-fun b!197392 () Bool)

(declare-fun res!93350 () Bool)

(assert (=> b!197392 (=> (not res!93350) (not e!129899))))

(assert (=> b!197392 (= res!93350 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4347 _keys!825))))))

(declare-fun b!197393 () Bool)

(assert (=> b!197393 (= e!129896 (and e!129897 mapRes!8036))))

(declare-fun condMapEmpty!8036 () Bool)

(declare-fun mapDefault!8036 () ValueCell!1979)

